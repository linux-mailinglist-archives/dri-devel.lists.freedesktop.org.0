Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE6786B03
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64F410E507;
	Thu, 24 Aug 2023 09:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A46810E507;
 Thu, 24 Aug 2023 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692867813; x=1724403813;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1ZAkSY/wD+Wa94fJkUCZoVioGpTkV1ceBb5QI3d2I6E=;
 b=lMsJWXqzqJuFvqOZhQBdv7/wx8+MUA9Ias5vNAwIUH5rGFGoixmqGZk9
 eBISrl50Kolk1bN9mHcWgIGa9U0/T/c5IEQtlAsmjgODNGVlXwATrjUku
 FtBhZ5ycM0PtH1g2J9JAXUuCusXUOuFAQLBIJHBZ7h60BuyM3c89oykHG
 lAJLInCaPmUy5apyEOWR24dPePiJpX0xilGzf/R9ou0pakv0/7KchYJXM
 aAemZmCg/7WYSBhSitm7lm6O9UgAvKzqmSK4Y943eF0dDFW2tHw+QYVCH
 afCkSa734lKW23ho6PkSeMuSWGiWQEAOPvqDKfIdZu7QExoGqRGRherCf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364561589"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="364561589"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736973743"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="736973743"
Received: from andrzejk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.90])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:03:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lee Jones <lee@kernel.org>, lee@kernel.org
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230824073710.2677348-1-lee@kernel.org>
Date: Thu, 24 Aug 2023 12:03:20 +0300
Message-ID: <87wmxk4xt3.fsf@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Stanley Yang <Stanley.Yang@amd.com>, linux-media@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyun.kwon@xilinx.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Jerome Glisse <glisse@freedesktop.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Lee Jones <lee@kernel.org> wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

The next question is, how do we keep it W=1 clean going forward?

Most people don't use W=1 because it's too noisy, so it's a bit of a
catch-22.

In i915, we enable a lot of W=1 warnings using subdir-ccflags-y in our
Makefile. For CI/developer use we also enable kernel-doc warnings by
default.

Should we start enabling some of those warning flags in drm/Makefile to
to keep the entire subsystem warning free?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
