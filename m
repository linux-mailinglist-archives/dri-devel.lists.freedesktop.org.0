Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D893E6E9B7F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 20:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8BB10E0C6;
	Thu, 20 Apr 2023 18:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1010E086;
 Thu, 20 Apr 2023 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682014879; x=1713550879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=kjs+YPM6ZHCJBO7dr18LBrY5kfon/DIUG9l7/gtPX/s=;
 b=McFbk9kC2YMquC65dwLBqKPBjxrs5sf8+5NJGvsAncUwiGl2EZxFpX97
 fBIQNx5+TB9+2oSdGXLV1+cn92GHwAYwVZbGNbaOIlStAfW/4jc5KN76D
 G51sdZb6vl3cFWtHUb9cPjx5g5gH0ZkRds/z0TcBfI4MwVeV3IuN6pCv/
 dg2Rf040XbWL2x8WQi++rmkShMuE0zrxOBEI6Ld5XFOLt1uLr6hcRElSh
 K2emspi7ygRPx+twwGZZFab4kKsboPCgvW3z2d1r0dHDv4giK+DuNfGsH
 nGvYNXUOx8HbQWyh0ICs+pHdiVXut7ob9xriEpnnZNocVl0XHFxUPrdef Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="330014331"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="330014331"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 11:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816132845"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="816132845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 11:21:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 11:21:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvL2U418ij3rVRqW41lx+C56sKaajjoL6uc18wKKirGeF7hzW8KFHqcHPgsYMXDf2GEZQf96vKTliag1AQc+AXPPJ1OqF2fomKai1L5uIKivJYcjKYyvojdgDTlVdvPEotLIQVx8qbDjvw60q/5aFaeBaSniOrH20PSVyLOIpJkE6FDBn4cjPAZ1OVRkAb+6zCW7/5xLqT41mEbq+TNskWxDgDbtnmqz76IRtihSmbng488Sl2tTjBOKU0FiddUswR2hpcgNFPQ8Q0WxSkq4zYBVq+SVLuJedHhfM47G7HqcLeCTGOlGgbARSR/489HQ2ONGdbbH2oaJjnZfH2HIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GC1gqq3amCVPemQsxq8sWVzW7BDefnpjpcIdBT47STs=;
 b=f6rbur3+RYT5bFrcfLD4nhDIvZpLyF9t6bIXtu45H/p6I9GN2y01vBXnuKrc3KDGDY0De5brZ0Lj7KfQ3mF3Gl5xhd0Te9xUZIh+5O3WElyPmMlklEF0ROwocEW0JBpDlgLlJbAXeUgZLN3jzcg6wrsch4A/IRYLbFyiriZoHtOJEv4iL9jYWZEdmLg3TFJFLu99Txw7c9ntCNpBHQXAOGm2i06naH9GdcdFATSreb5sxdMHMcOFz2hdvu37NbGwGKe1hrT9+rlgFKele+qEpuGRpAT4E/QiDEJAFE26AoetVjQ5EYn2npkKk2SiwBpCr9UA/9JlECW5SO6Nl4O31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 18:21:15 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:21:15 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 1/3] drm: execution context for GEM buffers v3
Date: Thu, 20 Apr 2023 20:21:00 +0200
Message-ID: <20230420182102.3302646-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420182102.3302646-1-francois.dugast@intel.com>
References: <20230420182102.3302646-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: ba52401a-eb05-469b-e660-08db41cc0740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTB0hg5EP3lJB2mDvrweJc70aenL8jxaHxIFWPfOzqfJ2bX9M3jTynzJFN7vPuPV6w1uHijxsqO+sbPpfpTGbqXbDYeaGNGHhKXU5vwD/+SjmJwmwX9z4NSiWOUloTuvfmOytf9RoDLGtTgZXlt9jIpJG4nqzVpaHeoLaNut8PhGkyJ+B7RDMATItpOVGRJL1UDNtbkT16qMfIk+pqT+ML+U/8OTCTtwGMtOWVZ+LH3kvLCOS6hlLXiLdj0ZMZ85uYpd9Eqf5aNZzNuxuGFyyyn6oToGcyzNa4u2Dwt+CHbiDWnrPA1OKP0tZ36I3cXj5wsoS07PrUSBXfSUuK3dVJy6Vp8oYQpV11KnIUEqmF6JjZXy74usTnN9A2xNASRfQZcWlySjMGzfL6RQtg5G4ur8q84qEnmB5ugE2bIIf5sokKrEkChrPp1itrknfjCRJnJQmd5CKJLbvRvPtpVoR1dYlEl5F5/UdiufFZIPuiRYn19op8CHbVBc6pdUobEnq2qeF9tnRVGTWXdwaWaT44UflBmVhUZ6vi91klliJYv/NIDMyfVEOY+bcJnBwxvP0c1b4HDQioKszmFmZZ4J5aXUPGmrcOR6ApWyUSsXid1PsxLPO7ma9wKYffEqEVZJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(38100700002)(41300700001)(5660300002)(44832011)(8676002)(2906002)(30864003)(8936002)(36756003)(86362001)(6486002)(6666004)(6512007)(1076003)(26005)(6506007)(478600001)(2616005)(83380400001)(66574015)(186003)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(82960400001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1EwaGZ0N1ltRWJzay80bjBoUWVIb2hqcHpzWVc5NmdTRTBIdy9sbTZndkM1?=
 =?utf-8?B?ZDlhaUVMMVJPcm1mV3RnRDhyNkc4dTh3TStYRC82UXhQSEhMNU5LNEt6aHl0?=
 =?utf-8?B?TlkwNWhWZ25pR3N3KzlrTEM5bW1nTGFOVTg5RnMySHdFTGY5Qk50dkc1MzZr?=
 =?utf-8?B?bmpuQWxFdFNJRHlTM3JQWG1qUm9xTWdSZ3FLOVYybDROQmhGQVFkQjBKWlQ2?=
 =?utf-8?B?MVVDcDVvdDZNRkZLcUhKZlhVb0RzNFMrSjZQTHB1dm5lOW1TMGthbUVQK2lG?=
 =?utf-8?B?VEJZeS92MHY2ZFFzSXRSVTFHdXJkK3JDYm9VOUU1b1lQZ2YyNXJFdXpiMjRP?=
 =?utf-8?B?eWFPd3NpWGk2Sk9yYTJoQ2ZlTDdFRkJ6M0xUbmhQRUc0dWtPNThIRHlUYUQ5?=
 =?utf-8?B?OGtSb0pXZVlBSjExdWw4dDh3UEcvS1B2UXY2S3N6ZXREN2t1OTVXL3RmSWdP?=
 =?utf-8?B?a1d6aWdhWmwxOVByeHNGbTkzUHdLNmVtdWYxQjNQMHE3SFliNWV2YW8xYmtC?=
 =?utf-8?B?M0ZPa0ovSWpnb2trV0ZBY0hsSHVKMGE3T3MyQ1lNRHpiSTVmRDMzMWwzRi9N?=
 =?utf-8?B?WWsyK0UrT3FVRDFad0Q4aENEM3BmTElmdmpDcVh5R0ZRdDlKY1R5aXBuMUxP?=
 =?utf-8?B?NWlVOFJpN0dNRXRMR21LNE5xYXB5bDlPS1JJVlZ3S21Xdi82RVhhb09jUE8v?=
 =?utf-8?B?MEV3ellJME45MW1BZlZ3b1k5ck82Nm96M1dyN0dvMWVONmZwcHFkZ3dMZE5X?=
 =?utf-8?B?eVFnQ1VhSHNBdGJYMlBJaWJGU3BnK3dBZFA1bW9Ecmo4WXpNRnhoSVlXUC93?=
 =?utf-8?B?LzhxYjFmWDQyVHFnc0JWQmZpNHpLell2encrZEJQc0ZrdkwrdXc3dDVhWkpY?=
 =?utf-8?B?SG5hanpaVFdONS9pNHFZck1qQ1RWdFhDaDVEUEJucmJJSGxBbm4vSVhoOFZR?=
 =?utf-8?B?Y3JrY25LSEJ4WlFUU0dJR0VnMTVKK25jQUFSdkpWanp2S1dJU3VraERmNHFK?=
 =?utf-8?B?a05lS2ZTclMrbDBobCtYaWx3eWFmdW44SCtvLzkvbUJ4SVcxbC9hRDV1cDFI?=
 =?utf-8?B?WUZaTGlRVTNwS1RqL1dvcEFPS1I1NU9JRTRlbmxCMFBvUHU2RStOYlMxeGFJ?=
 =?utf-8?B?OWF5YmsvbGx0ODdsdHBleGI0U3JFcXhEMnVoOUZ2anBBem03SWJpazZ2Rk5h?=
 =?utf-8?B?d0ZZZHZWaWg3UDk3cURNMlh5NGt6VW9tTTNFUTROREJTVjFnaEp2SzhyVkZq?=
 =?utf-8?B?c2Q2a3BGaEhlNWp2c1RXZEZvczkxeXRCSFlEaE1FTkJqNHcrOXNFOG9OaXdK?=
 =?utf-8?B?aUc2WisrYkJtenN4QlRBVDFLc0lJYkZyQm9GL1ZXa054cjh6ZUlWRFRKc0xC?=
 =?utf-8?B?TEtZcFBPQ0ZScEs4b1d0RkdBT24vaEVub1JFOThqMHhHVUI0YVJBZERra0NP?=
 =?utf-8?B?UDluUFhVN0FDd2I4YjBBb0p5S0gzNmZ1c1B2U3B3UGx5cFE1eWRGU3lpZ3ZC?=
 =?utf-8?B?dUVmOUdWZnlDTXFlUERyUXU1RVFyWUhhUE9IdDRWbTVHTFo2VGtvZjl6YXlM?=
 =?utf-8?B?ZTZQMnl4Qkh4VzJzWkN3ZEg5OC81cnIySXE0dkdKdGw0eGxtT1MrTnJYbjVT?=
 =?utf-8?B?RVNPZ2dsMU1LNzNKOERqRm5ENHdQZElNd0J6UCtKeVNZUm1mQWxLeUhQdnBP?=
 =?utf-8?B?R0ZuN3hscDdyVWl4eEk4ZUYrMjNtdVBCWGRidWtPdlBtdnAxNkJiTVIvL3JT?=
 =?utf-8?B?M1NEbFU4TnFIM082NFdYWVJwdmRmWFUzU1VaS2xzVHJGM2R2bFRPTk13RmZW?=
 =?utf-8?B?WG5jRmZhbEJVYnpFanJsSEZFWnpIMDQ3a0QxZGR5MEF4YmlWS1FJQW5INUhh?=
 =?utf-8?B?cU9sb2NYbmtyaVQ1VFl6SzJmZ3FJdWlKQnFOa01LS0RDVEpZQWZPWmRKbGlE?=
 =?utf-8?B?UDBEcGF3bHlJNUc3ejJ5c1FncjVKRDArZGRBSSs3a1c2THJaTk1SRkZjeStT?=
 =?utf-8?B?d21RRTJSUFRqNUZRYjZHeWhFZnhHRmhRQ2g0VGR1VUU3bkFEM3VzeXFEbnNn?=
 =?utf-8?B?QjF5cHQzTFp2ckpmUXkrT2FQU3kyVVgvdysxRTVGR3pyRnZVUkQwUlZLZVZT?=
 =?utf-8?B?QmVlQm14OW12U1N6R1VxRjR3ejVsZGhDa2tBdk54SXFtMWVxVWN5T2ZCSlU3?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba52401a-eb05-469b-e660-08db41cc0740
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 18:21:15.6886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIef3zHgstVokCwdUeOPmG3a6GlNVFiKRET5dFYEHU1/GXDxJa7yV62gvG8dM8NDMixpch/kr7fT6meQWssjtSm844O7SPatp3lTZsgABDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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

