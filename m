Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212249CA68
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 14:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CF510E9AD;
	Wed, 26 Jan 2022 13:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A3010E9AD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643202531; x=1674738531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QoWttKHIwySovLh54+n/rDLYKaoGyIVOjoeQpsMFcHg=;
 b=eNcofZPcl0bFqwYymqesYiyfMZmbF6wKWN2fQkiO6QjngNlH4mb3jwEA
 fDy8KGuir5ed6Oyj8BcnNkvuJRITx6tC9HgnbXAWWiF7EWWL3+dZSxbM5
 ceK42QFfQNoXu/ZGr5DiVyKiYAXoc6WfQpJNGyXIF/7mCW36B3Hg7K9t8
 YYPlkeGCu6/WLlhRKziTxRHf5+GXHlCHDBbGPyA9SJ/4Xicf+zK14PTui
 6HG90VYAA5J5rN1GwpdjcJYYRqx34DZr5kWH6InJqsF1o4NdTRMik2CXd
 hOMgjRFdnxz1TzhBydf8dCWSYTcqZfl30I6GDAkg4TBsRq96SVq+27HhZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227216974"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="227216974"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:08:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="532753138"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 05:08:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nCi1V-00EbTv-05; Wed, 26 Jan 2022 15:07:41 +0200
Date: Wed, 26 Jan 2022 15:07:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YfFHnNXIWFwDrRij@smile.fi.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
 <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phillip Potter <phil@philpotter.co.uk>, Carlis <zhangxuezhi1@yulong.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 12:17:08PM +0100, Helge Deller wrote:
> On 1/26/22 11:31, Daniel Vetter wrote:
> > On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:

...

> > On the other hand ... why does it have to be resurrecting fbdev?
> > There's an entire community of people who really know graphics and
> > display and spent considerable amount of effort on creating useful and
> > documented helpers for pretty much anything you might ever want to do.
> > And somehow we have to go back to typing out things the hard way, with
> > full verbosity, for an uapi that distros are abandoning (e.g. even for
> > sdl the direction is to run it on top of drm with a compat layer,
> > afaiui fedora is completely ditching any userspace that still even
> > uses /dev/fb/0). And yes I know there's still some gaps in drm,
> > largely for display features which were really en vogue about 20 years
> > ago. And we're happy to add that support, if someone who still has
> > such hardware can put in the little bit of work needed ...
> >
> > I don't get this.
> 
> You are describing a transitioning over to DRM - which is Ok.
> But on that way there is no need to ignore, deny or even kill usage scenarios
> which are different compared to your usage scenarios (e.g. embedded devices,
> old platforms, slow devices, slow busses, no 3D hardware features,
> low-color devices, ...).

Exactly, I am on the same side here.

-- 
With Best Regards,
Andy Shevchenko


