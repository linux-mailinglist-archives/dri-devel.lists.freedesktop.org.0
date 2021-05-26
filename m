Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E00083915CD
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CA26EC84;
	Wed, 26 May 2021 11:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64CA6EC83
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622027821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZhb8zuVnnjhU4y7wnecCuH3x05R6lnJG5XgPPhjXY0=;
 b=beTieYlzyePGGjkOCs+MlM0vZDcUF/lBuyJj64pNx5rOsAjPTL0MHksxs9m3phTlzkVuCQ
 X6n2kvBAYypjTJf6haqKaAOves16LH4IZAQnOokRaI8PDvCQ8U7Jixj9E1S3gtpyNdPMZG
 m3Nvx0Wt2PFJY8OPRDVJFQjd8n0YpkU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-cBHNQkooMFWonkPRNki5Ww-1; Wed, 26 May 2021 07:16:58 -0400
X-MC-Unique: cBHNQkooMFWonkPRNki5Ww-1
Received: by mail-wr1-f72.google.com with SMTP id
 h22-20020adfa4d60000b029011244156c68so236576wrb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 04:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZhb8zuVnnjhU4y7wnecCuH3x05R6lnJG5XgPPhjXY0=;
 b=Q/r6oOg7Vo8kScKygXNkZnroiov0EWvQwSFv+ZgMRRe1lBA11UF6a2rzs30+exUNn5
 fpjWBX8X5DWpnC9qdQkc762OZ/HFZOrVk+Mn2uBZUtWcfrKx1uOGsfhy0+Qaysci4KFt
 BzEwevaiYzC0SZ9wrXcGbTRhS623sRPFTcBd+qzKUzwLB8g2L4mtciW0c16jn296ZgD/
 E6g+6uFfVLqPGSVdI7ifEaQyVSegftWXJS1FzTM/PJAzHesMbD+cAnl9hCU5XjW70ct0
 P5SqLSzGiYvUvz6FAi0U8n213XA7hM370nrCvC8pxlaq2g5QL1sxNbTFt0akyAyahi/E
 KcSQ==
X-Gm-Message-State: AOAM531x+XMNHtdkwe4lR9OiNVWhofTfeNjCZL97kdm5pmY1Z6Js0QVt
 KdIc8L4DJwGhDyZdo1Dur655HcNIZECf7bYaYmh8t48nb6PhVU33t42aqpNu5kUvquYDhexhBl2
 MbyEwq1PQ3aNcOxPhMIKi2hn2WB34qGJM1W/OhGS7HHRI
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr30747648wrq.177.1622027816753; 
 Wed, 26 May 2021 04:16:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC/kfOOQw4CwfWnJy7tsT5TwYrdsCpahCbg0flnKAJcY+E6BvxvK01g0k+BcUw5O2u46vOYYCfvWQxIboZsY8=
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr30747629wrq.177.1622027816562; 
 Wed, 26 May 2021 04:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-12-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-12-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 26 May 2021 13:16:46 +0200
Message-ID: <CACO55tuGiW=e+ee83jhvQOJxA+tedH5r_pHS+ESbEQVABgfvnQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 11/34] drm/nouveau/nvkm/subdev/mc/tu102: Make
 functions called by reference static
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 10:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:50:1: warning: no previou=
s prototype for =E2=80=98tu102_mc_intr_unarm=E2=80=99 [-Wmissing-prototypes=
]
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:62:1: warning: no previou=
s prototype for =E2=80=98tu102_mc_intr_rearm=E2=80=99 [-Wmissing-prototypes=
]
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c:74:1: warning: no previou=
s prototype for =E2=80=98tu102_mc_intr_mask=E2=80=99 [-Wmissing-prototypes]
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/mc/tu102.c
> index 58db83ebadc5f..a96084b34a788 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/tu102.c
> @@ -46,7 +46,7 @@ tu102_mc_intr_update(struct tu102_mc *mc)
>                 nvkm_wr32(device, 0xb81610, 0x6);
>  }
>
> -void
> +static void
>  tu102_mc_intr_unarm(struct nvkm_mc *base)
>  {
>         struct tu102_mc *mc =3D tu102_mc(base);
> @@ -58,7 +58,7 @@ tu102_mc_intr_unarm(struct nvkm_mc *base)
>         spin_unlock_irqrestore(&mc->lock, flags);
>  }
>
> -void
> +static void
>  tu102_mc_intr_rearm(struct nvkm_mc *base)
>  {
>         struct tu102_mc *mc =3D tu102_mc(base);
> @@ -70,7 +70,7 @@ tu102_mc_intr_rearm(struct nvkm_mc *base)
>         spin_unlock_irqrestore(&mc->lock, flags);
>  }
>
> -void
> +static void
>  tu102_mc_intr_mask(struct nvkm_mc *base, u32 mask, u32 intr)
>  {
>         struct tu102_mc *mc =3D tu102_mc(base);
> --
> 2.31.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

Reviewed-by: Karol Herbst <kherbst@redhat.com>

