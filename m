Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C277982F370
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED2910E06C;
	Tue, 16 Jan 2024 17:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333A10E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705427198; x=1736963198;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=SpKLAP+9YP0g4x+2jmoMG/PyzXoNpOPMbh+sAPKTgxg=;
 b=CVWOdHbrFYUGCLBHbSytBhwzKdvPcYBjtDhgW6SWmOoTXI8BBn7S/hhz
 kJFMxW76yLC38kQ5rG1zddiE5F6vLgNOWbqSuWan3O0hEn5vGckrFRMia
 W7P4HqNKTjXUYzwN1+2gAfGck+jvuBvsPfejdD8e8ovKSwz+VazyCFje8
 va6YdeoeJDx0QKBXe0NR4DmzAETlSQOKecftDwuCRjXheReBZqty4JgD/
 Wng54YkA6/TFyNmhsQFF4XIs2I67kJlQvLYYGw5qSlbtmns8b+DmuHX5S
 l/O10jHHw3t57t2dC6Tck2Be4n+LKr2jxWbdQAa1Au/ihTHGZSix5T8aM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="390388869"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="390388869"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="784207599"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="784207599"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 09:46:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 09:46:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 09:46:37 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 09:46:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 09:46:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+v24+cEEb0fClJgPV2akJ67FJrY4UF7iY++AEbtvq/pg5EYz/5ZVTu07hLHShendhIIm3Qe1pVqdW8C6qKLhzqKmOlhuDPf3HdMTcau/k9dlgYX5TQt6qOR+VLD5j9LLw6gcc/liC7isQ5JGUP4Hz0WupxjHXN48+2X7t4yNqB+uATAnzGBspF6cQ5hvAxFg3lKJ+/jYGa9HzoT28NWr50/RjTURVnlUqv9W5qrAQO3CuhhaQt/eCrTaTFPDRuUc8xDZwxkKxigQ9p68wn6uuCtJWfEw/POjt1VKQn84JEnyfgAHE/eR3H3KmUCwqmoOxdgJOEoCrt08m+GrSkjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5Xj8lGAzcl2eG/6TZBA/2kO37ybvrr4jdnUZji/lY8=;
 b=BCiOTAoYcH10/dc6vWn4RurPyE9KFpdsTfq7FF46gRlg+sH2egFaoGGHfv9cd8RL7NlecRlyvm1L5h3uLMDRA8Xjh3cxOuSyfITblEpnTgY8TzwEz5Q9I3UZjcYrmscrFMA4n/4UWuzaMOZDPhNBZ3tEth3pzwFZeWiNQKVY7l0ETDqt6e74JaBfbIbwuMg1ZvmV2ZbmeqxSqOnaXyx8UZ2F/PdAbHRb6X00Vf8Zw6K354Lq0U7sGfHmIBZMia47ZJELW/4AmNva5aQ0QbxdvC4GbWJglrKtW0NwfoYJXbWYWBFcRRycN8dkQgKcl1f/AiDT1HKh9RxxLdaIdjG3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.23; Tue, 16 Jan 2024 17:46:29 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 17:46:29 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/tests: mm: Call drm_mm_print in drm_test_mm_debug
Date: Tue, 16 Jan 2024 18:46:02 +0100
Message-ID: <20240116174602.1019512-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b68c35d-75bd-4005-90e1-08dc16bb11fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gIe55Q0wbrHidFugKwvxCXU8eKAbRdACO1H5ZIsXCjrBYbX1QvlMoEHeOe1dWY2PrX+Q2rjMkzUqvXqRgUAozESyHQUqq4iDLyzAgmR0pYyy1nFk07k21QxbudCHUMTL0czzts78FaDycA5NJtcn5Ei+GUN456gJXyVdRCihDnorUDdLzsLp5lI8ouOtbtVklSJT8hohT7OMicm9Hgcapqg8TyUBrSUREktj/LOJ4W1g68jwarCCa3CCWs3Ptg1eSVLzzgL3XvCFiQahlu4XrkAvUZTZjzgQg1Yh+Ux2nxutSQqDItIrvHTZxdsUuePcCtxnCt1E/aGs8VNlWOBouV8w1zLK75kWW4/cIAd8FE6v9Jq8jfBTUlq+ncHB9kWpDcf/xODtRMBZp/tFiWL3WQw3jng2xZV+Q9+KwfipEgbZ086ZGJJhm9noyI6k5TJ7v6QSFgq4r3YHr3Cjy3xVg8z0TU6y6tzJY9jGtxSuffJ5FYhBLq4oMX7d+hFhK5k2OWEBEBwH3KVmhiC0MGjq1qqBL2d5jfGT27vrp05hMwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82960400001)(38100700002)(36756003)(86362001)(26005)(1076003)(83380400001)(41300700001)(478600001)(6512007)(66556008)(66946007)(316002)(66476007)(6666004)(2616005)(54906003)(6486002)(6506007)(2906002)(7416002)(5660300002)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS9lUm9hdEx6RVovTGp4a20yNldOY0ZhTklNWHk4VXcyQ3h5S1Q2SlFoVytq?=
 =?utf-8?B?QjdrY1VKZWUrOUgxb1VWTThzQ0xXN2tRRFhraU8reWtHR2o1eDJDeU5ZemxQ?=
 =?utf-8?B?elNnMmFpKzhSMzNZYnQzK3lRRHdkY3U2NFdFNEdFTUFZRzA0UWI1N2M2SWN0?=
 =?utf-8?B?L3JYeDZvYUYzZngraENMRlRvOEMwMDNqL2hJL2g4QmswRVFpeGV3YWw4UTRn?=
 =?utf-8?B?MWlaL2JDb0puR1BPd3FmQ25PYmxFRDZEbU1QTDgrR1hGdXFiZUN2Y0xmdk5s?=
 =?utf-8?B?UFl3YWpxcURXRHdYS1JES1pKMG9CM0pPa3hFWUFRSFNiQ3JDUlNaTWx5Qk8r?=
 =?utf-8?B?N0lzZTN6UWdPaDNCR2dIaWhrTUdlVitnd0J3R2dvbUk1ZU5aT3F0SCtvZnZj?=
 =?utf-8?B?azJlMDNpYnNES0t2S1BVakVzL3hLT1B4aUREUVJzSVNqdmd0Mm5DNWlLVE5a?=
 =?utf-8?B?ZEpCM21TR2k4QnZOY3g5eU5CbGxDY1oyTjRxZEZmOWpKK2QyaDFyVFF3VnlR?=
 =?utf-8?B?czZyMDFBY3Y4MEhHa1MyMXh1QzdkR1Z3bk5MZDcwMGJrL1AwMmlIVjEvTFpN?=
 =?utf-8?B?VlBMTXdQcDNhdDdBQjdoZXhFL1R3bW5tY04xaGQ0MXVIU1hqejNyc0daamc4?=
 =?utf-8?B?S29yRkVQK1d5TDltcExvK3lxTko5SVByVW1qMzUxNkFGaVhWS28yMVRTRGtz?=
 =?utf-8?B?bGNiY1BGNGcwcWVDQngrS0E3cU5Vb29vVGo2eWFSVy9HMGpwVnk1RCtJekxp?=
 =?utf-8?B?YXNBMlgrZE5xMlo4cWxOQVdyalNPV0xQbTFPM1hhaVVBbExCNG1sQ24xcjZr?=
 =?utf-8?B?eXJQZFNYeGVmdzdGNy9VQkpyS09kQzdtU2d0UjBYTGV2RCtzZHNaNnRMUVIz?=
 =?utf-8?B?VC9LNmEvRTA3dFUxTlpKRUdvZ2VOS2VKVnRFYklRV3l2VmZ6TkpSKzluMkNm?=
 =?utf-8?B?NHhLLzAxSUkyYXA3RTg2cFMwRXJYOEJuTXJvVzBuMkZTamtCeVJ3c3JhWTZ6?=
 =?utf-8?B?a2NNNmdDTVBkUUVDL3AzQkQ4alJBTU0rcVlNV3JEaDdyZ0k1TlFnTVpjK3VR?=
 =?utf-8?B?SVZPMmpsMWlSSzVhL3JoeFZFRFl1TDJCeDlOckNrQm9iaUNVeEhEb2M4ZS84?=
 =?utf-8?B?S1RDN3dReDJpTlp2VUZJLzV3M0N0OHJOZmVjaU5Hc2ZjZEJTY1phT1RnK0N3?=
 =?utf-8?B?K0xBeElHQ2VtRnh3a2k4bWhXOVJhRXdQWnQ1UzFkckNOcVdwVEgwbjRBaktV?=
 =?utf-8?B?SzZPaFNwdmw1NmRnVG1lUml1QWN6Rmh1Zk1BSVVGMG9tYWExVmduT2hySW4z?=
 =?utf-8?B?U0xPdlVIaHJwUS94VkwwMU83dXQyWkthSktDNmNKY1VkZTRmcGRURVBNVDl1?=
 =?utf-8?B?bnBlVXRiSU5CZ1ErSWM4d2ZXOWNCZjM0cGtJY21ycjVVMEFtNWpKam1rZFlj?=
 =?utf-8?B?bFdFVTdGUngzM2sxYlFJbU94ZjRTWWR2VUw5K056cjZha2l5bnRHSGdjYVcw?=
 =?utf-8?B?UWRIQ0JRZ0hYRy9PRWZtaDF1UmNRczNiZks1cElQSDJ6aGdrZDJZd0poQkRt?=
 =?utf-8?B?bVF5NFY1ejgzYlZldjMrdkkwckgwQlRrTnVQQnNyT3F3L3FQODdwQkx1Tmd0?=
 =?utf-8?B?aW54bUNIVTBsNi9YS25CSWwrMmlJZ2JiNW5GUTY4VnZCeU5GOEdKM0RCZkk1?=
 =?utf-8?B?NkZ5TDkySGF5MjlvTHB0YVczcnF1bHc1Q2h3RXVXcTl5QVR5QU9zcDhObFYv?=
 =?utf-8?B?V010Um11N0h3Z25OMkdBcWVCSXN3bzVVL2QreUpWay80SjZTUm9wT0NudzU0?=
 =?utf-8?B?SGtqd0x5V3piaU5IL3dER2JiUzlLWkk5MXBtTTl6ZDI4dFdhaVlReFYzVE5o?=
 =?utf-8?B?R1hkZXVNWFNYT2s4dUtrZCtQYXBSeURRL1lTOUJmNTVkNWNIZEFobmxZSGxn?=
 =?utf-8?B?MTZ0VWdWYys3M3F6QWRlSGIvUGlVdW0wTXFmcnFqTlQ5aDhIcUgzaWhGeGln?=
 =?utf-8?B?cDdFa05yeGRXakpSOUN3R3JqM2lERFBpb2FoeG5uWFJtL3ZLREdRWWFTWXNC?=
 =?utf-8?B?VHpIS2s0L1BJZVhRMWFWVE56ZkprVGhYOC9UcUkzR3hHa1p0VmhCUDB5VVhX?=
 =?utf-8?B?VHFYTDNLR1FQYW9jd001Zzlwd1EwSnlibFBIeERwV3hMVjRmQko4OGVVS1Nw?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b68c35d-75bd-4005-90e1-08dc16bb11fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 17:46:29.8629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t/UB8eJtH0iwV7TawGcz/z1UKSq5dOYmnZhal/Ge6UuJeJl55CR1sxPr+HqjqsdsHyY9dL6CmdXA8hgVzrmnQCp14nnQv50bOnc1piPDZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, Javier Martinez
 Canillas <javierm@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The original intent behind the test was to sanity check whether calling
the debug iterator (drm_mm_print) doesn't cause any problems.
Unfortunately - this call got accidentally removed during KUnit
transition. Restore it.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/tests/drm_mm_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 4e9247cf9977f..1eb0c304f9607 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -188,13 +188,13 @@ static void drm_test_mm_init(struct kunit *test)
 
 static void drm_test_mm_debug(struct kunit *test)
 {
+	struct drm_printer p = drm_debug_printer(test->name);
 	struct drm_mm mm;
 	struct drm_mm_node nodes[2];
 
 	/* Create a small drm_mm with a couple of nodes and a few holes, and
 	 * check that the debug iterator doesn't explode over a trivial drm_mm.
 	 */
-
 	drm_mm_init(&mm, 0, 4096);
 
 	memset(nodes, 0, sizeof(nodes));
@@ -209,6 +209,9 @@ static void drm_test_mm_debug(struct kunit *test)
 	KUNIT_ASSERT_FALSE_MSG(test, drm_mm_reserve_node(&mm, &nodes[1]),
 			       "failed to reserve node[0] {start=%lld, size=%lld)\n",
 			       nodes[0].start, nodes[0].size);
+
+	drm_mm_print(&mm, &p);
+	KUNIT_SUCCEED(test);
 }
 
 static bool expect_insert(struct kunit *test, struct drm_mm *mm,
-- 
2.43.0

