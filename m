Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CB66698F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 04:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257AC10E858;
	Thu, 12 Jan 2023 03:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDE910E857;
 Thu, 12 Jan 2023 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673493617; x=1705029617;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g9Po1Qes7xb/4I3rfnpk1HqTSPGDcB5Dy1fHAxLCcO0=;
 b=mKiY4nJ9lkmsgbsfdnHtgY+Cy7ElXlb3YP9HOdmQW5LywOC0TTldNhWY
 P1iiu0EMyXNEah7HJZb6zffq0pX6GLkT54Lt68eKTPS6k7CKiqHR93UYw
 zi+Yp3U+DAvrl6hpj4QzPirTA+H6gjoMMxMD5XV/JarChSNOw2VA9L5Iw
 BiwYz6p04bH2MagwgUC4TuGuuXTMOeyr845dMMNhOAFZa/7vue5fy7XCD
 m3+yu7rtJNv1vPphonigWaX7vz0GehkEJDo0oI5yIyrAPP3Ce0pvuhfCs
 J/4OcWyTDCKhrjjI8EhUZXPsCSDmZ9kp14EPNNOMn/6gukHKd7QzBV87Q Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324837372"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="324837372"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 19:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986366385"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="986366385"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 19:19:57 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 19:19:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 19:19:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 19:19:56 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 19:19:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ohBsQ7VM27CtMWkmP0IrtWxYnQbKyDUqmWqX2ZMW7SOQYEcS+DS97ZS0AGnIdhuM5bz37FpwxU++x5KaOYUrrH/cQtPdFdRmMFb8/MPNOdkB+ut4mMkIhm3s9yTUs+ZqgRlHf5YXQFujMKicJPZJ/LMqPB9v/3KJcQXmqtMDXQqGzeD0tRMDOTLiAYdoFFIdD+ZMfWVMvVhBlxdsRhVERm7fbmKIADpdA0D2TGksMozRW3TjpoxYO0AaYPy8TXzUSEuZ2m8OdPhE6B4AvFY+RTJN7XmMGQBF/OnUbZ/axgWf1ZfuAUUehe6UjBktZXyRWJSdlnJgJb/boeKAeG++6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD0lMPnvG7ugmS6MCGh284gO4whxYOfBaFchAETL7YQ=;
 b=J7W2/lDdD1w6Qn3rKA3q97BS0E4JEUL43RKfkn3ehzZK32yNqUzbrpNzWKgMAhCCKSkaqnZlDqhH0ZyPeQnCRVRUJRZz05aXeIheF1RUM5HoXRopilEbbrROyHj58P3Qqe4sg2eT1nE2M42Fzfz9HAo5OcIzdjgUzqfxjSTd3J3iGoRKGPA+x2osT+T2eAxSiAVYQ75DpkC4jVlz0EH4D5cuDCXdDrcfB7r8Ys0nHiNJ5ero0pV0I8RremYGM1STjbMlTISrYy/9y8S5wayMR3POAb3Rp00s2OFTObVgFA1SY3VZCdynYuCgoPCPzfN9fdkAHX5k/9qoqkZcCZb5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 03:19:54 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f9f6:356f:eaaf:185e%6]) with mapi id 15.20.6002.013; Thu, 12 Jan 2023
 03:19:53 +0000
Message-ID: <d0be5318-f968-2b7f-fa77-9711337bc703@intel.com>
Date: Wed, 11 Jan 2023 19:19:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3 1/1] drm/i915/pxp: Use drm_dbg if arb
 session failed due to fw version
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221220221158.2390090-1-alan.previn.teres.alexis@intel.com>
 <20221221174901.2703954-1-alan.previn.teres.alexis@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20221221174901.2703954-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: cb73df6a-0ed2-48ac-3af1-08daf44bdf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSTexrfs/5vWZqnB+qAsESiIRFsFtURRwVQ0PPYgYPlOoPvUOmenupJvj3bu+aL6ecv77q1uFYQqAx8NH5zkZ49P19O2rINf0XrZTU+AwFCB/tnZ/lTtdD2gxXl0iGXEe0A+D5ptyf9QysO/tKp3AIobrnhrWssMq8AiK/sjNCDb7vJU4VW3rNuqGSlPFCmpmZG9zpFkznOxwVAQhMqoocLbeav4qhlCMV9HGw/36Nxk8Q5GR4A/zGM0VcdSip1QVfqEse19v5PoInaLpgItlgAguxySs9k9+73RqwOfqSHY9XRze5CsFjj4n7prP8sg28xNoyae/UrYQnSEqUS2VMKMMJHFpHS0QjFpClTG2YaL7gsMXZB0K42xkbkDnva0AxAq1dsxodwlGmYYadKUp+vqhD6QNpaENfyoGvjFxH+CA3qz53jLrGeDgBadzafJfbHShqAy+9srx7DoNl/1wTJI35HGx/nbr4RuXoQaXw5eiFcnshoal5kF3+Qkiar+k8RNdrvxn4q0gn7yambJXiGhdbfGua339XkLR4KvQus5Okt6Fn1hu7MQ4Norv1KcrX/Ow9sD+1HHxn8tXtvQe0RFzmvePULCek/7xzKXcJZB/rei86FBFqcSvivet2BZd5OLxqUMHZVOyqlpKIMX/IylBmY6AqkJ7rG2wPRAYLURsEI+ffVQoladvUcsRYRz6TgvMsYNGGuzVAoSbWFIu8MM5dqr8fDX385OXCzbwCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(82960400001)(31686004)(53546011)(2906002)(478600001)(6486002)(2616005)(316002)(26005)(6512007)(186003)(5660300002)(86362001)(8936002)(83380400001)(36756003)(41300700001)(31696002)(8676002)(66946007)(66556008)(66476007)(4326008)(450100002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEVpTDV3aTBoMm5aa2NWV1k3Z3dEOXhMWEFqRFMwQnNxTzlaSUtRdWhZOXA3?=
 =?utf-8?B?TUIvRnh1Y2JtcXY0a1BTNzlZY1Jsc2dJR044VmxtQUJZZUphck80c0VadXZa?=
 =?utf-8?B?TEpLWXVOVkhoVU1YRzJieDUzVUpXVG1YZXIxdnh5ajk0OTBjL3ZqTFBiaUVG?=
 =?utf-8?B?QVY1RGc5eHh2YTlqSDNYSENoSG1JN2YwbkVtU2lLYms3ejFEYTREMUVCU1R3?=
 =?utf-8?B?dlVYakxpSWRXVksyd29iQnZ1eCtFTlJ5QXVXMWtXNVpMNThra0ptckxuejJq?=
 =?utf-8?B?SEplYlhHSFUxZDFFaHgvZDBDa2wxc0ZVQ3lLVnhpakhPSG9XSWFkSWJZT01z?=
 =?utf-8?B?VU9td3J2cW1XY2dGREJvY0dUeG5MVU9JR1BGNEJUTVZMWTdicmMyWTFFRnY0?=
 =?utf-8?B?QUpRWjVCMmFOUmNBcUtmMXBBMVMxOU11NktyRlhTVDRMcVp1c2daeXFkK2g1?=
 =?utf-8?B?ckVjS2RSd3BJK0I1aE92VmIrZG5qNTBnM3FNVmpkTlA4NGJ0MHBrQzJzb283?=
 =?utf-8?B?dCtieWFhQXJiZk1Cc1BWc00wa0x1bk9vcml3QXVFZzhVZ08yeVphUFlRRXRh?=
 =?utf-8?B?bVhvSTRmbTc4VWRFZjV3YW9FMGs1OXY3bXdaU0FmbzBYeGhDanBGcTZPdWIv?=
 =?utf-8?B?R21vTHFHUVBzakQ3eVYxbkcyeU5kdG8yOGtteGN2RkdwbEJtcFNkamExbmQ5?=
 =?utf-8?B?TDQ2bjRjUzJZZytEVnozSWIyN093MGpYWFBQNFJvQ1ZtSFY5R2tUcXV0bU1r?=
 =?utf-8?B?SW5rSkxIbG1taHhZcm5HRkQ1aXFWQ2Evd1VkU0hTbEpCVTg0MXBLb28reVhP?=
 =?utf-8?B?NmpsMGRydVFHZFdQdldtOXN5TzJmMERyNHIzUFBhcHRzZnBLTXJOOERUOEVh?=
 =?utf-8?B?akRvQi9XT3N6TTdQNm9lTUlkVWxEa2huZlp3dkxmQ3NaME1kU2ZZMitIczRp?=
 =?utf-8?B?ZnRpTDNuRHV4SjMrbUxDY0xJNTdaYVl0dVBNbHR1QTdZck5LazFOMEpQL3Rw?=
 =?utf-8?B?ODZZT0tkdUpBQnd4SkppNTdQQTR3VDdELzZjZWI3eUNyTzNMYnkxUGpWUnY5?=
 =?utf-8?B?VGdqVHZRaGZFY2wrd0xldWt4Zmtmc01UQVZCSCtaTXRoZC9HMTllSmdpeEFD?=
 =?utf-8?B?TXJkMW5CQ2FCMUE3Q3BEdGwvd016eGRWTGh0bTRGRUVPMVVkVE4vOGJGZkdz?=
 =?utf-8?B?L0dzbFhmSDN1T3ZpWmlIaEpzN3djanN1Mm10VS9aNzFyMm05OFJCdWVaaURo?=
 =?utf-8?B?QWhuNkFKdFZrUng2WHJ4dWdzQUthUUdsbEcxbEk4azVCcE9uWHVQeEY5UkU5?=
 =?utf-8?B?SzNWN0tOd0lRT1d4eVZoWGFhYXBxbUpGR1BQVlJmR1BFcmtrSVZzUWZVUmFM?=
 =?utf-8?B?b1JDV083cUs0R1pQWWhsRU0rQXJ4NG5MZzExY2ppdndBcFphOEtQMVIyM2Vp?=
 =?utf-8?B?ZjVSeURXcHhDSS9nUXdQcERCMFRlN3hrNnYvUUdEQ1JNMUhGdXMyeUZrc0xl?=
 =?utf-8?B?MmRhTkhSVDZMaUxrSGR6M2dOTGErWnh6K3JuVS9xSGV5ZStnK0FFa2FiS0c0?=
 =?utf-8?B?Z21ROWM2M3c0dDhkM2x4N2RVS0ZVbG5ua0hTN0pzanlPNmJxNGFCL2syZnlR?=
 =?utf-8?B?UTI2NHBxUnVZRXVna3ZSR1lzTUcxYWRCQ2ZoRmcvaEpyRS9QNU8xTm4wYjAv?=
 =?utf-8?B?cDJ4YTliVnl1R2V2NXk3SWZxZVYvUXVxYTFTOG03SmxEWjFiUFRYZ3ZpS3kz?=
 =?utf-8?B?TUhRQ3V2Vm4yNU5HRjBDZVhqY094SE54QUQvanJPVVJXUm9ORzJYcUZ2dEFD?=
 =?utf-8?B?VlZVMWQxSVFwTTI5TVhYNy95dk4yU2xyb3JqSTNCRGt3NkN1WHorV2ZCRDF4?=
 =?utf-8?B?bHdGVHcvckdMQkU3eUpEQ2tUdVJGRjRTQmxUbmFwZXJncE96Zzk5cmZMVzVU?=
 =?utf-8?B?UUVkY0Frc3djeUkwUkllRVNlY0JVVDNHc1c3SlhGMzRWZjBJazNmcTNoVDFL?=
 =?utf-8?B?TkxDWlBYaTYrUC9STmZtOGYzQTkrTDhyZ1dNckhjMGFXb3RYbWlWNTlJNWQr?=
 =?utf-8?B?ajYyamFxOXRFNXlUU0k0dStOVElNNDR0MEYxK0JLTkNheTZYYzk5Q3czZXZO?=
 =?utf-8?B?OXhtLzh4bUM4MWZBRVZCOFlCWjk2N3RjNUIxSFp2K3ZhSVZhUFlzbUlXMUFL?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb73df6a-0ed2-48ac-3af1-08daf44bdf95
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 03:19:53.9045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDc0Q9YhEummzAN0GQUvfDNJjzdhpNlzCWmEx0pjIbTthRSj27IRcbgaxS/N0qhP0v4h4LFfUbOEBqKU7pJWuiDFI0m9XxfJke7BUCJ1kyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
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


On 12/21/2022 9:49 AM, Alan Previn wrote:
> If PXP arb-session is being attempted on older hardware SKUs or
> on hardware with older, unsupported, firmware versions, then don't
> report the failure with a drm_error. Instead, look specifically for
> the API-version error reply and drm_dbg that reply. In this case, the
> user-space will eventually get a -ENODEV for the protected context
> creation which is the correct behavior and we don't create unnecessary
> drm_error's in our dmesg (for what is unsupported platforms).

LGTM. Is there a link to where these pxp status codes are documented?

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Changes from prio revs:
>     v2 : - remove unnecessary newline. (Jani)
>     v1 : - print incorrect version from input packet, not output.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h | 1 +
>   drivers/gpu/drm/i915/pxp/intel_pxp_tee.c               | 4 ++++
>   2 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> index c2f23394f9b8..aaa8187a0afb 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> @@ -17,6 +17,7 @@
>    */
>   enum pxp_status {
>   	PXP_STATUS_SUCCESS = 0x0,
> +	PXP_STATUS_ERROR_API_VERSION = 0x1002,
>   	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>   };
>   
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index d50354bfb993..73aa8015f828 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -298,6 +298,10 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>   
>   	if (ret)
>   		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
> +	else if (msg_out.header.status == PXP_STATUS_ERROR_API_VERSION)
> +		drm_dbg(&i915->drm, "PXP firmware version unsupported, requested: "
> +			"CMD-ID-[0x%08x] on API-Ver-[0x%08x]\n",
> +			msg_in.header.command_id, msg_in.header.api_version);
>   	else if (msg_out.header.status != 0x0)
>   		drm_warn(&i915->drm, "PXP firmware failed arb session init request ret=[0x%08x]\n",
>   			 msg_out.header.status);
>
> base-commit: cc44a1e87ea6b788868878295119398966f98a81
