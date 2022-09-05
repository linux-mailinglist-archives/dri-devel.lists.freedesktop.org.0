Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555A5AD90A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 20:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363DF10E4A1;
	Mon,  5 Sep 2022 18:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9776610E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 18:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662402809; x=1693938809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LsnLkp5+Ndlcqr2Fj8aNm0EMU2VvTOKuFpiaHnvtU6o=;
 b=M8Ovk/ubG8rogo4ZmlsaRj5WDRV/CbMHowNnNkGpErvecdODmG6rulKc
 91BVJ2H42QFWCviyXKndKMdvXoJnk5AOPfloHNHrZKOwaY3jfk93vChcc
 f2MVX4Kkue3QD9cDrHQjoYdU0JuMmBqK0YDodk1iLIyQjCubrcv4kFQN1
 u3V6RVNdQadMCDUY1uMEXD7tV2jz0Yq9IJR71D1c2rrK9H3IZJwnM5MaA
 nsoTr6Hwe8opK+K0knd2N7vxBhCTj8QskjolmNgI9IMwiXHHTimt8CT9s
 JqsSVkwcqBcnXrNkwHNI7+sRKpqApTeISAuAINX+jQHjG0F8g005CXsxV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="295175997"
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="295175997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 11:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; d="scan'208";a="564843860"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 05 Sep 2022 11:33:28 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 11:33:28 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 5 Sep 2022 11:33:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 5 Sep 2022 11:33:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 5 Sep 2022 11:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2OUydgNmEjUANgvYQUqaxO4qQbkT/5wX0ro5LG1VaI6w6KZusUlVRetIblzRJtIynMHl9tDPnUT45k3NTOJH+Ws4ubXPraNyxnYEEGHQIOJmOKQFLo5sG2fcr6SOvE1oIte9Tmk5gTHZ9JL6BA44AkAn60sxoGX5ukc15AAJyxzUO1w8xF36++6are/cmXX5uO5/f/+elo4R8iVjuuFBiwbeSm53Kx9bKJyMfuc7ZtoikHN9RdOfRsNKWSK2iPORcHb5/XSEMPUvlVKYbwI25KHAZsj3/E8n0sSWOOU543xCmUgE50hSnPg3Fc66OqomJ2oFlU8qH6BadrJaXvJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niSS165R8QDszalnwt2pfsJvMsl+dwNNNPfz1GBfT7s=;
 b=g5GL8feVqngH6NtrOGHJNBnHMDnPMfrPVRKtWH6QGz/x/GNGHYmUmUo7ZDww+SC1fEr5BVdWVvdLcbrMvT5pghGTM1HzXX94wrUUg7V3BqIniT7vqbE5bEkTw0RpF2sSbXvsU5Kr7AYcD5oxbSZ+Pf6QCzXIJKFXiq9zdQuXTchIuNDiFPa7q4NhbbpTYhOGIz+go3fZ5ZtCqVyiqBEKrJN6VwU5QOeCQv6A+u6+Ao2QCyaVK97P156D1oImdUQeHtq6f6ANeNKfvlJrg3ZGeNlZ714NaiZSsadsHAPZTW+LOGL7+cy38DvhQbmwCty73sIbT7By6cEN6MLvx9UTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Mon, 5 Sep 2022 18:33:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:33:26 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/2] drm/plane_helper: Split into parameterized test cases
Date: Mon, 5 Sep 2022 20:32:23 +0200
Message-ID: <20220905183223.390891-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220905183223.390891-1-michal.winiarski@intel.com>
References: <20220905183223.390891-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a86149b7-fd75-461e-959a-08da8f6d1ebd
X-MS-TrafficTypeDiagnostic: PH7PR11MB7004:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJ/y2lrWGmbT2XokKRVNdAaJZMzS1dmylwpiaLacAfogP4928XyDEgu9oLH7LvHF+H79UuUjkuk+8/UFJwtXRaFD0LCqR9pXIbju4SEXghgvJzPoL/aJNfRR8zXDiBkDtFK71RJ2LJpqLrqUcNw3Bfcn1f8cP75tKa95lp20EYspDapBjg0rXGhN1eOa6oUd78OK605pf6JNvteCZr6TD2pEUbU9QSSyV50TbwFNfQFcAzxrQ+QJbbCv3S68H7kU+6bFkhRaEf8Pb7Zxo6inhGqPjFtzoxrVQAbSbRnHhafjQuwJbpv/hdquOC1142ifndQoRtT0sit1fr2jfGvtjyGD9YKjxgqpvtVqcID0bK2UaKNG0K8MwwISzPkpssShINmUFIhji7DjRKSd4E4F+jNxAlobrX8+V8DMUQNyYbuxXGR9wcS3INxOCiqVqBhbjKZZC3oqZ2NtamhKp9vf5L9N7xacfWE+99Ep+hIUkTIgRwnVWolYgen+jhBz3Hc15Eqtvf0Tli6f7rx+YMmL+LB4let2dZmnS/bsLEWkPo7RPe/07cylYAKFcijEu4XRajODyniSpUgj5gs8sawE21/7g8yIu82eo5s3shTGZ4g9NgVKjCTUidxGXgfKYZfusjdRfsUV7IqIt7rMFGBiVjLiCLtwePOaeL5QrWLLNBOLZFZCizZTqT9MghKOWyJzpuZB8OF7z05RBMS19AtHIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(39860400002)(396003)(376002)(66574015)(86362001)(36756003)(66556008)(66946007)(4326008)(66476007)(8676002)(38100700002)(82960400001)(6512007)(478600001)(6506007)(186003)(6666004)(107886003)(41300700001)(83380400001)(6486002)(26005)(1076003)(316002)(54906003)(6916009)(2906002)(2616005)(5660300002)(30864003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2oxWGRkZlhaT2J2dTFzU0xCbnRBM1FyMmdWeU5LaUxmSVgza2lwZ0FXcnNN?=
 =?utf-8?B?anJmVDlkVi9TTTAra1NuTFNaMzVxMkdtOFJVQk1KVDJMeFU2RE11Y0wzUjV5?=
 =?utf-8?B?WXB0eXo3SGpYNm9DaURncVpOVStaMUNnajVHSENqL1ZhU0NrYzVoNlR1OG44?=
 =?utf-8?B?azEzcGVvY1dISGFMMXZlNGZ6ajlDNEVXZUdKNU1jVjl4L2NtTDI3c1NRSG51?=
 =?utf-8?B?TTB1VStxMkhFTkIrbnZrQ3JmZitGV2ljc1dnc01QdUE5VndZNEREYjZtMEVB?=
 =?utf-8?B?ZnlaWi8vK2VKRW43N1RRSGFnYzNWMkVmWFJDMFduUXJLY2o5NHJsL2t2S1VF?=
 =?utf-8?B?V09xVFBrdDQxdFVOU04wUlpPajVmSUFNbU5UQ2ZpbXcrYkJPS3dQWDdwNmZ2?=
 =?utf-8?B?WHFlVnMwNGl3djJudzYyQ214Tm5YUUVuTXdzV0xEWnhQcWsxb2tYL1g1MFVz?=
 =?utf-8?B?MWxDT0FnTzVjWUc2VUgwUHdXU0NncVovSU9PM2hpUkZBaGtNMHBlVUVaMzY3?=
 =?utf-8?B?RzRjN1RsVnNoNnNCbmZ3RVVCSDdnRVVqbVoxMWRBNUpJRXlhbVdRWmRwQ1do?=
 =?utf-8?B?VmZGNkl5Y3dzUDBBK2E5VHZ1aE5ENWQ1c0JPTlhOUTl2aUI2REYyR3VEN0pI?=
 =?utf-8?B?NTNyVEZ5TXRVR04zY2xhc3BRc3Bvek1mUzdkVUJwVGh4cHhsNmtwQWVuRGFE?=
 =?utf-8?B?RE1YR3laUjgxdTJpcnVNYUF4RWJrSFBxb1ptYXkzazJoN2E0UXB0RmdzWWpu?=
 =?utf-8?B?MnhzbGdNSk14ZFErYSswN0d0YjA0QitCY0VWNFY3RlRkcVQ5RDdyZG1aNEcv?=
 =?utf-8?B?UXpvbktVNzNyU0pBc0dSQWhaci80MjcrellraWJ4RXZYS2lvVHMrekEwVlRa?=
 =?utf-8?B?L3pNYWMvUytEajBKc2tMTFU1Z3dZVDRML3ZMcGIxS0xVRDBPaEVyY2tubFdq?=
 =?utf-8?B?QUt2NmluM0EyMXIrMDJuZEQxTDNWR1BRdGVtcVVFcDEycWdPa3lKc1k3cmRy?=
 =?utf-8?B?S0lWNkpXejhjTWtycUM3ZktFWjFMQUpQNkVwK3FyR0lyVGRXR3VTR1lTenZo?=
 =?utf-8?B?MFUydHA5VGZPN2xxYlh4N1JYaUMza2dzenJiNGtGZkZ3eUo5bWFBREJxVk04?=
 =?utf-8?B?d0RRQWQ1eVZPUXM5b0N5TXRNZ1ByaUV0OFdrbTlaNVlpNURsK0NlcDFTeElO?=
 =?utf-8?B?cHVzN05XVUlWTXB5a05QUTk1b1pOUEJFak0ySmwyZERLa1FFejkvaHhMclhE?=
 =?utf-8?B?c1V5bFpJMUs4ZFZ3ekhrV0pvbG9WQ0p3MjZjU0UwSHhNUDM3UTlNdHdsUDJT?=
 =?utf-8?B?b0xHRER5U2ptQ3dzWUhOWnFnRHM2TnQ2dlg1VktiR25aVHB0d1JSamJSMEh5?=
 =?utf-8?B?L3ZLbHBIbjBya3lZam9Bd053NHBuRlB5RUFLc2tIK2ptSFJ4TGIzSUtKdEpR?=
 =?utf-8?B?UExCaTZyUUw3REN2amxMWCs3Z2xrYzlTTFdjZGRHL0RtdmhWcTVDdGtsTTRp?=
 =?utf-8?B?T05QZmRxeUltWEcrc3RKcnI2OERUNHNKT0dDUVFhb3FsL1MrdTh3S2dsSjhK?=
 =?utf-8?B?OW82NXBZVjk0WVNsdnlJa1lJTDhNLzdCOGR4ZXkrQkExUTFsbUIzamVaSTk0?=
 =?utf-8?B?a1hVLzdzTnBmei9QbHBhZTlGbjFsYlY3ZXgxK2F4alh4ZXN2czhRMzFaRVlr?=
 =?utf-8?B?c3diUVBCSjAyc1kzUlh5V3dveDk2RndTbFZRdEZhZndjZzNPYk45a0NtbDZZ?=
 =?utf-8?B?UHBwbStWdjMwNEliekdOdzhFbjJNYnBhZVB2cHJWU3dCU21URnNqK2VvdnF2?=
 =?utf-8?B?Q3VGL0RGU1J2RlkrSkEyU2J4UHpIaVpSVm9ReVlzcVlNWTl5TndhcmJpaFln?=
 =?utf-8?B?amRmYW1JREUyWitkREgwZ2JQdGFLR2xjNkJMVVIrRlhRSE55dEN3QW1hd1Zi?=
 =?utf-8?B?VkhmWGcrdDRsSUM0c3g4UVZlejhEVGxJRW5JZzJDQnEvektaYUtDWlNVeU94?=
 =?utf-8?B?ZVk0Nlp3RHFreUNUTXd5LzN2WHFtUFZxRmI5REFsRThNeUU4ejl3K2VoNGY4?=
 =?utf-8?B?MEJUWC85OTB3QUt4eFFHaGpzYm1VenluYS9laHNiQVRqcHFxeVEzdlowZnpJ?=
 =?utf-8?B?Z1V2WUsxRGk4UmNkUExmb2tzU1EzWFhUSHd1NGp5dFcydXNYSVMxSkJCUTVy?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a86149b7-fd75-461e-959a-08da8f6d1ebd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 18:33:25.8951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwhZ1KRSiwosnmPrd60MZPhEhg9A9b6ecP/RnjPN6CfcrufaCKli0ocbF252NW87p1RZAfLF0wJR8nPYrXeDXxDsobNKRNFbCxNhcxHBPsM=
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

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_plane_helper_test.c | 466 ++++++++++--------
 1 file changed, 268 insertions(+), 198 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index 0bbd42d2d37b..01b76f1d93f4 100644
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
+static void drm_check_plane_state(struct kunit *test)
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
 
-static void igt_check_plane_state(struct kunit *test)
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

