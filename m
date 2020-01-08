Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF9F134DEB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 21:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D905B6E33D;
	Wed,  8 Jan 2020 20:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0090.hostedemail.com
 [216.40.44.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421F76E33D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 20:51:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2A49A18029158;
 Wed,  8 Jan 2020 20:51:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:960:966:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2559:2562:2693:2828:2840:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4385:4605:5007:6119:6691:7807:7903:8784:10004:10400:10450:10455:10848:11026:11232:11473:11658:11914:12043:12296:12297:12438:12740:12760:12895:13439:14093:14097:14180:14181:14659:14721:14819:19904:19999:21060:21080:21433:21627:21795:30051:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: owner48_61339592a1919
X-Filterd-Recvd-Size: 3562
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed,  8 Jan 2020 20:51:07 +0000 (UTC)
Message-ID: <0681f64c49d0d01e8a4ff6e4c19e7632f6be591a.camel@perches.com>
Subject: Re: [PATCH v2 2/2] drm/print: document DRM_ logging functions
From: Joe Perches <joe@perches.com>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 08 Jan 2020 12:50:16 -0800
In-Reply-To: <20200108200416.GA32453@ravnborg.org>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-3-sam@ravnborg.org>
 <20200107160852.GD43062@phenom.ffwll.local>
 <20200107181752.GA20555@ravnborg.org>
 <20200108184920.GI43062@phenom.ffwll.local>
 <20200108200416.GA32453@ravnborg.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-01-08 at 21:04 +0100, Sam Ravnborg wrote:
> Hi Daniel.
> > > > I'd replace the entire block with a "This stuff is deprecated" warning. We
> > > > have at least a corresponding todo.rst entry.
> > > 
> > > We have many situations where no drm_device is available.
> > > At least when you a buried in drm_panel patches.
> > > 
> > > So it is either DRM_DEV_ERROR() or drv_err().
> > > Which is why I have pushed for nicer drm_ variants of these...
> > 
> > Huh, drm_panel indeed has no drm_device. And I guess we don't have a
> > convenient excuse to add it ...
> > 
> > > The todo entry only covers the nice new macros that Jani added
> > > where we have a drm_device.
> > 
> > I wonder whether for those cases we shouldn't just directly use the
> > various dev_* macros?
> 
> We would miss the nice [drm] marker in the logging.
> So [drm] will be added by the drivers and the core - but not the panels.
> That is the only drawback I see right now.
> 
> Which was enough justification for me to add the drm_dev_ variants.
> Feel free to convince me that this is not justification to add these
> variants.
> 
> In drm/panel/* there is no use of DRM_DEBUG* - and there is no
> reason to introduce the variants we can filer with drm.debug.
> 
> There is a single DRM_DEBUG() user, which does not count here.
> 
> 
> We could introduce only:
> 
> drm_dev_(err|warn|info|debug) - and not the more specialized variants.
> 
> Then we avoid that people make shortcuts and use drm_dev_dbg_kms() when
> they are supposed to use drm_dbg_kms().
> This was one of the very valid argumest against the patch that
> introduced all the drm_dev_* variants.

A few of these defines aren't used at all.

$ git grep -P -oh "DRM_DEV_DEBUG[A-Z_]*" | sort | uniq -c | sort -rn
     98 DRM_DEV_DEBUG_KMS
     38 DRM_DEV_DEBUG_DRIVER
     26 DRM_DEV_DEBUG
      2 DRM_DEV_DEBUG_RATELIMITED
      2 DRM_DEV_DEBUG_PRIME_RATELIMITED
      2 DRM_DEV_DEBUG_KMS_RATELIMITED
      2 DRM_DEV_DEBUG_DRIVER_RATELIMITED
      1 DRM_DEV_DEBUG_VBL
      1 DRM_DEV_DEBUG_PRIME
      1 DRM_DEV_DEBUG_DP
      1 DRM_DEV_DEBUG_ATOMIC

It might be sensible to consolidate these into just 2 calls
and add an appropriate <type> argument.

	DRM_DEV_DEBUG(dev, type, fmt, ...)
	DRM_DEV_DEBUG_RATELIMITED(dev, type, fmt, ...)

or

	drm_dev_dbg(dev, type, fmt, ...)
	drm_dev_dbg_ratelimited(dev, type, fmt, ...)

A treewide sed is trivial.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
