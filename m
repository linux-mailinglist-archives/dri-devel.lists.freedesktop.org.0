Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6423C6DBE6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD9F10E5C2;
	Wed, 19 Nov 2025 09:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyIWDxMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B29210E5C2;
 Wed, 19 Nov 2025 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763544844; x=1795080844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RDGM6CtSqX/+bl4bxVO8q/wIaCZphY7YQFOIDJpWSx8=;
 b=VyIWDxMWyIDzgIF8yWXsew95a1JF2+83jXY+lOjyWzcl//mXthS7IdBb
 eouJKa7cNqZVViQInDTZUgVmUzoJeFbChfslMz+61/rroyXPKJZHaWUto
 O3AcuQIXy7p/Clic18UKoBJ8THyH4vEQs73J4ALSTdG4FoTEqSQr0UJxZ
 j80seCymYyRD7qOLVM6lQw7lFWywV2goWLPVJ2D4eEbGcUsG0UwPez6HS
 T3xhLLLwnZuR/sAPW1lZKBzS9LYo4je7s6EU6jhgeJ5UHvmhKVN6VF5Ww
 3scnnMrcyPLb/xGFTDiq7OYvAaFrLCTqeJA9lUCx0ex17+ZjPNwgmRKsO A==;
X-CSE-ConnectionGUID: 7dP6odTaRI+BxLYAEL64cA==
X-CSE-MsgGUID: iEPoZmXQTuGAjEOnI/YDTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65478634"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65478634"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:34:03 -0800
X-CSE-ConnectionGUID: n9sTI6kwSUiVEAuWiBNsOw==
X-CSE-MsgGUID: WQxdCMCdRb6Z4gEIt420iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="190803134"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:34:01 -0800
Date: Wed, 19 Nov 2025 10:33:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/buddy: Mark
 drm_test_buddy_fragmentation_performance test as slow
Message-ID: <aR2PBpZMzlaTXIJz@ashyti-mobl2.lan>
References: <20251029143313.42630-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029143313.42630-2-krzysztof.niemiec@intel.com>
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

Hi Arunpravin,

On Wed, Oct 29, 2025 at 03:33:14PM +0100, Krzysztof Niemiec wrote:
> Mark the newly introduced drm_test_buddy_fragmentation_performance test
> as KUNIT_SPEED_SLOW, as it might take more than a second on some
> systems.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Arunpravin, Maarten, any comment here?

Thanks,
Andi
