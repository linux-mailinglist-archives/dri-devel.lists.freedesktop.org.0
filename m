Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE0788542
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 12:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26D110E129;
	Fri, 25 Aug 2023 10:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF4610E129
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 10:57:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22CB96BE;
 Fri, 25 Aug 2023 12:56:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692960982;
 bh=zoR0YokBKd/MGU58llzov4Yik2E+HryM2YY+WoItA3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qq3vhOHIxOAmD5d13i8ALukwYD2OIjvNyC0KPrdnFNPvgI7IixIBMIjl8E0KYf2Zy
 H5NKVwgc8Yhtv+VjeZXlwznuyI57Fu7j6RULHvYNWm4Ml/+3GZs7LIG+Mo4fKLhhNU
 owhEabgOkzb80wHtE2C9fDhMqft1ji8DkzlZHIz8=
Date: Fri, 25 Aug 2023 13:57:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <20230825105748.GE14596@pendragon.ideasonboard.com>
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
 <20230824182609.GA6477@pendragon.ideasonboard.com>
 <CAHp75VeK_0MnPtku7W6_ZDUWBTOFgmFZiwnOcnGgiVzbeU6FKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeK_0MnPtku7W6_ZDUWBTOFgmFZiwnOcnGgiVzbeU6FKQ@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 06:48:45AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 24, 2023 at 9:26 PM Laurent Pinchart wrote:
> > On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> 
> ...
> 
> > I wonder, as the device can only be instantiated from OF, should we add
> >
> >         depends on OF
> 
> Generally speaking this is a bad idea. It prevents a component from
> being instantiated on ACPI based systems (even if there is no ACPI ID
> table, due to a gateway called PRP0001).

I'd be surprised if there were systems were that would work out of the
box for this particular driver, so we could always drop the dependency
when someone updates the driver to work on ACPI-based systems. I'm
however not pushing to add the dependency though.

> > to Kconfig, and drop the
> >
> > #if IS_ENABLED(CONFIG_OF)
> >
> > from the driver ?
> 
> Contrary this is an idea I fully support!
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
Regards,

Laurent Pinchart
