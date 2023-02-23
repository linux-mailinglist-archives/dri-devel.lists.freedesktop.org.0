Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA076A13F8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 00:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0133B10E189;
	Thu, 23 Feb 2023 23:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF57510E299;
 Thu, 23 Feb 2023 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677196222; x=1708732222;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YVqzshCOHXaxSPY2UJdwdBAAmm5UP4GAIfv3TZBrTSM=;
 b=hx/Abfg45ep5vqaBlY9o6WDmjvpovGCVYJnQfFjDhOkE9mGgZG+CHbBy
 Z7KqEORFgiURj8BxySbK0q/N67YGN9vlnOqNs5qRe+W/XrumtkeIn0POi
 nynnML932rmFp8LDqNZ8zOtBrKBjEvCNu2NX/Re0eq0JCzOFUVqLKFVY3
 brI2i8hja1mL61TNWLSSBGvOUtvtbyxBq86Sfu7A6DBBUKxRiB/BV+pbP
 FdJntttP0y5/rS8SwvpTiM7tLVlvtGcyuAg1MsIVhMRMS256ZJszY3LvP
 eWKlaEbkZ5XzUlRdZ3zpzrP31dzt5edDcfPULVoCuuWQCgRle5jTm4if4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335586192"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="335586192"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 15:49:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674719291"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="674719291"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2023 15:49:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 23 Feb 2023 15:49:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 23 Feb 2023 15:49:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 23 Feb 2023 15:49:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZhOtl5XUcGOMEMbVnalW7ziDydjnprhfLUNUlNOPi2otIP3KyUFA0JGQET8GFFQUXRMIUZ0P5dJrEIx+crdcmovMjniG5zQr2XIBRQNfyCk1/TPqvlXpN3jC6E0sdVtuvZEzyV2HPLRg35PlcbLUKXAKOcJgmWIMdrtQUco7OLQBsI2b+xBEEOxSPKNVrMVhlJSLrqu8cEx3hVGshUoYcQA2qdstyoUQ5GyoUq+MpApG/1e51vJg2iTuYFbyqu3sJa5Nrt5G7mpcIEE/+qoaY17ssfcsxUbQcHbZozWvcfJvfyx0qI7lRqWP4tPrW/KDegbCUtGqWHXpmm8noVDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d86ky4ddk8XatLIYBSHoGrMwjZ7jFKzpckakKoXCnE=;
 b=KRPAkDkJDmXrEBkQsmcC93KUKnaW/Ta6Q7D33zs4n52R0gvNIHyKUvLgfv7vRzH6WlKKBUJDFFxtp2NEULT0XSndrejmCubNlAmYIHn27fWDaX2C/qyzagnf6o1dGN/AD4mM5gKqHZ12IE8+rZ6lcqd2ZIeNtcj/jQkL8qMdWNe4bHZlgIeuvp1t/taf+mWDxIPh4uSW6xSSUvPw4sz5LRrohIXMluURbzjbg5CVOUXM/vsZCvQ0n3YyXq4sjpGwVd6EF3Re6RauaEeg6gte6vUpXy/nc19bLhE8rJxwRIcj9qHhBR0170ZUuay/3SmlNMPZAXf8X8X0htaRUE0hwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 23:49:17 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::218f:c449:80c8:7ad9%5]) with mapi id 15.20.6134.023; Thu, 23 Feb 2023
 23:49:16 +0000
Message-ID: <f15e26d3-fde2-acba-fb2f-2363e8c66d1c@intel.com>
Date: Thu, 23 Feb 2023 15:49:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/i915/gsc: Fix the Driver-FLR completion
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230222210120.407780-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f47533e-5caa-4e21-2251-08db15f892ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sN9wkjxeos0dt/h4zoYiUg3xRM7xC+NXWEVcEZJn8Reji9IIgdVYioxURIdodBmZ5K2uJ8el6AvOit+zQ5W5VJQR/OJKqvaimTm7ABeNiIefB3VNTIRmHIlAiEWsX1yeDsZR2KKIarFcbqOdq0PIGC8XeGYu7lJ616H8DcvnN2wrULYMnQITgX5kctkHyZqeTepsGpAK27CuwVgmD9O5veo9qmIMmrsI6NywIYkMPj8ii/DNBBoa5QhCPlC1i6WjEmOi1gRQcjH3pzP0p9zjmKCCpTHvi+zWWRHtnzp7pMP9hkDqWePaENAL57THC45s03MA40jpONopuczhWiCoG9CSkXClOMmCgwrMoksgiQYFrQp8zCUbfcQ17gT7qFMdQnvyvALriXBkRKX3Xj+gIoGISiLElaUKh7OPVNDNEfOxGJR8nIiEfvr4EalBbYg1VBZeCnvrYqHXMySGgrlKKkmLXp8beXm3NkKaW+OA8kAb5cxegATAk6W6/Cvb7fOJmV9cPnM5jYkGd4xwvtbmDinPG1P4EWDzmf8WzhL19Mlt0dBHv+3TVAyHxrejFXdC8Qho/5cmmwA9sJC2MqV0vupGOcVICQKviqmM5Rkfp+qrpsvzKs2qbl4s+X3wbAkc7Ckrc9YK0EIOPG3LBlvkqkXankFaCFigolr+1lOi4c5+jxeyp5gfoatTXxcVsT6lDfQ12HQ8rOjz1CyYOkFl4HKtRPPm7ejhN07i3+HG0p4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199018)(478600001)(26005)(186003)(6512007)(66476007)(53546011)(2616005)(6486002)(66946007)(316002)(83380400001)(54906003)(8676002)(4326008)(31686004)(6666004)(6506007)(82960400001)(66556008)(41300700001)(5660300002)(38100700002)(2906002)(8936002)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hBd0ZlWGNxaUFvTE1qMElrOERnRzRFcnRHY3NrWGh4QVRyWmxSTVN4ZU1I?=
 =?utf-8?B?Z0JtZ3lWQkxzbW83NHNGUnB2R2dNS25FeURYeWpkU2huQUtuNDI3dEhRVUlO?=
 =?utf-8?B?ODE4SWJyQm9Mb0htVWg2dU5PVW9iZlNzZEQ1RTFwaUNNd2dwWjF2UUVOeFZF?=
 =?utf-8?B?YlNRZ1NKaEw1K1dEREMybEIzeHRzb0hJVzA3TXVlelFQckIvUWpCRTVRSkF3?=
 =?utf-8?B?U1lESVJRWXphK251SlZTUWMwa0ZNZDgrMThMS0VaTWUzcTd0RHZlMUIwdVNI?=
 =?utf-8?B?Z0thUlN2aTR4b3U1Yi9Ja3BHbi9XcUUvazE0b1dEejRkNzAyT1IwQzJVdFlE?=
 =?utf-8?B?M1kvVjYvVFRnK1g0MFVCdEVTRUlMakVkcWd3QmNraWZrTDdONFlISkNWU2lM?=
 =?utf-8?B?cUNabG1ESWJRZzhLZllRUjA3N1MzMWV3bXpwa1ppNFFIaUVUazNFa1ZKRWpQ?=
 =?utf-8?B?TXRQbkdLK2xRUlFSYW5pWFgxSDVFY3J0MUFXK0dGdG15bUNDME5Dc3l2enRH?=
 =?utf-8?B?OTF0Sm5hU2liK094aEFBbTFpR3BxbzFFL0g5cjhMOFJiTTFhL1ZPSGE4a093?=
 =?utf-8?B?S0hJaEpvWEFsYjRxMHQ5NTRrK3NPOGU1YnA3MU1nbTB0eWUxV20wL2tYeXht?=
 =?utf-8?B?UllUMklxQVF2MWtqQjNPVWIwMjVlQ01XTDI0N3Foc0loRG9FblJKeGlZdnRK?=
 =?utf-8?B?YWtvU21kZ0tFczBoYnh6TkxYeHp4eWdObldkUm5UWEkwNk5IQWtiVGJEdlcv?=
 =?utf-8?B?QjNqOWY1d2tob1ZYY3h2ZTdYVnRPbDZ2NXU2Y1RUVTBicS9IajU0SGdIYnRJ?=
 =?utf-8?B?SUlxQXIwNXp5V0RkTUx6R1dWcGtOTEdwMTdJdFhjU3MrbWhPZi9lOC91cFVt?=
 =?utf-8?B?cXBBaG9XVlpCbXBKV09HRVZVYnZQWG1NdW51ckZnUnhzSDZIU2dpeWlEZFMw?=
 =?utf-8?B?em5BVm9kaU9vRnRIcmNWL3ZFUHdkdEJkV3BhWWtTSUthQnRTWU9DSUF3dkVa?=
 =?utf-8?B?QUdEa2ZhcENwSC94WkY4ZnRVZ1psMGF2UkR0cjR3dkRHbTdzdE9nYTU0bFZD?=
 =?utf-8?B?dXo3N1JucVYxbHhPZWVjS1hKZjZsdm9odlRycXFBcktYeEhacEMyMHFhaStE?=
 =?utf-8?B?SXpDYXplUU1nLzhZZEFkLy93QnliWE91Z0R6YWxFQTdDbHhyQUg1ejhoQTRa?=
 =?utf-8?B?Z0hleVQ2bFBENWtla2FyR04zL3U5NTh0MHNSOWVoL01MZ0o5RnovZnFEa3hE?=
 =?utf-8?B?V2w4dlF5bEhLb1l3UlNzUjRWM2FibVFZUXVtQlBkOWhjYVJ6bWY4Z05JM2t3?=
 =?utf-8?B?clFzc21sTGs1UlRpbDF4d25ISmQycDNkajJQMElmVWpzOFdwdENUTTM2K0Np?=
 =?utf-8?B?QjJINmVXa3N4cGpqZk1USHF1YTFuM05VYStlUm5HSUtDdkJMR0psMzRYek0w?=
 =?utf-8?B?ZXBITkFQcWFGTTZEd2hWY2VZUkU0S25KbWpzWTNiaURQbkdtVU51UUJCRXpH?=
 =?utf-8?B?Z3BWSFU4OE04c0Z2UjFVdE1TKzZiTUgxcFAxclkrVitPVVVsYXJyZVRaTkZu?=
 =?utf-8?B?cHBIY0FXOXNIYVdXTXBNYU43TkFQei8vNEZ6QkMvbGE1cG1mQk50QmZ0empk?=
 =?utf-8?B?WWpuR2o2NmFQdXFGekFON2Q0dGlydDNQbFNoZkJrcnBaNFVtK2N5ZE0yR1cv?=
 =?utf-8?B?eGczN2MrK0JlS1owL1NiMUVNWUNaUDhCa3FRQ3o3dWZHQ1psbXdJQnBEMEJx?=
 =?utf-8?B?TENuSHBLWmsyMmRQSlJoMVo3VFVEMUtFamthUG1WZUE0bUNHbjBmWmVSNWxo?=
 =?utf-8?B?ejJUQ1lJKzFNK1F4Uzd5T0VHajlRdTV5dDB3VXBmQWRGSGg0Q3NjVEpoSGVx?=
 =?utf-8?B?RmxPTkQwdXRiU2JMVU5lSWExVXRPVDN3b25rMW13M1VwdVhsL1prK2d5SDV4?=
 =?utf-8?B?aHN0TU5sUzJwMnJtenZwdHV1WDVUTkdENzF2L0JuNStXMlBucUtiS3dxVEhq?=
 =?utf-8?B?RURaUGRyRW9qTW5lOExaWmdRbVQ1ZXd4d3RCcVpLK0JpNnhEdzRid0MwM2ZF?=
 =?utf-8?B?R3F0cmt6Y0d4ZlltcGkyMTg4S3BvQ0xzNncrSlFZN2NBV3ZDZDArdkdXeDM0?=
 =?utf-8?B?Vk1XOVhuL1lrNFlvSHErSkVwbitkZU5hYklVN1dyS2NZU1dWNUZYS3lrejdW?=
 =?utf-8?Q?hz3+NdV/ZgB10JeIF2aTEzw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f47533e-5caa-4e21-2251-08db15f892ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 23:49:16.7198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tobCClmiplEw7vojcEaUDhq1eIJ7RZjwWCcW7oNs6kXTpDCAcV+YAXiNIJ2+Sdr9TaPywD2C9dzPRcY98hhBW47qwWY55tHO+bX+bdZUkng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
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
Cc: Anshuman <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/22/2023 1:01 PM, Alan Previn wrote:
> The Driver-FLR flow may inadvertently exit early before the full
> completion of the re-init of the internal HW state if we only poll
> GU_DEBUG Bit31 (polling for it to toggle from 0 -> 1). Instead
> we need a two-step completion wait-for-completion flow that also
> involves GU_CNTL. See the patch and new code comments for detail.
> This is new direction from HW architecture folks.
>
>     v2: - Add error message for the teardown timeout (Anshuman)
>         - Don't duplicate code in comments (Jani)
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Fixes: 5a44fcd73498 ("drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded")

I'm not sure if we need a fixes tag, given that this is MTL specific 
code and that's still under force probe.

> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index f018da7ebaac..f3c46352db89 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2749,14 +2749,25 @@ static void driver_initiated_flr(struct intel_uncore *uncore)
>   	/* Trigger the actual Driver-FLR */
>   	intel_uncore_rmw_fw(uncore, GU_CNTL, 0, DRIVERFLR);
>   
> +	/* Wait for hardware teardown to complete */
> +	ret = intel_wait_for_register_fw(uncore, GU_CNTL,
> +					 DRIVERFLR_STATUS, 0,

shouldn't this bit be DRIVERFLR instead of DRIVERFLR_STATUS ? I know 
they're both BIT(31), but DRIVERFLR_STATUS is the definition for the 
GU_DEBUG bit, while this wait is on GU_CNTL.

> +					 flr_timeout_ms);
> +	if (ret) {
> +		drm_err(&i915->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
> +		return;
> +	}
> +
> +	/* Wait for hardware/firmware re-init to complete */
>   	ret = intel_wait_for_register_fw(uncore, GU_DEBUG,
>   					 DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>   					 flr_timeout_ms);

I was wondering if we could reduce the timing here to avoid 2 waits of 3 
seconds, as the 3 seconds should be for the full process. However, the 
specs don't say how much each step can take, so I agree that to be safe 
is better to have both timeouts at 3 seconds. If the FLR fails the HW is 
toast anyway, so waiting a few seconds more to detect it on driver 
unload is not going to have additional consequences that we wouldn't 
already have.

With the bit in the wait above fixed:
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   	if (ret) {
> -		drm_err(&i915->drm, "wait for Driver-FLR completion failed! %d\n", ret);
> +		drm_err(&i915->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
>   		return;
>   	}
>   
> +	/* Clear sticky completion status */
>   	intel_uncore_write_fw(uncore, GU_DEBUG, DRIVERFLR_STATUS);
>   }
>   

