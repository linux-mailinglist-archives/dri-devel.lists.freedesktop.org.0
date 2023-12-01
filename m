Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692E80027A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 05:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C672110E7AE;
	Fri,  1 Dec 2023 04:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30C110E7B3;
 Fri,  1 Dec 2023 04:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701404541; x=1732940541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CDslKXLTkwynCqRVQYBF49tTA0GUN9XOqeBdPe31Sek=;
 b=eyK7Fym1hZmAkvVfTKZJ/LmI2vUH/oFOKSkMuw64J0iWSoduF3xX8gcI
 BV+4wVqlAv2brqNXlL2TzVRX016TabpAs+5tNfzSfW41BaQlUwJLXbNPR
 ON1myRgM6JfIFoVdXGOI79suJGdpiX7OizDtrtDGy0vz31iOrX2AZ79hx
 rQrCJDK+0A4t5fTZOsTao83KKluvphm+9Dr1yoegNKTUxQZrzcg6feaN6
 wDiy0J3kk9T2dD/fpv2OpjaEU3Ld5w+zLtco8kxX7hp0u9J79Rmfq1M82
 Qy1nbyQ/XhIRac3pbAz9h6bgQWsCMVj+aE2BVOMNhfVqtb6t4V8vwx4ir w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="318331"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="318331"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 20:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798564719"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="798564719"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 20:22:19 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 20:22:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 20:22:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFizpW3KgzP8O8VPASkKFgbCG2qzsvIxx06pXS2Xgcu7AcVwPxeFej4IBKRu+X3jQJVfkWdkoAyNNhiqQvkLKn3LbpukVomAEOi3GlpVFXra75itJa17m+7KupjPwocGf0Nsm4ePIMNslcr3xs3yLLgY/caWFZnXU6w5kqn619NYyDn5/YUHD+12gFjl9ppNyMFoZJq7HYG+JB8aoQc3sOX6i9SAS+TU/kru0jl+y3DGJ3dKELG2AhTH2u0MoYxeY7cOpB+QcewPZU29msSnCMGabMMWEte3gm1HqAHqhjHZ37s7whgCM37IV7xCEyECJwvTWLDOqgLAqgLHfUR7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LvlNL848R4uJBpkQhLauxoqoUrlmfyDykq3kUCBBSc=;
 b=OYqwm4yrHZxSMm4Jhd8AcIo6nCnxBUOuvMRDW8ERwBdq2r02VoMYdJWsP22fD557rIuaEQHO/YbNXPvM2UadKLEqAsioxeNbKStONA0jC7XnGZ136KvXmBYibHRJk9DoZh6vglmO0t9IT1etO12JdTHCREuekk+DpGPnW8eCHplQs1rE+2X9QaHtrRUteaJ2VIomGqBlMU1IA+ykZ0yqaD4yH8R3Iw9ZTpCzpFf32GBzqUl6iDS0BrZrrllCww84pKwph3BQwQ8b0HLmxZ5DSGECnRwKPDysb8jY04lRhIDf619wk7dJHrABEEXt6jXt08D7OA6+gx3dwBzdvJ00rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4666.namprd11.prod.outlook.com (2603:10b6:303:56::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 04:22:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Fri, 1 Dec 2023
 04:22:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <airlied@linux.ie>, <christian.koenig@amd.com>,
 <lina@asahilina.net>, <dakr@redhat.com>, <boris.brezillon@collabora.com>,
 <bagasdotme@gmail.com>, <alexdeucher@gmail.com>
Subject: [PATCH 3/5] drm/doc/rfc: Move Xe 'ASYNC VM_BIND' to the 'completed'
 section
Date: Thu, 30 Nov 2023 23:21:53 -0500
Message-ID: <20231201042158.80009-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201042158.80009-1-rodrigo.vivi@intel.com>
References: <20231201042158.80009-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: ac44ba5a-deb9-4f07-4fc0-08dbf2251a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0P3msLC9SN7alt0/1SGmU02izncYLAj5/QqdHWQEvqBH/xxBBc6KpamM3ixnsnZDiA/3ND4Bp16f8HeOb/cjpEXPJzTN5a+irNkh6PAvqzuB6pSkQ49/RwkOsVcv+EoH8xEc8GVVdBs7RgbsAdft50+OIIkEvB6XwJ9bHN5GF+8mNO/jqGKjRwLlcpfLUcItTmSTlcPAgsPjlR6ESPkPPSozQZ25cjrsXCKt0uwt6uqyVllCLH6VEAbCZxfGh4i2gi4Ut8t0RfxTOQJWuVLAr6+APY5PFWRJOMq2GOtcaRjXW+cmeHOg3h+Ij3yEUZG3Pvi4Vxisqyoe9F7psX9VjrC7kNiEUB+YFSN4i8CaoQTFjz2ErkOQSIhpTDIpwRcaelUBkpwaRxtousKZYRmakTxOPAI3i6s8H9GBBAQeMMhogRpP9XpxR/bJXsDFbPSiLWzFNczGnQVoJ5XQ/NgoxHq4J9OmMRMmY/iSZiVtt4NnRwOsEFgxIBWn7Yzn5gSAre06WgtCs9i3qA5JqMYSmKrFFse1y48f2uElPvIAIqQ0qrc+fC8IdORnHXz+0AkvCPLziJcvBiEa9NyjyyGPi+NJXwKqs37gnv5TPsPgEE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(6512007)(6506007)(1076003)(107886003)(44832011)(6666004)(2616005)(83380400001)(478600001)(4326008)(41300700001)(8676002)(8936002)(7416002)(5660300002)(2906002)(6486002)(316002)(66556008)(66476007)(66946007)(36756003)(38100700002)(82960400001)(86362001)(66899024)(921008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BHRXFHNXd0K0l5MVVVWDRrQUV4S1ZJV216TmV4eDFhMUwyMUREVitXY0RY?=
 =?utf-8?B?MXNPVzJDQ2FndzJlK0ZCdEZIZmxuK0ZtZjJNQm9lMEo1Mm9BaVNYUkdsK0lj?=
 =?utf-8?B?LzkrelFMd1J1N1d1a1QwNHROUEI5dE1SWmRDdjg5S0cwWTQrRk9RY0djRHpv?=
 =?utf-8?B?c2RsMTg2RlNtS0NhN0lKZzgzVVpVeTBmSVByWFBMOEtCYmo2MWVqajNmV3BZ?=
 =?utf-8?B?ekErcVBSY3BNc2dUa1czVTlZMUQxMS9PalI3bFgrUzBiQitvTktTdjhYTE1E?=
 =?utf-8?B?WEtpbHNlbWg3OWpWemgvRE1md3cxUTJ1TlVkRWVVbWY2ZEpxY3BHSFU3VjdV?=
 =?utf-8?B?cis1YkZZMTZHOUF4YzF3Y3hPam5iaVgvR1czWTRkeDRoRTgzd3NYdUFaV00v?=
 =?utf-8?B?bmlId29MSVdGUnJkUzZKZytFNmEwcmN0K3B4RkNuWDJEK2l2aVBUcDllejA0?=
 =?utf-8?B?SXcwQjc2SjZ6TXRUaWptb05JejlTK1UrRUpoNk50QVo4SCtwWnBwZEpBWGlt?=
 =?utf-8?B?a0hta1JoUWxmd0Nyc1VPSUJKQTQyWVQrVWZtS1lMYnBMTDVkbURKVXdJa3VC?=
 =?utf-8?B?T2EvRHg0WUlnTVZEcGdQekI5THRITDBweVJJMXV4MVhOZVZQQlh5eElhaEZi?=
 =?utf-8?B?SmhUTnYyeXRNZVN3MW93NFJjb3RXbWVoV1NtNjRtMWsyNFdPNjVzQU5uSU9I?=
 =?utf-8?B?cFV1dU1rQ1daTUJhbDRFcG03S1BGcHZ6MS84TlhRanliakkzM3UvblBNejlP?=
 =?utf-8?B?TU9NYWUvMjkrSTNmOWYrQ21qdjN6bEdSK3gxbExJRVNiemxaaGtUZ3ZRZ1A2?=
 =?utf-8?B?bVVoRjdiMFIraklJNDB2T1AyMnd5RGtlTjJGdzZKTElRVEdPbDZMalZ3bmk3?=
 =?utf-8?B?N24xN0ZyWDQ0YkZNWGhJYkNHRWNCV09JUzhGN01NN1VZVU9qNXZrNGZGQ0Vp?=
 =?utf-8?B?dG44QytuN0xubWJlUmdZRlUxUE1sblVOYWpJOTFkY1R0aG5DZkZySHRNZm5k?=
 =?utf-8?B?cXlTOUVqalBYVTVsNjhCWXN4dWE1blF1Sis0R2NRajJsK1QrSkxVQ2x5NUNQ?=
 =?utf-8?B?bzNhU2hkcTlId0dUcXNmT2JaQU5zZUVHRXl0anIrK2ozcS82RVY0Q1RxNFAx?=
 =?utf-8?B?YmNINGZZZk41MXVaeGZITVhKUGMrWTkybENONEZwTWFMeFpkQUx0cXpUd2Zj?=
 =?utf-8?B?ZytjOFhFVE15eEpUNC9xUzlQVjh0ZTJCdlhNekJxczRlbmM0OWdpdnZnY3Bs?=
 =?utf-8?B?azNycUVpRnlQTlVKeDlFTStQT0Y1U012SzlLUW9lNnRUSmF1V0hWbHp6dEo2?=
 =?utf-8?B?ZXY3UjhxeHlWbElYbFpVTVpvdFE3cUJWZ3d6SitXQmVWRU1XdThtL2NCbDNK?=
 =?utf-8?B?WUFFTnpOeFF1aHp3QXVINkhmOXQzY0NKWXJCUEFJM25CbGdBWGdiK0wrQ3U4?=
 =?utf-8?B?MkpSbjdDb1J4bnkwb24wRTNObHIrcXRMTHZhOU93aVduYU9Ucmh0Y2h5dVZa?=
 =?utf-8?B?RU9mbklzWVg4dVRPT1FkaERnV3p4NWlTUnlJUmNZejRZMW5VYUdYS05TNEw3?=
 =?utf-8?B?TWQrZkUxSzIzcEVaK1NhejQxTlhUVVZUazJBMEVBQnpmL1FJRlpPS3o2MEg5?=
 =?utf-8?B?dmdHZ0hrcHZhRGRMRzRTNjNtc29WNEF2Q0tGL09DODZMZ1JwdkVocHBlMElR?=
 =?utf-8?B?eElLaXB0SDVPZzAvK255R285bGpQZ0dlWGVZTFdIY253TkhQTWpRUzFLQ0F6?=
 =?utf-8?B?TXNCNHo1QzkybE1Wb3dMM0k5R1BEcmpvc2g3MXJqa1hXNXBkbFFXN1NGZjIr?=
 =?utf-8?B?TzZuVVJ6MDgvNWRxcEtXS3JoYzRsMGU2alA4SzFnTHVjQThveHdrdmREdkVC?=
 =?utf-8?B?c3FuMlRKci9ORkVmcDgrbGQ1YkNoYW8vdHl2UGN4SDRGQVBBWlJZY0ZYTlMr?=
 =?utf-8?B?dnVBYXp6akhrSTRKblNQM3laU1pITC9YRm9HOURZdC9LQ2VJV09MbUNYblF5?=
 =?utf-8?B?OG91VWxDeWdjSkpuQm5ydEl0dHk4NUt2K1g2MGpNdVMvQ2JLNWxWTlY0VHd5?=
 =?utf-8?B?emJ2cGExMW5hSm9qUzRqUnpwTWovbnFDRUJCNnJYWXg4RUE2ZHpPbkRqT0Yz?=
 =?utf-8?B?TVltdW9RdkJUblQ2aDQwVTlYTHVIWnR5NlNtbGFPdy90cVJ6Wi93WVRBZzVJ?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac44ba5a-deb9-4f07-4fc0-08dbf2251a04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 04:22:16.9204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96aJNt02M6unbyXLu7wzGgcMFep8V+6hMzcZRJUDtDNgBZ9uv4BMLHn7g9WN/tuYL4SeRUivaFrTvnvtOHiRJA==
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

As already indicated in this block, the consensus was already
reached out and documented as:
The ASYNC VM_BIND document </gpu/drm-vm-bind-async>

However this was item was not moved to the completed section.
Let's move and clean up the WIP block.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/rfc/xe.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
index 9f3afab6c06a..87dd620aea59 100644
--- a/Documentation/gpu/rfc/xe.rst
+++ b/Documentation/gpu/rfc/xe.rst
@@ -70,18 +70,6 @@ When the time comes for Xe, the protection will be lifted on Xe and kept in i915
 Xe – Pre-Merge Goals - Work-in-Progress
 =======================================
 
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
 Userptr integration and vm_bind
 -------------------------------
 Different drivers implement different ways of dealing with execution of userptr.
@@ -151,6 +139,18 @@ Xe – uAPI high level overview
 Xe – Pre-Merge Goals - Completed
 ================================
 
+ASYNC VM_BIND
+-------------
+Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
+Xe merged, it is mandatory to have a consensus with other drivers and Mesa.
+It needs to be clear how to handle async VM_BIND and interactions with userspace
+memory fences. Ideally with helper support so people don't get it wrong in all
+possible ways.
+
+As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
+various flavors, error handling and sample API suggestions are documented in
+:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
+
 Drm_scheduler
 -------------
 Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
-- 
2.43.0

