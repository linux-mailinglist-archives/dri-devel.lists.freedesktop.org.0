Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B578BFA9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4A10E0A1;
	Tue, 29 Aug 2023 07:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B857710E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:51:38 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qatVf-0000oC-HJ; Tue, 29 Aug 2023 09:51:35 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1qatVe-0003qb-Ea; Tue, 29 Aug 2023 09:51:34 +0200
Date: Tue, 29 Aug 2023 09:51:34 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: samsung-dsim: adjust porches by rounding
 up
Message-ID: <20230829075134.GG17387@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-4-b39716db6b7a@pengutronix.de>
 <CAOMZO5AFEDMT1de2O2sUUuw8E0ZRCyD4QVVCKxAtfRaisU5gVw@mail.gmail.com>
 <CAHCN7xLuzWk53dTOM_ySVTGuqNZwCXDiZ236CXavyjSKZp-sRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLuzWk53dTOM_ySVTGuqNZwCXDiZ236CXavyjSKZp-sRA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Aug 2023 17:39:03 -0500, Adam Ford wrote:
> On Mon, Aug 28, 2023 at 1:26 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi Michael,
> >
> > On Mon, Aug 28, 2023 at 12:59 PM Michael Tretter
> > <m.tretter@pengutronix.de> wrote:
> > >
> > > The porches must be rounded up to make the samsung-dsim work.
> 
> ...at some resolutions and refresh rates.

I will rephrase the commit message in a v2 and list the resolutions and
refresh rates that were fixed in my test.

Michael

> 
> >
> > The commit log could be improved here.
> >
> > The way it is written gives the impression that samsung-dsim does not
> > work currently.
> 
> This is a big improvement in the number of resolutions and refresh rates.
> 
> Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
> Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
> 
