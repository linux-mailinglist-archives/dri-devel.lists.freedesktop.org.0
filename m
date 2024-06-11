Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D4A903D7E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2486310E651;
	Tue, 11 Jun 2024 13:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+IxYcdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136A110E64F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718112849; x=1749648849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SwpplB4JSy1bF45K4tpsmb//2IRRz4TkaZ4mbEE+tk4=;
 b=n+IxYcdr8vt/a0ffRIDLJ5l0j4CLjFvNxZ7oifm6NRgK567/OCrxv7Qb
 YfG4i2RxBh/QSF68KCHSABs1RyUkQ/fy4Z2KMF2wftgg8s7E3Df/HPzQM
 MrPDJFxAh6DcnBR+Fc4ofm5Mmb3Dck834VzectYyYJoGYNrS3/xKfznk2
 uTr+hRVu3yDtvGNr8vxoaRfdSZ52tC0Ov429CKJmjbhDOEMWHEjVml+Yz
 h2MQ/z2Wu375OkXCNETakDjxJD3+GcGW3QbrKGe56IwzWnZ6GkqJSzFZa
 LEed9AVR01eXO4+wlQEOGxRzdUTKO2YzeQphKC5sudt7BDQGB1dJX2t9I g==;
X-CSE-ConnectionGUID: MrMpkFcDRnu1WHBuo3UwWg==
X-CSE-MsgGUID: myLn45TzTfy/DibCa0Gu3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="40223744"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40223744"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:34:08 -0700
X-CSE-ConnectionGUID: KMu7RY8WSX+7ERkVR43LFQ==
X-CSE-MsgGUID: KbUVOKdoQo6Fa9+tblZJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40149337"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:34:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sH1dT-0000000FY6k-0Jxo; Tue, 11 Jun 2024 16:34:03 +0300
Date: Tue, 11 Jun 2024 16:34:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 1/1] drm/mipi-dbi: Add missing MODULE_DESCRIPTION()
Message-ID: <ZmhSSvT0pxp3Sz8s@smile.fi.intel.com>
References: <20240425125627.2275559-1-andriy.shevchenko@linux.intel.com>
 <ZmDMxtDz5aq0xom6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmDMxtDz5aq0xom6@smile.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 05, 2024 at 11:38:31PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 25, 2024 at 03:56:26PM +0300, Andy Shevchenko wrote:
> > The modpost script is not happy
> > 
> >   WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_mipi_dbi.o
> > 
> > because there is a missing module description.
> > 
> > Add it to the module.
> 
> Any comments on this?

+Cc: Jeff, FYI

-- 
With Best Regards,
Andy Shevchenko


