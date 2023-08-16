Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D477DDC5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 11:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6567910E31C;
	Wed, 16 Aug 2023 09:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FC410E31A;
 Wed, 16 Aug 2023 09:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ib666/gTE9zCSn1bztC2/t3f60LmWNZlc2Gz/JjZXiunsD7CXV8rB7bHnO7/lebuh8/pduXdAbRgP+URLy0NRTH/bNWxBYGC1UkfwYkanLNiu2ZELcuIfKq++N7WhM8y/UK/fDFNr45j13djJj5NM2dSKCrkgcdkQGghKs9GDv7gXiZxpv4z2bAd0RuhnihNtnMUxLvaTLsOY8T4K2X08yz6yxod6yw998yXU4OIL9mHUXgKOfNYvmZftDrB+z8+zc62DMHiHRaQ3XwrBicWN3BaZM5o2jXTpOtEfYNI6vZOPCojUr8/fc1ncB5BDFiQbbsgpOrhILF5iDGFq+BXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f9aBi8GB95n10IQuGD4xek69in9Yu+AWF2eF2jwOMQ=;
 b=XbKGUDKRMt3AwH/lWU+1JKkJUv/KJWjLySENBYuLU0clGFic2p9oJeP3xycP87cTqJU2RvJRJu9NQQz9kWXUGA4/UgEZL9LFBtRLNhCER31NVnCafJay6NE4RpRDRdTxfDy0NX6rTTYNaNKEJpEjiOKJHKGAq+Vq5cnK/zMeIPZSppAoZ8bnhXRADoQwwDpOMViorh4vNGj9CzKDXEJnS+UXvz/CO/IONmptcAv7LfH2Df36CXPaWdo4BYtO+ojvwsdaLMa6/sN0OiHEg7itQpGdHWh8gbOWNs9axn76k0l1jAhyduEzEwyq2xd+QjGIJ2eHPQ+FPaI8cJ7nl5No3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f9aBi8GB95n10IQuGD4xek69in9Yu+AWF2eF2jwOMQ=;
 b=buPMpUzvIzRFz6fQsndxrrrEgwOn99NhY8TfP5UXXMfUITFtys6rNJsSCobxIUkFJIX/bIK6kXxaz4hwGf/7C3C8Rp2MbMCOlm0f60KghJOk5ok3tVRrVQouZ0rEah9CUKjFw5c07RRJRmMaijAwwnmpFjSGnCILUPMyFH0NnHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:50:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:50:19 +0000
Message-ID: <938c4ab6-1316-0b62-3130-4c4550f41768@amd.com>
Date: Wed, 16 Aug 2023 11:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 4/4] drm/amdgpu: Create version number for coredumps
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-5-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230815195100.294458-5-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe397c4-8635-4f39-5dc6-08db9e3e33b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3YnBRPF2458kPSxUfO8lj3O3sP5tRhKuRWwXJhIg3s/F1r8q2UtN4YYIn4je+uQEEqUSBMf5lSvlQW26VQAVsOPu5ymVXn6Q/5Hp9+bDqTrj52iE+V2OvYRAVn/gQ7bsDHkjnhDUAWffgb8xpnPHOaUY7jcCAkm28EseSDh8lopCObMaS+kneFBAor1j9emR98aAE7VQhwlFb+tqW0uFqhtNORKX2J7DS/cBC6SuHwwja1fLsYnZJxb270iCxQXZoHgA+WqWqcki7qxEnM0cLrzw7NxhqbjpBAkkFMQB0j8I1X2NaZkADDnhFIJL/H2XHhRLhhxoOSk9q5J1wPVkklkLZkDOUtTS+swMfMd8k/UNtXeaKwWzoeaQffgy71OoVGL5oCgY75aRYPzJSnni7IKBM4emO1cEXbk3R/s6QArVVrppQ12FpzMx3z6Iq/OMqE621+r2aNi5mEA/7/q+dv69O85hNFD2UbTpPpldApNVB/Nub1jU/qFZmTdIVKwbUTw+7BxrZ1eKBNHeFQhWRF7qbPdAp1fh6007VY1Dz3CK6F/hEx41IisowagLXjR3ztUruSocX3XdOIa3MkFydpPv4zM2kFNukRqjE4hlYLUgFMZkecj3g6VgUCxHPvywb1W/BG/NLpiTWW+udP9ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(54906003)(316002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(8936002)(4326008)(8676002)(31686004)(2906002)(478600001)(86362001)(6512007)(31696002)(6506007)(6666004)(36756003)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2dnZkNZVCtnek1nQzdpa0x5RmRoUnUrWU04bDlmTllFZklYMWhwQjJ6OG1M?=
 =?utf-8?B?T2dUYjBwYkdBYTJhdy9pS2JKaUtwL1FTdmlGR2dNbGhoQ204dmtBclh0Unly?=
 =?utf-8?B?U2Jkc3FQRDhCWlBvZEdhelNLV2tqWE93R1c2S0VIRE1OSW1zOVNmdWJYeTNi?=
 =?utf-8?B?cHZhS2lQSGpEL0VjUmUxNkhXNFlNdC84QisvMWk2cDVIdlI5MXlkVGNabkpp?=
 =?utf-8?B?MEgrazBqdDhHMkhIaUlUYjZhVWgzcWE2UHVROFU0c2JkOUVENXp2dkpDWHJy?=
 =?utf-8?B?RnZTQ0MwN0JqdVlwRnM2azVyTnhHdGVDaG9LK0g3YkJwRld6MW04T0dZY3I0?=
 =?utf-8?B?S0hIUnhpeGtwdmMvTW92clNvc1B4cWsyUFowR2NpY1FVbVBZZEd2MlN0WjR6?=
 =?utf-8?B?OHJ6cXdYblNsVHdzY2tjajNnalR6Z05ESE9RVTd5VmpGa1VJOW5CcmJHMk5m?=
 =?utf-8?B?Kzl1enJaL1lkR0ZSdHRLdDRoWDhTOGxsRDFZeWhQNkdIaS9sdWdXS0RVMzlQ?=
 =?utf-8?B?OUpRK05YdTRsMkJVRVFyM0lCbEhLWUpaaEkwc1JieWxMRmI1R2RremFHR3lj?=
 =?utf-8?B?eE1RVzU5NVloWW1SZFNhbG0vUWdtRjRtSk1pRVo2aHNBUjlZcjMxUmVEZFBh?=
 =?utf-8?B?Rnd4QzR1dENFNDF1dnVOSGlteGJMMG1wSCsyVEsxcEtuUmZqZEJIc3hSdFNw?=
 =?utf-8?B?ZExUQy83bnRDTmJXZVpCUUdLeDM4Q2J5ajliTXF3Q3JHWXlPbXJBSE1HQnd2?=
 =?utf-8?B?bHlzZ0o3UWtxT2VoSG9oNmxDR0g3R1FZemh0V1NTY1htNTAvVHFaN29mQTJp?=
 =?utf-8?B?bGFORjdIL2JNbFNyVktoSE5EbnF5Z24vWGNKV3A4NWJMNkE5V2lleUJ4Wmdk?=
 =?utf-8?B?YUhHS1hjVzhyMldBNzJoUDVMQzNUZ1FrM3l5RzVvQlkyQ2xxQnJ3dEx0Z1Nh?=
 =?utf-8?B?T0lPbXgrVUhPMFpDK1Vhb0ZubjdzR2p3YXl3b290U1NLd1Q4M2hKN3RiN1RU?=
 =?utf-8?B?SFQ3djJ6U0lTN1N2Y0UwOXdBc1dVbzB1cGlFS1pkUFdseVNvVTBZWE55bDJE?=
 =?utf-8?B?N0hmZ1RDQ0FneXhEVU04c01SMDBFZWFkMjE4RFNyWmZlQlkwaUdNdkhaT0lq?=
 =?utf-8?B?L2oyZGNxZWtyelhuYXlUQzB2SHk2d0UrR0RDWU9jQ2VOZFlaQ0JRdnhjME1H?=
 =?utf-8?B?ZE1SU3hpWWMwWWg1cVZ4RHp2dSswdDRGcDdIVlBjcWNPL1ZpNUErV1Q3VG83?=
 =?utf-8?B?TDJia244dFJZV0JVMVNFVnQxdGwzeG5GSDlzZ0xOY3k5U0JXRVpkRkpjSVZo?=
 =?utf-8?B?OHhMWWZYNXdManNqVko5MG9MWnFtY0xkN2lYNUlnMG83TFBud1FMOW9CMGhq?=
 =?utf-8?B?SGpLQXVXRVV5RVpiVElGT2ZZblByWHRIUTdLNTEyalZWc1IyaXdUbmlJWnN2?=
 =?utf-8?B?T2J5RE1qOWVXTThnblNkdkRhNzNIYjVIb0c3QWY4L3J6Zng0M3I0SGFpeVo4?=
 =?utf-8?B?b01jK0lEeVRXUGpIbnR3dWlKaWp6NmVJWThIUndtckNxQ0x6eCtjWWdJTUNu?=
 =?utf-8?B?NXo0c2ZSWFRKV3NBdmlTZ1pZakNLN1E0QnVCZEhSOS8reVdxL2VmWFBWTTRO?=
 =?utf-8?B?aGI0ZEpsaXJkckpoSzRmZnArNFNpUndDM042bEJZQ1MxL0NwTENyM3VNKzB1?=
 =?utf-8?B?R3krVVlQM0RVRUw4R1dlNGQ5alNZbEorSUJRblBGSTZnODdjbUpISDMya2lp?=
 =?utf-8?B?ZmxBdDEyaGFTWkw5eVNBcUpLK200SXNGWm9KSGh1ME9US2t6WGFkQjRPeTRm?=
 =?utf-8?B?SFhsMFJENmJ3Wm9hWTRvZ2hkUVk4eDRDcXBjQWt0MnFLbGZZbERkeVRnc3B3?=
 =?utf-8?B?SXBra3lCNTI1Tyt0eUMzRGVsQ2JSaFdYbnozWi84cVVlcjJmcGc2T1RzWkNV?=
 =?utf-8?B?TS8rNGpnaXl6ZGpwY0JuWkh3RzdEQ0lVbE9IcStXMC9XM293SVprSWFmek84?=
 =?utf-8?B?dytCbUIzVTdVUnQ3cTJtRmpSRVlnZkZxbjF5OGtHb1k5U1ordERZSTVpYi9m?=
 =?utf-8?B?K0lYRU5sWDlCWFJodys5VmdtR3c1Mm9kWFZCNGNYUUN2OHBaY0dkaXBEemFO?=
 =?utf-8?B?dy9LTy9ueXBxNFAyOW95OVJDSVhxdjNvbHpscXFVNEdiMld4bUJUY0Vha2ZF?=
 =?utf-8?Q?nZY0duAh/1Cee7Pyd8Cwrz8UG7r5iKDGHykfEcYMReSW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe397c4-8635-4f39-5dc6-08db9e3e33b1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:50:19.7933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6oAsgjPtJAs4PvBN9a+4yNj5VmvPqKTI3VLwEPBw2dYx8JcsEqL/RhR03QrqInJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.23 um 21:51 schrieb André Almeida:
> Even if there's nothing currently parsing amdgpu's coredump files, if
> we eventually have such tools they will be glad to find a version field
> to properly read the file.
>
> Create a version number to be displayed on top of coredump file, to be
> incremented when the file format or content get changed.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Marek, Pierre-Eric, Bas, Sam etc.. any comments on this?

 From the kernel side the functionality is trivial, question is do you 
guys need that? If yes an ack would be nice to have.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +++
>   2 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 46c8d6ce349c..6696ff0a94af 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -192,6 +192,7 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   	p = drm_coredump_printer(&iter);
>   
>   	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> +	drm_printf(&p, "version: " AMDGPU_COREDUMP_VERSION "\n");
>   	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>   	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>   	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 362954521721..7b6767ca8127 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -88,6 +88,9 @@ struct amdgpu_reset_domain {
>   };
>   
>   #ifdef CONFIG_DEV_COREDUMP
> +
> +#define AMDGPU_COREDUMP_VERSION "1"
> +
>   struct amdgpu_coredump_info {
>   	struct amdgpu_device		*adev;
>   	struct amdgpu_task_info         reset_task_info;

