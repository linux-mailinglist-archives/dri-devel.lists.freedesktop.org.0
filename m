Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13142E13F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2896EC0A;
	Thu, 14 Oct 2021 18:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3C06EB38;
 Thu, 14 Oct 2021 18:29:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227658151"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="227658151"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 11:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="461295433"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga002.jf.intel.com with ESMTP; 14 Oct 2021 11:29:09 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 11:29:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 11:29:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 11:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sh/nAMoacQzhTZyS95SIO9txgA+DM5lFoyydglLSVK9J8fvtcc7q8czpAGROvAaJLwHtvP+csDoAl0o8lDOwAH2sxAKO9fmU3PQrSNRWvTn2sMlhFU/Yj8Q1dBXvTgz6L/KxoRnV3HtTqHdx+V03IiQ+RPmK/dRT6dxBHBsWyk25xyqdem0kJlgzhzRpjt8HASFPWJKwFSe06voSlr4Qc9rfbOp5zCYyvqdcBA6sZCLhwqUtiXsmoWR5P87hckITE80okYSyDaq+sjRKoUyT7b4fu228Gwst6H7PIauMq2AHWU4Im1A7NpIBviDLFfOEulU2SsrCrv4HrauMKnoM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVYtl+UvoyNowGnA7qNgn7WL8CcIAiV6SXh64Bf/Tdw=;
 b=AQNUG0YisIspcR2LQuXOqeq59PpH2kLRmqOlwY+W6D6xYhAMfHx7gnmODLwUwDvUSAUvoAduATscij26oUKAFsL/En4VDkroUTHbIV9orkFpAkMpNYEgHfF+HMoeXZ75fP98va+OQoCvPq45+A1BS0Zt5o0Vn/iYcy2hrMMs17o9CNgrV1DKFnB/IeAQR3yWWjnlJMADSVpFTYaS7aUzASZDYnsWV+ckvRXejlaiMnMcyLxlNRSKH0mu14CdzZTQca0QKrN5OPwvVZXCsrHFGfrsvzlqA4olb8c8NE7ZJRcyD1Ni9OjSd6r8GvDUFl3tVq78HM9k3Hzms7GczGeznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVYtl+UvoyNowGnA7qNgn7WL8CcIAiV6SXh64Bf/Tdw=;
 b=ToORRgNlCQiOCerlK/NDJSdJ2cAEuVu+YfVE3Htrc5rqpI0JTLALQqprTdXmtJrRhPsm+92QA5fIrAwyNsSBgXpBu9wg2FaJF91Z3DobJuwcvl6MIvevGyKVPyvppBPDA1FkS6VmQHsETHs+TsyPn11oxwljXhNyv46E0RxUKVo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 14 Oct
 2021 18:29:06 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 18:29:06 +0000
Subject: Re: [PATCH 24/25] drm/i915: Enable multi-bb execbuf
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211014172005.27155-1-matthew.brost@intel.com>
 <20211014172005.27155-25-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a1d2f987-e9cd-f931-5e48-ac150133821f@intel.com>
Date: Thu, 14 Oct 2021 11:29:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211014172005.27155-25-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR21CA0064.namprd21.prod.outlook.com
 (2603:10b6:300:db::26) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR21CA0064.namprd21.prod.outlook.com (2603:10b6:300:db::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.3 via Frontend Transport; Thu, 14 Oct 2021 18:29:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc956db-ae8a-4190-8008-08d98f408178
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5644DB4AAF51D50009337F21BDB89@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TcjjlwDvyUilTczOzfAWa0TQL2f+FfiPMLxHg/02ye5nrbIHC9lnHZjoEokQyg0Wnkdft0Y+Mwj4DCC7aFR83T5eXlVJdXGWSccXJuhNwMKLVbZ3pAeM34f8+G0YfSOtkc+wqvBlvNbwCbfCqQLGkOqJKfHhosk9sDqSmFjEkHOAR5BGFfJ09KrBYCUYrf0uWeeRXD8V1tPdGCDu5hZCObSwEHRd3F2z40R3NzBDC8z+fzpzqN1xPKeLHQiVj4NEqoQ0YlNmw0+QeZk7tgyPVwuhxuHvglIGd/v67Ed8gp66dSkshMaVj70J2b+rUMp2Hbf+rqFVKYYHBt4JFDYb/p2yiHOnePEZBT3Gd5ad3bHk+y3MtwlEzZR62nSOzpFko1JAO/7cPW0yoPxPfKL1qjUYX9wlZX+frRqc6At3zDC9mr3QCHNQUd9HE8R2eZpPJVuDgvgUf/ZsPrWAg3SXNqV0Osjq1iCYscTC5nWHYhlZvlbWftcMPEE/TCl+MwGSA/uwkyxk0OAfLTpsLzQfxQDImt4QDVctqVbZ+oUHve2PeDD3j5Y3eFdznJokZb1jjmyPEw95xlqzb+ddw4WozdWN4xdwixg0hx86HzfmCstxNHTogNkzlOUSI6cw4YUrJ6mB2a7LHm8ddZCh1BkpVn2xiPyrDat6fEq+vHf3R05VyuFAFNusjXc2febZEQS7QGbMU3k+cMb+guMEV1blfh1aGTr2yVjy15n2W5+p5IZ1/9QPW3+raAnlXiyYVGv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(31696002)(8676002)(186003)(82960400001)(5660300002)(66476007)(38100700002)(8936002)(956004)(4744005)(16576012)(83380400001)(53546011)(450100002)(6486002)(66556008)(316002)(66946007)(36756003)(2906002)(31686004)(508600001)(2616005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0dLRCtzckhWQW1wejJBOVh4d1VXUk95T1R0ZWNTdS8zRE1NOXEwN0xzZk94?=
 =?utf-8?B?WDYxUnllV3VDN1JsUjd6bStPeGtubkQzWUprSjBIN0VuREwyTG9ITm9IT3ZT?=
 =?utf-8?B?RWFhc24yRytpNGJCU1R3L2g5MVd6VnphdnhDbUk0bm84ZjZFMFFwWjlrMmRL?=
 =?utf-8?B?ejhodHlZVTJ3Qm9UMHFIWUM3bVUxcmVpclczaS9aYTVqWDg5UnBqR05abGV2?=
 =?utf-8?B?c21HSHZJTzY3d20venN3Z3JYYnp0d1pYbmREREIwWTRLRnRtTG9wMkI0b2tu?=
 =?utf-8?B?U055Sy9ZNmlGcGxjOTVQMTk5UEJJOFJTZkRuVEZjNUVPYkdpbnR5NUwzNlVv?=
 =?utf-8?B?OHl2WUltQVcvUkdYUG1nR0dsUHZhSjliR1NZMUEycE10eGdlbnN2YnBRSkVV?=
 =?utf-8?B?L2ZCZ2gwQjM1WnVzbzg2SmNCZngvQ3FzMnlyT0NTMnk0K3pKNnExYzhYa25y?=
 =?utf-8?B?d053UXl4MkdZRG9ZRU9kMlhMRWFBZVI3b3kxNGphOXRJd2JlSlJML0tlbnVC?=
 =?utf-8?B?QTFFWC92emd5RlRvQU5UZnFxZHhuOGQ3bkdSazNaSmE3b3ZZdkR2SWpsKzZP?=
 =?utf-8?B?TDJ1dTVxeFdlRzZidXhia29DZTJvUlJkUkt1UTExV1czR256VFdXVzg4VnVu?=
 =?utf-8?B?b3lvbWxmbTJoTGtkUE00ck5UM3RvM3BiZ0d3K3NXc0hMZ2t2QW9vR0dja0Jh?=
 =?utf-8?B?TW1rMCtBQTZSZmdQaFZ4SCt1VjBjanlQUk43djBodHU3Lzd1WSs4cTVSRnJM?=
 =?utf-8?B?UEFnWGFuN21jT3VQcXNxRDZBMWx0N1hpaHlHejZ5N09WbXhCcGFvS0F3M1Fj?=
 =?utf-8?B?YzlPMlRLSEI5Zy93N2F4Y0dQWUZUS0EzN3dGUGFzVWk2TkgyTFRSYThGMDBL?=
 =?utf-8?B?cnpTTjNxdlFQa1BxajVKUEI3WlVFUU1qVXl2bUZUZjZGWVRTdjJjU2QxUmpY?=
 =?utf-8?B?Vi90SVNWV1dZeS9BSFRoeXhobHZZTUt5U1cxdFhtNmo0WGJIVm1lUWJyUUJh?=
 =?utf-8?B?OVRyTGEzdWQxaE5wa21TdnFMc3NhZXNIekIzM0drVW01UXk0OUR4aHpUNVdO?=
 =?utf-8?B?Z3FYUkw4cmdsVW1RaGhoc0hwZlRBeWx5MzFnTVZZVlVpcUNtTUFibS9wTmd3?=
 =?utf-8?B?N3dFcmdSVWRHUHdHbjRlaEt0azlWTU9URm9YZXljT1dVSHo4dUtzUXQ0NStL?=
 =?utf-8?B?STRRaDVQSldCRjZLMmxaMWI1Q0tXYVRudjdkVVQ0NXZDWGdxcTh6Q0RoYVJo?=
 =?utf-8?B?QXVGdlVrRW1ZZEZNbUx6QkdzOUcyMVdFd3pnSnMvN3dRYXR0TzZmZll6VzZO?=
 =?utf-8?B?bHhyOHIyZ0hTakhmU2ZlbDFheW53MW9UUE5qWUJRTFhpWlU5WmlWOExCcFY1?=
 =?utf-8?B?b3A0ZnlrSGgvUno4YklwVU12Rm9BWG1DUHlrQnFCMWJCWFJ5S3A0ZnZzUkZ4?=
 =?utf-8?B?M0I2TkNpY0VxS3B1TlVhdlo2c1k3OG1zcFNSbkg4YXpjM015enRVYzJOVlhS?=
 =?utf-8?B?eEx3aFFKU2UrRHh6bXRVQkxpRDhHdldTNHBRK1RrTmp4OXplRWxwT21WVjZR?=
 =?utf-8?B?VmNjeTk3elNVdWY1UDJZdnd4QlRYZ0RsMDVNL3FLYXpkNG1TVm5JZjczdkI3?=
 =?utf-8?B?UjNuQ3FJQWpZVEFGY0JTTFZrWUtXT2NsZWRLeDdBTnFDTDlPMy9xVEFSMEIz?=
 =?utf-8?B?ZThBZEFiYk5oNFNVUHh4Nm9IZGl0WkcyNXd3SERLcG15b2R1Mk9WTVY1YnFp?=
 =?utf-8?Q?FzdLvDjl+dT3V2Lz7RmxXZJeKAWiXSAbYSWxOtd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc956db-ae8a-4190-8008-08d98f408178
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 18:29:06.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ck2798umTCTZcDwejNcs3SGFUp3YhuEn3/w0EqfrzhMjb54X6HpkJaO21cwLUfnEuehCDeccqNQUpSJYIDv9WvtaSwLHgXA8+Xhv6XRhGQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/14/2021 10:20, Matthew Brost wrote:
> Enable multi-bb execbuf by enabling the set_parallel extension.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 9a00f11fef46..fb33d0322960 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -570,9 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>   	struct intel_engine_cs **siblings = NULL;
>   	intel_engine_mask_t prev_mask;
>   
> -	/* Disabling for now */
> -	return -ENODEV;
> -
>   	/* FIXME: This is NIY for execlists */
>   	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
>   		return -ENODEV;

