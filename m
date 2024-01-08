Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D188270B1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 15:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBC510E14B;
	Mon,  8 Jan 2024 14:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFF310E14B;
 Mon,  8 Jan 2024 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704722898; x=1736258898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zhBzBivI9D6JWQIW1FduQgiJMS0qWdYbGR1844eqm1U=;
 b=f64zSxD/y1vOBbFUtevQPKaVO1FMH1gLID08ftlvQRF2BWacZcmAlhtV
 KGk2vjyokDmG2lS5RvRKCitC2Jvs16pM09KNhZbRrPWIDfwGN/K/AIbrE
 VKbmOUNGi4T0V0KMudvK8Gah5a36n9nt901RKLzr7fwthP6edLsk3LoXW
 Y1WBPJa/Hqv2GktmaxHPb0M+VvF1b2t3+jrXCdTjwR1P9BmvgAh3tx9MW
 WDjySoqJpmwrvo8wXneeBhQB1iKQjaLuvSwr3RMBdCTj5P8Z34UsYcCNs
 ZFJ43a9ulOlhAFXFfqZjPOeWWzerQIoJZZKJ8aJzcBtpuj0d7LtjlPSjI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="397606738"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="397606738"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 06:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="784858197"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; d="scan'208";a="784858197"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 06:07:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 06:07:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 06:07:57 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 06:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG660G0uWpX/JEOzGt3M7vdi9xuBPWBzS7w/OiMooKv6I92ui7IrAOlyx6YqWMl6h+R23pjcvaqjcxNlPsdJW/XL3pV8mvrEUxLmQl8Yg4ckWzvhZl2wuSZGjOnigCUKa8yGyw+Bzj6ExMJ0dRsn64T7rCYWLCXKccC36jDMbElGs2u7cSjnGXXiNr2ghks8eTTn/n6OVzyU75Ui5Qt5/2oSKTCYWRCH+DSCsNWurE/eMvt9JaQ6p3GOqw5Pe4LwpGl3ZN5qwDiDtk92jzdmrh3lBbVKvZReEQ7hea9IK86hs33Icoj+93eGChcRMNnv3BoMLeDf1HPHoxrQT6cB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsJaZU2RDIuEk3mvejdrqw46eeZSNb5TkajuuF2fBhc=;
 b=RECP0d/WDiu3kG9xnF3RIxLsJifYlCfs2d/TpNAAqyJdYXOmllFcXN0Ttveh97SrdFK+v613dqYYuvFO9Ro3mqZBgTp0gKB41L60OGEHLnKE+ACd+3XrTIVnHIEH7YKzk1eQrtVBUfDi7ZKEqSUGicjhYbwahLKjPmQrPFG392j5X6wvLDBx4S9VZfj8OkB0pqGc95UWse/E786UKuSLUxEhRX/b2xJdScDu7eS3ZQsrjV/wN5bVKe4LSY4i8wZKxadwPSsBQo5OgUj5l1kYM7wjibQxLMz8b5wc/fPBceXiYgn7m2CwNZeTIb+Fp+S5QgCiJU6G54ghrPn0PxvwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 8 Jan
 2024 14:07:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 14:07:55 +0000
Date: Mon, 8 Jan 2024 08:07:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
Message-ID: <e5g3qkwvc3sjfpxcdvn43fiwbxthpblqgg2getxpbkd6g4lp5k@pgfm75tsg7wz>
References: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 90516738-6d41-4a45-9170-08dc1053359a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvDtjYzpzI7bOEeUuZtAjqxtJ8cK6P3DTwGAPdggOcaSC9VDiKEwD5Qos1L7CZnNGuwVhSr3GUNnerHY3QIrjzZnVxYYC/76TeJsxR+0aYmcHxzDPCZL26QpZAPTIjs8bh4DfTOgyeRKSnmAGMDq1SANGFm2x5ln17i3d+ZGUISd0K/NBoBa4LSbZrUF55pu6zAGFhbNs4vuC1RRrtF+Bbg/W0YaE2I6ZWWThE86spj3CTfxt3wcC328BqSC5ntu5R1JOYJoJuZqM6yJuwYbpizEWfdv/jQoXXIXWgXGIydUMlSSyhU3voD7tM+w/djzZeFH/zWrPiVEEGaGUEmKFQ7bNqO420YGITMM45z6zjDTUgPrm+AnmnUQHHW9ojI80G4k9tcyJA1eyE7592Mi/18DF/KMKRGT7B5Atcw/f480W5oh0DNAoaqkLBdfcuZ8DJUpEmk/1gIC2oyRHvSJYyu5Cy+wSt48xRmep715exWEFk9VZaauis5gufhaIml9GIetFfdTMLsf/Rv1Gj9B5Al4OqgcDzEJCNJdIiKTJBh8nbOcRKdQKBm0pYZRBwnN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(26005)(9686003)(6666004)(6506007)(478600001)(6486002)(6512007)(38100700002)(86362001)(82960400001)(5660300002)(2906002)(33716001)(41300700001)(83380400001)(66946007)(6916009)(66556008)(66476007)(54906003)(316002)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yKluJnoK42o5P6YsjI9nivMcLAlMjDhgs7/QAezE8Wz7d/prweF+3kTcXcxV?=
 =?us-ascii?Q?vKF56PqV2Xj8HtwFeARr7lq28+gnw/OBmxHchq4RFNV7hPLk+vyE7H8DppaZ?=
 =?us-ascii?Q?B8MAwVUJGDZFlsD+akizdnBA1yAZvacmDKe9PUbTpGhiqKHZkbhmKrXc5hhR?=
 =?us-ascii?Q?pj91aMCZtYRte8klKbqu2OefyNLI/xYAsrVuhdHdYeDnoF23qwf9olOhgQiW?=
 =?us-ascii?Q?7R/9NiXPvwZB1hDBevmPKlaK143aRfM+N+dIUmJrOm2alRJA7aIXmMX838Fu?=
 =?us-ascii?Q?oGjaxq+xhUw/VlA/5yeSVI+0nEowCcsKou9wRG/Bn2+e9cVgc09buuK3JZzg?=
 =?us-ascii?Q?f+zh+fmdu5v/EU3OxPctITg5mTBXo7ZTkx7fY3EOw7cHCkulmOlkU09eN9/j?=
 =?us-ascii?Q?cn3ytASj76KvrvUwCil1ZK/nfwq9U+bp4JXlTaxg7AIbef958RY9bAymCGWO?=
 =?us-ascii?Q?/w2bvub14xBMmIsgpaumA4Pp2XzOUoXGtaH+G9p+tuzjjOVmgbmysamigiBG?=
 =?us-ascii?Q?1EknGqWBjwNSFdYfygBb75NLMDqVJ/13m4gOuQFdbnUuiq41VFe2wSq7RckU?=
 =?us-ascii?Q?1sSFIA5szUCrjdRk2acN1MjWEIjtNz1AuczUfR0N0fyOhuQ+djOKXL2yQZTw?=
 =?us-ascii?Q?ApOrswerhgnlI4zLDIQZU4uU9hYSR4C9myd4JDl5d3ZqgSiyzkPoQBX0dEl3?=
 =?us-ascii?Q?HLyNC9vhSi4Qr7lQpPcg95dPPxfm5IJ++EV9ICHWIpEs7JTtswtwGT6+3FCt?=
 =?us-ascii?Q?oil5YqacdCX7VkaCvxHLhbbHSnM1uGPdrVLEytnHDheA69MUwODmpjU/4VpH?=
 =?us-ascii?Q?nSoQHWV24LavyJ6tunXm22RWKFHpwHPmGp2OWzq1ZksjCGlrtec6oAK6Cewn?=
 =?us-ascii?Q?wzAcgGxi/LNE/e9lXXvWWVvo+qvQEzLIQpuMa8FTH60BlNs/QA2tzQPghWFE?=
 =?us-ascii?Q?BJHmOHuBp1j+lIJH69cdrRjbxYxJ00mYb31fpqu1b/D9D5TtNs9KQKY4VAlz?=
 =?us-ascii?Q?xompaTLmvqs6nldJUt5/0P3be0NLtkfrDprHvw4nYEP5sC/4Q4T97dzdVGEo?=
 =?us-ascii?Q?9Ow1RK1CJvrUvYyCaQGZ5PBDpS0Tw9q+8o5lo4e6qYNCHc0R3HPLLzDD335L?=
 =?us-ascii?Q?upjCbX3Kmnk3MMu+7iQVAT3sm94+oMmG+wmS9kinqwwiLXulNlVEJl/xeTOV?=
 =?us-ascii?Q?QrZHjxGwZlCGqK3iIVJLMinH74kBL6C/t0kOtMW9hOVrdo9oZsq1f15ZIcVc?=
 =?us-ascii?Q?43JZplzzEe8YlWISHMRqHHPzBh4M4Hb8tYns8tBOtNRBqYGougYysyfoHmN0?=
 =?us-ascii?Q?hKlX4RF2SpDp/PxHk8WdHdpnCi/c+ZsQHzFurV/4heNPftQoOe0/cgBwu1uV?=
 =?us-ascii?Q?FkED1UtRddUdBtO9pUezhs8WN6Ct/qpzURTLeumUJJUO0W8rVTI0ImEydtGe?=
 =?us-ascii?Q?jtQJMCfKoXJqhiw2Csd6zdEOLrSkwIJnxTEwFlw2M3nWVGESPLWH0b7ojxsK?=
 =?us-ascii?Q?kPdutGmwt2IvgNqRFcEMz2Uw/4pKUCLuiru4y6a5E/QFFUEHF2F5Y8bcfgio?=
 =?us-ascii?Q?he+cbwCptUBcyZY2ytvrafs6WZpd0GCRthB5VnXelbyv2cEzfnLm9//cPmO5?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90516738-6d41-4a45-9170-08dc1053359a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 14:07:54.9473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqPnN6nyUUtIjiUMXGAWnQOQ8kZDLOI8DEpBuFpATl71ZhIIIefxx47XBLY+Rj4nZ7D52wnJgpt4+PdKkch9nUIYokYmznGsA0UGy6Qf6PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 12:05:57PM +0300, Dan Carpenter wrote:
>The GUC_HXG_MSG_0_ORIGIN definition should be unsigned.  Currently it is
>defined as INT_MIN.  This doesn't cause a problem currently but it's
>still worth cleaning up.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

it seems there are a few more places to change to follow what was done
in commit 962bd34bb457 ("drm/i915/uc: Fix undefined behavior due to shift overflowing the constant").

+Michal

Could we eventually share these abi includes with i915 so we don't
keep fixing the same thing in 2 places?

Lucas De Marchi

>---
> drivers/gpu/drm/xe/abi/guc_messages_abi.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>index 3d199016cf88..c04606872e48 100644
>--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>@@ -40,7 +40,7 @@
>  */
>
> #define GUC_HXG_MSG_MIN_LEN			1u
>-#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
>+#define GUC_HXG_MSG_0_ORIGIN			(0x1U << 31)
> #define   GUC_HXG_ORIGIN_HOST			0u
> #define   GUC_HXG_ORIGIN_GUC			1u
> #define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
>-- 
>2.42.0
>
