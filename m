Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6165731074C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6136EAD4;
	Fri,  5 Feb 2021 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9616E9A3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 09:09:29 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1l7x7F-00089v-MV; Fri, 05 Feb 2021 10:09:25 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1l7x7E-0005or-5D; Fri, 05 Feb 2021 10:09:24 +0100
Date: Fri, 5 Feb 2021 10:09:24 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: [PATCH v3] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210205090924.s7rsjebzvatgus5t@pengutronix.de>
References: <1612287314-5384-1-git-send-email-oliver.graute@gmail.com>
 <20210202175910.ycnf7ehk2i4u3f5o@pengutronix.de>
 <20210204181541.GA13054@portage>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204181541.GA13054@portage>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:08:03 up 64 days, 23:14, 45 users,  load average: 0.08, 0.04, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21-02-04 19:15, Oliver Graute wrote:
> On 02/02/21, Marco Felsch wrote:
> > Hi Oliver,
> > 
> > On 21-02-02 18:35, Oliver Graute wrote:
> > > Add support for the Solomon Goldentek Display Model: GKTW70SDAD1SD
> > > to panel-simple.
> > > 
> > > The panel spec from Variscite can be found at:
> > > https://www.variscite.com/wp-content/uploads/2017/12/VLCD-CAP-GLD-RGB.pdf
> > > 
> > > Signed-off-by: Oliver Graute <oliver.graute@gmail.com>
> > > Cc: Marco Felsch <m.felsch@pengutronix.de>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > ---
> > > 
> > > v3:
> > > 
> > > - added flags
> > > - added delay
> > 
> > Thanks, did you test the changes?
> > I just picked it from the datasheet.
> 
> yes, it didn't break anything. 

Feel free to add my:

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

PS:
+1 for Fabio's comment ^^

Regards,
  Marco

> 
> Best regards,
> 
> Oliver
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
