Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D509FB842
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF34610E355;
	Tue, 24 Dec 2024 01:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ytfh6bPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2A610E355
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:26:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53f757134cdso5207365e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735003567; x=1735608367; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=;
 b=Ytfh6bPK38uixXOUzGrbfNoMcuW0/utnSE4tb0DME159y7j8DuYFGijMrXJxuSCIFs
 wrvexbBlb/ZDIAEBOMUFO/cINzinydGm2Xqv+aXh6HWc6D7TTasHt+/ry97TPG7H1aMA
 0jIVtAUwAaMIlAPdeySRLk23lz9yFhBnXHAeCNZ96brEUNw3OuRcoIPzYL8HNx0fDtha
 aw4Zlp5Pstk03sYhITLAT1LeUX0O/PLWlcI3N8JJ/GP80W3aFU2bhlLHlbs+raSMBj5A
 YnpOaHc7/mJ7kj/+PMS645ooZjgxLHlVllBsVPJqUe9wfiEd9jEPL5IDjHXMnDde/fQE
 0XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735003567; x=1735608367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOF8DK/NkDs2L91eWGo0OJRjfjJdjQA+q8dHhp2WoGY=;
 b=N/WqGVPMqZ+47edBOMCHmagbxv4DQMHZwKtJl6kIUNK4r61W7XV7HXrabBnXujVfhp
 JMVVdcwaNwfKbDYlfpCkZ45UmBicXuNVF+bSb3i62/oTsX6BjyOoM8AJDzNM2UuIwdUY
 pVzRCvqVEO27Bf7ViSYFDX8H1QJ5TM4bpo7EFNMKR4PTU8ndShKjVj64t11wgtRlAqvH
 jhtTDShxWvP8mNQrCl+YJDVrk/3EX2JBSR1B7eMOfjZ7WuYzPmfWHcSwhr9yddoAr+wr
 siKNCr5YiwOU00UH19a7pV839Wc1H8Give9MdgG4kQkMWQ97cR8+DWSK2Daa8mTedHYw
 B2WQ==
X-Gm-Message-State: AOJu0YzsdkRGc9C3adQwGoWZYm32XaAYnY0lcRfBnTh8x7x/rOJm+Hb6
 nXm2utbPM4+bMhjKsG1xpFLyo6nfmjTXvM6961DmW9g5jt1G15NrXpPjAeEzrdE=
X-Gm-Gg: ASbGncv717T6VNpieHCOtD9IK1DetknStMKW6wPSXIhDUSBG6fF41R7F/TcGbx19xWs
 iH1ndfsCsHnXosgcOL9k3bI5che9JzZyJ5B8yAmdFOL1KV1VC75zs94NQ+vq+gzS3zCnS8RBlKH
 DpbUgIi+8ItA0R9BdXXpHv9gIX9w1hBmIzlhqOSNLHJTycfk7/ULnNw4jEBuZoXFrUKwL9zrhfj
 wQ6dn7PVzP53NPFy8iSSbosc6WORu8slRgvIaXYl6iFXe9KamQnamYWQ049dx8ntzaJoPhTtTPH
 unK8NvQ2Dsl3IpexYtrbEanDuQiJh6/ofyfp
X-Google-Smtp-Source: AGHT+IFhha2IAymEp/0LSPoMPL8Vz0jJeIdZsjQiJTabJykmywUV1yX1xHj6Mzyxbed2Ac1pnbLlDA==
X-Received: by 2002:a05:6512:239b:b0:53e:44a4:34e0 with SMTP id
 2adb3069b0e04-5422953306amr5601701e87.16.1735003566780; 
 Mon, 23 Dec 2024 17:26:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832089sm1462892e87.268.2024.12.23.17.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:26:05 -0800 (PST)
Date: Tue, 24 Dec 2024 03:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <6fildsf62t6mj4wg7fqq5m7biuvp7lums5n3wszqyl5f4wfdxl@2ij3i2bhse32>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-2-marex@denx.de>
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

On Tue, Dec 24, 2024 at 01:42:48AM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Also please note the series at [1]. Since that time we got ycbcr420
handled properly, but handling the HDR should require DRM_BRIDGE_OP_HDMI
at least.

[1] https://lore.kernel.org/dri-devel/20241018064813.2750016-1-victor.liu@nxp.com/

-- 
With best wishes
Dmitry
