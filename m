Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2805A1109
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3723410E15D;
	Thu, 25 Aug 2022 12:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B717610E15D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661431795; x=1692967795;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=3PsTR0iky9ohplOrLQ4pSd8oDHddmi5gjZ0OxgM+xx0=;
 b=H2z/WiYUC8iCJ46Yv8dQ0Nn0w40Q3tdBs3WxF1jqgD23HyVHCMFpI2BI
 n+5KdqnT0qMeESLMI61v9uHTY62LiEcw0fg6kvmSirOYDqWvxEdTgipXR
 bt6M1isN+akvx2vclBamxPJeCW43AckVWwdpdBHdlSYYbSeOfh/s1OpN8
 bHwVUyjRlpfo+ZxSQTfOiIs6c4zIfPjjfPjvXp0gZQkdG31rtxEHbRzdf
 YqOo8hE8yXd7Xbkhcnzn3OGwvRVRpt7BYX9bEjfH8qmx2pMbmu46P9IYT
 vI3AW4J8rTJU42Xvtpba87uiTB4WV0EkAnBad5lPmzxJrZ8CaV2ugErul w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295005404"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="295005404"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 05:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="561013409"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 25 Aug 2022 05:49:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 05:49:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 05:49:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 05:49:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 05:49:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLI/66MN8V7ERMV62J3Gmi1lnp+wmyegIbosUtZtB5E71Gl8CFTEf3JyYQ9jbHCdfGDPCg8QFgeF1vjafW8yx6zY70EwUojYEBFLllzd/TEDeFgYi8zP86Meagowl8jfu7RQp07hqL2vWgI3WF38PLDN61aSN+Zpnt9heHfL3AccEAvwK71nyJCO0oKmH4KKylPsOth7OrYerguxf/8In6zAyvmyFdjMRlG1CNM52kTMvBDWz/jc+BN5dir72wkD6jBp6/MYdXbtV4cnf7NEuxPKanwSge0RXAm/McAiupD2tTZ69Y14RaimQUQFFccSMFX9u2yHMdec9tJKylqbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3ODm6vpDt3mFNW4b/fzIFbInV4d8vYPRiAE33yCKi0=;
 b=F4uVw4X5KEQbjS5wDOdBdT1GYNMvAbyY9nXSnUuOWj1PeVn/fIHC8rAu99f/AoBghGg/QBQWhZvEWQe0aByW0BQipN8ocTIIm90lG/0n0o27bSQpBY+CoIA5G5UH3XTUfEE++Jt3Z3H+PYW7VIGWU9KMGQgL5ZKTzrJCClrq3oDwypazESsJJfOZFAkjT0+YCE/ncWoAToqVQMbH8GomWNJlkU1CwWAe0Q8eyN6T479/uWxc8s9Vl2pELGG6wNIkgZeUr1uZCFBXDqtv6u47A7vcUy/i2xWAx8QjLPj7hv9jAwxkR0LKRWSlVLpqYvpY08DlTHOuSzcu0+vPcbGICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MN2PR11MB4047.namprd11.prod.outlook.com (2603:10b6:208:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Thu, 25 Aug
 2022 12:49:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.014; Thu, 25 Aug 2022
 12:49:46 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/plane_helper: Print actual/expected values on failure
Date: Thu, 25 Aug 2022 14:48:02 +0200
Message-ID: <20220825124803.300821-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0159.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f76cfe-608b-45b9-26e8-08da86984a2a
X-MS-TrafficTypeDiagnostic: MN2PR11MB4047:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CD2kvUcOuxiCMrZ2Q7+nRQtIt3U2VvMxAgu6tkmdAolEDkOCI1rzMqt+RNMyUnHkA3+LbYv28cC3VN7nZX5EXspliDlz5Yf7hFMyTrP7wcu+NCb69G7k7NHRs/ytGwDwEYmSRuOkMtpLJhn0ZAUDAb5LI6KDMDuCv6o+RtLjwpy4AyXc7ETOSPBN9rV1uy4dLJQEz/cQYSWzVyalpgeUQ/wNQW7NWvbVdV45iMcbOhIc1ColsU9r8rKOvbl3/jJMGa3RyCKl+dm3akiQLb9Ts7CZHavLK7EGdhXQ97eEPJMdt+XHobEDwTMyOBMQFYHrl9g3LhptPiSu/LUfLMQNZQVEfneGPJf3/36LwxlX2BldIhUwoy0V65JQU4dnCnJEa5tYvoRfeue6qJFG5cHPOPnSq1uF3oFZIiVsYTPX5g/XJ7APpAv2lHS6hUXiCQPQ7c+/zZYIafb3zKjFyI6a6NKB1W7mYJAU1b9zXMIUBB6pinC6kE89+FTlIA04sm+TMGGIkINN9wJhFRiZHe7aW32s6RO+P6ORMFCUCpzl/LTkgK5Mddqpm7B9mSy+9WcC2zAQj+TNUM4S62UpYbe1eOkcHsconHgwPgZ9HjLe/+jNlgBsJ10WwppzWrrHq3oiJQqnq3s+7lcHLD+GVt873DiOrUlo+IKi+tLehbtEwpc0n+rszHZKDndkniyVQR2ek28YjTpOAFSIXIK1fgTBiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(366004)(39860400002)(136003)(38100700002)(478600001)(6506007)(2616005)(6486002)(1076003)(186003)(2906002)(36756003)(5660300002)(6666004)(41300700001)(107886003)(66946007)(54906003)(8936002)(4326008)(86362001)(83380400001)(6512007)(26005)(82960400001)(316002)(66476007)(8676002)(66556008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWZPa01VdWZQSGJVdmVMbDdsUGFCeEYzeWFFRm9VWG1qL0VJeE9Za1dqdHI3?=
 =?utf-8?B?aWdmNVJxaEw5THBWZlZMRmtkZWRXVTVuNGxINUhyL1pIRGp5cGJ4UG9SZGlj?=
 =?utf-8?B?TmxpRWRYVy9GU1JXNlhNM28rNkR3WFNNTU52L0N2bDVBYitRck14OEIvdUMv?=
 =?utf-8?B?c28rQk0yL3BOMGlwUHIzMzE0ZlNIVzhaSVZDcVFMVmpQWXVuUXQ0R0ovazZ5?=
 =?utf-8?B?TUFwM3ljYXhPQUNOdEhMQXVBZE9iSU84eDRSOE96NnNVbDlxMnY0Z3pYQmRw?=
 =?utf-8?B?ME5udmszbFNTbE15Z3pUS29seHNXN2o2OVpmdnQyT0RmSlVDbG1Wb3lNV2cv?=
 =?utf-8?B?aTl6WXU3WXF3Y1NqQm1yRmlEYTZ5QXovekRKOEkyYjVpVnF4NnZhUkZrWWMz?=
 =?utf-8?B?UzIwdlRURzFXMkdPTU5jRllQeXVudXFpdjNaTk5zMkpabjdrdFByRG9PV2o4?=
 =?utf-8?B?RkMrWjFYMmlRakFlUVJIdU03VE9PU2tqQWsybzNpVkhXUGkyMDlZWEJCZ09X?=
 =?utf-8?B?U1lXMVdOTnVrWUtabitFeGh4TENCbnc3bXpqbXAzaHIxeFFhaHRiQ0ZySEk2?=
 =?utf-8?B?Rjd1TENlL0JNWU1Zdkg4VWFPa3hubFN0VHlxTTAyYUE3OFZZTHRDOFNrZHNP?=
 =?utf-8?B?Z1hLa0Q0M0dHOWJEOWpjQVRMbXljUU85V3NpZERrcTFucE8wd2tFN29INGM5?=
 =?utf-8?B?RE5OQlNxYTZzYXRVSkZyUDhqM2MyQ2ZUa0FLOEJFTTIwbWhSN1F0aTEvWUNy?=
 =?utf-8?B?ZnYrUDhXNDdqOHZVQk9ab0NXTmtlQkZmSmo5cUxrSE54WnE2Z1NLTU5VUmhL?=
 =?utf-8?B?K1QwK204aldTdHJhb3I4cWRpcVE1OGI0QWp3QkhyaWVlRE5RN1hvVGdPbE1V?=
 =?utf-8?B?clR6czJEeXFtZU9JK1laWkRLV0pWNGk2YUI0dUc3T2R5Zm0rMThUeWJ2UXpD?=
 =?utf-8?B?N0EvM3c3VHJTWlpUNUF5Qk0zMmtiM25ab3NzSXljSCt5VDAydU1McmRjWVA2?=
 =?utf-8?B?MWFYK0lndlBZTTVDYnUyU0p0bVVEUDZjeTNFNmQyd3FLQms5K3BkNDEvY1lI?=
 =?utf-8?B?YWp4Z0tEbFJVK251STI5VGI5TjYwMkIwazkyUEhLV2hLL2xCSDVCQndCa25T?=
 =?utf-8?B?YmFDaW51NWtEM25GTGV5cGJPLzg4WjVGem5SUFVlQkdzWTdkSDRQR0NaYUta?=
 =?utf-8?B?QU5EYmpLNzlNcGNMN2ZveFRPbVBKOEFuOXNXckVFbkVOd3dpQk5VOW14a0pX?=
 =?utf-8?B?MXQ1UlZIcHpFdUNqekR4bWl3R01tUndpcVhFc1JwRklLWStPbGVhN2hFVFdt?=
 =?utf-8?B?cS91NzRnZTB1a3BvK1Nnc29tK2hBVlhCQkJVUE1MQU9TMW9zWlBSQUphVUYy?=
 =?utf-8?B?dXdMQ21US3BlYmpJTy9WMXltNUJOeG1yenUrZ0ErTUlEd3BVSGtZQnk0b1N4?=
 =?utf-8?B?UmJsd1VkejlVODVOZlAwNXZzdXB2dG1mczFHamZvcnJqSC9MRmJkU214eDcr?=
 =?utf-8?B?QU1XUnBodHNjRE9LTnJxbTlxVjVmZ0pCQU0zQTkyUkt4YStmNFB5NGpZbVYv?=
 =?utf-8?B?Vi9QKy9FN1BaMFRyQ2FUb0wyeGZRa2tRSjNTaktsSjZsdUNidDJhdmtaM2tQ?=
 =?utf-8?B?NjFYTTcySDNacjB2SnRyY3BxZ1RuUnJRY25keE5mU1VaWHA4eVN1ZGd3cWJy?=
 =?utf-8?B?WkZqMFB0NVM4WlRpdkVUMTlKb0ZXcXpqaWdvbTllQnlmVUJldmh4L3Fnd3Nw?=
 =?utf-8?B?QVNZOEo5Y1FJREtQOE9kcFU3Y3VJVFRpc2Y0MVkyTkdBQXR6N3ZtV2ZLcVBI?=
 =?utf-8?B?ZXVKQUhyUUFLSkdPaUNxbG5Sc0IwSVJ5cDkrTGsrN2t2ZDZvaktmWVF2dXE4?=
 =?utf-8?B?Nkg1WW15aEZrOGtob1FidkFvSGxRc3pOVTFveTE5QnJ1RVRjWXF5ZXk2TWpI?=
 =?utf-8?B?Ynkzb0h2bjNKWGFDYVdPQ2haYXZuVGhGb1BmT252ZDZVVWplamR6a3huL2xz?=
 =?utf-8?B?cjM0c1NoS2Ywa1FsVUJMTmcrK3FtbXMwTlE5Vmd1Sm1aNzlwM0EwMWUrK09Q?=
 =?utf-8?B?bmJDZHUrQWFGaDdjZ0FuUEpVZGw5NXE3ZXRPMTB6SmY1WEphTHN5U1FJS01V?=
 =?utf-8?B?dTVpRmFOVWZqWWRKVmdPWEZPWlU5eWxXM2txcWl1NW1RNEZSUUpHZ01FWmZj?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f76cfe-608b-45b9-26e8-08da86984a2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:49:46.6117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tI/zd6gy4028/mBZVGe/AX4pAMF/qEdanvXwLXIe0OY+2UWKzaRuExBkbcjKjq0/nbcDgo8J9gftQ6Z6pAz9Qm5JZFzCwHqMlu1F1CDGi2Q=
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
2.37.2

