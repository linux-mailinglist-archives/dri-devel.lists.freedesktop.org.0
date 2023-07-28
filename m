Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D4766996
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 12:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3610E6D0;
	Fri, 28 Jul 2023 09:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD2510E6D0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64cwbX0RqK2VCO/K9nDSDwV09g6WKDYXzEmbeoTby84=;
 b=D7BR+zq4TNVVXaYRsl6W37RkU2pqPJn4AYrk/nq9kLqC6KdptzVD8FlMp2QnS/sJkTEFa3
 +fPuJ3YXTWfDEthD4DZccGTYKg5qs/nVd/UOoeQL8l2gndAXNICW/ZWWPAYJ4GrbU79MxD
 /7q1fg2OqY9qEjA1537Oaso+k7ZevmY=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-FKKnUP-CN2OgPN_3l8ZgoA-1; Fri, 28 Jul 2023 05:59:54 -0400
X-MC-Unique: FKKnUP-CN2OgPN_3l8ZgoA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b839ca1362so4084401fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538393; x=1691143193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64cwbX0RqK2VCO/K9nDSDwV09g6WKDYXzEmbeoTby84=;
 b=JGFl7oZQpZjXUC3TiLVrYoX+2zJ8Sf6HWterGwNZGFhozFqknPWWFQMGKrNa04M6SD
 HDhSZNTDrLBbZzUsgWPUGxazOZg7dx+eq9WOOWIL9Zfmoc2wkk6FuSFQTmwhNs5iJsqi
 g+89xtca+EnbyhlCmbeZ6ril4OoLtWmmrHqo9udlpH/6Tt6cLJq9Sd5wCHwDzVoJ/JEJ
 yMqZiVSpVwJFkGMBdgdW+mqS8XPG57zDFx5vLpa3GpmL92rwynnWCfIQJ23Lm3yXbRMr
 TL1cWMsekQqr1Ev+4kMBZEBJSRggn5f2+2nQo3Urth2jlsIoqhZw7gd28c9ANSzs56tv
 0A0Q==
X-Gm-Message-State: ABy/qLZOzwJnynzYt18wm9NwMsDCQb9OQjJ8FKvr9pfh1qUShkvvqgl0
 mySOG4ARg7H1sQK8E3yd9WkO669iA7DbtGyeTqzYZqfFEQVDequABAT5cx3drT2iNhVhEDL/NhW
 Ykyap/b7eR+XQ5MY0Cv/CMrBZM9ORS7Zf6ZIGvV3cDI25
X-Received: by 2002:a2e:501c:0:b0:2b6:af68:6803 with SMTP id
 e28-20020a2e501c000000b002b6af686803mr705822ljb.4.1690538393211; 
 Fri, 28 Jul 2023 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFAIXcAWMCt7sf6hNC3aFwCm0EH6PL4GAUcsvLw8voE2q9DUMDvV3f/2rOa2DVWhU8XcDIjRJl86zmb1WZ6ujo=
X-Received: by 2002:a2e:501c:0:b0:2b6:af68:6803 with SMTP id
 e28-20020a2e501c000000b002b6af686803mr705816ljb.4.1690538392874; Fri, 28 Jul
 2023 02:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215851.590754-1-lyude@redhat.com>
 <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
 <badef3d33469d97b01a42da520ad22ae4c9485fe.camel@redhat.com>
 <CACO55ttVgw=uuG1i9bNOi5hh-0Xi+WhcR4eL_TQOzjzUKGX1rw@mail.gmail.com>
In-Reply-To: <CACO55ttVgw=uuG1i9bNOi5hh-0Xi+WhcR4eL_TQOzjzUKGX1rw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Jul 2023 11:59:41 +0200
Message-ID: <CACO55tt=Hr0RWhVEJeffMFxwvLuNmB38dUz2ZB1zWf5cNpXYKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/nvkm/dp: Add hack to fix DP 1.3+ DPCD issues
To: Lyude Paul <lyude@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 1:11=E2=80=AFAM Karol Herbst <kherbst@redhat.com> w=
rote:
>
> On Thu, Jul 27, 2023 at 11:57=E2=80=AFPM Lyude Paul <lyude@redhat.com> wr=
ote:
> >
> > On Sun, 2023-07-09 at 01:42 +0200, Karol Herbst wrote:
> > > On Fri, Jul 7, 2023 at 11:58=E2=80=AFPM Lyude Paul <lyude@redhat.com>=
 wrote:
> > > >
> > > > Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side=
 of
> > > > nouveau in order to read the DPCD of a DP connector, which makes su=
re we do
> > > > the right thing and also check for extended DPCD caps. However, it =
turns
> > > > out we're not currently doing this on the nvkm side since we don't =
have
> > > > access to the drm_dp_aux structure there - which means that the DRM=
 side of
> > > > the driver and the NVKM side can end up with different DPCD capabil=
ities
> > > > for the same connector.
> > > >
> > > > Ideally to fix this, we want to start setting up the drm_dp_aux dev=
ice in
> > > > NVKM before we've made contact with the DRM side - which should be =
pretty
> > > > easy to accomplish (I'm already working on it!). Until then however=
, let's
> > > > workaround this problem by porting a copy of drm_dp_read_dpcd_caps(=
) into
> > > > NVKM - which should fix this issue.
> > > >
> > > > Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211
> > >
> > > Should a Fixes: or Cc: stable tag be added so it gets backported?
> >
> > JFYI I think not adding one is fine nowadays? The stable bot seems to b=
e
> > pretty good at catching anything with the words fix/fixes in it
> >
>
> Yeah not sure.. I'd rather be specific and add it just to be sure.
> Anyway, it could also be done while pushing. I think the bigger
> question here was if this fix is good enough for stable or if you plan
> to rework it.
>
> > >
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 +++++++++++++++=
+++-
> > > >  1 file changed, 47 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/driver=
s/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > > index 40c8ea43c42f..b8ac66b4a2c4 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > > @@ -26,6 +26,8 @@
> > > >  #include "head.h"
> > > >  #include "ior.h"
> > > >
> > > > +#include <drm/display/drm_dp.h>
> > > > +
> > > >  #include <subdev/bios.h>
> > > >  #include <subdev/bios/init.h>
> > > >  #include <subdev/gpio.h>
> > > > @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvk=
m_outp *outp)
> > > >         return outp->dp.rates !=3D 0;
> > > >  }
> > > >
> > > > +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_=
caps()
> > >
> > > Well.. maybe we should rephrase that _if_ we want to see it
> > > backported. But is this code really that bad? It kinda looks
> > > reasonable enough.
> > >
> > > > + * converted to work inside nvkm. This is a temporary holdover unt=
il we start
> > > > + * passing the drm_dp_aux device through NVKM
> > > > + */
> > > > +static int
> > > > +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> > > > +{
> > > > +       struct nvkm_i2c_aux *aux =3D outp->dp.aux;
> > > > +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> > > > +       int ret;
> > > > +
> > > > +       ret =3D nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, =
DP_RECEIVER_CAP_SIZE);
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > > +       /*
> > > > +        * Prior to DP1.3 the bit represented by
> > > > +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > > > +        * If it is set DP_DPCD_REV at 0000h could be at a value le=
ss than
> > > > +        * the true capability of the panel. The only way to check =
is to
> > > > +        * then compare 0000h and 2200h.
> > > > +        */
> > > > +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > > > +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > > > +               return 0;
> > > > +
> > > > +       ret =3D nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(=
dpcd_ext));
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > > +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > > > +               OUTP_DBG(outp, "Extended DPCD rev less than base DP=
CD rev (%d > %d)\n",
> > > > +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DP=
CD_REV]);
> > > > +               return 0;
> > > > +       }
> > > > +
> > > > +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > > > +               return 0;
> > > > +
> > > > +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  void
> > > >  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
> > > >  {
> > > > @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool aux=
pwr)
> > > >                         memset(outp->dp.lttpr, 0x00, sizeof(outp->d=
p.lttpr));
> > > >                 }
> > > >
> > > > -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.d=
pcd, sizeof(outp->dp.dpcd))) {
> > > > +               if (!nvkm_dp_read_dpcd_caps(outp)) {
> > > >                         const u8 rates[] =3D { 0x1e, 0x14, 0x0a, 0x=
06, 0 };
> > > >                         const u8 *rate;
> > > >                         int rate_max;
> > > > --
> > > > 2.40.1
> > > >
> > >
> >
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >

before I forget:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

