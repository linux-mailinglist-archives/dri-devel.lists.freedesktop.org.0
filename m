Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110C74A56EE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 06:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192210E691;
	Tue,  1 Feb 2022 05:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432D010E687
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 05:28:32 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nEliH-0006tQ-8O; Tue, 01 Feb 2022 06:28:21 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1nEliG-00086s-KO; Tue, 01 Feb 2022 06:28:20 +0100
Date: Tue, 1 Feb 2022 06:28:20 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/5] ARM: dts: imx6qdl-vicut1: add CAN termination
 support
Message-ID: <20220201052820.GB29389@pengutronix.de>
References: <20220131102841.1955032-1-o.rempel@pengutronix.de>
 <20220131102841.1955032-4-o.rempel@pengutronix.de>
 <YfgCmNgvx7pwpBFV@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YfgCmNgvx7pwpBFV@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:27:06 up 52 days, 14:12, 47 users,  load average: 0.14, 0.10, 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Robin van der Gracht <robin@protonic.nl>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 04:39:04PM +0100, Sam Ravnborg wrote:
> On Mon, Jan 31, 2022 at 11:28:39AM +0100, Oleksij Rempel wrote:
> > The gpio1 0 pin is controlling CAN termination, not USB H1 VBUS. So,
> > remove wrong regulator and assign this gpio to new DT CAN termnation
>                                                             termination   
> > property.
> > 
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> I should be the last person to correct spelling mistakes, my commits
> are always full of them - sigh.

Thx! :)

@Shawn, should I resend this patch set with fixed typo?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
