Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73F75813E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB9E10E380;
	Tue, 18 Jul 2023 15:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB4410E37E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=SPDU5kPWAAgPJ4oaKrt1JSYg4VjyFkkAo26/4HsJa04=;
 b=dLsM4dKkdPGEHfWhE3vOWnFlgqVcbUyXZFIoRiB/sV84rIprOtRr96GG5UiY7rQPW2Ga+rHh+MiZm
 OGndJTN+MK6X0+EncQLeUWmTInpQOJALijDi8u7SecoAqs+Nd5Sx6EhoSt1Xus1NTKsfKw/a6kCQNT
 8dfK+wUCKqBJLVM1AMgGxEIhOZU6HT1HuzvQUlcbBfhTq9aTbimXYpbC4tLA6ZZsY871YPtEgk4pYY
 /advwv9+3ZzFLVjfrKdDKRoRb2pk3cMIwlOD7koEju4ysS7pFM/8q64GJXrGTsazm1+EfEJwccSxUD
 LkEQHA4RNjKEvAf/fNbe47i7J1S0YqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=SPDU5kPWAAgPJ4oaKrt1JSYg4VjyFkkAo26/4HsJa04=;
 b=D8EVbIV6H9KKEcuAqA4UX2ud8rTkGapXb7xDfioVd2x2qEvtJTYdzfwETPQFuaCb0ZyBBXolk6RU2
 ejcFqvTAA==
X-HalOne-ID: 4bc5dc98-2582-11ee-b1c1-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 4bc5dc98-2582-11ee-b1c1-6f01c1d0a443;
 Tue, 18 Jul 2023 15:46:45 +0000 (UTC)
Date: Tue, 18 Jul 2023 17:46:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Message-ID: <20230718154644.GD688726@ravnborg.org>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
 <3174425.5fSG56mABF@steina-w>
 <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB7051324184846E6206E495BF9838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, dl-linux-imx <linux-imx@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ying Liu,

On Tue, Jul 18, 2023 at 09:00:25AM +0000, Ying Liu wrote:
> > > +   if (IS_ERR(dsi->regmap)) {
> > > +           ret = PTR_ERR(dsi->regmap);
> > > +           DRM_DEV_ERROR(dev, "failed to get block ctrl regmap:
> > %d\n", ret);
> >
> > Could you use dev_err_probe here instead?
> 
> Maybe, it's better to keep using DRM_DEV_ERROR to achieve consistent
> error log format across the driver which is implemented in drm_dev_printk().
> I see other DRM drivers do the same.

All the DRM_* macros are deprecated.
New code shall use drm_*, dev_* or pr_ as appropriate.

The appropriate variant here is dev_err_probe().

	Sam
