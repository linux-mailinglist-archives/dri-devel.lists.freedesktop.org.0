Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC74A4807
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 14:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1FA10E218;
	Mon, 31 Jan 2022 13:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654D010E218
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643635549; x=1675171549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PV2NMENejzNWL/eUmut4tFJ0nE85m4L6jACezcDdRYI=;
 b=ZD7uVo38BRZ2AeTJHkBsqwWJt1ypKa/Y4aH/5XKp/ONxqHjjvYFDV0dt
 H6vP8BWahbkV9l00KNtMcERcRXiSjw+oVsrwXrn8EGtdRYk5AVupZKfsX
 e+vaGtOOk/jrJlQIrSFJpkFms9Vn7ev6EJ49C/8n+ma3UTFmXcxY++1Tt
 C0bG+rgso+RqxGHaQvnJZIczKZd+cm0wl/XCGCv2FN8V2frALl/f8cjqi
 88S4gTf5SHwiRd33RCsDYW+6MY46/dDPL87RcaqbcQgNRe6PdA2EuPCEE
 s4o5Pk3E3FUCycfjLjZGqhLFkZH4OJmdxiUYcSYIK03KzemGzurGcxTpC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247412840"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="247412840"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 05:25:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="481748551"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 05:25:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nEWfh-00GseD-PN; Mon, 31 Jan 2022 15:24:41 +0200
Date: Mon, 31 Jan 2022 15:24:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Message-ID: <YffjGQY4KgsAqniL@smile.fi.intel.com>
References: <YfEv7OQs98O9wJdJ@kroah.com> <YfFIpBb7lL4ukWjm@smile.fi.intel.com>
 <b8eb7111-43aa-cc8a-a1bc-f08e0f2987ed@redhat.com>
 <YfFV4EJosayH+e6C@smile.fi.intel.com>
 <YfFWPmG2D093gz4N@smile.fi.intel.com>
 <6e74d4cc-655a-e38e-0856-a59e4e6deb36@redhat.com>
 <c423a2f0-e7be-3884-3568-7629c7e9104e@redhat.com>
 <YffJujbpUGUqpIk/@smile.fi.intel.com>
 <5a3fffc8-b2d8-6ac3-809e-e8e71b66a8ea@redhat.com>
 <YffiwCiFnqF1X1pD@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YffiwCiFnqF1X1pD@smile.fi.intel.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>, Lee Jones <lee.jones@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 03:23:13PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 31, 2022 at 01:08:32PM +0100, Javier Martinez Canillas wrote:
> > On 1/31/22 12:36, Andy Shevchenko wrote:

...

> > I actually added this dependency deliberative. It's true that the driver is using
> > the device properties API and so there isn't anything from the properties parsing
> > point of view that depends on OF. And the original driver didn't depend on OF.
> > 
> > But the original driver also only would had worked with Device Trees since the
> > of_device_id table is the only one that contains the device specific data info.
> > 
> > The i2c_device_id table only listed the devices supported to match, but then it
> > would only had worked with the default values that are set by the driver.
> > 
> > So in practice it *does* depend on OF. I'll be happy to drop that dependency if
> > you provide an acpi_device_id table to match.
> 
> The code is deceptive and you become to a wrong conclusion. No, the driver
> does NOT depend on OF as a matter of fact. The tricky part is the PRP0001
> ACPI PNP ID that allows to reuse it on ACPI-based platforms.
> 
> That said, please drop OF dependency.

Side note: 72915994e028 ("video: ssd1307fb: Make use of device properties")

-- 
With Best Regards,
Andy Shevchenko


