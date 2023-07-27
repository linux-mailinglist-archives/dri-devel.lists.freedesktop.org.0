Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E258766027
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 01:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F3710E635;
	Thu, 27 Jul 2023 23:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88910E639
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690499479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tb22Nt/W/KPFm1/jjlHjB82SYQazipAe29rdTdiORQY=;
 b=Mpgm28IJSGwbQmbjavjB321ZycgUPaCK7+UXLjgIyM945pZshflTAUEG3R00PBF+KO0cro
 xPybifqz5b25ZRHiAKbgcwvBlYB38pqNOCFyI/+bQEQgIYSnfEQn7DO5+/r9XyejLaVh3e
 SgBe4kOLFIMa8tiPQfRRO6E06XY6ViI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-L-5VtFvsNg2WIk8gdkbFgA-1; Thu, 27 Jul 2023 19:11:18 -0400
X-MC-Unique: L-5VtFvsNg2WIk8gdkbFgA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fdfaa288e7so292309e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690499477; x=1691104277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tb22Nt/W/KPFm1/jjlHjB82SYQazipAe29rdTdiORQY=;
 b=MUdYoHViRw62b/WX1UPxdAA5A9uD5o0n2BLt7yKosrDiUxK0GQuuz1k04IVNBcIrh1
 wlOEeh7/V8s3XHA8/VbACQWYekF4ed0EicCMzv/wECmjqYfK8ZgtArdV6fDMPIHlxFgt
 zpnk8wjMkm5UH2hrO1V5bFSoMdhuBUumZa2SxjLGOx4xZoewNDLZzSby4n4+GGpyz+EB
 Y1wu7bHiYalxsv7HjsFy/6W38krg3VCz1fCyTcoGf8REiWQTVDaEacfbgDcEHYQEd01z
 5OoN+QlPRHdTMk7Ivi05KFRGLRYgxtrl31cov4eNsDzXizBR+5BDsTdNT3nZyDPbF7zS
 x8BQ==
X-Gm-Message-State: ABy/qLbnDNGGAEMdcYDEfneiW64e2yjOTZw14gOBAgeCDCKeq7fBKbLQ
 S75uCvqeojR/t1SDP5rv7SilMxXJJgSC1+QaUoJJJFpS9Is0JV45mvaoZsbXcuGLgAiZG7h9LF4
 twNUAQljtMOiwPb9M3u0mQTyPo+hLVSUyO6GmqRTDOnHV
X-Received: by 2002:a05:651c:198d:b0:2b7:3a7e:9e89 with SMTP id
 bx13-20020a05651c198d00b002b73a7e9e89mr244012ljb.2.1690499476970; 
 Thu, 27 Jul 2023 16:11:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEja/hy3vaHm3vSbZBtAyKzXXSPo07fZ16cOXMa0gytQPBHCI/ExSdTAPRlFFYetTqV4Ele/4rq2ADaQD9h64s=
X-Received: by 2002:a05:651c:198d:b0:2b7:3a7e:9e89 with SMTP id
 bx13-20020a05651c198d00b002b73a7e9e89mr244008ljb.2.1690499476532; Thu, 27 Jul
 2023 16:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215851.590754-1-lyude@redhat.com>
 <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
 <badef3d33469d97b01a42da520ad22ae4c9485fe.camel@redhat.com>
In-Reply-To: <badef3d33469d97b01a42da520ad22ae4c9485fe.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Jul 2023 01:11:05 +0200
Message-ID: <CACO55ttVgw=uuG1i9bNOi5hh-0Xi+WhcR4eL_TQOzjzUKGX1rw@mail.gmail.com>
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

On Thu, Jul 27, 2023 at 11:57=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> On Sun, 2023-07-09 at 01:42 +0200, Karol Herbst wrote:
> > On Fri, Jul 7, 2023 at 11:58=E2=80=AFPM Lyude Paul <lyude@redhat.com> w=
rote:
> > >
> > > Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side o=
f
> > > nouveau in order to read the DPCD of a DP connector, which makes sure=
 we do
> > > the right thing and also check for extended DPCD caps. However, it tu=
rns
> > > out we're not currently doing this on the nvkm side since we don't ha=
ve
> > > access to the drm_dp_aux structure there - which means that the DRM s=
ide of
> > > the driver and the NVKM side can end up with different DPCD capabilit=
ies
> > > for the same connector.
> > >
> > > Ideally to fix this, we want to start setting up the drm_dp_aux devic=
e in
> > > NVKM before we've made contact with the DRM side - which should be pr=
etty
> > > easy to accomplish (I'm already working on it!). Until then however, =
let's
> > > workaround this problem by porting a copy of drm_dp_read_dpcd_caps() =
into
> > > NVKM - which should fix this issue.
> > >
> > > Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211
> >
> > Should a Fixes: or Cc: stable tag be added so it gets backported?
>
> JFYI I think not adding one is fine nowadays? The stable bot seems to be
> pretty good at catching anything with the words fix/fixes in it
>

Yeah not sure.. I'd rather be specific and add it just to be sure.
Anyway, it could also be done while pushing. I think the bigger
question here was if this fix is good enough for stable or if you plan
to rework it.

> >
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 +++++++++++++++++=
+-
> > >  1 file changed, 47 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/=
gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > index 40c8ea43c42f..b8ac66b4a2c4 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > @@ -26,6 +26,8 @@
> > >  #include "head.h"
> > >  #include "ior.h"
> > >
> > > +#include <drm/display/drm_dp.h>
> > > +
> > >  #include <subdev/bios.h>
> > >  #include <subdev/bios/init.h>
> > >  #include <subdev/gpio.h>
> > > @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvkm_=
outp *outp)
> > >         return outp->dp.rates !=3D 0;
> > >  }
> > >
> > > +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_ca=
ps()
> >
> > Well.. maybe we should rephrase that _if_ we want to see it
> > backported. But is this code really that bad? It kinda looks
> > reasonable enough.
> >
> > > + * converted to work inside nvkm. This is a temporary holdover until=
 we start
> > > + * passing the drm_dp_aux device through NVKM
> > > + */
> > > +static int
> > > +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> > > +{
> > > +       struct nvkm_i2c_aux *aux =3D outp->dp.aux;
> > > +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> > > +       int ret;
> > > +
> > > +       ret =3D nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, DP=
_RECEIVER_CAP_SIZE);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       /*
> > > +        * Prior to DP1.3 the bit represented by
> > > +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > > +        * If it is set DP_DPCD_REV at 0000h could be at a value less=
 than
> > > +        * the true capability of the panel. The only way to check is=
 to
> > > +        * then compare 0000h and 2200h.
> > > +        */
> > > +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > > +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > > +               return 0;
> > > +
> > > +       ret =3D nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(dp=
cd_ext));
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > > +               OUTP_DBG(outp, "Extended DPCD rev less than base DPCD=
 rev (%d > %d)\n",
> > > +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DPCD=
_REV]);
> > > +               return 0;
> > > +       }
> > > +
> > > +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > > +               return 0;
> > > +
> > > +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  void
> > >  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
> > >  {
> > > @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool auxpw=
r)
> > >                         memset(outp->dp.lttpr, 0x00, sizeof(outp->dp.=
lttpr));
> > >                 }
> > >
> > > -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpc=
d, sizeof(outp->dp.dpcd))) {
> > > +               if (!nvkm_dp_read_dpcd_caps(outp)) {
> > >                         const u8 rates[] =3D { 0x1e, 0x14, 0x0a, 0x06=
, 0 };
> > >                         const u8 *rate;
> > >                         int rate_max;
> > > --
> > > 2.40.1
> > >
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

