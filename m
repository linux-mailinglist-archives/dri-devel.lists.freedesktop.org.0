Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD00B1E3D9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 09:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A626910E4DE;
	Fri,  8 Aug 2025 07:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bFEtJcNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE52510E4DE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 07:52:31 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3e523fb8a63so18307075ab.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Aug 2025 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754639551; x=1755244351; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMJPXbaBPXENRr4gR3xPaKVUyoNmc5Q3jFGAdG8Wanc=;
 b=bFEtJcNaPqrxOi2VCaJ6BgvLdO4sg9ClFR5qoGJNGSvfmORJU3FL+PNPvpDIbogRZS
 lb1qz2xnEJAOKLZke+jdLCp/kXeMZjy8Zi1jOCVvyTYfMqcMGjHmHwJ5tkQrZty1YxI6
 0o/ZYRiGhs8YFF/woEgGfkf2b9yQfsHtZ+Atg//fZd8EDMYpAwX77WXYsBjJHZO2LGLx
 KLaAAhMNQ98ilCVHi5TZUYObJqEvB9DK/QeRiNhrVVJR6ZHvEdnt5nW345iMgaZiNG0W
 AT7olgHrrRbV/jw7GEj5MWubbJWyD8CbKxBhpA2KEyhAPwOHuJj8i82dAMpDJT0AtHFO
 FomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754639551; x=1755244351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMJPXbaBPXENRr4gR3xPaKVUyoNmc5Q3jFGAdG8Wanc=;
 b=UpeLyz5l4kkhcwDO1hoKG6Qu2n/MhwvrBRwibXXd1n92J+eTWSRGUlbC6/oFrvEtAP
 zdK1KoDIInMlCDseAcNCJKrOeeCLj3R9VHS8w0M3IrZlWrZgiUw5ji/RohZwoRTd2I9Y
 wCdyZzDMbTgo8j8xxY5kmA1VpKTMJ4M/cbtLq8nKPjXGKRgx7sUGrwTGbsMYm0sFOXDl
 G9ivYqQ2IpG6RVgCFDK7aRzSYvtmdPXnyj55Xlk2IQhDX7lbXGYqsla5PtCPaWpyfJWC
 p9TQjqXqR9VFDR4UfiPb1towUpDwu+PpmhCJQj2MOxb0Mqfz2H01Dhc40ypP/gQeP6fY
 ZuQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkhsS3zlxKmHPC0fA4e/ItF85XjLF/apZgVmdLqWDgcIDvZxxhlRiAWfcZs0RFj+hscha5wB0z0Vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz92lXMP5Q0W4zuIku+8QKdaerWcbTUJU+Mz3HKhhxpzdg5wzjF
 Uwd/DqntVP+cEiQXpnRpM5FCb5MczHFkqjspLhCOojqstzifds8v1zrOLYop6H0+fyDLcoOzS0P
 Oqn6v8pDbs36gDTaKdqE9l66AzoCaCnU=
X-Gm-Gg: ASbGncvp204IPd0/j2IVNGAA96xtulQXCHWk8pe5BmhwwPqIx9pf29vcqglSPLKLs8a
 ZpshVm5/p+O5TsrfEVC9sANpeUlDym+Ihc73GjXD09qDcCm1AxbfnsIkudUPyHO6LYH5OpTk1Bh
 e/ewn5cNW16vn7h/4FtlJlhyLhtvHF/vpXPdeFVNVxu1AjG9DocklSx4gA/64FrTxWrmiNdHD+f
 hKzXQM=
X-Google-Smtp-Source: AGHT+IGSx/MWmNs4iG0YtuQTuuEGzoU+a805glrA7aVFmRpsmJJas6zm7UrtMxrzUkLnNImJh4LmO7qWL0oTSAGoO2Q=
X-Received: by 2002:a05:6e02:2143:b0:3e5:2aa3:e023 with SMTP id
 e9e14a558f8ab-3e5331a73famr38564065ab.18.1754639550620; Fri, 08 Aug 2025
 00:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
 <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
 <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
 <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
 <CAA+D8AMmQo=TgaJTubLL6xRp0NV3GpeE0JKwhBjmhZjtBnBQjA@mail.gmail.com>
 <0ee5fcbc-a553-4385-b930-b1a40693add5@nxp.com>
In-Reply-To: <0ee5fcbc-a553-4385-b930-b1a40693add5@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Aug 2025 15:52:16 +0800
X-Gm-Features: Ac12FXxZ7K99EU2WpMLSx8j0NsgdbwVE7AL7D4sJwRKCaSEutjkABFPrHX5i5vQ
Message-ID: <CAA+D8AO1GKF+615A8G5G6-LhfBguYOTTsPyh9i4PSf8eHC8VPg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
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

On Fri, Aug 8, 2025 at 3:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On 08/08/2025, Shengjiu Wang wrote:
> > On Fri, Aug 8, 2025 at 2:32=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wr=
ote:
> >>
> >> On 08/07/2025, Shengjiu Wang wrote:
> >>> On Wed, Aug 6, 2025 at 2:52=E2=80=AFPM Liu Ying <victor.liu@nxp.com> =
wrote:
> >>>>
> >>>> On 08/06/2025, Shengjiu Wang wrote:
> >>>>> On Tue, Aug 5, 2025 at 4:55=E2=80=AFPM Liu Ying <victor.liu@nxp.com=
> wrote:
> >>>>>>
> >>>>>> On 08/04/2025, Shengjiu Wang wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct devic=
e *master, void *data)
> >>>>>>> +{
> >>>>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_pla=
t_data *)data;
> >>>>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
> >>>>>>> +
> >>>>>>> +     hdmi_pai =3D dev_get_drvdata(dev);
> >>>>>>> +
> >>>>>>> +     plat_data->enable_audio =3D imx8mp_hdmi_pai_enable;
> >>>>>>> +     plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >>>>>>> +     plat_data->priv_audio =3D hdmi_pai;
> >>>>>>> +
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct de=
vice *master, void *data)
> >>>>>>> +{
> >>>>>>> +     struct dw_hdmi_plat_data *plat_data =3D (struct dw_hdmi_pla=
t_data *)data;
> >>>>>>> +
> >>>>>>> +     plat_data->enable_audio =3D NULL;
> >>>>>>> +     plat_data->disable_audio =3D NULL;
> >>>>>>> +     plat_data->priv_audio =3D NULL;
> >>>>>>
> >>>>>> Do you really need to set these ptrs to NULL?
> >>>>>
> >>>>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as condit=
ion.
> >>>>
> >>>> Note that this is all about tearing down components.
> >>>> If this is done properly as the below snippet of pseudo-code, then
> >>>> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() w=
on't be
> >>>> called after audio device is removed by dw_hdmi_remove().  So, it's =
unnecessary
> >>>> to set these pointers to NULL here.
> >>>>
> >>>> imx8mp_dw_hdmi_unbind()
> >>>> {
> >>>>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
> >>>>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
> >>>> }
> >>>>
> >>>> BTW, I suggest the below snippet[1] to bind components.
> >>>>
> >>>> imx8mp_dw_hdmi_bind()
> >>>> {
> >>>>    component_bind_all(); // imx8mp_hdmi_pai_bind()
> >>>>                          //   set pdata->{enable,disable}_audio
> >>>>    dw_hdmi_probe(); // hdmi->audio =3D platform_device_register_full=
(&pdevinfo);
> >>>> }
> >>>
> >>> Looks like we should use dw_hdmi_bind() here to make unbind -> bind w=
ork.
> >>
> >> I don't get your idea here.
> >>
> >> What are you trying to make work?
> >> Why dw_hdmi_probe() can't be used?
> >> How does dw_hdmi_bind() help here?
> >
> > bind() is ok.  but unbind(),  then bind() there is an issue.
> >
> >>
> >>> But can't get the encoder pointer.  the encoder pointer is from lcdif=
_drv.c,
> >>> the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, th=
en pvi,
> >>> then lcdif, because current implementation in lcdif and pvi driver.
> >>
> >> We use deferral probe to make sure the probe sequence is
> >> DW_HDMI -> PVI -> LCDIF.
> >>
> >> LCDIF driver would call devm_drm_of_get_bridge() to get the next bridg=
e PVI
> >> and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROB=
E_DEFER).
> >> Same to PVI driver, it would call of_drm_find_bridge() to get the next=
 bridge
> >> DW_HDMI and defers probe if needed.
> >
> > right, probe is no problem,  but after probe,  if unbind pai, hdmi_tx,
> >  then bind
> > them again,  there is a problem,  because no one call the
> > drm_bridge_attach() again.
>
> In my mind, this is a common issue as DRM bridges are not properly detach=
ed
> and attached again.
> For now, only drm_encoder_cleanup() calls drm_bridge_detach().
>
> Anyway, this issue is not introduced by this patch series, i.e. it's alre=
ady
> there.

Ok,  thanks for clarification.

best regards
shengjiu Wang
>
> >
> >>
> >>>
> >>> Should the lcdif and pvi driver be modified to use component helper?
> >>
> >> Why should they use component helper?
> >>
> >> BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK an=
d
> >> the components bind successfully:
> >
> > right, probe is no problem. but if try to unbind() then bind, there is =
issue.
>
> I don't think the DRM bridge detach/attach issue would be addressed by
> using component helper.
>
> >
> > best regards
> > shengjiu Wang
> >>
> >> cat /sys/kernel/debug/device_component/32fd8000.hdmi
> >> aggregate_device name                                            statu=
s
> >> ----------------------------------------------------------------------=
-
> >> 32fd8000.hdmi                                                     boun=
d
> >>
> >> device name                                                      statu=
s
> >> ----------------------------------------------------------------------=
-
> >> 32fc4800.audio-bridge                                             boun=
d
> >>
> >>> This seems out of the scope of this patch set.
> >>>
> >>> Best regards
> >>> Shengjiu Wang
> >>
> >> [...]
> >>
> >> --
> >> Regards,
> >> Liu Ying
>
>
> --
> Regards,
> Liu Ying
