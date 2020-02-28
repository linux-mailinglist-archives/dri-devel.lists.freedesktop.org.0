Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3C17461A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5CA6E2D5;
	Sat, 29 Feb 2020 10:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F4626F466
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 15:34:23 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 70E1F806C;
 Fri, 28 Feb 2020 15:35:03 +0000 (UTC)
Date: Fri, 28 Feb 2020 07:34:15 -0800
From: Tony Lindgren <tony@atomide.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200228153415.GL37466@atomide.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
 <20200224233708.GG16163@pendragon.ideasonboard.com>
 <20200224234759.GE37466@atomide.com>
 <20200227221052.GC4959@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227221052.GC4959@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200227 22:12]:
> Hi Tony,
> 
> On Mon, Feb 24, 2020 at 03:47:59PM -0800, Tony Lindgren wrote:
> > * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200224 23:38]:
> > > On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> > > > Add Droid 4 specific compatible value in addition to the
> > > > generic one, so that we have the ability to add panel
> > > > specific quirks in the future.
> > > 
> > > We need to document this compatible string in DT bindings, I don't think
> > > this is included in this series. Furthermore, could we use a compatible
> > > string that actually matches the panel vendor and model, instead of the
> > > device name ?
> > 
> > To me it seems there are multiple similar panels from various
> > vendors in use for xt875/xt894/xt910/xt912 phones, I'm not sure
> > if anybody has this list?
> 
> Are they all truly compatible ?

Well that is still unknown. We know that x894 panel config works with
xt875 at least. The panels are different looking the original dtb files.

Best to use device specific compatibles like Sebastian is doing.
If we ever get some real manufacturer and model data, we can add
that.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
