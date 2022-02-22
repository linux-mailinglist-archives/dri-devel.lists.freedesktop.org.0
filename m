Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC424BFB33
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D692F10E873;
	Tue, 22 Feb 2022 14:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BAF10E86F;
 Tue, 22 Feb 2022 14:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541501; x=1677077501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VXtBH/tFxc3NszXBMFoAAgCErLL6P+1p/gA6reiXs/o=;
 b=ZxOy9J5scci1lwxjfewNb9xEUkJ9nSwL+o7vBQWZ2DLV6Ug5+MM/etQR
 0fTfT6OnR2wy2QpgdVq9phyW2DHFGUGWBGJTfQ17xZUsTGsKH2/VG9AL1
 h7RGSjT9pza84lxIJ0DX+ezViN3MCayg9f7gLdm/kmr92s+F4FqCyTsH8
 pfj1Dh18aZzknVJqtCXvHvfeFobcfW/uw7NaDFyFIJnkFScCc377LPfV5
 /JYFlveGqNAyf8PrtCb1fxt1r6GsDQn842WEx7qfYUdmIG9HWlE34kB86
 tOCy2N7cDJsJuYdmTETnjJoFTU6ow5AaxvQjRuOTBvBTFTZleBwI1ALau w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="312440099"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="312440099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="573453861"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2022 06:51:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 06:51:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 06:51:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIY9HdSTBL1SUgwsGHKPICdWiutqJXqq/ssPGDEOCjyb17E5dlL80Y7C2uaENHxHATs37JYrqxAyJJXVdwwO/kenExLIWaD/ITBAGJ0HTNdvvUF+9PVVoX+XUPu+KLHCAK9CkYpAK/a3cPtLC/9yuKjwRT+t9+Y/MweRpxcEOJ7F+vgkLHWf1Lrm7okoV7Y7T+iTGGuosXtjPlrSQZXOZU4bvjf8kcyn6o02lkTaw1+xKkCycNnCGvdfoUGBZ/R7nH6sFMhC/ep3BtI77x02CY1xlv8IxkQ9XXCYcRWEsGuDu0k3o9z78yVLwqCA0zImYkdWdRgPDOIwzU5rNaU6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljaRwhQ3F/uem86iufLcOyS0pYWf6MP1dv4fjaf7Ndw=;
 b=WVdiza91VdRGbY8xIrAYRTkfbwv2BVPdyjrk7Fe3nDCqsyHv3mryk+HrY/hKuJi0GFKNrFAMlWwupzsrHcxOhO+aXtrtcbcA2EqGTP6PNBrjpsp4HrGOCl2Vcvxa4CSnbkXzyGUxRVPYBqTyeEiAno5S+hk81FBFZhMNX3SXg0gwWghkHRqmM2RWy7wUyTlFcrcoJtL1uqXyATERT3cyJoCz/45zacQOkNWif+o/BdrCCLtD9V0PwSpEIk28gzhRgHFDGjuJ8nByD+4F1RqFZMQiMQ6yhu1aEXGT7YyGUTuk2eeA7f/Y+tBwQtz0E6dLQ/hxeAvhRoyLfmjfqiT7WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB3221.namprd11.prod.outlook.com (2603:10b6:a03:1c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 14:51:37 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:51:37 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/i915/guc: use the memcpy_from_wc call from the drm
Date: Tue, 22 Feb 2022 20:22:03 +0530
Message-ID: <20220222145206.76118-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::29)
 To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93211441-5f06-4e7a-12c1-08d9f612d402
X-MS-TrafficTypeDiagnostic: BYAPR11MB3221:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB3221F96F87AAB51378EB5E6F9F3B9@BYAPR11MB3221.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEeuSZUymeQR2+D2g4H+FTEdnLegFQlk59vlBv8dVw3mLNaJrq0aDtTmSjgwysaWwLIsowRAeOeF4hkzbb7ZvcLt2GZk9wDl1hNsPBysugKG0+lj7CqLy5Pci9yJFYD5ZiHWNcjGWYLUBx6iylyphBQ9ti1RMJZyh4jMXI9CmbrJaljugEvPCEBWacheItTFSImXXEIjnot2G4xxi328+bq/v666/Cpw31aHxSs46MSYWefeP1zSsggtYvorcpdAhcn9rgjySWNPBRoB3M01fUWirwWQPbK9pKFPdXz3qS0KqAcHvGTW4luzky9jfFeOUpTgEBsTk1XNuA14Bj14uaFpVXIpajUq84GJwGqTqhb16kUthyOH8UbdqDJr0nttovc901DjbpzMaMDyCj34eKOliT9mFWXfxp7D2mTWYbaGy/7Mykei/n5gV4pd4tNaFNW5zQqUek03KW7zMe8R840e6TeqA/yuTsUUe3FVZVc97sejLMfvpNv8HP2ZjZoSpPgaYaTrkqEm0CPL9shM1vDi7242VDfG5fNqCsdRbvJwmDKANu1Pg0Ow8qqByU1BsfXKNs/6ZQ/EESd4CmU3ug5CgxWMPxbD3MLqDayg0WBmMtKHl7aGoerrVbobjuhiuW/ncIApxzjq/8YIT7OfpyhjTB118YMovfuLVR5odeNo9KUlVwAGUmyJEK5YhaO+zqfJ8p6KQoudlmjDeRwD8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(2616005)(316002)(66946007)(83380400001)(4326008)(450100002)(8676002)(186003)(1076003)(66476007)(38100700002)(66556008)(26005)(6666004)(6512007)(6506007)(82960400001)(5660300002)(44832011)(8936002)(36756003)(43170500006)(2906002)(508600001)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE5PaGxReHBxRjA2V1NkU3JKdzI1a2pPNmxjemM5dEN4WGlwM1YxdjZ2NGIx?=
 =?utf-8?B?NUtLME5KdmFjY0NDTVBsL1UyM0l5dFF2WDgwRVlMWUgvUzlIS2RNM3pZN2tl?=
 =?utf-8?B?T0JvS25QVlpEeWxZdEZ3eE5SajM1bVlVTkVHT01CL3NQWE55U3daam90RWNz?=
 =?utf-8?B?TW5ES21pTTBKaHJ6Q2ljWXkwZTlIY3FLTndmd21NVjYwdTlsL3B1d281U2lu?=
 =?utf-8?B?c0MvdXVhVWJQR2UvbEk4QWtYNzd4RnBweTFaMHBxYzgwK0dyejVIMTdWQjVC?=
 =?utf-8?B?b2NQL3RPaXNLeWZBQWhVQ0U2czBONTlaWkkvTFZXcFE5TW1ERlgrYWJOSDEx?=
 =?utf-8?B?UnRmd1J2WXZwRFZackxFczZPMHA3eStTL0oxVmJtKytBNlhncnE0alhsenNl?=
 =?utf-8?B?WUVMOXluZUtzelUralNIVkp3eHRocnlCVG5CM0RKR2kxVGkvRGwyNkpGQWhi?=
 =?utf-8?B?NEg4TmZ1RGI1Qlo2M01iWTJvT01LQlFLR2pmM0plQW4wa0pQQjZpd1FyblBP?=
 =?utf-8?B?akZNRHNVOFlYY1JxSi9zeUZOSGRXTy9tcTQ0L3VwMzhqTHovNzhleU00UXN3?=
 =?utf-8?B?Q2doc0tIQ2NvQ2ZWVTVyREZTTjJYeWVZM1paVjdxUTY2ZUY5V0gva2JiMWhS?=
 =?utf-8?B?VDV5Q0xsNVlhMmxQb2F1WmMxS1ZEdVBqRm9pdms1ZTBJb3Ivcml5RUZHbWZh?=
 =?utf-8?B?bUNVMk5DdTBuelkwcHJUaENOZXcrLzVjTzdVbW5jWmxjd3VFN1ZPaWtXVzRV?=
 =?utf-8?B?Z3BtVU8zWWxCeUZnZ01Ta28zZE1KajdrcDhydkNWdDlBelRwdG1wa3RqcGQ4?=
 =?utf-8?B?YU9ieC9DRkVCMU5McVA4M0pWRGo3RGNkNVV4TG5FYXA1N3BzeGNqcTZlVDR1?=
 =?utf-8?B?NmVHcnRGL05MU2dnZUNkSHpXWU9vc0xxV000UWxSTW03NXJTVEZJUGJyUHM2?=
 =?utf-8?B?NDR6U3BRVFhyTWdxcmNnU0t4eGI3bzZoeC9VdlVXQnVtZjcwV2J4OEJ6M0RH?=
 =?utf-8?B?SXZLK0llMmsyQkV4anBIWmc4ckxva2tSTFVCKzhQUmkxKzhZQ3IrWDg5Z3BQ?=
 =?utf-8?B?Q3NabDExZDdickljZitIaW5tclNyUCtGUXNlamNmTUhlU1lNTVhxWXhudG1j?=
 =?utf-8?B?aFEwRUxJU2hSbmJTd25VVUp2Y3h5N0xFa1NHRjd6RGc0b3RUNTlFWkc0Q0c5?=
 =?utf-8?B?d0lKVXM0MGNuZVFNU0tRZnF4Z3NMWG5xcmZrVS9ra29zMHJKdG9Ia1FTSjc4?=
 =?utf-8?B?N2JQYisrWStnd2lzclVtR0tkUk9MaWt6T3ZHMENVVE5lNkl6L3U1VFo4UmNz?=
 =?utf-8?B?cGRYVUVoeG95SG5ENFdOSWlDRlZuK2NuK1pPeXdvbkhLYVA1WlJvNGdDYUZQ?=
 =?utf-8?B?b2c0TEVWSjQ5UnRYR2VaV2pzUTdzTXN5cWt3MkxUS21vV2tib2lBZFNsN0E2?=
 =?utf-8?B?bUNWbFQ0RDY5ajlUTEZpaE5HSEdUbVNPT2QxTklNalFyaXFPQVJDa1c4RmZj?=
 =?utf-8?B?WklGOXl6RWVWSUFBaVhOQWNvdi9JY0NYVWs0ZE9YcUpFVUhveVRXM0QxTDVP?=
 =?utf-8?B?UnNkS25QOUpBdVNtNEs5Mm1nYktNLzNvWUZXMEJqdlJESjllaDBVVUhtLzJQ?=
 =?utf-8?B?dStMc2ZyREYxUHhpOVZJS3k2MlZwNG5SN0lnSkl3OWdaN2RoSWwreS9GMjBx?=
 =?utf-8?B?UXduM1NCSUdpd1labVU4OWFucEJjSTRyeEIzTHRGVXBmU0VOUlRiQmxabUV2?=
 =?utf-8?B?dVNZbm1GLzJ2enhlcnN6T1JQS0hLb0VlOTIzWmRrTTc2ZmtoUWZ4VHgwZVdp?=
 =?utf-8?B?V2p5ZFdoMDRoc1ltV0pQSUQzSGhxMVF2Q1ZZK0dJZVZBZ3pKU25ydDUwZFNY?=
 =?utf-8?B?WkxPZFMyNEJjcXNVaGUra1JHL3ZaalMzcWtPM1U4WGYvUEV2VjRacGF5ZFQ1?=
 =?utf-8?B?bDZ2d2VuTUhWd0x4emxSSFVMeS9LcDkyNHk3MWhhTSthQWw0NGtsYzdYbEwz?=
 =?utf-8?B?dGtieEs1THkxMy9RanNkUXljVUh4L2xkVTBKWWVuaFNFM29LbHFReVhKaG1S?=
 =?utf-8?B?d0dIMi96cmpwMmRhOWVuNWxzbUZDbW85cXVGRnV5aURwM1ZMeTFQclgxajNz?=
 =?utf-8?B?RVFKN0xxNktZVWdLdVVoMG5OOVJKYzRLaTI4akhOdHgvOHdlMjdGZXBwWFhX?=
 =?utf-8?B?Z3ErZENpNllHZlh4cU5OWElrR2daWkxScFIvVUNkSnpLMURGVTlPc3J6Ui9D?=
 =?utf-8?B?RWtaMkk3YzJqRWt3c3ZVVEhlZU1STmFSVW92dkFSUHlGQXhzbEN6K1QwT0VT?=
 =?utf-8?B?LzhqL0FEYjJCRStNQWVvdVBDUklJeHdwdTVKclZNQitYM1hTaGRUQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93211441-5f06-4e7a-12c1-08d9f612d402
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:51:37.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuFmVIGtf4iXlm47gAYX9WN9VKNfGBay0aY/Yq0G/uW9xf0uQlopfXNIhM5o7ObT8bSw1qYVt2evfTFXQjt/rDYXQ3/SHSHarBrAY/FF+i02/cU5MSfte79heKkGlx/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3221
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

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index b53f61f3101f..1990762f07de 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -3,6 +3,7 @@
  * Copyright © 2014-2019 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <linux/debugfs.h>
 
 #include "gt/intel_gt.h"
@@ -205,6 +206,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
 	enum guc_log_buffer_type type;
 	void *src_data, *dst_data;
 	bool new_overflow;
+	struct iosys_map src_map;
 
 	mutex_lock(&log->relay.lock);
 
@@ -281,14 +283,17 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
 		}
 
 		/* Just copy the newly written data */
+		iosys_map_set_vaddr(&src_map, src_data);
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

