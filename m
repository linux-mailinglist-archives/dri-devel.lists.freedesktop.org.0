Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4082B138
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 15:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EE810E938;
	Thu, 11 Jan 2024 14:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFC110E938
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 14:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adu2lR1sGATZyXH8DHMHHWcBnRoV89Q8TodKIUTvjgGNYeCc1qZH/VFw39QcJX0EFtcNNFgxfptXugL2Y+GKOqQbjgtTqWpbhKKN5Qw2QbYKggiuzY+yAlkb6R36TBFmjqT5uQjJbcmlQoVuMvKZATvlaBLEEse29DNDVzFiqeTGHgPvPt6S58VxOEnIHP2qe3j5T/CsSs6Fc9BiOJB/+e0HXpyee2ia9+dwIzXrp5NEkAAHu5hHzZ/pEsVJW1o6D2LRIDDLkmmy0VZrgkXfJ+MZdfJbPU+1YPg6DqBiPjyLwHeWfyRqqE+3Ssrhgu+2lJCWjondMUb6yPrSLm7wgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU6xNHGOL5LZdWyCkfbwoy1N44aec3QQTUPcXot09qI=;
 b=m+nrcuNYelm9TIrGRoBaGHeFiJwboC6IdruClm7TFQLP/uL6Xmwz9F0MVmeU1w2Z6LhOV1DRmFNTGflzsdcFb5ehQZ5GiYtC/cjXyzKyWsEG9mI0n2lVBHzu640ZgB7uCfcID26DFStFPtju4+D3e50SAGLEguYfqfthc6T7LbmaNoKkvRqNIQ2c1RpBy9GwSNNjmINDjPnxRmR8WTsLpBCwstj09dPuqHTzN+zfCYgVuh53Y81GUhvVw98g2Im0z22iPR5NmtwxCFPWy4Byo9xEL0N/1FLAGQO/Ay9DReT0bgMjRsg7A4qWJ6rumGxGhU9n3kAxyTGMwblk46zrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU6xNHGOL5LZdWyCkfbwoy1N44aec3QQTUPcXot09qI=;
 b=xtBOeVrsa9qGHXBi3AZ6SqQquUI90QfvqMVPrFeRNrwo3dsdXylNmNErGUtKNqvhd35QyhtPVrQzKMCiaBhNHbC4uHpQ3gS/OYowCeaXOGfIiU+TWnlennriF4oWcmdpxTc0JJEiw/MfTe4v4gpm8lEB6sAn11HQD/CoFXDiiDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.27; Thu, 11 Jan
 2024 14:59:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 14:59:50 +0000
Message-ID: <c0cf8ae9-7915-4102-97a2-2159ac6b69d1@amd.com>
Date: Thu, 11 Jan 2024 15:59:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 1/8] drm/ttm/tests: Fix argument in
 ttm_tt_kunit_init()
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1704959786.git.karolina.stolarek@intel.com>
 <db34f34a039cf951c5933e8ae046b4ed72d20dcb.1704959786.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <db34f34a039cf951c5933e8ae046b4ed72d20dcb.1704959786.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9295ff-9ab1-40fb-b227-08dc12b5f5ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLGoQdir7YQnJE0BGi/1Lfj+kvg7uoOpjsrXCB4DcGqqyNELTfoRnlkJoqWEonwafO/Fy6fvPHy7xVYfatu5AtJuTUcZo0X7i/kggPLk3GEw1i4KgeYALH6LT6Y54FWA1mMwEY1dBfPd6yR9CYT4mQxA4AuwYlZQ4BtTl8wzM3LaPesypSNvylh+BFkSfQIVe9S7zYXIyrVhNA2CSmkpkuplzxSviD+Z03JrsquyINKWsB6HyBxDq57zqA0g4oYTQEwyW9vGDGjA8BzMZEGnYkaVIgBW3FAr38uB8XzLPMuaH/kl81Edp1LkeofYOIsLTaAGQNgWhkogwlyntL2Y9SPpuTJM9txZOjGLmtSaYrIK4pYu5llttfHvHzg7LuH0WHky3mr+g7ZkStARasBmSkIcOktmk+LxhPswaNNzLQcWy5cNkjPb7AgIO+HQXSeb+zza20olTX64quUxUCvGpmG62KLiE2LMoRsFDiFcSO3THpVFbMXe67qTrRfd9lqHvTU4hYSeZ0rzQSeUvNceY07mxtKr7UoOFKEtqroMal6/3ZKIXoChzk3pGt6HpiHYrmBdl/w7L41WqcXWk2LEsgU9u9qIweQEU//gcHZqF1zCFdg/Oexox702QFds5YHY8tvY0sdL5a23EFenHJCniw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(2616005)(26005)(66556008)(316002)(66946007)(66476007)(54906003)(66574015)(8936002)(8676002)(4326008)(83380400001)(6486002)(6512007)(6506007)(6666004)(2906002)(5660300002)(478600001)(31686004)(38100700002)(31696002)(41300700001)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JzL2NjNVNFb1prT25TUlg5M2M1VEJ2VWo4bWtJMk5HeTNSYm5ycVM0QjRj?=
 =?utf-8?B?RlJ3dXhwMTNVM2tOcmcwR1BZZEFONTdRWHR3Y01zODJocVQzMkNUYm5mR2pu?=
 =?utf-8?B?SHNGN1EwMkZWbXZINzJZODllRzdXVnRzNWhZbzZ6ZmhJQXNmbkUyOVpSbFlh?=
 =?utf-8?B?TXRKYnY4Y3F0T2duSlVsOFA5b1R0NksvbzhSb2xhcE1FV1BkcXYzaUNBaWo2?=
 =?utf-8?B?L056ZnVZY3hWbFlnUFJYcE1CZFFLSkV5U1IxMXd5b0RnN2hQdE9oZVpDY1lE?=
 =?utf-8?B?SllkemVxd2t1Mlg3YTZmVUZ1RHBJM2pEbjlLdzVBYWJWYWhpUkkyYzBlNDdH?=
 =?utf-8?B?Z05GRi8vWVRVU0ZWN1EyVHNKck9LSVJla1dHcCs0eFNOZ0RDTENKcGlZdyt2?=
 =?utf-8?B?RlNCKytST3ZucnhXQ2ZzOG1vS05Lam1MMkZUZHpjOEh0Zi9rRHpwem41djFI?=
 =?utf-8?B?S0F0T0JYT3NERE83MFE3T3N1M21SQWVHcFI1Z2lmZHl4UjkwVVp2VDNUL3ZY?=
 =?utf-8?B?VngwSHFsNGl4R0IxcUdqcDhpMGdidTg3OEZ5K1FsTFlXYVl5SmFKUHhVV1ll?=
 =?utf-8?B?NGxtbDZoRXJLV1VoZkMrcVpNeGt0cWJab28vY2hIQ2xRdUxmWGZSbDAraUZ3?=
 =?utf-8?B?dXZ2SDhLWWxpMndUZUFoa3l4K05sdkFoRjh4bW80ZTh6WVI1Sy9xU3FmWmNE?=
 =?utf-8?B?QWNsbzdEVUQyOGp3bXZSNkVxZ2pIdjJ5MytSY1JINEVKcGFRSk85akkwbXRO?=
 =?utf-8?B?QWdkN05IVkRzTkhPOURrd2IyTXZkdnBPK2xMa0JVSWllcU5kc2swWXRCUWdy?=
 =?utf-8?B?b1NrM0hHQ0lkazdpRkQrdmZCRDIvb2hIS3FRY3g5ZHZPR1FvdVc0amNVWXc0?=
 =?utf-8?B?c25kNDlwZ1VTZDQyRTAvZmtzTUtJRzNzNER5V1FuMjlENVBvSVBGdVU5QXRo?=
 =?utf-8?B?MGFoQU1wMDRUSDRuVktFNzV1TGo4anlDK0JVTG4wZ1QvZDcxdUhLYkpIOHAw?=
 =?utf-8?B?M3ZYdWFpMC9uRHhYRlpHMW1YN2hkaDJIOWhhcldBL0U0R0I4RGlyb3ZMSHdv?=
 =?utf-8?B?K2M1dW5MN0hUVEZWY3c1ekl4bkVGQjhQVk9FM09ndHUvcTZObjBCTFBnVlhF?=
 =?utf-8?B?Y2FvTHlYSVdsK1lENDAxbFM0cU1MRDlzb2tzOXp2UjFybnZNNUR6WERTaCsz?=
 =?utf-8?B?S2xWNThiQVNNMFdCRitocFF3RlkzREEvWTE0cUU1ZW5rQUhmaWg1NzU1dXUr?=
 =?utf-8?B?c3haVmthSmZGcno4ZHBHYXVMR0FacnRjT2VpTEJwUW9nVHh1VXpDQkRtL08v?=
 =?utf-8?B?a0NXalpiSEdLNjJ6bDFqV1ZtR0hGOUc2aFhXQjZhbytWT1lYQlZkaWkzTGRv?=
 =?utf-8?B?TWhKVHlwM3BKb1RUQkRFV2tQV2IycCtmUWh3L25xTG80b1IzTTlVdUd6aDF3?=
 =?utf-8?B?SFp2MHFHMkpvMHhtVjFadmF6aG91bTNDaGRpTi9USEhQZkptcGlmNm1raUFB?=
 =?utf-8?B?cHJPdTl2SHJHbnV2OElIRWhIZ1FCY2hzUVhQL1ZranZrNVVidkF4clF5cDZ1?=
 =?utf-8?B?Qnlad3VOaVA4L29VaGJ5NUtaaXQ2Y2VQdlExRVlHT3JTZ3pGZXdxUGFhRUdI?=
 =?utf-8?B?RmhRblZWaGpQU2RqalllVFoyYU9rYnpGU29jVWx2aThuMTNPSTl5SUlxNEFC?=
 =?utf-8?B?QUZiY2xxK1V3aStDMGFXSUFLcnQvYU1GNGphcEZ5UlRtUnc3cTM5UHU0MzJU?=
 =?utf-8?B?Wis1b2JLRXRNNDBTR2IycE5JUnRZdGpOMkxRVmtqUFhtSWwzL2hyWitGUTFv?=
 =?utf-8?B?OU1VZHFVRUk1YXJvaUxWR2JoNXdSNS80eTRhNWNTdHR3U0s4L2hRSXpPd3FP?=
 =?utf-8?B?MmlNeTdQYjlQeHltL253MzNNdVVSaVZ3THJMYnRzZXZkZEtaM0FhdUh6RkdV?=
 =?utf-8?B?TXNpQ3d5L2FSeVJtRVRnckNnMkNUM2o4QkE4RkVzY01uRWkvazBkazdjVm9r?=
 =?utf-8?B?MDMwWTFCdzNGN2VUblVaSW5wRFRmVDJnaGdTYVpQL2tiVHlxb0JnZnNMOW1p?=
 =?utf-8?B?VXAxTjR0bXNWOGlRbW0xTElNNExBSmM5SVV1cTFSODkwd0lnalplS0doVUhR?=
 =?utf-8?Q?Z21K+wPOdSMsnJf1UZPjDpati?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9295ff-9ab1-40fb-b227-08dc12b5f5ae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 14:59:50.3740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRH/Ii3F/OZSXw9ArgSRyuenqvuhKIq20l1UOxgsUaM270I7fHksAq2buoqngk5T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've gone ahead and pushed this one to drm-misc-next.

Going to take a look at the rest as well.

@Amar could you run another test round with those? And maybe ping Kenny 
if we can integrate them into the CI.

Thanks,
Christian.

Am 11.01.24 um 11:28 schrieb Karolina Stolarek:
> Remove a leftover definition of page order and pass an empty flag value
> in ttm_pool_pre_populated().
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 2d9cae8cd984..b97f7b6daf5b 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -78,10 +78,9 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>   	struct ttm_test_devices *devs = priv->devs;
>   	struct ttm_pool *pool;
>   	struct ttm_tt *tt;
> -	unsigned long order = __fls(size / PAGE_SIZE);
>   	int err;
>   
> -	tt = ttm_tt_kunit_init(test, order, caching, size);
> +	tt = ttm_tt_kunit_init(test, 0, caching, size);
>   	KUNIT_ASSERT_NOT_NULL(test, tt);
>   
>   	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);

