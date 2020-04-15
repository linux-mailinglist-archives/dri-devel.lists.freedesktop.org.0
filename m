Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998DF1A9362
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 08:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F74F6E843;
	Wed, 15 Apr 2020 06:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE016E843;
 Wed, 15 Apr 2020 06:40:58 +0000 (UTC)
IronPort-SDR: uexyfN1itqDJiNoL29EXawEnu9OZwiqgwkcnbPEKs3a+dShB9EszCh4j4/YowPzpFpbsGddX0z
 NvjJBNf1c6OQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 23:40:58 -0700
IronPort-SDR: TSubj7AlgONuDek38NyTkQJgTzcprYRSrnIUV4xWqXgT2BNcWsTcDF8n/l7gXPGCCouTKcchRZ
 aQfUyDW+uFQw==
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427331733"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 23:40:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PULL] topic/phy-compliance
In-Reply-To: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <efb3d0d9-2cf7-046b-3a9b-2548d086258e@linux.intel.com>
Date: Wed, 15 Apr 2020 09:40:50 +0300
Message-ID: <87wo6h5k0d.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Apr 2020, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Hey,
>
> Here's a pull request to pull in the DP PHY Compliance series.
> It's based on top of drm/drm-next, and contains all patches for core, amd and i915. :)

Ping, I don't see this merged in any tree yet.

BR,
Jani.


>
> Cheers,
> Maarten
>
> topic/phy-compliance-2020-04-08:
> Topic pull request for topic/phy-compliance:
> - Standardize DP_PHY_TEST_PATTERN name.
> - Add support for setting/getting test pattern from sink.
> - Implement DP PHY compliance to i915.
> The following changes since commit 12ab316ced2c5f32ced0e6300a054db644b5444a:
>
>   Merge tag 'amd-drm-next-5.7-2020-04-01' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-04-08 09:34:27 +1000)
>
> are available in the Git repository at:
>
>   git://anongit.freedesktop.org/drm/drm-misc tags/topic/phy-compliance-2020-04-08
>
> for you to fetch changes up to 8cdf727119289db3a98835662eb28e1c5ad835f1:
>
>   drm/i915/dp: Program vswing, pre-emphasis, test-pattern (2020-04-08 14:41:09 +0200)
>
> ----------------------------------------------------------------
> Topic pull request for topic/phy-compliance:
> - Standardize DP_PHY_TEST_PATTERN name.
> - Add support for setting/getting test pattern from sink.
> - Implement DP PHY compliance to i915.
>
> ----------------------------------------------------------------
> Animesh Manna (7):
>       drm/amd/display: Align macro name as per DP spec
>       drm/dp: get/set phy compliance pattern
>       drm/i915/dp: Made intel_dp_adjust_train() non-static
>       drm/i915/dp: Preparation for DP phy compliance auto test
>       drm/i915/dp: Add debugfs entry for DP phy compliance
>       drm/i915/dp: Register definition for DP compliance register
>       drm/i915/dp: Program vswing, pre-emphasis, test-pattern
>
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |   2 +-
>  drivers/gpu/drm/drm_dp_helper.c                    |  94 +++++++++++
>  .../gpu/drm/i915/display/intel_display_debugfs.c   |  12 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |   1 +
>  drivers/gpu/drm/i915/display/intel_dp.c            | 171 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h            |   1 +
>  .../gpu/drm/i915/display/intel_dp_link_training.c  |   9 +-
>  .../gpu/drm/i915/display/intel_dp_link_training.h  |   4 +
>  drivers/gpu/drm/i915/i915_reg.h                    |  18 +++
>  include/drm/drm_dp_helper.h                        |  33 +++-
>  10 files changed, 337 insertions(+), 8 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
