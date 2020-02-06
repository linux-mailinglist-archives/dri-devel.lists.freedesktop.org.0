Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E547155C75
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98ED6FD34;
	Fri,  7 Feb 2020 17:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBF36EA2F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 11:04:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 03:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,409,1574150400"; d="scan'208";a="344750862"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2020 03:04:42 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1izexg-0007Oc-13; Thu, 06 Feb 2020 13:04:44 +0200
Date: Thu, 6 Feb 2020 13:04:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm: shmobile: Reduce include dependencies
Message-ID: <20200206110444.GU10400@smile.fi.intel.com>
References: <20200205093226.72064-1-andriy.shevchenko@linux.intel.com>
 <20200205173322.GB4722@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205173322.GB4722@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 05, 2020 at 07:33:22PM +0200, Laurent Pinchart wrote:
> Hi Andy,
> 
> Thank you for the patch.
> 
> On Wed, Feb 05, 2020 at 11:32:26AM +0200, Andy Shevchenko wrote:
> > This file doesn't need everything provided by <linux/kernel.h>.
> > All it needs are some types, which are provided by <linux/types.h>.
> > 
> > Note, <drm/drm_mode.h> already includes <linux/types.h>, but
> > not relying on implicit includes is indeed a good thing.
> 
> Do we even need linux/types.h ? Apart from struct drm_mode_modeinfo,
> shmob_drm.h seems to only contain plain C without using any externally
> defined types.

Good point. It doesn't contain neither bool nor uXX or alike types.
Probably we may simple drop the inclusion. I'll send v3.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
