Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CB5A87B2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 22:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066E710E2EF;
	Wed, 31 Aug 2022 20:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901D10E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 20:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661978791; x=1693514791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zpyXcM/tmcIyLCPuo3g9DhBrfU12Z+XEJV1Y0Py4iPI=;
 b=ZOcPWdfcsF7QjoUME8Y7v3APPYpvKE9w3V3Q/tFwzy438PbQ3hTpm53o
 L6wQ++OiAGqPICsU9R14PKVMcmpFUtACGYa7K+IvEQFCY/LFokRiHkV8Q
 xblr/dGEYfc/uu3RFCvDX8eJYM99AVHV8Cl9DMpHQPhnV8G0tqclrb0vY
 8HTnWgpR/lIVUGNRhoG2onbxA6TPqj4QLRMeqN/oUUwq+NcTyvs4l5hd0
 3u4jdsJ6QM0usHOIJvmE7JcB7TIoY3jCtUQf2sBhkaVFMDK8l36rRtJd8
 jr2ybOmeIaiFFjCx/yVuN58V3mot3l70ih40s7+yggQ9IoSwl4n52XxEl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275289385"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="275289385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 13:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="754547021"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2022 13:46:30 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 13:46:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 13:46:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 31 Aug 2022 13:46:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 31 Aug 2022 13:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fq7VRp5ruPLr1/pH0BVTFy1Q7jpwk+Qp2e/tPlB3Pvp9P2qIQKF36MZJx6BqsOQqN3Dl/mhbQBYpM7gX7pYynLOt+mr2q125w+Els5Op3QDNnM3UH+FIqfX0taS1bLqwovQHR+HPmx67hZ+wO14k212AjUTodKHvHi8kytxL0GLaDj+JSkVQKtHuSm38yW5SxSMX+OvCNH0ESGfimf0P2ctkxCRF+V5xEkMlhP9OsKWcjvgKKjRMDoid52xBojc9x4KKAc5C8PIaMSM1pvemfpntorT+QCqeU3df7ywJfwCRn7EafBHZLq9carxm7+BNEkogbAOSg+fx5f7xxKb5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2jPnT5RMW6fBwp5LA9H6VdIS+VLZ0617wf9flkhDlk=;
 b=Vd9Hw3lfoBlvoiiSHTPZ7m9Lru0cT6rdtGpLl0F0SI1Xq5bVBXlBTtLOsNpVwmAw1rHifqUSKSI3+kCpNBI8V3ahm/aI596Vk0xOmmfgMMdZz5zFixCN/YuB/5DEcBspznfRCdIZIZ6OP5WER5RNZZqThkG3QYg4EoGd6MIfY1l7/LdNaeUwcEvoxb2y1pXPtR+VFYgbp2KXnejDcKnIClqaYnMtAIydHggXSEQjkYckEm0Qk3fIQKeS07wr1jilQslrdtx/wks/pc4mAeLgkuQNSMbAWH7BOcVI2xnTRkyLkyW7vyJwrcgsKhFtoubWwgCehJdEyrqx3Z8hgwv15A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM6PR11MB2778.namprd11.prod.outlook.com (2603:10b6:5:c0::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 20:46:27 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 20:46:27 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/plane_helper: Split into parameterized test cases
Date: Wed, 31 Aug 2022 22:45:36 +0200
Message-ID: <20220831204536.348930-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220831204536.348930-1-michal.winiarski@intel.com>
References: <20220831204536.348930-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::22) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feb0ac0f-e0f7-4d8a-1e2f-08da8b91dfee
X-MS-TrafficTypeDiagnostic: DM6PR11MB2778:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdpFdfD61F0c9RgjYlStF5sWYS4bpP1EvQWNi7itzQcV5iTq3C4YOeKvC8UanrcuLbAQPB2Pl0UVt5ld/I4kddVZO5yVmr7DeO5nUEuQTX2eEkTFCyOkkruPq8WZDwhND8iLM6v2afZ/ZlbmFySDFgd5abTJTj+CbRMp4g5JGh+Efnm/CEWjBDbOB0y4rBqOw4EGVEr2YEdn6xj34xm3fAZqlNBSQgAjNgOx/gOSJT3ejLjNZ1FzT0bBFcibjW/gJt1x6MiIUrNLPrZ5paeHji5C/+zIPzF87lEWcdIEE1ox7OMyedVKmoBjuHvuCmfo7pcioVFN9zpGMmPUqUJgS6L4Z4qzAA3zFLUtqY2U5k2aTCY/MFA+7pWour1Rpqg4AYh3g5ANTdmn2XR/0RqcU5tWviJzt57XmFfoi9qEZdwloDX5Dd0W3SVG2sL93DzdiZihxXrkjYUGuMAV3f3BDmmnznyojeK0s9wWycLIkCkkcWzYUvAEJLZyaFa3yfZEKxw8tpuM21/ucJeufH1hI3ynCMAAxKMhTuVWB1wqJjlcNhObOpn1cbgukQZ2XQAEzmMdEOXKGS7sU1r23ntLOZWT71Eob/LBxhCF6HcLqzvrNE8JtY6TqhkjnhOiPjgHFqwxhkrJ50MDFMXXFXHY9tQmv87u9PuY44mD8cqvFYYmxHb7aqKB1tt5iXd1oPXCv8K3W6CwzuqJ9tXchzp2tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39860400002)(396003)(136003)(376002)(36756003)(2616005)(86362001)(83380400001)(186003)(66574015)(1076003)(82960400001)(38100700002)(30864003)(5660300002)(4326008)(66556008)(66946007)(66476007)(8676002)(2906002)(41300700001)(107886003)(6506007)(478600001)(6486002)(6666004)(26005)(6916009)(8936002)(54906003)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtiT2krb1JvTldPMkREY1dIUG01OXFCWVFublJCVzZaUlo1VkxNN29YRFpI?=
 =?utf-8?B?b2FwelRva1UyV2w0OThKb2daMnlSdlBFbnRHTUV3RHN0QTgrVll3aUk2Vkpt?=
 =?utf-8?B?cWZxbWZSb3Y4MmJjeXJFR0h3RzdaZi85b2l4c1FMYkhBTGNGZ0FoTGxpRmVZ?=
 =?utf-8?B?YlJFMnJGdDIzQnUvWERpclFjRmpXZ0ovMzl0cDZDbGxRaE42WGx6STBVRUFv?=
 =?utf-8?B?VCtZdjNPaHR3UGQrL3JKbTkwN0JLbXZ3VVBGUGErYk9CMWdESlBHeGI2Uk1i?=
 =?utf-8?B?VmdaV2VNWVBqY1oxeVByTi9LV2NtUTZMUk5mV2ZKc0JLVUtCVUZ6YkV4U3BR?=
 =?utf-8?B?K3hLYmRySTNNRU5zeE1VbExVQ3A0Qm90WEFORUF4Z2JxVlVSeDB4eE9VeDQ3?=
 =?utf-8?B?c1F5WURlMm9Nbk1LMEZYYW16VXZzRERkZU1zUTFCR2JyWHRYWEtBU3lMSDNB?=
 =?utf-8?B?UVMxYTB4VWgwV01zVzFZMHlHOWtWeVVhMyt0bkZYc0dPZytrMEUwcDg1dmNh?=
 =?utf-8?B?b2ttMmUydnlMak1FNmNBaGV1TU1IeWIzRDg0SlMvUW0zKys5NzVhYWl5ak1N?=
 =?utf-8?B?Q0t6cnR5bTRoR2FER0pkK0dveStyVHM5TkI4aENicWdIL05yRHhaWENsQktl?=
 =?utf-8?B?aUV6QlE2bm1EYVNDaVIzNUFRK1FDeXBQUFUxYkJZMldtem5VMGNLQzVwa2o4?=
 =?utf-8?B?eVZFR2FiSWozdUg0dDh6dExXY29MOEgzS1hhMy9QbXFOQm00Qi9na1ROa0Mz?=
 =?utf-8?B?RVNYQSs3KzhRU08xazRvaWhyWGFuaXlBNFpYTktNcTFZZTI2MnNoaGZndmZ6?=
 =?utf-8?B?MEhOOG1hd1d0ZEhYcnNOVmszNzlLWkRFWmFERW5qUGY3eUR5azFmRjR1K2NR?=
 =?utf-8?B?VkpwZktJNDgxY1lSVnNwOFh3ZklkdW8vbXdtSGNXWmwwS28xUE5ZVk9valpC?=
 =?utf-8?B?dHN6WFAyNENnSUlmQ01KK0JkRGFoVDFHamVVQWNvNTRmTUlIYzBGWW5YWE1T?=
 =?utf-8?B?amdGcmdxRy9IdnBidi9nSVRiS0lsQ0x4b0dvUWNiMytSWi96YmxLQVV3N0Z3?=
 =?utf-8?B?Y2ZvUTcxam90SGRUR0pNVlVSbWlpUGgrM0g3ZUsvMU5NY2FiaDFXZzBlMlNF?=
 =?utf-8?B?SHJFVlBSc1daZ2xzYlF1TlF5WVRvZlpiUzRMTWIzRnZMeENDeVgrckhYMVh3?=
 =?utf-8?B?ajh5L2VLMjUxbFkyd1p6VXpuWHdmTnFoazhtd1UxUTV2UFBkTlN6VFYrTmdh?=
 =?utf-8?B?Y05vbFdibmJVUUd5UzR6QVNVeGdIWjhXMTRxa0I0M0J6aEN3MmlyZDVrak9C?=
 =?utf-8?B?Rm11K1hDWnc3eDIyZXRLUDBlZ25Tem4ySmlMbUpZV3NZelUza2pTMkZDWEcv?=
 =?utf-8?B?NXY3OSt4c1h6YnBlRW53NDU3WnZXS0lkajFnMU92MWQ5YktVRmsyQXdVK2pT?=
 =?utf-8?B?YjZmLzNXa3BCY1V4SHF3QXNvZ0NxKzhOTkNJMldhbFZYTFBRUklzbnZHd2tI?=
 =?utf-8?B?YjRJVWxBaURaM3BJbXlxYnNNK2RSSjl5Z3QxZjBFVEM2a1k4dFFvR0ZSYS9U?=
 =?utf-8?B?bWpZRGI4YVZZUlNTMWJya2pNR3I5bU9ER0lwRnVJUFF5K3M3UGxGNklqTXhw?=
 =?utf-8?B?d0x6QmVLUDNRQnI2TndFZnE1RUI3SUNMQjZXMEMrSWxzdGgvNU4veHVVMzAr?=
 =?utf-8?B?eWNTYldXZkpXQ2JtV3ozMlhMSURkeVVSRWk0SjhZRHhVc3c2a0ptWFFmQ1BX?=
 =?utf-8?B?YmU4SmxZWEMreVVEbmQ5VHoxcnA0VjVFT0xxWXNGallTeDJQWDZ0RVMvdDZZ?=
 =?utf-8?B?Uk9HRHlwbUhzaUhxbUJlak5wbzZqTmtrSU5XUm1OMTlraVhjRjNETnNFZGlr?=
 =?utf-8?B?WjQ2a0taUmZYbWNSSExEVU1FN2kxbjBNWkdqa2VjWmcxSlZDZ0N6UURBNC91?=
 =?utf-8?B?TXRYR1htVFhrR241NHp0OVdNZlkxZHVlUkd0M0lBOThhSHhaTUJCaHNUM3lh?=
 =?utf-8?B?QVlyWEtvaFViclZXRUxXTERYdjl4c0tmaWoxNEVDM1NQWmVVNytvbE50RXJD?=
 =?utf-8?B?MHhGUWlRSllYMmJqeWZySUFpM3h2YlBYRjRlcVg0ODgyUThRdmRHOXJickhE?=
 =?utf-8?B?a21GZStITEFNMG43aEZGOHpyR1BkZldSS0MxVXR6SEdVdUIraDEwTXhIdldN?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feb0ac0f-e0f7-4d8a-1e2f-08da8b91dfee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 20:46:27.2121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atpm5NOpasxOqwe1MJu37CDdGJ06+1mALPDF/eK68OK7lbzS3pRuZbnV29RsiLpc/F6KBYVYoSfM2W5961f96w0WI6XzbNCm3xtcEjQoT00=
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

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 456 ++++++++++--------
 1 file changed, 267 insertions(+), 189 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index 0bbd42d2d37b..505173b019d7 100644
--- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
@@ -12,59 +12,97 @@
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
+	KUNIT_ASSERT_GE_MSG(test, plane_state->src.x1, 0,
+			    "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
+			    plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
+
+	KUNIT_ASSERT_GE_MSG(test, plane_state->src.y1, 0,
+			    "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
+			    plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
 
 	if (plane_state->src.x1 != expected.x1 ||
 	    plane_state->src.y1 != expected.y1 ||
 	    drm_rect_width(&plane_state->src) != drm_rect_width(&expected) ||
 	    drm_rect_height(&plane_state->src) != drm_rect_height(&expected)) {
-		kunit_err(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
-			  DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
-
-		return false;
+		KUNIT_FAIL(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
+			   DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
 	}
-
-	return true;
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
-static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
+static void check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
 			  int crtc_x, int crtc_y,
 			  unsigned int crtc_w, unsigned int crtc_h)
 {
@@ -74,171 +112,211 @@ static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_stat
 	    plane_state->dst.y1 != expected.y1 ||
 	    drm_rect_width(&plane_state->dst) != drm_rect_width(&expected) ||
 	    drm_rect_height(&plane_state->dst) != drm_rect_height(&expected)) {
-		kunit_err(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
-			  DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
-
-		return false;
+		KUNIT_FAIL(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
+			   DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
 	}
+}
+
+static void drm_check_plane_state(struct kunit *test)
+{
+	const struct drm_check_plane_state_test *params = test->param_value;
+	struct drm_plane_state *plane_state = test->priv;
 
-	return true;
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
 }
 
-static void igt_check_plane_state(struct kunit *test)
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
2.37.3

