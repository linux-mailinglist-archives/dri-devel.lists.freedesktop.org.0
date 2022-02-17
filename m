Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6C4BA9E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2012610E72C;
	Thu, 17 Feb 2022 19:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E3510E206;
 Thu, 17 Feb 2022 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645126519; x=1676662519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PCIc8R938Gw6+OOWD8T0O/hqNVXqP/Me74Z+JDMG4Hw=;
 b=AGYaSCnhDdgnd1nBe4a/18aVxVaIE60g6WfwfZzPJtAI9J3emlSU0UfA
 efnftsjOMFS5kdepQmkqzgw4/hBH/CVMprS8qAzzv6vrIgTcX9wwDn8vh
 Lw9uXHyD+g5mYZaeu1Fa5E6+hOxru1UBdd6jas9NZGEROfP4gXXR58KP7
 /mpwxztEEXb64BH1So2ALxKp8IAQcpOTiOujGdj4k+cS9ZPuAxEFQKOCC
 6IhzID9GOOMe/hVkN02VrzwF/lYsZ+uQf5tUADyku8AQZSzst30nj61c4
 ecckQoDHkB2lkdwMY7DVByBpvqS10iVI4Kv9AMbWxfD33s/7W+O+228Kc A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337402500"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="337402500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:35:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530465307"
Received: from csavery-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.47.201])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:35:19 -0800
Date: Thu, 17 Feb 2022 11:35:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/dg2: Drop 38.4 MHz MPLLB tables
Message-ID: <20220217193518.7efoiswvblp5kvd3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215055154.15363-3-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 11:21:53AM +0530, Ramalingam C wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Our early understanding of DG2 was incorrect; since the 5th display
>isn't actually a Type-C output, 38.4 MHz input clocks are never used on
>this platform and we can drop the corresponding MPLLB tables.
>
>Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
>Cc: José Roberto de Souza <jose.souza@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>---
> drivers/gpu/drm/i915/display/intel_snps_phy.c | 208 +-----------------
> 1 file changed, 1 insertion(+), 207 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_snps_phy.c b/drivers/gpu/drm/i915/display/intel_snps_phy.c
>index 8573a458811a..c60575cb5368 100644
>--- a/drivers/gpu/drm/i915/display/intel_snps_phy.c
>+++ b/drivers/gpu/drm/i915/display/intel_snps_phy.c
>@@ -250,197 +250,6 @@ static const struct intel_mpllb_state * const dg2_dp_100_tables[] = {
> 	NULL,
> };
>
>-/*
>- * Basic DP link rates with 38.4 MHz reference clock.
>- */
>-
>-static const struct intel_mpllb_state dg2_dp_rbr_38_4 = {
>-	.clock = 162000,
>-	.ref_control =
>-		REG_FIELD_PREP(SNPS_PHY_REF_CONTROL_REF_RANGE, 1),
>-	.mpllb_cp =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT, 5) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP, 25) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT_GS, 65) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP_GS, 127),
>-	.mpllb_div =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV5_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_TX_CLK_DIV, 2) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_PMIX_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_V2I, 2) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FREQ_VCO, 2),
>-	.mpllb_div2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_REF_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_MULTIPLIER, 304),
>-	.mpllb_fracn1 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_CGG_UPDATE_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_DEN, 1),
>-	.mpllb_fracn2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_QUOT, 49152),
>-};
>-
>-static const struct intel_mpllb_state dg2_dp_hbr1_38_4 = {
>-	.clock = 270000,
>-	.ref_control =
>-		REG_FIELD_PREP(SNPS_PHY_REF_CONTROL_REF_RANGE, 1),
>-	.mpllb_cp =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT, 5) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP, 25) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT_GS, 65) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP_GS, 127),
>-	.mpllb_div =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV5_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_TX_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_PMIX_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_V2I, 2) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FREQ_VCO, 3),
>-	.mpllb_div2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_REF_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_MULTIPLIER, 248),
>-	.mpllb_fracn1 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_CGG_UPDATE_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_DEN, 1),
>-	.mpllb_fracn2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_QUOT, 40960),
>-};
>-
>-static const struct intel_mpllb_state dg2_dp_hbr2_38_4 = {
>-	.clock = 540000,
>-	.ref_control =
>-		REG_FIELD_PREP(SNPS_PHY_REF_CONTROL_REF_RANGE, 1),
>-	.mpllb_cp =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT, 5) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP, 25) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT_GS, 65) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP_GS, 127),
>-	.mpllb_div =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV5_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_PMIX_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_V2I, 2) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FREQ_VCO, 3),
>-	.mpllb_div2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_REF_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_MULTIPLIER, 248),
>-	.mpllb_fracn1 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_CGG_UPDATE_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_DEN, 1),
>-	.mpllb_fracn2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_QUOT, 40960),
>-};
>-
>-static const struct intel_mpllb_state dg2_dp_hbr3_38_4 = {
>-	.clock = 810000,
>-	.ref_control =
>-		REG_FIELD_PREP(SNPS_PHY_REF_CONTROL_REF_RANGE, 1),
>-	.mpllb_cp =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT, 6) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP, 26) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT_GS, 65) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP_GS, 127),
>-	.mpllb_div =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV5_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_PMIX_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_V2I, 2),
>-	.mpllb_div2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_REF_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_MULTIPLIER, 388),
>-	.mpllb_fracn1 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_CGG_UPDATE_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_DEN, 1),
>-	.mpllb_fracn2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_QUOT, 61440),
>-};
>-
>-static const struct intel_mpllb_state dg2_dp_uhbr10_38_4 = {
>-	.clock = 1000000,
>-	.ref_control =
>-		REG_FIELD_PREP(SNPS_PHY_REF_CONTROL_REF_RANGE, 1),
>-	.mpllb_cp =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT, 5) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP, 26) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT_GS, 65) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP_GS, 127),
>-	.mpllb_div =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV5_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV_MULTIPLIER, 8) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_PMIX_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_WORD_DIV2_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DP2_MODE, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SHIM_DIV32_CLK_SEL, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_V2I, 2),
>-	.mpllb_div2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_REF_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_MULTIPLIER, 488),
>-	.mpllb_fracn1 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_CGG_UPDATE_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_DEN, 3),
>-	.mpllb_fracn2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_REM, 2) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_QUOT, 27306),
>-
>-	/*
>-	 * SSC will be enabled, DP UHBR has a minimum SSC requirement.
>-	 */
>-	.mpllb_sscen =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SSC_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SSC_PEAK, 76800),
>-	.mpllb_sscstep =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SSC_STEPSIZE, 129024),
>-};
>-
>-static const struct intel_mpllb_state dg2_dp_uhbr13_38_4 = {
>-	.clock = 1350000,
>-	.ref_control =
>-		REG_FIELD_PREP(SNPS_PHY_REF_CONTROL_REF_RANGE, 1),
>-	.mpllb_cp =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT, 6) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP, 56) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_INT_GS, 65) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_CP_PROP_GS, 127),
>-	.mpllb_div =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV5_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV_CLK_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DIV_MULTIPLIER, 8) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_PMIX_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_WORD_DIV2_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_DP2_MODE, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_V2I, 3),
>-	.mpllb_div2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_REF_CLK_DIV, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_MULTIPLIER, 670),
>-	.mpllb_fracn1 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_CGG_UPDATE_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_DEN, 1),
>-	.mpllb_fracn2 =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_FRACN_QUOT, 36864),
>-
>-	/*
>-	 * SSC will be enabled, DP UHBR has a minimum SSC requirement.
>-	 */
>-	.mpllb_sscen =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SSC_EN, 1) |
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SSC_PEAK, 103680),
>-	.mpllb_sscstep =
>-		REG_FIELD_PREP(SNPS_PHY_MPLLB_SSC_STEPSIZE, 174182),
>-};
>-
>-static const struct intel_mpllb_state * const dg2_dp_38_4_tables[] = {
>-	&dg2_dp_rbr_38_4,
>-	&dg2_dp_hbr1_38_4,
>-	&dg2_dp_hbr2_38_4,
>-	&dg2_dp_hbr3_38_4,
>-	&dg2_dp_uhbr10_38_4,
>-	&dg2_dp_uhbr13_38_4,
>-	NULL,
>-};
>-
> /*
>  * eDP link rates with 100 MHz reference clock.
>  */
>@@ -749,22 +558,7 @@ intel_mpllb_tables_get(struct intel_crtc_state *crtc_state,
> 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
> 		return dg2_edp_tables;
> 	} else if (intel_crtc_has_dp_encoder(crtc_state)) {
>-		/*
>-		 * FIXME: Initially we're just enabling the "combo" outputs on
>-		 * port A-D.  The MPLLB for those ports takes an input from the
>-		 * "Display Filter PLL" which always has an output frequency
>-		 * of 100 MHz, hence the use of the _100 tables below.
>-		 *
>-		 * Once we enable port TC1 it will either use the same 100 MHz
>-		 * "Display Filter PLL" (when strapped to support a native
>-		 * display connection) or different 38.4 MHz "Filter PLL" when
>-		 * strapped to support a USB connection, so we'll need to check
>-		 * that to determine which table to use.
>-		 */
>-		if (0)
>-			return dg2_dp_38_4_tables;
>-		else
>-			return dg2_dp_100_tables;
>+		return dg2_dp_100_tables;
> 	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
> 		return dg2_hdmi_tables;
> 	}
>-- 
>2.20.1
>
