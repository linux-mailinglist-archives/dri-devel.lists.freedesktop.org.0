Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id djfDEn5YfGkYMAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:06:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D67B7C50
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 08:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C591910E070;
	Fri, 30 Jan 2026 07:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hnl+qCiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F3110E070
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 07:06:32 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a1022dda33so11215715ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769756792; cv=none;
 d=google.com; s=arc-20240605;
 b=aesNySWZ7uh1XF8vBSROQdiHuiBps81RiiBS1h/aYGk9RRB85ZTkbNPosoBgXBgHjB
 vd+CNNqlZ9wNOM4uO5inMwbaN/CHiZQKHfck+q86ieuWsl85D9nJ6DZ7oBhXue1Qeqys
 /zT0xWWETX5ZpdJICc9JtQRpT9ofieCX6oxFRSmfr9Bak9Luxlne72aS7ac+KlKp7okj
 IaLJxGBqDkrwR/rTPsconGKD9XggMCZKIjHPyQ9zIH3r4BUpBfPanOKnzyLWKyaB1MRo
 hpXzskB4N88VuMfgFSKBp7TaoiE54HgJTITPsepfJt7Mu037Y3Nf48QAQOuiosfTP2t2
 F46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
 fh=xrfb7y4pmJcNBxb3Cwhe0AiByQ1dVqDki4jsIdeoh4U=;
 b=YMcWN4W9gE0O1LAyo/GHnQaJxQsfNbFQV63h/1pts1wfVgfxRHuKIz+hyXh9WmKNTt
 d5k+Tc5UprO2c+/CpuFQMiIUTJMlptj9y9Gv9Wle1RowVvwBrYDIecKnTUrWF+Od4r9O
 NplOtgyCGLACMfoZYdnNFuQWP3nzb7ysA7MNsr9aceTL6mQv74hL/FQAsTrSMVb5O42m
 S9vvYuYhrkAUhe/Tet+pJeFErqG0nYSaQr+rXsXMBgifBslYJHgRFoQHkm0fgqUilK3r
 emy9dGXL1Ld26Ag+KU8IePf2SNgeLcQumY4V3L/Bet2LauiE2RiyQ2XtnaOfQr6EFcrN
 4xyg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769756792; x=1770361592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
 b=hnl+qCiWBSlCXFniJXz8klaSCVVsT+3ezi2M46LnJIhtAeJclcV6yMhbUk5l9zVx7M
 6+nguZBDcMod2CS03qmFeRuSftJnVmQB3vJAKsRo0exPFVCYzhclKm0izR1yTr3N6JE3
 FG1F+2HzeCcHlUWdVzzXRuhtXpN78BNbIgJNCBqQPan3Y5LmMZXoJuukSBj59VXP4azO
 Gj+BR8lTckKCJl+vhfVqUUWLpEyoXMSGseQN47shFzPve6tTcLlV8q0OEnIbeXdYuHk/
 VD4wEf1mG1lCROhnABWr/CIKk1MstqtnY3sC2apWwq4UgueCJMGZj7r9y14KfDUwbRh2
 pafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769756792; x=1770361592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Uo3DwapbYo/p8IpFT3EwNhmFG0/Hf+3HnE+vfgf9grM=;
 b=DN+93FSieKttlZIJMsoenK/l2j5SXk1DiMROorYxWnA0IvsRHW+JoLolxTyGYmxFgf
 EJDxKSusJ3sPXlyMyvnRATEEUskHt4gfHGk2JB9/bxADhI8REL6ejOehJGBsGCowQu7W
 8TL3NiWFmCiuVR0wFMXlX/HaANy28z01geWKHNsHyHzZxdRxVbCdvS6JzCTxvSn5+zjb
 AS7V4DCPicTRIRpD1fSVo9RhnEC53ul4Ysquc5A5XTZdcIiH8FDYflbcEIRDlBfWVyPR
 Hyw107cTjjuzSGBTyLkfVvejOd+BGjYTewLlnMd44ctO+wYzuQkhnIALEBSkyUqehEXk
 PleA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn9EH+daamh6gK+v56FXKKmfHeZtJ4b1ujf67OcBvKUzjn1R+JWScsuuiLQ5+z96VcTntOntJ4C3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQsTgnmXFruBFmq8zOr6HEYnoU8iziQCgszrOv+ncAxFeeBXjV
 IK2Xt1dN/nX1EnHOlkMaqcU5KeJCIhhFb9m7rX1JPNpHV7+Eumj9d0PR1PAqSx+rwqi5HR5fEyR
 nugLbQEe9HC/gTows1LGWnUk4ZUS2vIw07g==
X-Gm-Gg: AZuq6aKvy768C18S2siEOOTpDh6v/KTXqkLsQ535zNRdR0/VJuWPeHS3Hc0evUrLnLA
 AsnzHjHungL5H2h7+QQJS6ByBKreXbovOrGI3awtF8w1GpFmQfw2c4pojdK6bTMvfOWUHT7csr4
 cvf8egj27GBWE+myKtWzH0UNaaYTV8Jv+TiaDV8I9dTqHCleaPPshyKrL+Q/NVYakyCfXaLJX3D
 Fc1xHhkrvIU2wixWDYBCwMk2aM1PsC/tkEaF4NoL+rjvzfql+fUrVsiOs/7HJXxj5VGX2r9Vlzu
 hHKO8w==
X-Received: by 2002:a17:903:a8f:b0:29e:bf76:2d91 with SMTP id
 d9443c01a7336-2a8d99285c3mr18452045ad.42.1769756792206; Thu, 29 Jan 2026
 23:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
 <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
In-Reply-To: <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 15:06:19 +0800
X-Gm-Features: AZwV_QiBIWwWZgjtPtAyNGJf1ZiVmzr03NeE_IXZ_qgHqkYVQtx8cbrwQilhH88
Message-ID: <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:shengjiu.wang@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shengjiuwang@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiuwang@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,mail.gmail.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 67D67B7C50
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 2:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> > There is an audio channel shift issue with multi channel case, first ru=
n
> > the channel order is correct, but second run the channel order is shift=
ed.
>
> Nit: I'd rephrase "There is an audio channel shift issue with multi chann=
el
> case - the channel order is correct for the first run, but the channel or=
der
> is shifted for the second run.".

Ok. will update.
>
> > The recovery method is to reset the pai interface.
>
> s/pai/PAI/

Ok.

>
> Can the channel order shift issue be fully fixed instead of implementing
> a "recovery method"?  I presume that this patch implements a recovery
> mechanism.  If it can't, any chip ERRATA?

Yes, it can be fully fixed by this patch. I will remove the "recovery" for
confusion.

>
> >
> > The reset can be handled by pm runtime, so add the pm runtime function.
>
> Nit: s/pm/PM/
>
> s/add the pm runtime function/enable PM runtime/

Ok.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
>
> Subject prefix should be "drm/bridge: imx8mp-hdmi-pai:".
> Refer to what previous commits for i.MX bridge drivers use.

Ok.
>
> >
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pai.c
> > index 8d13a35b206a..1afc729da9b9 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <drm/bridge/dw_hdmi.h>
> >  #include <sound/asoundef.h>
> > @@ -33,6 +34,7 @@
> >
> >  struct imx8mp_hdmi_pai {
> >       struct regmap   *regmap;
> > +     struct device   *dev;
> >  };
> >
> >  static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channe=
l,
> > @@ -43,6 +45,9 @@ static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw=
_hdmi, int channel,
> >       struct imx8mp_hdmi_pai *hdmi_pai =3D pdata->priv_audio;
> >       int val;
> >
> > +     if (pm_runtime_get_sync(hdmi_pai->dev) < 0)
>
> Use pm_runtime_resume_and_get instead.

Ok.
>
> -8<-
>   `int pm_runtime_get_sync(struct device *dev);`
>     - increment the device's usage counter, run pm_runtime_resume(dev) an=
d
>       return its result;
>       note that it does not drop the device's usage counter on errors, so
>       consider using pm_runtime_resume_and_get() instead of it, especiall=
y
>       if its return value is checked by the caller, as this is likely to
>       result in cleaner code.
> -8<-
>
> > +             return;
> > +
> >       /* PAI set control extended */
> >       val =3D  WTMK_HIGH(3) | WTMK_LOW(3);
> >       val |=3D NUM_CH(channel);
> > @@ -85,6 +90,8 @@ static void imx8mp_hdmi_pai_disable(struct dw_hdmi *d=
w_hdmi)
> >
> >       /* Stop PAI */
> >       regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> > +
> > +     pm_runtime_put_sync(hdmi_pai->dev);
> >  }
> >
> >  static const struct regmap_config imx8mp_hdmi_pai_regmap_config =3D {
> > @@ -101,6 +108,7 @@ static int imx8mp_hdmi_pai_bind(struct device *dev,=
 struct device *master, void
> >       struct imx8mp_hdmi_pai *hdmi_pai;
> >       struct resource *res;
> >       void __iomem *base;
> > +     int ret;
> >
> >       hdmi_pai =3D devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> >       if (!hdmi_pai)
> > @@ -121,6 +129,13 @@ static int imx8mp_hdmi_pai_bind(struct device *dev=
, struct device *master, void
> >       plat_data->disable_audio =3D imx8mp_hdmi_pai_disable;
> >       plat_data->priv_audio =3D hdmi_pai;
> >
> > +     hdmi_pai->dev =3D dev;
> > +     ret =3D devm_pm_runtime_enable(dev);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to enable pm runtime: %d\n", ret);
>
> s/pm/PM/

Ok. will update them.

best regards
Shengjiu Wang

>
> > +             return ret;
> > +     }
> > +
> >       return 0;
> >  }
> >
>
> --
> Regards,
> Liu Ying
>
