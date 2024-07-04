Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861FA9276B0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064CD10EAE0;
	Thu,  4 Jul 2024 13:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fR2U4Is7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D2D10EAD7;
 Thu,  4 Jul 2024 13:02:39 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so7228231fa.3; 
 Thu, 04 Jul 2024 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720098157; x=1720702957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PYzELPqhwd90nc3XRq3C8yvVVSaVJeIDbfmf6pI/VMY=;
 b=fR2U4Is7iOojbiA4xWhi9umtOxoxzhQtjBN0I05/ZO6WYWBT5wqCYH4ob8FsiaRbt8
 qZuXHZHeAsM3qUQ8kJmG5al0Tdm0n3lXK3bPfWTqctCgqvPn+GRiyEuChNNlMeLqvlrZ
 ARpgyh6oE3PhvItovwMgR6Q8I1a5oWWBxsU1eZN7wE2H8hWzGGHYJy9pTQ3aw2wc77OK
 CqISmPiuGsKp3k1zZs3Mr27xPGyjVu9BGBP153GI/bbGUm7ADFeGj478zrxYj3hUECdj
 3RwVYs77WQ8dkRCZK2B1vN3cFVkTv5m8MU5aVJDa6p6qB0e0/FpDwG/w6QmXjLCCCrUi
 up5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720098157; x=1720702957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PYzELPqhwd90nc3XRq3C8yvVVSaVJeIDbfmf6pI/VMY=;
 b=lWgY5MzGcDQa0oKE5cAxRsp1pylzVDYks97IRwrzHHwtUYXvUPnNKnV8OTOPkAX7rX
 MSn92i5zaP+CMG4z3bu83CI0j7g3RCIciVzM1UmAtJoL6wV+Os9WZIQ9CgEAHaEWi5S/
 ER806CJAH2kNpV7ovkyPfpJXUZ6fIF7ZLIeKdX4W3FAB1aeobMHv0J9LiCnMD+owc5TM
 ndICopIirKMzUyd8WJ453ZuSKJRuQw+ucA0hDRLEoxq6GS5xg4pXroebPPfEXhPUdyUp
 7OT+aibDhCUtUkoCfmsbGT2bNWyylJIkjpBdJ/7nlAX2VYEbGPMIOjKdW33b8GXNyV47
 0hEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHbgb/+y/ZPzc9xC6vEkTSCgaWAj8F7919g4BEgb22WS9m9iiLBJDC+5DZDQoTatF7mWJRLQk93qirlLwKIgKdMf5Qoh58s6NNGVzZmfM+aGCZz/teZIhdGovvIeIHKvUVjRT4PPgiKGHIqsZXpg==
X-Gm-Message-State: AOJu0YwHG4R63DX/4xDAXq+a3SCx1pTOdnxXoWtmOXLMBc9SvTZnpHPW
 6OW4XW+ki2ycuJeQow5t2TZkhD+LW3Xjck1QOXF/csJSug+Gy2jh
X-Google-Smtp-Source: AGHT+IHB46KLyRy+mPjFpVofOsGJPEp7Rjn1ERtbNbQDfpsh5s651UESQ96G1+TDXCIuqikePoFkaA==
X-Received: by 2002:a2e:960a:0:b0:2ec:5467:dcb6 with SMTP id
 38308e7fff4ca-2ee8ee0ad5fmr10167491fa.52.1720098156565; 
 Thu, 04 Jul 2024 06:02:36 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1dd97bsm23029815e9.15.2024.07.04.06.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 06:02:36 -0700 (PDT)
Message-ID: <574f6d9f-4978-4ec0-9aa1-76817dd70686@gmail.com>
Date: Thu, 4 Jul 2024 15:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/radeon: remove load callback & drm_dev_alloc
To: Hoi Pok Wu <wuhoipok@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240630165949.117634-1-wuhoipok@gmail.com>
 <748e1bd6-6c40-443d-acbc-3d379229d068@suse.de>
 <CANyH0kDFSn6voXWnF-91fYufRT=Y3eRBLG66JBXz2_=rxJHXfg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CANyH0kDFSn6voXWnF-91fYufRT=Y3eRBLG66JBXz2_=rxJHXfg@mail.gmail.com>
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

Am 04.07.24 um 06:58 schrieb Hoi Pok Wu:
> Thanks a lot for your help Thomas.
>
> On Wed, Jul 3, 2024 at 4:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 30.06.24 um 18:59 schrieb Wu Hoi Pok:
>>> .load and drm_dev_alloc are deprecated. These patch series aims to
>>> remove them.
>>>
>>> v3: Both v1 and v2 sucks. v3 improves greatly on readability.
>> Very nice, thank you. I tested the patches with Radeon hardware and did
>> not find issues. AFAICT this can be merged as-is. I think it should go
>> into the amd trees. Maybe Alex or Christian can pick it up.
>>
>> Thanks for sticking with it.

Nice work guys. Skimming over it it looks ok to me, but maybe Alex has 
some more notes.

Regards,
Christian.

>>
>> Best regards
>> Thomas
>>
>>> Wu Hoi Pok (6):
>>>     drm/radeon: change variable name "dev" to "ddev" for consistency
>>>     drm/radeon: remove load callback from kms_driver
>>>     drm/radeon: use variable flags as parameter
>>>     drm/radeon: add helper rdev_to_drm(rdev)
>>>     drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
>>>     drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc
>>>
>>>    drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
>>>    drivers/gpu/drm/radeon/cik.c               | 14 ++--
>>>    drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
>>>    drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
>>>    drivers/gpu/drm/radeon/ni.c                |  2 +-
>>>    drivers/gpu/drm/radeon/r100.c              | 24 +++----
>>>    drivers/gpu/drm/radeon/r300.c              |  6 +-
>>>    drivers/gpu/drm/radeon/r420.c              |  6 +-
>>>    drivers/gpu/drm/radeon/r520.c              |  2 +-
>>>    drivers/gpu/drm/radeon/r600.c              | 12 ++--
>>>    drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
>>>    drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
>>>    drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
>>>    drivers/gpu/drm/radeon/radeon.h            |  7 +-
>>>    drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
>>>    drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
>>>    drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
>>>    drivers/gpu/drm/radeon/radeon_device.c     | 13 ++--
>>>    drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++-----------
>>>    drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
>>>    drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
>>>    drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
>>>    drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
>>>    drivers/gpu/drm/radeon/radeon_kms.c        |  8 +--
>>>    drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
>>>    drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
>>>    drivers/gpu/drm/radeon/rs400.c             |  6 +-
>>>    drivers/gpu/drm/radeon/rs600.c             | 14 ++--
>>>    drivers/gpu/drm/radeon/rs690.c             |  2 +-
>>>    drivers/gpu/drm/radeon/rv515.c             |  4 +-
>>>    drivers/gpu/drm/radeon/rv770.c             |  2 +-
>>>    drivers/gpu/drm/radeon/si.c                |  4 +-
>>>    39 files changed, 184 insertions(+), 179 deletions(-)
>>>
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

