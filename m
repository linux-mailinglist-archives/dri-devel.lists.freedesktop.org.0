Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE17F779D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 16:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05B610E809;
	Fri, 24 Nov 2023 15:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0610E20D;
 Fri, 24 Nov 2023 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700839386; x=1732375386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MkuEe7CRwbr3i+Uq46F6PerIEGxhcVI5cVv71fiHW+Q=;
 b=dQ48vI/ou2qWo0Kbq8wyi+n+xbIzS+QMDyNAbXMjcZnRMkhkzJIbT3Y2
 8lCDz2iu9+ZZCx8yHQS5q44GZo11Pt6derre2bG2+5KPkb/rQwpk7AJEL
 DYtrJY3tlrE7ebY1oPa4Qlyj9DgmgKoZKOI3bGE3pXgkgVHJT4liJL4J/
 ExRy0NdnCbHjH+MguoZx0RJRSuzCMyj4MDBpWhehoUQVFxhb3c5Ho4Ojv
 W+FMvu5HfI2p8bg2vPusTcaMSIXsNxkWykiVEg6Y+p2qdOkhEq309kqd8
 ZnXyk+2V2JchGMiwyjnzHPKILr2teAapKU2vUtQ7JlvRgPu/1jEcBEKM2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="389590517"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="389590517"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833711295"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833711295"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1r6XnY-0000000GkQh-3sLh; Fri, 24 Nov 2023 17:08:52 +0200
Date: Fri, 24 Nov 2023 17:08:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm: Add new DRM_IOCTL_MODE_GETPLANE2
Message-ID: <ZWC8hCurNztEwa-n@smile.fi.intel.com>
References: <20170112005118.19146-1-ben@bwidawsk.net>
 <20170112005118.19146-2-ben@bwidawsk.net>
 <20170112102316.GT31595@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170112102316.GT31595@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Ben Widawsky <ben@bwidawsk.net>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2017 at 12:23:16PM +0200, Ville Syrjälä wrote:
> On Wed, Jan 11, 2017 at 04:51:16PM -0800, Ben Widawsky wrote:

...

> > +	memcpy(plane->modifiers, format_modifiers,
> > +	       format_modifier_count * sizeof(format_modifiers[0]));
> 
> Looks all right since we do the same for formats anyway. But it did
> occur to me (twice at least) that a kmemdup_array() might a nice thing
> to have for things like this. But that's a separate topic.

JFYI:
https://lore.kernel.org/all/20231017052322.2636-2-kkartik@nvidia.com/

-- 
With Best Regards,
Andy Shevchenko


