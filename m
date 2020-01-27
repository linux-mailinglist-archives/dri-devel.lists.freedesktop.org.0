Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817C14B0F4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6166ED16;
	Tue, 28 Jan 2020 08:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6B6EA91
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 09:43:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 01:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="276864253"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2020 01:39:37 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iw0rr-0001rJ-80; Mon, 27 Jan 2020 11:39:39 +0200
Date: Mon, 27 Jan 2020 11:39:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/4] drm/tiny/repaper: Make driver OF-independent
Message-ID: <20200127093939.GR32742@smile.fi.intel.com>
References: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
 <20200124164233.GA6043@ravnborg.org>
 <20200124173134.GJ32742@smile.fi.intel.com>
 <20200124181812.GA7883@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124181812.GA7883@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 24, 2020 at 07:18:12PM +0100, Sam Ravnborg wrote:
> On Fri, Jan 24, 2020 at 07:31:34PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 24, 2020 at 05:42:33PM +0100, Sam Ravnborg wrote:
> > > On Wed, Jan 22, 2020 at 12:54:00PM +0200, Andy Shevchenko wrote:
> > > > There is one OF call in the driver that limits its area of use.
> > > > Replace it to generic device_get_match_data() and get rid of OF dependency.
> > > > 
> > > > While here, cast SPI driver data to certain enumerator type.
> > 
> > > >  enum repaper_model {
> > > > +	EXXXXCSXXX = 0,
> > > >  	E1144CS021 = 1,
> > > >  	E1190CS021,
> > > >  	E2200CS021,
> > > The new enum value is not used in the following - is it necessary?
> > 
> > Yes. It explicitly prevents to use 0 for real device.
> > 
> > This is due to device_get_match_data() returns content of data pointer and thus
> > we may not distinguish 0 from NULL pointer.
> A name that told this was not a valid name would be descriptive.
> As it is now it looks like a wildcard that matches everythign else.

Can you be more precise what you would like to see?
Perhaps simple comment will help?

> With a more descriptive name:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
