Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C08672D0C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 00:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8824710E872;
	Wed, 18 Jan 2023 23:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C294910E217;
 Wed, 18 Jan 2023 23:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674086118; x=1705622118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bwWS0cYFu/fwZBK2Z/AEZNU671KPaoKkvvsKJfJPMZ8=;
 b=gCIPTSRSPcD749PqnBrD2Q0P0osPjL93mK5rjg41JLnDRfxAUdiF8Gwt
 w7Ykj/QKnTzYAfpIXlfhfTuTpxGURubnJXN8PI5GfwKVmns8qSsikBAuC
 WDvtQ3m215u2u2oNecPoDcAfGy/O0Svw7vV18xo6NCoSKz8lAZNadtE5P
 X/5hpPlX7pPtSZ3GZinksClk05LK8ugaiGxHXGyye6GcXBDPTZrkarbv4
 uyr+fzeuQdLTv7F9Y0JNNSdyo96BwZ8bnaRJl1CEPxR2sndNiDm/rSMF4
 o2nArs+Ln64oNz7FZOZZgCeWWityTgw6uRjvJOvmyBC32AvIP/rH23f3w g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323823723"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="323823723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 15:55:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833781201"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833781201"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 15:55:17 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 15:55:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 15:55:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 15:55:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8KLRJ/Gal5+KDURjdI82kFGreIqs4Tjs4fzv+0+aK7qXr6AQie7ZeM7EBrt9wN5QwopqQEF+Ul+Bc/fzfres62dqBlNWidisnWRKWyemxvucwMfWyIz1U6aNsbG0J/wICwf9JwTXXLFsHv/ZOjwRl3HWf1sgf2O4/S2+oK7eQs4dCVZFRn7i167/mZ+X07ttsuCx9tIPb9dZ+8TLFEIyaiJSRhLzCKcKumRLYy/QB7Ruo5Iy+y4O3GeqKm15Ahvrm9Z/8+ivkjCM98f3ofyp2VESTxrSwRFytgJNCAOU7B4tDuYAXqTYsz92XtFz9GdF8Jw9kohLsllietSao6yvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boQFO8LP7hVl25TVGjhHKczuQ50lk8x7H/+xWQn40LY=;
 b=jKLZHDX8RjTKEEF2BeAQ2xnGXBiUFFLAQgDAyEM9bnuLWV/IIV3lMvtqRsgDAKdUAXWQBI7uYKcf+Y2HwMELwAEH0orwTZrnpKJdaXG0MXvLemrlV46nfOR9HF+XPVJnOLwgROkA9MbaUA4upypgGbMQJF+Dn4kUFDEhICsML9V6vGIG+qvZGbHUdmWV+61KUettDHqP5aeMHVL+tNE83d9Vdb7z7bssBmoZnzGDdnnIeO6Q/b7MSlk816CA7gR4RAvkFj7fBI3XB0GEU6NFDlXUAAZf4Oico2sYbVmzSkz4dprrxWIqnhvtpHimIv8cd2HVJ8HVSQ2jgqPA4TUuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 23:55:15 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::166f:f9d8:6041:9f28%9]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 23:55:15 +0000
Message-ID: <133fd096-818d-e0dd-0370-908a8ef9917e@intel.com>
Date: Wed, 18 Jan 2023 15:55:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/9] drm/i915/pxp: Add GSC-CS back-end resource init
 and cleanup
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
 <20230111214226.907536-3-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230111214226.907536-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::19) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5475:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d1125a-7bf1-4b28-201b-08daf9af71ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNzjBlfMJZB7pghs8pDSdlZu8AHltXFjsr5oCXteNLUmEtZHhfQBRVPYrzSmfSYTVFK1lLa1OB7FALMDr99GYeIaUVuoS+hIHKcsMGNlLRuDi5fIGhYsGLuyxwZYjN2j35l5clLXSPrDGYBoWV0dSq73k36vy5iIwGk7kQ9pRAKt93RGMLTeGQoBojHYXZpewhuwTBRMOGpbUE59jZ/5X9QBiLq+lhy5uRNe0lMKiz6Vf204++p2Rpc0WcCO3o54mPEARu76md1romJZDAu96uOe8PbcQOR0DovSieaj73C4EpOaTzW+DLxO9nkMGTnX1/9pfaSL59Z0XxF0IiiESK9U+rVCQ86EHhZ11Seqp3C99kcUejpiTApJzOo6oFePrBF2g5DthyMEXA+2RBuN42RwEBpyngHeN8i1rJmoFZhJpOlCCSZBqwV8cD10FAiCD1S2xYCc7y5ZJYeVtnVMWdzPj1EXmPW6ozE3bX3RwVheNSE5ZQOva3tosvwcTUFzOHEFOgzZdv017EQcdjkNLP/uXzjYDPMdp5NcuKn5ZsVD5qgBSzK0E5y7UaQJwVkFOCa977ty9FsnDWD/FXKI+2tuALoYWLSOZKL+da0xSrW50fIQ/1HLToP22Uy2eFGBW8B2IuOyuNkSjV3ueHMfL67vOG/1Wg+I4dla6MOZ0HiU8R6ROuR+D/9nq2No70lyAdPnV+Dl+py6FfC+wOtm58LQyhpszV2KiKPUOkwHBCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(31686004)(53546011)(5660300002)(66556008)(186003)(6512007)(2616005)(4326008)(26005)(66946007)(36756003)(66476007)(31696002)(86362001)(41300700001)(8676002)(316002)(82960400001)(8936002)(2906002)(6666004)(6506007)(83380400001)(478600001)(38100700002)(30864003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExCN3ZubzRTRWpsOS9LZC9IVS9NWTJHTER0Y251NE5kckVWWExBamlyTjR3?=
 =?utf-8?B?YWg2cGhYaDZYelVvc01Tdmo2eEcxUGlOMGJWTVV5NWxMaCtobU9iSmxLMzgx?=
 =?utf-8?B?ZDV3ck5hZnJkV3pkWjVxbFM5ZEFjZS9sRDAwQnlkL2N3Z004QTI2cWQ2QUVQ?=
 =?utf-8?B?S0hLbHg3a0poNFFiNEVDTXZtRlVHckdJZTdIQldTbFBHNUVuMUxZNGZ5Vi9p?=
 =?utf-8?B?SG9TK1JRZWhka3ptNzV6ODEvK29VMndFcVF2UkVmdFhTY2NIYmZwcEt1YUxU?=
 =?utf-8?B?K1pSditnOHdnU2RxT2NsZTRrL2xsNkErcUtGSldPM1hSb1BSTFF2VFVuamtS?=
 =?utf-8?B?Z2hEMmNDTFhwRU5raWdNYmkzd1JINWdSbDlhZkl4L3F3TmdIU21od1kwK0Yw?=
 =?utf-8?B?Z3JHaHFMT2J3YmpvNUVWRTJVYlNRT1hoVnZBRS9SRkJ2NGFUdXV6Y29ka2FY?=
 =?utf-8?B?dmgzK0FQa1VjcWV4MG5QdW9xWVpjN1NVNEl6WkY4TldlY1RvL1VHdldkd0M0?=
 =?utf-8?B?Yk93MVh6WTRoczRVNkRWZE0vVGlzODNyc01CZFp6OGhJQit2eFhFNGVoYTNj?=
 =?utf-8?B?UG9EMG01d3BsTlFZRy9tRnpRb2JmbEYrVHRSeDF1ekFXR2wwQVpvUEVZSUhk?=
 =?utf-8?B?enNCQUk1Q0IyL0ZLZlJEVlhVd3pNcXVZNU9uRnZiTnAvOVlHV3pNRHVMb0JF?=
 =?utf-8?B?czVvcXU2VmNzd2poRDVYNGtkWWh2MDhuc09tcjVmbXl4ZmJFZDNDNVU3VjIy?=
 =?utf-8?B?elFrM3Q1cFJQZk81V0tiWkkxalpwcUxpWmZJOWcweTNuVGdBZ0h0djUrY3hi?=
 =?utf-8?B?dVQvcytZaEt0RFBxUXNHRFZtZ3dDTDZXSUhscHh3bEkxZUdYUGJ5WW5QUzVP?=
 =?utf-8?B?VWprMzhISFJWbVU2MTNoVGcxK0VUc1JIa3JHemE2T2lubyt4NWR3NXJYazZn?=
 =?utf-8?B?ZUZKK2l3SDJVOUNFazBGK1l0ckhreDB2bDBTMEVOZDAzNVlxZGdFRXlkRzJT?=
 =?utf-8?B?WUpDZGtpbm9PRXVDZjR2bVl0R24yNmg0Mkd3aFR5L0hQQVdZRTgyV1VIZ0Rr?=
 =?utf-8?B?VmVua3JXWlJJYlBldnhWYlNmOEovOHVsb0REd3pPKzB1Z05TaVdicHhjell5?=
 =?utf-8?B?b0dMbStHWDNqQStUZkhXa1ByWm5DTzhYdmg3aitrY2RKNy8zQmJkUlVkNmYr?=
 =?utf-8?B?L2ZoL1ltcTd4VzJPMktyZ09OaW0yRnBnc1FoTVFDOTEyVURDcFNnbDV5WTUv?=
 =?utf-8?B?UitNY1VBNTN1S1lna3FwQ0h6WjFieGtnbFZDRThoUERoalZ0bzdjZWxNamVv?=
 =?utf-8?B?N3UyRmsrRWtFbmYxSkZValZKRm1vbERMSnFRT2pPZDd3WWxMMmhKdmsxQUpo?=
 =?utf-8?B?UzdZcFlkQlRwVmxTWHU0ZEFUdXRqRzlNNFVpWHJkMWM3cXRUbEQwZlJTOURj?=
 =?utf-8?B?M2Y4c2hCV1ZCY01RTThHaHpMdWh3WDFRYVkrUWtRMWUwUkFGazFLaWNUV05t?=
 =?utf-8?B?bnBESGtBeEtnbDdiTGFHK0tlUSttNmJYKzhRVlhNZHJ1bzMwTjBmandpajJq?=
 =?utf-8?B?cXFBV3MydW1VaG9PdC83OEErSmtFUGJYMjJUNzhhUWFwV2d5K3dWYk9RVzFP?=
 =?utf-8?B?aDVPMDZCK252K2JyZGhJUzBBcjk0SnZ1NkovclUweExRa0pFMWxxL1p0R0Q5?=
 =?utf-8?B?S3pUcFpKaHlFSUk5WmFkZ3RPM2xRb2FtWXdXVjN0WksxenhPd1M5RGo0anR5?=
 =?utf-8?B?ZU14Q0NQL1piTm0vQmxzNkdYNHBJY1ZtR2x5Mmg2UTFYS2dxdk9oaUJ5Nmw5?=
 =?utf-8?B?MzZVM0NUZ0tYQWRidWZaVmtwM2VaOExpR05PWTJ6STF3RDdoSHU0aWFDYzFy?=
 =?utf-8?B?OWo4dzZRdEpadFZlTW4vUTVEWlpuR0JKR0d4TXF0UTRFYlFRSjI5aStaVlZ4?=
 =?utf-8?B?THBPSkFNTDh0MHhjUmZKVnVzOXk4NGcxL1cwTEFONi9TVTFMdWVZOWNLSFRJ?=
 =?utf-8?B?M3BtakxpNms4WTc3VjRrTlNKTk5UTGY2MktEblRyOXplZU5XUk1aaEJCNUZy?=
 =?utf-8?B?VGNMalhqVTVqNXNXY3llREVNVGNna1o4M1AyZGdGQ3JkQjl2aW5BbEJja0Vu?=
 =?utf-8?B?NTlJaVlQUXpkYURQSE14Yk1qQy9ObGZtdG90ZUVKS0F0UGRKVHNjOUVJMjFu?=
 =?utf-8?Q?oaUhzRKxLX8fFvlG0VFcD5w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d1125a-7bf1-4b28-201b-08daf9af71ab
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 23:55:15.0166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMaQiH8WrxH3QtPqYesQHlNug1gzUSec1PpJ6aiqNxcFmlqln8rx9beivQyy+YsBxDoCOeE02XWbL7fARdWqKmmACacYA9TkVUyXbZ8LJyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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
Cc: Juston Li <justonli@chromium.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/11/2023 1:42 PM, Alan Previn wrote:
> For MTL, PXP transport back-end uses the GSC engine to submit
> HECI packets for PXP arb session management. The command submission
> that uses non-priveleged mode requires us to allocate (or free)
> a set of execution submission resources (buffer-object, batch-buffer
> and context). Thus, do this one time allocation of resources in
> GSC-CS init and clean them up in fini.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |   6 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 216 +++++++++++++++++-
>   drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   5 +
>   3 files changed, 225 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> index ad67e3f49c20..52b9a61bcdd4 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
> @@ -10,7 +10,11 @@
>   #include "intel_pxp_cmd_interface_cmn.h"
>   
>   /* PXP-Cmd-Op definitions */
> -#define PXP43_CMDID_START_HUC_AUTH 0x0000003A
> +#define PXP43_CMDID_START_HUC_AUTH	0x0000003A
> +
> +/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
> +#define PXP43_MAX_HECI_IN_SIZE		(SZ_32K)
> +#define PXP43_MAX_HECI_OUT_SIZE		(SZ_32K)
>   
>   /* PXP-Input-Packet: HUC-Authentication */
>   struct pxp43_start_huc_auth_in {
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> index 21400650fc86..97ca187e6fde 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
> @@ -3,9 +3,41 @@
>    * Copyright(c) 2023 Intel Corporation.
>    */
>   
> +#include "gem/i915_gem_internal.h"
> +
> +#include "gt/intel_context.h"
> +
>   #include "i915_drv.h"
> -#include "intel_pxp_types.h"
> +#include "intel_pxp_cmd_interface_43.h"
>   #include "intel_pxp_gsccs.h"
> +#include "intel_pxp_types.h"
> +
> +struct gsccs_session_resources {
> +	struct mutex cmd_mutex; /* Protects submission for arb session */
> +	u64 host_session_handle; /* used by firmware to link commands to sessions */
> +
> +	struct intel_context *ce; /* context for gsc command submission */
> +	struct i915_ppgtt *ppgtt; /* ppgtt for gsc command submission */

The arb session creation is a kernel submission,  so can't you just use 
the default kernel ppgtt (i.e., gt->vm)?

> +
> +	struct drm_i915_gem_object *pkt_obj; /* PXP HECI message packet buffer */
> +	struct i915_vma *pkt_vma; /* PXP HECI message packet vma */
> +	void *pkt_vaddr;  /* PXP HECI message packet virt memory pointer */
> +
> +	/* Buffer info for GSC engine batch buffer: */
> +	struct drm_i915_gem_object *bb_obj; /* batch buffer object */
> +	struct i915_vma *bb_vma; /* batch buffer vma */
> +	void *bb_vaddr; /* batch buffer virtual memory pointer */

You aren't actually making use of any of the variables in this struct in 
this patch, apart from initialization. Some of those are pretty clear on 
what they will be used for (e.g. the context), bu others are a bit more 
vague(e.g. the vaddrs). It'll probably be cleaner to reorder things so 
the more implementation-specific variables are added when they're used. 
I'll try to add more comment in follow-up patches.

> +};
> +
> +struct gsccs_teelink_priv {
> +	/** @arb_exec_res: resources for arb-session GSC-CS PXP command submission */
> +	struct gsccs_session_resources arb_exec_res;
> +};
> +
> +static inline struct gsccs_teelink_priv *pxp_to_gsccs_priv(struct intel_pxp *pxp)
> +{
> +	return (struct gsccs_teelink_priv *)pxp->gsccs_priv;
> +}

Why do we need this layer of obfuscation with the void gsccs_priv? it's 
not like that can be assigned to anything else but 
gsccs_session_resources, so why not just have a pointer to that?
If you want to have different priv based on the backend (mei vs gsccs) 
than it should be a more generic priv and be used in both cases.

>   
>   int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   				   int arb_session_id)
> @@ -13,11 +45,193 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
>   	return -ENODEV;
>   }
>   
> +static void
> +gsccs_destroy_buffer(struct drm_i915_private *i915, struct i915_vma *vma,
> +		     struct drm_i915_gem_object *obj)
> +{
> +	int err;
> +
> +	i915_vma_unpin(vma);
> +	err = i915_vma_unbind(vma);
> +	if (err)
> +		drm_dbg(&i915->drm, "Unexpected failure when vma-unbinding = %d\n", err);

I don't think you need to explicitly call unbind here, it should be 
automatically covered by the object cleanup as long as it is unpinned

> +
> +	i915_gem_object_unpin_map(obj);
> +	i915_gem_object_unpin_pages(obj);
> +	i915_gem_object_put(obj);

If you don't explicitly pin the pages (which you don't need to, see 
comment below) the whole cleanup in this function can be done with just:

i915_vma_unpin_and_release(vma, I915_VMA_RELEASE_MAP);

> +}
> +
> +static int
> +gsccs_create_buffer(struct drm_i915_private *i915, const char *bufname,
> +		    size_t size, struct i915_ppgtt *ppgtt,

personal preference: IMO better to pass a generic "i915_address_space 
*vm" to this function.

> +		    struct drm_i915_gem_object **obj,
> +		    struct i915_vma **vma, void **map)
> +{
> +	int err = 0;
> +
> +	*obj = i915_gem_object_create_internal(i915, size);
> +	if (IS_ERR(*obj)) {
> +		drm_err(&i915->drm, "Failed to allocate gsccs backend %s.\n", bufname);
> +		err = PTR_ERR(*obj);
> +		goto out_none;
> +	}
> +
> +	*vma = i915_vma_instance(*obj, &ppgtt->vm, NULL);
> +	if (IS_ERR(*vma)) {
> +		drm_err(&i915->drm, "Failed to vma-instance gsccs backend %s.\n", bufname);
> +		err = PTR_ERR(*vma);
> +		goto out_put;
> +	}
> +
> +	err = i915_gem_object_pin_pages_unlocked(*obj);
> +	if (err) {
> +		drm_err(&i915->drm, "Failed to pin gsccs backend %s.\n", bufname);
> +		goto out_put;
> +	}

You're doing a vma_pin below, so no need to explicitly pin the pages 
here as the vma_pin will cover it.
Also, do you need the object to be returned by the function? As 
mentioned above, the cleanup can be done with just the vma pointer and 
from a quick look I don't see the object being used in follow up patches.

> +
> +	/* map to the virtual memory pointer */
> +	*map = i915_gem_object_pin_map_unlocked(*obj, i915_coherent_map_type(i915, *obj, true));
> +	if (IS_ERR(*map)) {
> +		drm_err(&i915->drm, "Failed to map gsccs backend %s.\n", bufname);
> +		err = PTR_ERR(*map);
> +		goto out_unpin;
> +	}
> +
> +	/* all PXP sessions commands are treated as non-priveleged */
> +	err = i915_vma_pin(*vma, 0, 0, PIN_USER);
> +	if (err) {
> +		drm_err(&i915->drm, "Failed to vma-pin gsccs backend %s.\n", bufname);
> +		goto out_unmap;
> +	}
> +
> +	return 0;
> +
> +out_unmap:
> +	i915_gem_object_unpin_map(*obj);
> +out_unpin:
> +	i915_gem_object_unpin_pages(*obj);
> +out_put:
> +	i915_gem_object_put(*obj);
> +out_none:
> +	*obj = NULL;
> +	*vma = NULL;
> +	*map = NULL;
> +
> +	return err;
> +}
> +
> +static void
> +gsccs_destroy_execution_resource(struct intel_pxp *pxp,
> +				 struct gsccs_session_resources *strm_res)
> +{
> +	if (strm_res->ce)
> +		intel_context_put(strm_res->ce);
> +	if (strm_res->bb_obj)
> +		gsccs_destroy_buffer(pxp->ctrl_gt->i915, strm_res->bb_vma, strm_res->bb_obj);
> +	if (strm_res->pkt_obj)
> +		gsccs_destroy_buffer(pxp->ctrl_gt->i915, strm_res->pkt_vma, strm_res->pkt_obj);
> +	if (strm_res->ppgtt)
> +		i915_vm_put(&strm_res->ppgtt->vm);
> +
> +	memset(strm_res, 0, sizeof(*strm_res));
> +}
> +
> +static int
> +gsccs_allocate_execution_resource(struct intel_pxp *pxp,
> +				  struct gsccs_session_resources *strm_res)
> +{
> +	struct intel_gt *gt = pxp->ctrl_gt;
> +	struct intel_engine_cs *engine = gt->engine[GSC0];
> +	struct i915_ppgtt *ppgtt;
> +	struct intel_context *ce;
> +	int err = 0;
> +
> +	/*
> +	 * First, ensure the GSC engine is present.
> +	 * NOTE: Backend should would only be called with the correct gt.

typo: should would

> +	 */
> +	if (!engine)
> +		return -ENODEV;
> +
> +	mutex_init(&strm_res->cmd_mutex);
> +
> +	ppgtt = i915_ppgtt_create(gt, 0);
> +	if (IS_ERR(ppgtt))
> +		return PTR_ERR(ppgtt);
> +
> +	strm_res->ppgtt = ppgtt;
> +
> +	/*
> +	 * Now, allocate, pin and map two objects, one for the heci message packet
> +	 * and another for the batch buffer we submit into GSC engine (that includes the packet).
> +	 * NOTE: GSC-CS backend is currently only supported on MTL, so we allocate shmem.
> +	 */
> +	err = gsccs_create_buffer(pxp->ctrl_gt->i915, "Heci Packet",
> +				  PXP43_MAX_HECI_IN_SIZE + PXP43_MAX_HECI_OUT_SIZE,
> +				  strm_res->ppgtt,
> +				  &strm_res->pkt_obj, &strm_res->pkt_vma,
> +				  &strm_res->pkt_vaddr);
> +	if (err) {
> +		gsccs_destroy_execution_resource(pxp, strm_res);
> +		return err;
> +	}
> +
> +	err = gsccs_create_buffer(pxp->ctrl_gt->i915, "Batch Buffer",
> +				  PAGE_SIZE, strm_res->ppgtt,
> +				  &strm_res->bb_obj, &strm_res->bb_vma,
> +				  &strm_res->bb_vaddr);
> +	if (err) {
> +		gsccs_destroy_execution_resource(pxp, strm_res);
> +		return err;
> +	}
> +	/*
> +	 * TODO: Consider optimization of pre-populating batch buffer
> +	 * with the send-HECI instruction now at init and reuse through its life.
> +	 */

This looks like a nice optimization, and it would also allow us to drop 
the bb_vaddr variable from the struct. If the only heci message we're 
ever going to send with this object is the session creation, we can 
probably also fill the "send" section of the pkt.

> +
> +	/* Finally, create an intel_context to be used during the submission */
> +	ce = intel_context_create(engine);
> +	if (IS_ERR(ce)) {
> +		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
> +		gsccs_destroy_execution_resource(pxp, strm_res);

we usually prefer onion unwind to calling the full destroy function from 
the create one. Not a blocker.

Daniele

> +		return PTR_ERR(ce);
> +	}
> +	i915_vm_put(ce->vm);
> +	ce->vm = i915_vm_get(&ppgtt->vm);
> +
> +	strm_res->ce = ce;
> +
> +	return 0;
> +}
> +
>   void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
>   {
> +	struct gsccs_teelink_priv *gsccs = pxp_to_gsccs_priv(pxp);
> +
> +	if (!gsccs)
> +		return;
> +
> +	gsccs_destroy_execution_resource(pxp, &gsccs->arb_exec_res);
> +	kfree(gsccs);
> +	pxp->gsccs_priv = NULL;
>   }
>   
>   int intel_pxp_gsccs_init(struct intel_pxp *pxp)
>   {
> +	struct gsccs_teelink_priv *gsccs;
> +	int ret;
> +
> +	gsccs = kzalloc(sizeof(*gsccs), GFP_KERNEL);
> +	if (!gsccs)
> +		return -ENOMEM;
> +
> +	ret = gsccs_allocate_execution_resource(pxp, &gsccs->arb_exec_res);
> +	if (ret) {
> +		kfree(gsccs);
> +		return ret;
> +	}
> +
> +	pxp->gsccs_priv = gsccs;
> +
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index 43aa61c26de5..fdcb9a66f691 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -32,6 +32,11 @@ struct intel_pxp {
>   	 */
>   	bool uses_gsccs;
>   
> +	/**
> +	 * @gsccs_priv: GSC-CS based tee-link private context.
> +	 */
> +	void *gsccs_priv;
> +
>   	/**
>   	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
>   	 * module. Only set and cleared inside component bind/unbind functions,

