Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9038A1D5B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 20:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126FA10ED1D;
	Thu, 11 Apr 2024 18:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaOJr/H6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1A710E6FE;
 Thu, 11 Apr 2024 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712858961; x=1744394961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UekSyLUvRggQRWmcxDvy444GKGB2UxbL3uocZHxezDY=;
 b=FaOJr/H6kBV+A29QWpYnSzkFGnRS+A+FSBPrCpMr6+Al8fUmhK7fTI0z
 pmwX6tPWZSY5HBHmckp5+eqehJiT4ik6JZPRxDKjeitTEkE5YTfvaB9SU
 cIH4mvF/L0O0tb+BFwECoJxHMj5EUlvXyH8nYCEWVNCFGj47wFv8Dm7Jq
 WFph3OTL4DarjYmeTigJ1ZlU4ChjigR7Hw/JEdn/yy2WYB0pDXAesmGyf
 F3TN5ocKMFgD64u5XKEXIGMaHswO6/XEJe2O/aviheF0YW6PG2gxqZVgk
 Mfg33SEFhNv5J8bsObk4eLrIqdZ/H/HVKZb0LhAz0CYWIZXWVQoVUt93P Q==;
X-CSE-ConnectionGUID: cF+zGjuLRDqrFJQtL8K0vA==
X-CSE-MsgGUID: sgmiEXSyRWWtleVeJAqjmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8512139"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8512139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:09:20 -0700
X-CSE-ConnectionGUID: 7S8rPLj+RHKuKpeQ3THraw==
X-CSE-MsgGUID: ofRzOERvRUK7jHE5hMvAQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21064046"
Received: from unknown (HELO intel.com) ([10.247.119.7])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 11:09:14 -0700
Date: Thu, 11 Apr 2024 20:09:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 11/10] MAINTAINERS: update i915 and xe entries for
 include/drm/intel
Message-ID: <ZhgnRDiBuSRPvGg2@ashyti-mobl2.lan>
References: <cover.1712743191.git.jani.nikula@intel.com>
 <20240411154503.342217-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411154503.342217-1-jani.nikula@intel.com>
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

On Thu, Apr 11, 2024 at 06:45:03PM +0300, Jani Nikula wrote:
> With all the Intel specific drm files under include/drm/intel, update
> the i915, xe, and the shared display entries. Do not discriminate based
> on file name pattern, just add the entire directory for all three
> entries.
> 
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
