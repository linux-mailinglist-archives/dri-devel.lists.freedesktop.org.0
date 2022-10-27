Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB860F204
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC6610E566;
	Thu, 27 Oct 2022 08:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345FD10E565
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:16:10 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ony3b-0006WR-3F; Thu, 27 Oct 2022 10:16:07 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1ony3a-0006vG-7R; Thu, 27 Oct 2022 10:16:06 +0200
Date: Thu, 27 Oct 2022 10:16:06 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
Message-ID: <20221027081606.kenbev6kbwhbszzc@pengutronix.de>
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
 <a2e1a3b8-7fb0-5d53-f590-429453f9c569@denx.de>
 <20221027080443.k3zsv7qimcvem7s6@pengutronix.de>
 <d2968795-8d80-7df2-78cc-831ba0f7f927@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2968795-8d80-7df2-78cc-831ba0f7f927@denx.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22-10-27, Marek Vasut wrote:
> On 10/27/22 10:04, Marco Felsch wrote:
> > Hi Marek,
> 
> Hi,
> 
> > On 22-10-26, Marek Vasut wrote:
> > > On 7/26/22 11:43, Marco Felsch wrote:
> > > > FIFO underruns are seen if a AXI bus master with a higher priority do a
> > > > lot of memory access. Increase the burst size to 256B to avoid such
> > > > underruns and to improve the memory access efficiency.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > 
> > > Uh, this fell through the cracks, sorry.
> > > 
> > > Can you please collect my RB, add:
> > > 
> > > Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> > > 
> > > and send V2 ?
> > > 
> > > btw. the Panic mode seems to work on this IP with 4k displays and HDMI.
> > 
> > Sounds interesting, how did you verified that?
> 
> I plugged in a 4k panel into MX8MP HDMI port and saw this flicker, with the
> panic regs programmed correctly, there is no more flicker, see the commit
> messages of patch I posted yesterday for details, you were on CC:
> 
> [PATCH] drm: lcdif: Set and enable FIFO Panic threshold

Yes, this was later in my inbox.. sorry for the noise.

Regards,
  Marco
