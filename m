Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D379589C7B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 15:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33A712A332;
	Thu,  4 Aug 2022 13:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A028B0FE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 13:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659619155; x=1691155155;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=85vabZuhDZS56W5PwPnWvQ2q+QdNV+dF0TGfnLoqKuY=;
 b=Shj6P57ZhZxU1aXGE7RpYSD5y2XYsKSGPY144e9qQIPYJyUcuYx+69eh
 ICPRMPYuD8mCQP/N5gIjM/wos5mzAcOUa8qBcHju/6OINXij9nPKoxpW4
 7WWTticylEm9uGNLu4lGLS7U5fjdU/+3885hVdslNaR9RRfVBIwl0M8oK
 +MZvRrOCmGpiUn5eekl+jmObubXFCe+IF7L93rjFAQTsgWWDNl9ycVEUN
 MKll0o2uqq+k0H2dmQr7NkrVZ1j/HNCpUYmaZEUkaASi4ExCNlBlqMFuP
 TzThAaC7UsQ9c66+QQD3IrUSUtEdSH4Xxj8X3LFSQvJc0pCSCwvRgNApn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="289940512"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="289940512"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 06:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="671262068"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2022 06:19:14 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 06:19:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 06:19:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 4 Aug 2022 06:19:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 4 Aug 2022 06:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2XRiaaWd16fm1dXzLxcev6TbehUDsc8UX9UgI+ywPAOJ7JSIhye3KI8P2g0VeThhpAhXDxoyw0jqcFgFH2iwouYQhD2t+cRjSlzW0j33/GCoSZMXK/ohTYpKRkX1UoF8dcOXpr0ki1Zru+w0e+g70AQhqjsEPL0VgkcNWj5zvoO5/kLK3qktkB5bQq/RkRvygGTvWGwUic1eh4Ld4wfW0E+OlLb72ke0KVp4IegRqYEduubmmE4bKz2n4WUdBceS0+xF9AyKjLNsa2oRTYNiCeDLTSNuHeC+TiGH5kjIVJ0MrxzxYxmvDAI46tuN30+MDc9+wNwKDd7UI9QejCofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0MlK+QW6QsvmbLjV+H8vnJFP5dhAL+Z2Cdisjjt5V0=;
 b=jJNWqHt5WqD32MPsmh7T/cYGaUW08mZHBpKUdmFWYm8ztBd/gsxFa3xKwxwNPmqALQRQdV1+uCawuEfHH1GUz74Iyda+nvooXbaHEXl6469oukdSVmqB03S2N5Dh1Rlkyw1Ou5P427ZA5k9hmMEs64/TR3Y07fdDjXUMQbZZWfeNmIGB3pHyElZwFCXmiDqhpR8VpzD4iBX0CqyrL7eapP4wFWbDYxlWjtXZ8ZyRWxMQkwA+q8HGhbNNJ1ZTZbEvcoAZwGafA77KS0F8d0mG5NJVAlY857lgWW5PgjxEuRgXumUiYUQwMqCtD+DtcNqsInGXOC+w2WOPmMW5DVUgQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Thu, 4 Aug 2022 13:19:05 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%7]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 13:19:05 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/cmdline-parser: Merge negative tests
Date: Thu, 4 Aug 2022 15:17:03 +0200
Message-ID: <20220804131704.97083-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4311f225-f147-4d5b-d4bd-08da761be807
X-MS-TrafficTypeDiagnostic: MW4PR11MB5934:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6I3jzeVFezEaxCRWxeiPcUymBIIZPmB4kBgkVPDJfyUc/a/+yKoDHDqm+8HX5r3xhugKklx404cGiMCIQFhTfPimH80uck0RS1ueYy/Xkeu6YNrtGMMPG2xy0XoxbwOP0FFkOUGYcEYHqXdPfPO3jhSRUShrqiZVtDE7pgYh+HgKx4O3+or3HTAtrlskJ7KH3NHV9bEMdIzKKjePSQ1j7GJl4R1DMIr4O0ZFBj3IDrPrED50phpCPpgjApFjretqVK250SPbF7FPMan3XXHRr65IiJBIHJZab3jlQZSEMEAlopt72EBUhCqDfqzAmPlvr6kkdqyQEVjPRD21TvqD/ypK0r77/B387qSgRibVKX0NwNF74y/REvWJC765TPEmNbG/9Wpd0U4b/l2fvhN3U2x0xJwvp9SbxU653Qm7ZEbkeUMmWRCD9QRYVyAtu7+9N68CXJ/lnHqcrHjtdTFvc//LZY3/iFTTTOFduUNBQGyEFVXqeSzPVCf6qYU+Juvy6gyiio0/Zj+v3b8edFIZAowp1k1EXgwXfrTDhgRlVCaHXWEmUr5cYocJj3DMX3I1j2Tfz3GXSLpPZ+jPBXm7yqkjo1oEPP+/YuXzyZZZl3e2q3m/9RJ/e2reG5NFrDp9m200ZbaphxgsCxAn5FhVYTBH0RUTJSmOlj7bXlcw4ezJUjV0lZsDcRD4//pxZVzEsVWEKEM19WI4yhiUB9IdICZxlGbZFX2kC0vLv3b8mGCp+6e7t4lerTwDlZ4CfT5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(136003)(39860400002)(396003)(6506007)(2906002)(82960400001)(107886003)(1076003)(316002)(54906003)(26005)(6512007)(38100700002)(36756003)(6916009)(2616005)(8936002)(86362001)(5660300002)(30864003)(66556008)(66946007)(41300700001)(66476007)(4326008)(8676002)(186003)(83380400001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FDa0pNOWdZWGIrQjAvUTdDMnRvNTVEWG4yTEFubFgxMG0zVGlhRHpyUU80?=
 =?utf-8?B?Zld6WkNSQ2dCWkkxeWc5ajFIYWtYdHExWTBKTVJCSzdrMUd2RDZxT2txSEcz?=
 =?utf-8?B?UTdrQ1dvTzRNUFNoK1gwRUd2OXcxaVRmbEtkcFYwVitGUThsZjZ6VDY1UzdX?=
 =?utf-8?B?VWdwN0ZleERtMlMzenpBRjlVTVJFbTNpNEhHZGJEZ1VWWW84NnBZdDAvSTB3?=
 =?utf-8?B?U1piT0ExNStVNTFmaUp2L3FwenhDRzN5SUhIdzMyRkFUN1dhZ1I2T0FKaFpk?=
 =?utf-8?B?aE9kWjRPa0hleVNadEk4UVczNmQybTg0ZDRzN3E1MTd6dElxWmp4RitabTAx?=
 =?utf-8?B?Ky8zL3lyaDRlQmxZcU8vWTFKRkVVN3ZtT2ZkdkRwcVhiSXJYeDFsMzVDNmk1?=
 =?utf-8?B?SkxrckxDRW5Dc04vNEJsdlMveWJVUUtyODYrY0hVajJFY2pseUx4dUt6R3ZV?=
 =?utf-8?B?Vm8vU0RWWThhamhCRWNuUzluUnVRMjQ3aWdIZVVwZWNhdTgrSTcxcjB1NGxx?=
 =?utf-8?B?TDJCeWMwcjU0VUxvV0dCdGZyQnpFeVpSaktjc2NnakVnUVBBc1BXeHB0Z1Rn?=
 =?utf-8?B?TS9mQzgzVWw2QUZCcHB5MmN5VjZ3QVIvQWVnSGFIbVhWMHhrNUU5MEpldjdQ?=
 =?utf-8?B?clpPMzg5aWRvM2JpaFk2ZEpuV0F1OW8vZDgvN1NwU3lQRXVGbGs3QkNjanRu?=
 =?utf-8?B?elFVeU1UbVNEbld0ZFBMWUVmNEJiTElJQjR5V25kcDN4V2V4aVR0N1ZXb29s?=
 =?utf-8?B?VkFOc2k4MXRuQ0FDUGNzMUhJYWhjOXhPZENFS200dTN3dkd1UlYvUFJDSGhq?=
 =?utf-8?B?VytmYm5UVG5rUXQrd0x2MURIZFFDRkpxa0xnSUJWb04zaXhoS2RMTGhDZlpV?=
 =?utf-8?B?SDUzejhCNytTS2RGdDVEK1pPN0NrWDZHOEFIRi9UeHcrQy9seUlURlZ1M1Ra?=
 =?utf-8?B?R2kwNzVMNGJ1NDFhR3BkSG91SmRrZUwvR2w0cnd1TjA3cWxtVzRLY0N4U2F4?=
 =?utf-8?B?NldxdkYvelJ5TEpZZVhjMG9UTXRKaThtOGNpbWJKNFhoM1ZVdzlkc2NZTElW?=
 =?utf-8?B?a202Q3J1THRmWXNkSlltKzJCUTY3Ym1MNEo5T0crdzFlOEIzQ1I2TVkrNHVw?=
 =?utf-8?B?WWVxdm91VnlDbXVrWG9NMk00eG8vK05mL25vSG1wU0RqUk9uWU5KKyswRWNl?=
 =?utf-8?B?QS9HWDdpZkRMS3JFOEE4UVhKUzJJUmJ5Qnc0SnFpdko4TXVSbGl2S2xlZmFy?=
 =?utf-8?B?VHRXQldHKytWSDFUcmpydlRzYWNNM3Z5VDNKT3FGeXFJbEhvb083aGR1WlZU?=
 =?utf-8?B?d3FUZnpEQlM2eTM0a3loYjBnRjAvTDZOVVROM2pRckVkSEk3eFBsbVowZURt?=
 =?utf-8?B?UG5nZVYzUDZxY2hFRHFnMERSaU5zQzM3TEJ1VjlTMmx3MGM3MkFHRnRsSGlp?=
 =?utf-8?B?SzM0STQ3a3NNK2ZLMkNmMStkdjAwbUFMVUlnTndrbHltTWJnNFpHZzg5NGdQ?=
 =?utf-8?B?MGwvbE1WTlBBMHhoUjk1c0tybWtJaEVQVnd6elFCYUU1SDgzcCtlRFd6ME94?=
 =?utf-8?B?M0V2RkdyRWo4aEMrdDNwbnJaQ0FnK0V0eFBwWENWclI2Rko2aXhuL3lqWVlh?=
 =?utf-8?B?Vy9hc0N6S3B0U0ExY2FhdjBZQ0t4UEN4cWdZTmpYSXJLWENQYlJIMFdyaGcx?=
 =?utf-8?B?cWZ4Vm9NOC9wY1dpWlBSNEJ3akpwcVk2cGJrZGpRanFVZkFmZ3V0amxIODRw?=
 =?utf-8?B?WFBzNXlPdmY4TUxFWUl1dEpjVEtLdVV1Z1hOSjRlclYvd3JMZG9MbU53Q2xo?=
 =?utf-8?B?RWlCSDVJT2R0U2RiSjhobXV4cndpMXJoODEzQXNLbXRoV2VNZUR1clN3MFZy?=
 =?utf-8?B?ZTROT3FMQktwazgvSGYyM0grUlZiQTZpc1p6TGZMRFhZK0kxcTJzeGhJWHlY?=
 =?utf-8?B?OXFvY1RaYm44ZVowNnFZVXlFdi83MXpCR1ROWXRSendDZ0ZpYjhiYVZOeE1B?=
 =?utf-8?B?c3NCbzhiNU56cWxsZ2xtc3RBMEFSRUFkRUdlRXNrMW1LRUlJQi9NWU56a1g5?=
 =?utf-8?B?a21RYnhTb2VxcS80c2ljY3BrdngyKytZYkJXNzIwNE1xZmc3RUhVVEYvanZr?=
 =?utf-8?B?TURXK0J2M2xSdWwzZ3dxdVlLZzJWTUVxQ2dTSWpzeVU1cGc5bUZVbks0TDB2?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4311f225-f147-4d5b-d4bd-08da761be807
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 13:19:05.7555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46BZPUPuFaA5BTey8Fk440qYoz9rsg6qkmgUPvyX4bYagzZlQcWZl4jYiFrIAq+KxNJrSQHq/n5HnNVXLGw/RwSazYYz6WepeYHmaUnj5HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
 Arthur Grillo <arthur.grillo@usp.br>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Negative tests can be expressed as a single parameterized test case,
which highlights that we're following the same test logic (passing
negative cmdline and expecting drm_mode_parse_command_line_for_connector
to fail), which improves readability.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 293 ++++++------------
 1 file changed, 103 insertions(+), 190 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 59b29cdfdd35..058808faaf4a 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -109,24 +109,6 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
 }
 
-static void drm_cmdline_test_margin_only(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "m";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_interlace_only(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "i";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -149,42 +131,6 @@ static void drm_cmdline_test_res(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_missing_x(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "x480";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_missing_y(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "1024x";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_bad_y(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "1024xtest";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_missing_y_bpp(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "1024x-24";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_vesa(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -274,15 +220,6 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_bad_bpp(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480-test";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_refresh(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -306,15 +243,6 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_bad_refresh(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480@refresh";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -411,15 +339,6 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
 }
 
-static void drm_cmdline_test_res_bpp_refresh_force_on_off(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60de";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -563,24 +482,6 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_res_invalid_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480f";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_res_bpp_wrong_place_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480e-24";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_name(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -608,42 +509,6 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.bpp, 24);
 }
 
-static void drm_cmdline_test_name_bpp_refresh(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC-24@60";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_name_refresh(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC@60";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_name_refresh_wrong_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC@60m";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_name_refresh_invalid_mode(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "NTSC@60f";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_name_option(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -762,33 +627,6 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_rotate_multiple(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,rotate=0,rotate=90";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_rotate_invalid_val(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,rotate=42";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
-static void drm_cmdline_test_rotate_truncated(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,rotate=";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_hmirror(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -885,15 +723,6 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
-static void drm_cmdline_test_invalid_option(struct kunit *test)
-{
-	struct drm_cmdline_mode mode = { };
-	const char *cmdline = "720x480,test=42";
-
-	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
-									   &no_connector, &mode));
-}
-
 static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
@@ -1006,64 +835,148 @@ static void drm_cmdline_test_panel_orientation(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
 }
 
+struct drm_cmdline_negative_test {
+	const char *name;
+	const char *cmdline;
+};
+
+static void drm_cmdline_test_negative(struct kunit *test)
+{
+	const struct drm_cmdline_negative_test *params = test->param_value;
+	struct drm_cmdline_mode mode = { };
+
+	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
+									   &no_connector,
+									   &mode));
+}
+
+static const struct drm_cmdline_negative_test drm_cmdline_negative_tests[] = {
+	{
+		.name = "margin_only",
+		.cmdline = "m",
+	},
+	{
+		.name = "interlace_only",
+		.cmdline = "i",
+	},
+	{
+		.name = "res_missing_x",
+		.cmdline = "x480",
+	},
+	{
+		.name = "res_missing_y",
+		.cmdline = "1024x",
+	},
+	{
+		.name = "res_bad_y",
+		.cmdline = "1024xtest",
+	},
+	{
+		.name = "res_missing_y_bpp",
+		.cmdline = "1024x-24",
+	},
+	{
+		.name = "res_bad_bpp",
+		.cmdline = "720x480-test",
+	},
+	{
+		.name = "res_bad_refresh",
+		.cmdline = "720x480@refresh",
+	},
+	{
+		.name = "res_bpp_refresh_force_on_off",
+		.cmdline = "720x480-24@60de",
+	},
+	{
+		.name = "res_invalid_mode",
+		.cmdline = "720x480f",
+	},
+	{
+		.name = "res_bpp_wrong_place_mode",
+		.cmdline = "720x480e-24",
+	},
+	{
+		.name = "name_bpp_refresh",
+		.cmdline = "NTSC-24@60",
+	},
+	{
+		.name = "name_refresh",
+		.cmdline = "NTSC@60",
+	},
+	{
+		.name = "name_refresh_wrong_mode",
+		.cmdline = "NTSC@60m",
+	},
+	{
+		.name = "name_refresh_invalid_mode",
+		.cmdline = "NTSC@60f",
+	},
+	{
+		.name = "rotate_multiple",
+		.cmdline = "720x480,rotate=0,rotate=90",
+	},
+	{
+		.name = "rotate_invalid_val",
+		.cmdline = "720x480,rotate=42",
+	},
+	{
+		.name = "rotate_truncated",
+		.cmdline = "720x480,rotate=",
+	},
+	{
+		.name = "invalid_option",
+		.cmdline = "720x480,test=42",
+	},
+};
+
+static void drm_cmdline_negative_desc(const struct drm_cmdline_negative_test *t,
+				      char *desc)
+{
+	sprintf(desc, "%s", t->name);
+}
+
+KUNIT_ARRAY_PARAM(drm_cmdline_negative, drm_cmdline_negative_tests, drm_cmdline_negative_desc);
+
 static struct kunit_case drm_cmdline_parser_tests[] = {
 	KUNIT_CASE(drm_cmdline_test_force_d_only),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_dvi),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_hdmi),
 	KUNIT_CASE(drm_cmdline_test_force_D_only_not_digital),
 	KUNIT_CASE(drm_cmdline_test_force_e_only),
-	KUNIT_CASE(drm_cmdline_test_margin_only),
-	KUNIT_CASE(drm_cmdline_test_interlace_only),
 	KUNIT_CASE(drm_cmdline_test_res),
-	KUNIT_CASE(drm_cmdline_test_res_missing_x),
-	KUNIT_CASE(drm_cmdline_test_res_missing_y),
-	KUNIT_CASE(drm_cmdline_test_res_bad_y),
-	KUNIT_CASE(drm_cmdline_test_res_missing_y_bpp),
 	KUNIT_CASE(drm_cmdline_test_res_vesa),
 	KUNIT_CASE(drm_cmdline_test_res_vesa_rblank),
 	KUNIT_CASE(drm_cmdline_test_res_rblank),
 	KUNIT_CASE(drm_cmdline_test_res_bpp),
-	KUNIT_CASE(drm_cmdline_test_res_bad_bpp),
 	KUNIT_CASE(drm_cmdline_test_res_refresh),
-	KUNIT_CASE(drm_cmdline_test_res_bad_refresh),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_margins),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_off),
-	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_off),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_analog),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_digital),
 	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced_margins_force_on),
 	KUNIT_CASE(drm_cmdline_test_res_margins_force_on),
 	KUNIT_CASE(drm_cmdline_test_res_vesa_margins),
-	KUNIT_CASE(drm_cmdline_test_res_invalid_mode),
-	KUNIT_CASE(drm_cmdline_test_res_bpp_wrong_place_mode),
 	KUNIT_CASE(drm_cmdline_test_name),
 	KUNIT_CASE(drm_cmdline_test_name_bpp),
-	KUNIT_CASE(drm_cmdline_test_name_refresh),
-	KUNIT_CASE(drm_cmdline_test_name_bpp_refresh),
-	KUNIT_CASE(drm_cmdline_test_name_refresh_wrong_mode),
-	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),
 	KUNIT_CASE(drm_cmdline_test_name_option),
 	KUNIT_CASE(drm_cmdline_test_name_bpp_option),
 	KUNIT_CASE(drm_cmdline_test_rotate_0),
 	KUNIT_CASE(drm_cmdline_test_rotate_90),
 	KUNIT_CASE(drm_cmdline_test_rotate_180),
 	KUNIT_CASE(drm_cmdline_test_rotate_270),
-	KUNIT_CASE(drm_cmdline_test_rotate_multiple),
-	KUNIT_CASE(drm_cmdline_test_rotate_invalid_val),
-	KUNIT_CASE(drm_cmdline_test_rotate_truncated),
 	KUNIT_CASE(drm_cmdline_test_hmirror),
 	KUNIT_CASE(drm_cmdline_test_vmirror),
 	KUNIT_CASE(drm_cmdline_test_margin_options),
 	KUNIT_CASE(drm_cmdline_test_multiple_options),
-	KUNIT_CASE(drm_cmdline_test_invalid_option),
 	KUNIT_CASE(drm_cmdline_test_bpp_extra_and_option),
 	KUNIT_CASE(drm_cmdline_test_extra_and_option),
 	KUNIT_CASE(drm_cmdline_test_freestanding_options),
 	KUNIT_CASE(drm_cmdline_test_freestanding_force_e_and_options),
 	KUNIT_CASE(drm_cmdline_test_panel_orientation),
+	KUNIT_CASE_PARAM(drm_cmdline_test_negative, drm_cmdline_negative_gen_params),
 	{}
 };
 
-- 
2.37.1

