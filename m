Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0923800272
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 05:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8010E7B0;
	Fri,  1 Dec 2023 04:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C74610E7AE;
 Fri,  1 Dec 2023 04:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701404535; x=1732940535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lGY3AmwGZzIUGJ3DL1d+oPdxqNmgb2XvUKwRtzDPXmU=;
 b=ZioytuJGaVSbQ2ptD34NmxbMtY6sYW3d4p8JpNUiWpaDyXlr9YCW0zX9
 waQ9tk5vkS7W2Lhcb7MDiY9TRrPY8gLMZ3aHTmZVFS7S243zMjIJ8/MtJ
 bPw57w7oAas6EB2lSzQ7YGuhbE5sB2XM9yLn3mJSem546WJE4ZE9VxxSE
 086GsgGIhKA5/ftGorSoV2LHKdFyQrzogdyE73PwYvbIfnMcYvhHzsTQ5
 wnmHerAcKrPNGDsSRSaEiCeQR3BKn8vH7bW3Jhb91EbCLnwS3qHn3PS8n
 adu52P92BQlIFhGzydFWPHjBCobjgmxTpdUI/l8gUFSY83B6YzwqKDgAz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="443402"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="443402"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 20:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1101170098"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="1101170098"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 20:22:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 20:22:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQSgjX0ZS5hvuhgoXTW0tzVq8iVV3o/lBfKPWNdwOn6tXKxdFbDWpXfct2bWTQZykRBTsyECTJcbQLDhR14We0JHkucrcwZugKdbgfchGdaNw1xci/8Fu8cN9I5aTmFJdcAYX7ZMzy4ybW0YA9iCEikO9aWF1o7H220efOxXP7vPgmfRrHA9R84+V0u6wkcvXp6HRXHYfEI6p2NN0vEZWzSKDrlHx4ubg2JSMSaFAjfceyVGu4KRdsbZDVkhWXsS9IxeGl/CEJAhQyB91x2Q1Yxtbtad82+F9vnXY/9Q7NQ8x6l+SWU5j0+5xSeBJza8rvTZ7sxHJLtVtUKzseCDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fATNwpWSgWlZupOjGswB9vXu7pUn2M/yTmxAwDJmsE=;
 b=W2O3mDDgYa5NMD/J6XotdWPX2LWTMD89eteWbeKDyGcpFcfXOrt+6WK0ktZVWLCTAMxvrN8IZw44VvJQtCtWc+f92cVuob/8EI/u+o1PXCBAWkRoMGlZJtzDGkeBqGvdiVjVObxdAhDt4jUoUjsCMu2heO8oAfBNZSYhvJlnO2sSgrYYm8MlpfiqX69owljPi5k/dZuPDMWc7Tmi4YgkwKdlLaXVEQRCDtQcrBl8GZhezhMxjxGG/2nvQoBKTZ8MIKD03AyTNwbtIArkTciKQsacGnsCH7dGam25N/jyqsEfv/QAP63JW7cmJ1VS5aw7jBRFBeNSDyeyVJpx0oT98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 04:22:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 04:22:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>, <christian.koenig@amd.com>,
 <lina@asahilina.net>, <dakr@redhat.com>, <boris.brezillon@collabora.com>,
 <bagasdotme@gmail.com>, <alexdeucher@gmail.com>
Subject: [PATCH 1/5] drm/doc/rfc: Mark long running workload as complete.
Date: Thu, 30 Nov 2023 23:21:51 -0500
Message-ID: <20231201042158.80009-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201042158.80009-1-rodrigo.vivi@intel.com>
References: <20231201042158.80009-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d5a157-7ccb-41d4-7316-08dbf22516a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfeJsiQ1Qckm3yxjI7XLYzyq4lgtcds6lxiFKYyUVfc4qj/Sx6HjOBEQmQSDZLw2yH59Ko7IF8qItzRiz3dcOOGHthCM0gDJ3BLWuDfRLGurmzq7Y0DrWPlDk1I0bYmjRbicbsXMMAbgLaKuWGyEeXfTLdHC1eV4cceB1GdUxx89h0+WJzpaJX5m5de7rRT9bUV757Y2se65ZpPicfsQ9N33wEBDRlw2l2rjFV3brQcbvCOUxF/hGBQwbl8L3bbdG8W9VSthMGJf4fltKNl1iZNjl/P8KD6MshAc97gY7jqPQUyslYuyonY+2yjDJnEcFgm9ALEv7hH1UfPVd+P9agsb2YntwcqwZNk4lF17NicYCIqCbSW0fXU0xuZRycUxg0J0maUO8m1NuhKtpGyMbEx1jPdcVAcQ1/RvgeZwQc1zVEhFNCDVKzJkrRhM//Vjozc2QwkWXg34c26HpTI+1hSJZMdTNzLNPImRHshlRjZONrst7zx/f0MEETHM77321W5AvDZCtl3q58BASJZxYLT0WRjbx/pTUF/ATiKlECn1S9bMQSHZFudscbO+JmzxKHNN6hrPw9wxUAngxXShausJ6C5s7Puh57sRemZIGnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6512007)(6506007)(1076003)(107886003)(44832011)(6666004)(2616005)(83380400001)(478600001)(4326008)(41300700001)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(316002)(54906003)(66556008)(66476007)(66946007)(36756003)(38100700002)(82960400001)(86362001)(66899024)(921008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlRRRXpFb3ViU0FBS2VwOXFoSzh1OHd0Q0J2K2tFT09lU0V5Mktwam9jL3Mv?=
 =?utf-8?B?Tkhmd1RjcDQxelhzMTRFdlpPaFpNVVNiOVNsVGtPajNlY0FncTQwUTNiaFU4?=
 =?utf-8?B?UWY2UWZlN3BkOFFGMWtiakFvWXFZUlppYTBVdStNZEVSM3B5TUREOHVFMmN1?=
 =?utf-8?B?UisraXNGMXFFbXhWa2UxbzA0Mm9aWUcxNXJwaG9OY3FnNlQ5cno0Z0w3Z3F4?=
 =?utf-8?B?TG5xOGJveXhtWkpFcVgyeVp1aUUvL1dpY2haQjZHa1FDZjY5RGxMbHNrbUxR?=
 =?utf-8?B?aFpHMVl5T0QreGQyR3gvTWpjQm90RzlrOVdCdnVGeTFUM0R6eFZ3M3lnbDVY?=
 =?utf-8?B?UlMxZGVCekU1L3BYNTMxRVNhRG5SS0lOV3B4djRMdk00K3RhdXV5VkRESGlH?=
 =?utf-8?B?WG5zR2hRemFHZjJCb3c0NXFEMTNsRTJBZkVoVkpaMlQ1L0NTbER4WlpVaHgw?=
 =?utf-8?B?amp4dWNtRFk1cWNVOHFnQ0pXQ3lxTkVPV2hCK0FxbHZNY09xbjJaZE1id3BC?=
 =?utf-8?B?VHdPelFKeG9ObzU4L0dTN2RNTFFoSlcxb1RoOERRYVhVbDY0a0QwcmJZNHNk?=
 =?utf-8?B?RHNPV2hoenh4UVVtbGdNUUUvd1BSNG1ob2I2c2hPTUNleGFKb29INEt2Nzh1?=
 =?utf-8?B?UjV4Q3R6YW4wdnJqcSs5cDJaZVY4cktEQ3labTJnZGJNd01TWmJSVGtJVGdj?=
 =?utf-8?B?dW10eWdJRXB6L3Zha2lEWWtsTGRTNFNFbGJteHlqSG8xbmRlVndGWit4Ykln?=
 =?utf-8?B?TTBQdU8xNFJzd0xtSjNjbE1ZRkl2VHR4Z3FudFRSei8zS1FjSHBWTk5hRUVm?=
 =?utf-8?B?YmdvZHVob3pvWUlqN3VJMFpmVVhTQyszbVJIWXJ2Rk5qVVRBd0hNbzRRZjhr?=
 =?utf-8?B?VzlEWGdndG5BRGFyQTNhK1JkVmdGMW16enNoRE9CZVBIRGZPNXdyZWwzUEJu?=
 =?utf-8?B?UGZIV2F2MGQvSjlRVEtOWDRzV1BqTHVuN1lkZ2tDdlEyZkx0ZzdTei9QK2pO?=
 =?utf-8?B?S2NnaFNpRTQweG1MeFYwOWJSTng5K09Sc0FDV2JoMEN3WFgrS1dHZHlteXlF?=
 =?utf-8?B?M2hMc3NPWDlVZzZKRnlTWWhTSXZTWC81eXVCTDd1cEVpRUo1R2hOempQZXNJ?=
 =?utf-8?B?UTlHaGJIRHhRWjdPWWZXV21lRkd5MGNhQlpra1dpVUZOaDI3NGFxMWtUR0Iz?=
 =?utf-8?B?TXIwdzZheDZPRGhzZElxU1Q2MHhFajJrbzJqMEdTbFRDZ1dSaU1wY0E5U2hY?=
 =?utf-8?B?K3Y3eGhjM3lCZk9KWmhKeW5neXRtcXRaNFJRMDR2dy9hVjYxYkhNZTVud0F2?=
 =?utf-8?B?WERZOGRjK0Z3Ym9sQlNYMVVON2d4SlE4aElTeFY4VURha0RUaFF6RXlJeklS?=
 =?utf-8?B?amlwenErc0NVNmZlL0txTHlNODZldHJyQmdrYjNCTmRSbldZcVlLUklwQmxD?=
 =?utf-8?B?N3VpaG9SZjFzdnVsbTh0WkliZWhOOGpqbGNBOWV2bmZwbDM4bzF4Qk9URlVq?=
 =?utf-8?B?YjVqSkUxSDIwR3ZPd0xVcDVHTEVBNEpCcVQwRStRLzVPYzJmYVFkSWU3NU9E?=
 =?utf-8?B?bmhsaTN5UEhqUm92NHpGNW81QlVReGg3RUp2NnJDL29TVzlocU45Qk4xN3J6?=
 =?utf-8?B?Q1BqdE0xK1M1R1dSSWI0Z1lqanIxN2dTZGhxSHdpbSthYmRIYis5ZUpreGU1?=
 =?utf-8?B?UThqQ2ZkQlAzZ2Y2SzE5K3pIN3lJbEpFNjF2TGFZZmc5dHJrdlJhNE5yYlVP?=
 =?utf-8?B?U085K3JlMXYwakFmUm5uZXU0VzY3MVhwUzlhOWxXN2xWQW5uV3l0QUw1bnJx?=
 =?utf-8?B?TEh6aVVzNlRRcWlnT1AzU3lVSlFhVU91b2FVOU5sNXpRNW15L1ROM2lhTFh0?=
 =?utf-8?B?Vi9wcllwWmhIVVBJTGxlZjRDUEhaNVBaWW8rZS96b2dmNEdnbHE1RG9DbVhp?=
 =?utf-8?B?dXpPUkNJcUdseDNyenZlQnRnaCtRMzIyRDNReHR3QW1PN2tnMjZlL1RlTU5O?=
 =?utf-8?B?TWhRYzJ5RzNPZk5WRVhjLzZOMXdqaVBJOVRSaVVTdzF0d3pZc0VZSHpqVStl?=
 =?utf-8?B?K2hyV0FuMExxQzk5Yjh6K29NRHBOWUg0NVFraTlkM1dqMEJHd3dEaVRtci9R?=
 =?utf-8?B?WUFETjRiWDFNT3RUOHNlK21iRWlTeThUNnZINTJFTlRSSmdqSHhveWsvUmMx?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d5a157-7ccb-41d4-7316-08dbf22516a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 04:22:11.2039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ze/wfyezk6Ni2kD6kYmPkoxLxJFAgvbuxHN894WZaw3lJ1MbB2723GAgKXSS6qZfAj4he0aKLBwwCfp/TpKdlw==
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

No DRM scheduler changes required, drivers just return NULL in run_job
vfunc.

The rough consensus is that no helper or extra scaffolding is needed
around long-running jobs and no further changes to drm-scheduler.

At least for now. Other drivers that currently do long-running workloads
have no plat to use drm-scheduler. Besides, the current consensus is
that this solution of simply returning NULL to the run_job function should
work without extra code duplication or complication.

On top of that, this item was already a non-blocking one for upstreaming Xe,
so let's move that to the 'Completed' section and revisit the long-running
solution as a community after Xe is integrated in DRM.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index ceb21219d52e..2a5132327617 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -132,21 +132,6 @@ the time comes.
 The DRM GPUVM helpers do not yet include the userptr parts, but discussions
 about implementing them are ongoing.
 
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
-This is a non-blocker item since the driver without the support for the long
-running compute enabled is not a showstopper.
-
 Display integration with i915
 -----------------------------
 In order to share the display code with the i915 driver so that there is maximum
@@ -184,6 +169,18 @@ Xe – uAPI high level overview
 Xe – Pre-Merge Goals - Completed
 ================================
 
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
 Dev_coredump
 ------------
 
-- 
2.43.0

