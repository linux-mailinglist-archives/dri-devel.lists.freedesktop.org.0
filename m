Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F01B1D38E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936BE10E7F6;
	Thu,  7 Aug 2025 07:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="etu0XMXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E391710E7F6
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 07:42:53 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3e40212e6ceso3544965ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552573; x=1755157373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=;
 b=etu0XMXLLP7eYCYFDL+e5ZNxraX3lEHFZP9U33XoHhKh08hlDOlSdfFtyT7BrMmVOI
 Mk3ByU53xPApZwL9wRGT02fwO3sfaDKatlx5Mp6js3OOB6ZuhvOHBUAdO4oNLrTFg5W4
 30JyaoVglddYfhn3KOAGA8U3gNUHpJauMaM0xskpY3dtdQU4zMRSm+x4611kL87IhVBx
 B0QLPhqZSU4fU+UjAz/TGBA7NL7JCkBnxPmvQNrjeftTillX6i9VmoPxl7VMSGX/Fv9c
 Q0IFSN9YQFA+aQ9yxbFNHEFRwgkjBJ4vIxFvnFmycB0KNtoKXE6Kb1A+cpeRP2HaFWwJ
 txqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552573; x=1755157373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Yib2PCEaqNp1Pj8TAlHvoEegTED9u37QcVhIiDH6gc=;
 b=UOBxijiUxCHeK/nJHax0j0bnpmyAZMxovO8EwqyozlaYhyolzWQOplcKXZfZToIIhK
 9MuWOJ9qpmmV9544Iv6mgt2hF37sstWWrB87DlU8OCrNtlYtkr8b2Cctu+EWjPIouUg2
 ZNCNpnaQFH5P3Vu+P/tIoyMGJ/qeIvC3mMFNLV/lTpKeNopbOl4ol5WTFTN6md64bN85
 cfjBRUhlxe3NRXEABMNYDgsioBcTpRkIf3kd6/RVIe1pZawUz8XGfG8Y2CGyUr4KVrej
 c0FvSLzyq/FrFdB0DfgCC6L5F/ivO1QXENkwJjaVF8iR8pk7nTUtpSV/EK/cdD7gWa/w
 EruQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxPsRV9kX69yqKjxPsMbtw5LRAhHfj/4vEetgQuAuB5sW2bY9xixI45CYt0PL3tgcRmYkcsVJdFiQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHfFjJ5Ka/SKiMI+5QhF0mbipihvj2IGgP+vftXMddah8P6Gku
 4FEaicwlUiPEGOiQKkGSCpPm7w1kyX32PVgl6ugKgRczZ993CzPtSPXk31IfxYqd6mSHqLJ3DOM
 NebwIeVyjfm34FhgjR9zpzmdDjhkPwxc=
X-Gm-Gg: ASbGnct6a4c2EURXxHWQLsBgJzuD8nJSEaqJZN8iFr7dPpqWWWcqHZMDNAhFt7CbUoa
 o5ss3/fAnQeokOJf0inVvtCD8glecX4KLuo68wgGRjChJMkTBisP3A+XVIfgs0VsKevnFc8g04S
 cigHlbEKJz1wb0izVM2BHLrEaqcFclav/pnzhxV2dFy3UEu71+DnEv7II+tbs+Hg7Yl6eQUQxx5
 QuynC4=
X-Google-Smtp-Source: AGHT+IHdqQFtfjRtDehIGRFADkvBaA4NvCzKMcHYFjCPCJ2UEYMmg8NkMVh8psgCR7M3BrtP7IfXADIqspKMXA8NOUE=
X-Received: by 2002:a05:6e02:3f08:b0:3e3:f1e9:635f with SMTP id
 e9e14a558f8ab-3e51b8985cdmr117142635ab.8.1754552572965; Thu, 07 Aug 2025
 00:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <2380862.ElGaqSPkdT@steina-w>
 <CAA+D8AMqBqfRuR7oGLwH4CUrAdY4q1XGmnPXGQYUGndY0eS=yw@mail.gmail.com>
 <3006103.e9J7NaK4W3@steina-w>
In-Reply-To: <3006103.e9J7NaK4W3@steina-w>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 7 Aug 2025 15:42:40 +0800
X-Gm-Features: Ac12FXyRnD4EHNKIjcnFtD3LudiK7-g39dWsOJVNfZbpF_BspGvpp8foyFbcxgc
Message-ID: <CAA+D8ANb_9GQTGCV0c5y517aSbQNnAu4wYvDhc4QPd+RqOhjbQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
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

On Thu, Aug 7, 2025 at 2:48=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Mittwoch, 6. August 2025, 05:49:13 CEST schrieb Shengjiu Wang:
> > On Tue, Aug 5, 2025 at 3:09=E2=80=AFPM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > [snip]
> > > > +static int imx8mp_dw_hdmi_bind(struct device *dev)
> > > > +{
> > > > +     struct dw_hdmi_plat_data *plat_data;
> > > > +     struct imx8mp_hdmi *hdmi;
> > > > +     int ret;
> > > > +
> > > > +     hdmi =3D dev_get_drvdata(dev);
> > > > +     plat_data =3D &hdmi->plat_data;
> > > > +
> > > > +     ret =3D component_bind_all(dev, plat_data);
> > >
> > > Do you really need plat_data variable?
> >
> > yes,  it is used in imx8mp_hdmi_pai_bind()
>
> Sorry for not being clear. I'm not talking about struct dw_hdmi_plat_data=
, but
> the local variable plat_data. You can use
>
> ret =3D component_bind_all(dev, &hdmi->plat_data);
>
> directly.

Ok,  will update the code.

>
> >
> > >
> > > > +     if (ret)
> > > > +             return dev_err_probe(dev, ret, "component_bind_all fa=
iled!\n");
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> > > > +{
> > > > +     struct dw_hdmi_plat_data *plat_data;
> > > > +     struct imx8mp_hdmi *hdmi;
> > > > +
> > > > +     hdmi =3D dev_get_drvdata(dev);
> > > > +     plat_data =3D &hdmi->plat_data;
> > > > +
> > > > +     component_unbind_all(dev, plat_data);
> > >
> > > Do you really need plat_data variable?
> >
> > yes,  it is used by imx8mp_hdmi_pai_unbind()
>
> Same as above. Call
>
> component_unbind_all(dev, &hdmi->plat_data)
>
> directly. Also consider assigning struct imx8mp_hdmi *hdmi =3D dev_get_dr=
vdata(dev);
> directly.

Ok,  will update the code. Thanks.

Best regards
Shengjiu Wang
>
> Best regards,
> Alexander
>
> >
> > >
> > > > +}
> > > > +
> > > > +static const struct component_master_ops imx8mp_dw_hdmi_ops =3D {
> > > > +     .bind   =3D imx8mp_dw_hdmi_bind,
> > > > +     .unbind =3D imx8mp_dw_hdmi_unbind,
> > > > +};
> > > > +
> > > >  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
> > > >  {
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct dw_hdmi_plat_data *plat_data;
> > > > +     struct component_match *match;
> > >
> > > Set match =3D NULL for drm_of_component_match_add (and subcalls) to a=
llocate memory.
> >
> > Ok.
> >
> > best regards
> > Shengjiu wang.
> > >
> > > Best regards
> > > Alexander
> > >
> > > > +     struct device_node *remote;
> > > >       struct imx8mp_hdmi *hdmi;
> > > > +     int ret;
> > > >
> > > >       hdmi =3D devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> > > >       if (!hdmi)
> > > > @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platfor=
m_device *pdev)
> > > >
> > > >       platform_set_drvdata(pdev, hdmi);
> > > >
> > > > +     /* port@2 is for hdmi_pai device */
> > > > +     remote =3D of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> > > > +     if (remote && of_device_is_available(remote)) {
> > > > +             drm_of_component_match_add(dev, &match, component_com=
pare_of, remote);
> > > > +
> > > > +             of_node_put(remote);
> > > > +
> > > > +             ret =3D component_master_add_with_match(dev, &imx8mp_=
dw_hdmi_ops, match);
> > > > +             if (ret)
> > > > +                     dev_warn(dev, "Unable to register aggregate d=
river\n");
> > > > +             /*
> > > > +              * This audio function is optional for avoid blocking=
 display.
> > > > +              * So just print warning message and no error is retu=
rned.
> > > > +              */
> > > > +     }
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platfo=
rm_device *pdev)
> > > >  {
> > > >       struct imx8mp_hdmi *hdmi =3D platform_get_drvdata(pdev);
> > > >
> > > > +     component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> > > > +
> > > >       dw_hdmi_remove(hdmi->dw_hdmi);
> > > >  }
> > > >
> > > > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_h=
dmi.h
> > > > index 095cdd9b7424..336f062e1f9d 100644
> > > > --- a/include/drm/bridge/dw_hdmi.h
> > > > +++ b/include/drm/bridge/dw_hdmi.h
> > > > @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
> > > >                                          const struct drm_display_i=
nfo *info,
> > > >                                          const struct drm_display_m=
ode *mode);
> > > >
> > > > +     /*
> > > > +      * priv_audio is specially used for additional audio device t=
o get
> > > > +      * driver data through this dw_hdmi_plat_data.
> > > > +      */
> > > > +     void *priv_audio;
> > > > +
> > > >       /* Platform-specific audio enable/disable (optional) */
> > > >       void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
> > > >                            int width, int rate, int non_pcm, int ie=
c958);
> > > >
> > >
> > >
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > http://www.tq-group.com/
> > >
> > >
> >
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
