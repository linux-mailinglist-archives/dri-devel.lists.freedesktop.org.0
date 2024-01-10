Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD282A0B6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 20:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1410E7C9;
	Wed, 10 Jan 2024 19:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28E910E653;
 Wed, 10 Jan 2024 19:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704913478; x=1736449478;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yFkPl01a2VcGo42myLPc6SnQGx2fJGz48A0DokPOFBU=;
 b=KRmDoR4RbwaKQRMM1pIKrlAW6COMlTgpPLKkpGotTExofBDs7BZOWfe9
 Wxztl8BV3Oej7b42p/RO27QAElEQMPQcvzUWbp0ltuxfA46L7cu+nHHlP
 W6AdWWvHhVEsGIhh7FPrW5gjD4Rbu26WUJby3ovf5LiIVU0JhorPt6Jar
 GjRTUEOZYoTaqRv/XLJ4xHNiGJcAGiSrb905+hBAY8wnC5bYUvhD/mzhp
 iZ7YB3jsunCxgsTqUyhb38P4MlYYiB0F0ifkRxsVsvUGTnE6couVTevqj
 gzbml7LHlFKFpXhp1qjkea+m5IcZR1qrNq58zaZKq/faI1i0GKgRhSZuv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="429802301"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="429802301"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 11:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="731929408"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="731929408"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 11:04:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 11:04:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 11:04:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 11:04:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLzAPlOtS4pRCHceh6aBIEhykVstWSs1kPupBWEM+C/ZSSKNbtsqPlZCRvmcH8FB/FeFeczPN1JghD7qb7XU2fWAG3a3ZmfmJtiqlkmE4Rn/jom2zr3oU3cfBpsPOwlekR7qcv9QMUY9KVKtklcrHNISGXmWDpcPK1aWG00i+ydnUhuESuuWxMUsDMrRfbxvIQ1vqcwm0A5+uwDNkQ88edZyFNP/rZ2mARbBxTPrXuIbV7eXlEKQeaGYNAqZ5CudQw9cs33ZR/A+DBnnkmYpSHc8tuXzqJyo4AU8N9VnGhtuU426c1Ce//7GwXWhteWp2rFSX8Rkc0XeAAYtRwmhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1j7bbvKc/RhpfuNO6EnJxS/JKIXLhtgJeN2HHi2avQ=;
 b=YVPgJH6rb+WYmF9B0sePFabWX5KhhBMCcf7CqgU9TkxM5rawvcg4TDdV3Sk+j1P3n0sm7IVeSI61Wq2XZ8DzA0py0E9b10xYFD2CBd92wLd8nX2be4ApyWivx4yOXFotcs6xTCG3sQ55QGfm0aLbU0EkhBxzviPN/Qv5+kCcMuTNSydseyvfyMLzGU4FEIofFp7wPC/o7o6XKtFcjHdiewTLZv2Oro8CaxNLNfCwo4u08AwmeYWUrwIUVjArN+OPVlkJUSJwNsqGdGGv7vqtuo4BVrfKpLDIDI8Ry+aPdl5uoJm8iM34wJb+Lfqk8H0eku3lLqsG/lDNzIlzXy91EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 19:04:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 19:04:32 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc/rfc: Remove Xe's pre-merge plan
Date: Wed, 10 Jan 2024 14:04:27 -0500
Message-ID: <20240110190427.63095-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0038.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 4922c1c0-3974-481d-2a8b-08dc120efa8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17H4QPngVdIvnpO4pqmD0TetSqKf8qBKXKKHDqSI41oTOu2Cn8g6NHJEJTSzuRwecdyYjpWGv3vo9RzHsj4qQvkDMiH8hOx+ObAf83h5WIOK/njGkOAIj4qHaFa1udJdIDNDezQsCbmYEJxXqTeMrDjvaoZDZM/TlodaK7v+iiqmjXqQyPDkRB5R1DCJMHnBO/AokeAhmhxCnLreij+KpQHPKPcYnyH389XluXyGlrVwe+53IMSMfdamZERDc1GJeE6QyGfvxE1/LrX4Laos7USkyJyACuDbgG1AMwKi42VP33zy7y2OZvMGaYMhui1VcGiG3oQyYnrQC0y+g2EQhllr3lOOApqNlMAFOijvb6774M7a3DvEbc9vEsBpFv1R96q9ZahbQwB6zEvStEa8IJt0dXL7KKt+Cgtuc1nA54KSt22sPfNic/70tYXDn56v96iyKZMvWq6nEyliXNXnl/PZUSifXTG6Pe0Alz0SUIVPKycZ4j7WKW1pAaSAjQMcUk7HT8dh5Tgc/sejxZlnBhLUCO3Pp0LsizPEuP2tDj15vJ2NNkeCQxlsYMS8k4ZJFNDZIE2hiY4YxM6Em/OJnmwRQ2ymjKDuvcrnmtzUILA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(1800799012)(64100799003)(66899024)(2906002)(38100700002)(30864003)(5660300002)(82960400001)(86362001)(41300700001)(36756003)(6512007)(66574015)(54906003)(316002)(8676002)(8936002)(2616005)(26005)(66946007)(6486002)(1076003)(6916009)(66476007)(478600001)(966005)(83380400001)(6666004)(6506007)(66556008)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0lKYm1hdHNwRE5tZ080VGlkWU1KWHJxNFZaMlVXRGpZbDRhS1lUcnZnaXdO?=
 =?utf-8?B?TnBJay9JdElXTXJ6T2lmc1M3cHBrMVhDOVdicWVGVklGRWp2aC83RWgyc2cv?=
 =?utf-8?B?RHcyMlAyL3NheG9wZGxlcXViUHRjWDBEMllOeXFGaHJQbDM5Q0F4Y0Q2SHQw?=
 =?utf-8?B?SjFOZHRRdmtCNXI3SkVURU8yakJrUURFZGhpclVxUXdBVmN5S1ByRUhnZHpG?=
 =?utf-8?B?M0Y1ZmwzdEJ1cklwRkI3WWhJNkN2N1VWbzZpTVkvZEMyMGozVUNmVk5vbVQ1?=
 =?utf-8?B?ZHp2SjVwTWwwM1ZiUlB6RCt6Y2lpcGVGREluMlpWWEdYWE52L2V6Q3p5c2Vk?=
 =?utf-8?B?bHAwSnYyWTNjdWd5YjVDRC92SXlwSmhlLzNSRnpFajBUUlFjYml0YVNFL0pB?=
 =?utf-8?B?OVNPWFpuVzV6ZGdPdHhMZHJMN0ZnWFlXcENocXh0S1dJK0drR2NrMEIvQXhS?=
 =?utf-8?B?eEZkQXgycGlQTFQzN1lOeTRIQ2NOYXdrQmFkM2lYMENQWndWRHRBZTNjMWsr?=
 =?utf-8?B?VGVYR3VNTkFUVFpNYWx1OXFHZjRkVDcrUDRteUxYRUFJUjR4dlBxWWNETFd1?=
 =?utf-8?B?dXkyb2ExOHZpRnlVTFE3SU1MOVV0czJDZUhENGNRd0czK0RhcEx2UlgyY1JK?=
 =?utf-8?B?UU5vSmRGOVU5ZVMzOTR5cVlCWC9CWFgzUUNENDZ0SzJWRDZzL0xOdFRCcUVQ?=
 =?utf-8?B?S3BFN2VoSGUwdnp2cWlxTm9ENDRzVEd1VnFYS2dPU0VzMkNXWThqZ0haenhi?=
 =?utf-8?B?UkdIWEV6bVh3dmZiUktHQ3EwbkVHTUNHOGtzRlBjTlFVbCszSG5saFNYOFU4?=
 =?utf-8?B?YlNIc08xUE5UbXEraDRKWjQycEN4SVM0UVNXS05JMUt3WkRlN0c5Z2Vyc0NV?=
 =?utf-8?B?YVVxcnFSYnNVdkF1WHBVLy9FNU1lNUJBSXNKN2QvK2UvSW1TQmx4V25oNUR0?=
 =?utf-8?B?MlNFNTVFQ2RxakxGNjVDc2lVaXJBVm41dmdYbEZBYXRXMnhsV0Z5bjdKZVA3?=
 =?utf-8?B?WGVvejl2WE9uTTFLeWJRdkI1RTk5RXh6RkFxUEhiUVN2ci93NW5aWmozTFo1?=
 =?utf-8?B?dnpRY3FPYzY5SnBybVpVNkYyNkxJUW4xaTBIenVEK2pMNUx4OVZ2Q2E2ZUtQ?=
 =?utf-8?B?Y2JzTEhnM2Y4OFBUR0I4NjdLcVh4Zm9Jb2d4RlhzN2JIbWRhQmwxbnNlR29u?=
 =?utf-8?B?UVhlbWZad282ZEhjemlBYmd2c0VjcHFYOWtBU29vTTkyTU52NXVCZXJWZEtB?=
 =?utf-8?B?Q3p5V1h4R2ZjUTBxbFQwU2hrQmpKd0c1L2lHNnlPSDhHRU9KbnpvVXY4ODlh?=
 =?utf-8?B?aGxmK01wRGh2cld0Yk03cjliaUM2cEpJbGcwZlJPUW5sN0RySlpYZWRLRnU1?=
 =?utf-8?B?bUY4WE4xOUVpeHZNclh3K29xQ0FYd2lIbUV3YzliSlFIUS9nQmZYUzMxVi9v?=
 =?utf-8?B?Q21hbGk3Ti9IUTRSSHl1OHJWdGJ5ekMyMDhHNnRBSzJ6YXhkd1FhTXJUb2hQ?=
 =?utf-8?B?Q0tic1VzbFZpS1RXdnM2TDRsakc1blNFcmgzQ29oR01uU2lyWEJJT2laUEo5?=
 =?utf-8?B?N2FSdnRrOTVwWXNhZ1ZGU3VTVFlOUVpBcllSL2pUdUZMeVUybGU5dUZZNTdt?=
 =?utf-8?B?VEN3NCtwSjJEQW4yWkx0TzV5VzBNNjNoZTIxQjZoWXBFeTNZOTlyaU0zcWhp?=
 =?utf-8?B?WEJNTEpDaXhrWWYranpvOTRyeERWQmd2dGIwdlY2dE5ydnhlYW5FSUlpQ0Nh?=
 =?utf-8?B?K0d5RUtGK21ONW9DV2VMSTNKc3prZkNrSi96aHBjNEQwUENmcHlzcE5MdDVI?=
 =?utf-8?B?bERuUm1jQ0JjR3JnRytrUWxjcGtQUWllTCsyL1VPajk2YkpSbW1FaytWY0Z4?=
 =?utf-8?B?eDJvZWIzVW80ZExLRXN2elkrTy9wUmZiajRtWEF5VW9zR1RIdGZ1Tktnb21P?=
 =?utf-8?B?L0hPSCtsWjFxenk3anZlQkxKVjZNOXpGLzFSc3JQNmxaM0E0TGVjcGxCT2JI?=
 =?utf-8?B?eGNYNngrb3p4Z3dDT0p3SVZrUlkyN0N6RjVzWFcyVTRDRHBOYmtGL3owYjdS?=
 =?utf-8?B?K04wczJpTlFHU04wS3Bma3RIb0gwWHZkS1krbGZEUUZjSVEzb1E3TlVDNTNo?=
 =?utf-8?B?Q2NDbmNOczFHbG1HdTBCQk1ldHNUOU41RUoyMklTanBGSXBOU1c0T3ZJb2JD?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4922c1c0-3974-481d-2a8b-08dc120efa8c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 19:04:32.4733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNelCD7MpZNJzMjEbav4/HecQIDQddSfGxn4rpWERgdFscp0gaMhEGVjgEtIiwTUUuN0MkhS9rcVc59ekZel8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The last TODO item here that was not marked as done was
the display portion, which came along with the pull-request.

So, now that Xe is part of drm-next and it includes the
display portion, let's entirely kill this RFC here.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 234 -----------------------------------
 1 file changed, 234 deletions(-)
 delete mode 100644 Documentation/gpu/rfc/xe.rst

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
deleted file mode 100644
index 97cf87578f97..000000000000
--- a/Documentation/gpu/rfc/xe.rst
+++ /dev/null
@@ -1,234 +0,0 @@
-==========================
-Xe – Merge Acceptance Plan
-==========================
-Xe is a new driver for Intel GPUs that supports both integrated and
-discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
-
-This document aims to establish a merge plan for the Xe, by writing down clear
-pre-merge goals, in order to avoid unnecessary delays.
-
-Xe – Overview
-=============
-The main motivation of Xe is to have a fresh base to work from that is
-unencumbered by older platforms, whilst also taking the opportunity to
-rearchitect our driver to increase sharing across the drm subsystem, both
-leveraging and allowing us to contribute more towards other shared components
-like TTM and drm/scheduler.
-
-This is also an opportunity to start from the beginning with a clean uAPI that is
-extensible by design and already aligned with the modern userspace needs. For
-this reason, the memory model is solely based on GPU Virtual Address space
-bind/unbind (‘VM_BIND’) of GEM buffer objects (BOs) and execution only supporting
-explicit synchronization. With persistent mapping across the execution, the
-userspace does not need to provide a list of all required mappings during each
-submission.
-
-The new driver leverages a lot from i915. As for display, the intent is to share
-the display code with the i915 driver so that there is maximum reuse there.
-
-As for the power management area, the goal is to have a much-simplified support
-for the system suspend states (S-states), PCI device suspend states (D-states),
-GPU/Render suspend states (R-states) and frequency management. It should leverage
-as much as possible all the existent PCI-subsystem infrastructure (pm and
-runtime_pm) and underlying firmware components such PCODE and GuC for the power
-states and frequency decisions.
-
-Repository:
-
-https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
-
-Xe – Platforms
-==============
-Currently, Xe is already functional and has experimental support for multiple
-platforms starting from Tiger Lake, with initial support in userspace implemented
-in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in NEO
-(for OpenCL and Level0).
-
-During a transition period, platforms will be supported by both Xe and i915.
-However, the force_probe mechanism existent in both drivers will allow only one
-official and by-default probe at a given time.
-
-For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe instead of
-i915, the following set of parameters need to be used:
-
-```
-i915.force_probe=!5690 xe.force_probe=5690
-```
-
-In both drivers, the ‘.require_force_probe’ protection forces the user to use the
-force_probe parameter while the driver is under development. This protection is
-only removed when the support for the platform and the uAPI are stable. Stability
-which needs to be demonstrated by CI results.
-
-In order to avoid user space regressions, i915 will continue to support all the
-current platforms that are already out of this protection. Xe support will be
-forever experimental and dependent on the usage of force_probe for these
-platforms.
-
-When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
-
-Xe – Pre-Merge Goals - Work-in-Progress
-=======================================
-
-Display integration with i915
------------------------------
-In order to share the display code with the i915 driver so that there is maximum
-reuse, the i915/display/ code is built twice, once for i915.ko and then for
-xe.ko. Currently, the i915/display code in Xe tree is polluted with many 'ifdefs'
-depending on the build target. The goal is to refactor both Xe and i915/display
-code simultaneously in order to get a clean result before they land upstream, so
-that display can already be part of the initial pull request towards drm-next.
-
-However, display code should not gate the acceptance of Xe in upstream. Xe
-patches will be refactored in a way that display code can be removed, if needed,
-from the first pull request of Xe towards drm-next. The expectation is that when
-both drivers are part of the drm-tip, the introduction of cleaner patches will be
-easier and speed up.
-
-Xe – uAPI high level overview
-=============================
-
-...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
-
-Xe – Pre-Merge Goals - Completed
-================================
-
-Drm_exec
---------
-Helper to make dma_resv locking for a big number of buffers is getting removed in
-the drm_exec series proposed in https://patchwork.freedesktop.org/patch/524376/
-If that happens, Xe needs to change and incorporate the changes in the driver.
-The goal is to engage with the Community to understand if the best approach is to
-move that to the drivers that are using it or if we should keep the helpers in
-place waiting for Xe to get merged.
-
-This item ties into the GPUVA, VM_BIND, and even long-running compute support.
-
-As a key measurable result, we need to have a community consensus documented in
-this document and the Xe driver prepared for the changes, if necessary.
-
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
-ASYNC VM_BIND
--------------
-Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
-Xe merged, it is mandatory to have a consensus with other drivers and Mesa.
-It needs to be clear how to handle async VM_BIND and interactions with userspace
-memory fences. Ideally with helper support so people don't get it wrong in all
-possible ways.
-
-As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
-various flavors, error handling and sample API suggestions are documented in
-:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
-
-Drm_scheduler
--------------
-Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
-drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
-resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
-not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
-drm_sched_entity.
-
-Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
-some consensus needs to be reached between Xe and other community drivers that
-could also benefit from this work, for coupling FW based/assisted submission such
-as the ARM’s new Mali GPU driver, and others.
-
-As a key measurable result, the patch series introducing Xe itself shall not
-depend on any other patch touching drm_scheduler itself that was not yet merged
-through drm-misc. This, by itself, already includes the reach of an agreement for
-uniform 1 to 1 relationship implementation / usage across drivers.
-
-Long running compute: minimal data structure/scaffolding
---------------------------------------------------------
-The generic scheduler code needs to include the handling of endless compute
-contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
-drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
-completion fence.
-
-The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
-this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
-drm driver, including Xe, could re-use and add their own individual needs on top
-in a next stage. However, this should not block the initial merge.
-
-Dev_coredump
-------------
-
-Xe needs to align with other drivers on the way that the error states are
-dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
-infrastructure to report error states, since it produces a standardized way
-by exposing a virtual and temporary /sys/class/devcoredump device.
-
-As the key measurable result, Xe driver needs to provide GPU snapshots captured
-at hang time through devcoredump, but without depending on any core modification
-of devcoredump infrastructure itself.
-
-Later, when we are in-tree, the goal is to collaborate with devcoredump
-infrastructure with overall possible improvements, like multiple file support
-for better organization of the dumps, snapshot support, dmesg extra print,
-and whatever may make sense and help the overall infrastructure.
-
-DRM_VM_BIND
------------
-Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
-fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
-development of a common new drm_infrastructure. However, the Xe team needs to
-engage with the community to explore the options of a common API.
-
-As a key measurable result, the DRM_VM_BIND needs to be documented in this file
-below, or this entire block deleted if the consensus is for independent drivers
-vm_bind ioctls.
-
-Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
-Xe merged, it is mandatory to enforce the overall locking scheme for all major
-structs and list (so vm and vma). So, a consensus is needed, and possibly some
-common helpers. If helpers are needed, they should be also documented in this
-document.
-
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
-- 
2.43.0

