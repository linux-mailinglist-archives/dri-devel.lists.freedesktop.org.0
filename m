Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCEB232C62
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A41C6E879;
	Thu, 30 Jul 2020 07:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C8D89956;
 Wed, 29 Jul 2020 08:23:10 +0000 (UTC)
IronPort-SDR: lN49fUhDHhOGJb35aRB5D9h6y4C5eMO5hIFS3nBQ2Xa0Cy8Lsh/RBpVDeHizAOMrEfffmpv/pK
 RF8oa7qOWclQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="236242771"
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="236242771"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 01:23:10 -0700
IronPort-SDR: YgJufAO+VvF9JKj6/+berwFwFFx7I/v9sC+BOqWhjeM/8QDTXBVydKe5VTSCIvoI3d37MtIoD+
 Ak99Hp7bBZNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="322479903"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2020 01:23:06 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0hMf-004eRE-VX; Wed, 29 Jul 2020 11:23:05 +0300
Date: Wed, 29 Jul 2020 11:23:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 00/16] acpi/pwm/i915: Convert pwm-crc and i915
 driver's PWM code to use the atomic PWM API
Message-ID: <20200729082305.GK3703480@smile.fi.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200727074120.GB2781612@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727074120.GB2781612@ulmo>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-acpi@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 09:41:20AM +0200, Thierry Reding wrote:
> On Fri, Jul 17, 2020 at 03:37:37PM +0200, Hans de Goede wrote:

> I've applied patches 3 through 12 to the PWM tree. I thought it was a
> bit odd that only a handful of these patches had been reviewed and there
> were no Tested-bys, but I'm going to trust that you know what you're
> doing. =) If this breaks things for anyone I'm sure they'll complain.

Can we postpone a bit?

> That said I see that Rafael has acked patches 1-2 and Jani did so for
> patches 13-16. I'm not sure if you expect me to pick those patches up as
> well. As far as I can tell the ACPI, PWM and DRM parts are all
> independent, so these patches could be applied to the corresponding
> subsystem trees.
> 
> Anyway, if you want me to pick those all up into the PWM tree, I suppose
> that's something I can do as well.



-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
