Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D623C5A110A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E15310E16F;
	Thu, 25 Aug 2022 12:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E7810E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661431797; x=1692967797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nfHdI90I6Gh2usXI714YCq0G64PuccSOr3CgsoSuEN4=;
 b=WhgQsOyFVfeIuZ+m42JSaWhD7MOdPrIDZ1Yq+L22WRXwji0JBNyTObMf
 SF1zF0m3PM584srFg6PNfylrb0NWkmRSXlKocG8UvZr6cAdQQytzAMjRy
 kPS2UNtE2/TDwjwQ2GE5m0QV+U3fs1aPEi1UnobUgq93Ed6PwXPfisuH+
 R2GOXCoXabhf306cJTkpZOj2YQPDXMSHtPVOTS6mNSMagZUakdL25JX5/
 66ylUBWDLeRnY8vx8PHUOeUIJxlTkGGQjZ5wc6usPKNV25QWzTEgal0fu
 G121H+gdJTb2HbevdCNNuZVeOJmGohaOln0A0OrK5xnhMUwtORyDO/ELh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="294228974"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="294228974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 05:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="643242764"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 25 Aug 2022 05:49:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 05:49:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 05:49:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 05:49:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 05:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odPuPRmYt2bbEQS2l+1tXUh6QpNJjGMMIoF/OUyuXHuqYtJWkM/OHrpWXdqco+wTNCiVLCy4406uzuaK44T1GffcnOVnU9rf/3nnt8P0Hnr1awdfvHvT/pCOJ+iIuFafZ/l5Sc3+XUyaAwk6hY2Halk1veQx65GX2nnLpEfc4dpZDGd+R7x/MxhsxC857bZujmc0a0CALYLBOOKwChW54EJ71juheYEvcSy2W0OhczLwAfbR8pK5QZFROrYHabTAZBDwdckmnZTj/+gHj3lj6X605FInEGv54sXnYN/u9r1IITe448psUguj8N1nWAqImImssenaNzf1GoBChHxT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37Nge1CvkDXphgH+rdVVyQ2AePAn9ZKATxiLWsr9Fss=;
 b=iN/005r2aEkDPO14yQtxO2vofRu7iThMIx+seo6M9Pqq+bPO4ZbJZnn+L3TLHYBGxGgFa6cctsEy5Xatcyg3Ys9sJ0y2JM2WTXDb+px7MxmCAc0/9DmkSiSl+v9CNRt9fX+4lyQ8kjejmKkTP6YAid5gTSlAg/jGnaR/26kLIFV/SulvjQ+ieex6XwR54NgRlffiDFqncPcSCIL2LFFr+Gqqnfapbd1IvCkOEB3cXHu0Q3OTE2EfHwF4k38nkFl7jazi/dji29nOTjPRbvtC0blXtr5mpsHJYh/2fgf7V6msm5DIcrXRvx/PvquemqpndqNlq1eu7nE07oTzs6dXbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4047.namprd11.prod.outlook.com (2603:10b6:208:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Thu, 25 Aug
 2022 12:49:53 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.014; Thu, 25 Aug 2022
 12:49:53 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/plane_helper: Split into parameterized test cases
Date: Thu, 25 Aug 2022 14:48:03 +0200
Message-ID: <20220825124803.300821-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825124803.300821-1-michal.winiarski@intel.com>
References: <20220825124803.300821-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb779d4-c063-40bc-48f4-08da86984dfe
X-MS-TrafficTypeDiagnostic: MN2PR11MB4047:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZiYDCVbI/TtqYYsGZ3uUuioX4eVV/lEKuwydID+hSrqhq/24vecYTrTvdVixl8S+T8jY0qCLO13fmiiOBVRT6pbsuJ/qNAgYbeUBiAo4IlxAl6yuSOby3qioAqgRm031/AFZYNj7gYlIRwFeJbRs8xYCvK8MRDH/YV1vuHH1Yb0YmRSZUZlTLao+Jx9RYVHVXj1i6qUsOmRBQyEOVE9h16M+gJhomdKn1OEdEmJSR6/hbX4iPZaHjLE4la8atwCZrTQsYnFp8fV+yZRMCreLAYmqEVniGbxc4Gia4oss4EPo/hDbIJSG/krHieXIplvSGABrp9LI6P3ysFhboExx4xp3VsvajygNn5RhBl1DMKMeTflj9ZpFytJNQPtkLjl1xufh+aRH9EsktGauoLwFfQ4Ax2Cjymo/QuZVQDrPUmXqayrTS+AsWpm8e5bRrDUg81dJ0+m+ntn5MN5MYj7R5pKx2FtTZuhQqSOgUY6x6816SG4nzo+BL5ZKwicSSP6YVZNUQm2gV5jvzJa/FK6fIb2jHdr9G/mADoPLK7RmbNLSfewiYAqD8hveLyoO8e6o9npoiXElwpegH7apHnAGQ03BRroop7QBwKjQqhMK4bdkp6LEWOLcn4pbdpH/iQNwtkaKY8CXPvMr+6/zJm7rc0CtdyxnvAuWouBL6CjZRVTilF1wfTaRoroZLeZn8YNZnwz1NszhK8C59SzS3/znig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(366004)(39860400002)(136003)(38100700002)(478600001)(6506007)(2616005)(6486002)(1076003)(186003)(2906002)(36756003)(5660300002)(6666004)(41300700001)(107886003)(30864003)(66946007)(54906003)(8936002)(4326008)(86362001)(83380400001)(6512007)(26005)(82960400001)(316002)(66476007)(8676002)(66556008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1NhTkt3SXpTVG1PTFRJTW5UeG1yQTArMjIvUDl4V3praHQvKzV2ekF6QXlp?=
 =?utf-8?B?cStoWVVlcXQ4RXBHZjExQVNDeGEvRU5kNUdDaUcyN1NkajFkYlNWUWZQTEhs?=
 =?utf-8?B?OVdxbDNkY2MvcXIwc0U1TkxoSm9qbmRiSnJYdEpVWlZPby8vbEdibmdFc1lx?=
 =?utf-8?B?Unp3TndVL1d4d3pTNWJQazhVdDJQczIrRU5qNDRlMFQxRXZtZGNhUFV6ZDdu?=
 =?utf-8?B?MEV5eC8wYjdKQ056V1VWbmxCR3l4NmlhL05oMlRhQmZnUk1pdU5YRGRwSDdy?=
 =?utf-8?B?cnlxd1RtajROamFjNExNOGZOak4zV2FCaUhrVUtORmJEZWQ1Z2tYdGpOa2Fj?=
 =?utf-8?B?UENoU3Z3SHBvRDh0cHJNNWlJMWN0K09hTFcvSjJseHBESGcvS2VXN1hrZlZQ?=
 =?utf-8?B?eDNPYUdORnRkNkJFQTRDczE5a3NLam44T0RRRVRRblJXRkFWbndlMDJPYjRO?=
 =?utf-8?B?SCszNlJqL05EdkVSYnhQZUU5MHQrYmlvWGJHTDYyT0ZYLytEb3JSeXp1dm1k?=
 =?utf-8?B?eWpyb1RndTlPaHRvcFNvNFQ2V0U5cHRRWUxzV0NVYTN5bnMxbVpHdkVWaDQw?=
 =?utf-8?B?KzFUMWNuUEVkT1paZDFqOVhaaGxCellvOVowV0dNUW9pelpkS0M3aFlSLytQ?=
 =?utf-8?B?RDZOTkRzMlNIZVRvdVRWSmJ5TlZGdjcrOFdpaVVOMFJhWENwaFlPOGVvMzh0?=
 =?utf-8?B?MXpHT2xMcXhnOHFDMXI2eGZ3cm1iakcvM2xYUGJJbTBZQUE1QnhGUkNBTHpE?=
 =?utf-8?B?bmwyZjh2dVlTem9YdWtMbGNaTEc5Qy8zWmk0Z2tJVk5Qck96aGpXd2VUU281?=
 =?utf-8?B?eFhCUEZHYUlSOEtOZDVmOXFJbnpwR1hVQ3RUSTJNTEdPZkt2RS9GZ1RCRWZL?=
 =?utf-8?B?cGJaVU1vbEJsR2ZZWDJacE1yV1FrTW1MUlppelV6Vm52VDlCWkNaeEpCTHJO?=
 =?utf-8?B?d2Z6SEFoWlQxSU5vaGdoVDU4cGx1eHJOQ1U2c21FdGdqaDI2RWJnM25BSStW?=
 =?utf-8?B?MEg1MWlRL2JoemI1VTFOUFdmTk41RVp2dzl2N2oxTmhNa1hyNFVKRFNnNzEv?=
 =?utf-8?B?bDRZOERJV3cxMk9vUzY3c3BvR3J6WGNrbC9EbHdNMHAvVk93ZGJwMDBybEl0?=
 =?utf-8?B?OGdQQi9Ub0RxMEFrbVd4YTBOV3dHcEUvTWVQZEozVS8zRk9JZGtveG44V3pZ?=
 =?utf-8?B?bHRmNVVwOEdOZTlSZXRweU9IYTVtaU05ZFZlVjViQXJSSmdhOCtyd3hGMm5S?=
 =?utf-8?B?R2RzaTdVckphc1JNVmFmSTdleXc2QXU2b1M3dTRBaVVqNjNvUlpZQmdWNGZ4?=
 =?utf-8?B?b0hTbmp6Sm1CaGN4bWR5ampIakxxcDRaS0xES3BWWEdnRi9qNWRSZURjVDBN?=
 =?utf-8?B?VkM4QkIweitYN3I5c2RMMnZTeG84cXFtR3RFK1FuSCs1UENrRzBKN2Q1OTkw?=
 =?utf-8?B?d05DUDRueVYyWUZrYzRwcWpGYU5LZTd4eFlLdTVTUlUwZVBTVnVDM05EdGwx?=
 =?utf-8?B?dmRkTTh2d0FiMXNDYUFVT3ZaZTZKdUc5eGxqUC9HRjF1RVozWEJrZXowT3hh?=
 =?utf-8?B?Uko1bVQ2QW54YkFvN2pFYnVvUkxvSU1xbVYrVmE0b3lheWt3NVpFK3Z3M2du?=
 =?utf-8?B?SmxGZ0pQWHMrb1htaHU4eFduM2NEaTYyeGxwRGVaSnJudWhuMFFxcUhyT1dj?=
 =?utf-8?B?cjFrZ1RwMEhzWGFqRTZGdWFiRklrNnVjWnM0d2UydFM2RUh4OU1SblFYM20y?=
 =?utf-8?B?RHB4OTV4UjJ4WlhGR01rKzNDNjF4K2xYVWVtZXpwTERBcVRRYzZnekp4VzFx?=
 =?utf-8?B?dlg1Rlg0Z2g2STZ2S283VVZGSUpvWmxlamFyNWY5T3R6aHhFZjQwYnU1cWNS?=
 =?utf-8?B?WE5KMzl5c3h4cFlpdlJkSXY2b2xHdHhQVU1yYjdjcjFPSkN0K0t0eEdaNE05?=
 =?utf-8?B?OU45SXg4M20vSXpZZENYdWQ5cWlwVGM4ZG53Rk9EN3VXeVpsL1NUOHdnRVk4?=
 =?utf-8?B?YkVMSm1nVW9oM1orYlhGTnF3K2VHZVBLR1RSb3I1L1RCYWZVUVY0WUpYUU1I?=
 =?utf-8?B?OXJucVRIa09JbXAxcGw0UzNXek1YSkRkQiszNk1TQlNPK1dRRTF3RDNrcTJL?=
 =?utf-8?B?NFR1T0R6UjRjSDlWTzZaalQ4OGovYi9uQkM0WXE1VWhVODVhMEdxdHlmSlBo?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb779d4-c063-40bc-48f4-08da86984dfe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:49:53.0663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDf4RZmM7KNw0Hdo4WZ107W8rhbvR7cvuY1D0MnTPLlrVe64hT5tnUdawWXUTdiGQAFEG8NhElLRRujxUNokUXO19hLVzxnSOTMNGTLnoW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4047
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>, Sam
 Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The test was constructed as a single function (test case) which checks
multiple conditions, calling the function that is tested multiple times
with different arguments.
This usually means that it can be easily converted into multiple test
cases.
Split igt_check_plane_state into two parameterized test cases,
drm_check_plane_state and drm_check_invalid_plane_state.

Passing output:
============================================================
============== drm_plane_helper (2 subtests) ===============
================== drm_check_plane_state ===================
[PASSED] clipping_simple
[PASSED] clipping_rotate_reflect
[PASSED] positioning_simple
[PASSED] upscaling
[PASSED] downscaling
[PASSED] rounding1
[PASSED] rounding2
[PASSED] rounding3
[PASSED] rounding4
============== [PASSED] drm_check_plane_state ==============
============== drm_check_invalid_plane_state ===============
[PASSED] positioning_invalid
[PASSED] upscaling_invalid
[PASSED] downscaling_invalid
========== [PASSED] drm_check_invalid_plane_state ==========
================ [PASSED] drm_plane_helper =================
============================================================
Testing complete. Ran 12 tests: passed: 12

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 419 +++++++++++-------
 1 file changed, 255 insertions(+), 164 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index 0bbd42d2d37b..cb8607e5c737 100644
--- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
@@ -12,14 +12,71 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
 
-static void set_src(struct drm_plane_state *plane_state,
-		    unsigned int src_x, unsigned int src_y,
-		    unsigned int src_w, unsigned int src_h)
+static const struct drm_crtc_state crtc_state = {
+	.crtc = ZERO_SIZE_PTR,
+	.enable = true,
+	.active = true,
+	.mode = {
+		DRM_MODE("1024x768", 0, 65000, 1024, 1048,
+			 1184, 1344, 0, 768, 771, 777, 806, 0,
+			 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
+	},
+};
+
+struct drm_check_plane_state_test {
+	const char *name;
+	const char *msg;
+	struct {
+		unsigned int x;
+		unsigned int y;
+		unsigned int w;
+		unsigned int h;
+	} src, src_expected;
+	struct {
+		int x;
+		int y;
+		unsigned int w;
+		unsigned int h;
+	} crtc, crtc_expected;
+	unsigned int rotation;
+	int min_scale;
+	int max_scale;
+	bool can_position;
+};
+
+static int drm_plane_helper_init(struct kunit *test)
 {
-	plane_state->src_x = src_x;
-	plane_state->src_y = src_y;
-	plane_state->src_w = src_w;
-	plane_state->src_h = src_h;
+	const struct drm_check_plane_state_test *params = test->param_value;
+	struct drm_plane *plane;
+	struct drm_framebuffer *fb;
+	struct drm_plane_state *mock;
+
+	plane = kunit_kzalloc(test, sizeof(*plane), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, plane);
+
+	fb = kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, fb);
+	fb->width = 2048;
+	fb->height = 2048;
+
+	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mock);
+	mock->plane = plane;
+	mock->crtc = ZERO_SIZE_PTR;
+	mock->fb = fb;
+	mock->rotation = params->rotation;
+	mock->src_x = params->src.x;
+	mock->src_y = params->src.y;
+	mock->src_w = params->src.w;
+	mock->src_h = params->src.h;
+	mock->crtc_x = params->crtc.x;
+	mock->crtc_y = params->crtc.y;
+	mock->crtc_w = params->crtc.w;
+	mock->crtc_h = params->crtc.h;
+
+	test->priv = mock;
+
+	return 0;
 }
 
 static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
@@ -54,16 +111,6 @@ static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state
 	return true;
 }
 
-static void set_crtc(struct drm_plane_state *plane_state,
-		     int crtc_x, int crtc_y,
-		     unsigned int crtc_w, unsigned int crtc_h)
-{
-	plane_state->crtc_x = crtc_x;
-	plane_state->crtc_y = crtc_y;
-	plane_state->crtc_w = crtc_w;
-	plane_state->crtc_h = crtc_h;
-}
-
 static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
 			  int crtc_x, int crtc_y,
 			  unsigned int crtc_w, unsigned int crtc_h)
@@ -83,162 +130,206 @@ static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_stat
 	return true;
 }
 
-static void igt_check_plane_state(struct kunit *test)
+static void drm_check_plane_state(struct kunit *test)
+{
+	const struct drm_check_plane_state_test *params = test->param_value;
+	struct drm_plane_state *plane_state = test->priv;
+
+	KUNIT_ASSERT_EQ_MSG(test,
+			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
+								params->min_scale,
+								params->max_scale,
+								params->can_position, false),
+			    0, params->msg);
+	KUNIT_EXPECT_TRUE(test, plane_state->visible);
+	check_src_eq(test, plane_state, params->src_expected.x, params->src_expected.y,
+		     params->src_expected.w, params->src_expected.h);
+	check_crtc_eq(test, plane_state, params->crtc_expected.x, params->crtc_expected.y,
+		      params->crtc_expected.w, params->crtc_expected.h);
+}
+
+static void drm_check_plane_state_desc(const struct drm_check_plane_state_test *t,
+				       char *desc)
 {
-	int ret;
-
-	static const struct drm_crtc_state crtc_state = {
-		.crtc = ZERO_SIZE_PTR,
-		.enable = true,
-		.active = true,
-		.mode = {
-			DRM_MODE("1024x768", 0, 65000, 1024, 1048, 1184, 1344, 0, 768, 771,
-				 777, 806, 0, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
-		},
-	};
-	static struct drm_plane plane = {
-		.dev = NULL
-	};
-	static struct drm_framebuffer fb = {
-		.width = 2048,
-		.height = 2048
-	};
-	static struct drm_plane_state plane_state = {
-		.plane = &plane,
-		.crtc = ZERO_SIZE_PTR,
-		.fb = &fb,
-		.rotation = DRM_MODE_ROTATE_0
-	};
-
-	/* Simple clipping, no scaling. */
-	set_src(&plane_state, 0, 0, fb.width << 16, fb.height << 16);
-	set_crtc(&plane_state, 0, 0, fb.width, fb.height);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
-
-	/* Rotated clipping + reflection, no scaling. */
-	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
-	plane_state.rotation = DRM_MODE_ROTATE_0;
-
-	/* Check whether positioning works correctly. */
-	set_src(&plane_state, 0, 0, 1023 << 16, 767 << 16);
-	set_crtc(&plane_state, 0, 0, 1023, 767);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	KUNIT_EXPECT_TRUE_MSG(test, ret,
-			      "Should not be able to position on the crtc with can_position=false\n");
-
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  true, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
-
-	/* Simple scaling tests. */
-	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
-	set_crtc(&plane_state, 0, 0, 1024, 768);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  0x8001,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	KUNIT_EXPECT_TRUE_MSG(test, ret, "Upscaling out of range should fail.\n");
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  0x8000,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
-
-	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  0x1ffff, false, false);
-	KUNIT_EXPECT_TRUE_MSG(test, ret, "Downscaling out of range should fail.\n");
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  0x20000, false, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
-
-	/* Testing rounding errors. */
-	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
-	set_crtc(&plane_state, 1022, 766, 4, 4);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  0x10001,
-						  true, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
-
-	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
-	set_crtc(&plane_state, -2, -2, 1028, 772);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  0x10001,
-						  false, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x40002, 0x40002,
-					     1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
-
-	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
-	set_crtc(&plane_state, 1022, 766, 4, 4);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  0xffff,
-						  DRM_PLANE_NO_SCALING,
-						  true, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	/* Should not be rounded to 0x20001, which would be upscaling. */
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
-
-	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
-	set_crtc(&plane_state, -2, -2, 1028, 772);
-	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
-						  0xffff,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
-	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x3fffe, 0x3fffe,
-					     1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
+	sprintf(desc, "%s", t->name);
 }
 
+static const struct drm_check_plane_state_test drm_check_plane_state_tests[] = {
+	{
+		.name = "clipping_simple",
+		.msg = "Simple clipping check should pass",
+		.src = { 0, 0,
+			 2048 << 16,
+			 2048 << 16 },
+		.crtc = { 0, 0, 2048, 2048 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = false,
+		.src_expected = { 0, 0, 1024 << 16, 768 << 16 },
+		.crtc_expected = { 0, 0, 1024, 768 },
+	},
+	{
+		.name = "clipping_rotate_reflect",
+		.msg = "Rotated clipping check should pass",
+		.src = { 0, 0,
+			 2048 << 16,
+			 2048 << 16 },
+		.crtc = { 0, 0, 2048, 2048 },
+		.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = false,
+		.src_expected = { 0, 0, 768 << 16, 1024 << 16 },
+		.crtc_expected = { 0, 0, 1024, 768 },
+	},
+	{
+		.name = "positioning_simple",
+		.msg = "Simple positioning should work",
+		.src = { 0, 0, 1023 << 16, 767 << 16 },
+		.crtc = { 0, 0, 1023, 767 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = true,
+		.src_expected = { 0, 0, 1023 << 16, 767 << 16 },
+		.crtc_expected = { 0, 0, 1023, 767 },
+	},
+	{
+		.name = "upscaling",
+		.msg = "Upscaling exactly 2x should work",
+		.src = { 0, 0, 512 << 16, 384 << 16 },
+		.crtc = { 0, 0, 1024, 768 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = 0x8000,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = false,
+		.src_expected = { 0, 0, 512 << 16, 384 << 16 },
+		.crtc_expected = { 0, 0, 1024, 768 },
+	},
+	{
+		.name = "downscaling",
+		.msg = "Should succeed with exact scaling limit",
+		.src = { 0, 0, 2048 << 16, 1536 << 16 },
+		.crtc = { 0, 0, 1024, 768 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = 0x20000,
+		.can_position = false,
+		.src_expected = { 0, 0, 2048 << 16, 1536 << 16 },
+		.crtc_expected = { 0, 0, 1024, 768 },
+	},
+	{
+		.name = "rounding1",
+		.msg = "Should succeed by clipping to exact multiple",
+		.src = { 0, 0, 0x40001, 0x40001 },
+		.crtc = { 1022, 766, 4, 4 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = 0x10001,
+		.can_position = true,
+		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
+		.crtc_expected = { 1022, 766, 2, 2 },
+	},
+	{
+		.name = "rounding2",
+		.msg = "Should succeed by clipping to exact multiple",
+		.src = { 0x20001, 0x20001, 0x4040001, 0x3040001 },
+		.crtc = { -2, -2, 1028, 772 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = 0x10001,
+		.can_position = false,
+		.src_expected = { 0x40002, 0x40002, 1024 << 16, 768 << 16 },
+		.crtc_expected = { 0, 0, 1024, 768 },
+	},
+	{
+		.name = "rounding3",
+		.msg = "Should succeed by clipping to exact multiple",
+		.src = { 0, 0, 0x3ffff, 0x3ffff },
+		.crtc = { 1022, 766, 4, 4 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = 0xffff,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = true,
+		/* Should not be rounded to 0x20001, which would be upscaling. */
+		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
+		.crtc_expected = { 1022, 766, 2, 2 },
+	},
+	{
+		.name = "rounding4",
+		.msg = "Should succeed by clipping to exact multiple",
+		.src = { 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff },
+		.crtc = { -2, -2, 1028, 772 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = 0xffff,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = false,
+		.src_expected = { 0x3fffe, 0x3fffe, 1024 << 16, 768 << 16 },
+		.crtc_expected = { 0, 0, 1024, 768 },
+	},
+};
+
+KUNIT_ARRAY_PARAM(drm_check_plane_state, drm_check_plane_state_tests, drm_check_plane_state_desc);
+
+static void drm_check_invalid_plane_state(struct kunit *test)
+{
+	const struct drm_check_plane_state_test *params = test->param_value;
+	struct drm_plane_state *plane_state = test->priv;
+
+	KUNIT_ASSERT_LT_MSG(test,
+			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
+								params->min_scale,
+								params->max_scale,
+								params->can_position, false),
+			    0, params->msg);
+}
+
+static const struct drm_check_plane_state_test drm_check_invalid_plane_state_tests[] = {
+	{
+		.name = "positioning_invalid",
+		.msg = "Should not be able to position on the crtc with can_position=false",
+		.src = { 0, 0, 1023 << 16, 767 << 16 },
+		.crtc = { 0, 0, 1023, 767 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = false,
+	},
+	{
+		.name = "upscaling_invalid",
+		.msg = "Upscaling out of range should fail",
+		.src = { 0, 0, 512 << 16, 384 << 16 },
+		.crtc = { 0, 0, 1024, 768 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = 0x8001,
+		.max_scale = DRM_PLANE_NO_SCALING,
+		.can_position = false,
+	},
+	{
+		.name = "downscaling_invalid",
+		.msg = "Downscaling out of range should fail",
+		.src = { 0, 0, 2048 << 16, 1536 << 16 },
+		.crtc = { 0, 0, 1024, 768 },
+		.rotation = DRM_MODE_ROTATE_0,
+		.min_scale = DRM_PLANE_NO_SCALING,
+		.max_scale = 0x1ffff,
+		.can_position = false,
+	},
+};
+
+KUNIT_ARRAY_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_tests,
+		  drm_check_plane_state_desc);
+
 static struct kunit_case drm_plane_helper_test[] = {
-	KUNIT_CASE(igt_check_plane_state),
+	KUNIT_CASE_PARAM(drm_check_plane_state, drm_check_plane_state_gen_params),
+	KUNIT_CASE_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_gen_params),
 	{}
 };
 
 static struct kunit_suite drm_plane_helper_test_suite = {
 	.name = "drm_plane_helper",
+	.init = drm_plane_helper_init,
 	.test_cases = drm_plane_helper_test,
 };
 
-- 
2.37.2

