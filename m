Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94B60599E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D3B10E14C;
	Thu, 20 Oct 2022 08:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E512F10E3D6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666254157; x=1697790157;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Wo5urnx+XAD1BvGxB+d7yVjpncAlhv046ihq1bkTnx0=;
 b=U+eZW7BWeMB05kgm48I05ro7L7mp4yKJKG6g/Gjy3pCOGNKUpy8AqiVe
 //25db1di/RRBkCkZXKW7XqEt/NeGSprGQAgZlhIfkoe9xDvW0oB4f8Um
 mOzK7ELDwoJVddpvupxX3e9NzW1aEE71gZIkVWyxGBPp0Apl+rJBfG5/6
 x04Ag1Zspc7P1XFVYzTdfPnixEjNcKeRuLtW7GBsTqMRLvZR6yf6ksgR7
 gpXBdhqUU/BSG5DpPFZ4fn+Z6gssaE89tG3y0+cLOTOLzBf9hzBWMOu7h
 IlRrcir9MPhQ6FkOTYfTNnzBb0OEoJeJg2ByMCWppC4J6WuNQAm9W4rKl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="287045276"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="287045276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="624551832"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="624551832"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 20 Oct 2022 01:22:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 01:22:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 01:22:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 01:22:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 01:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ghlx5D7Yjx2jAfMiqcm9LpdeRP2XEpn4NpWATqokdZw+c5hSoYjtyjguwM33DblI83GDUZ31sAXKy/nqxaLBEjHLqa6uTLHpUaJGpg5OxZAy8KICaai5RVkpiwZomFpxsc/j79iimZTZT/Bbh5Zomtt8htVvQMvn6unYQgoSACBCss+z271D74ztUhbY2+R1Fo3cLtj4FDNzld6VsbTPbamby4hSnmTHIO5woX0jyGgmLs5V7H8ClpkIXRQCaT8ewWS0SK49Rl4rYphgOOTwkhsLBSHiWd7gOFNVQUWCvNSnE7P7nrvSPfhh7xaz/Pps+UnJmFjeh/bKiziIwmo/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNWCJUoqZ1QUxrQIJC2wuWkv16teMudHhM7ggXtfkzo=;
 b=TnKDC+HB11UAENM/agZVAiPwLSCH8VmU02xEebXVmw0ptjSEIsxsqXvxPcwFGmuTGdz0ZrDEtwVPCxYWgFW9+YlIt0FqALfNFDjB8PbG9M3jp9GdhnV4i1Ma7fh8Bhmn5bbVwbAx55HwysYLCMf/Z1FFXG5yzqu9fDShKy3qqb0hH6rL4zmTVBET5EQF5dRPZdvDv8OGSLPsya/ZJWOXEf1ubJLZinN4Ky7CACMyR56EtEtk4IgDyVbeNJC9+E/41C7Ro1TzOjzN6B7x/EEm+rN2kF03XJz/hdhBvo8Eyb97eWaS0JlDUpOeu6Jb55E6v3qTsPan79kOrv2iwM9BWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6476.namprd11.prod.outlook.com (2603:10b6:510:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 08:22:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 08:22:32 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/2] drm/plane_helper: Print actual/expected values on
 failure
Date: Thu, 20 Oct 2022 10:21:34 +0200
Message-ID: <20221020082135.779872-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7296cb-b6b7-4c20-8d4f-08dab2743c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdg9cioD4iJnrcHCLLAxTjIwndPBogarleMw3YHcPKcAJf1rM+gHqVeiP9s/FWLwVwjLPoo4EcsLYHZXlvP4HIYNxOv4MQAxk2bp8MNEW1PC77jwB5t8vioMc8cHZCVbrfqYGUYFClY/cuhO2vHOvkIhyze1N5+44xbEupsCgJa6gC74vktU5+wJJXVE0iEfBS6guacmGeV2asoeVTeBvonuSmcRysW1pMNYY+MwIPhmdaeYaVOiztVzYU65IT69hShMtylTBTqGXrobyHrloejB8xWN0wgzReEVUj/OE8oOaCYeby9DFAG4OpHMRySMrfomGkbYgNSisM3dvB5Bt8YUor/AXZ0J8J6sC7MBSsi9KGQ0yFeTiT20LsfaLKjCmrLpXPEIif1hrZmvSn0JzoyHF1Pvg6uxlBaRC5Ew7hCHLyhGJ9eoZdiqfeTuk6qcWAPjVqzc7z4PQtGObRbBoEFs6gx0zKyWUITKmIoq1V4ryHgfJ1IXiQyZqNlMpo+8jp0GBA2CJ+gXvWoh0Rpcvwl/hlwYZOzxeL6ue4IZmGDJM9RzlkUVKl+3pU8Vvku0fKBrO+ovpU1aFQ/w2G+hN8xJyw66YEOQE0ojwPUqA6ntg0fPI7gFwOyJ9+weF4WFnGZr9TM1BnpYWGG6ga/zAz6NaF8Ga5JjJbYc6xpEmtwX8BOLIL5J8N+aJMiV3NQElgKZRR194zy/iLHZC0dmkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(66574015)(36756003)(82960400001)(86362001)(107886003)(38100700002)(83380400001)(66946007)(5660300002)(66556008)(316002)(54906003)(6916009)(8936002)(1076003)(66476007)(186003)(2906002)(2616005)(6506007)(478600001)(6512007)(4326008)(6486002)(26005)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUVSVnNWWHZZdmhmZ1FPa0dEL3N6bVZEK0tsTU43SlcxUzJYRHV5K1J6cU9k?=
 =?utf-8?B?eCtaK1o3VjM1TEhQVnZTUkhEQklhWE81V25XNGpnQmtRRzd1TnoyWWhSMGs3?=
 =?utf-8?B?QTNDVWRtNTlXNEh1eWJEdTdNSGd5M2Y5VXVVWHVSZ3RiUGtBZHdobUR4My9R?=
 =?utf-8?B?R044eFZVSTZYK0VUZzNmR0FUL2U4a055bXpRWmIvVWE5L1NadWpPVS9qU3Jl?=
 =?utf-8?B?Rm9xRURRNVl3MGV2dHF0SkIxVmdad0NhQ1hIbFRtLzFNeFFnZ0pQU1c5Z3NN?=
 =?utf-8?B?NWt6eGw4WGlySkJPTHpRUVVzL090dElVVGEyR0VpcEh0ajAxR3JpSTJEUnJY?=
 =?utf-8?B?QTBUaHBSd3ljZVMyUTBDRm9PZ1d5dmZKNm5hNHVjTEplK0VPNjAvZ2tyR1ZY?=
 =?utf-8?B?aitJTlFSWkJTdGIzbUFFK1ZaMXh4M3Q0TEg3c0x2Q1J4Mm0xV0I1UUdzQ1ZV?=
 =?utf-8?B?eGpqdEI3TU1IWHZWdndKdHVjTitnb1k2TWoxUWVUSXdaRXBXWk5yelZEQkM0?=
 =?utf-8?B?Qk9kNkQwWis1RnhCWk9BanlzY1VRRkNBNGdqZXlSK1VLU2FWOVpoaEt0V2Zk?=
 =?utf-8?B?YmJ2U01xM3lEL0hRTEYzWG82M0J2MHpWOGltYUU0eUd1cjB5MTFMb0pHWVJQ?=
 =?utf-8?B?a1FwVUp1cWJpN3FwWStqWjQ3UTdRYzhQS0xTVGdEcDBONy9MeUR1LzhvUW1y?=
 =?utf-8?B?ODJLSzZVY0piMytYR3g1bDVLM2MrWG5hTGs0dEdqZUp4TDZVeHZYNDl5RmIr?=
 =?utf-8?B?OWwvWlE2U2lNdUJRNCtINjUwVkJGRmVmVjNaTlJkZnFwNGlPTmdhYjAwWUVD?=
 =?utf-8?B?bFVYV3krdlgvbllaei9iVDF2bWVkSzhlZEg4S2ZyOTJyaFRhUjBXSTF3c0dW?=
 =?utf-8?B?SGFXMDJCZXQ2VHNya3lRdWFsQjJsQUs3bVZjZzA0R1NRMExRVVRJYlJnRmJD?=
 =?utf-8?B?cmdTSGhzM1FZT2NVTFArQWhXUlIwUDkwWXQzUlhuaEc2bGFQZlQ3ejZITGZ2?=
 =?utf-8?B?cFVWWnRGRHlsOU9SR05nS2xxYVFySHE1bkdpTUk3UWN4ZmJOODRjOGNFaFBm?=
 =?utf-8?B?bjVTSEkxblAxTlZScEZPeGlmU214WmNMUUlQMGY3Wm95MmorVnJtZHo2NEtX?=
 =?utf-8?B?YU5IM0VwVjJ0WCsyZjgwWGtYeEZVV3pEUGV2d0w5UU9HV2ZpUVpXUzY1UHB3?=
 =?utf-8?B?anZiajlsbWV0TkFZQVdvNnl6YjRqWHU3ZmtTUUc1TWpkakpteExHejVOUEVk?=
 =?utf-8?B?alE0SUZabDZvS1ZmNkgreS9KUktoUlFxNE02aGQxV2dtMHphamtKd0toREkx?=
 =?utf-8?B?bUhmUjFnTWRVTExOVnE5dEtiQzNzL1lpczZCUFdYSnhmT2FHbXc4Ym9qSjgv?=
 =?utf-8?B?MVAyRCtCNlIweVVaT3N4V25UKzFOYzluR2JYQ1R1TzJnTnEvS3AwTWxjNkJR?=
 =?utf-8?B?aWNPYW9jSDRzZlZkcGFEaVY3UGhqNkZidUtaaDBWRE5KZEkxNHAzU3pkdTdz?=
 =?utf-8?B?U0F4UTFIcTBjY2hHQjVrYVFIQ2I0Q2V0VGgxSnppdVIwNUZISWhDVWNDeFQ2?=
 =?utf-8?B?bjExZlpYdTU0Q0RtSnp3dFZRaHhVT3hBb2Yxb1BkajV2Y24xNmZsSkhCRkd2?=
 =?utf-8?B?QTZ2YmphM0ptZ2tPZ3I3T3YyTHRLK2dYY0F1c1o1OElwTUdONk1KbnVzMXh5?=
 =?utf-8?B?eGdKNFdpM1Y5K2RxZG9xRER3cmZpQ3Zjanh4SnF5ZFc4aDFweU9hS1BVWjNI?=
 =?utf-8?B?U1FnYmF4M01DODQ0VEhTT2E1UlVTREVQcEJCMjY1eFN0OTBMN2pVRWtvRUpM?=
 =?utf-8?B?NmlaNGtUM2dZR1lKU1I0aUJCckd5Q0tObXN1RjM3VEJBRzR5K0tRYXFqdnlw?=
 =?utf-8?B?L244alBRRHVlbktqZVpTZXYvcVFGRGtXditacnc2dFdHVmc0dFNsb1l1Ykdh?=
 =?utf-8?B?Qit4d1N5MFFzRVNIbFE4aWNpWHlxbWV2ZTJxQ1ltQ2FjTEJERzVqdGkwcG9K?=
 =?utf-8?B?WFpQNFVrS0VpYUhHaC95RC92YkQ4Zms3VTJVUzJlVU43b2MySVpzWGxTYy9E?=
 =?utf-8?B?aWI4SmgwZUppSG1KQTE3TDFNRFR1TEZseUgyUTVmOGlZZUhGZ204d3dteE1r?=
 =?utf-8?B?NGdmVlZlL0JaL2svNFdZeitQVVNSNklSMVlUMWdrYmIyVFkyczFuMnJ3d3Ri?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7296cb-b6b7-4c20-8d4f-08dab2743c11
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 08:22:32.2735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ren1Y3OndzmXZ25eWVsGUByZVgRtz9MZPllDHEMSyH7rT+etmldq3v1ueTAz6suIXxh+p2Adm02Kov0q3AzF//0wrI1MBT6SdXxOZnA5AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6476
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

Currently the values are printed with debug log level.
Adjust the log level and link the output with the test by using kunit_err.

Example output:
foo: dst: 20x20+10+10, expected: 10x10+0+0
foo: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_plane_helper_test.c:85

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 78 +++++++++++--------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index ec71af791f1f..4963f0c960d8 100644
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
@@ -109,8 +119,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1024 << 16, 768 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	/* Rotated clipping + reflection, no scaling. */
 	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
@@ -120,8 +130,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 768 << 16, 1024 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 	plane_state.rotation = DRM_MODE_ROTATE_0;
 
 	/* Check whether positioning works correctly. */
@@ -140,8 +150,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1023, 767));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
 
 	/* Simple scaling tests. */
 	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
@@ -157,8 +167,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 						  false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 512 << 16, 384 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
 	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
@@ -170,8 +180,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 						  0x20000, false, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2048 << 16, 1536 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
 
 	/* Testing rounding errors. */
 	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
@@ -182,8 +192,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 						  true, false);
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
 
 	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
 	set_crtc(&plane_state, -2, -2, 1028, 772);
@@ -193,9 +203,9 @@ static void drm_test_check_plane_state(struct kunit *test)
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
@@ -206,8 +216,8 @@ static void drm_test_check_plane_state(struct kunit *test)
 	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
 	KUNIT_EXPECT_TRUE(test, plane_state.visible);
 	/* Should not be rounded to 0x20001, which would be upscaling. */
-	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
-	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
+	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
+	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
 
 	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
 	set_crtc(&plane_state, -2, -2, 1028, 772);
@@ -217,9 +227,9 @@ static void drm_test_check_plane_state(struct kunit *test)
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
2.38.1

