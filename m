Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBC05E5D2E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 10:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E510EA7B;
	Thu, 22 Sep 2022 08:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0402C10EA7B;
 Thu, 22 Sep 2022 08:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663834582; x=1695370582;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y9wvCA8MNcGQiI+l1Qwy8xhzXlbUZd3m9vPR5Vbzfmg=;
 b=oJ8ekZ9geaWkI7iKaQsjGuYQcX8V8F/BIcKR2xv+deO3qzFZoUVLx9YK
 sMtKJs6YTl+8xTiUoimFPU2u2hLVWGI03WsSqe5MOgMG4DvMQzFIS6nZg
 ztOWeLWgZbUk2guYol9Bk+bEboNSdTglu7apc60dRK8Gjp1Usc/Jv9xcQ
 m9yXu1IpOtE+JBJtMcn+OhQripADETjTAfPplzqEkKq6M5yUJXU/aOzex
 kucZXulmcBAcseoc7bvwDAKcOz8uJeiujClNBNa2faSwNsmNX3z3g+eBV
 gPnAvlCFqRzBiCePrTaHW9O+Lg/NysAP3H4KuQ47mIQmEzvztCxBIDmuC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386523403"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="386523403"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 01:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="723563170"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2022 01:16:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 01:16:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 01:16:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 22 Sep 2022 01:16:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 22 Sep 2022 01:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckCngs6ER8yLtx9AM4pudIaRNSfsAb5qrmiXEggTgWODbZeILoR7O6wZ9Z2DllQeAZxChdcRurvKBy+BNTISVJgBGb2umCnCdji3y+iUh6di9kY+Awp3D7ZxUSQ5/CF29zd9BQmiQVpDrCv8wOC82gWbgqwNArpY2TnQ5l2FPVeqH8TS5aSLXxGzy0VORaXWXWYTJTgSHTIsefjecvxnicXr1CRd2NE9bNJPlppThV1uKlMuJ+QjOH0N3yKxC+6mi0rvCM6UBldLMgheDbvHo5pxBIhTpxDWZuPNz3Cj9Ih0+neR/Pil4ESskClmFWeYH9eFAYQ+t4vGCuMuWQLxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoBVlbKyqLjfUm174IUkxE2skkefUMPuoQ8oA742Lf4=;
 b=IGzU6P91IVh9Y/3oFOP5r6yHcCnpjd0yY3Q7mWr0h+Sknmz3i1+w5nIeD+wBVyEjRDMaX0UvQCcgNDdCYBdIr2PKrmli8C1U5cuLwe4F1XAT8czdBJ2TBoMGrCCrAE2rr5W+Y+4H74Wxh8flMCRS8Skp2mWoy3jcbM1yItiEpA2BAo9r/xfl6ijfHsW7HILVuA0j+YDcNHi4bgUjmf1URZGAkc3d+vnheBgmgc96iJI6Cw14zo/fJC2fTY2je+dD5bQol+xW3akBG3SU76hoiFtKjU1m+4eCB5ur5GZVu/GphJduDtxFzzFWLVwr/KTNUfA/d/FaUx7Bgt1dMWmazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 08:16:18 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 08:16:17 +0000
Date: Thu, 22 Sep 2022 13:46:08 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Noop lrc_init_wa_ctx() on
 recent/future platforms
Message-ID: <YywZyOTQPGL+txP3@bala-ubuntu>
References: <20220907230841.1703574-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220907230841.1703574-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN3PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::15) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SJ1PR11MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b3294b-5455-47db-ac86-08da9c72b93b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzcRPnLDRZmINlYodNohEY6sXeTIZjpjngWamH4ZjkL4obu1Z390IyuyJZ9c2BT/5y7WGslFfHVn5HtMJzMWsP+/kprBwdkumbwRa4qEwfOBSyVL3v1+Ut8wFS8Oizsb/JdK1ybS8D6zcPz3HVRVrZ4jBNavHYOtEAOfyYIR1b5w434BlpWewrWexHqyVpoiId0S8g34KSOyUZiBixsmyuUqbIESNX/I7TWtn+zJ/YJQ1tWJg9C+ULQvMyFDmBD+CbYTrLWa1I6HKPcPfcSbFl4x00oIWBeBsru5+oqz4VGhALKNO/CWSx15uAttbxpcwvJde80Dat52+4UF2Kqi+q/BUfT6JLsZBaRg+UNrRJ3l1tiwUAwpVI8k+e9l4cGGpleouc87xe6O24orWA2DRIamDupZb9giRcwhnyLqFhCzVZzffXjL46u0F6rQIzVLqdHKeffXqombJRPccCu61rWVuYydgjvlUM4lCp9JzOmLzQLX4OJ6ctDmycs8gXEHWKo/L1r1IjiZedK2Eolr2akpl4+Cucf7bjl2N/h7e0B2LbsVk4ZS2N8c167r8ATlzVMxGSDTtOhsJevlzbCoshonJfUgZgsTOg8IIZXd2oWq+MBapnATIQxdHd/wTzcvb7xJLEvEeCpTDLZfRuuxM5OJZY/4onJlMcBAgx2cmKBvFWPzRWeKSwQSyqyPQzw7QYBUSo9sYNUtvqO+E1O/IiTLAliEuAQS165kypa0+frgX7nOJaQl7NxhV1uBLUCt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(6666004)(41300700001)(450100002)(8676002)(66556008)(4326008)(66476007)(83380400001)(6512007)(66946007)(5660300002)(186003)(82960400001)(38100700002)(44832011)(2906002)(53546011)(33716001)(6506007)(26005)(6486002)(9686003)(8936002)(478600001)(316002)(86362001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hhVi9SdGNNR2hTYTJ3RjF4Tjl6WkptN2ZsUDFldjdpY1VSY2RldU5lalVG?=
 =?utf-8?B?S2hpMUtjYU12bU9rZXR3ZCtJSllnYlBnV1JvTmV3TmVGZGllK1lQdEw3aDFo?=
 =?utf-8?B?Sk9ENGUwUDFMQlpLZzk0NitUY2xGL0x1VGhMZWdwcENTZUlvNjhWWURXU1U1?=
 =?utf-8?B?bzFncFFJMUFjaG05RXBiWlR2VUNZcmdtc2JaVmZ4TzlhdGhjdi8yMzhsY2x0?=
 =?utf-8?B?eWJyZHp0UHBacHdsMkFkai9BM1JUUWtuRVB0bWRaOSt1cUxLVVlpeHJFa0Rx?=
 =?utf-8?B?MTJpdTczdGdMZ2ZUZm9nS0Y2TE40YU51TFNNVWkwRU4vMVdZZGM5S3ljV2l2?=
 =?utf-8?B?ZkM0YXE4SUxsRHJ1SDJRUTlzR2VlODlsaTF2d0FwQVUyWVRJMTZVM240U1Rw?=
 =?utf-8?B?TGZScnRGdXIwY1A1N1ArT2lzRXl2aStDNlBEMzM0UCswVlFGeExYdnBjUlhz?=
 =?utf-8?B?V05iVkxVV2ZSWUhHaEJTL2xpR1I2N2g5eWNSS3B6SktIcTVPWnNwUVA0Q0hl?=
 =?utf-8?B?b3ZDMlpvNDBmTTVlS1o2ZDNCMW52V0pCVDBmbnJYUGlXVkZCV0FNdTU4dEFR?=
 =?utf-8?B?MS82S3AwYmpGeTBSYXdreDZHTUJZV3A4MmRFekMvQUlmVGx1d0xjdzV6N2NP?=
 =?utf-8?B?OURjUnc5QXJtVll1N0NGRWREY0lFYmxXTEJtK0VZUzhZTUVYeU9OM0IzdTBp?=
 =?utf-8?B?STdUazhBN2ZMS0dobUhoMXVCeG9QSUErT0VJU0pZejA1WXovYy9weERUTWU1?=
 =?utf-8?B?eUdtc1lESUxONHR5aXBZdGNJOTRUUm8zcXhJK3VqOFdSZmpTaDVuYzdaZUR3?=
 =?utf-8?B?RmZCSkRTTWEyTjJRRFgxaEtmQ0tlRGQwY0w1ZWFFa2w2R1E2YXMzaS9jUWlw?=
 =?utf-8?B?NktBN1lEeTVmenBkUXlqV1cvNlVaZjJiVVBWWGpNMVN1ZkVhckZKdzRFTzZj?=
 =?utf-8?B?OEFmaCtBODRBTjI5R21DaC9OWnp4R3VrNFhoejZld3o3WXJrSlRGQ21MMG5p?=
 =?utf-8?B?L2RuV0JkTlZPdlhWaVBuSlo0WHJZVE85cmN3VUhLZ29paXduOERzSnBGcytq?=
 =?utf-8?B?UkRkaUFWU2RJZ0dQMG9XMlhVRkF4VlhpN3dQUmxnNHVKM2RtNXd4THIrRE1B?=
 =?utf-8?B?cklPMGFiUzEwQzUrMEtNaFdmT01wTDJ6YVl1K2QxUXZEQ01USlZwRjVKRE00?=
 =?utf-8?B?cDRLMTAzMTJpelI0RHZJOW1pNkdldU5vZDY0NUxZdmgyRUg5N2wvZjd6ZVpO?=
 =?utf-8?B?NDJFeDhHbi9QQkVyTHBTdzNMRVZFSGdsK0pudlh5MTIwemgrSHNoZGw3MmR0?=
 =?utf-8?B?d01CTE15TWgrK0plR3pmUnZtN25sMk5PVHJlYnhGN25jY2RlRnVBbHUraEtu?=
 =?utf-8?B?Rm9OUk1WVm9wTENReTluRDNRcUlIK0pJNUVxcGZPQmxYRFZ5OURUcVlnRVRC?=
 =?utf-8?B?L1IwMENYVUQxcDRhWnhLWXQ5ZTUzUWxPZUJ1ZzNTVHN3RTB6eXJabEdrVU1Q?=
 =?utf-8?B?K0l0WVJweHVCY0FNRnJPZFg2REFURnl3Z01RaWF0TUVySWYxOE5UdjNwZXBi?=
 =?utf-8?B?ZW04amEvek83Rkg2akJpaDY5Y1FiK2JYUzYrY3dUYU5vKzkzZitkTGhFTlJC?=
 =?utf-8?B?bU1hTGtvMm1zNW5YOTRFYkNUOWpjKzBNaWo2ZFJIRllCTSt6VjB2R0dHYkpv?=
 =?utf-8?B?YjdIaTdIODhwVFV2OG1BUEVZczY5aElCVDNpUWRPV3pQRGtKcStTYzJmS1Nh?=
 =?utf-8?B?UEEwOHBFSlNSbzhJT2RDVTU0bTZwOHNNWUlaMlZqQ1BMLzdFdGhDbFd2RnFC?=
 =?utf-8?B?d0J0WEg2MG9NOWUzeFVEcU9LbXBpMzFaV3RsaEFxdG42MlU2V000Z1MvVEVE?=
 =?utf-8?B?STZTTlE3SndIQmx1SXlZb2ltZGlxM1JNaWQzN20xS3FDRzRTbzA2dGhTRHZl?=
 =?utf-8?B?SFk3VGZTS01RNWFJejgwOWV0aTBtSy9IdG5lWXRrMG1RaFJWcmRlMGE5T0VV?=
 =?utf-8?B?MStTdUpONDZaNG5MVnEwRTBsVENFZCsweFNrV3BEc1Q3dS94TFRIUzNTZ09Z?=
 =?utf-8?B?SC8yTm9GM2RMS0tZald1d251SGpFUVJBZW9mVUs1eUVHMVFMYms1TlpGZTJz?=
 =?utf-8?B?NHdBeDAxMnR0SmZOK2RLU0RnTm14cVhxRDh6bnFnZFl5ZHhlWU9zY2RUeEdQ?=
 =?utf-8?Q?zoPFW9CQkO4FWk8m8rXp+iU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b3294b-5455-47db-ac86-08da9c72b93b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 08:16:17.7684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4tbxQKULhh6KAS8DUkZ+bWqdTE8TiNwBvuIwnXQ/XiqC1zNyEMwj51xOApt8pq91iWijP1sux9A/zUhTxuxwr+yP0MVr7fY9Qim5IMNG/3FZPyLcKc2uGj5zcbgzt8M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.09.2022 16:08, Lucas De Marchi wrote:
> Except for graphics version 8 and 9, nothing is done in
> lrc_init_wa_ctx(). Assume this won't be needed on future platforms as
> well and remove the warning.
> 
> Note that this function is not called for anything below version 8 since
> those don't use either guc or execlist, i.e. HAS_EXECLISTS() is false.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 070cec4ff8a4..43fa7b3422c4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1695,24 +1695,16 @@ void lrc_init_wa_ctx(struct intel_engine_cs *engine)
>  	unsigned int i;
>  	int err;
>  
> -	if (!(engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
> +	if (GRAPHICS_VER(engine->i915) >= 11 ||
> +	    !(engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
>  		return;
>  
> -	switch (GRAPHICS_VER(engine->i915)) {
> -	case 12:
> -	case 11:
> -		return;
> -	case 9:
> +	if (GRAPHICS_VER(engine->i915) == 9) {
>  		wa_bb_fn[0] = gen9_init_indirectctx_bb;
>  		wa_bb_fn[1] = NULL;
> -		break;
> -	case 8:
> +	} else if (GRAPHICS_VER(engine->i915) == 8) {
>  		wa_bb_fn[0] = gen8_init_indirectctx_bb;
>  		wa_bb_fn[1] = NULL;
> -		break;
> -	default:
> -		MISSING_CASE(GRAPHICS_VER(engine->i915));
> -		return;
>  	}
>  
>  	err = lrc_create_wa_ctx(engine);
> -- 
> 2.37.2
> 
