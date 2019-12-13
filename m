Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368411E2EA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC066E30E;
	Fri, 13 Dec 2019 11:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5E6E30E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:42:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C5379F4;
 Fri, 13 Dec 2019 12:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576237336;
 bh=Lb3INQXShawpZfSHODIdowd9VOhGos0XfP5YIGq/8Q0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZJazS+wPV46RHeDB7OJ5hxsroytmO1lhn3W99v6cUOEvbRIT35GaSwR9oJ4KikPr
 fnHjWQYyjAQ73LmaQPZBQ+h9L6mqzf3YwcTnPPoApCZ0Sg2v7hdULqJUmOnKEpNIz4
 iTCu2H/qjtHyhwzMJNfVqPZuXA01yqLBptR+d22Y=
Date: Fri, 13 Dec 2019 13:42:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Message-ID: <20191213114207.GC4860@pendragon.ideasonboard.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com>
 <20191212173110.GA35479@atomide.com>
 <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
 <20191213104204.GB4860@pendragon.ideasonboard.com>
 <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Fri, Dec 13, 2019 at 12:56:31PM +0200, Tomi Valkeinen wrote:
> On 13/12/2019 12:42, Laurent Pinchart wrote:
> 
> >> I think the correct way would be to have DRM framework understand that we have two displays, which
> >> are mutually exclusive, and the display pipeline drivers would have the means to switch the gpio.
> >> And that the display setup could be communicated properly to the userspace, and the userspace would
> >> understand it. I don't think any of those exists.
> > 
> > Isn't this what possible_clones in drm_encoder is for ? It notifies
> > userspace of mutual exclusions between encoders.
> 
> Hmm, how would that work here? Isn't encoder cloning about having two encoders, which take the input 
> from the same video source, and then outputting to two displays?

That's the idea. If you have one encoder for HDMI and one for the panel,
you can mark them as non-clonable, and then only one of the two can be
active at a time.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
