Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1278C9B7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940CB10E446;
	Tue, 29 Aug 2023 16:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C7E10E444;
 Tue, 29 Aug 2023 16:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326890; x=1724862890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YTxANojYPz3N+14HoC0USbWEVqVaxS0jLB+zs7FRc0A=;
 b=VuUrAPeDpLKAjID4I6TQiSKPnz55FdeBOKp/3JFho2bB4F1cvMovTqph
 0GpA8ir2hcNAtTcrv3qCHt1iUCIYDsVT1VJiilFnSZx1ZRC7aJmnJK4v7
 8byp00fLwB5dTLqyR+IindKigACVrDRX/NQYJvVIcby9h4eWgeB5VhWGu
 3SVaBNZk/tL3Rh4SSIeacQXDxCOkV+P44X191hwyFas7SmM9PSecRdt5g
 1IXntmi/L2IYj8n/Vzy3G+v9a3xX2su3VBJ/9ITAt5L2GXX2Va/W4H5i6
 9oNE7/bcubWiak2HUb1ZJrEwXEwS+XDMfCMIrLMUJVM/MpFGuZ9s6V3gN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406412836"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="406412836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732269908"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="732269908"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 09:30:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 09:30:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 09:30:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpXkLcXG/ggXtJNSMrIMnlJsCMxQWKc+Q6tVjjLc7Q1wdOJ59jxh1gWPMs0jZvBQqHamEbeddvqtdbEBx93G7LNUmAMI4mh09KnCHPgoGLz8k76lxBPY5Bw3KH9Apc/4q12ITuYwCa8Okfiu1nh7CJQD+0DUS4dWuEz4LLyxRKIQtgyWRNQ+iLpA8kOpCHiL5IqQcUR/h1Udy43hkwbWEZT/SAvBjP4Cq7ar1icSYkvik4I/k2ZRR1rIq1gIQ0GrI+hEnnsl//Btsjr1XzCq8/vg1d/Cv0sGPfWahIsKit82C+oF+n37rIo/hj4tlDaQvdmVRLnYuasUOx+tHjW5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxvldMH9nhlbgHmanGWEvNW/3TeE764toSae+QgJgi8=;
 b=kgZ5n+1X8qJpBnR1iTC7ngJPQHI8gnbkqM5bOVQbGASRVwqVQSaEYXPQVjLVcDRZYrErJ1T+D+AhhRU5JjfrmUAExKtUQyFyJpgAzX9Y2XKGvDBw6Km8mqab6g5OJ4ESIHp9k1CE819/ZV9uYZ04aWtOQXs30Y5k6g5K8ISHVue+9RxRrOWKkO8VLAdLS2PQxaqmV8is/QMA6j0D2E+kTsd9/IwDc+hsTNzhLom77l4sdsZp0EWKr97T9aF+OpSeTNMYsJOurpvOD6GxN07KiuowQ/0dXJj7gXzeXzpQgFr1VUOiVa1X1hfQjZCoV9P7XAGWifO6dFVVLkh5twJaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5442.namprd11.prod.outlook.com (2603:10b6:610:d1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 16:30:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 16:30:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/doc/rfc: Mark GPU VA as complete.
Date: Tue, 29 Aug 2023 12:30:04 -0400
Message-ID: <20230829163005.54067-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829163005.54067-1-rodrigo.vivi@intel.com>
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb33108-ccb7-409a-b8b5-08dba8ad3cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGUJuhs8NBZdO4zLJ8Q+gMM3QhWGvynxX/V7eBGC1FGz+7ecDwKi4j4ecH6v7WR+5uFNtY4dsaNOGmw/jNz0ojQlAvua/GabsyigRTtE4xydtTaWWrYdrBuJgUCFXT0HYzAqcGsGhOdeltUBzC2rPqHeQaBcaRQhaTpNWN5zCQ3uYjiXkz1FpgJf2HXX3KR0LW29leqw/7HSX95DwM3Xaj1Sz4alM1l1u47+kQ52K0/9jf6zETSI+blF/Dn6nB3AfwJ8XtylNbj2MuJZweHp1hNgWGXv4EuNix9jIaRJhXlYlEVeYiHyTwevqpgsM8aXliNAvUohswot9kh2gh/uHAPWlklF88urPfY3t3+NAkViNAB7uItHdzHF966gzP8H+365a6BxchkpnO3VNsVzJzARH4D5PFwDL9cCH8zg9vewK/3KGgFpq3QILiaRl+LzD2MbpyprS923dN+Q2kIJGxLsv1OgwC3dZckBc15vd0e44Q0AVHiHE726sfYEdM4Dy1TnArXBEyPBt84WOc0WAT1OFca3VDKQJdIgZVr71tbFRJTtVA4RYR5Mo7z/9qqc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(478600001)(6506007)(66476007)(66556008)(6486002)(6916009)(316002)(38100700002)(41300700001)(82960400001)(6512007)(26005)(36756003)(8676002)(44832011)(5660300002)(1076003)(83380400001)(2906002)(107886003)(2616005)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r3w9AJyr0YX/5sXkntEa4e7KM2SVL7U3/qaLynNqTN+eG8LCpg/UiylkQYLb?=
 =?us-ascii?Q?JO20QWZ2j0G4zTLsFjQADVvk89RliDC8EeD5E07I90IjEDI855jv5UzsL45j?=
 =?us-ascii?Q?V9Vfrbzs7cYDjjQWyJi7XXhZZDeeGP9RUQtgpDNgn7OXKcjXUyfsho9Slgw6?=
 =?us-ascii?Q?CZKRffT5DoxD0AXXVvGNImQ9kXZVvqISl+pihTT1gx11tVsUWLAHx4yWRIJ0?=
 =?us-ascii?Q?Tbk7qCtDTw00j5O4mNNXwZgfAYTls00gfJR+Iz0+4S8T3r4xEmHNXGkze4+f?=
 =?us-ascii?Q?ZYkCcQ5ZymeduHe/mJbm+jIoeCbX1hRxQqoMF8TFJSK/sXnpLZ/cHXqViUs4?=
 =?us-ascii?Q?3kwNl22o3AkOyZQ3aJtDEdzv9ylq07KBWr/m2ihj655ERpJfMGpKH3xUzFMf?=
 =?us-ascii?Q?b7j7Mla634AmeDvInsxzOiRTqkuwRCCUpbg8nsRb/BXQUQabVcHzr6cXe3gu?=
 =?us-ascii?Q?FGzOBgm1vfzacaQCn1uRiiVRVerAX6rxkQ/LtIXnF08p6ZWBspCJav8H3gwE?=
 =?us-ascii?Q?V+b+4lwOTurxXFCR0n/xLLZBAW3u2WO5/1JpMJRjgB4M54XtjsyM4K3i0lEG?=
 =?us-ascii?Q?OzGtinERIRMab6N8aPxzoSLScVielXxme21DrZLhzYKkxOIvvZs+7qjj98Ss?=
 =?us-ascii?Q?nJF+V6aNdugfqzTECeYopPWn0iPwLXxvLp9qdMriBC38MV6LsRsMpqGCkJVq?=
 =?us-ascii?Q?jDaAsi6+4swWwRc6LG95bhbRQ0RfQ5TiKZh/IsvlNWAr8L8WGDQsk8s+mCs7?=
 =?us-ascii?Q?xpe93ETS2bnn/g5f5FRDa/U6giEx7RdZJ6NcwM79rkmkXSjOQaf+krSuQXHq?=
 =?us-ascii?Q?a7zNp+StTllYThrCFMv1Ok8An748VUm9B09bqynsDGt0xD/tIGz9An8nFvNy?=
 =?us-ascii?Q?H2FMCCD5/syBl1ginlhLQdOP4TqDscUB8CNsaeOoSm1ttM4tgYQo8xiTw8Hq?=
 =?us-ascii?Q?rukYa3WAasyUArryUKPKw6k5p0iwqauAo1ytHsAoaTACDYX6T/yQflDSCZp7?=
 =?us-ascii?Q?HsFxPVg1/ZijBWr28irtJxMF/tQpRI0hzqy1FqRp6rmvTYQVX6fu1r/NX9+w?=
 =?us-ascii?Q?fN8NfdE/7m69+Sw9dGXGH+5QSK4h0Sl5NtB37+8fdZZkzi7mQ1wN6z9TobVr?=
 =?us-ascii?Q?sTRS/ueAjfLywExAjrGtNzjYUY5m05G3SXtm1cD/nMDO4iF9RsdI2ae+VeTQ?=
 =?us-ascii?Q?tDc8xsFMQ2e+97pWRNcP/Qix+yfviqgrOtg9VErQ4bc9VsJejp0QO+zp/B2B?=
 =?us-ascii?Q?dvUS3FEZiQLR3gnrjO2NYoLoypIuTw+7g2mOBsBNsrchLmOR61hOhxv16fDE?=
 =?us-ascii?Q?eEB1g7kuYxuSGmfuTGWenIYG/Zkcb3eT0Q9tM5suCwPvJFkJ3VeIOeKp0oJ4?=
 =?us-ascii?Q?tKUmIR1aBTWT9neVF4JsGBoqHu630GbhS7itOeqdVo4OPtbNM2Wxlxlu/YAC?=
 =?us-ascii?Q?iStiJC/DGM1fzVLBTd+1CajFW91snu8kMD+YF2ni48LehsQrAOedA3PCI8wr?=
 =?us-ascii?Q?88ZNpl8cBR2gcWY2eKD26MvAuRWLzXWmH7gBqCea7yPX/0c1L3KDOXlVdhB9?=
 =?us-ascii?Q?Vi0528Q+jxUlmKY/4mQ247wuXsGDGWhVO3t6+j/L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb33108-ccb7-409a-b8b5-08dba8ad3cc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 16:30:21.2462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgFYHeJMu82CwxzOfWnwv/jA6gErqqOpduzF6IkvxZeOCLwHsFR2TAXdhWDvMccyORui+htIYQkmCgu9PZPv9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5442
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nouveau has landed the GPU VA helpers, support and documentation
already and Xe is already using the upstream GPU VA.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index a115526c03e0..b67f8e6a1825 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -88,24 +88,6 @@ depend on any other patch touching drm_scheduler itself that was not yet merged
 through drm-misc. This, by itself, already includes the reach of an agreement for
 uniform 1 to 1 relationship implementation / usage across drivers.
 
-GPU VA
-------
-Two main goals of Xe are meeting together here:
-
-1) Have an uAPI that aligns with modern UMD needs.
-
-2) Early upstream engagement.
-
-RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
-track of GPU virtual address mappings. This is still not merged upstream, but
-this aligns very well with our goals and with our VM_BIND. The engagement with
-upstream and the port of Xe towards GPUVA is already ongoing.
-
-As a key measurable result, Xe needs to be aligned with the GPU VA and working in
-our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
-related patch should be independent and present on dri-devel or acked by
-maintainers to go along with the first Xe pull request towards drm-next.
-
 ASYNC VM_BIND
 -------------
 Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
@@ -230,3 +212,21 @@ Xe merged, it is mandatory to enforce the overall locking scheme for all major
 structs and list (so vm and vma). So, a consensus is needed, and possibly some
 common helpers. If helpers are needed, they should be also documented in this
 document.
+
+GPU VA
+------
+Two main goals of Xe are meeting together here:
+
+1) Have an uAPI that aligns with modern UMD needs.
+
+2) Early upstream engagement.
+
+RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
+track of GPU virtual address mappings. This is still not merged upstream, but
+this aligns very well with our goals and with our VM_BIND. The engagement with
+upstream and the port of Xe towards GPUVA is already ongoing.
+
+As a key measurable result, Xe needs to be aligned with the GPU VA and working in
+our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
+related patch should be independent and present on dri-devel or acked by
+maintainers to go along with the first Xe pull request towards drm-next.
-- 
2.41.0

