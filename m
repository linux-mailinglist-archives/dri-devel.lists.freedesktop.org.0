Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA9A926E9D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 06:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8229610E8F3;
	Thu,  4 Jul 2024 04:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kMEgcUAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592FC10E8F3;
 Thu,  4 Jul 2024 04:58:18 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso2355521fa.0; 
 Wed, 03 Jul 2024 21:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720069096; x=1720673896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7zncIRfeuDlItOIy7D0MDTD3orFgOC3UeicdZPk4r4=;
 b=kMEgcUABKYVXobgOpCg3Xg2vgKuqGrNh79/AeZ1AzJ7te0XJLlIyBtDanPi1mIaoHV
 lppfPp4vHkk/qB71pOJc5kDTqEOaHkB4m8djBj69j52hQAShoVO6rQqNso2QS/9R+GSP
 qv07Oj+0qSPrk/tANeEkw54YIlraSu+zAd44Q6SDckGIbIXJm/NSWRGp/3Dun9hMhEFI
 7nyO1BYMlcsftRUOAnkR+Nsz+xudJ/gCbL67Bi3Sn1FDSzDOrtSNI0zFGvmItZp3Yce/
 ce9MHP4iruEZ6QRzUh1ZDyVGxFGXSldl+iQM3fV/KTQsbln/nQ1nFPx7/0NbYfCWx0LY
 CWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720069096; x=1720673896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B7zncIRfeuDlItOIy7D0MDTD3orFgOC3UeicdZPk4r4=;
 b=NBkzqnq2QyN0gkJ7D4QfI5wRWdjk0TvGsY/g2/9KJarz4Vk5w+7xJvW+vlqTntUksP
 IRn6oc2/kEYhIYDPFdWfmhMr2vz7X9eXvDLnrUeLE42jyfoH0lqdQBYC9H9Sapy2uZiJ
 KXeshI2rgKSEUqdJF0A1wPpiA7IeqIgOPPdqzkKk+6V8DFCmY8S+nHe5ooQebyPOk6kT
 L3dWwv32OmHB/Kfr2qhB5di+iz1qTBt+2JXH20BjbL//nT4zrNI3dfVI8L+9eutBUXIw
 4pMaInwqzhNgUKJmNNKdtGYdQcHRMBSSrKTy2HsRnyuU/wxPFAOAapzss6hxFVQ8WM3m
 oMVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7FI7zasDyhdn5egdqwjmtnkOfh+kWFbvLZye1diDZ6vsq2dUyEIvtayIrTOUGn5smZANwXPFw3LT/iWueGtA68/xVamrzidIdrTtqCVp+kFzA68l5W1WL1oMgiB0/O/cI9ZJ6hhrtu+hHmOlZlA==
X-Gm-Message-State: AOJu0Yx133xuzukp+np/DEzpnwBtCtdNYtehJZWttSRvbPYyNrasJyHt
 dxg8mdq5S3KdqzqHIUR5BNVwyJVslTGOjFERifpMPS8Z1DhEXwWzsje8Agbp/kvrjiHZj/KzRqJ
 wFXdcspuBM+t4JtBEy44NGSaf9/E=
X-Google-Smtp-Source: AGHT+IF0DLCtxx1ONKaWIRWGcQaRLMMZnMXe1/bJJ23kQW1gwZq1F3/MHvrqsk9LZCHS4bi/2zcKgih857VzQG3iP9Y=
X-Received: by 2002:a2e:bc86:0:b0:2ed:58d0:b711 with SMTP id
 38308e7fff4ca-2ee8edfaa32mr3768541fa.33.1720069095952; Wed, 03 Jul 2024
 21:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240630165949.117634-1-wuhoipok@gmail.com>
 <748e1bd6-6c40-443d-acbc-3d379229d068@suse.de>
In-Reply-To: <748e1bd6-6c40-443d-acbc-3d379229d068@suse.de>
From: Hoi Pok Wu <wuhoipok@gmail.com>
Date: Thu, 4 Jul 2024 00:58:04 -0400
Message-ID: <CANyH0kDFSn6voXWnF-91fYufRT=Y3eRBLG66JBXz2_=rxJHXfg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/radeon: remove load callback & drm_dev_alloc
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Thanks a lot for your help Thomas.

On Wed, Jul 3, 2024 at 4:52=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 30.06.24 um 18:59 schrieb Wu Hoi Pok:
> > .load and drm_dev_alloc are deprecated. These patch series aims to
> > remove them.
> >
> > v3: Both v1 and v2 sucks. v3 improves greatly on readability.
>
> Very nice, thank you. I tested the patches with Radeon hardware and did
> not find issues. AFAICT this can be merged as-is. I think it should go
> into the amd trees. Maybe Alex or Christian can pick it up.
>
> Thanks for sticking with it.
>
> Best regards
> Thomas
>
> >
> > Wu Hoi Pok (6):
> >    drm/radeon: change variable name "dev" to "ddev" for consistency
> >    drm/radeon: remove load callback from kms_driver
> >    drm/radeon: use variable flags as parameter
> >    drm/radeon: add helper rdev_to_drm(rdev)
> >    drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
> >    drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc
> >
> >   drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
> >   drivers/gpu/drm/radeon/cik.c               | 14 ++--
> >   drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
> >   drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
> >   drivers/gpu/drm/radeon/ni.c                |  2 +-
> >   drivers/gpu/drm/radeon/r100.c              | 24 +++----
> >   drivers/gpu/drm/radeon/r300.c              |  6 +-
> >   drivers/gpu/drm/radeon/r420.c              |  6 +-
> >   drivers/gpu/drm/radeon/r520.c              |  2 +-
> >   drivers/gpu/drm/radeon/r600.c              | 12 ++--
> >   drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
> >   drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
> >   drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
> >   drivers/gpu/drm/radeon/radeon.h            |  7 +-
> >   drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
> >   drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
> >   drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
> >   drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
> >   drivers/gpu/drm/radeon/radeon_device.c     | 13 ++--
> >   drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++----------=
-
> >   drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
> >   drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
> >   drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
> >   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
> >   drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
> >   drivers/gpu/drm/radeon/radeon_kms.c        |  8 +--
> >   drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
> >   drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
> >   drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
> >   drivers/gpu/drm/radeon/rs400.c             |  6 +-
> >   drivers/gpu/drm/radeon/rs600.c             | 14 ++--
> >   drivers/gpu/drm/radeon/rs690.c             |  2 +-
> >   drivers/gpu/drm/radeon/rv515.c             |  4 +-
> >   drivers/gpu/drm/radeon/rv770.c             |  2 +-
> >   drivers/gpu/drm/radeon/si.c                |  4 +-
> >   39 files changed, 184 insertions(+), 179 deletions(-)
> >
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
