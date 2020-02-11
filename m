Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90A158D3A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 12:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB43A6E4B6;
	Tue, 11 Feb 2020 11:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB4B6E4B6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 11:10:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A7A052A;
 Tue, 11 Feb 2020 12:10:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581419422;
 bh=yQ/YgCcxX/84N/Bg6dlXFt6ZMlfwjbzrIYHNztWZ0No=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RFj3RUdbTopRV9iqUICo9PbA6dJ1Ob02wl+ax6hinBKxDMsQtN5r8cUIys+Vm9r7R
 kp+TSLHFjOcBavJyUk390uQ/BZakEZLdvkovSZPYccHb0hDKLxJdyMHyHj9Db5qo7C
 yhJC4/Csf5P81GP13p6L8X5LtiepYU7gsNy6RtcY=
Date: Tue, 11 Feb 2020 13:10:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20200211111007.GC28355@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
 <20191212203550.GB4892@pendragon.ideasonboard.com>
 <add3d8af-6977-68e6-fb77-2fa748c4714a@ti.com>
 <b39e52f1-3e73-5f26-6206-0956cf482631@ti.com>
 <20200211110712.GB28355@pendragon.ideasonboard.com>
 <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b4d10c6-7cb2-af53-3a39-31eef441bfdd@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Jyri Sarha <jsarha@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 01:08:12PM +0200, Tomi Valkeinen wrote:
> On 11/02/2020 13:07, Laurent Pinchart wrote:
> 
> >> Hopefully soon (in five years? =) we can say that omapdrm supports all
> >> the boards, and we can deprecate omapfb.
> > 
> > I'd love to send a patch to remove omapfb, but I'll let you do the
> > honours :-)
> 
> Not before we add DSI support to omapdrm...

Details, details ;-)

Seriously speaking, Sebastian's patches are on my todo list.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
