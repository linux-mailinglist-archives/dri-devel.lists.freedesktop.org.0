Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443A6A9CBD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 18:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912FE10E70D;
	Fri,  3 Mar 2023 17:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1C710E709
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 17:07:09 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3887AFF807;
 Fri,  3 Mar 2023 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1677863226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTe5qmwmI4dkolin3VVPDpEbc3GqIs/eFgYcLavf1DA=;
 b=Gqtn1sKlA+OKkK2TeyVoB2QZr3gvoxxTIZv6t+ULpNvR2GDuZPGLQJINmqXuBEdbtkvQkH
 8hge5946OOJ49N6t0Qjtne4vzNWBDLYtmm1Yu/QlVI+HA1NyiL/YA6gzLY85nW3eKHjtx6
 X4djE3XQ5bowHaget78lEFcUEVaFXu/k2O5OT5ZFcMtzeP0Ws0CqLMfjXL9q9WKnU3dYOc
 ik4i+MY0hWBtdRA6mi8WZA8eIMqA50y5ffYhhr2FOWN2jFO7WTyf9u03KU0l6jE8n/GHmH
 iiYYkcZ4aPVzSM10eolUzVtaOGR/cjRxoU0k57CEJ+jY8L+hiX/T9SwEpSWDjg==
Date: Fri, 3 Mar 2023 18:07:02 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/4] drm/imx: add bridge wrapper driver for i.MX8MP DWC
 HDMI
Message-ID: <20230303180702.766423d5@booty>
In-Reply-To: <20220826192424.3216734-2-l.stach@pengutronix.de>
References: <20220826192424.3216734-1-l.stach@pengutronix.de>
 <20220826192424.3216734-2-l.stach@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, patchwork-lst@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Aug 2022 21:24:22 +0200
Lucas Stach <l.stach@pengutronix.de> wrote:

> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Marek Vasut <marex@denx.de>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
