Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB5125D1E8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98D6EAB6;
	Fri,  4 Sep 2020 07:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786356E9EB;
 Thu,  3 Sep 2020 12:56:31 +0000 (UTC)
IronPort-SDR: Rhy9Z+XESSYYM1ppZJGYEAlRNEeQ/34HLVHOJEyW5sTJF+qIpxnqvkT8nnTdXBmvdCWhg9+I6P
 P6d0yf/q0umA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="137617809"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="137617809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 05:56:30 -0700
IronPort-SDR: ttfkhcEQ4M7plm0rWrzzUPBGVfW6Uok9NxDdMC0S+ahWiwZIRhDDv8NnrXXoPTkfMpoZavNT78
 BuD0ToeLnQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="331778180"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 03 Sep 2020 05:56:23 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kDomq-00E1xi-F2; Thu, 03 Sep 2020 15:56:20 +0300
Date: Thu, 3 Sep 2020 15:56:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v10 07/17] pwm: lpss: Remove suspend/resume handlers
Message-ID: <20200903125620.GB1891694@smile.fi.intel.com>
References: <20200903112337.4113-1-hdegoede@redhat.com>
 <20200903112337.4113-8-hdegoede@redhat.com>
 <20200903124816.GA1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903124816.GA1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 03:48:16PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 03, 2020 at 01:23:27PM +0200, Hans de Goede wrote:

> the question is do we need to have similar in acpi_lpss.c?
> For example,
> 	static const struct lpss_device_desc byt_pwm_dev_desc = {
> 		.flags = LPSS_SAVE_CTX,
> 		^^^^^^^^^^^^^^
> 		.prv_offset = 0x800,
> 		.setup = byt_pwm_setup,
> 	};
> 
> 	static const struct lpss_device_desc bsw_pwm_dev_desc = {
> 		.flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
> 		^^^^^^^^^^^^^^
> 		.prv_offset = 0x800,
> 		.setup = bsw_pwm_setup,
> 	};

Okay, it's a private space which has clock and reset gating, so means we still
need to handle it.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
