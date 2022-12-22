Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E9B65416A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 13:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773610E159;
	Thu, 22 Dec 2022 12:57:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A60410E159;
 Thu, 22 Dec 2022 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671713857; x=1703249857;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zOFm7EkhfUGOxz4iMBFaUPPYZVEogRd4bHhj3QzE5g8=;
 b=SweNS7PCyW5Zce31/w61riSYCkK7tf4NyAoEQSjR+TO/+BoBlcRvKdOU
 ym9ZYPMzDYss86Zo/A7v40Gegbgl+7ujbfElYd54bJT8RWuUKrGNdzZO/
 j71t+xCg7VyaUPTejdSYGeK6xJAHprkPjdRXMzMT1A8bJCMWZtfx9a49k
 PUU+o5g2swyVtKBprJ2fl7oc6qzwS7q25EI+0JS8Y9ZHP77CcXm7uVraC
 iWtaCTlqlumQEWr1FxtcUo1FN/mTfHBekwJ04B/zZHNJgQyCFziJ/LHxE
 9s8ng71oAVVZbYN195g9uninQSivFVaeP0F5HknLgPE1EhP0nauBiVRML g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="320175782"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="320175782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 04:57:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="684180909"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="684180909"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 22 Dec 2022 04:57:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 04:57:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 22 Dec 2022 04:57:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 22 Dec 2022 04:57:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3UPMvhbukou2Vmk9Ohqf3iOo5FMDfSa8N4vKf7RqOLDXuMbBSoZrJswup2DQUfMK0UYog4/nUHCOmweGlJv+HWdS+usZf1Elgd4cV4sJNOcbhxIGQPZFGkqEXfjO9etoh5noi0BMUYtAbpzHYoR38ALyhwr24udrsgnDJwyUdn5FtMEMOXNC2VTp+Z9CT8CUs8pcNzS+iprev9C9+eWy5HzhR2t/OyvjuadsdHRD7TUwm3yKa1PNi9/3IP6EAWcFmfAvYyeC9CS6FcSM43/wnZQ+OyqNJkrxz3PKF5gDf5OLfg8Cv7TwdL8FXaxUmf55lqOHsHB7mIH8vHq0/nvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXJ7KOHvnoBoBJ78IQ80OzbWrM4IaZiYYak/kkQ+qCU=;
 b=Hq3MFFbdxwRTBUDsWukXf9i3TvM5kXa5btsnRwvfePnCAt9CxTvhN5HostQBZIRkAR9ITjygB/pw1tvUXdUU/fYGkSwAFfj8OYPh3J4NVKghzxU4M3Gy36wCWE7yKJ6+qCyk5NaAONV3WEwb5ISR+s/JxR/q6OjLY8KILCHvBmn8ElkiIwR+3dtlfHJ8m55AmD2gPUjpCQBpM1BwF9hhycbpGkNmETujn92VVNOFuC1O26xN2AuEu+XssF+kKmc2uEwg/l3Ka/9DeIXE3ctz3V5aQXSvTBjz4Sv7nTXywAaFqRgzvbzaWNdMeslt+fgw93pTOO8zKyLG22gVNI1gRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Thu, 22 Dec 2022 12:57:33 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1209:b438:8e6b:509%8]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 12:57:33 +0000
Message-ID: <eb083fc2-8a0d-0ec6-0cd1-135fb9b9ef10@intel.com>
Date: Thu, 22 Dec 2022 13:57:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] drm/i915/guc: Fix a static analysis warning
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221221193031.687266-1-John.C.Harrison@Intel.com>
 <20221221193031.687266-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221221193031.687266-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0221.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::17) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 18db943c-25e6-4473-60a4-08dae41c1781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQ6mWIauHDPsyW/dHwcOV+ZYkstRUtCpS0ZMTqnl2PnSEwvB3Xoe/n+V1EBjP27f7qWDWPF73dtr4QdwuO2fEpqCE45bRUB3Ga2ImlfDwFr8kTKJSAMopdUUaKGigEw9vwLnhlBjSkbTzwb+u4dKI6jFiZTzNsVyYFEt4H7MU5mtScWZuD+DQmLzZRveHmFfP45wJzFKK+/pWAxzfCSs61/Ig+u9KvhYHMFlDy761PWZmnLStQKp17DBXbgxdys4FOf/+yb6YlEYf9fo4tOedvxClVrxA+/QbvRXyWIy/g76XRpQbyGPHxjpaIyCIS3ZVDMSFEIU+0IragTuC2wJI1D6+DGP1jQIYmctsC7IMQeV8eWY4463NEfc8ZThsqHCbcLnd5gDD5e4cCd7/o9VrOZQttY3Bh2oVwmreh7eH4Zn6H55WhV5t0zpWdrxQlVFitGekGpOMEAkYlC0L0sIbV0d6v4rfeSJBocyqK8pZMEZ2K4eF0+XAImbmh+oRnCqsSQhFFZ4xmohqqWDndrCYQbYikXlYi3NcqRD7tavECPL3ZFkoejOCQ358a72U2DWo4sr7WnJrIsQo9GxtEVDZgozsDd1lzWciEE90xN9xhs23HSMeuIQr4wK/rIrti4LCFfpm6mMJhBcEf1gxRs58atCBIMwCAk8arhJtlAytEST+sf7w4QvyxhNvFlXqZbFOhBYV0l8p41bAQFH1i1F7fiiHhkD/DpVUHJhVxa5YZI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(8676002)(41300700001)(38100700002)(82960400001)(5660300002)(8936002)(53546011)(2906002)(4326008)(83380400001)(36756003)(316002)(31686004)(478600001)(6666004)(6486002)(86362001)(31696002)(6506007)(66476007)(186003)(66946007)(66556008)(450100002)(26005)(6512007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmwreUltZEJHSnByNEducWJwVnVGS1FuaFlUemY2REJFS2xqbmVNYlBRZHBL?=
 =?utf-8?B?a0Z6eVdraHZ0UHNDTTE2SjhQLzI5WDhVWHpGeis5YmI0QTE0UW9kWW1HVU9k?=
 =?utf-8?B?b25aTHVUdnkwN3ZYM0FEeXFESnE2WjVMci82S3JBNEpYQUkvTHBrTFkxWHhF?=
 =?utf-8?B?Tlc4OWJhTjBrbDFFKzFTUkRpbXlKc0xEWm1QcWVBWWhsd2xWd3paWDFEUXVa?=
 =?utf-8?B?OFY5ZGJZc3ppc2tFdmZlMEsxekhFcXVYeGNJS0MrSUU5SHdjQ3VJNTZFdVBP?=
 =?utf-8?B?dmFpUnBtN3dsMk9qTUhtQXF3a21UMENsOHJKczVBN1BnT3pDNTlnbkNLc0da?=
 =?utf-8?B?Y3c0YjBZNXpnSm1IUTB1VmxSWWRMOFdvZmhRaytZUUZlTzhaL3Zqa0tKWC9P?=
 =?utf-8?B?TDVzTk9BQ01Ec0xGa3dyZHhxaXE2NXFlZmdGSitFQ3BYSmZHQ29INUJJblND?=
 =?utf-8?B?Vzd6WTRFaTgyNkNBdVdUdFlYODUwSDNReUJUTDFZL0wvTUxxKy9jL1dIR2ZU?=
 =?utf-8?B?RE1wbzkwQXdpbUM1Z055amNFb3pGV0trRTY1alEzM1M0VENjRDkzYzdMMWc1?=
 =?utf-8?B?WTlXUjFKT3ZHQUZOOVVaa1NWeVcrdlNPNTV5T2g2UXEzNlc4WDAyTjBadjla?=
 =?utf-8?B?Wi9HV28weSt0NVplaTF0NHFMOXBxZXNmYVpYUVo1ZUxpNXVtVmhNVjhhTGlF?=
 =?utf-8?B?b04zVDNhaXRzdThHbjd5L3Q0eFF2d1B1bFl6RTB3RnJJclZGU01oT05JUlJS?=
 =?utf-8?B?UW1TUkN4T3BkK0pVNHA3aWxJR3Nxa3lkQ1hpV3NMaGU2M2poQ1Rvc3J6VUdp?=
 =?utf-8?B?NkRwR0dzYlA4UDhmSEpvdXA2NHNzWFhITWZqMkU3ZS9rZVVBTmRtaGRpT1Rq?=
 =?utf-8?B?V0xLd2ZzREZXMFJyWWdOQjVLeXZ6TjBtcGE4Q3lDeVRMNDIwVUpXMTNzbWRM?=
 =?utf-8?B?bGVlS2FOcERNL3k1NlhwSDY5eDl0dHVYUDdvYVNGZUtRdVJ2SGcrNGg4UEhG?=
 =?utf-8?B?ZFpQZnVFYUhrMWFjVEFqRndpVzljNTJkb0I0aFRpZ05pVERqZGF0STJrWm1w?=
 =?utf-8?B?WjQvWi9FRm5UUVNSRnlmOE9QaWxjOUN2VThOZ1lyRGdJaUxYSmEvWTJ1SXpM?=
 =?utf-8?B?M1lCWWdyM05RQkJueUk3ek0rQkd5cHZIVjFUQWRrUUxocUhpYkl3YTdBVWVH?=
 =?utf-8?B?UjNjaFJSaEJsQS96Znkrb2Y0TXRWSmxwNEdsRFhnbTZFTEhFZWxSaGJOUDJI?=
 =?utf-8?B?STRlNzM3TUtTcERvbjBFa05YSW5hMVZEejF2VStvNHdObGtUaDdaeGlNWmNk?=
 =?utf-8?B?ZTlRQ0M1N2pnZWpNWlFzKzdLUDRHQUJ0enZlZmRkSjZFM3BNNVdiZUpjb1JX?=
 =?utf-8?B?SlpLY0YraVEzNlZONDlnUUoxT3FPS25xdHVVdks0YzlxUEpZeHBDSUZEZWcr?=
 =?utf-8?B?Z3k3VmVTc3lSMndQY1RTdUhtOWtsRm9rMFB3T2ZSamNpUFZleHBrNXZ3MmRZ?=
 =?utf-8?B?ajhHSTc2R1lTSmFBMnY3NlQrdDVrclVTcms0T1ZFcDdsWnJyYXBXQzl3cEZE?=
 =?utf-8?B?ZnhKTXhYWHdlZGRuUVZOa3g4NFdRczN0WHlxVEM2UzBxeC9MdDFhTktUdkxV?=
 =?utf-8?B?WjV1SG8remRBVUdXSjZhbGtEL2Rwamhwbi92OWdhc1VscHZTODNpUzQ1LzQ5?=
 =?utf-8?B?azBGdkwxRy8wNGN4RXB2OWp1QmhpWjllUjNJeHJFb0NiaVdvM29jc2hzSVNR?=
 =?utf-8?B?OXFMSXhVcS9FWFJOamdsTjNOc2syTStIYTBFOE1xQUNFYXE2NW5oU0RWM0Uw?=
 =?utf-8?B?UFh5UWpEVnBNUkVqQ2VoZEFSVlVISzJyZUNST0Y5bEViQTg1K05ZNE1ETzha?=
 =?utf-8?B?OE5ENjJ5VUJNd3ltYjNrcEJXR1hLQmdQN3VIeHFmZ2VybEk3bCt3L2l6UUVP?=
 =?utf-8?B?dEo4SEhRNjIvTDQ3aFJkUHhhYzNBOE54WlV3bUlwMGF5c0l2Q0JKaUJ4TU4y?=
 =?utf-8?B?cFM2ZkJVellBSVNrb0l4VkM3VUhZMkkwVXFvb1FoTGJZME1GWW1zL2tkTEpk?=
 =?utf-8?B?UVNCUGR2S0pmcGpyNHhyK1Q0YlRabE5YdFVpdzY3QlUzREkwaW1LZTNRS0JP?=
 =?utf-8?B?U1prQ3BpQ1MwWjE5cmlOU0ozdWJqZVNMc2RLSkgxR0U4NGhlaEtNM3FMSlpw?=
 =?utf-8?Q?5lY5WXaM6GoXYvTvCvPprL4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18db943c-25e6-4473-60a4-08dae41c1781
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 12:57:33.3105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2t6KAf50jFQWJW1OYA5wVuPZcYKduoC6NYYJVsrBlMvgQ6u37nFXxgPvHiOMU6vxoGcRKOr8BYagFBeMpmhv+MlynD/uZgtcOwGuMTU5MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

On 12/21/2022 8:30 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A static analyser was complaining about not checking for null
> pointers. However, the location of the complaint can only be reached
> in the first place if said pointer is non-null. Basically, if we are
> using a v69 GuC then the descriptor pool is guaranteed to be alocated
> at start of day or submission will be disabled with an ENOMEM error.
> And if we are using a later GuC that does not use a descriptor pool
> then the v69 submission function would not be called. So, not a
> possible null at that point in the code.
>
> Hence adding a GEM_BUG_ON(!ptr) to keep the tool happy.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 4682ec1dbd9c0..c93d0594bfd5e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2538,6 +2538,7 @@ static void prepare_context_registration_info_v69(struct intel_context *ce)
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
>   	desc = __get_lrc_desc_v69(guc, ctx_id);
> +	GEM_BUG_ON(!desc);
>   	desc->engine_class = engine_class_to_guc_class(engine->class);
>   	desc->engine_submit_mask = engine->logical_mask;
>   	desc->hw_context_desc = ce->lrc.lrca;

