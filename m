Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A05A87B1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 22:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0CB10E2A0;
	Wed, 31 Aug 2022 20:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BE910E2A0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 20:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661978784; x=1693514784;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2cd4jRnlHv7H3/kqlXXmpWagYaGSEx1463bXD2ZGtw4=;
 b=H0HAPqAs3F3wzEVqx1Mq9TH3ZweWUcvTRS4naL+7w6E4k/fApas1iP55
 XS3Z+qqodqqR0BaOWoPw8dePxUduFN9kyrws1xtb3jb9XCPRrhQkgrCWA
 BTyJA+EjuGxReKw6+KvaFb2jgwTjWXrFJhAN2iJSDsS2kO6Fo8zmb0xR9
 YzeCKrwEARJRyBFGRLy0vySySVhEWgsjqxLTp2xlj0N25wTFDhh7SwOdN
 KJfrxuWNt4N2fRcvdZMN6nc/DYSJm5DnSFn67bQhpyXI5iBUPB5W/hNbu
 f5FhE8S+xCN+/+g6a9SknIP5SElHyW3kMgitSp4zawlp0sMrrKlWoIyuA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="295545615"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="295545615"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 13:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="642025125"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 13:46:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 13:46:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 31 Aug 2022 13:46:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 31 Aug 2022 13:46:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dis+BIcT3LBlf+hAB93HOFTgXC9cEObajgsoPrnOJmy+eUg0OMu3or29Muf+xfdSau4dUHMEGcbs1hYvb2I4B3BsXcESZwS+61EMenZ58JS2ZFmh45bvUMm77QCYktUTY1N/rWJnlNO5wyLpCUv20lwjNg8JRAA0ERhPK7WdgKkPZme7pZVZjCigHA4ZLM01SO9La4mpbQkxQ6vQa76+QZLKu+HDvPFfpdU5/HSU8LHv+3xH8ybNXM0qNmkg1k6OsLzCWO5KsoOVSQic6s2RDFpSkrIAgYrhYn9qOwCBOK+pIDl+5tF7yqiGfVfF2qTEcCqk5bShP50jsC8ogpMU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkSVkHLCJpy5xU8fk+6tmZWpT/4kwmcA7pv3gFa+I+o=;
 b=TNam363X6oHxa7MY9K4iZO/OE/SwTo47eFnm8zQ+ObvrUYAyPUU9wQq4j6Mz6IcGLcLCyLx8CM62Z1sAE72yRI0PCGWIYPS6/l6YVmouP3yW3QEObiUtVglZnQ1bYjTGO1DFcyO0g41Ws+VhiNNj+4YvkKtKZfD46vNjruij7Y3g41NWBItfxJesARpzaWkQ8LNH4q2769lGRu+i7ChNGgr4jYBpV54+EwCxjQ9XjS/gDN2lcyPqLjRh6IW2xW3tx48t3SCORCUMq8Qxw7BaPLfrnR5tBfc35/O/BCYmdqsldPKykgbC2fFCuZIxkLetmAHwNPjqSp7UpfvmUSCR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB2778.namprd11.prod.outlook.com (2603:10b6:5:c0::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 20:46:20 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 20:46:20 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/plane_helper: Print actual/expected values on
 failure
Date: Wed, 31 Aug 2022 22:45:35 +0200
Message-ID: <20220831204536.348930-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d076cf5-f8c8-490d-6e62-08da8b91dbdb
X-MS-TrafficTypeDiagnostic: DM6PR11MB2778:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zHAtl8VsbRlnqahFux48n0my/08ERMQYFgcvrFdBvBBTYuJwTz4GAP5j/HiZE5757WobdeSltXe4fVfIMX0kw1ZZEl0GIOJXP62rxsXHwNCRAoN85aoXzZ3vVlgjsXp9/iubwfW5rRnMBZEpdrti+C9xmzUjQPA8qhC5d1Vw1RN/ZFswwR0/c9i1iP7giI6cWg8t9yclNsDn6cHLkPTpXHfTcfVpn3AfqfPZTjzwTyfAnAqmrr+fPw8CgUlO/fLdtrWFNWP/To4i7NTjPxyTD29FMMhwEst8hZgKX843H4mqDV4mx1PxGZLfjYEPmoawYh6I9Pr7+PxxARiyqEhyidTiq3r2nE2TQliAUJKoWvnR9ta9guA5eVSgqVR5Nn0MO7tUp+kBV7yt9QUS1zuLEs7OUygwZOEVdwqA8j/UYvYc34bbn8u1Bi007IPpEbOKUvEQ1PLUHLgW8CzONPAe/yoeOoBb4YPmLivjRkBG4VAz/Z64dEZSPLqDxZsFJdsMR/yV5Kg8Xz9FlJoAVPDyaC0Oyx7hznRlzVFHH3vw4ZkquC6biW+3g4dFQ43sAVVOkx70kdRdO7jl1cdDo0grgLdj4P3zxUoU5FNlhQmuHK7OP9uFj/+0Ad9kOljwaZzT+TNzYOI1escZwwnjrCfMtPuR1CrCZPT6dK9eBdZ1eizUV28zphyH2HTQD0FH1iI2aywyyRoyoNMFjUemHHyc8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39860400002)(396003)(136003)(376002)(36756003)(2616005)(86362001)(83380400001)(186003)(1076003)(82960400001)(38100700002)(5660300002)(4326008)(66556008)(66946007)(66476007)(8676002)(2906002)(41300700001)(107886003)(6506007)(478600001)(6486002)(6666004)(26005)(6916009)(8936002)(54906003)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODhpUUVzWHJGS1FZdFE0UW1CeHB2N2dyNzZQdGYyWHRjdnNBRE5kZ2tUd3hF?=
 =?utf-8?B?TGhrV2Y0NDRmZG9jYVZ3M1ZURTlNUDBGTGVXMXB0eU5aR3FyUjBSQStNZSti?=
 =?utf-8?B?UjhPY0dCVmgxTjJlL3dHdmQ1WDRZdnlZTzRYU3BFYUxLWFZTS0pFMnZ1SFpK?=
 =?utf-8?B?cktuS2xaVkN4T2dqQlJ0ZXRBTGpKYWZWK0NKQWRpMGltbWlUVkJBUGpwYW1r?=
 =?utf-8?B?c2ZrMlE5MHdJNjRLNUpuMThWNFkvazZSYmMzTDJRNnRwTnlJUG94VzBpc0lq?=
 =?utf-8?B?dDQ0R0puTlVWQ0UxWFlDNkRsMGZmaURXOXRISnRTeVB6eHpwbG5YZUREenZh?=
 =?utf-8?B?T2V0U0tJOTdDaUJuZ1dZY2ZwOGVkNWxrVG8xR3l4R0Fhbzh3WHM4dkhkaGpL?=
 =?utf-8?B?L1ZNTllBcytJQ2xiWWZnM2wzKzdIYXQ4QU1mdStPczN3RVJRWG5lWncrNWQy?=
 =?utf-8?B?dDM3YTdHb1p5S3lLVzBJZ3F1YVcxUkd0VHhrUWRtUEhKUUFyZitNVGxUMUJX?=
 =?utf-8?B?VnM2d2tRaXprandWYi9NQ1N1bm93RGhpdUZma3ArV1RuZmw2a2VMRVNocHFn?=
 =?utf-8?B?SzFVcXc5SDNlZjZvdW0rR3RhL2tNTE1iN0JOK0hQTnpwWFdMd3o2WFZGYVln?=
 =?utf-8?B?NVNPYmZoQVdvTHdjMFhPcGdLUWMySkd5UHZpT2k5aVhPZHVJYmxUdmFFSktJ?=
 =?utf-8?B?VXdaZUxFNm1LTlZ5WlFVdHJ5ZytlVXRyMWhPaEMzSk1nK0h3QjgrTVVURXBs?=
 =?utf-8?B?c2Vta3JjVXFzbmNsVEQ0WXphVEV0YnZ2ZldsMmxXNVJzeXhENkRUN2RzUStU?=
 =?utf-8?B?a1lCVFB6by9HZFdRK0dHT1d3K1pVcGxIbDVQQUJrWUVkcHc3NmRJSitSYmRX?=
 =?utf-8?B?ZlBGdkF0UzJQUWZGWUpGUUMzeXJpazE1clRIRCtQdExhc0FHcVNaSWFNOWVS?=
 =?utf-8?B?T0hVSGdaNytHTENRaTFSYk9QY0Q3dkJGY256aGQ4Wi9TOTVDTFh3djE2Sjkr?=
 =?utf-8?B?ZElSRTFPRlVZZUtyYmRHQ2pFa0syamk5ZmpoN050UDFmV3Q1cmduYUFWeHoy?=
 =?utf-8?B?cW44NndmY08vWEFMNXFIV1gxdU13OUFXL09HMFlkZ3JiQVNNdTlqYjE0REZF?=
 =?utf-8?B?M0ZoY1hVME9rMGFSZEpDblprUm02L2UwNXozZmJYSWI0UWdsVmdRd01aK2Qy?=
 =?utf-8?B?VGJ0UUFRU1FmQlNVYWo3ZkhnbXZ0YWQyWm5WdHVCQ29Hb1pXODRvdW9BVFJ4?=
 =?utf-8?B?ZWtTWlNxM204TWV1bG9FM1Y4SzlWeXV2RGlGYWdVWGZJcGwrQzJNa0xMNUZW?=
 =?utf-8?B?L21DN3JySHBPL1lRK3hqOWd3TnNKeXRmNXFDNSt5WjUvU0JSbXpjNnNMcnBn?=
 =?utf-8?B?emYvQ04vWVYzL2pGd0VZeFVLWG9xR2pxRlVid1pDeUtkM0pOcWZUTlVZUDRw?=
 =?utf-8?B?WkJPYUpRaE1ncHRqMStIaDZiZy9mblB0YkVHenF6ZjdsZXBSa2RzZE1Xa04y?=
 =?utf-8?B?ZHFaZWZTakNPUVdoZU44bHFuZThXZHNHeHl0a2N3NVE4ci93MnhZSmlOcUox?=
 =?utf-8?B?d01veWNmL21ReE5JMGhCUUpJR3JsRXMvTTRxdlV6RGovbkRpNVVEMW5pQncz?=
 =?utf-8?B?VUhBQ3QyRzlwRzJheFIxaUh5ejZvTGhKNGJnWGpaMVJ6N3MxOUwycUtORnAv?=
 =?utf-8?B?Uk00cVBQYkFwNWt6WlVseHp6SDIvQ1UyZGtpb1RmaERKWEgxMlFEWm5VVy8w?=
 =?utf-8?B?ZFZVTnhDMXhZK2Q2S0MzekRNZVhjem9hd3BMSXhyMWIvTHNzR1ovNnkyTnNw?=
 =?utf-8?B?QmJDZkRMdklpcE1xV2tZazVGYm5IempBeERkYWltSFczdjNLYzZPUW8zclBo?=
 =?utf-8?B?bVBGZUhFNS9pd0RvcHpFYTM2K3VDQmliWW82QWxZRVNqSTNPaXJ5T01qSThQ?=
 =?utf-8?B?ZitxVzFUQkdoSUJFSW1HVFNBdXdUZ2NnWjFtNUtxdmZhMTc3enl4UG1Ud28w?=
 =?utf-8?B?TmtsWGNLN0NKOGlBOTZSU29aM1c4dTBkM3ZkTURwMjNDMERBb1JaZHZrQi8w?=
 =?utf-8?B?aTBiZzIycW95MkJmeW9Vd0Vkc3I0T2tia1F0VUd5QkJod3d2TlFHYzVZZzUr?=
 =?utf-8?B?V0Q0Z2UyckhReTdhNm55emlsRWJjbXdpSlVrWFl5U0NIZ3ZWeENQQU5rQktH?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d076cf5-f8c8-490d-6e62-08da8b91dbdb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 20:46:20.5049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiBH5Uw13NqZ3XeknCAw+ovWKZ/XevlxtLQeo2ZlLt9ZZ7KXonpf+bIlnmL4VMGG2HL4zf5vdx6AljdAj/hmpGWiM0vG+fssausyBzZ7dI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2778
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
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the values are printed with debug log level.
Adjust the log level and link the output with the test by using kunit_err.

Example output:
foo: dst: 20x20+10+10, expected: 10x10+0+0
foo: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_plane_helper_test.c:85

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 78 +++++++++++--------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index be6cff0020ed..0bbd42d2d37b 100644
--- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_rect.h>
 
 static void set_src(struct drm_plane_state *plane_state,
 		    unsigned int src_x, unsigned int src_y,
@@ -21,26 +22,32 @@ static void set_src(struct drm_plane_state *plane_state,
 	plane_state->src_h = src_h;
 }
 
-static bool check_src_eq(struct drm_plane_state *plane_state,
+static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
 			 unsigned int src_x, unsigned int src_y,
 			 unsigned int src_w, unsigned int src_h)
 {
+	struct drm_rect expected = DRM_RECT_INIT(src_x, src_y, src_w, src_h);
+
 	if (plane_state->src.x1 < 0) {
-		pr_err("src x coordinate %x should never be below 0.\n", plane_state->src.x1);
-		drm_rect_debug_print("src: ", &plane_state->src, true);
+		kunit_err(test,
+			  "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
+			  plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
 		return false;
 	}
 	if (plane_state->src.y1 < 0) {
-		pr_err("src y coordinate %x should never be below 0.\n", plane_state->src.y1);
-		drm_rect_debug_print("src: ", &plane_state->src, true);
+		kunit_err(test,
+			  "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
+			  plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
 		return false;
 	}
 
-	if (plane_state->src.x1 != src_x ||
-	    plane_state->src.y1 != src_y ||
-	    drm_rect_width(&plane_state->src) != src_w ||
-	    drm_rect_height(&plane_state->src) != src_h) {
-		drm_rect_debug_print("src: ", &plane_state->src, true);
+	if (plane_state->src.x1 != expected.x1 ||
+	    plane_state->src.y1 != expected.y1 ||
+	    drm_rect_width(&plane_state->src) != drm_rect_width(&expected) ||
+	    drm_rect_height(&plane_state->src) != drm_rect_height(&expected)) {
+		kunit_err(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
+			  DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
+
 		return false;
 	}
 
@@ -57,15 +64,18 @@ static void set_crtc(struct drm_plane_state *plane_state,
 	plane_state->crtc_h = crtc_h;
 }
 
-static bool check_crtc_eq(struct drm_plane_state *plane_state,
+static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
 			  int crtc_x, int crtc_y,
 			  unsigned int crtc_w, unsigned int crtc_h)
 {
-	if (plane_state->dst.x1 != crtc_x ||
-	    plane_state->dst.y1 != crtc_y ||
-	    drm_rect_width(&plane_state->dst) != crtc_w ||
-	    drm_rect_height(&plane_state->dst) != crtc_h) {
-		drm_rect_debug_print("dst: ", &plane_state->dst, false);
+	struct drm_rect expected = DRM_RECT_INIT(crtc_x, crtc_y, crtc_w, crtc_h);
+
+	if (plane_state->dst.x1 != expected.x1 ||
+	    plane_state->dst.y1 != expected.y1 ||
+	    drm_rect_width(&plane_state->dst) != drm_rect_width(&expected) ||
+	    drm_rect_height(&plane_state->dst) != drm_rect_height(&expected)) {
+		kunit_err(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
+			  DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
 
 		return false;
 	}
@@ -109,8 +119,8 @@ static void igt_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	/* Rotated clipping + reflection, no scaling. */
 	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
@@ -120,8 +130,8 @@ static void igt_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 768 << 16, 1024 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 	plane_state.rotation = DRM_MODE_ROTATE_0;
 
 	/* Check whether positioning works correctly. */
@@ -140,8 +150,8 @@ static void igt_check_plane_state(struct kunit *test)
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1023, 767));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
 
 	/* Simple scaling tests. */
 	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
@@ -157,8 +167,8 @@ static void igt_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 512 << 16, 384 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
@@ -170,8 +180,8 @@ static void igt_check_plane_state(struct kunit *test)
 						  0x20000, false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2048 << 16, 1536 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	/* Testing rounding errors. */
 	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
@@ -182,8 +192,8 @@ static void igt_check_plane_state(struct kunit *test)
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
 
 	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
 	set_crtc(&plane_state, -2, -2, 1028, 772);
@@ -193,9 +203,9 @@ static void igt_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0x40002, 0x40002,
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x40002, 0x40002,
 					     1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
 	set_crtc(&plane_state, 1022, 766, 4, 4);
@@ -206,8 +216,8 @@ static void igt_check_plane_state(struct kunit *test)
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
 	/* Should not be rounded to 0x20001, which would be upscaling. */
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
 
 	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
 	set_crtc(&plane_state, -2, -2, 1028, 772);
@@ -217,9 +227,9 @@ static void igt_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0x3fffe, 0x3fffe,
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x3fffe, 0x3fffe,
 					     1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 }
 
 static struct kunit_case drm_plane_helper_test[] = {
-- 
2.37.3

