Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4AA3C2E1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA2F10E496;
	Wed, 19 Feb 2025 15:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bgi2XxiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651F910E349;
 Wed, 19 Feb 2025 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739977262; x=1771513262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GaDkbeymazlxuhXXOqmieB2HEgq0NnLxhPScwWzUQYI=;
 b=Bgi2XxiKF1Tb3n0TQGzbVIrZFK9NjNVk5GpmJoog10TSRK9UMrWxmyHY
 tYtcJVGeLRzcSXOBfVqdgAYS3gyOPZYMcF6s/Tvk9eZ8ABtT2B9oK4O2p
 csZUBOvJGAWbBQHB7QFINjw7uVPcaoD2AtmncVqFuVIsl9XjHNY0pI5JM
 tMy1/gi1qwj7nh1JW8f/gaar3Ek0I+qGsBXUz2J6eysx2T9XQCcw7+CDU
 LW+A65D/S1TBGrJXjBuscoCfUW6H8aYhuFAjoN0Mf6sneFuvV8Uli1Z/H
 iVCyEWKo0tDTEP344TIYnSvc5HJDXcx5XCotUmoHznRW6RHfN05D0cd3u Q==;
X-CSE-ConnectionGUID: P/nUULHHS+6CPY+EsjGOig==
X-CSE-MsgGUID: FlX6//IwQOCdBdNAsuPLpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39904497"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="39904497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:01:02 -0800
X-CSE-ConnectionGUID: lIl2tEZ5Rs6UGXq1nO9WwQ==
X-CSE-MsgGUID: kYSgTgeQRb6M1UOEr51T5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115643813"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:01:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Feb 2025 07:01:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 07:01:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 07:00:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMYn8qCifVGC8C+DF4DedNw7LWo/cyYc6zBXZ2KL52ses2CW2MGRWAw8JpzsCcSoOgnitLVXyJdOlp5oyye4q+uynpxXcVIo8XA6INurFHCDfbIfwXBAxUMPTdPIX/1MMoOhuj8IRVLooocaNNUOWhd+tdpuX62kJzDdw/EZsFwhiFdD0NaGUbCekei4y5oPmz5UFrX/MYKQTY5RxGz1x7hEwmbcLMScC/C3UTwTl9Gvz/sJ+hiUi545X+m61PMO5oFJmeIpjPTnUQQIzZj/0Pfu2kJjcSahErexwySOud30ArfyIvIHNa0o220/uV3EAtd2wA3jL6gXkz2rdNbanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMno6bFVa875yQoAWDVzyII/WcVWkICTwySoyjfABfc=;
 b=S/lyctf/6g4VsDxXjkqnACaT/0B3rQRCnOC4HgTeOT2O95/FxW3zppG1U7jpD0mYVrH+vDAGBMJO+iwKRcgibofQCUPN2j7OJTQvWVUXTmwZFTjCYavHNeh30C00p3+knbh0lMhRKyb9DS+E0CTcNl6rzsmy6CYFBRULkd2NQMTdytivACkP5tKjpHUWMcz0mWMi0els9GqUaUsbY9wNUdoklxuvWRdz0XIL4PvDqZB8znPwpx/f20N8rCIeosVipWcWxTD3DNaWgPliLMKNEKVosvxlKhjzpop5UzDXz6l835wDAwtyGQ6USUZvp2ECG5gAxNuWdRiqfjLZ//JMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.24; Wed, 19 Feb
 2025 15:00:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 15:00:53 +0000
Date: Wed, 19 Feb 2025 09:00:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <himal.prasad.ghimiray@intel.com>, <badal.nilawar@intel.com>,
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Add check for alloc_ordered_workqueue()
Message-ID: <4uovznb72ljcirafrpwr5ynkpsx66bc3gcn4xxhqpwooshydea@b7suaeje6agd>
References: <20250219095659.2613487-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250219095659.2613487-1-haoxiang_li2024@163.com>
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f1de16-8f0c-49ee-a5ca-08dd50f634af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tW0HTbCrSn/TxAI0Nw+u+RYa/xkgemSsWtM6EabwOtGQ76xoke980rznkegB?=
 =?us-ascii?Q?+s/fXzJv4GpiqJr/YVZELpCgc/tarvlB7BQJxPxnNGkmWk0WXrrJKkFQuRnL?=
 =?us-ascii?Q?OV/2FxWlnvaUNm6j3ffJYhfuuW7x2KG7LJYoM2b0WUtd0KvpwQ55lc6k3/Fo?=
 =?us-ascii?Q?+IMSlaB83XFPiQVd8OzQY6BK+tCFqvbNpPMBlMlfVoFQx61jddAqihtWhwkc?=
 =?us-ascii?Q?yoJSewV9DdX2QpX+5U6jXtPItqGMyQTh5iPH9f/jOEteSBkaF2VOsMgnZxBe?=
 =?us-ascii?Q?e+OfXTD3+9zM2nUZlw9h3jnHDDZAL1KuAwMsp1taT8hCM1dt4n6apJMDWSsW?=
 =?us-ascii?Q?HvgkQgVZ9WlaH6B2iBfX729qYMZltUAUjFuk807+yNFYejEWiF+3VLBRMKhn?=
 =?us-ascii?Q?7hHUIyNseRIAHoGRL+KqaZoKtwCBySkaUk9kTudNxKY22kh/vx87IdDurYEM?=
 =?us-ascii?Q?LsV3VOqvICTZIZ0UTPm3DZWceiINtcX/Ovxx5AgL/NJb8QriSMfRHjK+VwkO?=
 =?us-ascii?Q?6/Zi6g6gr2P0ZEJKiKkeBU2Ztkm6ODmC8/mLkaau9eodW15SFqz7fHV/zikl?=
 =?us-ascii?Q?bFy25FZ/rACY055FqdchplxFqmyyx93SJrvi9mP+w2mzhPA+z4E28h+FZFci?=
 =?us-ascii?Q?/YCApKRpIdQ7iJ7ijyn5w074Ep03Tk35p9FBfifWdXz3DblDCFGgjKIsesff?=
 =?us-ascii?Q?gMnINJPTpTI/TRCTrFgj1uFy6N4od9usKEmQ1EAatSbP7PqUIAq9ff0Ytk5K?=
 =?us-ascii?Q?B2C1nT8bQKCCYFI2v/DnuwYjxvY9DBV/4m2xxvBsnE+Q1N7ncIjCYaO3lvaH?=
 =?us-ascii?Q?zbSUMmKJMjEhfsv6OcfenhSoTwzjC00KA3nwcxxGEW4CvsWAG172yN3tlFru?=
 =?us-ascii?Q?oQ9eEekoeHAiLmHgV5k955k53zaFVYg0p0ISiIrAjydTfW62qWBSH8iFBPEY?=
 =?us-ascii?Q?3sAvNcFs5/RGtmTRP8lk6+i53f7lnEMaZGCTCOWc/wii2C72UpDL67Fux97q?=
 =?us-ascii?Q?c8Ka7Jb1ThoZPHEa2MAgdqewqfckI7TnKS0PJy59nU25d+9MXIL6F+3NawWA?=
 =?us-ascii?Q?DTL91VygAqu9b0UQQBY7S+k9/dnbgW5wj7qHnGDa8JDCxtqWI3v5Ila3yvC5?=
 =?us-ascii?Q?UU+VUtXO3AGnb+xwl+FaemOvFyWJ0qBNB4n0maRdrw2F4r+K0sp9lMhlFMIl?=
 =?us-ascii?Q?d3yPHXA1hzZIXhcXfpBJR2L96kvLSrB3Wcm3Q65RtvKuDl4ofzUf6R5+JcwI?=
 =?us-ascii?Q?VtskYs8Oyb4vNWG0A7iQAbUoDicuJpjPY/M6/8Bwyzch2gH1JZ9RjRbMt1Vj?=
 =?us-ascii?Q?5TzZBJYK/tRmrS+mnGbEz4pDJBVKWSbk34jGdHmRF3GMHI5o8gjVANaPswPD?=
 =?us-ascii?Q?Bg2FmYgH/g+R3yhLpeBKLb/goGHf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hRgfjs3sKZPAdF8QBDL9GyhX1A1cfjh3+205fJj/PRvGi3FHyjCxdFXJHNPC?=
 =?us-ascii?Q?5aug0pHviI6xDVVS61nObUKQ/8O0IHHhf49i+QvkrS0aNPGqoM7/S/db1oqg?=
 =?us-ascii?Q?n/g3+ZAkVpXplS4HsbakR66SYrvYh6U8gcThe8696DvpzpQLqMSpoIV248V6?=
 =?us-ascii?Q?w2XefQOxs0lNtnFEfIafYZTv11e+S2XeIB0ynd+JeRtocOxU8Renhn5PDb2k?=
 =?us-ascii?Q?Yflo0oI2aDseHJ/aeguxjqU7V9Si4vtev+U3olnuV9NbzciLKEB8dw6DPGPC?=
 =?us-ascii?Q?IzsSN3sM1WJGAuRykJJIODF1/gSIsF6e8Eeswt0PwBDDuCbPESiYQrGGoVf0?=
 =?us-ascii?Q?sSjJU/CbhJa068FhUkh0dzlkMU2bGpm8Su9ZCbqKo4x3ThK0xkWCV25IA9wT?=
 =?us-ascii?Q?ngKNtUes9u0OAWGM29hoxW7gMSeVn5lJAOt2zLfiMOf/+b2mBOHxVtQImqBr?=
 =?us-ascii?Q?99SK7D76NQ64TF18ZgclHwlKHoU1iSKignp2zUxKwnYk3nWWDnqlt7pmVCW1?=
 =?us-ascii?Q?4pRIcdLMn/2TMxBL+5T4eYnSWULOKviTIEgbixXFaL/LX7u4JU/riwaG5a6d?=
 =?us-ascii?Q?1HH3yBs9mrEzMKPzLuMf3OK21K9qV3MTHcEaQkDLgCWYIl+jDS0/IRBV3NEn?=
 =?us-ascii?Q?f6cF8/GVvAe2q4okRNXYYMi7+7F0Jrx/OxjQ++hOHDCf+0Ie/M6YL0saVZIJ?=
 =?us-ascii?Q?HS2OtoJE+Mefobu07GpzkiXY+uYVDlavBhlMrGQlZe+3OiDoiOl3yaT2glGD?=
 =?us-ascii?Q?S6O3SjYJfC9LO1EJwAgNwwVX5dRbbb3bqQp3IbwNW7y3PoKYI6AMeaTiy5BG?=
 =?us-ascii?Q?XAZT8YwsWc1V1bACfudCNcbv/O9mG5mnx8s/MG01vF1KQZACFMxHD2tQKYUk?=
 =?us-ascii?Q?D+xb5TGF55BYhTYzsrNMQ+Scjl9grNypGDJE+Xwfmp33L7drYjXTZGMPA5qu?=
 =?us-ascii?Q?b6sbtadQWJFdQPVHjiFKX0u8odR8AB8HtWESS9XTKy4COLXjqh3rqp0sQuOJ?=
 =?us-ascii?Q?otI53KmOa9TJe4V5Cu3SdmtMcGR4t0z9rTPxHGAWMdGFdneKmmLELqnn0Kzd?=
 =?us-ascii?Q?0nTgQTyCh58J61CMjwGQR7zsBRDPrFiEUalyr+1UhSolM0K4N4dfYlMfQ513?=
 =?us-ascii?Q?YtoXCQfFoVgo3/UuExji0WjvrUrPQdfhCE9g9u6+9wIBmtrLW/uDyCFA3FkB?=
 =?us-ascii?Q?CC3vLNTyalKMKwTJG7dtpIZv5d3hx1NYm7BlX+RfcLDI2bVbvaES/Ri7W3i+?=
 =?us-ascii?Q?PfS7VxV0Y4ATgOixKN4XzVszgIXk+JAsgcyFX+bHMc+POOKXVrj3J1epDgAp?=
 =?us-ascii?Q?GkkxcPGIw9GDxEcN++AoH3b3jfRefR+nSfju8fhulTDwxqsqRD1A3icHG/cc?=
 =?us-ascii?Q?fOUOGC+UYuGoXeS1RPQsjIHBwi86xrF2Ym2NiQ910zqVkzIo+s4FBO7GIsPf?=
 =?us-ascii?Q?IjhtVVnmtnD0aTHnpIWFc36l+AdTs1lGJiRsPM82CY2TwLSL0lSiFivlBAEC?=
 =?us-ascii?Q?FpMqYxYkr5f0TKnwfvTn4UIK3Q/Wg/hfnBCQFjt+9qf60S0yaZsH8oUw7y6y?=
 =?us-ascii?Q?YmlxqfRd8YhegVk0W31CAGmy5LoXpLzS04d93rpOsKIIC6VJ8/4FwpYsYmNy?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f1de16-8f0c-49ee-a5ca-08dd50f634af
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:00:53.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jDeLwt3hSB7VCABBIR9Zp87UPPxO0L7QrIS9QhLjo+0uiYJDeMJ2bHMgiyRzeDEh3skDpnrOWY0aoMDrN2K7h/7esHUxTfmBXTkH9Eyiek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2025 at 05:56:59PM +0800, Haoxiang Li wrote:
>Add check for the return value of alloc_ordered_workqueue()
>in xe_gt_alloc() to catch potential exception.
>
>Fixes: e2d84e5b2205 ("drm/xe: Mark GT work queue with WQ_MEM_RECLAIM")
>Cc: stable@vger.kernel.org
>Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 5d6fb79957b6..0f42bbcb8d42 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -79,6 +79,8 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> 	gt->tile = tile;
> 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> 						 WQ_MEM_RECLAIM);
>+	if (!gt->ordered_wq)
>+		return ERR_PTR(-ENOMEM);
>
> 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
> 	if (err)
>-- 
>2.25.1
>
