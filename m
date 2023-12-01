Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D9E80027D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 05:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F02010E7B4;
	Fri,  1 Dec 2023 04:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A8810E7B4;
 Fri,  1 Dec 2023 04:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701404544; x=1732940544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AQ2dZLayHUDP0jH1AB6YrGRkoM0DmGZNkU/JdgAa6bM=;
 b=XcxyvPD3nd/RdJZ43rZ8ieeGrbnWGjfdTthlMATTLyl95m+nnIdzSULS
 Xht62JePCwMRerXmZ3nv5MUYj6WCmyDNjPY1EpdlIBkWVd/C07cXHOXRt
 fy0eqqTRJ83EJRl6aY6ZFUyUlZxGJ75hROBH9tpPEycZWAJ1KhX+ptugC
 2SPuhwve4IJvZk7O9EjqeuLFyyu812kn5FDGkMmBowSCCl9GvSt6sHZRS
 EomM/xV837KKDJ+vTcHktlhNsmIDTCVOvHJsMyx3ZZlMooXXX9vcF0cNG
 RIITe/bUhh0BE4q/Uh3uyR4Oruator9INxGK1R2ckiok98uy1e+SYVNUB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="443468"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="443468"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 20:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1101170198"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="1101170198"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 20:22:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 20:22:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcgrNT7VS1jJk1hC4Rk030ZKLVx5ABI0wA7HIT77u+2fwAsRohxUk+Ov4jBSvJyGohd9FFRxMEEgJEaqhLQ7n+XsPbqql6plF7G4lpbQDm3ULlZljtlNC5H2bz5gIugTWrloBIfRWWmrHI4XqO0s1PcdvFHc+O9amEGTxuuB0FwBkjgcVXSwhe7IJonFIiLTTc+Pc5A3F35lxtwrMYESfjEb0JwI7NE0XTS4afZ+7JbZMjShzNCyQVgrR0Up2lOFhHAQrQLCNVwHPri1dwWgcgUAAqlU4GFN0kdbNFXnt+FHZza1QzHTHqxYMgkYLrclfacDBLkiFEZGuC5pGgDFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUud/mk0v+CgWs0kLubzdEXJrSWMf2r4xCW6oP6l/tI=;
 b=PhoXYbLsh3eOAE2m8MtUjvGagl6JrcpuPbyhxFvZ+kHh2b8PW+LzqiD3TIlXRm0o7DddwMyEm8jafPOMZNuUEGNH+SKC/iTuH1m0LEiTJS/wLoaMQ5/4MRgXkdvnubPazZVwMF0beN0Qq3Bk5UfNOUVh9gZ3Y1jad8/SCdt9gQUZO0FT/1Acc6OZYJQSiWVEn1kskhPZ243H+kpZwO1qk1w2/pB4egDGO+T9kqDxvueFuAZ2nf7Oy2rX9mcJYVvuyZLcv3xaV/kt+VKcCqSvBI/pVf5HmKM/iJilxuE3lepD+5ASvbMxEUw4n8Zv2qHvoMDmJAJHtKDzMxV8B4uv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 04:22:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 04:22:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>, <christian.koenig@amd.com>,
 <lina@asahilina.net>, <dakr@redhat.com>, <boris.brezillon@collabora.com>,
 <bagasdotme@gmail.com>, <alexdeucher@gmail.com>
Subject: [PATCH 4/5] drm/doc/rfc: Move userptr integration and vm_bind to the
 'completed' section
Date: Thu, 30 Nov 2023 23:21:54 -0500
Message-ID: <20231201042158.80009-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201042158.80009-1-rodrigo.vivi@intel.com>
References: <20231201042158.80009-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: ff623bf7-67a9-41cb-15df-08dbf2251bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4HrO1m2XHEZUfDAWRU/Qxf3E/IMw7PFG7ZmH4mF9XauUNjU5Vk6LqRIG7fCyMZbe5pyXm1mWSmJAFTcnttZwp8PQwSL2YxCdSrNOGPLbhXytV0ExL1KnkJ3D8J9orjeJFhFO02yFNcObJDBQPKZodoMvo5WchjLmnIIOxKetOFYmDmOx1bluu1NEMMTKEQO9sPlx4Du6aja7uY7NYguwbI3jHoEVcovTo6ieQ3cRnZ0olvFIeqwbb8FOvd9OQzxhwrsRhabxcpO8mH1mv9hwCIOuOL1SYBRGMo3j8WOokeW7hF+ZPEmb3zPofV7Kwg29D0V0nnxVYpyOTHbYHKYb15tHauPJxhJSlm+IqvMTJhQ+P/vC21Vuu8ldoPlKXyJO8+IocuDB6BWuYlkTuMF2SbmVICZ7pCGU7YRqR6s+aaaRMsLOzxlh3tlRNVoMIgRMmf6tKOo6Cce8eXxpy4qfIt/OWtFimDgVjqqsbqZBz/ADNoPoF7JN6Q9uMmFrEP17IqG0fn8IhjCrQnztZZ1pg4t/d2dH5eSJThoyUv+a/ppvKiWt2MJex+Kqdm/pAj3w/Q6JFLpNsWX1qklA8L6w1mLZz3vI9fzt6KhlnQU0xWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6512007)(6506007)(1076003)(107886003)(44832011)(6666004)(2616005)(83380400001)(478600001)(4326008)(41300700001)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(316002)(66556008)(66476007)(66946007)(36756003)(38100700002)(82960400001)(86362001)(66899024)(921008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFJGdnpSQll3Y2FUWllBZ3ZZWldiSjBnWndIbThndVVRMHUwdUkxNGtmbkM4?=
 =?utf-8?B?YWJ0ZTdDdnUrc29za1Z0c3YzOFBHb1RrRGNxeXA2bXdtVGRnSFEwTjR1dTVz?=
 =?utf-8?B?ZEpCQmxUZkJnTmRsMWlFN0RaWUlRYWFwbkZhdlJBWkVPZG80Q05STlRpVjNh?=
 =?utf-8?B?R3ZzeHVadFk1czBFM0QrY3JEbFJqL3BPZ3QreldlV0c0eXBMTklKdWVRcU5D?=
 =?utf-8?B?aFVsanBhMk9HZnpjMkRaTCszQkh3Z0F1emlsVFFCQ2k1NTJNMUNodGJCUllC?=
 =?utf-8?B?NWw5ekJGMzEwamJHRnFMeURIckw4dUFDY3hCN2kwUVI0WVNESkZ5Y2IwVXBS?=
 =?utf-8?B?QUtTNFhYSjRnQXZ2d1B5dUwvZTlTeUMxV0xnYW1vVDJFTnMzaUdSVU1OQWRI?=
 =?utf-8?B?aHo3S3YxTlYrYTRidGZhVGVNSVlzNU5tS3pRbzNUM1EwT01BTVk0enZQbENY?=
 =?utf-8?B?NjBnb0kvM3Bqb0tDWmtHU2tLNDBXaW14b0VmYjlPaG9lRlBJWlVON01lRU5z?=
 =?utf-8?B?QnRjNE5uQXJUbGJmNnVPRnVYckcvZUxXMzl1Y29xYWRadlVFK3ZBeHRSVUsr?=
 =?utf-8?B?WFE5WVVvbVpWcXluVFY5ZTltdk5sWElGZW1qNVVoYy9YUkxUZGRjY1lROHFt?=
 =?utf-8?B?YmMveDVBSWxHUlZhWkNLdHdMNHZTS2lFM0JFdFJYZkliZTlsdXA5d05wMEE1?=
 =?utf-8?B?RC9BV25GOW1reG1LNFozUjJmNXpJb2tNc1dMSW9qcllPdlROcjU2VTVON0lJ?=
 =?utf-8?B?a1RoUlVGZDAzQTl2dEZHZE9xNnJxVHkzZE9NbExrU2RkKzQyMGlocUpXOWw0?=
 =?utf-8?B?NTBMSTBoaHpiL2NCT0tnM0wwS1J5LytnNjB4d1VGb1VqZnZhNHh0M0kxd2Ns?=
 =?utf-8?B?QTBJQnhIb1dySkhxZ0syTllLS0xkaDNROUtWMlRmSUxoeml6Rk5aclkwVW10?=
 =?utf-8?B?c3Y2Mm0vRTdzSE54ZHFwSmtDRjhUL3FhL1ZDUGNueEJPUS9hUVp5VWxYT0Z2?=
 =?utf-8?B?d2NZRS9hYU13WkdrUjlvZ3NFRzdCRm9McHkyaGZEQlVCU2ZPNU1heFFyMlVs?=
 =?utf-8?B?S25oemdRdWhsR3dsaE96OW5PSWZMdUNVZkJ1Vk5pQlAvemJVYjVWVmVSeE5I?=
 =?utf-8?B?WmpxZDVlZ2JwODhNK0Rmc2lvZnpEa0tjVmdsRnlBVDc2OEhIVFJIOGdUbmMz?=
 =?utf-8?B?a3B2T2hBb3NNTm93UHhnZGJDVjYwWXFkZS9uWC9UOWFSdWlBbkJVbms5YmJM?=
 =?utf-8?B?bTdTNm90QlpNQ3dUUC92Y0hWS3ZNVFM1L0phZStFaWx3NElvYVVxdTA3ZDNm?=
 =?utf-8?B?NlFZbzEvamV4NFdmNWlRd0wwSThCenNhM0NrQ2Rrc3MyclFkTnBRK3RnbHVu?=
 =?utf-8?B?Mm5XRlVCTjdHcFVzV0JxQzdvN0cvQlFTOGtRT25pdTcybXduNGZQWEJOa2RR?=
 =?utf-8?B?elRhL3NINnE5UlpZTW9RdWpiTUh1aVZJY3JSU2dVRmJPMW9sWUpGSDhhUFFn?=
 =?utf-8?B?TEZ0ek1qL0l4MW9mQjJYci9mUytHdmgzd1FBYUFLUW9UbmgrYzk1anNjWFpL?=
 =?utf-8?B?aFVWc0I5WjFjNGxrNzh1OHF3YmRwdHBrSU90NnI4MEg3TWlLTFh5RHhlTEtx?=
 =?utf-8?B?TjJZZ1lUQjJRNVNvWXRVckxYdTZubWluS0RXRzBuZzJxMmxDUHc3ZG90bzVi?=
 =?utf-8?B?WTBTQzg4NzNVRUthL3cwYmtzQndpaGZ4SDBjYmNrWmNEdzlndFk2Y1Bpc09D?=
 =?utf-8?B?M2M1UnNna05mRktmV01MRW5lOVhYNHI1bjR1MTNTanN0MFdOTU55RVpBUmF5?=
 =?utf-8?B?THEvTVFyNUtuSmIyQ1RyL3dyc3FPTEpnaFFhc0RVNDhVZERJaUxzQ09kQk5J?=
 =?utf-8?B?THNzUWZqY2tubVJYcklyc1ZsaWdyQWlRTGNOQll4SmFlU1VyZ1JyVHFJekVY?=
 =?utf-8?B?Y1RxLzVscWQ4a3Ficlk1L3oranUySUkvK3lMMzA0cHpIajQ0clVERlZKUUhF?=
 =?utf-8?B?UEdDcTJNSEE0eGkzN0liclR1SUpZWFZ4SHdrQlU0MkwrWU02UVcyb2MxdVpB?=
 =?utf-8?B?NnJRV0h6YWYwUGxBY1JvM1p5ZFpJOWlNZVVWUS9ZNk9mcGlRWmVkc2w4VEt5?=
 =?utf-8?B?TW1QcHBGNUZHOHBmVDVXSE51ejk1UzljRlRkcGZGUWUyWWVpK2dXVFQ0ai9G?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff623bf7-67a9-41cb-15df-08dbf2251bce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 04:22:19.9961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YVGRKqCgtrvHosUz5NB82Pua3pkfKJEJmcnmpYLZiHNPr7xGszJrJUv+W8gCwJsIs7pU6V6bh3WYEEbHdy4IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4666
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

The must-have part of the documentation was already added to the existing
/gpu/drm-vm-bind-async. The other extra discussion around GPUVM helpers
are currently active in the community. None of those discussion should
block Xe since documentation, specially around locking was completed in
a community consensus.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 64 ++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 87dd620aea59..cfff8a59a876 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -70,38 +70,6 @@ When the time comes for Xe, the protection will be lifted on Xe and kept in i915
 Xe – Pre-Merge Goals - Work-in-Progress
 =======================================
 
-Userptr integration and vm_bind
--------------------------------
-Different drivers implement different ways of dealing with execution of userptr.
-With multiple drivers currently introducing support to VM_BIND, the goal is to
-aim for a DRM consensus on what’s the best way to have that support. To some
-extent this is already getting addressed itself with the GPUVA where likely the
-userptr will be a GPUVA with a NULL GEM call VM bind directly on the userptr.
-However, there are more aspects around the rules for that and the usage of
-mmu_notifiers, locking and other aspects.
-
-This task here has the goal of introducing a documentation of the basic rules.
-
-The documentation *needs* to first live in this document (API session below) and
-then moved to another more specific document or at Xe level or at DRM level.
-
-Documentation should include:
-
- * The userptr part of the VM_BIND api.
-
- * Locking, including the page-faulting case.
-
- * O(1) complexity under VM_BIND.
-
-The document is now included in the drm documentation :doc:`here </gpu/drm-vm-bind-async>`.
-
-Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
-the second driver supporting VM_BIND+userptr appears. Details to be defined when
-the time comes.
-
-The DRM GPUVM helpers do not yet include the userptr parts, but discussions
-about implementing them are ongoing.
-
 Display integration with i915
 -----------------------------
 In order to share the display code with the i915 driver so that there is maximum
@@ -139,6 +107,38 @@ Xe – uAPI high level overview
 Xe – Pre-Merge Goals - Completed
 ================================
 
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
+The document is now included in the drm documentation :doc:`here </gpu/drm-vm-bind-async>`.
+
+Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
+the second driver supporting VM_BIND+userptr appears. Details to be defined when
+the time comes.
+
+The DRM GPUVM helpers do not yet include the userptr parts, but discussions
+about implementing them are ongoing.
+
 ASYNC VM_BIND
 -------------
 Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
-- 
2.43.0

