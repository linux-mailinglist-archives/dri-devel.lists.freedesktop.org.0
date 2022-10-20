Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D8E60599F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B351B10E3D6;
	Thu, 20 Oct 2022 08:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263E910E3D6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666254164; x=1697790164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oJ+q8nG9vDc41c4j7EuCXkjaixF/UXbXAiyLvsYR+5Y=;
 b=j/YeTgoMD+WrE2y7COgmtbnnUtv2UtprwkmgbxVPAKDEib+ZZva7gkKH
 PHcSd4t6KFqjm7C7jpx0tHEAcQiYaPruSZr38lBgEm7crrqYt/Sq24Tda
 XCyyS/HJuMVoyDb5zd46Fb2oumysjNMXSfLcJwCLjO4kab55EpwIN04FN
 S/zgsfdmpTreG0oQNxI0xROJml6EF0XaCGJ3PFfp1jAB+QH1QVUz2ZzLR
 5T5U7MJW6tdJQWUWb0Uo6YYfa/b6ISw0sBy8ItX9m4PUIYq7+K771MHbf
 zSmyiWpI3IvtKtEqf1JyuJGml7RunMaFYZipn3NsLVyKpNOR+uMIMW9qJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="392949776"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="392949776"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="754999823"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="754999823"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 20 Oct 2022 01:22:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 01:22:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 01:22:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 01:22:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 01:22:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTyhG6D3xnka9tVt0xOv08CqJSUOoMEYrRwh8NNhuGVaeTeBFw9K1PyRq9ksvoX79lphhixonGVA5kV8C8QUsnkFePWOOlBLF7jAp7V4pGoA6J1pnXxPzpFz9T1hl6jjyUPy41f/6QGAUuH+EP6oJeYB3VO8B8Qxjb6azyaNBodw1zM1zJ8JJ4q0l/9pRJdhg3M7hx4qMCMlnhtR+1yHKgMXcJDiGz+WmMxbqy71vKOv8nW8WK3NgfK7sog3Tt2jMAvGiauZgQL8n6+wfpvx+BtxnhUBi0MSjkhd3lFjl1IupT6ERD+TaX8i/Torh1ox4iF8xpexWDnW166/jCrZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzyaFp2lFJcv059GmAuB+KOYQzSeeXiqh6lBfnDA9ro=;
 b=UhYZ3PHatUBzebx7/5Cd9JnTL/A+f2lz82JX8zeJANwS2oaS7qeTIp8/rXQbXaOzDAJJvQfZLvKtCpycg7+ilTQWo1NEP8zF/C7yjaO764K1b/WxhO0Z2KaDI3mCLfBqb1JsYanRBnXawdEF2y0ri3NjlEOcFzHcWNzkensaJwqgepMoC79hPFjubNTz+5ObP31rVm58n6uOYeqb2My86VBTi+bDHSJrnhyiav0miB3yIotTg042Zr8h8JfSXZvzcWsnTh6XK8wRFCW6KzEC1gpaboIin1LAP/MYABxFzwoWwZO9vRRtqqkVf818h/agO7KpTpGhsKRhAx6UZAwEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6476.namprd11.prod.outlook.com (2603:10b6:510:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Thu, 20 Oct
 2022 08:22:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f131:2364:3638:6505%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 08:22:39 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 2/2] drm/plane_helper: Split into parameterized test cases
Date: Thu, 20 Oct 2022 10:21:35 +0200
Message-ID: <20221020082135.779872-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020082135.779872-1-michal.winiarski@intel.com>
References: <20221020082135.779872-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db62350-585e-4413-ad40-08dab2744074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I5aGT1UxguwWyPhd7f/ZFMmCoH/8Of+JveluVAs1coQLgrxoDCB6pKhLdT6kUqc8OBXaXSgxT+h8AYHgsdnhcb5q4HYaIW1pVzuUk0xer3DF0NatHZTU3H4dBJPVU4BL8L6/rLBF8WZqMBTSrNIrmyZ9qITPpzpAQjoS+7pzMmnbB9GLfi8OImY8aOIdgpa1I7SWKXxx6+UcoezRrT27HXtuFERTYNvJ4ycX8EvQonYXGrkKgI8yIsFDwi9thLUZ3I4Sc25A5A/rKUJXJ3NufsYQLcQsO5hkOWy2Ty0aMrt9m5kAbt1XQWLgMASzHxCrRF8REor8d2dQd3voSnRAgTfzRTDu17ipHsOJuISzTIPVnAtp/mUiInly28JTcsqiMLGsGMfPYHCBx7ARnziFjNAvefbVGvxVTlu58ezi7llElkzLfcCu5EIBQFLe9J9N7TvCcDLX3KgG3F2mrB/8MYZqe5gnMO4g6S5ld6dMdkFDQ80smV2c2PVOoWnqAI8d8Bn3MrPOne+pAu0Sp3akH5/T+BfCSnT9SPSyrCjsw/AqlAZF9ED7PvMmcfaTfSdJoteCNEBNilc6hNoHktqJPYoVhf2tKaSVDLV4JomtlRP4yJWqbfgRbOUy3k5MSOCaQnv5K44bmxkbnmDaJ5kcHfunvWd5qF9yR19Br6GgZ1/KaqL1uoReUhLY6u9DeAsizAcqa1EazgiBfGvcLrxBqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(66574015)(36756003)(82960400001)(86362001)(107886003)(38100700002)(6666004)(83380400001)(66946007)(5660300002)(66556008)(316002)(54906003)(6916009)(30864003)(8936002)(1076003)(66476007)(186003)(2906002)(2616005)(6506007)(478600001)(6512007)(4326008)(6486002)(26005)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlhuQWhMbGNoQmdUbXpxbHZjdGw5ditWQitHQzlWMTEzakdMVThyNXNGQVhR?=
 =?utf-8?B?NzhsemhvUXN5RFZNYlFmeFRTZitJN2JrY0l0Q2hEYXo1S1hEZzV2ZUhzUEZX?=
 =?utf-8?B?MmlmVytDNDdYSjV0QzdPamM2NzkwMnpsVFZ6SDAvbUl6YUg5Z09CN2w3ZTFj?=
 =?utf-8?B?d2lWeTIrUlRvTlJpMS9UQVpSeVBFYnNBOUI5YW13VDkwR0I0L1hwOVpnZDdK?=
 =?utf-8?B?Z3c3TnF2YzR1Tzh3S25OZnoxa2o5YzZRWWdWNVVvMjBYZVFlYVQzOEhWVVVx?=
 =?utf-8?B?TlQ1QWF5b01sak4rSzR5UEdSVWloYlQwVWhnWmtxZzNGd2pMYTNnVWo0VlhP?=
 =?utf-8?B?WG9XSzJnQnR2T3IzUFd6Wkl3NEdWaWpHVzNyUTFuUURBTlBxR2p5ekJ4bjZK?=
 =?utf-8?B?L2E3WWdLdzF2SFpUOGpkYTc1b1ZqYTNpUGROSktidW01U2JGU3Jyem1oU0FK?=
 =?utf-8?B?SnViajMzVVpaSStWVDl3ZW9ZenprNHpqcmwyako4WTR2cFVDRzdWc0J2N1Zw?=
 =?utf-8?B?emc2WXFabDhZOS9tSnNnK2liRXpkclNVTXlNL3UxMnVMUnUxVEVhOUZrK3Zu?=
 =?utf-8?B?cS9hVktCcnM4SUlYS2ZGQTFZOFpUbHloUmZmQWlpZ1JxYmtNRG9FSG1uR0Rj?=
 =?utf-8?B?ZTZkcUtPbFphaWxETHliRTRtTVNrbENCUDV0MkdkQjh4YzJtV0VDTFZjdjJN?=
 =?utf-8?B?MGc5OEVMdk1BZE5mME9mOThDcTNEdEhXdGFEazFBV0tqaERSc015b2JIYUpE?=
 =?utf-8?B?aWdDK0NRNW5DYzEzbEZObnJJb2Y3NlhtZ0hPOTEvaVBmNUVHT0ZDQ3RHOFBo?=
 =?utf-8?B?b0F0eXlJVEtuVmdxak9xYmJyL0hJWWxpT1AzVU9pNG9mWGlvR1pmak9MWUky?=
 =?utf-8?B?c3NPeTZjK3dXbS80aER3Vzh1Q3l6eVl1YjhTV0x5cG5USktEL3ZKOUJZbXBH?=
 =?utf-8?B?L2pjSGRPY3dwZVlBUmo0UjdBQ3FkSWt2dlFPQXpmMU9SUWpUMFNUM3l1OTR5?=
 =?utf-8?B?Mmx5R2JGNXp2SXNLZmN1YWU2TmVHQmZhOXFnT0JKZTlDSGwwbC8vWFdkcmVq?=
 =?utf-8?B?dmEyUldpN2tWbWRxckpLMS9CTmNOcXIwQ3ZlZ2J1Rnk5NUx3Zmpyc2xCTDhz?=
 =?utf-8?B?b2tWWk5GamZldEVzVm1mbHZTVmJqZE1UOE1rT2wwR3FLeU9aNDQ5MTJGZm1V?=
 =?utf-8?B?OUpUQWRGMlNXa3VUeXVUUWJYS0RoSG1XT0gySDlUK2MrbG9ZaFh0dnlRb2pK?=
 =?utf-8?B?c2hJUmxEekdsamFmQmpwcFBHaFl3SVlnc2Z4VFJTNEdVV3pyODYwSzlVaUxo?=
 =?utf-8?B?aHc1NjAwTmZySy9MQnd1UlAyQ0Myd3lOQ2ZzVHczcXE0NVJFZElxdmRvbThN?=
 =?utf-8?B?ZFkrSWxqWEQvM2FsMGpoTTVyMEVqSDlPTTFYeEZ6TTBLSmhxa0cvRWdQNlBp?=
 =?utf-8?B?eVhWVU83S0l4dUx4a0dDeFFQcldEc1JXZHlSbVhtWERKWmYzSVduT1BnMzM2?=
 =?utf-8?B?eHh2VTdiam9hT3JJam9aL0p6Q2RIRG9YSWYwOU50bHZDWXdrMUVacGt2ZXJl?=
 =?utf-8?B?NmRGVG1xUTZ0dzJOaitGOERQQjJYS2lNckdmeDA0ZEQwU0VraEJmZ2tsN0hK?=
 =?utf-8?B?K0E2Vm4xSlJLNk5QcitKSlY4YXBOYktGOFBaTDloTUZUMVZhbjhCTUNHSlVD?=
 =?utf-8?B?MHpBdWpSamJpQSs4MStPRVBDZUxsanJoaldHRUVzZ1lsTzRSY1lSY2prS0Z0?=
 =?utf-8?B?Nm9zSFpOam9PVTlVWDBmcENPaHJCQ2EwWXN0QWFiUnFxTlhNUW5uNUNJWFNs?=
 =?utf-8?B?NWVpS2d5YmtnSWFjaHpkM2VQd0VvUFVaMVEreVR5d0N6ZkIzbk1oNDB5TFVp?=
 =?utf-8?B?SVRuTHg1WklQOHE5dW9xdlRmL1dvSDB4T25qenZZcXZSNHVCeFRoVXJVNnRS?=
 =?utf-8?B?SjczQk9ZcHJKeXMyQlNLeVpjcVlJS2EyampIeCsrc1V1d3pyVE5pLzZ4bUY5?=
 =?utf-8?B?OEVid05iVVlRNTVxWmx0b1VhT1JGNlVkRk1aU1gyWHV3V3VXRXRWcXZZcE5n?=
 =?utf-8?B?VThON2lRYmwvbG1PU1lSd2dHNVZqUDdaYzZIcUNGRkthN2YwbkNEcnh4Uk9Q?=
 =?utf-8?B?dVNMYm5XelRDSUxjbklUVk4vL1pKTXdXWXk3eHMzNzd1T2hhSkcwVnhmSzdP?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db62350-585e-4413-ad40-08dab2744074
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 08:22:39.5871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Snlo8Wc41en2UvSNyxjn11LuS6dEav6I+uLFMS2MMh4OMbSVhwGEpx1kIhHKeQa4WgAKO7gGaeuaUW9SJaidt8T4dWfne/TABXp2JKcJ7XY=
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

v2: Add missing EXPECT/ASSERT (Maíra)
v3: Use single EXPECT insted of condition + KUNIT_FAILURE (Maíra)
v4: Rebase after "drm_test" rename

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 466 ++++++++++--------
 1 file changed, 268 insertions(+), 198 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index 4963f0c960d8..6070671834ea 100644
--- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
@@ -12,233 +12,303 @@
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
 
-static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
+static void check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
 			 unsigned int src_x, unsigned int src_y,
 			 unsigned int src_w, unsigned int src_h)
 {
 	struct drm_rect expected = DRM_RECT_INIT(src_x, src_y, src_w, src_h);
 
-	if (plane_state->src.x1 < 0) {
-		kunit_err(test,
-			  "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
-			  plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
-		return false;
-	}
-	if (plane_state->src.y1 < 0) {
-		kunit_err(test,
-			  "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
-			  plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
-		return false;
-	}
-
-	if (plane_state->src.x1 != expected.x1 ||
-	    plane_state->src.y1 != expected.y1 ||
-	    drm_rect_width(&plane_state->src) != drm_rect_width(&expected) ||
-	    drm_rect_height(&plane_state->src) != drm_rect_height(&expected)) {
-		kunit_err(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
-			  DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
-
-		return false;
-	}
-
-	return true;
-}
+	KUNIT_ASSERT_GE_MSG(test, plane_state->src.x1, 0,
+			    "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
+			    plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
 
-static void set_crtc(struct drm_plane_state *plane_state,
-		     int crtc_x, int crtc_y,
-		     unsigned int crtc_w, unsigned int crtc_h)
-{
-	plane_state->crtc_x = crtc_x;
-	plane_state->crtc_y = crtc_y;
-	plane_state->crtc_w = crtc_w;
-	plane_state->crtc_h = crtc_h;
+	KUNIT_ASSERT_GE_MSG(test, plane_state->src.y1, 0,
+			    "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
+			    plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
+
+	KUNIT_EXPECT_TRUE_MSG(test, drm_rect_equals(&plane_state->src, &expected),
+			      "dst: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
+			      DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
 }
 
-static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
+static void check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
 			  int crtc_x, int crtc_y,
 			  unsigned int crtc_w, unsigned int crtc_h)
 {
 	struct drm_rect expected = DRM_RECT_INIT(crtc_x, crtc_y, crtc_w, crtc_h);
 
-	if (plane_state->dst.x1 != expected.x1 ||
-	    plane_state->dst.y1 != expected.y1 ||
-	    drm_rect_width(&plane_state->dst) != drm_rect_width(&expected) ||
-	    drm_rect_height(&plane_state->dst) != drm_rect_height(&expected)) {
-		kunit_err(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
-			  DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
+	KUNIT_EXPECT_TRUE_MSG(test, drm_rect_equals(&plane_state->dst, &expected),
+			      "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
+			      DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
+}
+
+static void drm_test_check_plane_state(struct kunit *test)
+{
+	const struct drm_check_plane_state_test *params = test->param_value;
+	struct drm_plane_state *plane_state = test->priv;
 
-		return false;
-	}
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
 
-	return true;
+static void drm_check_plane_state_desc(const struct drm_check_plane_state_test *t,
+				       char *desc)
+{
+	sprintf(desc, "%s", t->name);
 }
 
-static void drm_test_check_plane_state(struct kunit *test)
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
+static void drm_test_check_invalid_plane_state(struct kunit *test)
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
+	const struct drm_check_plane_state_test *params = test->param_value;
+	struct drm_plane_state *plane_state = test->priv;
+
+	KUNIT_ASSERT_LT_MSG(test,
+			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
+								params->min_scale,
+								params->max_scale,
+								params->can_position, false),
+			    0, params->msg);
 }
 
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
-	KUNIT_CASE(drm_test_check_plane_state),
+	KUNIT_CASE_PARAM(drm_test_check_plane_state, drm_check_plane_state_gen_params),
+	KUNIT_CASE_PARAM(drm_test_check_invalid_plane_state, drm_check_invalid_plane_state_gen_params),
 	{}
 };
 
 static struct kunit_suite drm_plane_helper_test_suite = {
 	.name = "drm_plane_helper",
+	.init = drm_plane_helper_init,
 	.test_cases = drm_plane_helper_test,
 };
 
-- 
2.38.1

