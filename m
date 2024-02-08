Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F284E673
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 18:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83510E0E2;
	Thu,  8 Feb 2024 17:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2PFrJ3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A71510E0E2
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707412541; x=1738948541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p76xqtocPXxIASp/RvwQN97YAIQh0QlwZC10TmxGnq0=;
 b=R2PFrJ3lyRq8Q2AQQC9qf76RxPRC8zs33WVX3mXIyeXBklYWf4u4tZMk
 dDFMoUQHbESYIM8Oayg9+dXKhkSUk+EFYDVO2LdIUNCKLgfBlimhJ2Wr6
 BVDii8uALpT6oCHXq917BK3VwoZknQWDgst7ZvJH2r9IBPoY0gvpxYQQS
 a3g5VTr+uEFDGMf0AywV/I5inY8aa87PTIocg1c59O08yoRN3Sc3p109J
 WAOL1EWQMqTQTc8Gh9iiE645foUgu9xsWrR1oHlp2w6d1hCO1pI077Phx
 aYIUsynSfuX8kAi5pa2QTgSSxZVNLW1DlZb7MzFLcxT30EK0g38E2wOuz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11841742"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="11841742"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910429976"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="910429976"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:15:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rY7zn-00000002vyu-3v1g; Thu, 08 Feb 2024 19:15:31 +0200
Date: Thu, 8 Feb 2024 19:15:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240208113425.GK689448@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208113425.GK689448@google.com>
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

On Thu, Feb 08, 2024 at 11:34:25AM +0000, Lee Jones wrote:
> On Thu, 01 Feb 2024, Andy Shevchenko wrote:

...

> >   backlight: mp3309c: Utilise temporary variable for struct device

(1)

> Set no longer applies.  Please rebase, thanks.

I got a contradictory messages:
1) email that says that all had been applied;
2) this email (that tells the complete opposite);
3) the repository where the first two were applied.

While you can amend your scripts, I think I need to rebase only the last patch
(1) that may not be found in your tree currently.

-- 
With Best Regards,
Andy Shevchenko


