Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47DD413DC4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 00:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D8C6E88B;
	Tue, 21 Sep 2021 22:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55C56E5B2;
 Tue, 21 Sep 2021 22:58:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A9D061183;
 Tue, 21 Sep 2021 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632265109;
 bh=bohJExFW1yPNYHxfeNBgqeE4SD0v9efgL6NRIGVa8Vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdP5nbViHn1pi8Gh+UqzeMFvIgX8AN46LPD9EhqxYmi432PXTu0HORAxwcCwbvUb0
 bRZe/gmXbE6tcVYIUHgesdWpl7PAIo1Rs/VzGozbeRgYwzf+rUBUITHRHSLbJuKO/z
 Y0Im/8ygppODghkp7NmQHTX4P/Qd1628Zf4Dhxr7Vb4x2uHWA2FdDuu/6cviKa8fCg
 3ZA8maPCNjHPsaXAzATTdsYKOdGaw1ewfRDRxh8899H7rKvp6ObrGtvMTdkVwmMhfM
 7ER/E6Ebt6FUht5sjN/cg5fLIuWwjeQxd8oDhyX+u1Lkq+qa9OLST7TeVVHciJkDru
 p1f+uXVf8IG9A==
Date: Tue, 21 Sep 2021 15:58:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v3 03/13] drm/dp: add LTTPR DP 2.0 DPCD
 addresses
Message-ID: <YUpjj7IwBqMYSR7z@archlinux-ax161>
References: <cover.1631191763.git.jani.nikula@intel.com>
 <def17e2329722f22c35807be26b35590ccb93bfd.1631191763.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <def17e2329722f22c35807be26b35590ccb93bfd.1631191763.git.jani.nikula@intel.com>
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

On Thu, Sep 09, 2021 at 03:51:55PM +0300, Jani Nikula wrote:
> DP 2.0 brings some new DPCD addresses for PHY repeaters.
> 
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_dp_helper.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 1d5b3dbb6e56..f3a61341011d 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1319,6 +1319,10 @@ struct drm_panel;
>  #define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /* 1.4a */
>  #define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
>  #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /* 1.4a */
> +#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	    0xf0006 /* 2.0 */
> +# define DP_PHY_REPEATER_128B132B_SUPPORTED		    (1 << 0)
> +/* See DP_128B132B_SUPPORTED_LINK_RATES for values */
> +#define DP_PHY_REPEATER_128B132B_RATES			    0xf0007 /* 2.0 */
>  
>  enum drm_dp_phy {
>  	DP_PHY_DPRX,
> -- 
> 2.30.2
> 
> 

This patch causes a build failure in -next when combined with the AMD
tree:

In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:33:
In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:70:
In file included from ./drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_mode.h:36:
./include/drm/drm_dp_helper.h:1322:9: error: 'DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER' macro redefined [-Werror,-Wmacro-redefined]
#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER            0xf0006 /* 2.0 */
        ^
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:881:9: note: previous definition is here
#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER        0xF0006
        ^
1 error generated.

Perhaps something like this should be applied during the merge of the
second tree or maybe this patch should be in a branch that could be
shared between the Intel and AMD trees so that this diff could be
applied to the AMD tree directly? Not sure what the standard procedure
for this is.

Cheers,
Nathan

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 234dfbea926a..279863b5c650 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -4590,7 +4590,7 @@ bool dp_retrieve_lttpr_cap(struct dc_link *link)
 								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
 
 		link->dpcd_caps.lttpr_caps.supported_128b_132b_rates.raw =
-				lttpr_dpcd_data[DP_PHY_REPEATER_128b_132b_RATES -
+				lttpr_dpcd_data[DP_PHY_REPEATER_128B132B_RATES -
 								DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV];
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index a5e798b5da79..8caf9af5ffa2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -878,8 +878,6 @@ struct psr_caps {
 # define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
 # define DP_DSC_DECODER_COUNT_SHIFT			5
 #define DP_MAIN_LINK_CHANNEL_CODING_SET			0x108
-#define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	0xF0006
-#define DP_PHY_REPEATER_128b_132b_RATES			0xF0007
 #define DP_128b_132b_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1	0xF0022
 #define DP_INTRA_HOP_AUX_REPLY_INDICATION		(1 << 3)
 /* TODO - Use DRM header to replace above once available */
