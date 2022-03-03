Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220B4CC4BB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8A810E2E5;
	Thu,  3 Mar 2022 18:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F5510E2E5;
 Thu,  3 Mar 2022 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646331094; x=1677867094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zQVB78iQREHcwA78MQPWPp3T2PxaOPNeyZahuE+VyRk=;
 b=LNCHkpYSZwUSfNbtgNRXEcYOnmj+kUOrXgERAAFVbWLJB/vQYECMLJ9a
 wwFjyRLVINUApAqR7j2sNFaEw4OuAx9grltdBcsVelfJr1Sg2wGgzn4le
 523sxtrC/VeT/cLMuT9gAuMkUgLCz8ECXExPI/9oBzacf/FZixKYS1JMF
 fENiaWO16mNO2mJFpugpSWByZ57B2+Jx5jAID5klWWDheYsHx7qgdx0OQ
 CTJ0NOuNdfxDWP4EGNM8lQhqbKzz9tqXFg3wtY8OJ2nzj8oeDfTX12CCk
 zCvqv1ujsWRXR3mLxH5zZNra4K6+YR8giU9vLzAXYNhFiGNZ8XaCJZ+yk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="314477608"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="314477608"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 09:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="809779461"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2022 09:59:23 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 09:59:23 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 09:59:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/vQ8atUZJevjxtw1GlU4/N51VNgi5KwvBepVyRQbFKzbF7PP8QW8zSKFFNcId58WE0V3rxsefrt6UY7+MLQrQ+HBG4DnfheFATMfK02OC2nhZtFaO+M4Ojw5FtukYAJ7OpBT6+6vuPtFww2ymfPzqaN90MnmkLakmn48PLCM4hr7SzXY3zY6CFnfvrwXEvI2ctLqRwos9YbCIhbJXjBnplQfXp7U2ajSbZW4xtgBJvkh/a8T+xlVMiZxZ55kOHFYz0L+20RgT8wcQTK8o4EnRMMTmtG1s+lkTj0WNwkLfdEjzibY2GY1rVuDS1cIIwqoo4KTj9kzrYpjwBePPAT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URCVkiBH4ubgH2C9HHsxb+o9XuxNgQ1puLwzKbLQtFI=;
 b=Rap4hsmLhy/yr8jSb2rACzwSqeqbmsgVMX5agZCSlNam4IFNRD41beCfdbqewvvEAGyLeucB61bJXi/90Js9vX/+HyL9DFoLwyN2/xsKOpurAWf+gQTITWW2louoGmsM4NBdOpP0uodVHVvLPXuiYSLXuHC4HeErj3mm3rhRPtXctw3EiOpWJB05x+RG9WDxXiMpN831Z/WnHjVrErf0NbkPhYBrwJfrYjwPRqnIc4JofH92sZZT2LoBAb7nYGUefbGdGyQvjPBiTrsBhhdIasaJeyB5WkQCjgMGr3m+oaAxaIzKpt4lXjWD5bBbDRsrM6yuAOUMPHpacPAqfVgzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by DM5PR11MB1244.namprd11.prod.outlook.com (2603:10b6:3:13::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 17:59:20 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%8]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 17:59:20 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/7] drm/i915/guc: use the memcpy_from_wc call from the drm
Date: Thu, 3 Mar 2022 23:30:10 +0530
Message-ID: <20220303180013.512219-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0130.apcprd06.prod.outlook.com
 (2603:1096:1:1d::32) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c757e756-545c-4565-4f4f-08d9fd3f8aac
X-MS-TrafficTypeDiagnostic: DM5PR11MB1244:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB1244643884A4C0168B906DE29F049@DM5PR11MB1244.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y635lk/wr6uP0hcVDLXOqvok6Kd0Vzlc2K9nQ5+hchiyLM3bFExxaaOhR5TLU30rE+twJPaFbxw0/hyhH4VDdRCumYomBCg6ca/H3bfgfJYdImBp8xfRn9ec3NvPy365kNUq+noj8G+nJSY6tl8pn+AvlcvIKvQOxx95bcILVvE8hSO7lMBgL7VcTixt87qM+VgSVHyJk7Jc8veI0fc9a6/Kt9RQy/jmnxtaqimNWNMBY6/RP1NpQ54jb2EqW37m5wGRlBKF7GBN/nguAMHMvjT8TTUTWpGH878zfcv4q5iJ6tKFI6tucfRuby4HhAZmKKxObvDxQrDP/fOU6EkWCA5JmvXCzuTei9HTYrJW0QjssPJWvwd/oK0cYtrZFwOjnAd0CxBP1jvDf+ftKMTFoZzKgWaJIqAusagx5X8CizOtuc9MAGD0fcxtAvBlVPuxHN2WpFUITvfpZFjZ7RfD5/APttafJ7Ir4an1tTZinixYYVlEKU1VXoPd4scYB+EF4s9JAGqa3VrIhR312ed2bks+wLvTY5DbTZnbcsuXuwDdWLMkDbCT86kXJh4HENmcVSUsr0vPmgOrqRJnXH+RJ7fA9W7Sh9cWJDRmPopr60VqBtklTilpq3iqQSZN7ixNhSRcPe9Hoe/wFSMdY5NVpTsIipIp9YatniKEvuDCxa2j39Bbia5fUp5NiXLH97r2SI0g7zPPGPzksgsSA1sHnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(38100700002)(66946007)(66556008)(6666004)(450100002)(66476007)(8676002)(82960400001)(86362001)(4326008)(83380400001)(43170500006)(36756003)(6506007)(107886003)(1076003)(2616005)(5660300002)(2906002)(6512007)(44832011)(186003)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDU0WEpWcktLMDVPVitBN0tDMFRDTGk1Qk1jV2ZPK0prOWFPdGxsTkpNM0xS?=
 =?utf-8?B?Vk1uNXdkbTd4Q3dyVnkyWkgxZXRsRE5FUFRFeWNrUUhxc1V6MTFVR0h1MDlC?=
 =?utf-8?B?RnBFN0N6ekJQUE1nbGlBcjFBSm4zSERwL1VYM0QvMUhnU1pDTTJkNDdrNGNQ?=
 =?utf-8?B?WkZzYkFVYWh0RTd1Z1BJOW1HdkRxMHl6TUlESllHNjljak5NTW5IYkRVNkg1?=
 =?utf-8?B?aVFQQ3I1YjlpMzl3cWlZTS82bndQbW9WVStyTmhDVkR1Z0N4bGYwRjV3amlu?=
 =?utf-8?B?bDZzYTJHWWt3T0VlbHVqeGdDZlhhKzhjd012bU1tU1dPeDhhbkx6Mk1NSm9t?=
 =?utf-8?B?RDAzbVd3ZTZ5eDNqWHRValVKLzdkbkJYUENoN2hwdDZ3bkNSTEZnN3pnUnhP?=
 =?utf-8?B?UHhWSXNLNFAzVlZQa25Jck1YbUpJZUZCNHdaa2xOWEUvWERHRzI0b01WQVQ5?=
 =?utf-8?B?MW54K3dyaERyVHVVTkdVc2VCb3JvNTZLaXhoODRtOTRseGJpdW1yK3dCZDkz?=
 =?utf-8?B?c0FSK2J1UlVLSFByZHVMNE50SXZZYXFKS0lGSC94cklLYkR5SDlnbWp5ajlD?=
 =?utf-8?B?RVZOZG12VUVTdVBDT3p1OWUzYS9JR0NCc2xCTnJDb1FoV3lFdFJVeGhmTzNr?=
 =?utf-8?B?blBIeUk5dVhuQ3VucEZrekZFUEd0QnRkdGh3WDRyOUhZZ1g3MnV6am1CbFJz?=
 =?utf-8?B?a1JvdjRsNnp0MjZ0ZzZrNHg5TzJ4MHVzWFZkSkdSMmVFYkw0VXRVMkRzT2hG?=
 =?utf-8?B?YTdwOHRWVUkyYVZYdjJEYW9sTGhPQ24weTI2bzlDNUlacWlqODlqVUhWWDZY?=
 =?utf-8?B?THlWMUhBVVR3TFYzVkUvbDFaNVFFTGtzbHNlYzBkTkJ2WldRMDVxRTZDNE9i?=
 =?utf-8?B?RXRWdmN2emZ1cWlNUWFzR2FlRDRoVUNrNHNqUGJoL29HeGdvR1oxbnRhYU9U?=
 =?utf-8?B?Z3lWcEpiYTcyRmFLMWhnSlpGR00vYnNXOE9KUGxNMVloZTRXWGtRRUxMYW9J?=
 =?utf-8?B?blY0WEtwUjhlRmszVzNYUWpsZi9GNTV6T3NLR2w1dEFlanBVMXNiZG1EMmo3?=
 =?utf-8?B?ZFhXcExjaEJUSTFGNzRSL2xmQlZvbjN6UVF3VmlYNktWcWpkakVZbk5sdmJK?=
 =?utf-8?B?UnpMSkJZTjNqaG5EbmdKWTlKc2dFK1lPZjQ5U3AxOVdicEZ2cXdXeEVSY3c4?=
 =?utf-8?B?VDNUK2ltbnJ4R0lVems3dGQvN2FmMlZZeExJM3hpYkNRSldTNC9BQk56S252?=
 =?utf-8?B?T3pvb01wMzhROGMzT0doV0MrZmVsMEZzb0daNHZ5ZjRSWWxqNGVma2kwazhU?=
 =?utf-8?B?TDF4NXJWWXZ0R3dubE9TMXVLNnF6eGkwNHA5ekptRGwwL2RKZnRRdUJISGlm?=
 =?utf-8?B?QTZZRmJveFJhMXA4YTNpRjdHM2VXVGM0bVE5NHc4OWs1RVRzR3BMaXQxVkZB?=
 =?utf-8?B?UFp4dk5nZjRsM3pqVWhpTkp6WGlJZkxJV1FNbndIYitub0lTV2gyUlEvanJu?=
 =?utf-8?B?WTBPdHo1REMvanBLRUsrNFJBaUR5WUpqUEVhU2t6QmhHNkNNYlRQdU8yd1RC?=
 =?utf-8?B?ZXJ5ZWRiWlAxbTB5OHBFUEIyWDkzM3NYYlBMRXliRDl0Zm9pOEVtM3N6NTNI?=
 =?utf-8?B?cTlkTEV2TE9kbi81VmkxbFdnTFRWazFhSUUzUFI2TVVRYlc3OGlJNXFTUVVR?=
 =?utf-8?B?VWhGMHppRDV6cnRacStLMzFQalNTVXk1REVrQVdsMkdLNGg0RHJaZnRtVzMz?=
 =?utf-8?B?SUEzVjl5aGFtU1JuWFB0R3FBTW54Q1BxVHFvN3VpeDlzM24xWWEzUWhiWjl4?=
 =?utf-8?B?M3pUSmZqdW14dTEzcDBCNGxyVk40ODkwZ0xGczdtV3llTXhWK21rbDhpUEY5?=
 =?utf-8?B?eWdxNFQ4L0d4V1grWUI5RTNESkUzT2tpbXIvWDNhS0xZamk0U2ZjaW44bFBS?=
 =?utf-8?B?T0duTm13Tk1JNVFGVFcrb0ZDdjZhbWJQQ2E5VjJ4dUZyRWJ2UE5WU0k3QXpi?=
 =?utf-8?B?anFWaDFYUHAxTUhycDZjRlplanN0cWIrVGE2YS9aMlVpZzg4WGd4SlQzeGp3?=
 =?utf-8?B?cy9lQ3BMOU5ORmhDSlVKMmFlS3dmSGFpWlBJNTJkaU42NjlJN3JPQW5XYkw1?=
 =?utf-8?B?VVlQU3JQRnUzdUk0YVRlU2xuUW9GNTZvK0syK3ZwdEg2RkpRclRRVVlBWVRh?=
 =?utf-8?B?SkUycHptaWRCN1hGRFo5blpYaTB2Ri8zeDA1eHhCV3Q3UEZYdG9RVk5ETEV5?=
 =?utf-8?B?MHFkd2ZKVlAwSkllZEc1RDYzdzFPOFd0UjVXdGFRc094K2d4S1gwZGxFSjlG?=
 =?utf-8?B?YXVrS3hYTlI5S1FwS25uZUlHUHVCZXVYK08rdFN4SHI2ejlrOXdsdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c757e756-545c-4565-4f4f-08d9fd3f8aac
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:59:20.2357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkEtFLLEmpwD1KnH0DYjt+2aA8a+lkYHbyMHB+X0MxMwVZSXe6g2pflC6eHPt07HZeMeZ4rynwHR001qo0vJ7yQNnsGhYl5ws7kxZhuOotdCYKwfy+WwuKKD0nbMdZ8w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1244
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
Cc: michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
by the implementation in drm_cache.c.
Updated to use the functions provided by drm_cache.c.

v2: Check if the log object allocated from local memory or system memory
    and according setup the iosys_map (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index a24dc6441872..b9db765627ea 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -3,6 +3,7 @@
  * Copyright © 2014-2019 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <linux/debugfs.h>
 #include <linux/string_helpers.h>
 
@@ -206,6 +207,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
 	enum guc_log_buffer_type type;
 	void *src_data, *dst_data;
 	bool new_overflow;
+	struct iosys_map src_map;
 
 	mutex_lock(&log->relay.lock);
 
@@ -282,14 +284,21 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
 		}
 
 		/* Just copy the newly written data */
+		if (i915_gem_object_is_lmem(log->vma->obj))
+			iosys_map_set_vaddr_iomem(&src_map, (void __iomem *)src_data);
+		else
+			iosys_map_set_vaddr(&src_map, src_data);
+
 		if (read_offset > write_offset) {
-			i915_memcpy_from_wc(dst_data, src_data, write_offset);
+			drm_memcpy_from_wc_vaddr(dst_data, &src_map,
+						 write_offset);
 			bytes_to_copy = buffer_size - read_offset;
 		} else {
 			bytes_to_copy = write_offset - read_offset;
 		}
-		i915_memcpy_from_wc(dst_data + read_offset,
-				    src_data + read_offset, bytes_to_copy);
+		iosys_map_incr(&src_map, read_offset);
+		drm_memcpy_from_wc_vaddr(dst_data + read_offset, &src_map,
+					 bytes_to_copy);
 
 		src_data += buffer_size;
 		dst_data += buffer_size;
-- 
2.25.1

