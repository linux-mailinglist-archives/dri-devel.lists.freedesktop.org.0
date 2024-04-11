Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4834B8A170A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 16:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704C310F10B;
	Thu, 11 Apr 2024 14:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LulEtHiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A7410F10A;
 Thu, 11 Apr 2024 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712845317; x=1744381317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yxpgXBU/Wjh8LcgApWxzeDPVGxLrfiwQ5xQ2Dxtq2Vo=;
 b=LulEtHiMiy2O/V+Syp4vvesiKB73RBxSCzKC6UIPPO+YmvmjqCoUMXyY
 T2eOXvRrBJGd9QK5yYM4i9NVAKJ5QpdJ3FEjgLbWJM96jcycL+TwybAop
 Vldj+mtAB9bY+lbNj6TVY9qS4tc+rOl3xMAvx7Uc1f+P6qOzqC707nb06
 fM9RA4CHfdV9E/O6v2J60TksOMl7yHADin+gIsB5LpwKP9MFYMvf0dQ+Z
 7hki+IAokcDGJ45LOkeFvti8srOO72iI1Jp4FN8umiDNB1quayNx2EKig
 sB1ujFGt5RDLF+r/1+J96lyFLuYH1sF9+PP4km0WBH0YBJLyeNohAPZS7 A==;
X-CSE-ConnectionGUID: SPFJT++ASnakBSvMb5kSCw==
X-CSE-MsgGUID: zSrWM0qGQ8ad12OeVsN4dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12036150"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12036150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:21:57 -0700
X-CSE-ConnectionGUID: QT2LH7VTSNC0OMqRQJ8aPQ==
X-CSE-MsgGUID: m/052V2HQi2A+OuxGOpq9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25565315"
Received: from unknown (HELO intel.com) ([10.247.119.2])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:21:50 -0700
Date: Thu, 11 Apr 2024 16:21:43 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-15?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2] drm: move i915_drm.h under include/drm/intel
Message-ID: <Zhfx9weiu7Hp19gy@ashyti-mobl2.lan>
References: <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
 <20240410102615.16506-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410102615.16506-1-jani.nikula@intel.com>
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

Hi Jani,

On Wed, Apr 10, 2024 at 01:26:15PM +0300, Jani Nikula wrote:
> Clean up the top level include/drm directory by grouping all the Intel
> specific files under a common subdirectory.
> 
> v2: Also fix comment in intel_pci_config.h (Ilpo)
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  arch/x86/kernel/early-quirks.c             | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 2 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c       | 2 +-
>  drivers/gpu/drm/i915/gt/intel_rps.c        | 2 +-
>  drivers/gpu/drm/i915/intel_pci_config.h    | 2 +-
>  drivers/gpu/drm/i915/soc/intel_gmch.c      | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
>  drivers/platform/x86/intel_ips.c           | 2 +-
>  include/drm/{ => intel}/i915_drm.h         | 0
>  9 files changed, 8 insertions(+), 8 deletions(-)
>  rename include/drm/{ => intel}/i915_drm.h (100%)

Am I seeing wrong or are you missing a bunch of them, like
Documentation, MAINTAINERS and many more?

Andi
