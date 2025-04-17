Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FACA91E47
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEB510EB10;
	Thu, 17 Apr 2025 13:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="cDlCPd/i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A3310EB0F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:41:32 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so146256866b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1744897291; x=1745502091; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8b5UBlhI7tagceuxs0zjhouMKp8JoC3Qnn8Fd0hnCOc=;
 b=cDlCPd/iOPKxd9tQiCfLUGeH/T41tc3nYJ/6FvcrmgBXVvLRzMCbA4REvFGXNLUmMi
 YNcfcokbh+7PBmTbZOQjuCaFO6U9zDc9WK+/AwEq0HPbEknnfpPlT5iyII2qXEaAjNcl
 GbF7lzG1miIsTC/dlmLW6XmAono00QMcXWGpA9fibPOmTG5czz9SX6FawKCZHq/PxKR3
 7XaeViHNPj6YCyK1xHUPl76SztMd2m7D6GTyRkblR3uAH97JOt9G5NRrWBpqT+YCqQbA
 TK7jueSsnCJkn0bU34S2+yAZhUlxGekLe4D27klyfXuFOVV98qIGqb8vRjjKssRU8Wwt
 y2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744897291; x=1745502091;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8b5UBlhI7tagceuxs0zjhouMKp8JoC3Qnn8Fd0hnCOc=;
 b=NhmEPWxhSoGZdGaXq7yy2kHtqTWti/HwR497qMus2IRFjh/TU9KNCJ3XfJgTt8vB6b
 vSHq2QvnOrIKWEuOgp4rxJ/apwYI3+ejZ010U0mnYTEFyyxZGi4SoGuSXcWN0zABpgia
 OjdCFcNlZVPKiuxt9XhmBCcTa7VV8ea5U1MCdeVPHLBn2R5RkL/f8bTxe05mLJLFyiYm
 mMFvabkFaWopQU/xt/IYyeEJ5a6vqsCUPkedL8NFNvQuQ3D4RSBXzZZkLmNicaLAqVde
 2VzrDvL50GDS/dF8irl1XKsNIwigDlagN2jCUxyvKX3QegMj8+EFeln/96GVSHH9U5qQ
 EkcQ==
X-Gm-Message-State: AOJu0Yym5xQwRftO7LutiZTj7M6daS59s9IRpNbgWXoCmTcjE2BMkD99
 9s0ybWpufOaDELg3J/G0r36hAdfF8yDq/pz+flQsh4E84ziyCFMKtUDPUCtW/0o=
X-Gm-Gg: ASbGncs+D+kElZ3rjgIL7jl4jQI2ZPt6Tt+++lzETu/HCAqph+hErXZIZHKxUy6/CSy
 BEiFGK7hazRHR5KZptU3EN7ZexvGLEve6cVBtcpjzdu8cFefE9Oxgnz4Z4GUKdwPVcW2aZZMJ+n
 Rz7lggrGyNPv4I9fl7Ql59Q/8a8yjtqJBuiJK1lIXrQXjjnufJJh649cQ3P5XKtAAc4t7YNz0SX
 1ubq1bbgunV7O8W80v7DpJ+4Fx5ZO9pNRr0Im6Gu7lP/+Mjgj19Rgn6Wtf0iOxdKVVMTszFIBER
 MHF+if0vIoqV+cq8HudJSxXfER2Vx1ZZhPImrQCoVG4v2HoQ7BN47b1bmlw2lHdgLQFrJsAtycy
 EsJOH4GYlTw==
X-Google-Smtp-Source: AGHT+IEJ4vU8prXmzLSN5mk9ksAdjmPcFn2w8rEFHTB4zYx6IwyrLaLSsVIaikyfHr12C+NZTNoQWQ==
X-Received: by 2002:a17:907:9624:b0:ac7:391b:e688 with SMTP id
 a640c23a62f3a-acb42cc678dmr478100566b.58.1744897290726; 
 Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb608b1378sm97199166b.78.2025.04.17.06.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Apr 2025 15:41:29 +0200
Message-Id: <D98YGSPT9OB6.26E97T9QSD4NW@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robdclark@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, "Rob Clark" <robdclark@chromium.org>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Marijn Suijten" <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "open list" <linux-kernel@vger.kernel.org>, <luca@lucaweiss.eu>
Subject: Re: [PATCH v2 08/34] drm/msm: Remove vram carveout support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-9-robdclark@gmail.com>
 <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
In-Reply-To: <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
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

On Thu Apr 17, 2025 at 1:20 AM CEST, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 07:52:20AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>=20
>> It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
>> mention frequently broken and rarely tested.  And I think only needed
>> for a 10yr old not quite upstream SoC (msm8974).
>
> Well... MSM8974 is quite upstream, but anyway, let's drop it. Maybe
> somebody will write an IOMMU driver.

msm8226 is also using this!

Sad to see this happening, but I get the reasoning. Unfortunately nobody
who really knows GPU and IOMMU bits has looked at this in recent years,
for msm8974 we (mostly Matti Lehtim=C3=A4ki and me) have a semi-working
branch but hitting random issues with it.

Would've been nice if somebody made functional IOMMU support back in
like 2015-2016 when more people looked at this platform.

Regards
Luca

>
>>=20
>> Maybe we can add support back in later, but I'm doubtful.
>>=20
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
>>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
>>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
>>  drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
>>  drivers/gpu/drm/msm/msm_drv.h              |  11 --
>>  drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
>>  drivers/gpu/drm/msm/msm_gem.h              |   5 -
>>  drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
>>  10 files changed, 19 insertions(+), 287 deletions(-)

