Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B1135033
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 00:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6487D6E357;
	Wed,  8 Jan 2020 23:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E496E357;
 Wed,  8 Jan 2020 23:58:16 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id n27so3122046vsa.0;
 Wed, 08 Jan 2020 15:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nZtXADyrfsNI2t3xLAuGKVhqb37ykNuxCZAZeGw7DM=;
 b=iAwp+fCZaLvX/muKgM754JeMKkD7idPOE2o7PBHbcHzg8JrSG9zoSSF8EWXOFtA401
 dJXpNx32dwiM/LpOeFiZzJj7024cqsQjZzo2+uHMPahH7M6q2DwhDj2xXlPMvBTB+HUX
 ERou0n5/WG8WT/ChA5nV37bgtXguRvx2iitV2vuHgfmeu28VT/JtjdL/ojyy3Yr8x2/a
 9yrz19jR9B86daH/XECUu6lf0GiA3kSGX7M2m/6/IDBixPzjlEkdxQdy0KsBfEBJLuhM
 Camx9I79Gv0kE74xTlqoDKMcOOuO94fWkejGl6H5xrTUhhUfNyuwy0Ksim/OArakUpsI
 araw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nZtXADyrfsNI2t3xLAuGKVhqb37ykNuxCZAZeGw7DM=;
 b=tzkWz+ggLqCUG69peL3kCJqmu1Li8O2Iaj7PmqNdN9PZpmZ1kulneuODuLmCwK363d
 qq1Oq/7IJImfkOtMSJ6Ynfvz8q2U4BUad55PVF2xCYZDje1oycNb4uLu7BMOYFo8m4yz
 amiSdBsNgKTShKThIee53E5LOGmPWDAR/ZTffe9CfiG4a2oamWZHEVdc1aqD4Z/Vd0z6
 o+6TfAfRYcPIsTOjJEAABTa10qeJMwJvIYlIM2OnU30XB24rl5VPHMObd3dtMhE4RrcP
 Fx2LLYlTF6/xGwtitPVrGhv+zgeDOdMq99opDqIK617F0/DO0HJMKk4yoLv2vwJQfMRD
 7PXw==
X-Gm-Message-State: APjAAAUFfwn9YZXsdiqmbAt2cpwpYgrWU0sic8Ob6yIfdDE/9oKstf1q
 bkR+kSkkhNfsUgIF1vHLwzIlEBHSvqzchQFCZo0=
X-Google-Smtp-Source: APXvYqxMq8zNTpaV3+2pz3t18Kf9P+tFw/MULex1slX6odPImj9OrwG/evNC/zqK9OvL+pybbZSddcdWPVmyb0WaKjQ=
X-Received: by 2002:a05:6102:3126:: with SMTP id
 f6mr4480683vsh.204.1578527895518; 
 Wed, 08 Jan 2020 15:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
In-Reply-To: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 9 Jan 2020 09:58:04 +1000
Message-ID: <CACAvsv4ifPYma15xDfu43yanyznpNFyN1vgFrYmao=tdhE6Qjg@mail.gmail.com>
Subject: Re: [PATCH] nouveau/secboot/gm20b: initialize pointer in
 gm20b_secboot_new()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Jan 2020 at 15:46, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We accidentally set "psb" which is a no-op instead of "*psb" so it
> generates a static checker warning.  We should probably set it before
> the first error return so that it's always initialized.
You actually don't need to do either, *psb will be NULL already on
entry to the function.  But removing the assignment in the error path
should be done still.

Ben.

>
> Fixes: 923f1bd27bf1 ("drm/nouveau/secboot/gm20b: add secure boot support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  I'm not sure how this is called.
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> index df8b919dcf09..ace6fefba428 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> @@ -108,6 +108,7 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
>         struct gm200_secboot *gsb;
>         struct nvkm_acr *acr;
>
> +       *psb = NULL;
>         acr = acr_r352_new(BIT(NVKM_SECBOOT_FALCON_FECS) |
>                            BIT(NVKM_SECBOOT_FALCON_PMU));
>         if (IS_ERR(acr))
> @@ -116,10 +117,8 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
>         acr->optional_falcons = BIT(NVKM_SECBOOT_FALCON_PMU);
>
>         gsb = kzalloc(sizeof(*gsb), GFP_KERNEL);
> -       if (!gsb) {
> -               psb = NULL;
> +       if (!gsb)
>                 return -ENOMEM;
> -       }
>         *psb = &gsb->base;
>
>         ret = nvkm_secboot_ctor(&gm20b_secboot, acr, device, index, &gsb->base);
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
