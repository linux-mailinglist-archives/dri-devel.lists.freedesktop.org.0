Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E695AD909
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBD710E49A;
	Mon,  5 Sep 2022 18:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A3410E49A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 18:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662402799; x=1693938799;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=2cd4jRnlHv7H3/kqlXXmpWagYaGSEx1463bXD2ZGtw4=;
 b=PJ5bFYmz4qNdtPECsGLcL27nG1hoR5aRLSyuVRALhbj4Hl/xXRDlWPL8
 eHwwRSz6cuin01RzWuqr3Gh7aBBFocCkmDTeIm4enD+ooOWjlH94eWzDR
 +qIyFm2Cv8cPRJGvfNFOG+VtfqGS6zvHurc/K29HqbqWlFvRJ1Gorxwnk
 4me0AI00czdkeNM0Pt+m9oJbKkyVAFDBS7La/UfbQhX2rDzrV6a4D5mWc
 Dz4gu3Zsr1XlcLLqK9EV7MspFQOc/0dD9pYCcM0AqvH6flnRiJJtvZo1J
 kDlwnBv6W4zjQrscpMvZEWhGWyWGny/9ZgCSAHuPC2iGak/4ecEspys2M g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="283432285"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="283432285"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 11:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="609731744"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 05 Sep 2022 11:33:18 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 11:33:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 5 Sep 2022 11:33:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 5 Sep 2022 11:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx8QKG+SMAlHYebkk4meEZEjhOlpqiyFbxthWRf2uyH212/DJYjXTT5O//aELOzzltbC4nwYQdfVlzCJngp9T61a555c79eS7LcIW5+orRDIfZprEpvMn1iYzUrHQ9w8KLLpoTkK2VAtXt+KKi+rtqovXmwTeVo6oh3ANdw1QA8rxP1V4liQWtaWdP6jfEjyoD/7w7QVmTPCBRnDg8Pje6aUBe86bzV3AxOmTlazGd74IYpBC816Rlvy06xseHFGdvxCoP82FZpg9jcirqsfiILy18KCjBjsnYMetfD/uJfGVXtUSMzfnVl9kCZ4GLuzksYV8CO7bTsjppBHBkMtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkSVkHLCJpy5xU8fk+6tmZWpT/4kwmcA7pv3gFa+I+o=;
 b=cK8qK6hg0l6nJyOgfR+XtuSiFgzzrh65NNqDFRHyo/NQy7wJZvKf8e9zPOD0JzKqWzaThSt1XV1damJXsaeQCIhc/q+rrOS730GDaDjKuehwM99nxlm4/AzWPdKTMUTz87gAxvyfCcSqTQ/4sLIFv8ksDZy1uzQBG9BioFRdBqIc+V9sKyV5IQUi/CfWc/kvz8OkSk++a0PKNzFNW/Wsm6cyDMMUO2ToBKhI2EZzmtOQxrexYehoZ3AxUjHGZHbj4z4pAsWqStFd6YM9rwVmrtx65Wy9TiZAxqPweQMerACa0i0HTCdVqjK5sdj5bPC0/miYehAFrSCWTSAY2Nn52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 18:33:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:33:16 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/plane_helper: Print actual/expected values on
 failure
Date: Mon, 5 Sep 2022 20:32:22 +0200
Message-ID: <20220905183223.390891-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3585b407-28ce-4ce9-35f2-08da8f6d18bb
X-MS-TrafficTypeDiagnostic: PH7PR11MB7004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Zc+aSA9IdcEwTbDorVMaMkXWg0DEhPx/9BTYFeVfxhPkI/q7QaWDj2deje/0WMo07ZGNNz5gX1OTHOxxE7LSJz6kqWgFX80jVn+KO3hv8/L4JUlTeC4H4Lz87j7RV5mshVVt/Hm6FkrmdUndK1iLyYiepFVKdL5VG044RzIR4e6heT83gygk7rtZcNTQmkWklUNOgD4L1wzcPBDPVM/WPrNbn1mwUIevTtODAudBH+erN9Y/8Qvh9/u1UuiBY1ms9bop+2twSGOvpAxHjdJIH8mO15Q2pMfRQtXlDRCvybP1Pchq1BCpl+TVN5g02xYDrEgMAIBMN5F5ecBwsq+xf/X3are6Lf8EXclM2H1HOkFGuS1DWdWn9SMjFs96pfxN2V/qkqQgq2En12OIzFUGQ+zvhpnRqeWRjOj9bU5+9BLAbutGg84Hh48aATpN+E1ECf9+yR+7zqCz0fN2FY8YcJjUFqQmucPiAeKxgI8UQnRd06UTJE6MLYO4KQfHLHWEGXW3o7pSAlGThEI38D0QDG/XZq/WRfqcyiSe3lmUGQ61iFq6kdjpON1eG3PY34qJHLWoT0MEFk8EbYF7zIvsQzBN7xqrkMszS6UisbXnAq2N2RQAr/1qeHFIH7MYuwEjb/flMuGGCcXzVdpzFP8xj9vrTQwdx2D+/G/8xeIXigem/VFhkXwGJRSxYznie24S/77GPVshopB26byEVAuOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(39860400002)(396003)(376002)(86362001)(36756003)(66556008)(66946007)(4326008)(66476007)(8676002)(38100700002)(82960400001)(6512007)(478600001)(6506007)(186003)(6666004)(107886003)(41300700001)(83380400001)(6486002)(26005)(1076003)(316002)(54906003)(6916009)(2906002)(2616005)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVlwMXVsT1A5R3E1ZmtLSkpWK0IycW85Ni9yN0x1RjNndlVrRDZBai9FVmRP?=
 =?utf-8?B?a1c5NUlDaWFOamZuUGJyNzM5cHRiNnZRUjdGYmticVFmSHhJOWgxUUdwVjUx?=
 =?utf-8?B?SkUwZnIrODUvM0JNVUdrdHlwVE8zcG5LTGlJV2ZJTEpqUWpBNlFIek5jdExh?=
 =?utf-8?B?S1IycytaLzdZVkhnQXZSdVNsNlpJd1ZHd2JrRjJEejlCOUNvQlVuMWVXY21t?=
 =?utf-8?B?ZXNtWXRuZjBZY2Q5T24velNONUw0TUhGSFJSY0c1bElNelFYcS9pU09lbDBK?=
 =?utf-8?B?UndHZk4rSHRFeVkvdTNyRWY1Wnlkc2c4NnhsYlhrblcyNE5DeW9mSWR4MEkr?=
 =?utf-8?B?RGpsdDZVNFFvRUFSYzAxM1lTbHZ4aEU5cVc0WHJSWGwvdjhxM2hZWFhhMm5K?=
 =?utf-8?B?SDJhb0tRcWRSZ0lILzhiT2dBaGxGQUxIME1wejZrNWxXaUcwZGtPcGVINWVm?=
 =?utf-8?B?dUFscVlVd3hVeXZrMlFyQXJVeXJTTk9vdGExT1p4RHU1ZUJPcXE3aE1BRjFV?=
 =?utf-8?B?dWVINVlyOUF2NnJaKytnR0hwYUp5VTJub1NyS1QxMDRHWG92VWJaWlM0QUJN?=
 =?utf-8?B?ejlmOTdRbTM1ZmxwRlBpWXNwODkvek1veTVqV25IYWNCQkI4eThVSERiWGMz?=
 =?utf-8?B?S2tUdm9jaTVpOStyR3F2YWQ0Ym9UeS9Bc1l2VEpPejFZNHozQWxKdDE5cW8y?=
 =?utf-8?B?OGdQS1ZLOWpXRlBEMTkyczZLZndzYmpka0ZpWEdGdC9nejF4SDZpazBIR1J3?=
 =?utf-8?B?cWVCY1A4V3AyODgxOFg4aWZ4R3dKdEN4YnFIWVJnV0ttdGllRDlHUHBRVk0r?=
 =?utf-8?B?aDNTc0dMaUVuUHBsY1pRUXFjcHhTcE9GTkN0a2xNMGhpOFZpK0IyanFPeHZI?=
 =?utf-8?B?VW5FRlNVd0t4RHFla0tRQ0lVeXE3Ty9Sb2J1TStuRHFrT0tzL2JDZDJmWk5O?=
 =?utf-8?B?OVRKaThrTUd5aDRlUnY4U0FyNUZxaWxqcnN6UWw1Z0lOSE1UTjlqY1VDVU5J?=
 =?utf-8?B?azc3Rmg0Q2VLOTA5MkcvSWxqWGtSUTloUWY2Qmg3N1doaFJSVkhmbXQ5ZGlR?=
 =?utf-8?B?SkcvZTJ6eDdxR3RLYXQ0T0FKTEVFUUhhdTFFa3JvNEh0NDJnNGpudFE4Qk92?=
 =?utf-8?B?d0ZwZmNlK1JZQmFTVCt2bStkM09remQrZW8wczFzME1PSlZRSmxHa05Xa2V0?=
 =?utf-8?B?MlBmK0QzYVU1QkRod1BaQndReGh3bzBHTCtzcm9OWFhmbyt2R1Y0eWlTczdo?=
 =?utf-8?B?QVBnUXBVSEs2dUVUcGJiTnc3KzBqQW43MjUwVEdhcUJRZWIxaExCaW1rVHFE?=
 =?utf-8?B?WkMxWm9HMEFqa2VNSUYyVVhqemVuUU9yWXRXcDNCNmR1bWJmY29salcxY0M5?=
 =?utf-8?B?Qkk2Zlhqc2tOeDQyTS9yTi93K0EvU1NxZFB0eWJKNDE4RVJldWZCOXpnSXlW?=
 =?utf-8?B?S3gyVkJlNFc5cDBYbGZLYkpzbVpESU9ydDVhNEU1S3c1c3hvVlRmR3FHSk10?=
 =?utf-8?B?UWlCanFyNG14RXhmdUFNbTN1bEFzRGRqTmVhSUV1bVRtbWp1MVQzUG5hNEZo?=
 =?utf-8?B?MUlXMEdDaEt4c1UyK1BTQkRsdWpHWWtJTWtFak4xai9weFVTZktxazlrMWhM?=
 =?utf-8?B?TW5GaVIrMWlleFA5UmVoTHZqNlNYSnBPbXN4aEpRc0p0YVlXTHoyeWVYOU1p?=
 =?utf-8?B?aGN4cEV0VVljT0tUOG1ZVi9SNXM4RDc1aS8xall5M3MybEc4cThiaWNxU0hm?=
 =?utf-8?B?U3ZidDRacHdIclRXaCs4NjJjZm5KZURzMVYwZndTUGpLalJEaThJWW9WT0VN?=
 =?utf-8?B?NDhIeldqTnd3VWNJbkJvZnk0dGdZVXBTd2JIMzZsU2I0QXRHNlJ0RzFsNTBG?=
 =?utf-8?B?Y2xRdkNGNEcyMldXeDI2dWFCSFA1T2ZqRnUvVUorM2YvRE50MDJWUEkwREcz?=
 =?utf-8?B?eVVVeDBhWG5XbllwS0Z1MWZiUVdkYWlDeGNsdU9YM2VmbzNoWTV4QjBUSlJt?=
 =?utf-8?B?SGgyZE5SQVRReU1qVkhud2tFNkVnUzFYMU45c3BXTHZsRFFzVi9jMXVlVUpK?=
 =?utf-8?B?TnpwSUZwWnNCT20yMnpIdUFoZFpaT0RZbFRJLytNbVRjMmIxL3R1RXdFZTgz?=
 =?utf-8?B?Z1ZoaTdkdVh3eHVRU0MzSGRZcjVodzNyMXZhbi9PMy80c0N5Z0s5dzNROHdS?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3585b407-28ce-4ce9-35f2-08da8f6d18bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 18:33:15.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tDLr7F2W10s48C3ur3OeGj3dzJTFo4GVxFUDsZysnClJFzgDDhPRPlPNtxyweqbRu7jH2o9xaGwBiTlAXxCWfpEFFvTXgoH+MvAhwSCxs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
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

