Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF736EE72
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A96F3EB;
	Thu, 29 Apr 2021 16:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7156F3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 16:56:24 +0000 (UTC)
IronPort-SDR: 7jjQwi7JewmwgS3MzeC/ayX6wVuU62GW6YkL4DGDGL4vBXbHHo2JNFHuv1AsOgTFutPP86Ntdx
 qi62/AAJDnaw==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="176539434"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="176539434"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:56:08 -0700
IronPort-SDR: UfKVhAS4HGuIl3apXrQJCsFL3vlyN0GGn2fENaHT29ZuNVWNPey5dREwdyShiKJVKnsY7pCp2V
 ffQfvMYdQzoA==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="527029629"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:56:06 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lc9xL-008C2n-Sf; Thu, 29 Apr 2021 19:56:03 +0300
Date: Thu, 29 Apr 2021 19:56:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 3/4] staging: fbtft: Don't spam logs when probe is
 deferred
Message-ID: <YIrlI+bo5Jm3orUD@smile.fi.intel.com>
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-4-andriy.shevchenko@linux.intel.com>
 <20210429144244.GE1981@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429144244.GE1981@kadam>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 05:42:44PM +0300, Dan Carpenter wrote:
> On Wed, Apr 28, 2021 at 04:04:14PM +0300, Andy Shevchenko wrote:

> > +	if (IS_ERR(*gpiop))
> > +		dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
> 
> This should be a return statement:
> 
> 		return dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);

Thanks!

Funny that I have trapped to this and my patch that adds __must_check to avoid
exactly this situations had been reverted :-(


-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
