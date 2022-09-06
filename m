Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597315AF5D0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4424810E224;
	Tue,  6 Sep 2022 20:28:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196C10E1A6;
 Tue,  6 Sep 2022 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662496080; x=1694032080;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l6TVCIx46F2hOWBLIehIFaOGsKBE48Rh18pOi7jNdjY=;
 b=Ur+dbyJsqEnZlEUIsfegT9t4b8/E8WqtpObeKHeUVnaMRPh+gPffcooA
 VyrWLIQBC1iWEBfL9XO6M9YAxj0SZlWf01fQZvP51XU0XY9CUB+f2nWFV
 B/uJ2rAmbpMyujt5wBvmTg5C0FolJ+SxgJfrM8C2bJb+5Y4f1eX3NkYDV
 4tymMpg6Qm2IGeov+YNaTFRWFEOOiBnF3KPqFcy2wjpGpZrwCM5yw7aIl
 /cUg+mEAf5iJFCsmROlTGIBoT/sw4DQ2Ia6NvbJsEwVrnzfzVokIYz8uz
 xCqwn2v06zUyy/9kZb5f/wsBGgejzR/Zmol7UewRybBNghvUTEgOPvh1f w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="298013224"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="298013224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 13:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="610080233"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 06 Sep 2022 13:27:58 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:27:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 13:27:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 13:27:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 13:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBy+GIOgfE0iKGBAEqI3SmvzCEpiZSpmP9qMpp5XXzqmSHAleKcPXtsaEcoZ4zgC5G0AZmPNi7kADrl2SOzmglaXXTeDTCKZMet0FBnR1CCkdNR8l+Q6TrnrP9mLNBYyFt7YCstIhdCCV21ZSnpZXg9w83nyUIauMofZfOYvX9dFFI0H+n3jBazSaM3LxNc4JLhzrSpxvgMW3dY8wNAfMV1odH4eop2gRSp6iznUbZWVI4o2PicR1lfzS2Y6oyiV7rXUYT+CYtJjl0cQC7XqoorQ5pvF98XJqMFjv5YtCYXXQ3+iyQPOP1q5FF+2uHXqCws+Pu/KyAiSOjhDzi4vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzlRTOVIGJ+iTRCgOQpUhARUw/ttUlHA7INnwOMdjKo=;
 b=GVB1zdIc55TqXR288wiSy7y8W4VAL3fkp6uQU17OFToD5sUxMNwQIETsUKdUPFGWeV1a3zLz0UZLQDKZptbHNuSxY5wDL7j4qrI5NSJmCFplEsV8DYYT32msWekpMLCRNUCjpP0Kj07KrmoMSNog3AEjGN5OLM2m+46BfGiFwUb9biWIhWNjLCv+EoxMYTsWvLWFLDcaYL6EGgFcZHqSksJuvBWaE0HGyk0jdMhDUwbhzGwXf0iAW+/C/lUI5+VVopiPqIQWEivMiTEe223C/9VQ8GkTGnwSQAlbTPdl6Pdpu1sNmgo7OnKVVUFNhsAlr25G2OGLx0qrhIETFz0+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BN6PR11MB2050.namprd11.prod.outlook.com (2603:10b6:404:3c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.16; Tue, 6 Sep 2022 20:27:50 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 20:27:50 +0000
Message-ID: <687bf84c-069e-e5e8-1993-cd6f40ce17fa@intel.com>
Date: Tue, 6 Sep 2022 13:27:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm/i915/uc: Add patch level version
 number support
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220827011702.3465334-1-John.C.Harrison@Intel.com>
 <20220827011702.3465334-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220827011702.3465334-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1942e321-dfe4-4e00-de78-08da90464481
X-MS-TrafficTypeDiagnostic: BN6PR11MB2050:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WMFlbodWbhu8YBzq3svlO129b+JDL9mPpPaZdpYm7AY29DOCdPwMoFxCiijP39Uj0DMncxQeB9zE6LxzuprlhUGyEOHOX8Z0CsWNafXLwm4ZRADOylNopOE+VOsPNe3huT2pjPWe5LVK0RPr1tr3AIkXzhExML8FmxYj2r/tQoym4D7TfVftuo0XfFRJxDNkYl2PkvQkg7c8LPrp+mCOdzYx+rqM4DdH+nS2iPrEvRkki+WSGdct9qepu3wryMVhMpuaDKwG6RncYb+DLJVPjRLlhyRknvGwerk1pH+y+sWAMs+kxhLRikMn7JoffoN71++DQpHFCNMiqMIGs+4BOb+0YvHtUk4pFie/PT+smSYUkJJuVwDGGV/wnNYsQw4Y//5F4gZrNjPIMAjkAAirXi5WcM48pIygwQJBRp70j4seTq6EIaR8EkxoNgiv4IQwoz8PZMZoFC2a+ALLrwi7jiQyerLn/TFN4zekP8qlHXnxLjDj0tuROnIjEPQ2r0aAPa2ULsnxSapnyMQ+KXoKGVzBbEEMvJ3vBqohAyyAPoo+gSg4s0haAEQd3fQuU3W8KWHr2V1Qh9qmSj+h1rrkoAuL3QA/JXx6CO3hsqHAXMQ0LwapkbE45AZjKGTGJYVnrsQT5F7G99Ox6142XP7VOuIrj/9K8Se/p8tajtXKpgBYfIwmYdCDSIUC/Zpf1mfXr5c/rYOyqxLFLU+AG0cMnL3uXXeFuIeMahmlBGT5fepVl7Ty+GFSekzU616Ha7h9x05LEfOYGqzPZEHHuhsncZunV3jeeqCTudPcRdBHwe0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(396003)(346002)(366004)(136003)(6666004)(6512007)(26005)(6506007)(53546011)(8676002)(5660300002)(8936002)(83380400001)(4326008)(2616005)(186003)(41300700001)(66946007)(2906002)(6486002)(66476007)(66556008)(450100002)(478600001)(316002)(38100700002)(31696002)(82960400001)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjQ4OXlUZlkrTmt6MlZZd1plWXFrQ0hkS3NkelljR293SmdQb2tFQUptYUZL?=
 =?utf-8?B?OU9SMkY4aWd6WExDNzB3R3FsUFhXbXl1NzVQcGNEUjIrcFpUaEJJa2QyazNO?=
 =?utf-8?B?NWcyaUV1TnBORTVCZzFkYk8xWUlZTlZBbTNmZ3JET0FlQnN1VjdRM0dkUkJq?=
 =?utf-8?B?ejB1WDdyK0R5WEJ0Vis2dVpRMGxnQmdlOG5Bdi9iLzdTSUJ2YTQ3WTdsOHQ3?=
 =?utf-8?B?RHZnR1FjNDBzQnZJRGxnckNQdW9iOW9KK3JZNG1VR29pcGZyQjZNa2RjSmE1?=
 =?utf-8?B?WW96K2RlMEd6dnI1cDIyeEEydVNQcFNIR0pkNmFZUUc0a01nMUJFaDRZMjBp?=
 =?utf-8?B?d2FDUUZCMWJaNm5WM2kxdEdLeHFaYjh1a1VwVUFpM2hJVENZVE5XamVQSm5Q?=
 =?utf-8?B?MmlISTBxazF1WURjVkFoWTZaSVpNNUd0MFRycnZqQ3hnRGhMMldsV0hZM0ZL?=
 =?utf-8?B?cXJTRkduVDdIVldvUHY5TW1qcHFDNmpiVmtmQ1p2Mno3VVB1ZGFsUFZXY1pa?=
 =?utf-8?B?OGNzUXhGaFJNcXlWTytpS0tsU0NnUms3UGRQQUVvWDdzOU9OV2NhVDhGYXRT?=
 =?utf-8?B?RkJWV1M3QzdxKytxNnZYZDE0QzNTaS9FMmowejBMajkzTllEVEtUUEttUWdO?=
 =?utf-8?B?VWswN1FtQlpON05PWk9jbkE0Y2phTWFKaDdoOEJnOW10c0hqMmN0T0tpbXFV?=
 =?utf-8?B?ekZVYTljZFdMNVJaeFZ6U3AxcUxKWlRBb0dVNUlHVXltK2ZHdVVVOHpCb2F3?=
 =?utf-8?B?NEhSc3hhN1h1ME54bTVWUlI4Z3ZUWnMxWW5aNXRwVkdJQWZKaDhrNEZBd3dk?=
 =?utf-8?B?djVseTBGdkljbEZOcElQeHV5c2FqUlJNbDBIL3FmQWNPYTYzSllhTW15cTJu?=
 =?utf-8?B?SmFMcXo5SkxqRTNodG5lRTVkZmwvNDlJTTl6d1hJRlo5MHpsNDhjN3ZCaW4r?=
 =?utf-8?B?WjRGYkh6YXdoRGJFM1AwR0JaUUdBNzc1N0Y0NHVHOHRYQklMeEtFOFYwbjYz?=
 =?utf-8?B?Z3cvNDdVS2dNZWd5VzhiRE9Cbkd6Zlc2ZDRWL1BLSGJtZ3QrM3NPazErNVdF?=
 =?utf-8?B?aTF6K3drRTAyNkx5SCtXMStLTU1iZ0c0c0M0OXh6RGJJVVFVQy9pbDZUNVdC?=
 =?utf-8?B?bHg3aUtoU1FRVmVudTdVaTlLV3JkMVNXNUp0bjVaR2pkT2h6dE1zVlp6Ympq?=
 =?utf-8?B?V3l5Y1BrS1B0cXI1K3Z5dHNTZGRIMVpIbjViS2NJY3ZmR2xmY1p0OWVCdmR0?=
 =?utf-8?B?S3psVTlEOVhqOE5VTDhVM09HelY4dTZZcDFTNHZwMGNueDJtbkNZZ1VmQ2FT?=
 =?utf-8?B?eU8rbVlYUnVCQjVtY3Z2dHNTMk1yN3ZEeTg1NExjNDArdVFqSGtPMGw0VjF3?=
 =?utf-8?B?RXVlZjRQZ05waWhqUnRkN25FL0VsenBYZFdUOXQzOXF3ZEhGOFBnUms4OVpi?=
 =?utf-8?B?dHIyTW1kSlNkU1FuZkZNei9CNUFqQ3VpUTQyemdyRk4zdE5qbGkzTWxZRUVB?=
 =?utf-8?B?U2VrL0xVZ0RmdUlRYXVnL1pQTGNkRlVMazYvZGVLRUJmaFF2azdVbjFSbmQ4?=
 =?utf-8?B?MytpbEpUcGxIenJKVlNobjFWcVhCOFljUlM3OGs0bGlpZGdUenpRVCtlcE1u?=
 =?utf-8?B?b2JNRE5uWDl4a0lrTzNXNjNvKzk5NGN2eEtubkt2UEhPOU1OKzRFUDc1c3Ry?=
 =?utf-8?B?UzBEV2VLTDU2ZnF0YUtCU2sxQVMralVHcGZxWUxJYUYvNnh5MVJoUUhFOERi?=
 =?utf-8?B?cUtlR2sra25DYjY3K2g2VkoxYVZPenJkbUZBUmdrQ01rRG5jTmJaanhhYkIw?=
 =?utf-8?B?ZlhQYmJUSWRhZlh3Q25mOWlUQWwyV1ora3o4WUFnWUdmUXVNN0lhT29sK2tx?=
 =?utf-8?B?UXh5NktkNGZoUDlqb1YyM3BDZWMyRkVMOWtSVktJcy9YY2g0TmVnNURLUWYv?=
 =?utf-8?B?ZnlJcTBhV3BOT1cza2c1TzN3ZXptaktJTEtGUkdWdkNDeXhaVFUvQzFNOEJT?=
 =?utf-8?B?dFdpTC9xUDNkTkRDaVJJNjR6cXFWT0ZITzd0VUVsbkdkRGpaYzJEbVl2SmxR?=
 =?utf-8?B?NTR3OVpmdUNCR2VBLy96YW1aR1ZpYTJvZThsblQvTmVqdGxjTWNVaHRxdUJW?=
 =?utf-8?B?dGh2RnByZHB0V1o3eHR4ZlhSd05WZkE5SW1JcGd4a2JxdENQREFyL0lEQmhX?=
 =?utf-8?Q?5qmBfTwyYDW9Ti4/QvCfrBk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1942e321-dfe4-4e00-de78-08da90464481
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 20:27:50.1255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYB+7GqMsj1MgAh0TuHlBAaCVrFgmDbWur43hzKZ9G3UFGRz9pf/9lnK+stuems07fmVeoCtiFWB/mHhGaHtstHet+ADp5PUd9RNYhrWt4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2050
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



On 8/26/2022 6:17 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> With the move to un-versioned filenames, it becomes more difficult to
> know exactly what version of a given firmware is being used. So add
> the patch level version number to the debugfs output.
>
> Also, support matching by patch level when selecting code paths for
> firmware compatibility. While a patch level change cannot be backwards
> breaking, it is potentially possible that a new feature only works
> from a given patch level onwards (even though it was theoretically
> added in an earlier version that bumped the major or minor version).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 36 ++++++++++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  6 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |  8 +++--
>   5 files changed, 47 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 04393932623c7..64c4e83153f47 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	if (guc->submission_initialized)
>   		return 0;
>   
> -	if (guc->fw.file_selected.major_ver < 70) {
> +	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
>   		ret = guc_lrc_desc_pool_create_v69(guc);
>   		if (ret)
>   			return ret;
> @@ -2303,7 +2303,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	if (guc->fw.file_selected.major_ver >= 70)
> +	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
>   		ret = register_context_v70(guc, ce, loop);
>   	else
>   		ret = register_context_v69(guc, ce, loop);
> @@ -2315,7 +2315,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -		if (guc->fw.file_selected.major_ver >= 70)
> +		if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
>   			guc_context_policy_init_v70(ce, loop);
>   	}
>   
> @@ -2921,7 +2921,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	if (guc->fw.file_selected.major_ver >= 70) {
> +	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, guc_id);
> @@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct intel_context *ce)
>   static void __guc_context_set_prio(struct intel_guc *guc,
>   				   struct intel_context *ce)
>   {
> -	if (guc->fw.file_selected.major_ver >= 70) {
> +	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index d965ac4832d60..abf4e142596d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -435,9 +435,11 @@ static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
>   {
>   	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   
> -	drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
> +	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
>   		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> -		 fw->file_selected.major_ver, fw->file_selected.minor_ver);
> +		 fw->file_selected.major_ver,
> +		 fw->file_selected.minor_ver,
> +		 fw->file_selected.patch_ver);
>   }
>   
>   static int __uc_init_hw(struct intel_uc *uc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 610f36f1b989a..af425916cdf64 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -447,10 +447,12 @@ static int check_gsc_manifest(const struct firmware *fw,
>   			      struct intel_uc_fw *uc_fw)
>   {
>   	u32 *dw = (u32 *)fw->data;
> -	u32 version = dw[HUC_GSC_VERSION_DW];
> +	u32 version_hi = dw[HUC_GSC_VERSION_HI_DW];
> +	u32 version_lo = dw[HUC_GSC_VERSION_LO_DW];
>   
> -	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
> -	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
> +	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> +	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> +	uc_fw->file_selected.patch_ver = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>   
>   	return 0;
>   }
> @@ -512,6 +514,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   						   css->sw_version);
>   	uc_fw->file_selected.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>   						   css->sw_version);
> +	uc_fw->file_selected.patch_ver = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +						   css->sw_version);
>   
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>   		uc_fw->private_data_size = css->private_data_size;
> @@ -1000,6 +1004,8 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>    */
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   {
> +	u32 ver_sel, ver_want;
> +
>   	drm_printf(p, "%s firmware: %s\n",
>   		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path);
>   	if (uc_fw->file_selected.path != uc_fw->file_wanted.path)
> @@ -1007,13 +1013,25 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
> -	if (uc_fw->file_wanted.major_ver)
> -		drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> -			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
> -			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
> +	ver_sel = MAKE_UC_VER(uc_fw->file_selected.major_ver,
> +			      uc_fw->file_selected.minor_ver,
> +			      uc_fw->file_selected.patch_ver);
> +	ver_want = MAKE_UC_VER(uc_fw->file_wanted.major_ver,
> +			       uc_fw->file_wanted.minor_ver,
> +			       uc_fw->file_wanted.patch_ver);
> +	if (ver_sel < ver_want)
> +		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
> +			   uc_fw->file_wanted.major_ver,
> +			   uc_fw->file_wanted.minor_ver,
> +			   uc_fw->file_wanted.patch_ver,
> +			   uc_fw->file_selected.major_ver,
> +			   uc_fw->file_selected.minor_ver,
> +			   uc_fw->file_selected.patch_ver);
>   	else
> -		drm_printf(p, "\tversion: found %u.%u\n",
> -			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
> +		drm_printf(p, "\tversion: found %u.%u.%u\n",
> +			   uc_fw->file_selected.major_ver,
> +			   uc_fw->file_selected.minor_ver,
> +			   uc_fw->file_selected.patch_ver);
>   	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>   	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 344763c942e37..cb586f7df270b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -73,6 +73,7 @@ struct intel_uc_fw_file {
>   	const char *path;
>   	u16 major_ver;
>   	u16 minor_ver;
> +	u16 patch_ver;
>   };
>   
>   /*
> @@ -108,6 +109,11 @@ struct intel_uc_fw {
>   	bool loaded_via_gsc;
>   };
>   
> +#define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
> +#define GET_UC_VER(uc)			(MAKE_UC_VER((uc)->fw.file_selected.major_ver, \
> +						     (uc)->fw.file_selected.minor_ver, \
> +						     (uc)->fw.file_selected.patch_ver))
> +
>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>   void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   			       enum intel_uc_fw_status status);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index b05e0e35b734c..7a411178bdbf2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -83,8 +83,10 @@ struct uc_css_header {
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   
> -#define HUC_GSC_VERSION_DW		44
> -#define   HUC_GSC_MAJOR_VER_MASK	(0xFF << 0)
> -#define   HUC_GSC_MINOR_VER_MASK	(0xFF << 16)
> +#define HUC_GSC_VERSION_HI_DW		44
> +#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
> +#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
> +#define HUC_GSC_VERSION_LO_DW		45
> +#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 0)
>   
>   #endif /* _INTEL_UC_FW_ABI_H */

