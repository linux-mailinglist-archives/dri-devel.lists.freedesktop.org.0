Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4842C49D8F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 01:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A333B10E039;
	Tue, 11 Nov 2025 00:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIgXPaoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9104C10E338
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 00:17:34 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-9486b567baaso304904639f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762820253; x=1763425053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Q8HKQ4KcnH36XoiAPXuxGl+urZnJV8rIP1Qwq36EqA=;
 b=UIgXPaoohds1MS0w1urUh+ff+XYDAaDnBgr3fNro0n26jqttbCPetvCYctcre+o5Ls
 tlB9vCc6PfpHIgH+6yIHqdTG0c+kHVLelSf0Zzlvp6kOgRMAIrK89R1N+rzYuC6kzr1V
 m9itxiWSl1c64a12Zn3FbudvGCNhX7oO2y537bGmsniow9/Wd6okUfRkmVblI6DHVsb/
 a5MMTomHh8PWKQ5XRpcgvP413ZlMDriFNOdEmkaYQHJ9twHKtehkcWrg6KdKIc4C6qa7
 Pzx8xhZJkc0iMqIZ9M2sg+AB8GNYKIUE1dSJ0PzwyaHWJA+nAMzBWU6poxJ/8uMGf5Xu
 OU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762820253; x=1763425053;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Q8HKQ4KcnH36XoiAPXuxGl+urZnJV8rIP1Qwq36EqA=;
 b=XROnl+1I2s+qqMkVb9h3H/5FD6H6Y/HMiY8sJHXfuDejDE9ErBLqEgVkhg5uhq8LAi
 F/srXzIV7eLj0ll7hKHmYkgBzvAge+r4TNZiBpiD5XGLYfbF2WTWhjn5YdK9mMAdw9jM
 W2OZdgGjwiH5BPF7EArhzW6nV4ikK/Aqah/qy5Sq407P98XJfhjJ/4vd6MP8SeDgalE6
 RV5E4Tjh9zTPdJ2Si3rnrlfMHB4lDOnFFztGiCgfiEJhJOS6yaTFZRwdnh83aW4R111+
 8HbDW3ykgZI+5F+DRteB+cKQ+Xxdgf5MBVRQpcEscJlmFzRNE6jiawEL7H8ID3mxl0GU
 +4iA==
X-Gm-Message-State: AOJu0YyUqT5UwfSobbQiJNXicpzHBPDVzuTayV2a1CYOFMtbbKE+hkRe
 vq7AbjEIe4u2HP/9UNK1SQLbIhFROdwJHftF4f+uXxkuOJguj6nDUjXT
X-Gm-Gg: ASbGnctxyw0JQ9swdpK9XnCYR8UGaNAfajB+02z4STx5lHKOfQG/cvtCnreIuePe7xB
 cpsPjA/bi1yxbJ/WIl8Qr92SdZvvfmD/F7E3b1wvIgNoC8jCumtGJMBX78afddSK2A/dhV80GR4
 HHe848yN+ELYVT7yznXkEU3dCRd8zSkzsmOFxjvhUxMaQvRlf7sVWlDGFm0PZV1Fkc98Irr9pad
 qtmxd290bryphtljRNl7rEY03sORFLveB+ngR0ifQ5yh2cfxwWraBTxEgpKlUEkS6JZ2Ced1gFq
 6/GoGHzbwuBZ2vkFXSQKAPahcVNF3TUorVOu2oRutBmgSa6+52wfzPJtBE31gI6t6/284f6lfs+
 I0QYJhNccyBYMYG6FKuHpKFYjBY4t1q/+cgLrtsorJ+pUqeJpjXLznPtUY4ysaqwpo6afwJOeVL
 WTXVgvWgLVU1zrxNNU8omp8sk77QOSZ5/1kqoBjbdwHhHsru2mQqY=
X-Google-Smtp-Source: AGHT+IEAm+mJm6K/xigqu97Kf9Pb7DwxatHpmYK1k/IstJxUHVyghC6X6TBmTN8zYaB+T4/gOtOTNw==
X-Received: by 2002:a05:6602:6412:b0:948:5f42:32a1 with SMTP id
 ca18e2360f4ac-94895f8ea61mr1547811039f.5.1762820253527; 
 Mon, 10 Nov 2025 16:17:33 -0800 (PST)
Received: from [100.64.0.17] (c-68-55-107-1.hsd1.mi.comcast.net. [68.55.107.1])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b746923f26sm5588519173.38.2025.11.10.16.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 16:17:33 -0800 (PST)
Message-ID: <13627c6c-f428-4520-b0d4-32fca1e7a2a0@gmail.com>
Date: Mon, 10 Nov 2025 19:17:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, boyuan.zhang@amd.com
References: <20250325210517.2097188-1-bradynorander@gmail.com>
 <CADnq5_MNBUY=jWbnq-gZQ_4_M_sBJGAgMD0bj2cMdnkoU9G=HA@mail.gmail.com>
 <9ab05b38-6f77-4b0b-8a1b-8314e2873047@gmail.com>
 <CADnq5_No+w+tco9j35GBM3+CYBTo018eLwWec278d3VBJHPQxw@mail.gmail.com>
Content-Language: en-US
From: Brady Norander <bradynorander@gmail.com>
In-Reply-To: <CADnq5_No+w+tco9j35GBM3+CYBTo018eLwWec278d3VBJHPQxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/25 14:14, Alex Deucher wrote:
> On Tue, Mar 25, 2025 at 7:11 PM Brady Norander <bradynorander@gmail.com> wrote:
>>
>> On 3/25/25 6:12 PM, Alex Deucher wrote:
>>>
>>> While you are at it, can you take a look at
>>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c and
>>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c as well?
>>>
>>> Alex
>>
>> I think it makes more sense to handle that in a separate patch as it is
>> an unrelated ip block.
> 
> Sure. Can you send a patch to fix those up as well if needed?
> 
> Alex

I don't know if that driver needs this, and I also don't have that 
hardware to test it. If that driver needs this fix, then this can be 
revisited but I don't think it should block this patch being merged now.
