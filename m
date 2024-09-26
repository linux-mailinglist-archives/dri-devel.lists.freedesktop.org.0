Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6298751C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 16:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194D310EB62;
	Thu, 26 Sep 2024 14:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNaVn85Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD1010EB62
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359679; x=1758895679;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KRoG0iFBLdyPThaKqWkm6NmM1UG4LeXqmclwLssef+g=;
 b=ZNaVn85ZerZyyu98LBo6S83qMD2gjeE6A9Ll6NoxeT5LLK7GxXALUj20
 KQiJRTQtGbsNuOS6+DprIYmimUGGacOCGDumwKjYiknQ4qb0dyb30ArU6
 dH3i50zpzjpHfJTll2IJDOR42D7zZjolf76VxM3i0CVbig6HfJLsg7kFa
 P/QDqo3hLO199idcqND/vmFmBltAxgMxnFspQf2CbyAN+BCNnoGQRHJSb
 fDzbUGR+FSdM8Js7fTLP+ACjvrkufWncOXDrcoYiivaA0HjrVfPs8E/yW
 oDhmkf3w9HpD3HbTmh3yxiWwkQD1QyJ5LmzSMD3MTRsg3WkjgVIq8lsa7 w==;
X-CSE-ConnectionGUID: ijaacsGaTg+J5Q4wTPp1fg==
X-CSE-MsgGUID: d9qmrpaeScCJdQPzb+Xh8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26548840"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26548840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:07:56 -0700
X-CSE-ConnectionGUID: GWqWtUJMQ4ydRb1+WVwxiA==
X-CSE-MsgGUID: gz4yNwDaT8iVRjE1v5nShQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72313870"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 26 Sep 2024 07:07:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 26 Sep 2024 17:07:51 +0300
Date: Thu, 26 Sep 2024 17:07:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andi Kleen <ak@linux.intel.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Print bad EDID notices only once
Message-ID: <ZvVqtwEkI1AhmUx6@intel.com>
References: <20240926133253.2623342-1-ak@linux.intel.com>
 <878qve1pp7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qve1pp7.fsf@intel.com>
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

On Thu, Sep 26, 2024 at 04:59:00PM +0300, Jani Nikula wrote:
> On Thu, 26 Sep 2024, Andi Kleen <ak@linux.intel.com> wrote:
> > I have an old monitor that reports a zero EDID block, which results in a
> > warning message. This happens on every screen save cycle, and maybe in
> > some other situations, and over time the whole kernel log gets filled
> > with these redundant messages. Printing it only once should be
> > sufficient.
> >
> > Mark all the bad EDID notices as _once.
> 
> I'm afraid this is too big of a hammer. If it was possible to make this
> once per display, fine, but this silences all same type warnings for all
> EDID blocks for all subsequently plugged in displays.
> 
> For example, you try to plug in a display, get errors, try another
> display because of that, and you no longer see warnings for the other
> display.
> 
> But I hear you. I'll try to think of alternatives.

We already have a bad_edid_counter on the connector. Presumable using
that, or adding something similar to handle other cases should be doable.

> 
> BR,
> Jani.
> 
> 
> >
> > Signed-off-by: Andi Kleen <ak@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 855beafb76ff..d6b47bdcd5d7 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -1916,10 +1916,10 @@ static void edid_block_status_print(enum edid_block_status status,
> >  		pr_debug("EDID block %d pointer is NULL\n", block_num);
> >  		break;
> >  	case EDID_BLOCK_ZERO:
> > -		pr_notice("EDID block %d is all zeroes\n", block_num);
> > +		pr_notice_once("EDID block %d is all zeroes\n", block_num);
> >  		break;
> >  	case EDID_BLOCK_HEADER_CORRUPT:
> > -		pr_notice("EDID has corrupt header\n");
> > +		pr_notice_once("EDID has corrupt header\n");
> >  		break;
> >  	case EDID_BLOCK_HEADER_REPAIR:
> >  		pr_debug("EDID corrupt header needs repair\n");
> > @@ -1933,13 +1933,13 @@ static void edid_block_status_print(enum edid_block_status status,
> >  				 block_num, edid_block_tag(block),
> >  				 edid_block_compute_checksum(block));
> >  		} else {
> > -			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
> > +			pr_notice_once("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
> >  				  block_num, edid_block_tag(block),
> >  				  edid_block_compute_checksum(block));
> >  		}
> >  		break;
> >  	case EDID_BLOCK_VERSION:
> > -		pr_notice("EDID has major version %d, instead of 1\n",
> > +		pr_notice_once("EDID has major version %d, instead of 1\n",
> >  			  block->version);
> >  		break;
> >  	default:
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
