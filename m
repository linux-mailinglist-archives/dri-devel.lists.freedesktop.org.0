Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BC687794
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 09:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DD410E074;
	Thu,  2 Feb 2023 08:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C795810E074;
 Thu,  2 Feb 2023 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675326902; x=1706862902;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ytQQb41J6v3vZW0u83w0Yh/mCB0bk1TsvgZa42/S+R8=;
 b=VqRWwQq6aXhTMaGWLQM+akkhPWj9yJVU4k4B28gxO6t5QmDEJt2K/guh
 feG5LJs2H77PAKrtRQ0M7KRCrRSjU+ox1HdGg6Qpu1kKMDtoV4NQ3Xn7h
 Lb4sb2MkmybgWJbm4TLPhf6l2rQX8/24pxhN0cn35Tbi6GdfIiuflCHAp
 2b+j/st1n1ZUXZ9BeMw95gYb0kuta9cNiNOt3G6dlKh/dqLZ4tgAGLPKl
 IXZ33rsuM1KINs4fLBIJ27hc4dKhjoVa4AwkhgiMMmvcAGYK+24tmDsld
 cmqjhe4dOA3yUFoOCYkziycWWMTBWmrduNEPqKenfvFyUBej5xA8+S9k0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414598537"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="414598537"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 00:35:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="667216545"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="667216545"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 02 Feb 2023 00:35:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 00:35:00 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 00:34:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 00:34:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 00:34:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfLTUzvzbZhFT8O1u2iuGUxF4zzWa+kAS1Dajv5q8LTpkdPpHM2DAWGmnziLn6Ey58G8mBX0tAQwzCEdrtwzj6JqpEipQSbg/KqIj3UtPYeIshlNO7PjmU2x4ZTS5Q9jHfuf0tJc0CRGr/xkpzPm+wU4/hj2m8MGiMvOiSne/i2RJqUM1XsipHMNR2c/jm3NCJQukU6JYnuJPdrcmaOlnyJi2W6qpCDybVsimReyC7nzEQZRGFuAOXWv1k6hB4+oc4HhdwJIkM0tl0m6JslnySbKx0ZywTB4j8bXrcgdl91CUCuBxqjTWtoi9Zb38/OKjsWyBeMmKRxstpNdN3gIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op7EKmfMSg6LIf/spTKq5BjMWGTYwUd6Ke3naMGnVvc=;
 b=kVAR9opI0ZLXaZlJuxTQCST95yHQfWqhUfY8DpKylxKQeHzQtY/U6hpFcF4vw5oGyrzpTrdqJ6yOlOaoqVYPg4NZymnOM8n2s4VyEcFTRCI3uLzi28jI/UFPp2TrWgqeq0MKLCUxCjaGudXoG5fQpYWu6sLV7QUfEVHlHCOJ8kCTGWurfhsuXcFrHYOVRZY2c4E0C22WVF0WfLaBhk8n36i5BXylSxy43/bEzO19jsKPAMYXp1W+70vqoiQGGiDeWRZ0zeJ0ZupLARfR9s5CU/prN+M8uFipImDvq2u6i/mNbysCrj86PaRyKqhMNdF6vlZiY35Y2nRr/ZFx5ev4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by DM8PR11MB5574.namprd11.prod.outlook.com (2603:10b6:8:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Thu, 2 Feb
 2023 08:34:49 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2%7]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 08:34:49 +0000
Message-ID: <08c19ab6-ce92-f064-df11-5d79912a0543@intel.com>
Date: Thu, 2 Feb 2023 10:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/hwmon: Enable PL1 power limit
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230202025249.905942-1-ashutosh.dixit@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230202025249.905942-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|DM8PR11MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5513cb-da78-4892-9f37-08db04f85874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3TL2pANxekJrAfGOHQCVjKwl3det33pvbvIj9YeyeCv6HUtHnFADZ383nKMuOm3AS6HHGpLWRrJiOvV1DPXyRFFlJQWYD1obUx6RNif63QpQZnbBtJjkc3Nn+NnBpr1vdEXKbI9X82xfEZQ/i9P86RxsqueZ2yjvBXdHEkcB/SGJbwETmtCxDKL40zBlQimKVYR5DLnXnoCJ0GJzlEQ1lijdem4lio0rM1mRCJQH8VDNcwzUlPFYY0dZRP9i11AoH4vxjC31UXHMwOn8Ej89f28ll8ZgtvAQW/k9/KL1CdD9bSlSupjVtnFA03W03brNU5t2G2a78Gjxn0kImaNgmn9E5Uayq2vQe+PyCgVWrhRbMY3pGYIXOoa4NdwlW1CVcNuhekM/Rq/ZP8YYPx6ta66Nmqe3WdY9qcUggpNpcZCyKxm5z5LK+8KRY2P3bmFU4+CyjtI964oUxHF5T+rE3KpHWkv6vsxt3ybt6T5wY1VJNdAuyzLGNkeJ30e2YMuC3Yu4fZNe3WimQk7Jl2oK+JVdHg3b7NwWMA+MFa9cww+ix6nNHXOgbJ2E2OyIkX9bUJlmHMRuLYQ2H6ZFfYhauuACuGo1CVRdX0FQ8N2dq5uj0vOZhxPPCuUh2Vjxyh/pXt3iJf+Vnl8JNxUIj0E0NJFvBiZKWScqsel4kMUINiJfhmL/Cs3SdDgtPTcRSXQU3o+uPve7agWXar3Be/eqjIctNmKGAu2zu7aStTo9so=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199018)(8676002)(478600001)(450100002)(66556008)(4326008)(66946007)(66476007)(31696002)(86362001)(38100700002)(6486002)(54906003)(316002)(186003)(2616005)(83380400001)(26005)(6512007)(53546011)(6506007)(36756003)(82960400001)(2906002)(31686004)(5660300002)(41300700001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW8wOHI2V29BejZTY0NROGNwRUwrTWt4dnN3SUNjSm9ERTd6cXlCamRkYm1t?=
 =?utf-8?B?clpvR29pZVNoTkJCWll5NFhISFFiVzhDQ1hLVitEbG9hSk16em5sQ09DZWVX?=
 =?utf-8?B?a0VZWWJ3MmkxNzFiVGNlNlBGRG9iRXFmb3pXTWNjcmtEZzdHNUVNc0tJU29n?=
 =?utf-8?B?YldyN0Nrdk9HSVBrd0dseWJLeVIwRksydU5ZS0tWTlFKWWhSMXkzL3Zja0xh?=
 =?utf-8?B?VlJTWndWYWF2N3JFTXk0NmRXMkVoallEaWltZ0l4dDdiVUN3cmJ2SytiRTdp?=
 =?utf-8?B?YWRtcEVQa29iMTFKK2NzWFR6SndpL2ltV1ZiRWs4Sll0alZRRGFSbWtqVjRu?=
 =?utf-8?B?VmFuOUZlZEMzdDZORmhBSy9YcEFNUEp0b001NlpMZnVWN0Y2bEVPaHJFWDJ2?=
 =?utf-8?B?MS9CanNnUVNJMW9VcFZSM3hLMW9qWk5rOTh2bHMybTlpZE90YXRLVU5LcEFH?=
 =?utf-8?B?WWpjblo0Ymg3NGxqSXh2SnkxSEFSdEVCRWw5SEphMStvT3pqKzREeXZYb2Jt?=
 =?utf-8?B?eVlCNkowK214VDFYdG5BUnpzQ3pVSUFTTDMvWDNwaDdyRU1rTDc4QVRYUmw3?=
 =?utf-8?B?SHVGTS96bHJSNytWNy84V2JuQWMycDFhSC84Z1JHOW51aEVRdnRLd3dGRjh3?=
 =?utf-8?B?WXZnMkhYbjBmM1ZKL0pyV09hSnhTYlNkdzVabTBzTEF1ZEo4d1RBSkZpcU9p?=
 =?utf-8?B?WXFXbGlXZDN6aUFVSXBlMDFoYzZRUVU3enl1azdhZU9TeWtSTXNmeUc4aVJP?=
 =?utf-8?B?Nkl5WFhLTHkyMnpHUDFxd2JHL2twUzBLSzAxeUtxNWlFcTJRMWEyTW43aURV?=
 =?utf-8?B?UXY5SDJWdllmQU9DWlJjZzBjeExrdDU5YmJCcjFPWlMveVl2Y1Q5cVNJWDRn?=
 =?utf-8?B?b3g0Z3c3dlNnY09LRTRPeHpVMkNoUlFSS0NuNVRXZEFRYWtnM243YVNmYlR0?=
 =?utf-8?B?MWNkcjVPZms1bC9HZ0dzclJlT0tDWjRIR2tKVWpST2cxU2Y0L1ZZRVBDc1Jr?=
 =?utf-8?B?cllrMkg4c3dyUHJFYnFIS3JUanh5bWgxSktBaTlpSE5jOGpXa0xRZXFUVHJo?=
 =?utf-8?B?OG9TM01UMVRpTHhQSzZxakxqYStDbVVYRlp6VVA4c3dxNE1mL0NRUVh3WVYw?=
 =?utf-8?B?ak54MDl6Q0FXZFRScSt1YTU3aFoyanlXVlVOTG9CaGxwMG1xbTgrQjJHa2Jt?=
 =?utf-8?B?UDZ4QnhjVEFaRkdudDFPVjh5a0l5ZzRMbk5sakhhMlV4WWtjWXFYY0VlSm5o?=
 =?utf-8?B?aGZGQnJWbmxOY1dwY1lJUS9jWGxlV2FtbWFVa0NGdWhRQnI4b2V0VmJrL3BI?=
 =?utf-8?B?eUJtMlMwK2NIK2Jjc1o2ay9OOHNGSUtXSjA3M2dxK0lVSktDdVNIUzZwSm12?=
 =?utf-8?B?WHNWOUJqSjB6TUxwTERldVhDYld0bHhSbkZZcERCMDRxK0hVT0cvaXBtNnBP?=
 =?utf-8?B?UCs1cCtjdUI1KzkwbTZuWkxWNjFiUFZRK1hKMEpXSEdqbFlFOXJXRi9rTHNZ?=
 =?utf-8?B?U005N2RKcEh0ZHlmL0haUHNWRXF0Rk9iTjNEa0VJNHhVcVVZdjdYTzVWZFBV?=
 =?utf-8?B?ZWFsRXo3TFlEZW1mdXViUjIxMFc2S2xrYlNlbVRJeFRPNzZXTnVXOGRJUFNJ?=
 =?utf-8?B?dTB1MHFUS3JaOGwvd2s3TjNFZnNUUFRyL2t3VWVkOXN1ZkxkQlB5cGpmQ1lx?=
 =?utf-8?B?ZXY3QlErNHMzaUtDTS9FRWNZcGc0cmlvT09ZUXo2TWZpeHRwMWRza0pCc1NS?=
 =?utf-8?B?UitySzJzT0hNK3pVckgwNCtjYy83UFFxOC9aVXViVy9NSExzS2tZVTFWVUYx?=
 =?utf-8?B?U3gzZlUyQUViT1MvVXp6c2c2RHlFUFNJNGVOem5PbW5LMWNvU3JqOXVXS0Fw?=
 =?utf-8?B?ejRPSUg4TmJxUS9FZkNiYW92Uk5lRjFQaG0zeVJDNlNKQXVrRktWT3hHKzNn?=
 =?utf-8?B?SmtLaEsrMWNJUmVnRWRmYnBacmdCL2ZtUzVaZllZbVo2SVM3N2F6a1ZpN1N4?=
 =?utf-8?B?ODErUVhSTENGNTVGTEZOZDlUWGtSVFcrMkpFRjBXRW1hY3E2WG94RDR5YWlp?=
 =?utf-8?B?NW9xbklZRzdtdXRYZlA0M3p1c2pxRk1MWDV3bzVKNnVYQmtZL2JsNmtvQmRO?=
 =?utf-8?B?c0RmZmZxSUlqRk1zN1hGcmsxRk5wa1lvSTlJRlNIMnRCZlZlWHl3UzFLUkhX?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5513cb-da78-4892-9f37-08db04f85874
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:34:49.0180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2lagGGMQoPc73pcEedq5t8piizz3X+ePCtWaMNI97CdmFn3+DFDF1JrLCt08unzIrhyKJW6nIXf0lCrYAaxTHOipuYYOBl2I1ocqolVgHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5574
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

looks good to me, but could you please add bpsec# to commit log?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 2/2/23 4:52 AM, Ashutosh Dixit wrote:
> Previous documentation suggested that PL1 power limit is always
> enabled. However we now find this not to be the case on some
> platforms (such as ATSM). Therefore enable PL1 power limit during hwmon
> initialization.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_hwmon.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 1225bc432f0d5..4683a5b96eff1 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -687,6 +687,11 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		for_each_gt(gt, i915, i)
>   			hwm_energy(&hwmon->ddat_gt[i], &energy);
>   	}
> +
> +	/* Enable PL1 power limit */
> +	if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> +						    PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
