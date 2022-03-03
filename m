Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301BC4CC96E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0910E3BC;
	Thu,  3 Mar 2022 22:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9198810E3AA;
 Thu,  3 Mar 2022 22:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646347761; x=1677883761;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B8+BLd39ERpJkk8yRloFC8LbzM1BeU+hAxXItgMaRfw=;
 b=g8WsK0r9sdwJp8TnXKWgq/ruyY4ZwcM8ctzfbjY9kccHYGpCqoFBhIIK
 uSl2wAy/QZushH6grRgwh8C9rl23x7ErwBwXJMJ+GQhSYGJ7Gd8I28bn9
 JZMzErlSKsesxpQCbUxgZ0lFB4pom70PDASrDZyMDIrc2LNqrUrGovV6a
 XZLYVtpHE2wesK/soqJyYbbhqg36bqRLNVndzwJv5CDnCX4YuDN1vh6ir
 JYCoAlVM5z9313jNvX7DRXWe6F30Y2qSjKNsiKTCv2dm2f5lF6vLDQs6K
 6URoCqb72W/UP0cZfDfK1NJ7UZQBKAmwDowhjf9zi7xwgP9hBl8L0Rr9/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="278524295"
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="278524295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 14:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,153,1643702400"; d="scan'208";a="642300474"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 03 Mar 2022 14:49:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 14:49:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 14:49:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 14:49:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aROlQZwTxTQzMKtOWLA+LB+cVIzdfuPAIB5DmQdTR5dQACv6kZzeCSes18DyohSJ7aMIveweEbJ8X/XREjSfJ+0Nxa2SywYRq1UQtKJ7EtFs02Bzp5aMs2VXaCboKQixqPri6Y1qijF1U+4uVS6NNuW2D61c2YyRnHAOfmU8orFJcf+eyrqyT9Qob580qS9DdvfcsAgRwQEVRadrz2INQBCA8g1Yr7n9uOJ7sv75c5KoaJzguFa09+Z4yaReiSrSUcNHCSA0ID7AIufNrtP2hbbamzsUlAWwA1S3epmxwY78jYAgyFNUOngIKxuNIFKo0afMY3SQVV330/l9DId+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUMkFTiHAxEdfEGdqpZJrb/EyBQTALFB/0LkvNj4Ue4=;
 b=RAT5E0GbIuTCED5g3H+DHVUnZZnkP6dsuSwnZmHEUdNS4xZXyLQ6VZtvHcdOMAZ7pWCaYIw/WZUaG1DsrYQF00ScPRdugaI2+/KAE4HqFynGZIxvq54yLesYhx5WDVP+X2iPQblypLtDdSI2Ekpf+/iiXkWLqQp5rGoMiLS+g1k8/QjA9gOhpqac3wM18fE30bwYc5StjiHMTaAXcqCQ3XUSDnJvUZVUbwv2BKaQoBjbaS1WxLTmEHv6IjzAMmoh6dMSIEe834uzFAjviX0+eypolwXfLdo/oR6X7JBhjIQsaLrEddcYvzN6zEIMUdYc4V0vp73pSwfe75N6THBQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Thu, 3 Mar
 2022 22:49:16 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 22:49:15 +0000
Message-ID: <ca14d77e-1b27-2a8a-90f0-b0f2b5ec393c@intel.com>
Date: Thu, 3 Mar 2022 14:49:13 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Add RCS mask to GuC ADS params
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220303223435.2793124-1-matthew.d.roper@intel.com>
 <20220303223435.2793124-2-matthew.d.roper@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220303223435.2793124-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:104:4::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dae40c5f-2f1d-43e8-5fef-08d9fd680b35
X-MS-TrafficTypeDiagnostic: DM6PR11MB4316:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB43162385737A3EC764CFFE9BBD049@DM6PR11MB4316.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cq+Fu5rfdtFVHXQpmHwop0eLgzBQvWlAGX+9oGcYfD0pSq9XeEh/cFgkgmSHe17F9Wb/wItl3fBBynhu7gR5PBMn0bJAtOIlYZ9Ly7WPH1hznDy00rWPJU0aA/wqGOQWTqV5jV/Vzcaxuo9iJkdZfpDXRkqPNZZmfvLpTg0Z4fM+q8g9RzubxdwbBtCpEYLHUvoYCKAEtBdNweWEUqRY/uBMdTuroRnau19m+FvYULhzYI7Pxe33VN0Kx28Wmw8V8QZKHcpDnWx1tIGcWWGC1ctBJizafcn/XbPyOMc95w2C8BZQSbp5rH+yzUWuKX+exsn0ZxIcBOfUUTCY39e/3asifD5eFnnu6cSw8En3bMfWeMAzxkKdt6v0Dn/Ubs4jnIGbZ0NMkrb2Xz4FzduIZYkWmkwD9jpI0g8poGDBoh5UO9ELKxKWSm8vIUxFYxz0i5Anq5sFPEaDRsU4LEfYQXzCxwBfLYdGr9geV8zLw9AR0PvnaAWPIX1fnbnF4+b9ewP7dr4iHFt4GDdqJJ9p4HRpuIvaRHEQ0sghcsFXiW4Bv+JLh6u3fYkvDaAhWnEhXwSyOwIMRIJAT5ZwaK9ea9dA4gU5PBRsBN1EGT8CssknCB+gTE0fB197gZuym3I6ttHAQifp+iTZ7nLUS9H3b0yrzuEMgDp4WK48FbAUrvePkrk2TK08/XtsNd09KMxuvu6qHpII7mDmTY5lXkGZe3eHfme5YHaiXHrkCKy4WC8l5oscR1ekk5qWhSBjkZ/3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(2616005)(31686004)(6506007)(86362001)(8936002)(316002)(66946007)(66556008)(66476007)(450100002)(8676002)(53546011)(31696002)(2906002)(186003)(26005)(38100700002)(36756003)(82960400001)(6486002)(83380400001)(508600001)(6512007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUljcmNpZ3JqbkgvSURTRmx4cnNFZUhwVElJWlAyaXl1UStvMERyQzhXOVYy?=
 =?utf-8?B?WUNUaTRCZ09GekVlNyt0TDNBYW5QOUZHQkZWcU12aGd0dmtVZnBLUEtQR2di?=
 =?utf-8?B?WURPdnU3RHhWYnNGQVVUMjc2ZEg5c0lKNS80THQ3T2ZoeklRc1NidWpPUG1M?=
 =?utf-8?B?bnkzemlKSW5TYTdKNTRKMy95MVBlcFFTbnpOek9reEM2NHhRc0dPY0crUGNE?=
 =?utf-8?B?SDMrV1V0R0Uzejd3WTJocjFqQUZ2N0lxalRvOHA0cGJMS09wTkhZWE9aRE8y?=
 =?utf-8?B?Y3ZLc240dnl0WEF1TlJLQUJtYjljWGZ1bDZRZG91Ykl1MTMzdk9ZZkdNMUNI?=
 =?utf-8?B?N2pxOGZRb0FjcG9QZWhRb2JGckxpZHkrNFFxNVlkamNsWUZZYzZSU1FIUmxa?=
 =?utf-8?B?dVpqUk9hR3RYVnVRVzJ3WEJwWUEwMk9NdXRUNXJaVW00aVZucjBkOXBSTW9Y?=
 =?utf-8?B?T3AwVDdDZnVsZ3hPQW9PR2NzNDE0TzFLVndsWDFTandublF1MUtmc0xXaGY2?=
 =?utf-8?B?cGtvbVcyd1FJMFJHSzFMZ2RYbTQ2V0dzNGpFZ2ZqTVVUMGVHQzZFK1o2bmRS?=
 =?utf-8?B?aVhDN2M1VHRZdWx1VHNWRzNMMVl0U29WQXE3ZGpBM1F6b0xXTXJJV3ptdDZE?=
 =?utf-8?B?QXFsaUlIdXdTSTJ1Y0lEbHFpOTd3T1hiSzJUTWNuNDVGd0VkOGNVQ1RzVnZi?=
 =?utf-8?B?YnRkOCt6UjRjak5nSUQ2MDBwT1IrVllPQzJ5bHM2RU96d2Rzckt3bDVJZTI4?=
 =?utf-8?B?Y0g4eWxvNzFHMVVYTG0zUXVrSFBUcTFKb1JuOWpnNHJjZjlSK3N4a002TWNh?=
 =?utf-8?B?aktKanI5cGJwNUk3ZFcyeUZDQ1V2bGI1anNPSU92MUhNajlUSE94eWhHWkl1?=
 =?utf-8?B?NGhBakhHN3pkYys2QzZMdUhqTG5TMTE5WTh1SG1naXAySEpmNDBSdklKaUs5?=
 =?utf-8?B?RFpXa0d0RzdoR3MvVUNwMFZtUi9yR2tVSUZ6SFZnbDJTdUdXWStJMVYvZ3pL?=
 =?utf-8?B?ckhLZkVQSUNqeWUzM0R0M3I1REZiUmR1SlN6Z214UGNXandxM1pmWDVWaGQz?=
 =?utf-8?B?TU5ab1JlTjJxT2FBbzdkWjl4anhOS3VHK1BOQ0RvYnkvMm1zSTdXcllKZEll?=
 =?utf-8?B?cmloZ0JUaUZrdTRWNWgxVFJCZzB0SzVDM1p0Tk55NVlKY3k1OFlTQzVnRzRM?=
 =?utf-8?B?ejRpRlhENnl6WEQ3aklGWlB4Nlo2RUdtaEp2cUgxdmR3V2dHSlptd3BaRWMw?=
 =?utf-8?B?RXpmZmNyendqcUU2UXVXSDlIYnpjUXRzajRObG5Vck9pZHVCRnQ1ZmlEM2Iy?=
 =?utf-8?B?djUxbWFJT3VTYktnc21meXRKMjdpSEIydnQzTkRzSktremVrR2g0Tjg2dWRL?=
 =?utf-8?B?dHdFMHNlalZGY2dDdFFvUkc2RWpaWG84dWdPcUNIMXg2eHVKdFJSY2tpTW5T?=
 =?utf-8?B?bVVlUG5uTzc1MlNrZEpuV3MyTjhDaG52UjAyUDhoOFJYcUxFeFErLzRMbnZk?=
 =?utf-8?B?R3doVTJjd3lZQjlROVkzcnNlL0Y0Zy9lNUNJbytYaXEzOG5yeEc4NEFJbG9r?=
 =?utf-8?B?b0gwWUpJZUZDRzR0R0g3ekZCb0FDVU9qWnEyNk5lb2tqb2Z1d3hwa0Q2bGhE?=
 =?utf-8?B?QzkrWUx4UHl2eC9HZWM2RkQ1UFNhaWlxSWRVNm1kbHZJd1F3QXNhWjBYZWVJ?=
 =?utf-8?B?djN4OFVBdUxVaHViVFQzM3ZuaWlJVFFFeVBrOTNROUlWWW5VdGo3Q2J1UFB6?=
 =?utf-8?B?ZEJVQUxtSmRqandSU2o0SHFkOGhidDd3M0lLQmRtTlMrOFJaSTVDa0hIYVZE?=
 =?utf-8?B?ZzVqRTN2ZEQ2eGR2Ni9mQmZxMjZJeHR6bFhNTVgrTGhmb1huZXBPZHZIbnJx?=
 =?utf-8?B?cEx2b2huQzNxcXdYSzN2czFOSll0NHJ5dlMwZHNrakZqZTNQR21HUmRabnZL?=
 =?utf-8?B?MFZyMEJ0RGVYVFZwVWRBMUduOUJhQjZpRTduaFdtSHZ6eENkVzBlblFhdHY0?=
 =?utf-8?B?THF1b0ZRbE5RSElveUM0RFhDa09oTFQvdlpkRHRJN0xGOG5McDRSbDJKTjM4?=
 =?utf-8?B?bXU4TWJOQzlHOFUwak9UVWtmQU52RXhaMXhnUGx2Q2hhY3dPRDNXZm16cWxz?=
 =?utf-8?B?ZWRER3NhNVFBV0dOa0laRTQyTjM2cWxqMmk0MlEvQlVIQTJ2SFZvWjNCMEFP?=
 =?utf-8?B?ZlFnOUVOQlhJS0dSeEFWbTl2ZTN3UCtSTzdUK1phdUlZOWZwcklNMmhyNXpD?=
 =?utf-8?Q?ASjAbmgpelWXsORluJArTQYxu+b0oHJOuOo9d716pU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dae40c5f-2f1d-43e8-5fef-08d9fd680b35
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 22:49:15.8765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yORmpPdRcFniYkSmDtAYL6QHXcXlx3zjh6ZcRqoORfeUwjbrRbVVJMBVVgn9Mpfa3LW7RANsaAgofBVs3T+bQZPLmQ26VIHr/I+0+5voDY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4316
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

On 3/3/2022 14:34, Matt Roper wrote:
> From: Stuart Summers <stuart.summers@intel.com>
>
> If RCS is not enumerated, GuC will return invalid parameters.
> Make sure we do not send RCS supported when we have not enumerated
> it.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 32c2053f2f08..acc4a3766dc1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -433,7 +433,7 @@ static void guc_mmio_reg_state_init(struct intel_guc *guc)
>   static void fill_engine_enable_masks(struct intel_gt *gt,
>   				     struct iosys_map *info_map)
>   {
> -	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], 1);
> +	info_map_write(info_map, engine_enabled_masks[GUC_RENDER_CLASS], RCS_MASK(gt));
>   	info_map_write(info_map, engine_enabled_masks[GUC_COMPUTE_CLASS], CCS_MASK(gt));
>   	info_map_write(info_map, engine_enabled_masks[GUC_BLITTER_CLASS], 1);
>   	info_map_write(info_map, engine_enabled_masks[GUC_VIDEO_CLASS], VDBOX_MASK(gt));

