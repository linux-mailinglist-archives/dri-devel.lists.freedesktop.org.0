Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A77F17F7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D5310E06F;
	Mon, 20 Nov 2023 15:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A1710E06F;
 Mon, 20 Nov 2023 15:57:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40836ea8cbaso15426635e9.0; 
 Mon, 20 Nov 2023 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700495858; x=1701100658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=89EYg4ouBWYX+fl0hKWC4znxsM2071TE3litLlRaSBY=;
 b=XYPv8ZM2RudzdKFK8Cb0+2pExNkfisMlu3ifHFwa+e6ZUJiNBg1QUbrsDgRjC7MxI8
 ucdAf6yj06wuppvB0GJavpTPYxsgEqY/daEVldA+3PW2jVS5SHXBfU7DkFiphUm14JX1
 vCsVjQ3cvHFxrFSZN54bRGXVWd1ny3csMf3HIYLLXJj7hNqdi4TsmBEX1cf0LEKO2g73
 9UcEusW9D4SQRpSLpNUyNndlkFBloVOV59WWho+SPGowpxNVkLUU0VmDQJ6C+aY1OK6M
 3BnS+Ma4Z8SNdTj5mkwKgcKRfpzy4RWhHrQDp1o3xLzSfCwW/MdxUlEkf2nT3oRmYSJV
 QeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700495858; x=1701100658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89EYg4ouBWYX+fl0hKWC4znxsM2071TE3litLlRaSBY=;
 b=Izl2I0119gPC57eBh/MlOGbwC+sKQcNpU/UZKmlbMPU6ddXHHRnDkPSYSl1FGOF/1E
 76qWTaXNtem5z1hpOs+BZnWvzxMJ3MesQbzmE4s/F+PYmKteSjLJOyfiNWYBm0o3YC00
 fL4yOa+4/rX01NIQ7/v6k/XtJPbS1bBZWvtIxCQtQWbGOlMNnjN7R+VWlDxKdUrhDVjs
 TeDMDw85N9NQrB5KgxfwyLwckp8IcPgoqD6XwAaf+53rfBnklioY9HoXA1e9apqTa+TN
 sNOc4GofbPNzyp+IhsNwd1PKBCwjrRwy4M5VnNG0+YjAVB764xmMUkUsEaa3Qa87hTVX
 BsYw==
X-Gm-Message-State: AOJu0Yyls7a6UfWRRMMjXRsTnOWzd9x0JklStoBqKywxmor1k3XZVQ3x
 4dXZyBgZHEheANu3vbRvHzk=
X-Google-Smtp-Source: AGHT+IFhUMUVyBcUDGRSZaC3iPujMi7KSk5AL1rJDDgsBFZb0+BSUafYsTQ9/YcD2194+2G2rh41ZQ==
X-Received: by 2002:a05:600c:4f8f:b0:40a:4609:9c97 with SMTP id
 n15-20020a05600c4f8f00b0040a46099c97mr6312604wmq.20.1700495858005; 
 Mon, 20 Nov 2023 07:57:38 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600c364f00b004060f0a0fd5sm13509216wmq.13.2023.11.20.07.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 07:57:37 -0800 (PST)
Message-ID: <bdb238b6-60c7-4f26-81d0-9e62cd5dd326@gmail.com>
Date: Mon, 20 Nov 2023 16:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <87edgv4x3i.fsf@vps.thesusis.net>
 <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
 <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAPM=9tw-8pQWFso0zuLqpsqd5BSHWtc4As9ttdjY-DDr70EMqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 Phillip Susi <phill@thesusis.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.11.23 um 07:47 schrieb Dave Airlie:
>> On 12.11.23 01:46, Phillip Susi wrote:
>>> I had been testing some things on a post 6.6-rc5 kernel for a week or
>>> two and then when I pulled to a post 6.6 release kernel, I found that
>>> system suspend was broken.  It seems that the radeon driver failed to
>>> suspend, leaving the display dead, the wayland display server hung, and
>>> the system still running.  I have been trying to bisect it for the last
>>> few days and have only been able to narrow it down to the following 3
>>> commits:
>>>
>>> There are only 'skip'ped commits left to test.
>>> The first bad commit could be any of:
>>> 56e449603f0ac580700621a356d35d5716a62ce5
>>> c07bf1636f0005f9eb7956404490672286ea59d3
>>> b70438004a14f4d0f9890b3297cd66248728546c
>>> We cannot bisect more!
>> Hmm, not a single reply from the amdgpu folks. Wondering how we can
>> encourage them to look into this.
>>
>> Phillip, reporting issues by mail should still work, but you might have
>> more luck here, as that's where the amdgpu afaics prefer to track bugs:
>> https://gitlab.freedesktop.org/drm/amd/-/issues
>>
>> When you file an issue there, please mention it here.
>>
>> Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
>> comes out later today) or 6.6.2-rc1 improve things.
> It would also be good to test if reverting any of these is possible or not.

Well none of the commits mentioned can affect radeon in any way. Radeon 
simply doesn't use the scheduler.

My suspicion is that the user is actually using amdgpu instead of 
radeon. The switch potentially occurred accidentally, for example by 
compiling amdgpu support for SI/CIK.

Those amdgpu problems for older ASIC have already been worked on and 
should be fixed by now.

Regards,
Christian.

>
> File the gitlab issue and we should poke amd a but more to take a look.
>
> Dave.

