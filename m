Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D9B0BF49
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7694910E49E;
	Mon, 21 Jul 2025 08:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ba2z7pnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE2310E244
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:24:39 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-879c214fe6dso100193339f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753068279; x=1753673079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=;
 b=Ba2z7pnhlrVw823VvlACf1uY6mXiGZoC6terPU4M5b6SjhgltDXdfJwid+Uq/o/83R
 3W4csCNNLay5s7AWwNuQUq67pdVXnuBvklJqp3mqEb3GQ4Wq2yLV6DoBHV401iU6wLor
 cOpkqU/KkYKhhDo2KMYfbX3r9MqtVlRhc/G1QZpq6UJVj2A10ZcPuNV2lZxC4rvHdafe
 TdFYDX/kRtTD98SyPf6pI3ajm7IqwaXIvwZ8P6uw9noF4wYE9IpvmALoGm51Ct3+HuPm
 vFBcQiLmvNiCbbDH4bJfP8yZfB39waw5b/SBQ0npDL968JOhq2CAMcJ/xPhSvkhlxraK
 xG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753068279; x=1753673079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OwI2hpcy3lcVV+QnTniw+hVEeGQWL5HMOKObyfZtgEM=;
 b=dgd/NhrJtjt8KY36orqWvxAJ97cM8Ma5y/IIUeSb+pzrITFkOM9719eTuARBR1qxk/
 VzEE9xXz4PoF54v2Nuhn9EmwmMWUHjfAnabzanHIURHXUaPjPlfsmlmm5Sa+6vsfnaZw
 jDSnGRzbxZYXlkD9JTiPCo3VkQSg5yZ6yQwFdKOJarA0H4ORI+RdGB16EH48PlGvkNf2
 f9f+0frAghggiv5R9l5302zn5IlZfw03ucx/lhnNOnUdnv+64bg0Q57yC14tj2QamZbm
 9x7ETR9p8AkqPPfnh34ufMbGMlEC9vCFHFWqtM7jBg98DqMhWA3BEiaT6sWay5VqxhHf
 Et8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrI6rXyFpUoOZjWKmBD6VM6gqNN/pzJFSmqJzp9TuMWqqESIW2PQilZ+n6yR65zuE4mzJqlTsHE4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJmMucCZBpQ8u9wztOSDg+0CMMF9EEWISxCJDR/rCqg+UoUp3B
 r3pbBW/wd+4T0X51KDdt3r7gifDawUCss6PEqjG1k1SQ58x7yf3cXopTbeXIm6iVxy1+cqPukKK
 1zZ3fk5MPoMGz7+eyU0ug9m6yipaUFYs=
X-Gm-Gg: ASbGncs04GkypD4Pu2nQ9pcZqojUOfVxby/gK8Ty6mbOp2ncGLLwZUi6SJP09oMIbbv
 L4we8sEpa5TLh9hWhoZkUbV2FBQ2eOodL5KRhnz7MuHakw+wMD2RnRM+WNq5trVWxSuQhW3eeHF
 Zxz1WvBHNsP6tqUdWOxZVB2B4zZ6gf2s2y6gD0kzHu8tWecyybUc8e9qvVLqkFVfn+jBHGrPIhE
 9DNox0=
X-Google-Smtp-Source: AGHT+IEc4eCE70WDmGsnRlEEKfMnJZ+xtO+dDhCQVQfDpz+1aJdPRzDCoXXMD8/WnfPbQf13oi/XE9aCmcR1NPGUpLY=
X-Received: by 2002:a05:6e02:2582:b0:3df:2f47:dc21 with SMTP id
 e9e14a558f8ab-3e282f5547amr213949295ab.22.1753068278812; Sun, 20 Jul 2025
 20:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-2-shengjiu.wang@nxp.com>
 <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
In-Reply-To: <aHpzElP09pEOi4id@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 11:24:23 +0800
X-Gm-Features: Ac12FXy5bUMTlHGaq7PpDN0ZSeNbIlr9FhbAx0Aren2E8HjpPRhVBNLuNDI2CRQ
Message-ID: <CAA+D8AOQ9v_qCHecfL1brXUJgpA3UjdDq-O3J9udQzp2xm3J9w@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: dw-hdmi: Add function to get plat_data
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
 l.stach@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 21 Jul 2025 08:45:46 +0000
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

On Sat, Jul 19, 2025 at 12:15=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Jul 18, 2025 at 06:11:47PM +0800, Shengjiu Wang wrote:
> > The enable_audio() and disable_audio() callback pointers are in
> > plat_data structure, and the audio device driver needs to get plat_data
> > for assign these pointers. So add a function to export plat_data
> > structure.
>
> drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>
> Add API dw_hdmi_to_plat_data() to fetch plat_data because audo device
> driver needs it to enabe(disable)_audio().

Thanks for comments.  will update it to the next version.

best regards
Shengjiu Wang
>
> Frank
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
> >  include/drm/bridge/dw_hdmi.h              | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> > index 76c6570e2a85..3dfa42178f6c 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -198,6 +198,12 @@ struct dw_hdmi {
> >       enum drm_connector_status last_connector_result;
> >  };
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi)
> > +{
> > +     return hdmi->plat_data;
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_to_plat_data);
> > +
> >  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> >       (HDMI_IH_PHY_STAT0_RX_SENSE0 | HDMI_IH_PHY_STAT0_RX_SENSE1 | \
> >        HDMI_IH_PHY_STAT0_RX_SENSE2 | HDMI_IH_PHY_STAT0_RX_SENSE3)
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.=
h
> > index 6a46baa0737c..a56a3519a22a 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -208,4 +208,5 @@ void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, vo=
id *data);
> >
> >  bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
> >
> > +const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *h=
dmi);
> >  #endif /* __IMX_HDMI_H__ */
> > --
> > 2.34.1
> >
