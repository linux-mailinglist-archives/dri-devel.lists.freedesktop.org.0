Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC78A70D7B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9447E10E2EA;
	Tue, 25 Mar 2025 23:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CYoQlrbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38FD10E2EA;
 Tue, 25 Mar 2025 23:11:07 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-476b89782c3so69282091cf.1; 
 Tue, 25 Mar 2025 16:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742944267; x=1743549067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yv0k/Fr18Nia/oix5F2g4TGuH0nYdcUdhj7DYGGgxH0=;
 b=CYoQlrbKM3hSY9fX516jnXlmxjarl527EH0UIlMy29GtyAtigI677amy8ULRPMOcWE
 97NoKd0gE1P8dl369TGh1D0654GKSthcxKcC56wXCNdnowfd6wDrxUpiYKbfMwqK0KQd
 I0w5Z+y/3EAg9tL5BskgkLHZcO4Q/41nOVkUUe+IY8ShvDHcz7pbMpZjojrkUfNL54pY
 s91OVRRd6vQp6w25kPClGFI2cZEXhEIHLB6GfTVVSeJpeDBiiyqpubnvWI/fWoMi9ruz
 sQvreWQRx9yufkPF1B1qiSUXAWLRImydRSmfozJrPt0o1HHkOCZiXrepp5kIlcyKfTMp
 4+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742944267; x=1743549067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv0k/Fr18Nia/oix5F2g4TGuH0nYdcUdhj7DYGGgxH0=;
 b=LNDn02ePr5oczNpu7tqEK5Tumj1jYtBTHm6KJE9dnhTVKIy7Y1jbxpHfvG7/5eU86d
 aCPTgTT0n3pBgdFte/orZJTCO0rVJFOERHruJCc08WE+47BJe0+/QHsXtS6VqhYDX0Nd
 +VHsxZ97M1IomUdY/E4Q63umZmzyHsiqDN9eUKH6GLPJMZN7n2ByyQ3XSF7dKFFV10Vh
 /wcEnui9xmkw05o/pX3PIglWrxUQ/Wkjnmq6aXyREbrlQsaTMZRxNAO6qoCp0WZ401xa
 8/AjBLZtWTgUb5ksMj/d8C5oF0ur/jMwPkFDdHWdQtOyG6F9ApCJvg+gEIOsA0+7gc4G
 SB7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgGQmd7CytZv/IVxRSB/0KsgqPPp77XDNtO/RC932QLNsG2mSLeSwzJ551NRZHcmtr2Yx1lEZh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDWmghUdALBNx2exvJsdv8xAP0XU4KXSVeGAFQHbgDFeRx7LTy
 +J2hURQYTZmZgvAjSTBUXKbewODItKJe1F48G/rLDQln0J78RD+RKik9y8pYfHg=
X-Gm-Gg: ASbGncvQd00xupjqfbnNBCKdy7Ngb8CnPUJwdJSvUs+NcT1HC50pVcgJfU3syk78bAx
 mDg3U0bcPEI/SLPw57gw+a04lhQzxaVHadRVeyRFGSMOpCgewNBH9k7lJGfNweX7SV+r4+2gQcj
 RUSiEuO/gSXE7A29CBSbguskhhwcjTb/tIDnzz+qPtYOKcGg43HldRutGamJjvF2x9iuVMWAcd7
 JS48vv+2S0myjrAk7KYtZIJg6jzufAyiWhAer1NxxNH4En5pn/gpxE02Vy/dAwtTK3pjTSN6gSN
 ktQnyE5vngeVIK8Xm0Ncndj0Z7BX11GV83EwAlP26LzdmuQosGMriGGbKJZhBD6Hh15uQHEIMNn
 tBuYHs5U=
X-Google-Smtp-Source: AGHT+IGA1CQFyXf66Rv0kFbgimISyo1ehln5yP3lhLZfPtIRMhjU5sUpgBnPf47YACkVrM56gugfwg==
X-Received: by 2002:a05:622a:4d0f:b0:476:add4:d2b8 with SMTP id
 d75a77b69052e-4771de4953fmr270018191cf.32.1742944266602; 
 Tue, 25 Mar 2025 16:11:06 -0700 (PDT)
Received: from [10.69.1.11] (c-68-55-107-1.hsd1.mi.comcast.net. [68.55.107.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d15a2d9sm64447471cf.2.2025.03.25.16.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 16:11:06 -0700 (PDT)
Message-ID: <9ab05b38-6f77-4b0b-8a1b-8314e2873047@gmail.com>
Date: Tue, 25 Mar 2025 19:11:05 -0400
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
Content-Language: en-US
From: Brady Norander <bradynorander@gmail.com>
In-Reply-To: <CADnq5_MNBUY=jWbnq-gZQ_4_M_sBJGAgMD0bj2cMdnkoU9G=HA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/25/25 6:12 PM, Alex Deucher wrote:
> 
> While you are at it, can you take a look at
> drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c and
> drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c as well?
> 
> Alex

I think it makes more sense to handle that in a separate patch as it is 
an unrelated ip block.

