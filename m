Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38511D7F0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 21:36:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724BA6E1D3;
	Thu, 12 Dec 2019 20:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEFE6E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 20:36:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96416A2B;
 Thu, 12 Dec 2019 21:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576182958;
 bh=jns3lG4yF9SJ1qJ0UZr0iN9a4ReAkskKE8/XSfSUMOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wQJsBnE0n8EacJ2jzzVRMtR35IRBSLJOoFr11byn52ff+vL8/mgtZauAgabU0t+qo
 uiWZjcVl6RwjzIlz0H3Hfs520q3aE118VAKvsWASr7uiCIrzmnoYZx2iTdKIk1Ngo/
 Y0yG3FN6IShh+TqEg6HQiLuTjSnVm1jR/DiLHzFE=
Date: Thu, 12 Dec 2019 22:35:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20191212203550.GB4892@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
 <20191202130459.GH4929@pendragon.ideasonboard.com>
 <20191211165331.GC43123@atomide.com>
 <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45dae8f7-2f5e-6948-5a05-dc8a09ace1fa@ti.com>
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
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Thu, Dec 12, 2019 at 11:37:51AM +0200, Tomi Valkeinen wrote:
> On 11/12/2019 18:53, Tony Lindgren wrote:
> > * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [191202 13:05]:
> >> Hi Tomi,
> >>
> >> Thank you for the patch.
> >>
> >> On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
> >>> panel-simple now handled panel osd070t1718-19ts, and we no longer need
> >>> the panel timings in the DT file. So remove them.
> >>
> >> Should you in that case drop the panel-dpi compatible string too, as the
> >> panel-dpi bindings require panel timings in DT ?
> > 
> > Yeah sounds like if panel-dpi is no longer usable for this device it
> > should be dropped from the compatible list.
> 
> Ok, I agree.
> 
> Looking at the dts files, panel-dpi is used in a bunch of boards. But
> we even have 3 dts files with panel-dpi, without the detailed panel
> model in compatible...
> 
> Fixing those will break the compatibility with old dtbs and new
> kernel, unless we add timings-from-dt to a panel driver that handles
> panel-dpi.

I know, and I don't have a perfect answer for this :-( I don't see a
third option, it's either breaking DT backward compatibility or adding
timings parsing to a panel driver (either a new panel-dpi driver or to
panel-simple). What's your preferred option ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
