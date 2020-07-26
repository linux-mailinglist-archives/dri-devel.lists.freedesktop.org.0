Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26F22E29B
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 22:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3BD6E0E8;
	Sun, 26 Jul 2020 20:41:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3937A6E0E8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 20:41:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 22E0A20024;
 Sun, 26 Jul 2020 22:41:47 +0200 (CEST)
Date: Sun, 26 Jul 2020 22:41:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm/bridge: tc358762: Add basic driver for Toshiba
 TC358762 DSI-to-DPI bridge
Message-ID: <20200726204145.GA3750553@ravnborg.org>
References: <20200725211457.5772-1-marex@denx.de>
 <20200725211457.5772-2-marex@denx.de>
 <20200726071517.GD1691925@ravnborg.org>
 <a8d6b9ad-a9c4-925b-e9f8-00c803b30e9a@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8d6b9ad-a9c4-925b-e9f8-00c803b30e9a@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=-VAfIpHNAAAA:8 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=24rWtvPpTJrT0KyJ0wcA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=srlwD-8ojaedGGhPAyx8:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Sun, Jul 26, 2020 at 12:17:46PM +0200, Marek Vasut wrote:
> On 7/26/20 9:15 AM, Sam Ravnborg wrote:
> > Hi Marek.
> 
> Hi,
> 
> > On Sat, Jul 25, 2020 at 11:14:57PM +0200, Marek Vasut wrote:
> >> Add very basic driver for Toshiba TC358762 DSI-to-DPI bridge, derived
> >> from tc358764 driver and panel-raspberrypi-touchscreen. This driver is
> >> meant to replace the panel-raspberrypi-touchscreen too, as the bridge
> >> connection can be described in DT too.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> To: dri-devel@lists.freedesktop.org
> >> Cc: Eric Anholt <eric@anholt.net>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: devicetree@vger.kernel.org
> >> ---
> > 
> > Two general comments.
> > - This driver should use the bridge panel - this will simplify the
> >   driver in many places. We already have several good examples in-tree
> >   that does this.
> 
> Can you list such an example ?

Take a look at tc358764.c in following patch-set:
https://lore.kernel.org/dri-devel/20200726203324.3722593-1-sam@ravnborg.org/

Your current driver will be even smaller after implmenting these
changes.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
