Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB883F5E9
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 15:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DFB112640;
	Sun, 28 Jan 2024 14:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CDB112640
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706452777; x=1737988777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MvFLG7+fw1TsvJEiHrVT3XO9svrY/UGXQ8KusEBsHSI=;
 b=gq46xjmZ8yajw9pUPJ2sHoWRBNEJFFDTQCOoOMM8o0pCcb+LS1HQN0zZ
 Ty7MRuq5FxX1oEijlkVjgu7+5wXd4kL6mIw0TYQxZGPAYBfrkl9OfNsZB
 FG4i3oIsPcSd3GwOQj0jxfLCZpMekpvKDEXpIR1rsYRr9nzs8WAHA4rzl
 HRnm/RyekWS9tpcmVgWiz5kEeh8b8Ne8wNgS262iDRl2wKmCQLWiEsxUf
 HUDW1CHUCyGK8CGgJ/PlRD+yNT0L0jm7Nhtgg+9G7u+5xMxxgFBX9JGzy
 OpD00VnqFKKveqqG72wPqbcMU/k8NX3xpRi6cfLPTHswRJnu8CPD9mWvt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="1712458"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1712458"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 06:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="1118701747"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="1118701747"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 06:39:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rU6Jm-0000000HTrg-3huR; Sun, 28 Jan 2024 16:39:30 +0200
Date: Sun, 28 Jan 2024 16:39:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v1 4/4] backlight: hx8357: Utilise temporary variable for
 struct device
Message-ID: <ZbZnItD-4v6d9qfh@smile.fi.intel.com>
References: <20240114152759.1040563-1-andriy.shevchenko@linux.intel.com>
 <20240114152759.1040563-5-andriy.shevchenko@linux.intel.com>
 <20240124172507.GA16024@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124172507.GA16024@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 05:25:07PM +0000, Daniel Thompson wrote:
> On Sun, Jan 14, 2024 at 05:25:11PM +0200, Andy Shevchenko wrote:

...

> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thank you for the review, I will address comments and send a new version
at the end of the next week I hope.

-- 
With Best Regards,
Andy Shevchenko


