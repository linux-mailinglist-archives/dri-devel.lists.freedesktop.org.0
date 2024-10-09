Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514E79969BE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 14:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6AD10E29F;
	Wed,  9 Oct 2024 12:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dJBAxFat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4EF10E29F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 12:16:05 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e28fe3b02ffso791436276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728476164; x=1729080964;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SP3TO6PzMnYHnnQsF3wSVvNFppGWS7tXRNkouPbefzM=;
 b=dJBAxFatIy4/D8ThPJEi5iID6fqaCxVZxshnL1J8XKRmayRAECY9DPfNgfqC1TbDnW
 OZcnx8Efqq951o6uApEprnkNPOGcoi4ijyDRfJP4AzGxmFUkPOzioYgtS7IOKz6SkA7L
 KbWC1Pl9COHeg98Dmx64hEG2cKYfsq/ypg2M66Q7UnYuMj+gus9wqZcrM65d1nxqjP09
 cRTlU/ULzeuh/cUo8b7PwlqQid1gcqAWXhgLd4p3ZjyW03MJRci8eEI6R/xGMBsNbOX1
 mxz5tA9YBduh1+EJnokK/9ZHLVEkG0rnIYjfazGN/dN0z2Fgi/NFIZ1ZDUZh7Z9a56M3
 FWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728476164; x=1729080964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SP3TO6PzMnYHnnQsF3wSVvNFppGWS7tXRNkouPbefzM=;
 b=M7FEuosUZB7NZavf0ganl6SXoa0TCyGXK4eRHg7z8IJC7UXjG1pnViBCaBT0SgFGfr
 rsfOqflhusyuC+qC3BBZ/aTJedxpOBms0VBjL5S2as6wVSmq1Leo2D7FPQtY7qEGYphI
 hEMNmUlzpkicp5BPTTsY5IXltZmZjuh/rmEFSoayQQN6XeAP7+YUmI7646OkYl4Ae0jb
 bM2u3hiIActF0LuO2ckFFRFLmx4LkqRgtLXRKFo1ut85JTxc53CQ+LArW1pGd3bNwUUR
 gh59bGLbcWUOHexcqs1IidKqPlBZfBr/EoL4h+Wlpm2VtNkBEYt2sqBOnja6scGyaD95
 Okvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMoN9CCo7SqZnmvUuMzPMZtE/5bgpSUYm3Iukb5ZSGzWfPVl4+c5FVdAPafN2L4CKNd3var99rNbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBcdyVwAzkTvETF6wSk91tOdJtXvTjTLxcWQsJ8Oka/yQiR7TD
 xftk62E/uxtI7A9wJkNZaUV802Q4PvvW0SfajGWwREqZQEUxlcTh/DX6PtDvXsk8ls/5H0vb4kI
 YrK3Qun03Zp1Lj0v7FosLQxHxaLCqX2/P7XjX9A==
X-Google-Smtp-Source: AGHT+IEjqph+QOBkdC2wgmaMeMXSihsDIdEYasz72e+xVwTC+AQjHciiKXf6ktHHAe3sCryvIdzDZehqTofRN1fBwpc=
X-Received: by 2002:a25:94d:0:b0:e20:291e:7fe1 with SMTP id
 3f1490d57ef6-e28fe45cf09mr1822059276.25.1728476164318; Wed, 09 Oct 2024
 05:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
 <20241002-vc4_fbdev_fix-v1-1-8737bd11b147@raspberrypi.com>
 <b1d76661-41b9-4841-80f4-452654d9cd6b@igalia.com>
In-Reply-To: <b1d76661-41b9-4841-80f4-452654d9cd6b@igalia.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Oct 2024 13:15:48 +0100
Message-ID: <CAPY8ntDgkyQ6ijdgB2Qmd45ArtXqYFwfmpvYgQhobnw=bUnd-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: Run default client setup for all variants.
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
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

On Wed, 9 Oct 2024 at 12:02, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Hi Dave,
>
> On 10/2/24 12:06, Dave Stevenson wrote:
> > Commit 45903624e9fc ("drm/vc4: Run DRM default client setup")
> > only added DRM_FBDEV_DMA_DRIVER_OPS for the vc4 (Pi0-3) driver
> > definition, which caused an issue on vc5 (Pi4) as there was no
> > fbdev_probe function defined.
> >
> > Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Applied to drm-misc-next.

> Best Regards,
> - Ma=C3=ADra
>
> > ---
> >   drivers/gpu/drm/vc4/vc4_drv.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_dr=
v.c
> > index 13a1ecddbca3..a238f76a6073 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.c
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> > @@ -238,6 +238,7 @@ const struct drm_driver vc5_drm_driver =3D {
> >   #endif
> >
> >       DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(vc5_dumb_create),
> > +     DRM_FBDEV_DMA_DRIVER_OPS,
> >
> >       .fops =3D &vc4_drm_fops,
> >
> >
