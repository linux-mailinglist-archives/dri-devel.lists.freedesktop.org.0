Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2C5158B8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 00:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8074910E4E3;
	Fri, 29 Apr 2022 22:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F9C10E27E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651272999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=je5SErhibMA6Z9T+WagmypOtHrO0Yu5JDtKo0Bs8EKI=;
 b=ekpvmoXjBD63f/e2f/qgFK6sAceegQrR5EGI0gkQXOCSLgWE8GTsntjs3/RdwII0ihxxEl
 SeHAsHtoT5YjrB/Da1tCsBEPQspsTeuLnd5Cv3bQq+MCWHbseqorJWcGtuTUaWWf4whWCr
 bAJWFEUVKG9uYO7XSBlInS/6ylBisKU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-r5FTodHuPw6NlRk-cPfrnQ-1; Fri, 29 Apr 2022 18:56:38 -0400
X-MC-Unique: r5FTodHuPw6NlRk-cPfrnQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so3261473wmn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 15:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=je5SErhibMA6Z9T+WagmypOtHrO0Yu5JDtKo0Bs8EKI=;
 b=v+YcQD9+WJNd620eDHNKSOPPDy0+s7kwfX5XVjrqvv54TQSWyLI0oxRCkjY5Pzvmk4
 4YLwqizvps0sS9F2v0lZFptTtPBZadScxR+Pl2IK4nAPYlHLE8yD809PgXc3CV6GY2K/
 zi6iSBUeDsgbrga4i+V37+Uz85hSJnGAeePp/yA+r/Lta0mjJNMQXH2K+UplmHB+68g2
 FJ7ecAZMRgAc55Og6vA4s12dSdFxbGnIwJO9GV/lgNgJEcIRbvVz6uaLvV7qrxvyzzFP
 DEWgjIFgP4BXyFNpUBbd/JejrmXwWOAzFQPXjDqNawI9/Uf6Md0MoiQyw/1lwm25NBS0
 6v2g==
X-Gm-Message-State: AOAM532sWdh3qot/KVCBTZsMBcr1M5m8kHplMjCdRu9w/8SZ8QtTn5Jy
 tUG17deezE/qz4DpaPo+JN/Rp4c2U5E6wy3Vg70MCdYxRAnqvybXau7mXCjePqnvyB86WuLhAg1
 2IKGNjLpkuRrkm0l2az9A5fdlexqsrph+zHpQiVTeBuVx
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr913072wrq.341.1651272997153; 
 Fri, 29 Apr 2022 15:56:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHN7lMP91e91uyogRfRBCOgepnrI6Zl5ptW8Vj6GUyYJSXXcqBMCd8vFHdNaWH8oqiJsSfz8iOovBlg2xy/HE=
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr913064wrq.341.1651272996952; Fri, 29 Apr
 2022 15:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220429195350.85620-1-lyude@redhat.com>
In-Reply-To: <20220429195350.85620-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 30 Apr 2022 00:56:26 +0200
Message-ID: <CACO55tuY6ACoW5jgRk8jCVZ_ZZDEBXczkaiTSpFDvw2h81r=xA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/subdev/bus: Ratelimit logging for fault errors
To: Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
>
> There's plenty of ways to fudge the GPU when developing on nouveau by
> mistake, some of which can result in nouveau seriously spamming dmesg with
> fault errors. This can be somewhat annoying, as it can quickly overrun the
> message buffer (or your terminal emulator's buffer) and get rid of actually
> useful feedback from the driver. While working on my new atomic only MST
> branch, I ran into this issue a couple of times.
>
> So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> ratelimit errors from faults. This should be fine for developers, since
> it's nearly always only the first few faults that we care about seeing.
> Plus, you can turn off rate limiting in the kernel if you really need to.
>

good idea :)

Although I think we ultimately need a detection of "GPU state is
trashed" where we cease to do anything and disable interrupts as some
of those issues actually cause the kernel to get DOSed by nouveau
spamming/handling interrupts. Not sure if we should go with this patch
in the meantime, or if we should just go straight ahead and disable
interrupts, which would also stop the spam.

Do you know if this patch here is enough to get the system to reboot
normally or is it only spamming less?

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
>  4 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> index 1665738948fb..96113c8bee8c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
>  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
>  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
>  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> +
> +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> index 53a6651ac225..80b5aaceeaad 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
>                 u32 addr = nvkm_rd32(device, 0x009084);
>                 u32 data = nvkm_rd32(device, 0x009088);
>
> -               nvkm_error(subdev,
> -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> -                          (addr & 0x00000002) ? "write" : "read", data,
> -                          (addr & 0x00fffffc),
> -                          (stat & 0x00000002) ? "!ENGINE " : "",
> -                          (stat & 0x00000004) ? "PRIVRING " : "",
> -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> +               nvkm_error_ratelimited(subdev,
> +                                      "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> +                                      (addr & 0x00000002) ? "write" : "read", data,
> +                                      (addr & 0x00fffffc),
> +                                      (stat & 0x00000002) ? "!ENGINE " : "",
> +                                      (stat & 0x00000004) ? "PRIVRING " : "",
> +                                      (stat & 0x00000008) ? "TIMEOUT " : "");
>
>                 nvkm_wr32(device, 0x009084, 0x00000000);
>                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> index ad8da523bb22..c75e463f3501 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
>                 u32 addr = nvkm_rd32(device, 0x009084);
>                 u32 data = nvkm_rd32(device, 0x009088);
>
> -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> -                          (addr & 0x00000002) ? "write" : "read", data,
> -                          (addr & 0x00fffffc));
> +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
> +                                      (addr & 0x00000002) ? "write" : "read", data,
> +                                      (addr & 0x00fffffc));
>
>                 stat &= ~0x00000008;
>                 nvkm_wr32(device, 0x001100, 0x00000008);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> index 3a1e45adeedc..2055d0b100d3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
>                 u32 addr = nvkm_rd32(device, 0x009084);
>                 u32 data = nvkm_rd32(device, 0x009088);
>
> -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> -                          (addr & 0x00000002) ? "write" : "read", data,
> -                          (addr & 0x00fffffc));
> +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
> +                                      (addr & 0x00000002) ? "write" : "read", data,
> +                                      (addr & 0x00fffffc));
>
>                 stat &= ~0x00000008;
>                 nvkm_wr32(device, 0x001100, 0x00000008);
> --
> 2.35.1
>

