Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021F2A8422C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F53910E0D3;
	Thu, 10 Apr 2025 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duSWxbak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3C210E0D3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744286218; x=1775822218;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=CKmXBG/PEPzPtlg0BOUFBWyPS0pYatTRE4/PLiHDvaY=;
 b=duSWxbakaDCPhy7Euesu6Bp9N1WQCxmyNT75fRfsBiW31dRXU6RypSFY
 P+XJtGmdNLfWm9lPNdpjt8G+Zp99LhMcBp4yf4qkLNIR0Dt/uFB6zV/Zm
 eYJfEm+rGHOdEYvM7JAFb3WT6p7ncFLyzlPAZzoyK1/fkv5YY6ucCMff4
 PF2Lmv/TkvB9CltZIeEqv7queBYU/9xbHOD8C0h8hOzxbpUXMpQK+58oq
 tmGUanZqHl3AZdUMoVEw46Gg87b+Llk+PGOxqSQdQ5Au75ndM+GQR/3MT
 4LykKXO8q8XwUm2rGQl+5k0fAYDS0zJZe4f+LFhr/eVxySLkDnr3P2K1R w==;
X-CSE-ConnectionGUID: kzTX1sdMT0uaXnfPL6/9ug==
X-CSE-MsgGUID: pjpgmagzRbKm0vMV135aFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56779819"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56779819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 04:56:57 -0700
X-CSE-ConnectionGUID: sVWlgKpJSbOVORIwhWAQ8g==
X-CSE-MsgGUID: QxMeLRLzQAK46/UYuAbt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129427726"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 04:56:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Coster <Matt.Coster@imgtec.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable warning
In-Reply-To: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Date: Thu, 10 Apr 2025 14:56:48 +0300
Message-ID: <87mscout4v.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 10 Apr 2025, Matt Coster <Matt.Coster@imgtec.com> wrote:
> Having said that, surely it makes sense to keep at least
> *_debugfs_init() gated behind CONFIG_DEBUG_FS?

If they're basically just calls to debugfs_create_{dir,file}, the
compiler pretty much turns them into nops, and you'll get better build
coverage.

BR,
Jani.


-- 
Jani Nikula, Intel
