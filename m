Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CB41770FD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9090B6E9E1;
	Tue,  3 Mar 2020 08:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D0186E2C4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:01:42 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 664C6809F;
 Mon,  2 Mar 2020 15:02:25 +0000 (UTC)
Date: Mon, 2 Mar 2020 07:01:37 -0800
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
Message-ID: <20200302150137.GP37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
 <20200224233111.gkctx27usfxj2wgz@earth.universe>
 <20200224234333.GD37466@atomide.com>
 <20200227174424.GI37466@atomide.com>
 <8b27dba3-2e2b-84ce-0927-685f4bfe3ab2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b27dba3-2e2b-84ce-0927-685f4bfe3ab2@ti.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Jyri Sarha <jsarha@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200302 10:29]:
> On 27/02/2020 19:44, Tony Lindgren wrote:
> 
> > > > FWIW, I dropped omapdss-boot-init.c in my patch series updating DSI
> > > > code to use common panel infrastructure, so this will conflict.
> > > 
> > > Hey that's great :) Sounds like we can set up an immutable branch
> > > for just this $subject patch against v5.6-rc1 to resolve the
> > > conflict. I can set it up for Tomi or Tomi can set it up for me,
> > > whichever Tomi prefers.
> > 
> > Do you want me to send you a pull request for just this one patch
> > against v5.6-rc1?
> 
> It's probably easier if Sebastian drops the removal patch, and instead
> creates a patch that removes the panel-dsi-cm from
> omapdss_of_fixups_whitelist. That change should not conflict, and
> effectively makes the omapdss-boot-init.c a no-op.
> 
> We can then remove the file later.

OK for resolving the merge commit that works too.

Tomi, so do you care to ack the $subject patch though so I can set
up an immutable branch for us for the $subject patch?

Or Tomi, do you want to set up an immutable branch for me for the
$subject patch?

Regards,

Tony

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
