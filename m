Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF4D3A029
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81210E380;
	Mon, 19 Jan 2026 07:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDtythUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109AC10E380
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768808463; x=1800344463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bFWKE0b6TgWpxQaPcHV9jdPULRgjopCFZs9cpiPFIK4=;
 b=EDtythUkWQFAOpL2FT5uzd8JMxpL4EVEFZ6902GB3H/1zi3eyP/4Pq9w
 amefhEAb6rngj48H55VSkBXz0YOpZCpztSFQcn0IZzSohqjt/4Mcr8Fr5
 EGCY/Qq33JFniKp/SsMi6h1VeeVyepZv/Cj5O3ksOZ6tcXXsO6/XjinWG
 QoieXfPW/oYosxGkvcl1DRI1s5AuebkoEC3Vz5SqREiDRVbuNtdZ4fFbq
 y1r63d55N32FEIcBXaH/wxIaNTy6dTR1VkvyWEmHeVp4WGa5YfNEr5faM
 p8fI6S6k+04oD4QTHHqt04mPanAtnHp1pkFeOSVZwpwL0ZP9LaLXIwGNw g==;
X-CSE-ConnectionGUID: rjgVOfhFSNOOeWVNYWR1Nw==
X-CSE-MsgGUID: LJSP+0byQTWZAPgurULufA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70102070"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="70102070"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 23:41:02 -0800
X-CSE-ConnectionGUID: H6vVu2ItTcWjpYo924LUfg==
X-CSE-MsgGUID: 1y62ggCuQImIvwNJV84elg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="237078527"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 23:41:00 -0800
Date: Mon, 19 Jan 2026 09:40:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration
 message debug-only
Message-ID: <aW3gCgB1YAsjuOZ7@smile.fi.intel.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
 <20260117042931.6088-2-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117042931.6088-2-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Fri, Jan 16, 2026 at 08:29:31PM -0800, Chintan Patel wrote:
> The framebuffer registration message is informational only and not
> useful during normal operation. Convert it to debug-level logging to
> keep the driver quiet when working correctly.

Suggested-by: Greg ...?

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


