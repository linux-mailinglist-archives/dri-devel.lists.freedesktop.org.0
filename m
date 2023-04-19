Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08DD6E81C7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 21:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDF610EAB7;
	Wed, 19 Apr 2023 19:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9A810EA98;
 Wed, 19 Apr 2023 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681931964; x=1713467964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8qvZ8tOEOo1mitHNyne2PIiurT3754zAF/vDf2UEdJc=;
 b=NICqtmICY963OaicT+33Dj1sIVMaAUYXKMZlYR9lLWUSd0FIoY7iokRE
 TK7FVDFd2esGy6u9PHNPs7wIE39UE2K8O9ZYDfhrlj9ihQ5JXbeSMs4fP
 r3Qgu0XuB995hjAXvoxGTHvKL1Sl9ilYrHqVKQ97UXjJ2Q6J5ZECOgDSJ
 zi1GrZBGSc8T+nYWMCEDh+IassT1RADG4kVP/nud5R9Wj0azx0Ab/sPhF
 9cBmYjDEu5DB0iT2ap3fyoTRlKTfTe7uzWXInQbz50qMj3Ep4E7pQmu7K
 eR7Vq+/ymNW77LncaRn/fxscUla4rydQJYSbuzTUI1q3359botUNAGZa0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373426718"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="373426718"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760859151"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="760859151"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 12:19:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 12:19:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 12:19:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 12:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meOAEKLDpLWgiSzhi5tiJJWSRRJMFHkU98O00fCwGLVxEVgddVk/8To1LPeSNal9hTnCk0XSUbxlN1v/TxEwrX5pzAyx++s/X9Z/NgZWwldYkz64ntAZRg62XA2eeK4m8OB14HNkL+CTRb+MsyWOMpHe7JVZ6Sxj7FSnziEGrR2gMC5cMMpGb7NhJOTa1yu+e44gprmTZEao3mhXsfDIJjcJGEhCV0Rwohm+2yRcWvt3JbCX0Oyt/4rXb6RfgQ/uQVRASNl9R067Tl9IK/DpyiiDUp9hgcGZuL0glop11JTlwXkNv2IstRwsJShcSFLmNnbwzF5zdqrfuE4JcapLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zChK5FGBOUJfCTT6xRa7OgwqFQCxorvdwBggJWX+/o=;
 b=Gb7PrmB3Tqbdy1kDRdukDL+s0WmfBMpPBb27+VRHmdQ6mplsHyNFSRh9uWfzoud4BUHZNBIy1BoNtV4jRPPxJHH+0AaZAxSMKOnjvxwitVA1CSHoLfX/1HK+MV0mEtKirS/dD3B1Dxf8z2vQlbkmTxGmGomREo/cXdYOyZrnhKPd+YrUjkMnKDK+xXsxCyYr68y8d31UH49Co1YWCQGwXOQzIHCMHnS0xwye0xIQfwiTv//Bz9CfiS4VouhaekNkWq/2sRMuF240rEJgrnXeJJ0daTQnStB9tniKHcsSbrKAi9fFnH6e8+uuEcJYBFSVGGJ3ns1Gi9d6wX7M41cXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4681.namprd11.prod.outlook.com (2603:10b6:303:57::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 19:19:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 19:19:18 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/doc/rfc: Introduce the merge plan for the Xe driver.
Date: Wed, 19 Apr 2023 15:19:13 -0400
Message-ID: <20230419191913.158807-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418133133.80434-1-rodrigo.vivi@intel.com>
References: <20230418133133.80434-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0d24df-90df-4ece-277c-08db410af8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKRg7030dTnbKnVSCuWMIoB0UHO3sXZCbH2K6mfDIGeobWYWHGmhqAMpRBmsk7E43SYSbeEcvZofpGh3IvIDu3LI28XwZefEUsiplv/VAG6vDS0Uoa3yDVQcU0z8Pf8aEktTZDsNYvtOpem05H3+JkLfkSbw78DLmPFX67I8+kfxYBhR0PbV7ypV3hlwIdKF8RXcE7g7SbAr6UD8dlNr74aL/NGxjQImT0ge4+J9Ui3iLQzNG4friNz/X6CZ2jIrqyYcHJNoHDYWVF9HASqwvPYg7uVM+Cp7GCEKrAOMWedq3s6VbRK1nddutuTAyedklS4/0TzMhFbxDI3Bsbq8N4bg4IhDesPmnH0iYL6IhDoS2MZiGbILzXwQlv0mWJR4tVnaHO1j6D5dnsztz6UJdCAYNfjS1fKKp40Rdt7b24JgemIFauHTayn5giO47/HOlFu35RsQBMDwUN29W4UHikzXHGaAYF8A3dVC4ms9tnmMJojWG7JxeQFgNn2vpOcvxMZbmH+L4PGaVrBaMY4Aaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(66899021)(86362001)(36756003)(5660300002)(38100700002)(30864003)(44832011)(2906002)(8936002)(82960400001)(66556008)(4326008)(66946007)(66476007)(41300700001)(8676002)(6486002)(966005)(66574015)(83380400001)(6506007)(1076003)(478600001)(26005)(316002)(54906003)(6666004)(6512007)(186003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzF0Z1NLbTd0Y0ZncHZkbVVHRUZYVHhhNHpVajdGZTlUVjk1UDNZN3k1UUFW?=
 =?utf-8?B?S2grY1g1WWo2Tmdycm1vVTU0dlZ6SWtMUEkxZUZKaGU0ZkplL3lxakRsd212?=
 =?utf-8?B?QXRiRVh1M1RZenZsSXpHdER2eTRkRFBpZG1RdmVmQXBVZnFxakp2VTFoUWxL?=
 =?utf-8?B?YzFFb0R2ejNEQ1p5VGxwK2taSHlYOStKcDVUSFBzOVZma3RuMGU0SEdhbHNy?=
 =?utf-8?B?TVM3dFpkeGl5VWR6SFo2VURYWElDNmlwSXVGTktIVmg1QmNJWDNRcHAvOTZq?=
 =?utf-8?B?WHNjb0dYNEp0WHZzQmpUQWRZQkZGUFZqUE1ZZ0pNdkl0dUZPL2pPL0pmNWky?=
 =?utf-8?B?Ynh3WGdoUjhlZW9aZjloWS9uWmJ3U281R29NaVZDUzh5bUx1TzFpT2xOeDYv?=
 =?utf-8?B?emtSTmZsM3pBV3JwcE1KSlFqUG1TWTVIcmF5RkdQMGw1VTZYeU85Y3R3ZVl2?=
 =?utf-8?B?YTBTZjVGNmUzSlM5QW10VEdGcWg5dUdhSVAzUEJFUHdyMHBuSjRKelMwaVN3?=
 =?utf-8?B?QysrSDdseWwvcWNWM0twVkN3ZUczWjFsTGZXNVhCdEZLWGNVZEU1alJxZ3B2?=
 =?utf-8?B?UmlDLy9ZVUE0Tkh6a3V5OUx5MjhMVTJmNE11L0Uyc2pCMmw0OTVFdzFzTEtx?=
 =?utf-8?B?K3BwTnRlWXhHcmc0dHJkb3lqYWltUWRaN2VsOE9pajd0cVdDbEpCeStYajl5?=
 =?utf-8?B?bmp0L1gxbkF1QjNTUlpBdGZSSnZrSEZtZkJ1N1NkbXhsRkNpZTBrRTZzZFdN?=
 =?utf-8?B?MGFrNE5VMXZnZG1KMy9XWGdQdGhiQkdyeHgzRHdha0JNOEpBaHdGVVpidXFK?=
 =?utf-8?B?S3hQbmJIYXZyZys1NTRhbis4cXNXSSsrVGdZWEdFUVByU3hhQnpGWXZpSVg0?=
 =?utf-8?B?c04xdkJZNlM4NlgyeXRYaS9nNlRjbk92b2JqbXM4VjVYVnBCd3U3amIrUHox?=
 =?utf-8?B?N0lSZTJIRTBOOS9OSk8xNExTRS9hb0xYNUFZSzJxTjE4ZUEyYVRES0k2dkoz?=
 =?utf-8?B?U2V4SHUrZjJoQ2crQ3FDOFJKNC9aeGJCT05zMlhGSFhwaExidExub0Z3VFVW?=
 =?utf-8?B?b2ZkRGZBaXVNWnladnhud2VFMDVHUUxsazFpNHo0NEN5UFhoYnVYVnBPUHcv?=
 =?utf-8?B?cEpXUjVzZGo2TjdqVDJPRXZUdkNYWlZHL2xrU0JqYTI3bXRMczZaYW8zd2xp?=
 =?utf-8?B?OVNFb3RNeGcvYmg1elhlQlFlRHBsOWo5WXZnRFdDTmdSdjh1THBRU0Fnek1q?=
 =?utf-8?B?VzBlTndWbUUrUnF4WVJMdkxXcWNhRi92S0cwV1Jzc1ZrUWJKRm9jMC9tQU5r?=
 =?utf-8?B?U1ZzbzA2L3lNdW5IdXdPSlIyYkxUYzF2REtzMXVPNFV5QnlOdEpuUEhoSEU4?=
 =?utf-8?B?aHRsaUxGZHFFd3Z3WUE4bkdjRkVHVWZtb1grT3FqQ01HWXNQa3dVb2NnMXFH?=
 =?utf-8?B?UXVENS82MFlzS3JHVmNSR1ZTckJwQmlkTXM1NE1YQjdzUlVSdjRyeEdXMW8x?=
 =?utf-8?B?ZHk4WE5mamllMEc1WG9ONWxadmIrODBuQWozdG5PZkhvT2k4R2gvcGEwUXk1?=
 =?utf-8?B?UzdzL2ZSS09MUVd4aE51WnZYbnZrenNuNzB0VEdKVDhxaDkyRExaMWVWY1J4?=
 =?utf-8?B?UHNRRlg5amMzejhEVmJWWm9DQ2pXV1NEOG92M281cUNQTkF5Q0RySW5pelo2?=
 =?utf-8?B?d3NqdGs1ZkFoOXc1dzVEaVVrakZ1QkdkZmNBRlV5Smd2RHNzOVJmblFuTTlQ?=
 =?utf-8?B?RElxQWF1QU1kMldCMkRLYnBwOXhKMGlFbEdUQ0lWQlUxUXNyRGk2WWNnMkRn?=
 =?utf-8?B?L014b3dXOTFBeGVXKzlZYkVQY01QYk5WRHp1V3FoWm5Xa3JBR2hTMzdWYk1E?=
 =?utf-8?B?emEzZ0JXZU1VWk12SmJSQ05oYnFoYTFZVlorQ0FNQVUySUk4TFhQL3dVbUd5?=
 =?utf-8?B?ME1iQjN5Zzd2aG5LUktReE14QitzUVhTR0FQelFHVVdoRVlwVVBFM3RhQmxq?=
 =?utf-8?B?V1E2TjllWTliSjhCUGlLWlNqMDlXNC9tRGtJSDVsS2k5eTNEQ1dRd1lmWVJz?=
 =?utf-8?B?eTY1ZGFUUE12dkx1OVFpYnpyREpsSGRzN2VJZjBuNzJqSk1XMmg4WUs4NzVN?=
 =?utf-8?Q?C7cdHp4QaFWr9S4KRjsH4eZtQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0d24df-90df-4ece-277c-08db410af8d7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:19:18.7239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOSN9EBSQg2JKYeyghR/ttexQ5mMoeZ+N0fCQPMc7dzxSnUOzJozqZZxZqVL9DXOXRMD32MGa+XquBv8E5pFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4681
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Luis Strano <luis.strano@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let’s establish a merge plan for Xe, by writing down clear pre-merge goals, in
order to avoid unnecessary delays.

This initial document starts with a TODO list containing items with clear and
measurable key results. Xe’s initial pull request should only be sent to
dri-devel after all the items are clearly resolved.

Since many of them involve some level of a community consensus, in many cases,
the consensus will be reached in follow-up patches to this document with more
details of the API or helpers that will be developed or modified.

Besides of the items that are highlighted in this document, it is important
to highlight that Oded, has been volunteered to give the overall ack on Xe
driver as the way to confirm that it looks good for upstream.

v2: Incorporated Daniel's feedback:
    - Do not make long-running compute a blocker.
    - Add a mention to drm-exec that that ties to vm_bind and long-running
      compute jobs. Then I also added GPUVA since I recently noticed that this
      ties also to the work Matt is doing on that front.
    - Added the devcoredump section.
    - Add the mention to Oded being volunteered for the overall ack.

v3: Reword a bit the Async VM_BIND to incorporate Daniel's feedback on ensuring
    the async vmbind consensus explicitly include Mesa, besides other kernel
    drivers.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Luis Strano <luis.strano@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/index.rst |   4 +
 Documentation/gpu/rfc/xe.rst    | 235 ++++++++++++++++++++++++++++++++
 2 files changed, 239 insertions(+)
 create mode 100644 Documentation/gpu/rfc/xe.rst

diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 476719771eef..e4f7b005138d 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -31,3 +31,7 @@ host such documentation:
 .. toctree::
 
     i915_vm_bind.rst
+
+.. toctree::
+
+   xe.rst
diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
new file mode 100644
index 000000000000..2516fe141db6
--- /dev/null
+++ b/Documentation/gpu/rfc/xe.rst
@@ -0,0 +1,235 @@
+==========================
+Xe – Merge Acceptance Plan
+==========================
+Xe is a new driver for Intel GPUs that supports both integrated and
+discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
+
+This document aims to establish a merge plan for the Xe, by writing down clear
+pre-merge goals, in order to avoid unnecessary delays.
+
+Xe – Overview
+=============
+The main motivation of Xe is to have a fresh base to work from that is
+unencumbered by older platforms, whilst also taking the opportunity to
+rearchitect our driver to increase sharing across the drm subsystem, both
+leveraging and allowing us to contribute more towards other shared components
+like TTM and drm/scheduler.
+
+This is also an opportunity to start from the beginning with a clean uAPI that is
+extensible by design and already aligned with the modern userspace needs. For
+this reason, the memory model is solely based on GPU Virtual Address space
+bind/unbind (‘VM_BIND’) of GEM buffer objects (BOs) and execution only supporting
+explicit synchronization. With persistent mapping across the execution, the
+userspace does not need to provide a list of all required mappings during each
+submission.
+
+The new driver leverages a lot from i915. As for display, the intent is to share
+the display code with the i915 driver so that there is maximum reuse there.
+
+As for the power management area, the goal is to have a much-simplified support
+for the system suspend states (S-states), PCI device suspend states (D-states),
+GPU/Render suspend states (R-states) and frequency management. It should leverage
+as much as possible all the existent PCI-subsystem infrastructure (pm and
+runtime_pm) and underlying firmware components such PCODE and GuC for the power
+states and frequency decisions.
+
+Repository:
+
+https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
+
+Xe – Platforms
+==============
+Currently, Xe is already functional and has experimental support for multiple
+platforms starting from Tiger Lake, with initial support in userspace implemented
+in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in NEO
+(for OpenCL and Level0).
+
+During a transition period, platforms will be supported by both Xe and i915.
+However, the force_probe mechanism existent in both drivers will allow only one
+official and by-default probe at a given time.
+
+For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe instead of
+i915, the following set of parameters need to be used:
+
+```
+i915.force_probe=!5690 xe.force_probe=5690
+```
+
+In both drivers, the ‘.require_force_probe’ protection forces the user to use the
+force_probe parameter while the driver is under development. This protection is
+only removed when the support for the platform and the uAPI are stable. Stability
+which needs to be demonstrated by CI results.
+
+In order to avoid user space regressions, i915 will continue to support all the
+current platforms that are already out of this protection. Xe support will be
+forever experimental and dependent on the usage of force_probe for these
+platforms.
+
+When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
+
+Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
+the uAPI are expected while the driver is behind these protections. STAGING will
+be removed when the driver uAPI gets to a mature state where we can guarantee the
+‘no regression’ rule. Then force_probe will be lifted only for future platforms
+that will be productized with Xe driver, but not with i915.
+
+Xe – Pre-Merge Goals
+====================
+
+Drm_scheduler
+-------------
+Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
+drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
+resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
+not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
+drm_sched_entity.
+
+Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
+some consensus needs to be reached between Xe and other community drivers that
+could also benefit from this work, for coupling FW based/assisted submission such
+as the ARM’s new Mali GPU driver, and others.
+
+As a key measurable result, the patch series introducing Xe itself shall not
+depend on any other patch touching drm_scheduler itself that was not yet merged
+through drm-misc. This, by itself, already includes the reach of an agreement for
+uniform 1 to 1 relationship implementation / usage across drivers.
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
+
+DRM_VM_BIND
+-----------
+Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
+fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
+development of a common new drm_infrastructure. However, the Xe team needs to
+engage with the community to explore the options of a common API.
+
+As a key measurable result, the DRM_VM_BIND needs to be documented in this file
+below, or this entire block deleted if the consensus is for independent drivers
+vm_bind ioctls.
+
+Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
+Xe merged, it is mandatory to enforce the overall locking scheme for all major
+structs and list (so vm and vma). So, a consensus is needed, and possibly some
+common helpers. If helpers are needed, they should be also documented in this
+document.
+
+ASYNC VM_BIND
+-------------
+Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
+Xe merged, it is mandatory to have a consensus with other drivers and Mesa.
+It needs to be clear how to handle async VM_BIND and interactions with userspace
+memory fences. Ideally with helper support so people don't get it wrong in all
+possible ways.
+
+As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
+various flavors, error handling and a sample API should be documented here or in
+a separate document pointed to by this document.
+
+Userptr integration and vm_bind
+-------------------------------
+Different drivers implement different ways of dealing with execution of userptr.
+With multiple drivers currently introducing support to VM_BIND, the goal is to
+aim for a DRM consensus on what’s the best way to have that support. To some
+extent this is already getting addressed itself with the GPUVA where likely the
+userptr will be a GPUVA with a NULL GEM call VM bind directly on the userptr.
+However, there are more aspects around the rules for that and the usage of
+mmu_notifiers, locking and other aspects.
+
+This task here has the goal of introducing a documentation of the basic rules.
+
+The documentation *needs* to first live in this document (API session below) and
+then moved to another more specific document or at Xe level or at DRM level.
+
+Documentation should include:
+
+ * The userptr part of the VM_BIND api.
+
+ * Locking, including the page-faulting case.
+
+ * O(1) complexity under VM_BIND.
+
+Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
+the second driver supporting VM_BIND+userptr appears. Details to be defined when
+the time comes.
+
+Long running compute: minimal data structure/scaffolding
+--------------------------------------------------------
+The generic scheduler code needs to include the handling of endless compute
+contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
+drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
+completion fence.
+
+The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
+this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
+drm driver, including Xe, could re-use and add their own individual needs on top
+in a next stage. However, this should not block the initial merge.
+
+This is a non-blocker item since the driver without the support for the long
+running compute enabled is not a showstopper.
+
+Display integration with i915
+-----------------------------
+In order to share the display code with the i915 driver so that there is maximum
+reuse, the i915/display/ code is built twice, once for i915.ko and then for
+xe.ko. Currently, the i915/display code in Xe tree is polluted with many 'ifdefs'
+depending on the build target. The goal is to refactor both Xe and i915/display
+code simultaneously in order to get a clean result before they land upstream, so
+that display can already be part of the initial pull request towards drm-next.
+
+However, display code should not gate the acceptance of Xe in upstream. Xe
+patches will be refactored in a way that display code can be removed, if needed,
+from the first pull request of Xe towards drm-next. The expectation is that when
+both drivers are part of the drm-tip, the introduction of cleaner patches will be
+easier and speed up.
+
+Drm_exec
+--------
+Helper to make dma_resv locking for a big number of buffers is getting removed in
+the drm_exec series proposed in https://patchwork.freedesktop.org/patch/524376/
+If that happens, Xe needs to change and incorporate the changes in the driver.
+The goal is to engage with the Community to understand if the best approach is to
+move that to the drivers that are using it or if we should keep the helpers in
+place waiting for Xe to get merged.
+
+This item ties into the GPUVA, VM_BIND, and even long-running compute support.
+
+As a key measurable result, we need to have a community consensus documented in
+this document and the Xe driver prepared for the changes, if necessary.
+
+Dev_coredump
+------------
+
+Xe needs to align with other drivers on the way that the error states are
+dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
+infrastructure to report error states, since it produces a standardized way
+by exposing a virtual and temporary /sys/class/devcoredump device.
+
+As the key measurable result, Xe driver needs to provide GPU snapshots captured
+at hang time through devcoredump, but without depending on any core modification
+of devcoredump infrastructure itself.
+
+Later, when we are in-tree, the goal is to collaborate with devcoredump
+infrastructure with overall possible improvements, like multiple file support
+for better organization of the dumps, snapshot support, dmesg extra print,
+and whatever may make sense and help the overall infrastructure.
+
+Xe – uAPI high level overview
+=============================
+
+...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
-- 
2.39.2

