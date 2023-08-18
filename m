Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE637812AA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 20:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EFA10E550;
	Fri, 18 Aug 2023 18:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E40A10E554
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692382580; x=1723918580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DjXWZF70qZOYiW6kZA0JTSI3cCxB4jIDCWMsN04nLsk=;
 b=fEggU1fxlOGaL2nGjhrT53DyeDAooFH9Vc9TSgBXDc0N5FXigkGz/Nlj
 SA/ln+vqPdiHNA95wmpvbiTtyAvXVeMFBd7IVz9u1bg8daXTyk3lEEZku
 A+p2pbFTufeczxdi7yIU7NP4bqrE34CIqm8CdhwHN6GgrenqzaP3wt+HS
 aaHUOIZKUL25nQTIm33AkFP+tUXbhI9iKuwAHTxjx1xeauH/RPizVY226
 8quLWMN2837YekwbU45ye2yrqyN7NU422wbN1JaV3+S52hqJeuLZ/FvEX
 U2XqJV3+t5nLSWwmwSzPQXNW8ZWEjcxYso77oJpYTlva2TrX7Y72jZK/R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="353469282"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="353469282"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 11:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="800549335"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="800549335"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2023 11:16:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 11:16:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 11:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTf3ih4gfSAMQLX0B/LxPraJD/cgwYr7PkW1wIzpHouzZ/lj0eyuJv3m+XVR6tjCOzP22+UcZ9CdOi+dqSpyCR+YXpOFU/UHlnxDmUkk7lDjsyq9XZA89Z5uREMnzNA8cyCz3oRkSO+daKeKGLtPmfmR7UQa9nuuEe61l5WeUI1rXHS92i4KaLzXXyJVfjb5mN+ctSFaVQJg8BBMp7V0pw6us23UI2mrLI/Yn7OOmJ000xZwWihWUWrB2nWKBVB4MyqpBDlypob909+zeoZdZEWSwIDG3G0RVWrgkohRzyiR3yWIeTcS7TAxBJFBoFrnej9WBV+IxLedwCgq3O+/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKgCLUiU3SXpmTITAZkkbGu41e4LF1Rn2NAH8sbVHwA=;
 b=g9JYW6NEW18f14eJWsg418byBV1B7AwPLKOAeIqe4hFNFxunagcKUyMDE7aCJX6p/qUGziuCKkWy0kEe80AHipUdVYaxF/WAEc8vOqrEyreQ3PRTLSU7ER17Tp0W265HGnnmyuDdHjeBUEQEqtTWM2HmKz1Rm/8RrO6+lrsD91FYc/WOmgvLRjB6Tn65YSW1EC9SoCLFY9sj/F7ol4CRF7uFEFrT4HU02w1IYTRNj3cotKNsqPQftBFZuenNAoWqCXukSOkjrivLqFfYxRRuICxtmYjWqqg+8nsFqTGEkbxFtQTI+0o5IDbeXu7NHXZ6dlBDKVtdOxYedDisBmE+RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 18:16:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 18:16:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <airlied@gmail.com>,
 <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/5] drm/doc/rfc: Mark Dev_coredump as completed.
Date: Fri, 18 Aug 2023 14:15:59 -0400
Message-ID: <20230818181604.507051-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818181604.507051-1-rodrigo.vivi@intel.com>
References: <20230818181604.507051-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b88fb0c-8659-4fdb-ec50-08dba01736a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRP3RAu3UjvQV1KXFBBup4Blwj6EymI6MXR/GycAUBK+nZjl7DD/FPGVDk28PC6DXVtGF0jr4NLFb9RhnLJw8/3sccrf+bBczpb1k2l3YLR3h86x6OvokUMXZMps/B3GH+Ft/e4rK1m3gl28NgUnG4Z1LscPqkypSrV96V/SxHue7YHsAmFz/uLNtxMAaqLVOpEt9tnjMog018qndWk/jAgcEbQCnKsLYDTeC+JAlDr6NYg2t9MJ92ggpPYH2pmUyY/8ysk9NDzZ4AJUebbwi4tEHFFdHiwlf7Z62GTm8pU5CW8LsfSsA353PV0+o8WizRLICV5+1A59X4ZMRjcnangbvVD94Bk6Bq++FEjwm1dGCfJxyd3IabIU1UUBAjA+BDnEvS9KAKbPnazoXkZ6Ah5MYf80Sm9x3mT4tBbpxgLFRrpVGv5iVeuuZEJwYlJzhjBjs1s6+ME/8K1PJPXu8sMIaRP6vklVF9evuFfJKK5DZEvBvLocmh55ekmPTNXQU3LhZsFmRNYlCgQjCX7dUQw10wgliwHhn18WxG73qpU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(1800799009)(186009)(451199024)(2906002)(83380400001)(66556008)(66946007)(478600001)(6666004)(316002)(6486002)(6506007)(66476007)(44832011)(2616005)(5660300002)(966005)(107886003)(6512007)(1076003)(8676002)(8936002)(41300700001)(4326008)(26005)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVZqMEVVVUplY2ZCd3FORkl3ZUplaHU0MUh5VU1mV0MwN3RCWHRrODhUN1hT?=
 =?utf-8?B?NXNZUjRmMTczU2c0TUR2QmlwUE44U1ozZkNNeHIwejFITFNEcTRJbTdaTG5v?=
 =?utf-8?B?WWpGRGlDdWlXVDJJYmZWNDVsV0ZxZjZUQTQ3UXRDNEZpbGRFTlFGazdMTkdi?=
 =?utf-8?B?RUdPaTg1Q0srVmtaR09iN3h3QmVqNGUwQmdQTVZXUWVFUDEzbVlKOVQ4dUo5?=
 =?utf-8?B?c2o2TEJQTzZFNThIU1M3UEdYQXhJalpTbGN1MXkzM3lrcldHTHlvZmJhYmFG?=
 =?utf-8?B?SndBdllDYXI0OHVFRklJTFQ5bCtwMk9qYnJTRlplZ1pwelQ0a1BmT1ZYaHNq?=
 =?utf-8?B?czdOaHpBOTRCb2lnV1VGTU5yTGNNY3VjRTZFNzZKOXRsRTJodWF4NWdDcGx5?=
 =?utf-8?B?cEdDVjRQdjlZdE1zZkZKTXNQMHNWdlpxbnVUZE81NTR2V1RzdGJreU5CLzhJ?=
 =?utf-8?B?cllOdWZOWXBrQVgzN01Qc0lnU0F5b2loenNBNXBVbFNzNnIxZ0srTmRrY0xo?=
 =?utf-8?B?Q1U0WENVbnJBdEszVzc0dFVMd0JZMjl1cEk3S0xFRFo3c3hKQ0psWlcrUFUx?=
 =?utf-8?B?OHBqMU9lZnl6L0dEUENHbjFQSEgvVFovOWtoU2I1YkJ6ZExYWFFGckNPNktW?=
 =?utf-8?B?RjBDZFdzdytrc2JvZUtUTnR2NTdiSFFxZHdzNXJnYU0xSkhtaTJydHpGekdm?=
 =?utf-8?B?V0ZKNkUyMk5vSnZQS3dSWDdxbzFYeGRycHhLSzFTcHFSUHpmNGFvNEluaTU4?=
 =?utf-8?B?Smx2OW1tdStZdlNUNHNkZWx6ejVicUhGQzdmUFpobU9kNlhXNlRJR1pmZHo4?=
 =?utf-8?B?S3ZJcnE3cGFxc0pudml1bWdoSGg3VEJGMzFlWDMrRHkwOU5Ub2tNUkRTVnpO?=
 =?utf-8?B?MUJFMjlyYUVsUEYvQ2huTlFjN2k4QkxLZ0tHbXRGRkR4QmtETVlxUXNkQkJ4?=
 =?utf-8?B?M3p2aDJVbm8yVkszOGxEQVFhQXVuT3gzTStqTHdsTHk2S2k1KzJodWpBQTd6?=
 =?utf-8?B?aWVWZEtDWmovYjc0Zi9sdDU1Qy9Rai9adWtRMVo4UGJpWUk2QUV5NmdudnVL?=
 =?utf-8?B?RHljaDZnYm5qUzRnZ3JOdlZWeHRkcEFlTnFnWlVnanloWGRoK2FnbC9oTSti?=
 =?utf-8?B?dERtWTY3VndWb3NBMmJMZXZ2WVMyQWlaMnBnY2krd3ZHOTlUditpdnI2bDFw?=
 =?utf-8?B?Qmh4dUFSRnFQRmIvZkJtMnpYTDhxTTFEOHdQcklkVXVKR2dpY3RScFNyb1RC?=
 =?utf-8?B?TXFoa094bHl0amN0cjhqZ0VmQXJxdEs0aHJBbG5BWE9WbGU4NTB1bzVQdWR0?=
 =?utf-8?B?MUdJY2QzZXlhOWtlbVcxSzQ5ZnFEZWJtczdqTUVnSkhJeDduckpJZGlOT3lI?=
 =?utf-8?B?dWxTKzBVbFFBZTdEalRFZGwrRjJvOVpVWnVtU0llWjZ6RkZwYkpRL01HM01p?=
 =?utf-8?B?RWowZm5ZQlFSZkF4ZmxmdmVNZi9ERjJSQVlqTEpZci9vUXpZeEtvd1V2Y0N5?=
 =?utf-8?B?bjdPMW40YUJSbWpvOXpmTDZjdnAwMm1NZk9DTnpRU1lHbklJcEdlT1ZQdXhD?=
 =?utf-8?B?U3dzazdHUTRyVUxXQmk1aGNvMGJTVU5qNFluOVR0S000UUl3dDN4RVN4Ykcy?=
 =?utf-8?B?Z2tOd1R1R0VIaDdmU052TmJPZzhpSFE2aGhrR3M4WmtHUktkMXBuOW5xVk84?=
 =?utf-8?B?TE5nNlBhNmM4ZTFkemtYNkVuclY5NFVJWWVxMVp2aXo2eVZ3K29DTU9UMUVY?=
 =?utf-8?B?ejZzVmxnZU13K05DYWpickVJZnpoYW9RTGpUSnFwNFBUL1ZjL0J2N25oREhC?=
 =?utf-8?B?SEg2SDVGWklCVXlHaytSRmpjWE9aNVVSY1hmOWtsY1pRWHYwdHpQU3NOKzNX?=
 =?utf-8?B?V05SUHVLS2tYeVRZTGI3THZpWWpBZmIxZnllSXhBWm1SMjZHeVZ3aWc0YTEy?=
 =?utf-8?B?eEJLL3U2b3JYMGJPUUlJbWFtY24wRGthbUZlOVRZYXRCeEtkMzNqaHVhR1Bp?=
 =?utf-8?B?UVIyeWlnTEV2dmYyWm9OVUF1ejlLbjhHMVovVkx3V3V0Z01JT0MxMDA2dFAv?=
 =?utf-8?B?OHVmcXh5YjNKa1lrOTE1ZUxOQk5zYVg3RXAyd2xOT2gzczJYVmhnaXArQmxT?=
 =?utf-8?Q?pTAU8tniVtcfGEI8sPmkehRNI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b88fb0c-8659-4fdb-ec50-08dba01736a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 18:16:16.6812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqIUlKZtiNRwYyzZBAJdox/6gbe+ZkQeh75ruo2tdb5BESOjTbgad5oecy/JdLZ2yJQoWzoLgpAtzAHaMMYiSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe is already using devcoredump infrastructure as the primary
error state and all the changes needed for user space error
replay and other useful logs are getting added into xe_devcoredump.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_devcoredump.c
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 3d2181bf3dad..bf60c5c82d0e 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -67,8 +67,8 @@ platforms.
 
 When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
 
-Xe – Pre-Merge Goals
-====================
+Xe – Pre-Merge Goals - Work-in-Progress
+=======================================
 
 Drm_scheduler
 -------------
@@ -206,6 +206,14 @@ This item ties into the GPUVA, VM_BIND, and even long-running compute support.
 As a key measurable result, we need to have a community consensus documented in
 this document and the Xe driver prepared for the changes, if necessary.
 
+Xe – uAPI high level overview
+=============================
+
+...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
+
+Xe – Pre-Merge Goals - Completed
+================================
+
 Dev_coredump
 ------------
 
@@ -222,8 +230,3 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
 infrastructure with overall possible improvements, like multiple file support
 for better organization of the dumps, snapshot support, dmesg extra print,
 and whatever may make sense and help the overall infrastructure.
-
-Xe – uAPI high level overview
-=============================
-
-...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
-- 
2.41.0

