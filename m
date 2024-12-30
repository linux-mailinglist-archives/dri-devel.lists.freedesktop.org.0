Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E7F9FEBB7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 00:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2510E13B;
	Mon, 30 Dec 2024 23:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lMxsTGfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107D510E13B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 23:57:39 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso9637161e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 15:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735602997; x=1736207797; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=;
 b=lMxsTGfSt6Bsbnlgga16gMT/NFGnhq0AE/BXdikOSkEwWyDrpJuji2Cu2UKOvyrRAr
 /GYHDnMQMcmVPmD5sNlcCLuqbMsdUqB+R3Omk2oohcr37WWDCz6D1yK6R9KkwQThjY4l
 qEUy3OyJXRXEaJ9CQMnYwsYCwg9kslN6QdD7cXSptDD5JYtk2eIvO9FFMfzG4Rsn5MFm
 qu3JVUz7T3N9nZw/37eg5/Z9cAG2v78kIt15jL4EmQbL2ujzZGbDe/0OnqAQZs6HlcNQ
 73aLWjQolCeWDOcu/54NjqQT0Pp3QGmAi4q3j2rmjZTMkDp6/21FBm5GpQOEY9VbxEuK
 /8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735602997; x=1736207797;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgSsFPfNrF0K064VfRUL0BVQGngs40cUTxR9qhhxM0M=;
 b=eih19tLE8J+2gLfIdfugyYitSOAVzabMwfBae4l0f75kVT3MvamH8vvCNUG6flh82U
 maESVyLe3v3UrNMpkPsX0C5O6kEBPh14IxYCA8was2qLWEfK2QLd1CSaS/JlP3kF9jpn
 Dm/XPj8RwGAp+Z5DDf3YFZaYHrW0Hk/Ck2hkkgCcHb8NHz6uaCEPGX+tydhWCnbPy5nX
 rv3/NLIEx5FK7wUbBmLWRIr38pXYcuTjyBkN2IV9AxgYcW68p5DKVKRfsGUBwUEUn2+w
 HoTjuEsheRHjRtpAVcJf0UNTMby52kfIaa/cw04G+OSnlzFpy+vTkiX2/m3/rj9gPcry
 yT7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC9vFoJH15r5o39pl4YbqvhsbfCBT3HsbbTCyxZbQaKEkRluuf7R+0wrgllA9yAJutoXndwTRWt+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPji26qEe0Fwxl0WRmHHtY0SVGjZ720j5sll3/3cbNjLKZyqI0
 coUdMS+REpQNLSCRdJndTxUp8QpG8HVFF/MDyHaZftic4P9KxHFTX4zOQnDUlvCiW5hWLmyrwI5
 t
X-Gm-Gg: ASbGncsVb4xTSmAh66FvnODsEY7oLvzYjqOMLfy0m8oSheGQSvCKXfN0b5o4KnZ5psM
 lJqk6i5IAGe2S8QfJsWfg9SlITEXdIRl8b9NCdX+44BuzZ7nLwEALXUT0QtfjxYMbq8K//Mk83+
 ze/u4kTts1fr3G/7CrNIMJq8CSJPkvzoV8iMIF2B1sqmVhGyGU88cGfw/U2UUaTdbbo9R1JCpd1
 KTkBfw5jA9qUeppv7Kj7P6bh0SkTmVAngps0tM0wrXgaNGUXHO9AHXmHfSFYcQZGzEXBNMQ31hu
 Mxt8sQs5K6fARWy4LLONaXokVPFSpEaWFevx
X-Google-Smtp-Source: AGHT+IEeHkfQLid0m43pDVugqz/D47PZrbPya309ylG+zd7c0WjADbMWKNB1PQntPAXc5YF0mYnAwg==
X-Received: by 2002:a05:6512:2387:b0:542:2e04:edb4 with SMTP id
 2adb3069b0e04-5422e04f19fmr8697797e87.13.1735602498829; 
 Mon, 30 Dec 2024 15:48:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542236001d6sm3295240e87.85.2024.12.30.15.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 15:48:18 -0800 (PST)
Date: Tue, 31 Dec 2024 01:48:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: Ying Liu <victor.liu@nxp.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <z5so7ce7ufjrf4h7owoupimvo7qhdhqpd6ov7cjq4yoqvcmitg@2gdo2c222hfp>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
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

On Mon, Dec 30, 2024 at 10:44:25PM +0100, Marek Vasut wrote:
> On 12/30/24 8:04 AM, Ying Liu wrote:
> > On 12/26/2024, Marek Vasut wrote:
> > > On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> > > > > The dw-hdmi output_port is set to 1 in order to look for a connector
> > > > > next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
> > > working.
> > > > > The output_port set to 1 makes the DW HDMI driver core look up the
> > > > > next bridge in DT, where the next bridge is often the hdmi-connector .
> > > > > 
> > > > > Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> > > > > 
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > ---
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > > Cc: Liu Ying <victor.liu@nxp.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > > Cc: Robert Foss <rfoss@kernel.org>
> > > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > Cc: Stefan Agner <stefan@agner.ch>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Cc: imx@lists.linux.dev
> > > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > > ---
> > > > > V2: No change
> > > > > ---
> > > > >    drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
> > > > >    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
> > > > >    2 files changed, 2 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > > b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > index 9a480c6abb856..d8e9fbf75edbb 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > > @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
> > > > >    config DRM_IMX8MP_HDMI_PVI
> > > > >    	tristate "Freescale i.MX8MP HDMI PVI bridge support"
> > > > >    	depends on OF
> > > > > +	select DRM_DISPLAY_CONNECTOR
> > > > >    	help
> > > > >    	  Choose this to enable support for the internal HDMI TX Parallel
> > > > >    	  Video Interface found on the Freescale i.MX8MP SoC.
> > > > > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > index 1e7a789ec2890..4ebae5ad072ad 100644
> > > > > --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> > > > > @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
> > > platform_device *pdev)
> > > > >    	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
> > > > >    	plat_data->priv_data = hdmi;
> > > > >    	plat_data->phy_force_vendor = true;
> > > > > +	plat_data->output_port = 1;
> > > > 
> > > > Quoting my feedback to a similar Liu's patch:
> > > > 
> > > > This will break compatibility with older DT files, which don't have
> > > > output port. I think you need to add output_port_optional flag to
> > > > dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
> > > > is set, but there is no remote node.
> > > Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
> > > support is commit:
> > > 
> > > 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
> > > TQMa8MPxL/MBa8MPxL")
> > > 
> > > That already contains the HDMI connector node. Every follow up addition
> > > of HDMI to another device has been a copy of the same commit, with
> > > connector, so I think it is safe to say, no upstream DT is going to be
> > > broken by this change. Do we care about hypothetical downstream DTs
> > > which may be missing the connector ?
> > 
> > These have no HDMI connector nodes:
> > arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> > arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> > arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> > arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
> Huh, I missed those, thanks.
> 
> Would it be OK with you to fix those DTs up and add the missing connector,
> rather than introduce some optional port workaround for them ?

I can't say for iMX8 particularly, but usually we try to keep backwards
compatibility, as DT can be coming from device vendors. So, I'd say, we
need both, the fixed DTS and the workaround.

-- 
With best wishes
Dmitry
