Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0A675161
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B2010E9FC;
	Fri, 20 Jan 2023 09:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ECF10E9FC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:41:27 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pInth-0006vW-Qz; Fri, 20 Jan 2023 10:41:21 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pIntd-00064S-Gh; Fri, 20 Jan 2023 10:41:17 +0100
Date: Fri, 20 Jan 2023 10:41:17 +0100
From: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Subject: Re: [PATCH 1/3] drm/rockchip: lvds: add rk3568 support
Message-ID: <20230120094117.GM24755@pengutronix.de>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
 <20230119184807.171132-2-a1ba.omarov@gmail.com>
 <20230120091641.GL24755@pengutronix.de>
 <9fe2678da0ae10e6996889971a3137799a68c4b9.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fe2678da0ae10e6996889971a3137799a68c4b9.camel@siemens.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "pgwipeout@gmail.com" <pgwipeout@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frattaroli.nicolas@gmail.com" <frattaroli.nicolas@gmail.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "michael.riesch@wolfvision.net" <michael.riesch@wolfvision.net>,
 "macromorgan@hotmail.com" <macromorgan@hotmail.com>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "a1ba.omarov@gmail.com" <a1ba.omarov@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 09:31:43AM +0000, Sverdlin, Alexander wrote:
> Hello Sascha,
> 
> On Fri, 2023-01-20 at 10:16 +0100, Sascha Hauer wrote:
> > > +       /* Enable LVDS mode */
> > > +       return regmap_update_bits(lvds->grf, RK3568_GRF_VO_CON2,
> > > +                                 RK3568_LVDS0_MODE_EN(1),
> > > +                                 RK3568_LVDS0_MODE_EN(1));
> > 
> > Isn't this the same as:
> > 
> >         regmap_write(lvds->grf, RK3568_GRF_VO_CON2,
> > RK3568_LVDS0_MODE_EN(1));
> > 
> > Unless I am missing something I find a plain regmap_write() easier to
> > read.
> 
> the former is setting a bit in a RMW operation, the latter is a plain
> write, isn't it?

That's right from the view what the function itself does. Note the
registers that are accessed here are a bit special. They effectively
are 16bit wide, the upper 16bit contain a mask. Only the bits set in the
mask are actually modified in the lower bits. See the register bit
definitions:

#define HIWORD_UPDATE(v, h, l)  ((GENMASK(h, l) << 16) | ((v) << (l)))

#define   RK3568_LVDS0_SELECT(val)             HIWORD_UPDATE(val,  5, 4)

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
