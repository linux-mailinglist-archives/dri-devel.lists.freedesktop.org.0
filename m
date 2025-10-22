Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADF0BFB589
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8035110E736;
	Wed, 22 Oct 2025 10:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lG0UOy/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E261910E736;
 Wed, 22 Oct 2025 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761128045; x=1792664045;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6vjn1H8rNiLOgQgAa18nhmtmVtmG907ZLx+q3HiuLqQ=;
 b=lG0UOy/8TSALBJWC5lgJIGj3yHKDBLilMyZ6e5Ziepbc11tXchn5cwXA
 rGWc41TJco8sAIgmNwBT9hXrDXd/VTQRodmW/pMj4Y3/+oRW5uaD+hTyK
 DpnsaNCKMYWQYbOC/Z4CwrnKPFLTVYb76AiOF0SKPeis9uaa7Lo8LHnKr
 sr1nEsUxVZWQpbrn+CD3Wf3ZhXBEYzgGFigfgoyUeVYBCgOEy5raLXvV9
 5LKrRgLqyuTSfjjWiSSwtcEUj7Ni1tzlGbrNENezLr4vcm9aJUmoeaqkK
 xKJGoJ+nmpmWH8esc/ilYkdDBaCGvPDkEdTKRSLOXQ019yV81U9/SZmVM Q==;
X-CSE-ConnectionGUID: MlXB5h0UROKeTVLCl8b6rQ==
X-CSE-MsgGUID: me+yIIWKTf+BrIOZPb3bXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67135584"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="67135584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:14:04 -0700
X-CSE-ConnectionGUID: 2+FicCQ3SYWK+M+zCq0wYw==
X-CSE-MsgGUID: TqWbeSpjQhioYfAg0WFvtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="183004343"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.57])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 03:14:01 -0700
Date: Wed, 22 Oct 2025 12:13:59 +0200
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
Subject: Re: [PATCH] drm/buddy: Mark drm_test_buddy_fragmentation_performance
 test as slow
Message-ID: <aPiuZz4W5jj__n8g@ashyti-mobl2.lan>
References: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021164341.6154-2-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,

On Tue, Oct 21, 2025 at 06:43:42PM +0200, Krzysztof Niemiec wrote:
> Mark the newly introduced drm_test_buddy_fragmentation_performance test
> as KUNIT_SPEED_SLOW, as it might take more than a second on some
> systems.
> 
> Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095

This is Closes: not Fixes: and please don't add a blank line
between tags.

Please, next time in this path, Cc also:

  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
  Maxime Ripard <mripard@kernel.org>
  Thomas Zimmermann <tzimmermann@suse.de>

Andi
