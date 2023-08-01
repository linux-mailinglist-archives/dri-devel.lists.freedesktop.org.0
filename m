Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3923676AB5E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F260E10E04C;
	Tue,  1 Aug 2023 08:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1ED10E04C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690880056; x=1722416056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EKSoYDU6IXxYCJo28EURUtu2SqmiJ/aT5mkoCr+f2hc=;
 b=OrVBTzmDgmU+6rxQGdq2HooYrvTKsKDh+LZh5ZvvhD3cQzT16pojrieY
 GsPYz2anAEOxPMJDcO919wZjFIAZkK6udxb5HlMGz04W1UFhwMetBDXcA
 a2XpMmFRUieNtbK48lxbRVLgx2Z/eaQUxqYHzzKPcF0/7zgeKteocw8tr
 2xl/aMgViqtwRbnwcwvHcoaGd6awHw5/aBotd3Rc7aonARh/abA6rO/Vs
 LLr8fF8dDaQij5G9LNEI8lioziFPsXoZUVcuQy++yVFpuCjG+sCi3X9S3
 8nRm+rVDZmF77GXP2gYwfY2h8TSbdi61fMHT5s0nu+xCltw1pfNEpW41j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400194819"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="400194819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728616131"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="728616131"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002.jf.intel.com with ESMTP; 01 Aug 2023 01:54:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qQl8r-00CcK6-38; Tue, 01 Aug 2023 11:54:09 +0300
Date: Tue, 1 Aug 2023 11:54:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] video: fbdev: ssd1307fb: Print the PWM's label
 instead of its number
Message-ID: <ZMjIMU+tb9mbwHwl@smile.fi.intel.com>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
 <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230728145824.616687-3-u.kleine-koenig@pengutronix.de>
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Jilin Yuan <yuanjilin@cdjrlc.com>, kernel@pengutronix.de,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 04:58:23PM +0200, Uwe Kleine-König wrote:
> struct pwm_device::pwm is a write-only variable in the pwm core and used
> nowhere apart from this and another dev_dbg. So it isn't useful to
> identify the used PWM. Emit the PWM's label instead in the debug
> message.

Do we have firmware node of PWM available? I would print it rather than some
(possibly non-unique) string.

-- 
With Best Regards,
Andy Shevchenko


