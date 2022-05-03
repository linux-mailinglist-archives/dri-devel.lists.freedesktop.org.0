Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C005190CB
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02D10F69C;
	Tue,  3 May 2022 22:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EADD10F69C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 22:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651615313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NCw2YbW2b06vdpfX9KTc0Sz/4kzxAVFUC7Z0+7uCYMw=;
 b=Jl37LP8xqETm2CBs3dim/5mKb8SIp6b2hJdVfOKav6hslj2bGbWWJaBkMFBV+f2RvPtCXf
 eJ00hzaRLaZ7WXC28W5aGvmkmoczAG2GohgQlgB1QcAu4uWPTTinq17GCuU9zJe6dwPT45
 I66sUD0pmG6CvTIVpLo0weJiVlXPY4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-JpRIQvKBOKWhWJHni4Xwnw-1; Tue, 03 May 2022 18:01:47 -0400
X-MC-Unique: JpRIQvKBOKWhWJHni4Xwnw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso2207028wmm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 15:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NCw2YbW2b06vdpfX9KTc0Sz/4kzxAVFUC7Z0+7uCYMw=;
 b=sZCowY/k6eKHItPlRh/5vuEhZnomd/+27Z4Q7f2eGqYhOKI6MlQEGw2xc7HhLmAu+j
 r2a9tr9e2qZ4zv5j65BTIDvtJmxXSmYNq/8z8tZ6LxRAXy5oEcWGPXmlEsxyrwUVvy6G
 sJJJomHq7UacnHi9WE5Dpn/ILINMShTrw8WVuAPRxeFYqYOYEI2OAvzmm8FxWGj+V1yZ
 96oZKSTCB5vwsG66Z4wUBiCiCE1IlXGZRk7bLads1yeT0TTSfBMJqLA9fGqRdV7XSsR+
 90cYgVhRh5f8DoOsAgowBq+hL/+/gC7CJyXP6P4AgKxkrBgBvRYVZULptz4oCEyJWAGI
 DdCQ==
X-Gm-Message-State: AOAM533ra6YImKbVeUUX+05GL6eM6Il5+zBJV2dGgA0iJCDMyJMkNAZy
 3G4jzJc97gv1d9R4uS1lQJLDbKqKK4nZ8qdhsUy03qfdsUiV7G+XCi/+7c+aD7F0ZZyJVY5gfT8
 swZ24B8ebuzJ9kFvSK3TjLnDgedccrGnNnYjy04POPSnV
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr14084337wrq.341.1651615305614; 
 Tue, 03 May 2022 15:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDZF5QtU8eWm5iH5MBr3nBAiPSuIRf8s8hX0zAE2sJW3Opo+sznt5voV5+vjORprV7H4visxp4de0FdVUYT74=
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr14084317wrq.341.1651615305322; Tue, 03
 May 2022 15:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220429195350.85620-1-lyude@redhat.com>
 <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
In-Reply-To: <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 May 2022 00:01:34 +0200
Message-ID: <CACO55tv=u+HNKS9tH-ggy_O0YRiZQvAyb48gxRVqrz-fmWcvwA@mail.gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Actually, there is another place we have to put this, we can spam
"SCHED_ERROR" things which are triggered within multiple
drivers/gpu/drm/nouveau/nvkm/engine/fifo/ files.

On Tue, May 3, 2022 at 9:23 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> not able to hit any error on my machine, but regardless:
>
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
>
> I suspect there are more places where we could put it, but we can add
> those later.
>
> Anyway, I think it's valuable to push it through fixes, not sure how
> far back we want to CC stable though.
>
> On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
> >
> > There's plenty of ways to fudge the GPU when developing on nouveau by
> > mistake, some of which can result in nouveau seriously spamming dmesg with
> > fault errors. This can be somewhat annoying, as it can quickly overrun the
> > message buffer (or your terminal emulator's buffer) and get rid of actually
> > useful feedback from the driver. While working on my new atomic only MST
> > branch, I ran into this issue a couple of times.
> >
> > So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> > ratelimit errors from faults. This should be fine for developers, since
> > it's nearly always only the first few faults that we care about seeing.
> > Plus, you can turn off rate limiting in the kernel if you really need to.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
> >  4 files changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > index 1665738948fb..96113c8bee8c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
> >  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
> >  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
> >  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> > +
> > +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
> >  #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > index 53a6651ac225..80b5aaceeaad 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> >
> > -               nvkm_error(subdev,
> > -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc),
> > -                          (stat & 0x00000002) ? "!ENGINE " : "",
> > -                          (stat & 0x00000004) ? "PRIVRING " : "",
> > -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> > +               nvkm_error_ratelimited(subdev,
> > +                                      "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> > +                                      (addr & 0x00000002) ? "write" : "read", data,
> > +                                      (addr & 0x00fffffc),
> > +                                      (stat & 0x00000002) ? "!ENGINE " : "",
> > +                                      (stat & 0x00000004) ? "PRIVRING " : "",
> > +                                      (stat & 0x00000008) ? "TIMEOUT " : "");
> >
> >                 nvkm_wr32(device, 0x009084, 0x00000000);
> >                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > index ad8da523bb22..c75e463f3501 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> >
> > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc));
> > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > +                                      (addr & 0x00000002) ? "write" : "read", data,
> > +                                      (addr & 0x00fffffc));
> >
> >                 stat &= ~0x00000008;
> >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > index 3a1e45adeedc..2055d0b100d3 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> >
> > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc));
> > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > +                                      (addr & 0x00000002) ? "write" : "read", data,
> > +                                      (addr & 0x00fffffc));
> >
> >                 stat &= ~0x00000008;
> >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > --
> > 2.35.1
> >

