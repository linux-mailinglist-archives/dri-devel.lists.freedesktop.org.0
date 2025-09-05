Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8803FB45D62
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 18:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C8710EC06;
	Fri,  5 Sep 2025 16:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0w1bd62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F185010EC06;
 Fri,  5 Sep 2025 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757088267; x=1788624267;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jwd7+H8U/t0LbYV+5t8mOUHDk4K1IJG9naWnInA+oqs=;
 b=n0w1bd62O7hqGw3M5Z+kNFKqjCxuXUvhL3+M53vzAX7vS8ryjpc528F4
 GbzJjcyBmaW3JmLJLP3G05HYzs29PEI4dFx610MMOEdJtYfHj73jMbzUb
 oRTXd18cSSWDE9gd16i0HtYWpsl5WtLJ/73y3UwI1Ar2PGNNzuXePu1+B
 ezyqU6Smq12iBvxTOe/AzYr4ZiM0QRMzaAdvRev5d++l5GSGW78iaT3KC
 vNoyIFY3j1fxB92P+cQosLvVSSj1PrYRvfg5E4U4uQ89iCoq+PC12FoYn
 DkG2wM49e6DLn2ephI6uUyRfU3e8XILRwEMDH4hGUqD64wQ3tlN8pMhh3 g==;
X-CSE-ConnectionGUID: yMaegc1kTqKqlpmRKUruqg==
X-CSE-MsgGUID: U/tb2ljqSGicbvwkY3i71w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59364530"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59364530"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 09:04:26 -0700
X-CSE-ConnectionGUID: NJyCPtGKQri3oTqrCQQxqg==
X-CSE-MsgGUID: D9WBD4EORoK6IXMRcIC9ug==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 09:04:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 09:04:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 09:04:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 09:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dduh0NJ/4JKZIQ/nnFun7/BtEW86uhXObkeg3tfTfTN3rJ7UBvNDVcLrR04+MbPauHhtpGO5RNxY9WSsd+BajGqNjeOahT2JLnJIj3WuconC8kChDIFHNVjrUauMSevj8iD78ASfv/M14+E0btlrtUjGl6RGjJHUGgdIGWnftlfEyGVx4WI7fn/pwTY2cosWDbXDOjZYLXUunQTekOSzNqvNqaWQG8z19Ju6psUxTzWnmANfaUQK30hp0//N1bQnBeIhGKVp1//s4im31JT9c0Y9u02WuPVGnbCBfhedZ6/N4ciu0cMBGhHC7dGaD9kJkKXaDxsyXIF97VOSDOQCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVnXCoP/3oBiKcXQFwGWkpNPmCEC9ReJv8mbSL/nuHs=;
 b=Ga3nXqe/pSg4obz4Rjp5AriQxxm2Z/GYqkCrhVJxX38BdD79QrzPqKzCkd283fj+jTdfnoBAto40WWa8JuVESMmuZCqk15SKrnL2euSFh/DUo0wchuOzM9B6t1f+kwjg9E0YOC6oxhZRguknw3UY/4xDPYb1/CyPgpgptMiinUUrEEqnzsDey0zKVoHQ/UyCMq45LXGmY7wXEI9wUgdSIbT5oHamwBPeHJisBAPeLKj54vP7LTgmWfPIbIbeyxxob/nDko4jBqYCReoLu+ncWTskIfR0rxsHVIjgyr73282JCztRkaazGRMPeiVNUX9v3W3jlSSSF+OY+6B4hU/Ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 16:04:17 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 16:04:17 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin
 <sashal@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <stable@vger.kernel.org>
Subject: [PATCH v6.16.y] drm/dp: Change AUX DPCD probe address to
 DP_TRAINING_PATTERN_SET
Date: Fri, 5 Sep 2025 19:04:12 +0300
Message-ID: <20250905160412.2644910-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f8a73c-8017-4bce-c144-08ddec95de1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FYrwGdkm12gmuAEp8Y07H6hPnMQToaO+PoTngJUpExsHlrAXc858h6WxHtMj?=
 =?us-ascii?Q?tNSMw4tidfx0E/9BAsdxhzgAQucOty8g93u5GVXzMFnhPQQoxTjGFYQwL4cE?=
 =?us-ascii?Q?N8+5n1jI6MaBGLwwc+DXvbIUV8Sxi5RhInfnR1tC5k9Ms458YHGoemk+5Q8K?=
 =?us-ascii?Q?K45BFEeehx1wnecs5KC79eoeb+fjLB8tm1TXjia2D51e0LTboCbvt2H8rAsv?=
 =?us-ascii?Q?muk8Dzyc8jIGLrcRKqxM7NzgAqqy8qU3OdPFJuBYQXD1Wyd4a0FSg9QdRNzl?=
 =?us-ascii?Q?GNFqvoKz79kgTzi0pfmNGRNwEbje6WEdc6W6QO88iidnM6fYgdssyQpDvkIQ?=
 =?us-ascii?Q?kZjalEhVeu4NMtJxeGcXtpwKTMzkyMrIofKFaENtq3DJINyR2Cz9oV2d8jId?=
 =?us-ascii?Q?2U5MSqeGRg11ICaeE6rAsWh4yfvueYx9GijAC5J5K9SkGYTWNbRAFrsmRsit?=
 =?us-ascii?Q?Ep/Kx7gTfDpK0cbt2atckmEJhlcZ2/R7o2k0Mx73EuZYHHCHJTJIaxc6qNbU?=
 =?us-ascii?Q?M7oPKNoWzX9S97FY71UI4vSo9cm5PCj4HWGPhRnbmHoedyo23/X0IJTmJPdK?=
 =?us-ascii?Q?Mpp/mKVeKIgy9FDQmBjcNi58N5T/29zuonSOrZaD2NjBrRCdWFTfAteXRvyd?=
 =?us-ascii?Q?C5xFonfHEVffN6vlg3Z9qK+xTdEPrK9hazqzBkH8nu7I9y62LIqAB2C2VszB?=
 =?us-ascii?Q?GVeSeuk41a/7fSLAWFaN8hB5acmN4C0bmIIowNakYdfGR5J+97omKOG2ekT1?=
 =?us-ascii?Q?kdJhth0XT0GI47FWJDJWxYb8ZVzSUp1Hg56ctV90FI52BIO/5Cm2o/Qq0CGj?=
 =?us-ascii?Q?MtlKhYgUqV8CJLs1q/4jaSXGrXdOoQ8QvyDguTSC7QDLHLALjUouNz7HAqmp?=
 =?us-ascii?Q?6KzwqSNjMjdjD+DTegtO2IFqHnN87vBuXKhw0ok8hT75/ERKkGXjU+iF1zoD?=
 =?us-ascii?Q?6/pCOncCRaZPfbeESpc299Fa1XYM/c0q86dgFm1U8wSR8jf9bCcMeWPMH4c9?=
 =?us-ascii?Q?8E1Cbo7pakzOzFzqRFbBq9lQw/+4/Mjam8AltlEMydtq1obSrIbyja2k4gVe?=
 =?us-ascii?Q?aMCD864Blk3DBVR2fi/qGmcOqSV3wJRT/nwCEaRTK0BTwhl/AaKyRnMNN5Ze?=
 =?us-ascii?Q?UwFP+s0U5DTA544WcLt2eSDZJLyIZqD/Dp5ko+ByLbIWqr/5BpxnYPH+QYMM?=
 =?us-ascii?Q?ewWHyTA0sG33/DLdLedBIydwmPK1x10ZwfuLAqTBcqMHc1EsBo5br1lJnOOC?=
 =?us-ascii?Q?rHrSom4Jx02wYT3uI84LeWxvEqSZPMLpTEMIfnnVVqvjh8rB4RJrXJoPjtxl?=
 =?us-ascii?Q?NMNxJQB+WlBbvyVJEV9568owDyF0hXLhlkkydRvxuYukRE5eq4GP73MeNL26?=
 =?us-ascii?Q?3vuaGR+NyldlnId3a1oVH6JIRUIRVAe6Ww5a8JB8kcUyS52XWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+gi2OC94e4GeE5miak7N8CFB9S6rYn0jRXV6MBqw0ur00hk3peQriECfI1sL?=
 =?us-ascii?Q?NcPdVirxMgat8HPFgnF+39mzSVHnk/U7o1IkmzRq6hmqxvdYQ8bMz6wYGmKI?=
 =?us-ascii?Q?OiyxNKwDVRMKrLpZxERty8JvSj1EDSRBghUl9hELhpN7pB3ZJ4fCHv95h4jq?=
 =?us-ascii?Q?QKv7OEmdKxSDccyoau2irMlH4HpNq/Nb2+P66p5FdD6J2vzQ4DQMb1ZbvjZN?=
 =?us-ascii?Q?+G4QmHiO4HQvNQUgre4a9Jg6FTuaXzGDXR8YH3QJ2lCTSExst23l67wmcj8o?=
 =?us-ascii?Q?PzxGsTIzu+dbtM5xFAqlhQJN+d/U8Fyckajuk6pvwNar/sPYSJPjpiH1GB35?=
 =?us-ascii?Q?3rgOf5E8j4KUsAWvhputamAOTiyzYuqhOmhKZkqMwQ8LHSrbRtuYzmsvOVkM?=
 =?us-ascii?Q?058BLy1NvBoqF1Bn/d7uKTvg98ZGlzsRHUSP6IEEaOmV5RnwSyr4IrwbjRUA?=
 =?us-ascii?Q?E3RpfcEQN7sQ4J+iTC9WLMqv5GzxihgMCqQ8VRuR1H9G+lkVOA8kVtjw6Bwm?=
 =?us-ascii?Q?1BM8aa2psFRgEDHo9IIqtklLCPIK0Ky8fQ3RZBIg14dkJ6b10/IlYT1doH4D?=
 =?us-ascii?Q?bcL+fzTwQYM3O4HHRurWF2L8QYVBDPP8RfyWFpRqYBSqKgb3yCzx70Gsets9?=
 =?us-ascii?Q?X0BDuRmUDzVHyuglW/lRpERpTpLAWm/eYW84IHbkW8oZOqP+ZstlvVrN8p6S?=
 =?us-ascii?Q?bDDinU/GpvheiKRcJWbBAz/U95eww5JtqIbo0umskwJWCka0jLA3qyPNcilW?=
 =?us-ascii?Q?5N1cjmrQcKYJpUWWNW/FLHzyUXCzIBt6k+E4TRGqvUr+hLazWw9Rd/d+UZU2?=
 =?us-ascii?Q?jVdRiCgaA51AdF1VcaAlDkDQIo2XyRrg311O94wRik5WIbljVdnsU9Fb/q99?=
 =?us-ascii?Q?Rtx1FYFDiLqar7Ln8TGJOyOFN7PbxmXtZxc6tTIYiA3BcUWrzholMH4v1/Nw?=
 =?us-ascii?Q?BuUhX66tRXfZY4p1hR8dCazJmvT0qpa2ebpgHqwUd2GzsMJ+PB59QKs4Q5Tq?=
 =?us-ascii?Q?fJBisBkdFSIjaN4yzok8YutXGMQAPThh+3yYKmqLXzce4tOPZESmWYu3lb7h?=
 =?us-ascii?Q?kqizliaEuPmoFsRGLmFehjcNoRXbrsCQI2YfGJnNWG6sFytDFH/s11daHmw9?=
 =?us-ascii?Q?KMl3DGbhxi4oY5A06FCZH2tdtTQv4XiE375MEMcr3fF027OVIPuTBstHImwK?=
 =?us-ascii?Q?FbPg/9MXtrDHR6/0S+sIo21x9c6NdpSfnGcYypQwN8mWhiQjfq9c3+JmlCwP?=
 =?us-ascii?Q?a6J4FCzCPsal9eEJflZQ7JJIsNag+xbgWCCsoRRQrXGMvMP1XqL2uGzB+hOi?=
 =?us-ascii?Q?gH9UkpehvqP9q4a+vNaVBxBzJ9dC/TMnGJDfUvjz5UL/cpc3sSWMWRawBrMZ?=
 =?us-ascii?Q?akSHt35Lio6XK4q8qRy+Eb8F7fHBEqfeqewSqhv5FFAL46RFqpe/m/7/rJTw?=
 =?us-ascii?Q?h8gBtn0dJpXIJSSIww41Jiec38PGIXF7QV7FQzBKhGFEeuhfLETW7K0vMGaL?=
 =?us-ascii?Q?/fumSe2vyl7R/wqUiwLZmCvfEmSLQp0dUelTYfbGn6wiKMip9oCEqKnOtp6L?=
 =?us-ascii?Q?kmu/dE2ucWoxNxvuJLWrMwJOa/W/3qMO1cY5t0qmocSJidU5MV1+Bw25ayZ2?=
 =?us-ascii?Q?UFQ+85yxAl9wn/b4bw71eF7synyNAW+9a2tqRNS6vPFQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f8a73c-8017-4bce-c144-08ddec95de1d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 16:04:17.8437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6L58KasgSw+T8bkEfTgtPDQ4CBSbl5Oux6Rxgf28MsvdWwVsRHSphZEyR6PPHFHv36m/tJuuNggZibDZfUV5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-OriginatorOrg: intel.com
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

commit d34d6feaf4a76833effcec0b148b65946b04cde8 upstream.

Change the AUX DPCD probe address to DP_TRAINING_PATTERN_SET. Using
DP_DPCD_REV for this is not compliant with the DP Standard and it leads
to link training failures at least on a DP2.0 docking station when using
UHBR link rates.

This patch is a revert of commit 944e732be9c3 ("drm/dp: Change AUX DPCD
probe address from DPCD_REV to LANE0_1_STATUS") and the corresponding
fix for commit 05981233cf2e ("Revert "drm/dp: Change AUX DPCD probe
address from DPCD_REV to LANE0_1_STATUS") in the v6.16.y tree.

This change is only meant to be applied in the v6.16.y tree, not in
earlier stable trees.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org # v6.16
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2a6559a27100..ea78c6c8ca7a6 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
+		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.49.1

