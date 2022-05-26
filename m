Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D7534A75
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8910F68C;
	Thu, 26 May 2022 06:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5034210F154;
 Thu, 26 May 2022 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653547635; x=1685083635;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=f5Rs9mZcv0WZGymRbqX2P7OqWLjW7GSX0tNmGJmKKwU=;
 b=m60+xJ72wE5KaveDwfsSh+GqoDhfMpr0ilF2yxtvH5bqaUdgAp8A37Xz
 Db6/DNs/tCdA7+fT7PAcVPstRF0OxXp7r1lcUfLxOVSk+/vIlKQB6p3lt
 1khJC0UTDd3mAQrfVzY5PFbLWyjAWYoeqwXYuI/VfmSZ8t+eCfEaOp/eb
 2b7WhA2Zid8/dCWj9c319JAvS5/Xq3qNh2b4qgm0wABI1rzGXdkYcXMiS
 wVP1rPMOIL6LbyzQGxPuuD9vDbdL3GZIyEpV+l8XIlF10RsXazUo/JwqI
 xVYXrYmtsu1wJORozXXEGCzxUOwh6SQJVpc8chk2rk6C58K6UAiXyhg/L Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="360444813"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="360444813"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 23:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="573722262"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2022 23:47:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 25 May 2022 23:47:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 25 May 2022 23:47:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 25 May 2022 23:47:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmIytvurdgkDwc7vwwagmXLVAIhg4powEgO8cnMqRbRMAl8rlNVrP3MDQFQzsuzG2Fcv0WmyOhgIx8cnDu1mC2gybjWZiG7KqHR8JxjxOIYa3G7SzVTCeHZLtgagvjQsILk6WyuCgj+LRQ/uOPgBTVN1Uw8OEqcsfxdWhwRlBxsbC62ix6ooE2Fhn8qSLUg7y+a1IMBtgFoGQWufAYSkQxPcrpdvRIxqncskdi/bYU3jBEXN+Ji1agJ4I/GM+4+u4cP7lDaX2ZoDXguQQMDJkMuAoUdiu0fnjnXvsSIs9FeO8zrDhmnbNiXWyHKiXQyV5GpINhO3R0dNaM2qZ+cqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECjQ8UI75Oxr/ydwPcM5XX4SdcqhzGQotMWvUFYltVA=;
 b=YjrKyWrD76Q8r47DR14Jha66JTJ7Orv9Vq+7DFZ9xWZ9RvTWfe3M0hv5ArqDbffgbnKBjz8sYjkpWKwHcW5Jxrfe8qvGDNLfB52C4CGWhKyrBChSU79cvLYzH3mxsKmmJ1tzYk8q4eY5yuIQXFWDEmsXEaTiBZ+Rd4hR7fVth044dZ57uiuqaE2yrodn4xlyD6ST/5kximbQDBeEMcBETgKzZpspGNEIIC5KJegbyegjnnlsTaZNVD071vfnuzQF9l+QJ7Kcw60IOAZDQqGTzNdS9hJanfdG8I41N3ysB6AhimSRJUSvYrqBOiFARLDRZFWL8pRBV5Vw0o2RNccyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.16; Thu, 26 May 2022 06:47:11 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::29a0:67ad:4b77:ce13%8]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 06:47:11 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/display/adl_p: Updates to HDMI combo PHY voltage
 swing table
Date: Thu, 26 May 2022 12:19:35 +0530
Message-ID: <20220526064935.969225-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecc9d0bd-4041-4033-f2ab-08da3ee38f7a
X-MS-TrafficTypeDiagnostic: MW3PR11MB4523:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MW3PR11MB452377DBD49720DF3CB7E6A19FD99@MW3PR11MB4523.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: joFJ16QsWH2ftoIcgTiPTn5Io4MEmiIA6BQ0WpkVBv09T2+fM1ciVv6MHXcLCKXFq9P6PRw7ffnAl/h4+KhYT/onEPIhelyTWzYgvXx0Vewwgi+B+j9kQ6Kyt72/U1smKA9OTH8B+VfxDRC/5ukh4LQhHIYdlmuDZuuYUpyR3JGXOxVtH+yjbms8cCGxxh390iW98uhdAntrqBfr1Xh7g+isAJptoDFC/BueWgvwe6XtWBWidHmkVVsllYl+D6mEiJGbJ3qGf5XUTTY1BuHnieQQBafaGHgB0XnbGoovyDy8q9NG1b8CPxPE9Rm1vThVrRfgiLY7vhf+JsEIazsJV2p/Bbpg/h5sHD0yAQPg7KQUhl0sjompeqX7fQm0jdr3GgQtQg/tlmEGZWrv3nS2WIUN+l1gXi37y/d/5njOK3Q2l+I4xE4mD/0BfQucGURtl4JcR2IdZvlmSm/y+v1KYabgm8OlsyBlfMVoRP+Orou3FxVupsFSm+2/PhzRest8yofgNN0bBxe0vzH8+cRS8SPNQ75cAzPT9KSk/XTL6uF25/3JQTC4H8FBdQ5+Y7qSxa+NAeq2JUfSyZfozUJQljo56siNedSRoe1g1ghOFq9gKdTHD5c1XfDxWwyU0WvYHqPyFdoW4wrmctPxh2/ioQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(2906002)(107886003)(83380400001)(15650500001)(66476007)(186003)(1076003)(6512007)(66946007)(66556008)(4326008)(8676002)(26005)(36756003)(38100700002)(450100002)(8936002)(5660300002)(6506007)(6486002)(6666004)(82960400001)(44832011)(86362001)(316002)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AlgztUzOpiGz3rran2CI9kO2UPHVXupeuWaBgu/FodidyZk+yHJH1iMVW8GE?=
 =?us-ascii?Q?c2QYuUFsL3lx6FJvDvMpZKWQ7YmxzHODIlK9noRbZUslF/aqQNudIZUuUWeb?=
 =?us-ascii?Q?7jylV2PB0HwB21JOV70WJomOb8fRbGA+iTz5WFM/EuKtZ70K5OhX6uHJ1+jN?=
 =?us-ascii?Q?JX/yv3fUNGlSedvJs9F1THY05+fsI7048X9gISDUK0IALk+VHrWr7phlT9Ab?=
 =?us-ascii?Q?xx1C76jgNNHoezRUyRL6xO4mAYcCjqNbTVZYVfL/nXjxCvIdsA0qH/vD+9rO?=
 =?us-ascii?Q?2DX3oxspASe4aMe/cETPHYo468AdolI5Agb4VWguJEF/SVtjOjA2HbzN+YQ4?=
 =?us-ascii?Q?DmvGJMrMYYL6u4ojog7/HxuKGRqZT6GAWX51lSZCzxcaSnHCNSydlJcp+CYn?=
 =?us-ascii?Q?AyPDOI39JMP7Y7EQfVaMM6zukYBImPZ3T33Rj3UiTmbKS7+oy7uQnxzhAl5S?=
 =?us-ascii?Q?mrq2sxWQGjfXT+ZXt2Np2wUrQxgCGPZvnGuqr7dNWW5A2RQI3Qv4rcd+BPI+?=
 =?us-ascii?Q?/GPZt80WsvN/qDQItuEEYB3kMEoFxjCWZkLBrnkh/1JoJCSCwTZUGB6DruP3?=
 =?us-ascii?Q?UAT3PJyhXVx5UnN/fgNjpNTUtWlu89uEjI5Z9U2tc33VN1V8VOC+mjyZMsc2?=
 =?us-ascii?Q?vsEG+jKQrVGcP+qpiine2VyVydM0BZHBwrFH8+4nXTAXldlDwfvA2okm+5wR?=
 =?us-ascii?Q?BSuxnGeG6R9YY2HVLDpyERSipl+5luAumppOZKj8iL7/yx+kqpYQzSLEvEbF?=
 =?us-ascii?Q?qS5cEh7UIEwH4d7LXqDzAz2IyQL8Sb7ZXfAHlnZQntTyqrOZZwkfbTfhpxhF?=
 =?us-ascii?Q?56gE1PFPbSFMQczJbPEkhkKUGruvSfoS7VbRDccUgIee93cBDhxm9r6h9yDk?=
 =?us-ascii?Q?+LiJSKNNuT5NAkGG8hnmfS3/O5aRu/dca6cFkpBk2FC0+wBCGxyD36nHil0f?=
 =?us-ascii?Q?7dcLsFXb57O7sVvpgnNdUgj+LmTbXdM7eqRRPMK8KOmjiJxyxOCaQCaZ8qRC?=
 =?us-ascii?Q?hzQSQcXZLV/d+iwC4CWAUpeiGgz8FuX21UukyL+J2ZINJWUB62kJ4CRz6+0s?=
 =?us-ascii?Q?FYHHSD8UU4mJ4pdfHgc9KqSnH7Fk/nHMrbLSem6W5JLqc/uCXzkKujUNE4kL?=
 =?us-ascii?Q?gDF6AqIjPy/ldK3aXkex11xsI4+WSbaWRZzytjco9G03U9V/dmIbSYOMMnmu?=
 =?us-ascii?Q?x2nrrIFZoVWu66og656zrF8joo9Sn4LUHHSXSKklkki8hAdUQsK8fdRhXqag?=
 =?us-ascii?Q?r4DVtu2a+2eZ8tEsABfZOvzwElI2Zu0+LQ7fOw4llJ7UJAEsP/LqTXOadver?=
 =?us-ascii?Q?YoAw5H4u/Hc4Wep1UBPHy9sm6w1DQYeiTnvGPgv9nr9T83QbBySAPZWgBSvs?=
 =?us-ascii?Q?2GsgREz/IPs/jcNZF4HwLz/iNeKF/hPCI6NO2Hj7U6AOGliOh41foDYtBXTI?=
 =?us-ascii?Q?E/llLSTSCuxbkAgdH9Fey3PyMk9y7yAeHf+iyp/rb5NF5TSnazFUFG2JfiEt?=
 =?us-ascii?Q?uoJgcGerK/+BYNxiNnsflF2WeT6jHKZ4KFdYCFmtsGR5XJ+Aumi3qECUGMAz?=
 =?us-ascii?Q?8i6tW7vOTr6iL48ZGlYWt70HI1KNdeouXWVT/rjraqypPcx9IZ/yBpF5A/SB?=
 =?us-ascii?Q?gX1nM1HPrZZMjEbNQh7ZVwi9ukRLwt52RcnSQcMepQ6sc92SRanlGKrr15SV?=
 =?us-ascii?Q?Ii+gZvfd91SKw0jlLZ8kfPOwBLZfQxbhoSxhmbHVhegKfGbkZIqoTV2iXopN?=
 =?us-ascii?Q?O/XPe79YkFdDyL2iWSEGoyo/0EzqZtON4acfpAZYRjl8028r5toV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc9d0bd-4041-4033-f2ab-08da3ee38f7a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 06:47:11.3450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs7Mp/K3QnJ6g+ZR+deDQ0Q0WoT3a7tta9YOJs/kTNj6YgRkuEmC1f5wq8TgKkneGgBhIXNG/GI5vtxwP7dvL4CEXhTdCc0NPivMUnU7QlKWPe1uIP0FYHgpOt7THsf3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
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
Cc: lucas.demarchi@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New updates to HDMI combo PHY voltage swing tables. Actually with this
update (bspec updated on 08/17/2021), the values are reverted back to be
same as icelake for HDMI combo PHY.

Bspec: 49291
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 .../drm/i915/display/intel_ddi_buf_trans.c    | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 85f58dd3df72..5cae1d19bcbb 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -878,26 +878,6 @@ static const struct intel_ddi_buf_trans adls_combo_phy_trans_edp_hbr3 = {
 	.num_entries = ARRAY_SIZE(_adls_combo_phy_trans_edp_hbr3),
 };
 
-static const union intel_ddi_buf_trans_entry _adlp_combo_phy_trans_hdmi[] = {
-							/* NT mV Trans mV    db   */
-	{ .icl = { 0x6, 0x60, 0x3F, 0x00, 0x00 } },	/*  400    400      0.0 */
-	{ .icl = { 0x6, 0x68, 0x3F, 0x00, 0x00 } },	/*  500    500      0.0 */
-	{ .icl = { 0xA, 0x73, 0x3F, 0x00, 0x00 } },	/*  650    650      0.0 ALS */
-	{ .icl = { 0xA, 0x78, 0x3F, 0x00, 0x00 } },	/*  800    800      0.0 */
-	{ .icl = { 0xB, 0x7F, 0x3F, 0x00, 0x00 } },	/* 1000   1000      0.0 Re-timer */
-	{ .icl = { 0xB, 0x7F, 0x3B, 0x00, 0x04 } },	/* Full    Red     -1.5 */
-	{ .icl = { 0xB, 0x7F, 0x39, 0x00, 0x06 } },	/* Full    Red     -1.8 */
-	{ .icl = { 0xB, 0x7F, 0x37, 0x00, 0x08 } },	/* Full    Red     -2.0 CRLS */
-	{ .icl = { 0xB, 0x7F, 0x35, 0x00, 0x0A } },	/* Full    Red     -2.5 */
-	{ .icl = { 0xB, 0x7F, 0x33, 0x00, 0x0C } },	/* Full    Red     -3.0 */
-};
-
-static const struct intel_ddi_buf_trans adlp_combo_phy_trans_hdmi = {
-	.entries = _adlp_combo_phy_trans_hdmi,
-	.num_entries = ARRAY_SIZE(_adlp_combo_phy_trans_hdmi),
-	.hdmi_default_entry = ARRAY_SIZE(_adlp_combo_phy_trans_hdmi) - 1,
-};
-
 static const union intel_ddi_buf_trans_entry _adlp_combo_phy_trans_dp_hbr[] = {
 							/* NT mV Trans mV db    */
 	{ .icl = { 0xA, 0x35, 0x3F, 0x00, 0x00 } },	/* 350   350      0.0   */
@@ -1556,7 +1536,7 @@ adlp_get_combo_buf_trans(struct intel_encoder *encoder,
 			 int *n_entries)
 {
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
-		return intel_get_buf_trans(&adlp_combo_phy_trans_hdmi, n_entries);
+		return intel_get_buf_trans(&icl_combo_phy_trans_hdmi, n_entries);
 	else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
 		return adlp_get_combo_buf_trans_edp(encoder, crtc_state, n_entries);
 	else
-- 
2.25.1

