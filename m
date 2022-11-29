Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888563C7FE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC2A10E26B;
	Tue, 29 Nov 2022 19:19:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4810E22A;
 Tue, 29 Nov 2022 19:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669749547; x=1701285547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IbRDBmSAiu78rDzUGPhp9ZKJQwgvgQGR2Qdc/BMhXRw=;
 b=Xl96ZFlr0OzBvYe7wdEJXfi87VZlhwFBGo+8b08jxdXLUOSt4K/dSamJ
 suYvA6cYBhWS4Tgj8vYBnEG8rKfkfZBMeyUU+bXa1dwQINJufIYQbd7lv
 AgOPO/oIV19BKDdjqTUYXt6OqLAFCJ7XIJjYiA1GIY8m7JblvWEJMnELZ
 ZerkutntesvE/mOFIFu80hF/X808SFiqXveT0l81tAl1vuS8hCSaLHBbK
 UdIG2eW4SW73jxywmokU+XTascRTwDygels44e3niA1FEVmV1z3FNskTF
 kUQgCo40kqcQ3Uylm0zOL2imQrAbMi6woadvVA443IlTKTGxGDDx6iWMu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="379493357"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="379493357"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 11:19:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="712503714"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="712503714"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2022 11:19:06 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 29 Nov 2022 11:19:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 29 Nov 2022 11:19:06 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 29 Nov 2022 11:19:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2xJgVkX6BSJ5LSjQ7O2vreWeVpv4pvSRKKiT/q5z6pF1hhBXWGyVwJWMZhaDyEciYDYSMBjH+XQHESjP5TMrNqzsCm+q0dIR+VuyXRU7/3lWFb3Nfn09Q1Jxf2yNog5YCphdHGILX0vPhCS8411zTioU1QB4WVFmJSyifmhgQk+KuGMFFY6PUgbx332Gs0PyBgexT2sBVX/LlzuJDla6H9aEudZjysigSRoafzXoa5/N7kdh0UDpKe47ZuOxsXiYoYpTFW8Uc0M7QhJBnhG/y0oXqAcjhwlJjm5FG7MKQbgC3PtOJNv9tAxQiab3IvV0ivu3+U9R2jhktG6QGYdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1ZD4lxBnmqipFDke1LxyYmBa0C3pchidqN7yimNt+0=;
 b=JGheBg2MHntVgJq9PgCPLJt3KtbvXalTG6fIwEONKege2sVap62YFNeabsl0yn8RHaRYId/IelQggAKjO0tmP5Uqa8E9Geo3uNBxH7eWQO+TzqmnFOqidmT0nHW/VDfnlYDZAJ2Epx9HYD8v7tFQ5OtzxaL3dez9L623YNnxylUmtbGDw9dGzv0ZmjGdbVcOzsHtd26kHrEXaOKHp3PG7kW8edVHS47mVkB2IrfsjiXtcSmOtOJVTmXD4x4SsDYec4cR3UYu39iXP+wM05FhvXcsjCQRgPGcJOSQfSIqbWVfeJVCn/iP17/7eqD+RPlNAIzv9cOFGrrtYMenCiht2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4593.namprd11.prod.outlook.com (2603:10b6:5:2a3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Tue, 29 Nov 2022 19:19:04 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 19:19:04 +0000
Message-ID: <e82e6983-abd0-b5c7-2f65-52a2170698a0@intel.com>
Date: Tue, 29 Nov 2022 11:19:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/3] drm/i915/guc: Use GuC submission API version number
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221123223108.1696415-1-John.C.Harrison@Intel.com>
 <20221123223108.1696415-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20221123223108.1696415-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM6PR11MB4593:EE_
X-MS-Office365-Filtering-Correlation-Id: fc72b349-d7ba-49a9-05d5-08dad23e940f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2k3e0BUO8TrIhaGWQnO4GIy4AbUspzeE9zS+3Q/xzb77CN3nBC5NokKtF74OmatsK38R9E3vxV2RPg14T/FGiKWyFDF/y95xCu7fScIjqO7rrm3aczwq00hOpSTuyrCZlaSZyIUY9FHFyAXG2XeiZoQM1Gbe3zgwI/ORoLaEPfVkluoT7OCWWCYl0gf57vjiJRxCYRBSxRFBwdN3VeoH5uZ6X4Rg8n7W/mqD9I2+foeuxdCbiyvufHDxBMnV7FI7hOyTdSq3tMnuUhmzvKaPzGZk9YJYac3QbfmT30lmPkXSdeHuyIPmTlm2dE1Ejevvh6zLHKU5uZNxA6nbXuYoCbH6GWnMGgbBGpI0tpZIbndg5cz4tBJX99GaqGBWhDfYo/JlcOJ8GIpZJG3PLxfAtFR2/l7OERZqE9Yf8ZWceFZ5c4ag9wso46EuMPMeMoIynFCEO7Qdgl9JuzBfvEtSXKyUfXzqH27D0Ef1LT0EW4W4ZLMVz15tfJDMipXor1LbO8KPk08pBWkoxx1yGkEmhiqBOe9GiFIXWQtZ3iSziQ8Fot0SIEl3Vnj5Ng9Hp+pJbKdpzKWJ4iVfoEmReSNSSz2Y1jwC6m94pwLUN/1awsStRPXVwZCZPQLFiGt09/2rcPczUeINRHkzuaEHLtEZz6tFcN1fHMua5jrCzbXLD9Y7nEDQMLEZeSLgmGruE5ltez6oXggTZ1mC+M13o8IkA/x7vDFAHzHcgHFyd4/moc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(5660300002)(82960400001)(30864003)(6512007)(26005)(2616005)(41300700001)(66556008)(66946007)(36756003)(8676002)(450100002)(66476007)(4326008)(38100700002)(2906002)(8936002)(186003)(86362001)(31696002)(316002)(6506007)(6486002)(53546011)(83380400001)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlpzVkJnTVVqNzBqR2dOKzAyMkIydkQwMVcyV3lnVlh2WjlROXJleUJweWI3?=
 =?utf-8?B?MXhMRjJodm8xV3lHcElqbXE4Ri9jV3A3cDdkZ1loZEFmZUswclFIa0dSRnMy?=
 =?utf-8?B?NXdYamZ2cTVRZ0pMZkY3dEgyVmtjbjJWNElCSmFnOHgydHUvbC90Mk40U3VY?=
 =?utf-8?B?S3Q4aHVVa2FseDkyazdIaHJOaFVYaVdHRzgxTEg4VEl6SHRUOGNmL1AvMzhy?=
 =?utf-8?B?cmZaTmowMTFvWVJEZjIvaVkxazZ2L1Z6N2xmN3V5OUZIUG1wWlFDbzFzbkVL?=
 =?utf-8?B?WWs0RTBNV2s4OEdaZmllSWp6TUQyc2dtenI2QXllMmJyTmNVakwraFFXNjhC?=
 =?utf-8?B?R29hOVdCS1c2V0VSMU9nRWI4NzNhT1E4R1IyUll1dmtaZGRUYytmSUxzK1Fy?=
 =?utf-8?B?VEVjS1RyVTNZVlFHWU1qY2h5QTZCeUVpU1lsYTZaSS96Qk5SOFVpZ3JTRDNx?=
 =?utf-8?B?bStZZmRTdE9wYzBYYlp5aVllN1VKaDBkaXM1RE9ueVBhSDNiRGZ0blRWZzBz?=
 =?utf-8?B?dTJIWTM4ZlIwVm9ualpVUG11RERwc3FjQm5mUEhtZWxzQlF3dW81YURhdWhM?=
 =?utf-8?B?VjJpUi9LS1l2NTdwN3lOWXVEQ205Z2tNUDRmbFgwdlBLUTFMQmR3bFBtbmJL?=
 =?utf-8?B?Q3R3SnNEV3A3Y0QxSTBDQWpWQmJ3ME5Zdmx5YnpHd0hTbm9UWEF6Y3RaeTNH?=
 =?utf-8?B?KzVuMTJwL0pibGhVM3dBdkhwOHIvRWwrdDFTSW9oNmhDaEtycTQ1Mm8wYXJl?=
 =?utf-8?B?cVBQLzQ5eFFLVlhzamVFU1czdnVEcDVOTENQNGU3dkx6YmdlTXBXR0YvbS9P?=
 =?utf-8?B?RlQzcld6cTVORlJVZ2xuOWtuUE8yZzZBOHhFRlRTUCtCaXUxRE55Q2Q3NWlT?=
 =?utf-8?B?M2prMUNyakVCMzVjYmtkTS9tdnN6dy9wMEFVTlFDbTdZSm1rVVl5YW43WWV6?=
 =?utf-8?B?dk1Remo5Y2Z2NCtFS0VTNGZpcm42emQrNFdPN0tpS1h4Z3k3YnhNbGtPU2ls?=
 =?utf-8?B?VWFDMFZkTCt4ZFhoUElWK2gxNkF3cTNTSDF3bXVEd2VNbmVLNEdTYktmeThL?=
 =?utf-8?B?aWw0NmlYbW92aFArT0JBenlVMmd3aHVSdnk5WWZ3Q0c1bU1qYWZrUEVISitv?=
 =?utf-8?B?NVFneVdMRld5WUJpTWVpaWtSUWFYUVVuSmFKNVBGUkk5bzB0YlROeTJQb3Fp?=
 =?utf-8?B?VGdVemEzeTdsUkdlMEVqWVp3QXl1bnozcUdxL3JmM1JOT245WGRiNXlqYThz?=
 =?utf-8?B?a0MwNzRJbWRjRHA5R2FvU3ZBRXk2cHFFVGVIWFZUaFRVSXVMenJHU0NLYW41?=
 =?utf-8?B?OGFGNVQxZnJETGpNVEtFUnVidEgxVDc2SDVleUZRWnpSWmZqV3U1emxUdG9O?=
 =?utf-8?B?Y2xDUENkQ1I5Sys5T09LM2hpVnFsWVZKUkFBcmVDOVMzTmRqTnJ5bllRYURV?=
 =?utf-8?B?VGRMa3k2MjQvdXVaMmlnWnJVYWg1eDZ5aHVxSTNqOWZ0VUFydDYvWU1SSTVs?=
 =?utf-8?B?UG5LR3F4a2FhMHBEV2p1TnNhT0ROUjdnWHFaNithUnNqN2ZENThnWitSWW5a?=
 =?utf-8?B?L1RRMlB5VFFSQ2w1bjlqaFBqZDMzRzBvUEZMcXJ3dlkyWXRxWWN4b3hrb0tk?=
 =?utf-8?B?SjZjR1lQcERHRExCZCtab2M4Y241eXBEWm4zbzhhWng5TlJmQ2lpQm81YVBJ?=
 =?utf-8?B?bm00a3Y4TnArTk9mWFA4aVh1UG9WTitaRUhoMVFTMDhnN2tFU2EvdmpLcWdL?=
 =?utf-8?B?S0tFdGJKdkFtN3BnOHY5bWpobDV6OFVpQ3B3dmlLVTFTbG1lYlRtMnpBOENo?=
 =?utf-8?B?M3lnb2lrZ1VsMHZudCtlTG1RcURGN0pzR01zcXVYUmtiNWRXRHpZQitqVnNO?=
 =?utf-8?B?MHJ2djBZYTkwc2p1YU5rVHZ2R1czc1FBV09obVBrZEhtSDliZGhqSnZPa0xW?=
 =?utf-8?B?K0lEZjBHSi9kdk43aUhKdEdBdExNdzhwb3VSclBRRjVXdURtUmVDV0NNWmx2?=
 =?utf-8?B?YmkyeVY4Vkl3MHFmZDYxWldFU0E5MllMaUhOQ004T1FTdm9GNnl1WkZpWlVI?=
 =?utf-8?B?WDlvcWtmNDlCeEFETDZrMjhrR3VaSzBnY0lRMjl5alVKQ050eTBwMXhNNzBM?=
 =?utf-8?B?SWRsZXFuR0hpNXJ3OXNvR2JwVHRLWDRNUjJhY3I2RjlkR1dHL24vK0ZwRENG?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc72b349-d7ba-49a9-05d5-08dad23e940f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 19:19:04.1883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTXBMRVQ/uCKah0iLgDg2207GUOHhN8ZxIsnev+KxvYCPO7m95aCEfDJXD4x6mCMZ1aKf44mXRkfygOYM0jQ6jqz/R8hM8LjORRvUxtc2IQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4593
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



On 11/23/2022 2:31 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The GuC firmware includes an extra version number to specify the
> submission API level. So use that rather than the main firmware
> version number for submission related checks.
>
> Also, while it is guaranteed that GuC version number components are
> only 8-bits in size, other firmwares do not have that restriction. So
> stop making assumptions about them generically fitting in a u16
> individually, or in a u32 as a combined 8.8.8.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  15 ++-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 124 ++++++++++++++++--
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  10 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   3 +-
>   5 files changed, 137 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 1bb3f98292866..bb4dfe707a7d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -158,6 +158,9 @@ struct intel_guc {
>   	bool submission_selected;
>   	/** @submission_initialized: tracks whether GuC submission has been initialised */
>   	bool submission_initialized;
> +	/** @submission_version: Submission API version of the currently loaded firmware */
> +	struct intel_uc_fw_ver submission_version;
> +
>   	/**
>   	 * @rc_supported: tracks whether we support GuC rc on the current platform
>   	 */
> @@ -268,6 +271,14 @@ struct intel_guc {
>   #endif
>   };
>   
> +/*
> + * GuC version number components are only 8-bit, so converting to a 32bit 8.8.8
> + * integer works.
> + */
> +#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
> +#define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
> +
>   static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
>   {
>   	return container_of(log, struct intel_guc, log);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0a42f1807f52c..53f7f599cde3a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1890,7 +1890,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	if (guc->submission_initialized)
>   		return 0;
>   
> -	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 0, 0)) {
>   		ret = guc_lrc_desc_pool_create_v69(guc);
>   		if (ret)
>   			return ret;
> @@ -2330,7 +2330,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
>   		ret = register_context_v70(guc, ce, loop);
>   	else
>   		ret = register_context_v69(guc, ce, loop);
> @@ -2342,7 +2342,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -		if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
> +		if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0))
>   			guc_context_policy_init_v70(ce, loop);
>   	}
>   
> @@ -2956,7 +2956,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, guc_id);
> @@ -3283,7 +3283,7 @@ static int guc_context_alloc(struct intel_context *ce)
>   static void __guc_context_set_prio(struct intel_guc *guc,
>   				   struct intel_context *ce)
>   {
> -	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> @@ -4366,7 +4366,7 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
>   
> -	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 3, 0))
> +	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
>   		return 0;
>   
>   	__guc_scheduling_policy_start_klv(&policy);
> @@ -4905,6 +4905,9 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   	if (!sched_engine)
>   		return;
>   
> +	drm_printf(p, "GuC Submission API Version: %d.%d.%d\n",
> +		   guc->submission_version.major, guc->submission_version.minor,
> +		   guc->submission_version.patch);
>   	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
>   		   atomic_read(&guc->outstanding_submission_g2h));
>   	drm_printf(p, "GuC tasklet count: %u\n",
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 5e2ee1ac89514..7d2349647b593 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -478,6 +478,62 @@ static int check_gsc_manifest(const struct firmware *fw,
>   	return 0;
>   }
>   
> +static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 css_value)
> +{
> +	/* Get version numbers from the CSS header */
> +	ver->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css_value);
> +	ver->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css_value);
> +	ver->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css_value);
> +}
> +
> +static void guc_read_css_info(struct intel_uc_fw *uc_fw, struct uc_css_header *css)
> +{
> +	struct intel_guc *guc = container_of(uc_fw, struct intel_guc, fw);
> +
> +	/*
> +	 * The GuC firmware includes an extra version number to specify the
> +	 * submission API level. This allows submission code to work with
> +	 * multiple GuC versions without having to know the absolute firmware
> +	 * version number (there are likely to be multiple firmware releases
> +	 * which all support the same submission API level).
> +	 *
> +	 * Note that the spec for the CSS header defines this version number
> +	 * as 'vf_version' as it was originally intended for virtualisation.
> +	 * However, it is applicable to native submission as well.
> +	 *
> +	 * Unfortunately, due to an oversight, this version number was only
> +	 * exposed in the CSS header from v70.6.0.
> +	 */
> +	if (uc_fw->file_selected.ver.major >= 70) {
> +		if (uc_fw->file_selected.ver.minor >= 6) {
> +			/* v70.6.0 adds CSS header support */
> +			uc_unpack_css_version(&guc->submission_version, css->vf_version);
> +		} else if (uc_fw->file_selected.ver.minor >= 3) {
> +			/* v70.3.0 introduced v1.1.0 */
> +			guc->submission_version.major = 1;
> +			guc->submission_version.minor = 1;
> +			guc->submission_version.patch = 0;
> +		} else {
> +			/* v70.0.0 introduced v1.0.0 */
> +			guc->submission_version.major = 1;
> +			guc->submission_version.minor = 0;
> +			guc->submission_version.patch = 0;
> +		}
> +	} else if (uc_fw->file_selected.ver.major >= 69) {
> +		/* v69.0.0 introduced v0.10.0 */
> +		guc->submission_version.major = 0;
> +		guc->submission_version.minor = 10;
> +		guc->submission_version.patch = 0;
> +	} else {
> +		/* Prior versions were v0.1.0 */
> +		guc->submission_version.major = 0;
> +		guc->submission_version.minor = 1;
> +		guc->submission_version.patch = 0;
> +	}
> +
> +	uc_fw->private_data_size = css->private_data_size;
> +}
> +
>   static int check_ccs_header(struct intel_gt *gt,
>   			    const struct firmware *fw,
>   			    struct intel_uc_fw *uc_fw)
> @@ -531,20 +587,50 @@ static int check_ccs_header(struct intel_gt *gt,
>   		return -E2BIG;
>   	}
>   
> -	/* Get version numbers from the CSS header */
> -	uc_fw->file_selected.ver.major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -						   css->sw_version);
> -	uc_fw->file_selected.ver.minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -						   css->sw_version);
> -	uc_fw->file_selected.ver.patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -						   css->sw_version);
> +	uc_unpack_css_version(&uc_fw->file_selected.ver, css->sw_version);
>   
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
> -		uc_fw->private_data_size = css->private_data_size;
> +		guc_read_css_info(uc_fw, css);
>   
>   	return 0;
>   }
>   
> +static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
> +{
> +	return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 0xFF;
> +}
> +
> +static bool gyc_check_version_range(struct intel_uc_fw *uc_fw)

typo gyc. With this fixed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +{
> +	struct intel_guc *guc = container_of(uc_fw, struct intel_guc, fw);
> +
> +	/*
> +	 * GuC version number components are defined as being 8-bits.
> +	 * The submission code relies on this to optimise version comparison
> +	 * tests. So enforce the restriction here.
> +	 */
> +
> +	if (!is_ver_8bit(&uc_fw->file_selected.ver)) {
> +		drm_warn(&__uc_fw_to_gt(uc_fw)->i915->drm, "%s firmware: invalid file version: 0x%02X:%02X:%02X\n",
> +			 intel_uc_fw_type_repr(uc_fw->type),
> +			 uc_fw->file_selected.ver.major,
> +			 uc_fw->file_selected.ver.minor,
> +			 uc_fw->file_selected.ver.patch);
> +		return false;
> +	}
> +
> +	if (!is_ver_8bit(&guc->submission_version)) {
> +		drm_warn(&__uc_fw_to_gt(uc_fw)->i915->drm, "%s firmware: invalid submit version: 0x%02X:%02X:%02X\n",
> +			 intel_uc_fw_type_repr(uc_fw->type),
> +			 guc->submission_version.major,
> +			 guc->submission_version.minor,
> +			 guc->submission_version.patch);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   /**
>    * intel_uc_fw_fetch - fetch uC firmware
>    * @uc_fw: uC firmware
> @@ -621,6 +707,9 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> +	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC && !gyc_check_version_range(uc_fw))
> +		goto fail;
> +
>   	if (uc_fw->file_wanted.ver.major) {
>   		/* Check the file's major version was as it claimed */
>   		if (uc_fw->file_selected.ver.major != uc_fw->file_wanted.ver.major) {
> @@ -1054,7 +1143,7 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>    */
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   {
> -	u32 ver_sel, ver_want;
> +	bool got_wanted;
>   
>   	drm_printf(p, "%s firmware: %s\n",
>   		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path);
> @@ -1063,9 +1152,20 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
> -	ver_sel = MAKE_UC_VER_STRUCT(uc_fw->file_selected.ver);
> -	ver_want = MAKE_UC_VER_STRUCT(uc_fw->file_wanted.ver);
> -	if (ver_sel < ver_want)
> +
> +	if (uc_fw->file_selected.ver.major < uc_fw->file_wanted.ver.major)
> +		got_wanted = false;
> +	else if ((uc_fw->file_selected.ver.major == uc_fw->file_wanted.ver.major) &&
> +		 (uc_fw->file_selected.ver.minor < uc_fw->file_wanted.ver.minor))
> +		got_wanted = false;
> +	else if ((uc_fw->file_selected.ver.major == uc_fw->file_wanted.ver.major) &&
> +		 (uc_fw->file_selected.ver.minor == uc_fw->file_wanted.ver.minor) &&
> +		 (uc_fw->file_selected.ver.patch < uc_fw->file_wanted.ver.patch))
> +		got_wanted = false;
> +	else
> +		got_wanted = true;
> +
> +	if (!got_wanted)
>   		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
>   			   uc_fw->file_wanted.ver.major,
>   			   uc_fw->file_wanted.ver.minor,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 6501d6f1fbdff..3ab87c54a3987 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -66,9 +66,9 @@ enum intel_uc_fw_type {
>   #define INTEL_UC_FW_NUM_TYPES 2
>   
>   struct intel_uc_fw_ver {
> -	u16 major;
> -	u16 minor;
> -	u16 patch;
> +	u32 major;
> +	u32 minor;
> +	u32 patch;
>   };
>   
>   /*
> @@ -114,10 +114,6 @@ struct intel_uc_fw {
>   	bool loaded_via_gsc;
>   };
>   
> -#define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
> -#define MAKE_UC_VER_STRUCT(ver)		MAKE_UC_VER((ver).major, (ver).minor, (ver).patch)
> -#define GET_UC_VER(uc)			(MAKE_UC_VER_STRUCT((uc)->fw.file_selected.ver))
> -
>   /*
>    * When we load the uC binaries, we pin them in a reserved section at the top of
>    * the GGTT, which is ~18 MBs. On multi-GT systems where the GTs share the GGTT,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index 7a411178bdbf2..646fa8aa6cf19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -74,7 +74,8 @@ struct uc_css_header {
>   #define CSS_SW_VERSION_UC_MAJOR		(0xFF << 16)
>   #define CSS_SW_VERSION_UC_MINOR		(0xFF << 8)
>   #define CSS_SW_VERSION_UC_PATCH		(0xFF << 0)
> -	u32 reserved0[13];
> +	u32 vf_version;
> +	u32 reserved0[12];
>   	union {
>   		u32 private_data_size; /* only applies to GuC */
>   		u32 reserved1;

