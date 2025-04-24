Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A836A9B1FD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 17:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D000710E833;
	Thu, 24 Apr 2025 15:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="sPp9JlQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFF010E833
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 15:20:58 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e643f235a34so929568276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1745508057; x=1746112857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NG938xxNFSAXoB4QqL7HrBT3cXqzIUpUR1csE9yRVyM=;
 b=sPp9JlQpfAJyCcwAAkFDhuF2gyutog1B9PHkikH2SvnGvj3RTclXBZWy96wxiq64X+
 t2G4Eb4j+jjYMhbbXKsmvF7ugK5V6aYNOMrju0NZi01W7vnaK37s3bBnBEGad3TxXjve
 a1SNrwA10DHUznACWLFUbxWoEx5Yvbq+qmLaSA1dZkflxCFy/oYkmALFaSn2ljIhAr+L
 iTL4TrQs61kkqjr2xYw4ChfNswQXSuf+Q8WN1wZUjY8tpxIkErg+BCTY/jqG07mMPhPf
 6Li6Has+YXrst9GYkqC47/xgRFq2FNH7ligwAqjEMuRoSSHnR837CmnpUbRyVYU9EzFC
 ekug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745508057; x=1746112857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NG938xxNFSAXoB4QqL7HrBT3cXqzIUpUR1csE9yRVyM=;
 b=gz5YXEbmASTUCEz0ehpkm9MFzgfkPdI6wl7VlK1iVu3LRseWhQRJf5F+hojXHNd6xc
 YeI3ZTW19eFNcfV9miRYKZYcoidONWRYerbYshznQvQyCrrBzbhND+VzsK2wRS93tkR7
 s4SgUBATQltli2h6vYTWSq1FP6LBrSfjcAgFeGvNFWhgDxkWrdJlAfQ7anXKJazmLBcK
 E+4csLLQ7xjLwZLFTTROeZ26/pecK24zYN75FpGWY0r/HNOQ2gaGHdaoPluVuoTRLraF
 pRLU5HXnypI1pHMGqF/WbKeM5GqjEZP9+3+9+M+zvASgsmeFqpCBVYkaA3z0nrKz8tAe
 c1+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgS8fRDrsWHV0q+lhYd74EgH8UvYUGrmgTqXOt7wPyZhrD7y9zLFKrKDBsA2jqr37QAj5dpvNx7n0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrOryWQR4t7kLtcn3wYDhP98P2UhuKESpEvy+zZTNJWVB9D0mV
 uHSUlR1J/eKEao5cbxVRwckGqChQZN4JpGHXLoUnkmKPxlwJsLegBRL0LruUcdj6PKz7RxzokHh
 MjurEtMqhP8veiCX3aYakt62aM3GMmHsWlEa01g==
X-Gm-Gg: ASbGncv6euUEJPMp2UcZrEUYlnpuyDoTvtqPP78+LUidLgUSedjaO61URTtTYj8NTVG
 lo8XqayU560b9y5OwzxRNN2qces//LP2creWfMuG1Qp1LPnf0W4C5SQajjOTjNKJmcaMrjkLskW
 tjeyCMQi0aD9YioCgZuyHFPDzV65emlM+J8GAO/UnbMZwdRwOx3YaAfg==
X-Google-Smtp-Source: AGHT+IH0Ztll6nMfYKq1MkjEkdf7279uZTDGix3UzH+NA+sMoaHFXy1pYzDOyt8Mba+QUq1GRouVzGcOx6ZFnPQxCQo=
X-Received: by 2002:a05:6902:2209:b0:e6b:71cf:45cf with SMTP id
 3f1490d57ef6-e730365abc3mr4664805276.46.1745508057189; Thu, 24 Apr 2025
 08:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250414134821.568225-6-tzimmermann@suse.de>
In-Reply-To: <20250414134821.568225-6-tzimmermann@suse.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 24 Apr 2025 16:20:40 +0100
X-Gm-Features: ATxdqUH2tI2TKyvMPV7X_DpnmMBVAt0W_xoeOP4xZsiae98sNeVETsUWC_cq-BY
Message-ID: <CAPY8ntD3smR2Z62mxeHgis6UOSrSswawTsr=8Xm_LE9hxt+FGA@mail.gmail.com>
Subject: Re: [PATCH 06/11] drm/vc4: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
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

On Mon, 14 Apr 2025 at 14:51, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_bo.c  | 2 +-
>  drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 7125773889f1..b503fd0488b0 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -556,7 +556,7 @@ static void vc4_free_object(struct drm_gem_object *ge=
m_bo)
>         mutex_lock(&vc4->bo_lock);
>         /* If the object references someone else's memory, we can't cache=
 it.
>          */
> -       if (gem_bo->import_attach) {
> +       if (drm_gem_is_imported(gem_bo)) {
>                 vc4_bo_destroy(bo);
>                 goto out;
>         }
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.=
c
> index 8125f87edc60..3e79ad69250a 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -1249,7 +1249,7 @@ int vc4_gem_madvise_ioctl(struct drm_device *dev, v=
oid *data,
>         /* Not sure it's safe to purge imported BOs. Let's just assume it=
's
>          * not until proven otherwise.
>          */
> -       if (gem_obj->import_attach) {
> +       if (drm_gem_is_imported(gem_obj)) {
>                 DRM_DEBUG("madvise not supported on imported BOs\n");
>                 ret =3D -EINVAL;
>                 goto out_put_gem;
> --
> 2.49.0
>
