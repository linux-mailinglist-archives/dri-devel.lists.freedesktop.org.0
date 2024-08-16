Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD327953E4D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 02:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7FB10E549;
	Fri, 16 Aug 2024 00:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="BuxttVlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E658510E549
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 00:30:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7163489149eso1149364a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 17:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723768219; x=1724373019;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rz5OUzDKeK1e6myajUk4xLeU7veZVkhnEruzLGaiaK4=;
 b=BuxttVlCfK1WEHgqSqTH/ie27mRavYoA77e7Pgtd6ooR22cL925DRUgvHG5/g5q3Pk
 T8M8SVJb6uWMwHOr7y/1Qsz/r6aCLwr6870rKo0dXXbejW9Y41rw7z4dl0j2xMTkQR/W
 9lhfAsP5SmHtXm+sQREZ2LAvuKQIAOKFA8kAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723768219; x=1724373019;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rz5OUzDKeK1e6myajUk4xLeU7veZVkhnEruzLGaiaK4=;
 b=WJ8fjGBIm4T+y/o+5Z88vIIvAsazQAR35+YaCbhapxYecdPiECrfj1RD4iFQy10zaN
 DXB5rTc4DN1Oc4fxqlI6wpwGtFHRr88nU7u4ANSvsIwW64zyjnVub+rL3DcLIXBAhj4P
 JoVQYcpcylNBp9cs9kAoyLn/MhNPf7EVxvPB+0Gy5sbTCFzsZjjxVDZpxxnMiq0jdiBm
 Mp5kQr1lbzmJEktX3pAU87dIIyVz9b17D9BDZuyjvg/1RnGwFvYIQ0wjr7GAf29jdnw3
 HLB1T4GKaasJ3TI0aI3so6FavoapbvGkiGFKukrllp3yAUjKscMUx5I1C//ZwAG4o6rT
 MsDw==
X-Gm-Message-State: AOJu0YxKAP0HAOoNAI6SR2bS5ftMxrATJnR6ue4/PWd2TXPZ+JksqbNW
 Om8P7UTsTFCg7hTZdTIzVHNjj++F0dklgJo/sQSXJZVWz4Yrf49oXJOV/ETIAg==
X-Google-Smtp-Source: AGHT+IE7VkXP2eZtLm+asWDhcvPkwbDtTjXACzET0Rbzbtp5WO1i+V0XkbTv73MCz2+4kee0GWSrdQ==
X-Received: by 2002:a17:903:2310:b0:1fb:715d:df83 with SMTP id
 d9443c01a7336-20203e4f29bmr19762815ad.13.1723768219224; 
 Thu, 15 Aug 2024 17:30:19 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f03755fbsm15543335ad.164.2024.08.15.17.30.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 17:30:18 -0700 (PDT)
Message-ID: <4e7a21ed-b8db-43a5-a8ca-a7960c24faa9@broadcom.com>
Date: Thu, 15 Aug 2024 17:30:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/vmwgfx: Add support for userspace managed
 surfaces.
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com
References: <20240812191639.649841-1-maaz.mombasawala@broadcom.com>
 <CABQX2QPKKr6H5_sMYUkx4meTJQ_FOsTebYM0cukW4JR8d3FF4w@mail.gmail.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <CABQX2QPKKr6H5_sMYUkx4meTJQ_FOsTebYM0cukW4JR8d3FF4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 8/13/24 19:33, Zack Rusin wrote:
> On Mon, Aug 12, 2024 at 3:16 PM Maaz Mombasawala
> <maaz.mombasawala@broadcom.com> wrote:
>>
>> This series introduces basic support for userspace managed surfaces. The
>> lifetime and id's of these surfaces is managed by userspace submitted
>> commands instead of relying on the kernel to manage them.
>>
>> Maaz Mombasawala (3):
>>   drm/vmwgfx: Introduce userspace managed surfaces
>>   drm/vmwgfx: Support hw_destroy for userspace managed surfaces
>>   drm/vmwgfx: Add support for older define commands for userspace
>>     surfaces
>>
>>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  24 +-
>>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 331 ++++++++++++++++++++++--
>>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 196 +++++++++++++-
>>  3 files changed, 518 insertions(+), 33 deletions(-)
>>
> 
> In general that looks great. Do you happen to have the userspace patch
> somewhere where we could see it? In particular there are three things
> I'm wondering about:

There is a patch for mesa, I'll work on getting that upstreamed too.

> 1) In the first patch you mark the gb surface as may_evict = false;
> correctly, because if user space is the thing that attaches mob's then
> kernel can not switch them underneath but then I'd like to see how are
> the memory pressure situations handled on the user-side,

I haven't tested this under memory pressure conditions. That should be a
userspace issue though.

> 2) Since now we allow surface destroy commands from userspace could
> one trigger some kernel oops when running old surface defines with
> mob_create flag set and issuing the gb surface destroy or will the
> res->id be reset properly?

For userspace managed surfaces, the driver only accepts ids in the range
1 to 32768 (VMWGFX_NUM_GB_SURFACE) and for an old kernel managed surfaces
it only returns ids in range starting at 53040 (VMWGFX_NUM_MOB).
So if userspace defines a surface with the old ioctls and then tries to
issue the gb_surface_destroy on that surface with that id then the command
buffer submission will fail because it won't pass the res checks.

> 3) how is userspace able to select whether it should self-manage the
> mob's or let the kernel do it? i.e. what flag signifies that the
> userspace is running on a kernel that is capable of handling this?

There is no such flag right now, I will add this.

> 
> z


-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
