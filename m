Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F86518D20
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 21:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E1F10E7E5;
	Tue,  3 May 2022 19:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A6210E7E5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651605835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/RCEqp6rD6C5bP4Oel+DuHsx3t6d/OQda58eNU9e8M=;
 b=A16t6bzVRKVqXbOaPzg1HjUjJurwdOBMAb58ySfzDHMqCAGPwaTLra1Y/zXC1HtloBYRWp
 2dEK/3sIz7eDmgbwhc+27B9/X6DTrU6x+/BIPfESR40LGUhegTMYzMNI0HxNIBQjGKW0eL
 YxdugYsw91oHDvvWigF+rtq3cpI3VTM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-WIdPtuO8Oo-yu4ANl2YoKQ-1; Tue, 03 May 2022 15:23:44 -0400
X-MC-Unique: WIdPtuO8Oo-yu4ANl2YoKQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso6674577wrd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 12:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/RCEqp6rD6C5bP4Oel+DuHsx3t6d/OQda58eNU9e8M=;
 b=09b5Z9Yyfv1gK/+Kmgr0ZUTtdkiyx/sM3xbIG5bXLrHYUGJD9x4V03eYUTDKMoJMBy
 c2VhcBgq7+O23HK6JiCql0YKw9Z1Tggod5h4WGBSukGo2qxyjKC0p4MAV920y+nHzR2x
 0quCVODB50OBYvA6Jnp3BgivJxqIS+J7RGrsmDHL1TJsmbDyJbHaBjlDQxouITXJplzZ
 T/g8ejGkBhpRR4BWm4wKErWeDjFj/WSe8oPyhnwhlayZ2m+nCPx7r9GdtLSgZPqCrMvJ
 4xHhd/+cxDFswGRE6jpWfQoaX0MpkDyAUEAiyex+NE+IsRcsIrS2gXZKuYVFZ63un+MZ
 6WSQ==
X-Gm-Message-State: AOAM531xsdAQroBNFaz4QNYzXLBe0ooQATk9HWAI8FMMoBo+ERw0/6zd
 72+GbLMnLr7sx4krzr0n8rJbNnf+zbwcbskpaW+NBB+6yp+YbkpQs+UkYQ1Ax8Pi/fTaKCRZTS/
 JPjVPVfW+si3hG0/PFSB1ShuC+aq5vX1x5Wh7Dy8BKI5N
X-Received: by 2002:a5d:64ea:0:b0:20c:5ca3:a0de with SMTP id
 g10-20020a5d64ea000000b0020c5ca3a0demr10508056wri.308.1651605821929; 
 Tue, 03 May 2022 12:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzreDUrtXoyuE22Us65ZpjSyx6nFjemAk+h1WnCiSgoWNkBnpxUDaPb4LDmFrrMxNqjsNDyA6NW8ENNFbF1AEU=
X-Received: by 2002:a5d:64ea:0:b0:20c:5ca3:a0de with SMTP id
 g10-20020a5d64ea000000b0020c5ca3a0demr10508040wri.308.1651605821655; Tue, 03
 May 2022 12:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220429195350.85620-1-lyude@redhat.com>
In-Reply-To: <20220429195350.85620-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 3 May 2022 21:23:30 +0200
Message-ID: <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
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

not able to hit any error on my machine, but regardless:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I suspect there are more places where we could put it, but we can add
those later.

Anyway, I think it's valuable to push it through fixes, not sure how
far back we want to CC stable though.

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

