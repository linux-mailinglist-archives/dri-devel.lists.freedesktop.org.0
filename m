Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742188471DE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 15:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA0710ED92;
	Fri,  2 Feb 2024 14:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN6pD3vM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 14:25:21 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CDC10ED92
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706883922; x=1738419922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HzNWvLqFNq5/KR4E32uIR72ZaR/BALczY1b4w4LjKGI=;
 b=KN6pD3vMqWLmV5wqgpI7FjqhrYy4f0WtMMyewXueE2YubxffiqfU82Jv
 zcBwTVo86fA16uiK23bJ8mxzWaVX/BgnTZVi5VYAD50xILvTAqmfl3vgt
 hqtRRFNq1/i/EEA0MM+8kdeuZiNkbj7B02i/NHgPWAyiBl6opJ1w9Awwf
 Krr/rp8Pas74mj/IJwDlrrSzhL6MscBIFU5iuyzfDvUOwmZaclDO5vRHN
 3Ai4QsVsSCvgPvyc6NbXDDuvuK0LyCQ8/OpLNw3pqToylhEksy8QXk/wr
 A9NwQZ5U1WNTBoGjeVPTk0mFLwanOXwWRrxbH1/+su4XuGsFRidqH2WcK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="351098"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="351098"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908584636"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="908584636"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 06:18:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rVuMr-00000001I5f-0dcD; Fri, 02 Feb 2024 16:18:09 +0200
Date: Fri, 2 Feb 2024 16:18:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <Zbz5oPKS4ZdeMOaP@smile.fi.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <DU2PR01MB80349345B0C1757C6958107FF9422@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR01MB80349345B0C1757C6958107FF9422@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
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

On Fri, Feb 02, 2024 at 10:52:32AM +0000, Flavio Suligoi wrote:

> > Andy Shevchenko (3):
> >   backlight: mp3309c: Make use of device properties
> >   backlight: mp3309c: use dev_err_probe() instead of dev_err()
> >   backlight: mp3309c: Utilise temporary variable for struct device

> I've just tested again all your three patches (using the last 8.8.0-rc1
> for-backlight-next )  on my board and all is ok.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


