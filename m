Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85C2627C8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9F6E9C8;
	Wed,  9 Sep 2020 07:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60AB6E81D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 12:00:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4E264580441;
 Tue,  8 Sep 2020 08:00:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Sep 2020 08:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=A
 t0ECiv86wOydFiONx1rKX74GnbiUZGiVwaMOztKjuk=; b=A28HdI8alVUfO+NGz
 jhOSfc5vwRPeVN7GA2rcjgFsQTj4DmJjpoyrEQkyjXPCh3ig+997suzCFj225jSs
 LIeEQWtGZev9qkXT288I3DiK25ASbo1vLbs+21RikvLtgfYvZJcLqnuWwVkkKZjV
 kBIuYuOqUKkofKQ7/5qvIgUXphgJKKsh1GC2K8wV7VANnkV90ZCfKsQJ+WyggWSj
 bEk/rdkOr5PrzRiAHdmPd7EAd6kV/ATbM9lgGss/QODATDhCzzsGwxQHTGHinFeB
 p6GuTicJXU0TkVP+vI13kbKL8Tpa2zf47B+QJMZmUCXLsHqrJ7qSvWf4dgsSX40w
 h1GYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=At0ECiv86wOydFiONx1rKX74GnbiUZGiVwaMOztKj
 uk=; b=dhghoUJmS7jVoxYnaqVEzRC1l/H3fLlqWDpRqZ+MysnqvW7+KIG3BEF2L
 79nCo2PnEFKJCFGixMT6iyQYtYfujiYACHcKSVRWmyKRSVtSSOD9spYoMkQCxAjI
 fuu32uUrij8KOA92gAPsDg4uMz+iTnJR3Qx/sOUG3/9dWaYbO4nnkRhYd8Sd/ebv
 mehj32n2xTqDORYsIBS3q58wEnFCg2ScmAVMLzoILwbZ8wlhpTrg1VnRTInQT7ms
 AcI8M8/qs+KBhM2uRhcIqMmfzlhP1uGMY7aozWmPavKmnHP/zIYDxP5LD5dNMHJ2
 GX7R7lhLgdUgZdYHI7gKYEl+H+G3Q==
X-ME-Sender: <xms:VnJXX9Snuh4Cse39j9YfRGTXSrPqxCxPAeYkDMDL2TQWOY0JWoHOQw>
 <xme:VnJXX2wJqJ89WKHQlrOSPRKliK6E18tW7Ny8iUSWdNx0Nhkl1-rliKRfrvys2OLmR
 6EDFwifw5WC5x7lNok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehfedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VnJXXy1j80EPqHy8o0z4n9Uud9Z1vczcgHt2eYwuUIsMgOlvFJZGXA>
 <xmx:VnJXX1AUG3iZSUaVW69wOb0p4qmgeWVSwqTlOqtDSaVdwzDYZ9-f-w>
 <xmx:VnJXX2hKy80dBWfVA0hBxnuXwHSqNVFVeMUADbN8CKENBj6PIFT4YA>
 <xmx:V3JXX3bXx01SDa8CprDSFTPaGFIoJl2eQ0TFaUDkdyDdzLnkqJS8lw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BE0F33280060;
 Tue,  8 Sep 2020 08:00:21 -0400 (EDT)
Date: Tue, 8 Sep 2020 14:00:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v5 00/80] drm/vc4: Support BCM2711 Display Pipeline
Message-ID: <20200908120019.3rmhzoijoijrbb7d@gilmour.lan>
References: <CGME20200904071259epcas1p3de4209531c0bc5ed6ea9ef19827b6ed5@epcas1p3.samsung.com>
 <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <cca5234f-e1e8-b642-048b-b710f402409d@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cca5234f-e1e8-b642-048b-b710f402409d@samsung.com>
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hoegeun,

On Mon, Sep 07, 2020 at 08:49:12PM +0900, Hoegeun Kwon wrote:
> On 9/3/20 5:00 PM, Maxime Ripard wrote:
> > Hi everyone,
> >
> > Here's a (pretty long) series to introduce support in the VC4 DRM driver
> > for the display pipeline found in the BCM2711 (and thus the RaspberryPi 4).
> >
> > The main differences are that there's two HDMI controllers and that there's
> > more pixelvalve now. Those pixelvalve come with a mux in the HVS that still
> > have only 3 FIFOs. Both of those differences are breaking a bunch of
> > expectations in the driver, so we first need a good bunch of cleanup and
> > reworks to introduce support for the new controllers.
> >
> > Similarly, the HDMI controller has all its registers shuffled and split in
> > multiple controllers now, so we need a bunch of changes to support this as
> > well.
> >
> > Only the HDMI support is enabled for now (even though the DPI and DSI
> > outputs have been tested too).
> >
> > Let me know if you have any comments
> > Maxime
> >
> > Cc: bcm-kernel-feedback-list@broadcom.com
> > Cc: devicetree@vger.kernel.org
> > Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> >
> > Changes from v4:
> >    - Rebased on top of next-20200828
> >    - Collected the various tags
> >    - Fixed some issues with 4k support and dual output (thanks Hoegeun!)
> 
> Thanks for your v5 patchset.
> 
> I tested all patches based on the next-20200812.

Thanks again for testing all the patches

> Everything else is fine, but the dual hdmi modetest doesn't work well in my
> environment...
> 
> In my environment, dsi is not connected, I have seen your answer[1].

Can you share a bit more your setup? What monitors are being connected
to each HDMI port? Do you hotplug any?

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
