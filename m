Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52E289C86
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 01:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B9B6EE5B;
	Fri,  9 Oct 2020 23:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DAD6EE55
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 23:59:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BB2E528;
 Sat, 10 Oct 2020 01:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602287967;
 bh=hQoSfHq4w68Q8YI1olTrIlcr8qpEmfR2zY8Trc10LPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AsJihnaGYD4EMaCzVQqF4DINZ64tw+G+q3wq70IU/ZmJ1uUpGVFszJS7uphcJQMqa
 wV1hAmWrF4dNnbBgkNgeKkARaIoBsI4oUlvDWlrbDnL0YMZs8XldaGim+Ekm/reGxs
 /Ai5vx69tPuw2kfzG25e6Ufgw6rY6V5OVAf+a5vk=
Date: Sat, 10 Oct 2020 02:58:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 3/7] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
Message-ID: <20201009235843.GR25040@pendragon.ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-4-laurent.pinchart@ideasonboard.com>
 <7b8df7af-5ca8-708b-4975-2fdf4280116f@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b8df7af-5ca8-708b-4975-2fdf4280116f@denx.de>
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
Cc: devicetree@vger.kernel.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, Oct 07, 2020 at 10:40:26AM +0200, Marek Vasut wrote:
> On 10/7/20 3:24 AM, Laurent Pinchart wrote:
> 
> [...]
> 
> > +          bus-width:
> > +            enum: [16, 18, 24]
> > +            description: |
> > +              The output bus width. This value overrides the configuration
> > +              derived from the connected device (encoder or panel). It should
> > +              only be specified when PCB routing of the data signals require a
> > +              different bus width on the LCDIF and the connected device. For
> > +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
> > +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
> > +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
> > +              LCD_DATA[17:12], bus-width should be set to 24.
> 
> The iMX6 IPUv3 uses interface-pix-fmt which is a bit more flexible, but
> I'm not sure whether it's the right way to go about this, see:
> Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt

I think specifying the bus with is better. It's a standard property, but
more than that, a given bus width can carry different formats. For
instance, a 24-bus could carry RGB666 data (with dithering for the
LSBs).

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
