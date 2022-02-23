Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E94C06BC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 02:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AEF10E314;
	Wed, 23 Feb 2022 01:14:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F88010E314;
 Wed, 23 Feb 2022 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645578883; x=1677114883;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TvvsoiLCx1MxRuPMaV5c6qvVNPclcyEPrpocWGUZPJs=;
 b=kgTufFiQ/2B/3u+DdAswdNDhUc8hpEvTGuqGtp/6BwrwizGpv5mq5u49
 AjsNIqjuW/S0Ldk/JA2Gm8SsjMPRPveUXcoPBdo+HLaEG89Wbsg/J7FrD
 Qw/UCF8WF2TrKSRxmu85hSu+srY4JZMlEuHWey2Uq61mVSNIrnf4vhEYd
 7VsowWc+rfoc0C6IvbRnUNa5rSInBl8I4d97X0zWjYfbEIohjACCdNPG/
 hLJLFnTfgOh9bPOOOBdhlPuu/JflcPuz3Q2mzdzkfmv9MKIdGVsAE3Zet
 zjE/x2V9QVs3eFx5UGt8H0dGG7mW2nbkKPmf+O1dZ80bP/TFjs7WHzX8H g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231829534"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="231829534"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 17:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="637228518"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2022 17:14:42 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 17:14:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 17:14:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 17:14:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/VP+OG2d5089m6lpy8rwsU87qG6Fr5AiaUifE1KTt7Je8lU7iHusmSl3vah4LF5AekH50SiV3ic9CB9B22ruImEZ3ZyBoyYhdk70P/O3BOGz0CRih/11/hLhRlzuzXlAncsxCRALDN4vxqNP5sgNwNmr7QD1BP7hRyxOkFIxCCJ1wsxE4d2FswkXuDnKXKI/myeTzQLlexvPMrFFOaeqr6SU8JUWQep6kaZQy9i13aUHjqq/DuKdUfAfnpLPmDDdeBX1PkwfDvtsP8iJ1pRs+OhJqM4XFT6QQPhiTu8as6+KzyBtSfwEKCENnx5kth/sulXvhuskSN3rH/JD5Q0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9IpnbnE6Le5Kt57IWpR2ny/s47ic5ipw3lDVlCHnYs=;
 b=WhdGYE4x1Eh35v6ISl75Pj/T6sOCz2XYihZFJ9MbOgPmscZRMzy4p7JIVkmLD0CaM+owhjFHMzIjAOoFV6uytYIbpII11BI8lKxOOmz1PgL4lInJ00CuyAJyAi5tgheogwX/j3XwMID7h1NkXJSV4RJkTGn7bivIBKPY/oVGcvx9TRfeBoYsblKnawsV0CwSLBZDEJQLDxy/99eDXDObprp3HBLcjHHRwOwbI7t5eMNcUeYej9bk/rIdC7my9iBOpFa889PtbFckbl2W+8BRz+uuYo9hrJiezxh53vVi1SjSMKYXG1CZ5nPtl3ElY3CjfQ7jSJkUONDrEmmzUQf55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.21; Wed, 23 Feb 2022 01:14:40 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::3c4e:eb25:76ff:a869%4]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 01:14:40 +0000
Message-ID: <d94e4ef8-b69b-4e7b-4f40-a6281ea5c20d@intel.com>
Date: Tue, 22 Feb 2022 17:14:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/8] drm/i915/guc: Rename desc_idx to ctx_id
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
 <20220217235207.930153-7-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220217235207.930153-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acda8a5f-c75a-481b-8b22-08d9f669de0b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4673:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB46739FB1482A03D0E3E9C8A8F43C9@DM6PR11MB4673.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvTMKPVMDBo8G5HaLz2R7SYnEqr/EjBH0KHu3BZl9TQxDUgGnKIO/OZ0fQ4reZqybprc7demc1Sx5TTqiLz7IKi+WwyI3elfjHbGXccvBl8qeNbHgi3989+XbiFu7Rrp6WwtgIqqICmflXaJmCqoS+GDOdPKOh3/lXFI3dGDMS26qk1Re8BVfCCp+5vKzz6VhnziuS3QDBu0fbq1TOvg9bRL8GOJvJ7wkvzO/yM5QrA/ojmQeoXeV+BQJYcxDvGSTqhrJ/av79nOTmhuO/W7zSbom/bcl7Xkm+I3F8Ddw5Ifh9eRadlmiRmH5RnXYI19sWVJBo595PWAj1UZjO9UTI9ViXb/o4U+FAgW0DUnFNbHirGs/Hnv/vBu98Fq6PmmKe70wJrBpks/QjL9XIO3ty6vPPOfgk6UZf4MnTId5fLDqS5m6gH/7j3qk86QWQwTkmbIZX9nG4iYC2EW33uNEdRxpWNrXrtCi1koIfcWul3FNUHdKbeZsVIggQAeOHqtZIOF2Vr91XVR7A4MyxMasnlpaNodeKMrzCNpp1e4dGZEXVRkU7CDcto2SDMVN8fc4riz1JD1wGIeRHd1uP96CRH1H3YbgKcOlKzyb0HKOr100mZ/FgWAjXTsc+TtcBPTZEORny6CfklOHC5uRvSkSkjFql6Gi1Ys/W5zbK6rQ2QElcXGz9YhU1o4Bji3YKJR9a8EpWPszC6Kb903QB2cT50fLrK2k8H7REOLoJQSrTHHEzkZBLNTTO3hh6+ffNEm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66946007)(4326008)(6512007)(450100002)(2906002)(8676002)(66556008)(5660300002)(8936002)(26005)(53546011)(6506007)(2616005)(508600001)(186003)(31696002)(6486002)(86362001)(38100700002)(31686004)(36756003)(82960400001)(316002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHNpemVMYVRVejN3MmdJNGhEUEc3dUZuc3ZRSXB3dkhqZEtqRy9YN0U0d3Zl?=
 =?utf-8?B?dlp4NGNmcHRDS1VqVVI5NDQwdE1zZHJ5UE5LUEJvMTRWMjZVZmVCNDBFMmhp?=
 =?utf-8?B?WExLRmRZUU5LVGRHM2s0VUJrVk5VZzNPUFBjMlk4RGIxY2FmekwrWlJmMUhs?=
 =?utf-8?B?U21uQmVIc3hRRUtJWXQwa3lSZU5nWklJUTNUUFZPaGtxMWUrem1STjA1byt0?=
 =?utf-8?B?bjlaT0pnL3lnYk41VTcrVjY2UEJ3U1pvKzlMcjhPbHdwM0d5bmQ2Rm9qQ3Zu?=
 =?utf-8?B?Vjg2ZEJXeUFzV0U1V09Bc2QwSXE1UCtFbUR4dDN3VDNkRUc4MVFLQjN0cEg0?=
 =?utf-8?B?YU1VTjZ1R0o1ZFduajJOVUJHMS9wbG5SNEVuZUVGeEtWdzNlRHBSSXJwdVFW?=
 =?utf-8?B?b09oMFpQOSs1U3lydWswbTB5Y0ZmamdIYXZnaWZQbWQxbkdCOWtOQXpQZjkx?=
 =?utf-8?B?WUd6NUg0dE5idkY5WGZabXNENURxWkVYUmlCMUtjUEJJMzNlb2dFTzdHQUVR?=
 =?utf-8?B?VjNSWW9DRzM2eERJTzE3K3oxVFZhY1paaTJuVlk0bTZXNlpVSyszS3VXN0pl?=
 =?utf-8?B?ZDVuNUpYZjVMYjVnbUtRSzBueWNGL3lDRVcrZ2ttc28wL1pGaFpkMW5sR0Fx?=
 =?utf-8?B?TFVaV3JIWkF3SkorRU1CM21sTjFtMndFdEhhVHFNY0NKNUNmRG1UKzRPc2dt?=
 =?utf-8?B?Q1VoM2NrMXhWNEp0K21JM01XSUtmOG9FYjQwNU43elpNalhQUnIwcFBOZ0Rm?=
 =?utf-8?B?ZFJHRXNQWjhjNUUwcDJ3Vk43aFA1OFpYeENhVHRGRXBiTVlvYzZ5SzdUSEdW?=
 =?utf-8?B?WVF5ekNMTXgyQ3pUSS84TW1JYjllM3I2QWhvL0FnbE5oS1QvbG8yM2ZoSXVS?=
 =?utf-8?B?c3FSUFR1czVTTjVIZEdaUHRpbWtpcnlhYkRlRjBWMVZpMDNweFZIQ0dqMHls?=
 =?utf-8?B?aDRzUVE2VGdJQm1YRlliby92anhrMzV6bTFNUnpheitQR1V4d1RGeHRoL1lT?=
 =?utf-8?B?WjRhUVkwdkZwbG5NRmtPekF2Y3NEeE5LR20yQUN0ZXgwTUxONFp2V3FCSlBa?=
 =?utf-8?B?eFNTQXVMb00vNTlnUXlJTkFNY0ZFTHNuQlQxbUdCWGdrMlV6RlRNcGU0VVU0?=
 =?utf-8?B?dCtDaXIrcDdmb1hhRHgxcXc0M1dMTGZRc2NEdUN6bC9DWmpUZTdwME5IT2l4?=
 =?utf-8?B?NDNKZ0djaThRWTdYZ0FPWloyNWVpWHNEb0JVYzF1c1gwZERtRXFYUlRxV1pR?=
 =?utf-8?B?d21wWkZobEtHZm1SNnl4YVhmMmhPN0JaandxNzkzRVJhdmFSZ3d3eGkvLzE5?=
 =?utf-8?B?NkM0UjBJbmRydmExbjhCcjhUOURBekhmUGVBVUphUXJJMy9iVTF2N3pwN3BC?=
 =?utf-8?B?MHlaTzY4VzBuOENjTjVaWERQM3orOXUzdzlpaUFUZUNqNnVBVVNFQWplaEdh?=
 =?utf-8?B?V0d6NWRZVSsyTG5NWm5zelkyTzBuVzdaWXc1Q1lXQ0NVY21qOEswbldlRk9V?=
 =?utf-8?B?SGdDU1VJam8zUXdtYVVTQzRXMktXUkJpb3NPUXNCWDFMdVkwQ1dkaWFvUkpS?=
 =?utf-8?B?SENLWGVVTDRhQnRCMmVtMGNvVjVnMzB1eThnYi9zS0RublFHZVpKMFpwd0Vp?=
 =?utf-8?B?VU1YZExLN0RlVkhPMTV1WFRRVjlJem5UVFVDZ1ZSa1VJMDVvZTlvbTIyNDlp?=
 =?utf-8?B?RDFURlpvSEJpWnlqcThTWFJ5YjhkVllqMlJrdmk2WkRZWWo5bTFubzlheWs2?=
 =?utf-8?B?SkV2YmJyOVBIVm4vanlZSDF3VEhqZXpobkVidWtVNzZ4d3VFMHR4blRnbHVo?=
 =?utf-8?B?Y2FIdzNVdnRtYlNFQVlOOFJYV2JOa2V1V2hRQTVXdHcrSmZsQVI0OHF4ZHV1?=
 =?utf-8?B?SmxKUkh4SHk4Mmt0cHpiMkV1MWJTQUpYM25jRkgxVmZ0REs2cHNpWVVFRVZB?=
 =?utf-8?B?K3dLZlpRQUxoSSs1MFZLMUdabHBXN09nR3FqdDlWN0cxNWhGMHVSRHJ6SXBv?=
 =?utf-8?B?anBOU253VUtIV2lJQlNZRXFTaTQvRGs1bC9tMUU3Unp1OCttZVFuSjRySnI2?=
 =?utf-8?B?UTIwUTVlSUNCOGlndkpyWDgwc2NhbE1kMTJEd0NGeUhXcVFSamZxUGhtYzln?=
 =?utf-8?B?Zmx4d25qSWR5VlFGaHR0Z3RFNEw1WVRrVkl6ekVLaThQVHVFa093VDdBN1NX?=
 =?utf-8?B?SkY0Q3NMYmRBV1hKNG9PVFVwR3VzbmQ1RkRJcU1LcXkyalZOYjJ1QmRXRjV1?=
 =?utf-8?B?V3RNSzlteWZzSExXV0RJdHFha3VnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acda8a5f-c75a-481b-8b22-08d9f669de0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 01:14:40.8339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL+DPtGCE+SntnFWSrytkFf/QQMDm2L8PXvySmlwVWak/utDm5MKti0Ry6pb1KiQL8TaA5oP88pEpmyj2o80glgojcjgaCRRm9bcqvSmaEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
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



On 2/17/2022 3:52 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The LRC descriptor pool is going away. So, stop naming context ids as
> descriptor pool indecies.
>
> While at it, add a bunch of missing line feeds to some error messages.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 +++++++++----------
>   1 file changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index aa74ec74194a..b70b1ff46418 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2245,7 +2245,7 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
> -	u32 desc_idx = ce->guc_id.id;
> +	u32 ctx_id = ce->guc_id.id;
>   	struct guc_lrc_desc *desc;
>   	struct intel_context *child;
>   
> @@ -2258,10 +2258,10 @@ static void prepare_context_registration_info(struct intel_context *ce)
>   	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
>   		   i915_gem_object_is_lmem(ce->ring->vma->obj));
>   
> -	clr_ctx_id_mapping(guc, desc_idx);
> -	set_ctx_id_mapping(guc, desc_idx, ce);
> +	clr_ctx_id_mapping(guc, ctx_id);
> +	set_ctx_id_mapping(guc, ctx_id, ce);
>   
> -	desc = __get_lrc_desc(guc, desc_idx);
> +	desc = __get_lrc_desc(guc, ctx_id);
>   	desc->engine_class = engine_class_to_guc_class(engine->class);
>   	desc->engine_submit_mask = engine->logical_mask;
>   	desc->hw_context_desc = ce->lrc.lrca;
> @@ -2313,17 +2313,17 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	intel_wakeref_t wakeref;
> -	u32 desc_idx = ce->guc_id.id;
> +	u32 ctx_id = ce->guc_id.id;
>   	bool context_registered;
>   	int ret = 0;
>   
>   	GEM_BUG_ON(!sched_state_is_init(ce));
>   
> -	context_registered = ctx_id_mapped(guc, desc_idx);
> +	context_registered = ctx_id_mapped(guc, ctx_id);
>   
>   	if (context_registered)
> -		clr_ctx_id_mapping(guc, desc_idx);
> -	set_ctx_id_mapping(guc, desc_idx, ce);
> +		clr_ctx_id_mapping(guc, ctx_id);
> +	set_ctx_id_mapping(guc, ctx_id, ce);
>   
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
> @@ -2349,7 +2349,7 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   		}
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   		if (unlikely(disabled)) {
> -			clr_ctx_id_mapping(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, ctx_id);
>   			return 0;	/* Will get registered later */
>   		}
>   
> @@ -2365,9 +2365,9 @@ static int try_context_registration(struct intel_context *ce, bool loop)
>   		with_intel_runtime_pm(runtime_pm, wakeref)
>   			ret = register_context(ce, loop);
>   		if (unlikely(ret == -EBUSY)) {
> -			clr_ctx_id_mapping(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, ctx_id);
>   		} else if (unlikely(ret == -ENODEV)) {
> -			clr_ctx_id_mapping(guc, desc_idx);
> +			clr_ctx_id_mapping(guc, ctx_id);
>   			ret = 0;	/* Will get registered later */
>   		}
>   	}
> @@ -3864,26 +3864,26 @@ void intel_guc_submission_init_early(struct intel_guc *guc)
>   }
>   
>   static inline struct intel_context *
> -g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> +g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
>   {
>   	struct intel_context *ce;
>   
> -	if (unlikely(desc_idx >= GUC_MAX_CONTEXT_ID)) {
> +	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid desc_idx %u", desc_idx);
> +			"Invalid ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
> -	ce = __get_context(guc, desc_idx);
> +	ce = __get_context(guc, ctx_id);
>   	if (unlikely(!ce)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Context is NULL, desc_idx %u", desc_idx);
> +			"Context is NULL, ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
>   	if (unlikely(intel_context_is_child(ce))) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Context is child, desc_idx %u", desc_idx);
> +			"Context is child, ctx_id %u\n", ctx_id);
>   		return NULL;
>   	}
>   
> @@ -3895,14 +3895,14 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   					  u32 len)
>   {
>   	struct intel_context *ce;
> -	u32 desc_idx = msg[0];
> +	u32 ctx_id = msg[0];
>   
>   	if (unlikely(len < 1)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
>   
> -	ce = g2h_context_lookup(guc, desc_idx);
> +	ce = g2h_context_lookup(guc, ctx_id);
>   	if (unlikely(!ce))
>   		return -EPROTO;
>   
> @@ -3946,14 +3946,14 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   {
>   	struct intel_context *ce;
>   	unsigned long flags;
> -	u32 desc_idx = msg[0];
> +	u32 ctx_id = msg[0];
>   
>   	if (unlikely(len < 2)) {
> -		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
> +		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
>   		return -EPROTO;
>   	}
>   
> -	ce = g2h_context_lookup(guc, desc_idx);
> +	ce = g2h_context_lookup(guc, ctx_id);
>   	if (unlikely(!ce))
>   		return -EPROTO;
>   
> @@ -3961,8 +3961,8 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		     (!context_pending_enable(ce) &&
>   		     !context_pending_disable(ce)))) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Bad context sched_state 0x%x, desc_idx %u",
> -			ce->guc_state.sched_state, desc_idx);
> +			"Bad context sched_state 0x%x, ctx_id %u\n",
> +			ce->guc_state.sched_state, ctx_id);
>   		return -EPROTO;
>   	}
>   
> @@ -4061,14 +4061,14 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>   {
>   	struct intel_context *ce;
>   	unsigned long flags;
> -	int desc_idx;
> +	int ctx_id;
>   
>   	if (unlikely(len != 1)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
>   		return -EPROTO;
>   	}
>   
> -	desc_idx = msg[0];
> +	ctx_id = msg[0];
>   
>   	/*
>   	 * The context lookup uses the xarray but lookups only require an RCU lock
> @@ -4077,7 +4077,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
>   	 * asynchronously until the reset is done.
>   	 */
>   	xa_lock_irqsave(&guc->context_lookup, flags);
> -	ce = g2h_context_lookup(guc, desc_idx);
> +	ce = g2h_context_lookup(guc, ctx_id);
>   	if (ce)
>   		intel_context_get(ce);
>   	xa_unlock_irqrestore(&guc->context_lookup, flags);

