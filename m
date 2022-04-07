Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CCD4F7C23
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A11110E068;
	Thu,  7 Apr 2022 09:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFA610E068
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:47:37 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncOjo-0007h2-DP; Thu, 07 Apr 2022 11:47:36 +0200
Message-ID: <ef4d8f36a16edda8abf9b6d818cd17f15b0b67cf.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/7] drm: mxsfb: Move mxsfb_get_fb_paddr() away from
 register IO functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 07 Apr 2022 11:47:34 +0200
In-Reply-To: <2e038048-c3ac-4c33-fb98-ba6bec705d5b@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
 <20220311170601.50995-4-marex@denx.de>
 <5f7eb7a214ec0f219c4c9ce87e6c8c87bc7f0aeb.camel@pengutronix.de>
 <2e038048-c3ac-4c33-fb98-ba6bec705d5b@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 07.04.2022 um 00:05 +0200 schrieb Marek Vasut:
> On 4/6/22 21:45, Lucas Stach wrote:
> > Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> > > Move mxsfb_get_fb_paddr() out of the way, away from register IO functions.
> > > This is a clean up. No functional change.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Peng Fan <peng.fan@nxp.com>
> > > Cc: Robby Cai <robby.cai@nxp.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > 
> > Hm, I don't see any real benefit, but I also fail to see why it
> > shouldn't be done so:
> 
> The entire point of this series is to clean up the mxsfb and isolate 
> lcdif (the original lcdif) from any of the common code.

Actually, just use drm_fb_cma_get_gem_addr() instead?

Regards,
Lucas


