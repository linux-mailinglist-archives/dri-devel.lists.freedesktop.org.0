Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B0A4BA06B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 13:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE5A10EE4E;
	Thu, 17 Feb 2022 12:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2D310EE4C;
 Thu, 17 Feb 2022 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645102595; x=1676638595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9zHnjADZdW6K8aBJ8mkjKVLkdspC6Yl6QYHIxnBZs8Q=;
 b=m1aCsLQWlS4cSm4t2E+dVmFEIIHcePZUl2pmCAbTckR65DmrlIgQ9peM
 CtoQUE/dIefk5gccWNwslrShUGctWprtV3vSuamP0zGpOAstQB91MFP5g
 8gYcP5FYcc4dJnMzTKXkXkN2Xa4N2o6JYAiWCBIrE1kxB6yIxMuEZST6u
 SHBoZxBFNKUDDRjewD4k8gdPaki7MlvRm87XekNqfJVa7lwatW4Y/7lW5
 yzS0rfxBnu5846wGdrwc/xpXO+Jo6wrN2f4NbkCBGILb6xxR+V4FAGLNQ
 ENIiqIGxYanezOb895YiwGqfl56TPqLu728DDwRTFxsU2/RIpbZ8W5ron g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="231489407"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="231489407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 04:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="545581979"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 17 Feb 2022 04:56:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 14:56:31 +0200
Date: Thu, 17 Feb 2022 14:56:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Message-ID: <Yg5F/xiC7PKyGU0J@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
 <Ygy68/f1ERpTKJJW@intel.com>
 <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
 <YgzMzNYlAoQPGhj1@intel.com>
 <11bc21211988d45e73a7be212d31263574dfb1ca.camel@intel.com>
 <Yg0Rz8hntpO4WfAx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yg0Rz8hntpO4WfAx@intel.com>
X-Patchwork-Hint: comment
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 05:01:35PM +0200, Ville Syrjälä wrote:
> On Wed, Feb 16, 2022 at 02:11:54PM +0000, Hogander, Jouni wrote:
> > On Wed, 2022-02-16 at 12:07 +0200, Ville Syrjälä wrote:
> > > On Wed, Feb 16, 2022 at 09:36:02AM +0000, Hogander, Jouni wrote:
> > > > On Wed, 2022-02-16 at 10:50 +0200, Ville Syrjälä wrote:
> > > > > On Tue, Feb 15, 2022 at 11:21:54AM +0530, Ramalingam C wrote:
> > > > > > From: Jouni Högander <jouni.hogander@intel.com>
> > > > > > 
> > > > > > Currently ICL_PHY_MISC macro is returning offset 0x64C10 for
> > > > > > PHY_E
> > > > > > port. Correct offset is 0x64C14.
> > > > > 
> > > > > Why is it PHY_E and not PHY_F?
> > > > 
> > > > This is a valid question. It seems we have followed
> > > > intel_phy_is_snps()
> > > > here:
> > > > 
> > > > // snip
> > > > else if (IS_DG2(dev_priv))
> > > > 		/*
> > > > 		 * All four "combo" ports and the TC1 port (PHY E) use
> > > > 		 * Synopsis PHYs.
> > > > 		 */
> > > > 		return phy <= PHY_E;
> > > > // snip
> > > > 
> > > > According to spec port E is "No connection". Better place to fix
> > > > this
> > > > could be intel_phy_is_snps() itself?
> > > 
> > > I think the crucial question is where are all the places that
> > > the results of intel_port_to_phy() get used.
> > > 
> > > I do see that for all the actual snps phy registers we
> > > do want PHY_E, but maybe it would be better to have a local
> > > SNPS_PHY enum just for intel_snps_phy.c, and leave the other
> > > phy thing for everything else?
> > > 
> > > Not sure if there is some other register we index with the
> > > phy that specifically wants PHY_E?
> > 
> > I went through registers accesses in intel_snps_phy.c. It is actually
> > only this one register which offset is wrong with PHY_E. Everything
> > else seems to be assuming PHY_E including those SNPS_* registers (as
> > you mentioned). I'm starting to think it would be overkill to open up
> > this phy enum for this purpose. I would propose to stick with current
> > patch. Maybe just update commit message. What do you think?
> 
> I would put it the other way. It is *only* the SNPS PHY IP registers
> that use the wonky offsets (unless you found some others?). Everythting
> on the Intel IP side wants it to be PHY_F.
> 
> So still would make more sense to me to add a new enum for the
> SNPS PHY instance and remap across the boundary. Otherwise we're
> just propagating this madness everwhere rather than containing in
> the SNPS PHY implementation.

Seems people want this is asap. I suppose it'll do as a temporary
measure given the phy stuff is already such mess.
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

As for the proper way to do stuff, I'm thinking roughly:
enum intel_spns_phy {
	SNPS_PHY_A,
	...
	SNPS_PHY_TC1, // == current PHY_E in value
};
and I think that can stay entirely inside intel_snps_phy.c.

As for our currnet enum phy I think we could start with something like
this:
enum phy {
	PHY_A,
	...
	PHY_F,

	PHY_TC1 = PHY_F,
	...
};

I think that should make it line up with PHY_MISC stuff and the 
VBT as well. So in the VBT code we could nuke all those crazy mapping
tables and just do:
 old platform: port -> VBT port
 new platform: phy -> VBT port

And we could probably have encoder->phy which gets populated
in the encoder init per-platform, similar to hpd_pin. That
would get rid of the intel_port_to_phy() disaster.

-- 
Ville Syrjälä
Intel
