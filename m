Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14075172AE6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 23:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382CB6E989;
	Thu, 27 Feb 2020 22:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FBD6E989
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 22:11:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD822B16;
 Thu, 27 Feb 2020 23:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582841475;
 bh=2FZoe6ReTFNS++q1J/Dg78zwP8XhJ7io+zJtSBuCa4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WEVJalX/OYJjO+qqnVzAajIWnb+YkQT0W0t5neafdXjrxBmJmU9+VpT9IZs8pciMf
 tNDot1hNVlu68g4Z2FC377jBP3eQ2D+4xBJk+G94ZP7mY403kScsIWcjtmvIFi1xs1
 6WUZq7XFpVFuLL16mRcCFuSufH+9G6svW+RtAf+s=
Date: Fri, 28 Feb 2020 00:10:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200227221052.GC4959@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
 <20200224233708.GG16163@pendragon.ideasonboard.com>
 <20200224234759.GE37466@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224234759.GE37466@atomide.com>
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tony,

On Mon, Feb 24, 2020 at 03:47:59PM -0800, Tony Lindgren wrote:
> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200224 23:38]:
> > On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> > > Add Droid 4 specific compatible value in addition to the
> > > generic one, so that we have the ability to add panel
> > > specific quirks in the future.
> > 
> > We need to document this compatible string in DT bindings, I don't think
> > this is included in this series. Furthermore, could we use a compatible
> > string that actually matches the panel vendor and model, instead of the
> > device name ?
> 
> To me it seems there are multiple similar panels from various
> vendors in use for xt875/xt894/xt910/xt912 phones, I'm not sure
> if anybody has this list?

Are they all truly compatible ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
