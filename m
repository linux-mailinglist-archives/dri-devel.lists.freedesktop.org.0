Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F5FAD8E9D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D1210E818;
	Fri, 13 Jun 2025 14:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gANT4e3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610D210E818
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749823671; x=1781359671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dA4D2S46ied9NuQDZ7CAgiyD9gqRqEO1YNwc/fGTh08=;
 b=gANT4e3KLv1kkpq4bMu+6xC2+RdRldAgso0JL2oQ+jJG2D71mRtjOdvJ
 in51K1tuPHeg7Z4RAbUvWT2kVBvy95SYopc8xmUteWKqC3Xy9V4Qox9na
 PB0s+ZnOxhqb6pdWgf4O6uOsEtrLPiHhq0SgYoGYDvXmFu3LmKwjihOCW
 JeoF015tR0aJFYOF3a8x7rNiYdizyOoJKtcx+CzwFyxgPnzRCoTvsLS2r
 GR59DmtOnft8iz+hMeCBhRW/Y5BoGqwkt8kvKzx8c6JA+QAsn1uzmlOta
 mvTUHNtUehTGELe9MDMtsKNtxIyQdZQND+9ps9YK0J3S9kP2np8D50ir9 g==;
X-CSE-ConnectionGUID: Feee8UiUT7Wjin05mtqceQ==
X-CSE-MsgGUID: BNUV8DQmTeKOvHwM3vyvAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51758644"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="51758644"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:07:51 -0700
X-CSE-ConnectionGUID: uyNbB6uVQWCjgCMVTTbPJg==
X-CSE-MsgGUID: EYk9ONKHRVqZdtMvohVXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="153127956"
Received: from johunt-mobl9.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.161])
 by orviesa005.jf.intel.com with SMTP; 13 Jun 2025 07:07:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Jun 2025 17:07:47 +0300
Date: Fri, 13 Jun 2025 17:07:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Message-ID: <aEwws4nPXHNnK2Fa@intel.com>
References: <20250604113234.2520-1-christian.koenig@amd.com>
 <aEwrIrczo1rSx2rr@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEwrIrczo1rSx2rr@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Jun 13, 2025 at 05:04:31PM +0300, Ville Syrjälä wrote:
> On Wed, Jun 04, 2025 at 01:32:34PM +0200, Christian König wrote:
> > This was added by Sima +10 years ago as a solution to avoid exporting
> > multiple dma-bufs for the same GEM object. I tried to remove it before,
> > but wasn't 100% sure about all the side effects.
> > 
> > Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
> > it obvious that this is a superflous step. We try to look up the DMA-buf
> > by handle handle and if that fails for some reason (must likely because
> > the handle is a duplicate) the code just use the DMA-buf from the GEM
> > object.
> > 
> > Just using the DMA-buf from the GEM object in the first place has the
> > same effect as far as I can see.
> 
> This screwed up i915/xe:
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html

Never mind. Already being discussed.

-- 
Ville Syrjälä
Intel
