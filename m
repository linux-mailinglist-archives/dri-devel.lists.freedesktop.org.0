Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0B2416A0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DF46E154;
	Tue, 11 Aug 2020 06:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFF06E0FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 06:04:38 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1k5NOm-0005vH-VS; Tue, 11 Aug 2020 08:04:36 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1k5NOm-0001qw-5S; Tue, 11 Aug 2020 08:04:36 +0200
Date: Tue, 11 Aug 2020 08:04:36 +0200
From: Philipp Zabel <pza@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/imx: drop panel attach/detach
Message-ID: <20200811060436.GA7067@pengutronix.de>
References: <20200721130650.27926-1-p.zabel@pengutronix.de>
 <20200810175639.GD292825@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810175639.GD292825@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:04:10 up 173 days, 13:34, 124 users,  load average: 0.25, 0.35,
 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:42 +0000
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Aug 10, 2020 at 07:56:39PM +0200, Sam Ravnborg wrote:
> Hi Philipp.
> 
> On Tue, Jul 21, 2020 at 03:06:50PM +0200, Philipp Zabel wrote:
> > The drm_panel_attach/detach() functions are empty since
> > commit aa6c43644bc5 ("drm/panel: drop drm_device from drm_panel"),
> > remove them.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> We ended up removing them all in one go. So they are now gone in
> drm-misc-next and you can skip this patch.

Excellent, thank you!

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
