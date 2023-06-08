Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB60727A48
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 10:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69910E450;
	Thu,  8 Jun 2023 08:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDE510E046;
 Thu,  8 Jun 2023 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686213923; x=1717749923;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y+4GjaS/QtgCOJ129aEtHd0uWo04qFsYMdIViwW3bCA=;
 b=C9AyG9jcyQT40pv1GsF0At4zfwk5pNTXl4wYPtrfmhf8sR0krnGxjOjN
 89sshb77Qt67VcV2DCq9EcYn8ncB9phkmlHs3qSF2ynMuYUexiI9KtAcm
 il9lovse3wzwDpiTA9IEiVvsCapePvwOdEBFAlQzo8JlZPVBOh8wkn4K6
 5Iitmhn5p8ncbv5CXqSeIbcY2qSwsjlRtjRbHfJt+mSYePj04zIH4gMV+
 VUCqP2+wvw6CFlMungHcCZMUh78ZQvqNlUBoEKatci4b1EKqXNFEwzBvE
 RKWmSRHh9S2Gw9QAjz/ughoK1M5IERwpPbFOMn+q0AWkyVjKS+0IoOsix g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="423104146"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="423104146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:45:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="774971217"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="774971217"
Received: from bapostu-mobl.ger.corp.intel.com (HELO [10.251.211.75])
 ([10.251.211.75])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 01:45:03 -0700
Message-ID: <0182c0fb-fa03-9a3b-29c0-25706cc89c4a@linux.intel.com>
Date: Thu, 8 Jun 2023 10:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: [PULL] drm-MISC-fixes
Content-Language: en-US
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <ZIGUHBz7+LsqN2nm@jlahtine-mobl.ger.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ZIGUHBz7+LsqN2nm@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Oops, forgot to fix topic. :-)

On 2023-06-08 10:41, Joonas Lahtinen wrote:
> Hi Dave & Daniel,
>
> Here's the drm-intel-fixes PR for v6.4-rc6.
>
> Couple of display compatibility fixes and two static checker fixes for
> selftests.
>
> Regards, Joonas
>
> ***
>
> drm-intel-fixes-2023-06-08:
>
> CDCLK voltage fix for ADL-P and eDP wake sync pulse fix.
> Two error handling fixes to selftests (to appease static checkers)
>
> The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:
>
>   Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-06-08
>
> for you to fetch changes up to 79d0150d2d983a4f6efee676cea06027f586fcd0:
>
>   drm/i915/selftests: Add some missing error propagation (2023-06-07 12:43:22 +0300)
>
> ----------------------------------------------------------------
> CDCLK voltage fix for ADL-P and eDP wake sync pulse fix.
> Two error handling fixes to selftests (to appease static checkers)
>
> ----------------------------------------------------------------
> Andi Shyti (1):
>       drm/i915/gt: Use the correct error value when kernel_context() fails
>
> Chaitanya Kumar Borah (1):
>       drm/i915/display: Set correct voltage level for 480MHz CDCLK
>
> Jouni Högander (1):
>       drm/i915: Use 18 fast wake AUX sync len
>
> Tvrtko Ursulin (1):
>       drm/i915/selftests: Add some missing error propagation
>
>  drivers/gpu/drm/i915/display/intel_cdclk.c         | 30 +++++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_aux.c        |  2 +-
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 +++++++---
>  drivers/gpu/drm/i915/gt/selftest_execlists.c       | 12 ++++++---
>  4 files changed, 45 insertions(+), 13 deletions(-)
