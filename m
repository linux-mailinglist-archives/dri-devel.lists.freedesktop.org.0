Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE1587420
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 00:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0E01123C4;
	Mon,  1 Aug 2022 22:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9737112094
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 22:55:52 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oIeKC-0002CQ-Ll; Tue, 02 Aug 2022 00:55:48 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oIeK2-0003NF-Gx; Tue, 02 Aug 2022 00:55:38 +0200
Date: Tue, 2 Aug 2022 00:55:38 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: imx8mm lcdif->dsi->adv7535 no video, no errors
Message-ID: <20220801225538.qtdb5zd66g6ipewz@pengutronix.de>
References: <CAHCN7xJ=N1vWVTBjArskJ59fyaLzmAGWfc0E=_iGizrDNR_Udw@mail.gmail.com>
 <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5BAheG4r1Umnd7bLhOqezsxJgE0x1c-858EcabbpPm6Pg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, robert.chiras@nxp.com,
 laurentiu.palcu@nxp.com, NXP Linux Team <linux-imx@nxp.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Adam Ford <aford173@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio, Adam,

+Cc Marek, Robert, Laurentiu

On 22-08-01, Fabio Estevam wrote:
> Hi Adam,
> 
> On Sat, Jul 30, 2022 at 12:16 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > Hey all,
> >
> > I am trying to test Jagan's patch series [1] to add support for the
> > samsung dsim bridge which is used on the imx8mm to output DSI video.
> > The DSIM gets the video from the mxsfb, and in my case, the DSI is
> > sent to the adv7535 for connecting to HDMI.
> 
> I had to add some extra patches on top of Jagan's imx8mm-dsi-v3 to get
> HDMI output functional on a imx8mm-evk via ADV7535:
> 
> https://github.com/fabioestevam/kernel/commits/imx8mm-dsi-v3

You have a few interesting patches from Marek and Robert I didn't
noticed yet :)

Question is, does your setup work for all modes after applying your
patches and without using the NXP-downstream porches settings? We also
have a few patches in our queue for the porch calculation which we wanna
send as soon as possible as we verified our assumptions.

Regards,
  Marco
