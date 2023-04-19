Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B26E80B2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 19:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864610EA56;
	Wed, 19 Apr 2023 17:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755B10EA44;
 Wed, 19 Apr 2023 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681927039; x=1713463039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kjs+YPM6ZHCJBO7dr18LBrY5kfon/DIUG9l7/gtPX/s=;
 b=lxpca/CVQLD/C8zkYeV/CBidJ4R2mYnGzjKZd0SluKn0lu5ij19rSgzh
 UJjDa3ZYdMwvNWL59dFNK58THij2A2adubDoMOzZy+aaHeZwfNaZjPYUs
 VYHqbng6oQnKHohR6bGNW8nhh8RicVzooOMqxuAL1m+/GI7JuZsdFs9Jc
 AcdntS8MwVaYlYv9ibmBF7Z+xpYeFJmy9eEusq8dbW6FxMTvh897ubx6e
 NwGIBgu3Hg8tEspWwKAGMUdelxLHXAucVwfrRbSj4Od94SMyOi1ouh1A8
 PWQKjR0aIASdKr1DzgKX4B7Xj+qZA2zfoVwkkrNCWwtw1fN5hb6e0ZeoJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408429810"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408429810"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722022737"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="722022737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 10:57:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 10:57:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 10:57:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZWtnEkZ5ELIJPmkA+9WVOBre9SusiHFCZmaxCM7l8wNQuTCu4iYUwCOKpWWvmZnQUUXAC18KYv+tl4KjjvQ3SYVDMEYblGbuwR4RLLoCxKfpK+G7Bc39OwhZysEbo1HSNEFEwR4dWWce9wsBssoZhc4+Ia1totI/UM2eE9S2VD6BNzwXXMcXyN2esSUj3bXLObPnZXo3kQSGgeh4sxKwz33Y+NDdSYFUUn3iA/FJ2j+4XkfyfLr2tJghsyYqX5m5dHgrygZLtN/jcO1ZSTiFfQ83BOct1byeh1QY1DOEY5T9ZKnJiJFUpZo6h7re+xgtKp9fXp2TgipD/GThClDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GC1gqq3amCVPemQsxq8sWVzW7BDefnpjpcIdBT47STs=;
 b=cxrL6L7iMhbwt80i3Kay4Ae/E3hqVxUnTK7L8iSUojFjXP0OZV5TLbdwkVb5O62EtZZg9wfkK0Mb8+ykX9z4vqSjYuL0Zcux5Xy5cVABMH2HYP/KWLY2GouJLQS+fdVCV79fjkxOw7kRCpyrUCmK56ZtmBRGRiW8qnKVIe0BBmktRv5EANXV7ZZMW9BS4pq8SMPri1PEyo8D+2mmEM7NFEadJ/5pnfTVvROFSadoQtdWtEqMRYKjNfPvKa9I7iSej5vT16pE3jbqM0uWeDWZk5v89yIphvNk32Mq9Ygno4xQz8bN0LmXfCoJT3zlujQnqDvVM+TxBB2tuO5VlKEBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by SA1PR11MB6848.namprd11.prod.outlook.com (2603:10b6:806:29c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 17:57:13 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 17:57:12 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 1/3] drm: execution context for GEM buffers v3
Date: Wed, 19 Apr 2023 19:56:48 +0200
Message-ID: <20230419175650.3259121-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419175650.3259121-1-francois.dugast@intel.com>
References: <20230419175650.3259121-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|SA1PR11MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 61460060-096b-4e99-a50c-08db40ff80de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUy32nf0Pmx8q6/xHaR3iEQTSz2YBd/diW7+Zdk1L7iwyzs1y8z1VRcZmcgXp5CS4itBhKVQHSeKcP1Dg4J3MaVO85fphQJDCF17dksrpVVpZQzN71UECO9RDMgj2Y5/r1CkGX13FKMpioc6AWD4maJi7uCn0ltipWZ99tZI1JCttmaN8mQB9qi/30Z2iBL3VQit+zLLxgxFbuEasNIgtO/IsNzb/8tMgjGqzcow9jEz0gE7OeQHUboDonxstkFNBO2eLeUQonblXab2Y+ZEy6m6+9U5V+zDX045Phz55gbwpPI7gdWWBD06ufc5xVwFfIbYBJ21Z46Rahz4V7VVYDWbmOpZttEfbJ+cr/5V5mPjZDL8wbLckRmdwL0IoypYl8FUvt3MyNUapU4ZW9xFDcPTa/FU/X7ZQ6oaBX8lV4c47eFY2SyF1SBaqi99lIQTL8y5SpcSOPZJc3D/l/eMweqvEShNjv//tVJaKMeIpChbcq7RPHXidn/+8axcHIerJ6T0UgY510seGNV75vuVOFax25NwvqswnzX6VsgwiMgd4bPNr6877fkaTcJFATUKg2rqky2F7VeEaBe3aR2IJndBZXB10LfB9CzOpr6sS2M7cQ3DHYYkongSFxqtMYhY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(36756003)(4326008)(316002)(6916009)(66946007)(66556008)(66476007)(6486002)(41300700001)(6666004)(478600001)(5660300002)(8676002)(8936002)(30864003)(2906002)(44832011)(86362001)(38100700002)(2616005)(6506007)(1076003)(26005)(66574015)(83380400001)(82960400001)(186003)(6512007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djREbmFUMkpuKzRLV2ljRFNhRHV1L05jajR1NmdEdW9INzFZOTlhcmUwUEJE?=
 =?utf-8?B?cUtqVlRUd1pqRUdySnI4UExtNStMbE5OenlBclJhQnU3bS9HWWFNWVpacVNr?=
 =?utf-8?B?U1NRbFJ1enQ5MHQySjQxUnFzM2tuYlJqZGZuTWszTlRLa0cwOFR0SGhwQnVk?=
 =?utf-8?B?dzkrSkpIVWNzQ1hpSjJkR3hJcGE4aGhVb2ZtSjVackVpa2dvdCtVbUZTVmc1?=
 =?utf-8?B?aFdYMjUwd1o2OERwU2xuRHJFc1RZSzFSc2MyQXRhRkRSUDZkM3hhY29Sb1Va?=
 =?utf-8?B?UXJwZ21tTlpHSTZoRTNZaHVYY25qTSszRENJOGpNWWl3M1MyVVJka1NaNHZh?=
 =?utf-8?B?ZzZySTk4MGIrNGlNM0tIWHVvUW5KMVBEN3R1NVF1UjkwMDJyUnUxc3UxOXUz?=
 =?utf-8?B?ZktGUmZrKzh0QStRU0tLMlhsVGcrTFg5WkgvSHlVVTJRR0I0Y0RacmVyL3ha?=
 =?utf-8?B?ZXNEbDQ4Y1Y1RGlCbVJsTjN0TXYzeTVzdUpQZmxXcEtBcWtVN1hLZVEzWkND?=
 =?utf-8?B?UTFDZDA4MkFTSnRxekh2Zk1KQjdlN0xwd2Yxb1JuOTFxbzlmYmtmaWJUYzNz?=
 =?utf-8?B?YWtxYjFsbm5IZ0htNzRHTFZyNlZ2NGFNMlhFZGNnM21OUFZRVEZZR0c5WVZI?=
 =?utf-8?B?YzVKcGpETlJiakdMRnVkTnI5NkZPU2VYQ0JtOHRDcDJiZ2lyeEhjenZSVFBR?=
 =?utf-8?B?Z0VPSlZQbENuekc5VEJJdnVEWVZuSXhUWTF6VjVIdmFSRVpGeHMyaWRQMWFM?=
 =?utf-8?B?Wlpnd0NkRmZhbTMxb3ZpT3RsOVVCOGdpZlAvMDQvOWVzOGd1Z25rV3dlcUZJ?=
 =?utf-8?B?c09zcnN3aWd4OU5vYzV3eTR0R1dHcEJWOXN1ZVlKU0Nqb3RwRG16UlU5TThP?=
 =?utf-8?B?eU8waDY1WkFSaWxxSWlUQjRjaTI4MUFRQ0FGbTdBTlF3NjFiM1VhamZ2U2Rx?=
 =?utf-8?B?VEhjSFdva0hmcGs2NFVYSTdnK214WUFJRHB5Mlk2VlVXbmR2Y21tTFJXRjBH?=
 =?utf-8?B?Vi95QjBaemZIZnhydWFhTjdBSHBkbEozaHV0TVlxYUlEMmhDSW1DKy9paUJD?=
 =?utf-8?B?NklTbXFzVTRYQ3k2c1ZQU1Q2dXFQQTBuSmZNSWNpbXAwNEttZlNZUnNiZ1pu?=
 =?utf-8?B?S1h4TGdtYU5id1g4SnA4aG5iYUtsekhnM0lOTlkzSHI5U20vUGJZSUNHd3Yw?=
 =?utf-8?B?RXV1OEU5aHEvM1ExN0FXQ3NMU1FlSWlxZUtmb2NmSk14T3N1c0UxbHdNTEZk?=
 =?utf-8?B?L0EydENRNUE1d3dMVk9SbzNaQVl6V2lRdGtoa1BYcEtYZW5LQ3I2eVFvTjZE?=
 =?utf-8?B?LzN4UlRvaHVhMzNGNEhnSGFIa3FqcGlxK0REdEhzQ255cndvRkttcS9tVzJB?=
 =?utf-8?B?ZmswNi9HMmkyNnNNSVlpOFpTTG1CYm8wTlNGMEpMOFpQV1l6c3d0UzhxZnNN?=
 =?utf-8?B?a2t5NjUrc2d5TXdNcUVnRHlzU2Yrd2VzRlhWbjMxK2MwamN3THM1bVExTVFH?=
 =?utf-8?B?KzlkaXJIeTVzQ25yLzZLMWhEeTMwTnpZVk5pZXZjY2hHWlRNcmt3UDR1WXNk?=
 =?utf-8?B?c0lrNzdhVHpob1czOG9JbVJ6d0FKME1WdTFlNXdUUlp1OU55eE1oOXptZlVz?=
 =?utf-8?B?dnc0L1lYN09KQkd1WWFEeUVMMWRuNWtlRUVBdjVGVk0yenFyM3ZHS0taelJw?=
 =?utf-8?B?clh5aDZCZmo3b2pCb1ZMSnovZWpKZysvRUI1QS9mNzlCdk4ySjJXSHBzbnNF?=
 =?utf-8?B?WVo3bDc0bjJHKzJ5bEFQWE5QRVQwaXphTSs2WnlTZE92Nk5RNFI2NXJDMzh2?=
 =?utf-8?B?L1JtakhLd092L1hYQTg3NXJjQTZGSW1UR3lPZERqdFIvYi9TMFpZejJLYyts?=
 =?utf-8?B?YnBKTWRKN09HNE90QTdDUnd0VXp5dUN3akdxRVVNN0JTVHYxZy9iMmRKUm9J?=
 =?utf-8?B?Z2RmM3pUdkxnN1lHbjlsS3UvdEdMZ0pJYnRZRmJXZTFWMjNzdFE0SEN5OFd4?=
 =?utf-8?B?bURoNUlpdzhXU1VkZTRoaVk0dzlSb25oUnY1MTI2UVIreFpTU0E2QjdyUDVS?=
 =?utf-8?B?K3pxb09ldmFaNFYvRGtHUG9kV2xXUllhT05tLzRqNEJIWXFDaHg4TVQxTjRH?=
 =?utf-8?B?a04xSmJMWEZpZ215aExOMzV6Zk84R2xPWGswY3dVR3pEZFVJSElhTTlzcVA2?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61460060-096b-4e99-a50c-08db40ff80de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 17:57:12.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuPyuxs8EvnbG6FZ7HUvErhsYZSUYS1sxnwa4ZlQvj/ChP+ag49e2DO6deknx5YLnXC5pDtYAHXdPaPWehTRK7NoVmVBRBlt7WTAsS5w2aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6848
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
Cc: matthew.brost@intel.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, dakr@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

This adds the infrastructure for an execution context for GEM buffers
which is similar to the existinc TTMs execbuf util and intended to replace
it in the long term.

The basic functionality is that we abstracts the necessary loop to lock
many different GEM buffers with automated deadlock and duplicate handling.

v2: drop xarray and use dynamic resized array instead, the locking
    overhead is unecessary and measureable.
v3: drop duplicate tracking, radeon is really the only one needing that.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   6 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 249 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 115 ++++++++++++++++
 5 files changed, 384 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index a79fd3549ff8..a52e6f4117d6 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -493,6 +493,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
 
+DRM Execution context
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =============
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e928284b4357..39c9d079d52a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -201,6 +201,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 66dd2c48944a..9c4461f0a665 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..df546cc5a227
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup procedure
+ * unlocks all previously locked GEM objects and locks the contended one first
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ *	struct drm_gem_object *obj;
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, true);
+ *	drm_exec_while_not_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_lock(&exec, boB, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *	}
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Dummy value used to initially enter the retry loop */
+#define DRM_EXEC_DUMMY (void*)~0
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+
+	if (exec->prelocked) {
+		dma_resv_unlock(exec->prelocked->resv);
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+	}
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @interruptible: if locks should be acquired interruptible
+ *
+ * Initialize the object and make sure that we can track locked and duplicate
+ * objects.
+ */
+void drm_exec_init(struct drm_exec *exec, bool interruptible)
+{
+	exec->interruptible = interruptible;
+	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
+	exec->num_objects = 0;
+	exec->contended = DRM_EXEC_DUMMY;
+	exec->prelocked = NULL;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finilize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	kvfree(exec->objects);
+	if (exec->contended != DRM_EXEC_DUMMY) {
+		drm_gem_object_put(exec->contended);
+		ww_acquire_fini(&exec->ticket);
+	}
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_cleanup - cleanup when contention is detected
+ * @exec: the drm_exec object to cleanup
+ *
+ * Cleanup the current state and return true if we should stay inside the retry
+ * loop, false if there wasn't any contention detected and we can keep the
+ * objects locked.
+ */
+bool drm_exec_cleanup(struct drm_exec *exec)
+{
+	if (likely(!exec->contended)) {
+		ww_acquire_done(&exec->ticket);
+		return false;
+	}
+
+	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
+		exec->contended = NULL;
+		ww_acquire_init(&exec->ticket, &reservation_ww_class);
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	exec->num_objects = 0;
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the xa and reserve fences */
+static int drm_exec_obj_locked(struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	if (unlikely(exec->num_objects == exec->max_objects)) {
+		size_t size = exec->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		exec->objects = tmp;
+		exec->max_objects += PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	exec->objects[exec->num_objects++] = obj;
+
+	return 0;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->interruptible) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (unlikely(ret)) {
+		dma_resv_unlock(obj->resv);
+		goto error_dropref;
+	}
+
+	swap(exec->prelocked, obj);
+
+error_dropref:
+	/* Always cleanup the contention so that error handling can kick in */
+	drm_gem_object_put(obj);
+	exec->contended = NULL;
+	return ret;
+}
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots. All
+ * succesfully locked objects are put into the locked container. Duplicates
+ * detected as well and automatically moved into the duplicates container.
+ *
+ * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+
+		return dma_resv_reserve_fences(obj->resv, num_fences);
+	}
+
+	if (exec->interruptible)
+		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret = dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret == -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended = obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret))
+		return ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret)
+		goto error_unlock;
+
+	/* Keep locked when reserving fences fails */
+	return dma_resv_reserve_fences(obj->resv, num_fences);
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..65e518c01db3
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @interruptible: If locks should be taken interruptible
+	 */
+	bool			interruptible;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @num_objects: number of objects locked
+	 */
+	unsigned int		num_objects;
+
+	/**
+	 * @max_objects: maximum objects in array
+	 */
+	unsigned int		max_objects;
+
+	/**
+	 * @objects: array of the locked objects
+	 */
+	struct drm_gem_object	**objects;
+
+	/**
+	 * @contended: contended GEM object we backet of for
+	 */
+	struct drm_gem_object	*contended;
+
+	/**
+	 * @prelocked: already locked GEM object because of contention
+	 */
+	struct drm_gem_object *prelocked;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	for (index = 0, obj = (exec)->objects[0];		\
+	     index < (exec)->num_objects;			\
+	     ++index, obj = (exec)->objects[index])
+
+/**
+ * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * prepared and no more contention exists.
+ *
+ * At the beginning of the loop it is guaranteed that no GEM object is locked.
+ */
+#define drm_exec_while_not_all_locked(exec)	\
+	while (drm_exec_cleanup(exec))
+
+/**
+ * drm_exec_continue_on_contention - continue the loop when we need to cleanup
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_continue_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		continue
+
+/**
+ * drm_exec_break_on_contention - break a subordinal loop on contention
+ * @exec: drm_exec object
+ *
+ * Control flow helper to break a subordinal loop when a contention was detected
+ * and we need to clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_break_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		break
+
+/**
+ * drm_exec_is_contended - check for contention
+ * @exec: drm_exec object
+ *
+ * Returns true if the drm_exec object has run into some contention while
+ * locking a GEM object and needs to clean up.
+ */
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return !!exec->contended;
+}
+
+void drm_exec_init(struct drm_exec *exec, bool interruptible);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+
+#endif
-- 
2.25.1

