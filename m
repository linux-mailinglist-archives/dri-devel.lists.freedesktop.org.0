Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E543743B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 11:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B0A6E912;
	Fri, 22 Oct 2021 09:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFF66E90B;
 Fri, 22 Oct 2021 09:03:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="226717213"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="226717213"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 02:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="534675696"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 22 Oct 2021 02:02:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Oct 2021 12:02:55 +0300
Date: Fri, 22 Oct 2021 12:02:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove CNL leftover
Message-ID: <YXJ+PwVjT8Xbfb32@intel.com>
References: <20211021181847.1543341-1-lucas.demarchi@intel.com>
 <YXG6BGEtId+5oXFH@intel.com>
 <20211021213213.rl7dyux3sfaczyit@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021213213.rl7dyux3sfaczyit@ldmartin-desk2>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 21, 2021 at 02:32:13PM -0700, Lucas De Marchi wrote:
> On Thu, Oct 21, 2021 at 10:05:40PM +0300, Ville Syrjälä wrote:
> >On Thu, Oct 21, 2021 at 11:18:47AM -0700, Lucas De Marchi wrote:
> >> We left the definition IS_CANNONLAKE() macro while removing it from the
> >> tree due to having to merge the changes in different branches. Now that
> >> everything is back in sync and nobody is using IS_CANNONLAKE(), we can
> >> safely ditch it.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> >Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> >I found another leftover somewhere else, but now I forgot where
> >it was. I guess it'll come back to me eventually.
> 
> drivers/gpu/drm/i915/intel_pch.c, which I suspect is what you're talking
> about due to your recent patches. But that one is correct as we still
> have Cannon Lake Point (and I never remember if P in CNP is for PCH or
> Point) 
> 
> there is another one in a comment in drivers/gpu/drm/i915/gt/intel_gt.c,
> too.

Sleeping on it helped, I now remember that it's the SAGV block time.

-- 
Ville Syrjälä
Intel
