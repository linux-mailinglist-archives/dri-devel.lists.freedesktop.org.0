Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D3631ED3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 11:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537F410E2AE;
	Mon, 21 Nov 2022 10:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC38897F0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669028047; x=1700564047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5CzyKjvM5WYE6virKJsMLAdYS9+fXIpeK1k+J3c3OSs=;
 b=BmXxgbYvoWS3kz4mLqbjOnxIr6bAh0TuR0WUS95ZTBmZivHFIKmZG68z
 VkRZ2fiFygaCSKqb3ptXNITdUo06PhzqoWtFc0GYKQjxcwGBzxm7tUsWb
 7ytxqs6vuPfiwrSaTrcsOHepvRvGfdUGFrB7hOcumWCf02UV5+hnHXTrf
 WB4vH3RVuuIM1bx869cFgZPW/eanXggcIKQESUAub4Q5ZumFPjnVMJO3o
 Jz336ZTT3za/rrkCw7BPhXAwNGlCgQ8Wft7BO73nZyF15Hg9wvtD0w1ET
 yogIHmJJ37zJD1D+97CEFMqDt/1Ywc1MPcAIUAG4Xlaot4bWfxxsNXXdU w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="311159786"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="311159786"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:54:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="886075072"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; d="scan'208";a="886075072"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com)
 ([10.237.72.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 02:54:03 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 839582015F;
 Mon, 21 Nov 2022 12:54:01 +0200 (EET)
Date: Mon, 21 Nov 2022 10:54:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/6] dt-bindings: Add macros for video interface bus
 types
Message-ID: <Y3tYyRHkvgei5We9@paasikivi.fi.intel.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <YtOyCBOqCR71uG1i@paasikivi.fi.intel.com>
 <Y3dPGkFaz/qo/drw@pyrite.rasen.tech>
 <Y3krOMoBLKpF1L7/@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3krOMoBLKpF1L7/@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, Nov 19, 2022 at 09:15:04PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Nov 18, 2022 at 06:23:38PM +0900, Paul Elder wrote:
> > Hi Sakari,
> > 
> > Gentle ping.
> > 
> > On Sun, Jul 17, 2022 at 06:54:00AM +0000, Sakari Ailus wrote:
> > > Folks,
> > > 
> > > > Laurent Pinchart (6):
> > > >   dt-bindings: media: Add macros for video interface bus types
> > > >   dt-bindings: Use new video interface bus type macros in examples
> > > >   ARM: dts: freescale: Use new media bus type macros
> > > >   ARM: dts: omap: Use new media bus type macros
> > > >   ARM: dts: renesas: Use new media bus type macros
> > > >   ARM: dts: stm32: Use new media bus type macros
> > > 
> > > What's the preference on the tree through which these would be merged?
> > > 
> > > The two first should probably go through the media tree but what about the
> > > DTS? There's a dependency to the first patch. I can take these all if
> > > people are fine with that.
> > 
> > How is this going?
> 
> Sakari, if there's a concern taking patches 3/6 to 6/6 in the media
> tree, could you merge 1/6 and 2/6 ? If they can still be included in a
> pull request for v6.2, I'll work on getting the dts changes in v6.3
> through their respective trees.

I think I was expecting v4 from you. But I can address the comments, too,
they were minor matters.

For applying the DTS patches I'd like to have ack from respective
treemaintainers it's fine to take these through the media tree.

-- 
Kind regards,

Sakari Ailus
