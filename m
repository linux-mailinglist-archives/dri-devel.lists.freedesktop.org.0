Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1545965A5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 00:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDCE10E171;
	Tue, 16 Aug 2022 22:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CB710E108;
 Tue, 16 Aug 2022 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660690232; x=1692226232;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JQxgU0NK2N+d7+h9RH13RyXZmNEbqwv2xvI/u4HTvf8=;
 b=axdT4Re+SXq+5zvjPqZXDUOBXjp6BYKCmjysC4hpLeR773fRAGXkCuHa
 952RGwTx6RjRQP2kDrokeDpilXUcWmNNBTQswn1YYUPtLYFMt+Kyw0Szt
 aLZLex7odvSdCnEjTYMjGL619tU98BBY5Prk8HdQVWL6GbYucRO1qbLEl
 +0J6a59K29SEvsAi8aqTVJXvZxU7egAKYgy9MAtKlZFTuK+xLD4f1namp
 Yn6hZQCZnYiZOo2vxz+yL2Z7X3nA6tY3wiyE9MJP6oQVXgNC4wIHM9OY9
 IT5R6ayY3yr5dMb+0KDx/YkltXmZtPn+D5gzqI2NVg0sYIYMfP67oI6Lu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="378638003"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="378638003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 15:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="783193111"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2022 15:50:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 15:50:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 15:50:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 15:50:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 15:50:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFiVFNCsqSn2wGHJ9avbfgBwHVRZ9+ZThNwLfTmGF9BwxRPI0OJcvPTajOtOZttO/167V8tyWAoS63p/a2fWcmJQrKvgKglfcabh/M9eTfp5DYIzz0g/RWzOu/Aes4Epb5Uol4xdxOvvc26fK+htXciMwHLkA1Ay/BtZ/EA08yNZC3rexdO++ilOiu4c9hBHIkQpgjEc1fGnmJsoODwmKbnau9tcX1oO9w50/pl/XaCh/IuGLDvSiRV67XLBdn1VRRInDmDSZqQcZuIXpAj+eLd2Y5Itmgli9PuFv1OprYMJjTdfWQ9FIvX/JVk6dK/htusHFWBqtLaA5rXR6OHrAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xchW3/j+W+EYCcHK3L8FIarfz7ggb7r8EQCo6+lg5zY=;
 b=gobTRuFFsUv4owIbTLQ5PBQXOAGTGsMn0+LWSRQIi8c/4nMsR5kM6ps3mpoD3LdczPHD27zLLQQOOeeBgzGthPjkDj1xfuCW2gQzBGgM2cY7b1M91yPl7/AqsAAzSXLncXLLjoCPQRpMOMM78CFtZbsQYNh5efyo291D/u5hk1IrY93o4SttmcUuVPFpYjS6Uwdp37XJG/5s7TxYEE1xgQDj7+RDDyAMtwbNtLxew9SWWQtKFJdUAZ25ni/5Vmi5/Ls80nr3ndabe6xggEgRBQDVlEbb2NwHVQm7501sMvl39ZEfFmNKXcvaE17VxK/bL+Yp7j0+1J0FKzpGZjd/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB2921.namprd11.prod.outlook.com (2603:10b6:5:70::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 16 Aug
 2022 22:50:28 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e%5]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 22:50:28 +0000
Message-ID: <4fa5b891-0f73-3cc6-44c9-e86ff3328780@intel.com>
Date: Tue, 16 Aug 2022 15:50:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/guc: skip scrub_ctbs selftest if reset is
 disabled
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220708224158.929327-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220708224158.929327-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf48f2d-c566-451f-8f68-08da7fd9b716
X-MS-TrafficTypeDiagnostic: DM6PR11MB2921:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AknZc1DBpsIikfC/y2F472/ufRf/1ilXarDYiUkRfVrRf8I5/jVjHudlsMoBR2EZqcycZBQYh7GCkOpG0raIMs4CtJ2+JDVBQyrQSMBWC393C3uVtCh/ieC65KmSY9Dj5bhTBk+84aTN4/LZb09x7tvVYZyyQF9FGB4+Mo/a00FrFkgLAFlIdfdtxsIum8iUEzMs+SDFr9iY6HQ1E6+iELWmuNM1Jeks2efuScGAoG4/Pw9N/gDwLDa8b0UP6LeHAZW8uhP/gTYp/DmYAMxHrRkNEcDVzR92aZpCkswOfvo3tdEZa61iipeqjt/Ay3BN9fRBe/8q3EZTN5t02VdfSJ91y1km0odzYPai9cQRHADpaugraCpZcEUS53b0z06B9IMVn6p1oVPBzjUs0Qhl9tWOFKlb5uhlD9m0zWetw1GkEVBfD3YmcbvGffRXsBl11oEpQZiddxva5F6S/CUVoYfrOlNv7TPHQr42/06v61YHStjwanS5DqoKo19qgUi1XdUTu5pIx/03KvoezxK55kqPbQMwcsZ4KuxAzEQrgbGsyFqUL3Z/jwFUkvDZDduXMxP4QVv7csjHTSjifL43KH5MmMaKvf7thsCtT4JGrqm9nOMzOPxUFbzuQF52MP94gSDZ3M5Nj/dZBQcPCA1Uvz2+e27rrkQnKbHmvnjrQS5YUXUasFSKwQMrVlRXcOdQXRgFZYXhRjOYR3K4jd89Sz1ukZC2bFj2n0eP6riE5t9/CgP80PrB5UiSAvlQdpQIxBFu31j63jYGlCrDYbdNcB5Ypy2fBY5jNTt4i5pN77vWBLSW6GBndav9I/G7pv8XTgoRIrQv7c1hxzNr9/w4zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(366004)(346002)(136003)(26005)(478600001)(6506007)(53546011)(6512007)(2906002)(6486002)(66556008)(41300700001)(86362001)(66476007)(8676002)(4744005)(36756003)(82960400001)(31686004)(31696002)(316002)(38100700002)(2616005)(107886003)(186003)(5660300002)(8936002)(4326008)(450100002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJobnlGZkN6OWVlS1VHdkNUaUptaitkWURlTHpqNS82QTA2V0tZL21EQ0N2?=
 =?utf-8?B?NXhWbjJXYk96bk9LN2U3UDEybWhsS3RHZjhuRWJXZ3hJYUthSXJtZ283WVBO?=
 =?utf-8?B?WENmMi90TGJQMGRWWTRRSm1TakdPa0NRWUN2ZGx3dkZ6WUdWUWFJSE5aaWpH?=
 =?utf-8?B?a2NBOGxBQ0JrR24yaTlvQUlFdzhCVTgzTDYxdC9QcE9DZ2d4UU11aE1KRDV5?=
 =?utf-8?B?UWFWK2JHQ2xYRC9Fem1XNTU0WWFmQlVHQS94cXYwQys5NnZKeDdaNkljVVUw?=
 =?utf-8?B?M2U2MGJrOUgzMTNOaUxnYnpFRUZ1YzIrWHpKS2N0SVBnTDdRMW5jeHBNRUp3?=
 =?utf-8?B?Y0l4ZDhwNkUwRHV3WTZGb1kvR3YyaHNoV2VGOFljYTd5LzRid1Z5T2JLMDkv?=
 =?utf-8?B?WURaRDFEdkF0eHlFL1g4UG9uZkI4ci9WRTREaEI1b2NkMTFWQ1cvYW12UWs3?=
 =?utf-8?B?OEtrVlNMelhRcllrcTQ4STBUS0IzdlhHR1lESTRFNjlYVVR6T09DMk5iRGZj?=
 =?utf-8?B?SnBYMkV4SjZXSDBNVWUvTS9GSkFUbnR0ajlReHA5NzZET3Yra0FlVDFCMDRl?=
 =?utf-8?B?WUxMaE03UThrQXVlMnlTQXBOb0M1MWN0UHgxZzc1ZTZKc1YzcjllOTJVZk5y?=
 =?utf-8?B?akYrYms2aHUrQ05ueWtNWDE1TDl0MlhrVDZNYVJab2x0RWNXSFQzV0VCaUlk?=
 =?utf-8?B?WFUwMjBhNXc1czZiSDNzVnVMSWdwTFR3YXhTVW1zUzdMU2hWbFJqMk10d2RV?=
 =?utf-8?B?UFpadU1VcTdQWVlYVm8rdTExa1F4WS9rbmxHalFZaEJENEdnbDNyd25WZjNI?=
 =?utf-8?B?bkFuRUVmRFB2VVk1eU9YWjlmYlRGL3N0VkZqS0psTnJ1TFhuKzUvWjhKcHFr?=
 =?utf-8?B?a0svN1hKM0Rhazk1bzI1a0pwMmZ5ZjFvMUE2UmFBMnBzT1hORTFFZWI2QzVH?=
 =?utf-8?B?Ynl3T1AvZGJja1g0YnNqVHBjWlFpcXV0WFU1bWFTbzhzWXMwUnE5elYrWE5r?=
 =?utf-8?B?cUNYWVRicERoOFJYL0RKcWFIeFFLa050cWxaUmxVN21KaEFjVmpEM3ZsMlJk?=
 =?utf-8?B?bDY5M2laSW5EdFpKVHJqd3RJSWFCWVQ2L0JBN1VybEZBSzdjaHhPaU11M0FQ?=
 =?utf-8?B?MTgwdGUxZjJvbnFDUkhjSFd1c29MQ0M2dVNVaE1NNjZSTXdKVUFqV01ldEkw?=
 =?utf-8?B?K0tjTHhQYmN0anFhWi93SnhmTDExSmg0SEw3bnh6bEVabzFXSUN0RWRvWlVX?=
 =?utf-8?B?NmJReUl1NDhTalJnNk1hM2xmdzI3Z2tSY0dIbUJxRm9tTVhTa0UzdVEzeml0?=
 =?utf-8?B?ZTZkaDcya2l6ais3Zzl1TiszYzk0Yy9BbExqVFkwS3RjOFhqQmlTbEdmeld3?=
 =?utf-8?B?SjlSNEE2TWQ0MExkOUdHWWw5Ni9tUEFmRWYwWTg4S0NySktVZEhXOHptMFdt?=
 =?utf-8?B?bitxekhxSmdBdnZpZEV3dzZkcitEQnNvY0tnQTRUWFg5M2dySHV5emJrd29G?=
 =?utf-8?B?dFhIZXdYTWYxS2h4OFZaZGhKT29KZEIvVnBNSTVwcGJFMnBDTzRETGo3VUJo?=
 =?utf-8?B?WDBVV1QxTmVYa3JheEtPMUZkdG5KRllmK0tBK2dKNVhBSnZQcGd1SlRORVRU?=
 =?utf-8?B?Y1dGS2lZczY2WjhYSlJqS3k4bEFVQkdNWkdyeTlDWnlaak5ZOG5GTmRZQlA3?=
 =?utf-8?B?NWdDTTJRMHJhZDdJSFhWWmZyRUdxUFljOVBLMWg2ajVuck0vUDUyVjdhVmh1?=
 =?utf-8?B?SitadzFMMG5uWjY1KzAwcFNHbzN5ejhCK3A0QVRyWWZXQnUwUG1YZFRxbHpR?=
 =?utf-8?B?dEdUb2ErWjMybVYzZ3JzRWNGcGZzaHdzNmRPVGcrY2s0ZVhQNDJmNjVRRVQ5?=
 =?utf-8?B?dkZQSVREVGlHalYwZzByMHRic2tteVBDdDdLT1Q2Q0xVM2h5V0hscVF6aFcw?=
 =?utf-8?B?aG5xNzZEK3dGbDI0ZWljR05OMit2aVBDYnZnTWpYVGk1TmRUMkFKdm05c1lm?=
 =?utf-8?B?dUpxNjZmN2M4WlRFcVA5WVNMQ3piY3MxMlF4K2tRUUZnWVdpZDVFOUhhVnp1?=
 =?utf-8?B?amdXZjk5aGNJdyt6L21oOFRKeTFJT3ljVHM4cml4cXkrb0poeUxMNWcrbHRH?=
 =?utf-8?B?eXNNMC9td3BNZHppZ3JYUHZsdkhoYUgwUG1XampoNGd0dm9KakVZa0JRZXJX?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf48f2d-c566-451f-8f68-08da7fd9b716
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 22:50:28.3936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90ecslGKGntNZPXYltvAuJiSUl3vzd5v2i+w5EMIpxJzYPobuhLlFynR2qz14cWS3Ka+CCdJWUXzTIgXmIOX8XeR0/QbF7tgazGP/Jq7UTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2921
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/8/2022 15:41, Daniele Ceraolo Spurio wrote:
> The test needs GT reset to trigger the scrubbing logic, so we can only
> run it when reset is enabled.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> index 1df71d0796ae..5bd804f29b32 100644
> --- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -54,6 +54,9 @@ static int intel_guc_scrub_ctbs(void *arg)
>   	struct intel_engine_cs *engine;
>   	struct intel_context *ce;
>   
> +	if (!intel_has_gpu_reset(gt))
> +		return 0;
> +
>   	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
>   	engine = intel_selftest_find_any_engine(gt);
>   

