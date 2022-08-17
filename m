Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E05978C5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 23:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4BA8B621;
	Wed, 17 Aug 2022 21:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7B8A9404
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 21:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660770788; x=1692306788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/F9IcLizF/6ezzRh5ZLWmhQKPSb6tC+lgCgTLKoyiNU=;
 b=TqbiFC2rLavnPDyBMjOcnYLWIlCuE//DwYt+N8ejjFMFPtideySp5Tb/
 y4mdHovOZV7Oxdc+GlwP2pSmowD4PRlnMu3dUB7u4LWz4QHD9a7OvF3Mn
 OUwk/CBXgGsWb7SpuedoIHA5JLqSo81iXwgf/jiQAcyUlZFpxYhD72a7b
 S0hklXgLM3PNEi4T1/kYRtMT27uAJTs2ZQIK72cSA0BWPUj8ywLCB5r6M
 whlmssogQw26fP2fNkuG0Fod/qs+26ibODCwU/sqQNqTNvBUVghQpLqla
 qrZn3KSH10Y+ogEhJMMPSGf2ijs9ilxmltotQGhuH406lOneCFyr2DliN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="272371520"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="272371520"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 14:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="696927753"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2022 14:13:07 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 14:13:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 14:13:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 14:13:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 14:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXlWWv/AVA0tt9zjXdFGcbx7dvvACxPg4/wZTzcATaJUoXML93Qj7SZRVDkn50X5CQOLKA1hssd+65wCt8HTVZ4RsyfvZ2JheBrAZjyZix40c4eby0XCZEL2Gg8q2HpW4Pzfq7cfPR7eAJTMiWg6UnY0ZvCjrRR2IKk2OOn5clJhUg3K3EjYW/nOoWAWPO+o56GxuV+FYBhCieNs7NndygumLSjuTGA07d5oFZO4IrAJ1fhHaOVWHym+hypWLg05OJTZVBWqMq/+Ue2DVQoPi8+pXEawpHMRTlXEd6nFjNAG0yh4mE4Wo8hT8FvcIdSCYtvqckLrLIroW48yznznFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hw3Vm2wF49YQ6DKBrR3BJEJkA5oYLtSXIyURochmpuQ=;
 b=CnkTwT9riXrLkl6iLRQFJTpfZeX5oryYqGJjc4QkoDDTvt7LEZlHZOehBzzJ1qtJuXCdaoIVV+XTP4bafXvR9jnBEroJma0hn+vztMceyj1E5g4mb5O5KJxXmYH9OeV1i4QwqZg6mML/bBMGytCy5I6cREQtr30mj0VG6SD+oYPuVRjEYeNlTsnYwRbqfJAKgsHBZqqOG+iMaM2G8KFP+Uvuv0gXuLCE7ir9KqZypsEaIyRs290aH19ej6WRUhALtHBt5m+ZgN9WdmXT54Lk7NOXDy1/4q9HKdmq38lf71P90qpMogcC7Mumbo9/0FwgZzSdXpzonVOTINGEr+ae3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 21:13:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 21:13:04 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/2] drm/cmdline-parser: Use assert when needed
Date: Wed, 17 Aug 2022 23:12:36 +0200
Message-ID: <20220817211236.252091-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817211236.252091-1-michal.winiarski@intel.com>
References: <20220817211236.252091-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0668.eurprd06.prod.outlook.com
 (2603:10a6:20b:49c::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d527656b-233d-4172-e8b8-08da80954650
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlU1ZQ/zN3CByXxtVlR+Qw4kKbxk3goYmpQarMtj/A8JAlN4o/byXHOzYfgrWAf/v5jWbmzKIkuBEvinF3Rak3Y6Br3gmeBGPcQRTROAd3vE89fdk1qblIotix7mrHCuojZisrDPcSXjD4d5SykZgW1VXxbxaLI454sFd57Jl6o9rrCBJH81dVjCDxksBzlw+Ya6pt7IqdosU8Qc0RgV5pck7f26yhKYwCA0vHbId5QIxX7Qpx2UkroT/iMFY993xyRVY5ZhtHF9yphV13JNPl5ILy76q6ybj/GNoOdUzoq6ESEHHtAyDWPke4I6Yu33knb3SexuyDcY8eAjqbQ0GgMxn3NGd67RG9ZNIujS5XNtI3XowbmhLTGKlkMmvSQI7Fjew6BVO+LOf0lLroY0Mp3EvDL6i5Ae1cTvKR+FoxPkVpflcq1H4UYjqjKZUUNdsoEzinb5MplUk4secIKGt5snw6q6uNXtTotbsCzL42sA/8vfYF0dwSTmFPK9nRaal9s5/vxZEL5zlAVM2Haw7ozesLZ1u7Q3HGM1qbdF3Wu6BBMXi3d2FxPoCWP6PWoCde+YW46pVtuDKjsUNA/8KfwevffKidP1+rKjCgCZWcO7kEKTQ74fhQ3Av2DVggB7a9ktfEHrmwcPgm86RSuU8WT4hVs+/cl6hafhMlt6/w0+6cuut9Zx+ZSWcwZmhLAqjPrJhvEGoWi+2silAEWKLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(346002)(136003)(366004)(5660300002)(1076003)(2906002)(8936002)(86362001)(26005)(30864003)(6506007)(66476007)(41300700001)(186003)(6666004)(2616005)(82960400001)(6512007)(6916009)(478600001)(83380400001)(38100700002)(316002)(107886003)(4326008)(8676002)(66556008)(54906003)(6486002)(36756003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUh6V3ZEdStvbHh6RGxNdXVLRGx1Um5VNnlneFdrNXUzaUNNdUQrN0hRRmM2?=
 =?utf-8?B?ZytwNUxlWHBLTXRBWUh5ZlBSK3VqUHViOVhGdHl0YThUdGMrYUJUeXpUL0NW?=
 =?utf-8?B?SnE0djYvYXFMOGlvOWlhUmZTcS9Tc2ZncDc5aGs5ZmFOdkh1Zk1ZUDlZN1NC?=
 =?utf-8?B?SnVKR2I2TjNrSjlSMlJQUVptdFJqdHNobW9FYzVuSjAxKzJUNCs3QjdiYnZx?=
 =?utf-8?B?RXFVU2ZKYlp1ZFUvbjlMcjNMVW1FQngzTTFaME03L1pDQ0YvWEhZby9lWUNI?=
 =?utf-8?B?M1RHeWdHd24yMkJaMFluMFAwU3dsRnpiVnRZR0NOdmhjN29TVEV3b2pkWXFD?=
 =?utf-8?B?Y3o2TmNhS3c4TERHbjFtMkNtUVhoVmdlWnVBbmh6bm9aSTNoa2dBc0JRR0Ju?=
 =?utf-8?B?eDRsbmU4WCt3bDU4RWpYbDZDNlJPMXBnZE80QnBnRldVY3Ivb2pueFpJYUdy?=
 =?utf-8?B?SDZ6QkxOUnBKeHRTYTJtdWNLSnN3VlBDSXVvbTZaV2FpUS9Ec213NDg0cEk3?=
 =?utf-8?B?UGdERi9YTlZBWGZzc1ZERXBscndGM0ZsTjY2VDhHQlp6dUFRM3F4ckVqNzEy?=
 =?utf-8?B?aHZFajkxWGd6VHBlWG1kSGUza3RTazFmOTR0OWROV3l2YVY1TXVEcnJ0b0Mx?=
 =?utf-8?B?UDVIODEyQVB6dGJTeDRjV1FMbVorZnVySlB2aVNPZlQ0aWkzWENWcnZEQnFi?=
 =?utf-8?B?bjkyckVwNzlFNllzMFNQRjVpaUpaN3NUYVNVZnVHSzA2VldoemlDTUtRclpq?=
 =?utf-8?B?ZHVaSUwxMDBYQjhRSWZySzJkeEhPdFZxN0s5ckQrMG9xWW9uS1J1dlhGMlpQ?=
 =?utf-8?B?cHZYTnAybzg2eE9yUDFmbitpOHd4dGZwOG40TlAwL3dxYm9FQy9pS2NOK05n?=
 =?utf-8?B?UGI4YWhyVTRDa0RqL2lJS29kSFh0dUNsOWsxNHIzNUdCdkFHaVpBQkk3MnNS?=
 =?utf-8?B?S0JuL3NHamVzQ3g2Y3ROc3prOXVoQnJUYmpja2k5NkNlTEYxV1JlaUN5dTFr?=
 =?utf-8?B?SXVvcERmZ2llR3VCc2hFNGJsZWErdFo5Q3lTbUhFcmNZMkRXK1pVcGFYOEJR?=
 =?utf-8?B?eHFIeDBCSUN3clI3UFRRMUx0VDFRRVN5NHlFRVhuUHV3bC9SMGV0Q2lIOGRy?=
 =?utf-8?B?Z0E3TEdtTkJ3WUFEV2UzYUpubmFvNVozeU9XNytCRDZ2WG1XdWMrQ05LY0Yw?=
 =?utf-8?B?K05PYnNNazRQL3dJT2RrYXdzYlF1N01rSFRJZ0pWNGtJVCtqdXFLWnR3M0JG?=
 =?utf-8?B?UkdVZVN0R2NWNFlBVXZYaW5XZ05sVTRxT2R1dVVwbkNUbk9HUmRXRUpCaW5u?=
 =?utf-8?B?c3FqMVhiM1FUd1hEV2h1K0piY0d3SVk0L2dtL1lFYkJzQ1VMRldBcUFPTlE3?=
 =?utf-8?B?ZDVNRVo0VFRwRThoR0NXQXA4VFJFbUZybmx4ZmFBUzNCS3ZQME5zbERTWHFT?=
 =?utf-8?B?R09JWVcxUHAvZGNHQjBiN3F2elc3TUhhZUs1YWdYRko4OXpkc1hVU2wyWUlq?=
 =?utf-8?B?alBLRndwNTJncjJpOXNmeHFjclZNL25JbEZWNkRhUjhydGxhbzVhM1hSWDlG?=
 =?utf-8?B?NTMyZlZyRmxkZ0xWR0JOT1hiSDhmQ2I4SWF5TUdsdi9iU1lhQ0dlSXpxWmRK?=
 =?utf-8?B?blZmZ0pMMVI4dkE0b1FoOWp6cmxrbWtJVXpDUS9KeVZWQXpiNlJjM3BoVnpx?=
 =?utf-8?B?YlJOcm5HdTMyUkhscXhsTXBhUWpMbDhlekM0dFplU2N5enpBWGFENEJyaGFH?=
 =?utf-8?B?dkFOdGI2RDVtZXdwTWRJbFB6K1Y3VllnSnFMZXBjK0hWZTRZMEJnR1Q2b25E?=
 =?utf-8?B?RXA0SnpWNS9IdDJrMmlJMmMzeVB2Y29lcjlBeFlQSEV4UU9DanpXVGdLcldv?=
 =?utf-8?B?RFpFdWRXcGoxL0J1T1JFSE0zNnJQTFZGYkNMQTF1Z3U4ZHhhN0QvUlZmV2Rx?=
 =?utf-8?B?Ym52VmMxSi93Y3JFWldDUE8yUVVJa2JaMjhDdzNOYy82d1hibnJ4aHN0NlYw?=
 =?utf-8?B?OCt0enJNRmZrV3Q2YkQ1OUZHOXpqUGoxL1hObXNzZVFUWEhrZXRla21xZ0RV?=
 =?utf-8?B?b211VkUzT3FlcG02cis0d0lGTmxveWwxdWRGQ3RZSkVMeTlmTW05WXVSQ285?=
 =?utf-8?B?b3B1ZXJZR05pMnhVRTM1SWhVZG5qVjg3T3IzK3VPOUpxOXVlVjl4K3loZ3RD?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d527656b-233d-4172-e8b8-08da80954650
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 21:13:04.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bpc4RxSbLWgM9gozNak+iCTd1o2RHHyU8HesZvu4d2WDMn8lx+1VF5kok+wybIZl1F8Jm0xhk8zfIXYjXSz5jrzgAHZn7EazPjy9b7fN1CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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
 Daniel Latypov <dlatypov@google.com>, Javier
 Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expecting to observe a specific value, when the function responsible for
setting the value has failed will lead to extra noise in test output.
Use assert when the situation calls for it.
Also - very small tidying up around the changed areas (whitespace).

v2: Leave out the locals (drm_connector is huge) (lkp)

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 .../gpu/drm/tests/drm_cmdline_parser_test.c   | 80 +++++++++----------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 3a46c7d6f2aa..09b806e27506 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -16,7 +16,7 @@ static void drm_cmdline_test_force_e_only(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "e";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -34,7 +34,7 @@ static void drm_cmdline_test_force_D_only_not_digital(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -56,7 +56,7 @@ static void drm_cmdline_test_force_D_only_hdmi(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &connector_hdmi, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -78,7 +78,7 @@ static void drm_cmdline_test_force_D_only_dvi(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &connector_dvi, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -96,7 +96,7 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "d";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -114,7 +114,7 @@ static void drm_cmdline_test_res(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -136,7 +136,7 @@ static void drm_cmdline_test_res_vesa(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480M";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -158,7 +158,7 @@ static void drm_cmdline_test_res_vesa_rblank(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480MR";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -180,7 +180,7 @@ static void drm_cmdline_test_res_rblank(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480R";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -202,7 +202,7 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -225,7 +225,7 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480@60";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -248,7 +248,7 @@ static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24@60";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -272,7 +272,7 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24@60i";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -294,9 +294,9 @@ static void drm_cmdline_test_res_bpp_refresh_interlaced(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60m";
+	const char *cmdline = "720x480-24@60m";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -318,9 +318,9 @@ static void drm_cmdline_test_res_bpp_refresh_margins(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60d";
+	const char *cmdline = "720x480-24@60d";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -342,9 +342,9 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
 static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
 {
 	struct drm_cmdline_mode mode = { };
-	const char *cmdline =  "720x480-24@60e";
+	const char *cmdline = "720x480-24@60e";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -368,7 +368,7 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_analog(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24@60D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -395,7 +395,7 @@ static void drm_cmdline_test_res_bpp_refresh_force_on_digital(struct kunit *test
 	};
 	const char *cmdline = "720x480-24@60D";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -443,7 +443,7 @@ static void drm_cmdline_test_res_margins_force_on(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480me";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -465,7 +465,7 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480Mm";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -487,7 +487,7 @@ static void drm_cmdline_test_name(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -499,7 +499,7 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC-24";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
 
@@ -514,7 +514,7 @@ static void drm_cmdline_test_name_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
@@ -526,7 +526,7 @@ static void drm_cmdline_test_name_bpp_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "NTSC-24,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_STREQ(test, mode.name, "NTSC");
@@ -540,7 +540,7 @@ static void drm_cmdline_test_rotate_0(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=0";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -563,7 +563,7 @@ static void drm_cmdline_test_rotate_90(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=90";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -586,7 +586,7 @@ static void drm_cmdline_test_rotate_180(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -609,7 +609,7 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=270";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -632,7 +632,7 @@ static void drm_cmdline_test_hmirror(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,reflect_x";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -655,7 +655,7 @@ static void drm_cmdline_test_vmirror(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,reflect_y";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -679,7 +679,7 @@ static void drm_cmdline_test_margin_options(struct kunit *test)
 	const char *cmdline =
 		"720x480,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -705,7 +705,7 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480,rotate=270,reflect_x";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -728,7 +728,7 @@ static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480-24e,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -752,7 +752,7 @@ static void drm_cmdline_test_extra_and_option(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "720x480e,rotate=180";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, 720);
@@ -774,7 +774,7 @@ static void drm_cmdline_test_freestanding_options(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -797,7 +797,7 @@ static void drm_cmdline_test_freestanding_force_e_and_options(struct kunit *test
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "e,margin_right=14,margin_left=24,margin_bottom=36,margin_top=42";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
@@ -820,7 +820,7 @@ static void drm_cmdline_test_panel_orientation(struct kunit *test)
 	struct drm_cmdline_mode mode = { };
 	const char *cmdline = "panel_orientation=upside_down";
 
-	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
+	KUNIT_ASSERT_TRUE(test, drm_mode_parse_command_line_for_connector(cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_FALSE(test, mode.specified);
 	KUNIT_EXPECT_FALSE(test, mode.refresh_specified);
-- 
2.37.2

