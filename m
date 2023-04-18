Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7586E6C49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55B10E844;
	Tue, 18 Apr 2023 18:41:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F4310E844;
 Tue, 18 Apr 2023 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681843302; x=1713379302;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uXeNoPSMU/jzz1AI/iqZL8G3yOSp4pLaajkNn1FOTZw=;
 b=bqjOfJdwbQ2PF6QkiiMHua3v/MRMpD1Z/j8WZNOXId+1mjLK3LJfIDjn
 nP9ttTHsuJZZH1lkANcvrKEaf0V1d+6VjdR1ZQ/N5R5LpDWu4xNjbJwwf
 XMplqOuh5hvOUdgEoXEp8PTd30In82/kZ6skOJtp3g8BAentOlzGhSnaU
 QvYZWiGe9UuWr1dywRTAMkoliNocmb4U01LvFFHrDZ+yMmh1m/vPxbtie
 Q0cHu9VWlX9Q8iwHJ6kgdFSQ6HLHoqZHaEGwvZEMh7ULIyIQ55z+iseIP
 k24Fx36gjif2/7lWLQmC7p5uhh2e6GcTGRibSVQvk2AXwf0G776QhISRP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324877424"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="324877424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 11:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723769216"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="723769216"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 18 Apr 2023 11:41:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:41:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 11:41:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 11:41:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 11:41:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/Wt9tW87uoE8dme459jlsKMO3s5EgYt/fnAlvc9PdFwgwz9ISB+3MjuDe2sod9MeFjK0fQEJEHVjjGujsf2tmNCt0jpWXjR8JmIQo7kzAdQlnyrVdNLV7jklAidgv3MG0NBewztXzr9fXO6SavSMN2ssRabv2vtsHP3qoG8ySmtqGWqzy/jUUacgb37ICvbX4W97Gz8MrF1DXWhDxKHyvBueE+5I4JNVF4jxfgFlBHM6OyNHnE2Qbsn9eGkpbVVZwJ8PczSQ23ckxDPMzIV5jZTyvHzB7LBxA6viVLAkMPu5Q2TwRa6tVQNigkrsJjLEAyzNV3gVN1hwdlX2iID5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNCRoNNOFyZFcR/ZPA3a4F+XqeVbOYMsfn2kz+9V+yc=;
 b=DYJPqP4u3atY1Ez7hUEXTPjWJaAY0NTld+0VYoMmcuAxH4bEb29OiQzA+XjiuMmjAfMJ164QQWid6c+GHjCe6locQbNL4z5xQRnmfpXpphsjfhNVPW7xtiwK/bIaD4oFMTO4wfoOrm5wWM5zxZZF16w4AnpZOdvfsiqSkgoHkcV02cpis21RiLEE2v7pIv0WVhTnSbldEO+giHs/aq6d27dotiQ8Jr84PpZw9DzTDLIfOp3qgwyVAHcNnfCE9ZwtdApYhqxUHMqUoakL73NSrK82aLrKxCF4V7pIcP98yycyMOfJlX8tQyd7U1DNyMMnJ6Wds7SBllvrncd6drFLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 18:41:37 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 18:41:37 +0000
Message-ID: <120661e9-0e05-5d6a-3872-de48276f91cd@intel.com>
Date: Tue, 18 Apr 2023 11:41:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915/guc: Decode another GuC load
 failure case
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
 <20230415005706.4135485-2-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230415005706.4135485-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SJ0PR11MB4816:EE_
X-MS-Office365-Filtering-Correlation-Id: 3955fc37-922d-4a92-3db7-08db403c8a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qf/Mr5tOAJSVCfQOloiMMWQN83mqqIEGQEcj4NaUwyZslSaryTGfy2SN5SpaEhKSVc0x6Z/7yG3iukAs8VBbZjVhEcLHaD5kpd7xRVgIjBZ8DN8hof6q+uofGrqnCaG+D8m+Ukv7oSPUj2aqGZzv1DAkWxtmtnH0v8Vr71aBNOt1aMAqUxBvNzjzFSm+NOrjHfTEC0CopL+dgTEWc+IEYPPnlvlEEyjXAQcgGHScLBktVd6riOUPdxo04SvivMr5HD66eKEYM4XPJeShLe/oFKAphf32mBtdZpdoSaMI2HZdlsfyahiaevTMoXeFEEZsW1IcOPmcnzhRozDTU7z1CmI33HDkfnmg1ewYtnSUz1LtU9A5YyhFfdpMMt/c/IaHakm0iSi3Ux4h5igTWcco+5xOgiMRXweYLqT/78MW/OQfeNMvAGPPxjf5bs/IvT6ZO2g79Gk96XiK1RnD6Uv26kvre14cac0pemxO2BQ7paJMW/JR3s5cfAya5a9aXgIfVNN4OO3ZIjMC2vh+8NaW6RVrMe/kZxY1CyMPhXlR2D7VBhfU8gi0byxNsnMDOpqm0i99jwsr7vQaVfwci6NoI61Cjq+clZHcmHbKbvoWYBUzdVPAhLffhN1Nq4/V+MBaTe4YhgCgt978ND5tUiQMBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199021)(26005)(186003)(6512007)(53546011)(41300700001)(6506007)(450100002)(86362001)(83380400001)(2616005)(4326008)(31696002)(316002)(66946007)(66476007)(66556008)(2906002)(8676002)(8936002)(6486002)(82960400001)(31686004)(38100700002)(36756003)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzBkVmNkaUd0dlR2bFFsRCt2azZ4aWh6M1BWSnBBL1M2V29tUy9zVlJnR3Ix?=
 =?utf-8?B?Qkp3eGFQcDNZb1RPaXVieDJKRTE5anlaUGRBL0pic2xnTC9MZXM5MXFrbnRW?=
 =?utf-8?B?aDBWZFM1c0tmNlFpSVFEVlVOcmwvL2lyNmFRVVVPYkE4amV0OURBMmhFOXQ5?=
 =?utf-8?B?L042ditONDV4elRRNktWaG91aU03WFpRaWNZN3A0TmNtOUljbzFVclJEU01l?=
 =?utf-8?B?clNkd251eDZHaURsSlNER1BYd2FudkUzRG15R251V29LMnZIZjY1T3FJcnZv?=
 =?utf-8?B?UkkyN21jYUIyZ0QyalN1WXRXYWJRbUREbUErTzMwV1JnbGk4UVFONjdtcFBk?=
 =?utf-8?B?eGZRZVBaemJWRVc5bkdxQkptbkRKSXlzQktmSmJyVW51VVQxbkYwS0VSejND?=
 =?utf-8?B?OUhwVlpLVGYrQjQ2L0IxTEQ0cXdRNXhSRVRtb1hJZGpFSVZPSXgzOWpPOWNa?=
 =?utf-8?B?dkh1bVFkYlFLSXBTbzNTVWxuOGpMczF6TVNLeEVacFVxVXpLK2RrN0t6VEU2?=
 =?utf-8?B?UDkxcE1uVk80TWhWb0E2VDgyUVcraXBNazc2ZHVPQU5CcU5CWllmRWNMN2Fw?=
 =?utf-8?B?R29odVY4bE5ORGRrRzdodXp6NWZHVUZHdjQ3UURaY0p3TEcwb3lZeklzek4r?=
 =?utf-8?B?NGM4bXVUTDFUdEVyUnJEKzBHMXVuSFpJWDZuNVdjZ016ZVBRSGZwU0RNSStr?=
 =?utf-8?B?MEo3bmNqNFNDRmpocWhrRGI4cUdmL2hlNFMrM0YvQi9rdHV5K1pBN2JiK2RD?=
 =?utf-8?B?bWxMUCtiUStLV0NMS01aUEJZVE1ZVlRSQkREU291aEc4SE5kZTl4MTBWV3pS?=
 =?utf-8?B?ckppd3JXWTFZZTVKdGV5anJ2ZXo0b2J5MzJoTVcxY0U5RFoyd3l4NzAzS3hy?=
 =?utf-8?B?K3hjdk1hRjNRdXVsNEd0UWw3c2FYaW5WVitmL1hMdnZGVWlla1JkejJTazNk?=
 =?utf-8?B?YVVObFJvRWRYU0w2a3d6Q0ZVSHdvWDlES1hsWmdBdVRqbWVXNVRuL3p3cEt3?=
 =?utf-8?B?NEY1OCtKVzRoaHRRc1NoVEhYYkROb1h6MHhNU0ZNYmFHQXErZzNsVXlWb0RY?=
 =?utf-8?B?R1RqK2xEaGhiZTFnYzhvQ1VqTktmTFNMVVRZVmNjQzY4a0x2amw2MUw1OXFk?=
 =?utf-8?B?U2NIK2J3R0hiOHVacVFUUGYwd2ttT0swR0x1S0dNWFgybnN0OWpWWkhPdGdS?=
 =?utf-8?B?OEozRXZIclEwd1ZWMU5NdEtpWTNBd2tQeVJXT0o3UzNReUxOaWJXRWxZNTFr?=
 =?utf-8?B?dzJDTzRacU5rUkJLZXRtWlN0bnJtS3k0WHQxajJDbld4TlNLbEdiVFIyL1dF?=
 =?utf-8?B?VmU2YmVKMHQwbmhhOFF4TFlhK1FQaG9yMGpiMStCSGtXWFNocXQyY2pJazln?=
 =?utf-8?B?Tkt5Qy9YRWxDaVN5d2ZpVDZVVXZEK042cjdzY3hxS2JTdC9HNXlSQzd0NnFM?=
 =?utf-8?B?UFJOQkttem5JR3lMSHgzUGRYRmhVODA3bDJVQ2lPRWlvR09lYzdsWjFTYW5h?=
 =?utf-8?B?ZlFLaFN3dDlxb21tQ2pFcVRUUCtHaTNJMGRVSm40dEZpaXNnZS9yTTJHWm1m?=
 =?utf-8?B?dzhJYzljanZMTU1iTTYwQnZkcXBIMlNKN1NJUHdrQm94azNJYWFJR0xUb1dU?=
 =?utf-8?B?ZG9nWmk5ZUZHU0IzYVdRai93T2xGZGVNTHZwRE5xa1NLT2VNUWNqcUZmVzEr?=
 =?utf-8?B?T1ZwS21DUUxlVDZYOUNmMTBvZU00bENranRscllreldNbG01VW5BbW9MRnc5?=
 =?utf-8?B?ZnJXc2NVMFkzOU1UanJqaHRsN0NYd2tUMnNCYkp5KzJ3Rk5ZMXpuUUt3M0dy?=
 =?utf-8?B?Um1aSWNBa2pxellsYnRtbVBjcFhnNEtGSmswTms3WGZqb09QT0lieWpxZkxz?=
 =?utf-8?B?cXNqeStKRzh6N1VicENLUFNmRXlETGZiakMzN0xrdDl3NHRlZVd1YUZ0Zmhl?=
 =?utf-8?B?RGFTMVZzZWVEZGVDZU9VcDcyQXZ6NlJHcUY0OWtLL1pjSXovR2g5Z1pIendV?=
 =?utf-8?B?M3NENXVYb3NhWGhudzIwSTJqcHIyQTF2Unc2c29HWEFVTzB4R1F5SUhCVElP?=
 =?utf-8?B?YmlOUW5HaVBGSVZDZlJGVWx6RTg1bHRGL3FXKzdPdjc0QmlPT3hXK1FUamhB?=
 =?utf-8?B?WEpXU29XVDR6UUcrN2dEcnpsamNKWjhQTHJsMHExRWt0R3ljbWpHUFZnajN2?=
 =?utf-8?Q?9sIA78D+HZElXB0yrGjQxSc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3955fc37-922d-4a92-3db7-08db403c8a9c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 18:41:37.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yfNta8Cce3TApRe40DGJ0Guk6nLmdjsstvDhroR/mlOQkIcfiM3Ns6f31hti3p5F5ehLUzTeuvE+030PO/87are/QxzgUsjKu46V3Rnqjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
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



On 4/14/2023 5:57 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Explain another potential firmware failure mode and early exit the
> long wait if hit.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h | 1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c       | 6 ++++++
>   2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> index bcb1129b36102..dabeaf4f245f3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
> @@ -44,6 +44,7 @@ enum intel_guc_load_status {
>   enum intel_bootrom_load_status {
>   	INTEL_BOOTROM_STATUS_NO_KEY_FOUND                 = 0x13,
>   	INTEL_BOOTROM_STATUS_AES_PROD_KEY_FOUND           = 0x1A,
> +	INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE       = 0x2B,
>   	INTEL_BOOTROM_STATUS_RSA_FAILED                   = 0x50,
>   	INTEL_BOOTROM_STATUS_PAVPC_FAILED                 = 0x73,
>   	INTEL_BOOTROM_STATUS_WOPCM_FAILED                 = 0x74,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 6fda3aec5c66a..0ff088a5e51a8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -129,6 +129,7 @@ static inline bool guc_load_done(struct intel_uncore *uncore, u32 *status, bool
>   	case INTEL_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>   	case INTEL_BOOTROM_STATUS_MPUMAP_INCORRECT:
>   	case INTEL_BOOTROM_STATUS_EXCEPTION:
> +	case INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>   		*success = false;
>   		return true;
>   	}
> @@ -219,6 +220,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
>   			guc_info(guc, "firmware signature verification failed\n");
>   			ret = -ENOEXEC;
>   			break;
> +
> +		case INTEL_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> +			guc_info(guc, "firmware production part check failure\n");
> +			ret = -ENOEXEC;
> +			break;
>   		}
>   
>   		switch (ukernel) {

