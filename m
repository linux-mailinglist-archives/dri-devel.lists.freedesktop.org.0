Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C97652A6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 13:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5672C10E07E;
	Thu, 27 Jul 2023 11:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450B510E07E;
 Thu, 27 Jul 2023 11:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNB8AIuC4WtwSd2PminbS+7btNsDNViRrHSXaXL8cAbdHG8QxpeELfM/5Uy3MALq+JiAIFlDlOTrPOVv0WDTgxNH5YRFeO9b0IgXmGWN5xP8g5BnS4NL+tNAEnXcljNFnR3Ot1SytRKkKxqLcd1MGEno9ss26qARN+PFccqK/hGiFs8DMG2bqdcv6nYzHiJsW7c3OaiLSiO2pVzxI/3DX+I0VRFn7OvUKtCMk/rxyr0GFD1RPLNi1kVFw5rDnNPvUMyXIogTgxBPoi+DGdKw2uMzLfb69VDN0Diu6iydYYcsp+u4yeRaX+7p4zHrb89RUjX6jrfhB64mw4b5g4VdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8LzM+inXomkavkzUyymHDOkPcMtHQ4lXyWYu0avxwM=;
 b=TYERl81/U67hGApGSPfcaAZ05jwW3ms/z98oZAT54rHpV6lzDtTAjW3RaAzDnbXMG/yn32KSFOk1vJXfacbbf7CAyKUmKmrT8+Nx3UVI7M9T8XGwnisk5qNEHPKiCU9yuLqK4933toRGfhhwFK67MaliHKDOMkeFYa1ESji/EekM0DCAVdTjFGfuqV7V3JLo3FGma1+KOOYimbnPiuS1SCGaUuvGOQQx10XWf3+aCoqj5N+kGUtiVqvP5cEXwqx3/vuVMNKoXQ2EEfbwnJnp05s9TbV1RRW5xHLdNIV9U7irlAsNNX6EWocnDRQaUIKc+5tbfpscv2owj9bbvwR4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8LzM+inXomkavkzUyymHDOkPcMtHQ4lXyWYu0avxwM=;
 b=Q2Yx4OLyAL3S/Q6PmjpJ6trdKLXLzeOdI1SlkvZ9D7//sGuFEAgJ+EDfhw600EHLVQ2d96P8mrbe0YFx0Tv1wnCH7l03n2P9pSpFGIFUnn5HVojgMqu4D6Toslks90rx6fv0dz8YUIxg9S1C5y/KIgPXyE+2V5U89rArINZS4uI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:39:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:39:29 +0000
Message-ID: <89ec5d89-34b8-751b-9acd-6154eb3bc409@amd.com>
Date: Thu, 27 Jul 2023 13:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] drm/amdgpu: clean up some inconsistent indentings
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com, daniel@ffwll.ch
References: <20230727010330.122606-1-yang.lee@linux.alibaba.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230727010330.122606-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1febb8-fdce-41c8-c6f0-08db8e962352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yHazH3EpRNidN/eqOLuQ2Cd2ql3gjsa4la3jCOdiv8RiUJo0j3moPWaW1pc2sa4dUD7HQeYp9vbaI+hKX1McNZ7beJDbaquCb0/yAxDiUUMo/SkSJPd+P3AcFsDcGsxHfWAVnrEUThXJfsaBPzqebZUOS4kjQYR4va6A3LvZz97SSbULhjS/IoHLdQJ5Z1W34hOmaT7WQMwKEtB8QATTjqUlb+2frF5lsWor1bhLmfsaifS8cASB0mziEticKBpYScmgtn8huxvNKEnLp6P9gbD0cneD09o+fvNe3m+t09Fa9oXaLvl/Qf8Gydnoz2UV09Hmz3D8xEDTNM+p9W24Gf658xLWwZ96QJYDz+r/T9Y/LFMyvWmCAGmD9wkVaAXmXMjAC3cwf/ypJ3bmcGSMJdcuZBTrgvSNOqKZgByNbmsa5YYOFc6I4/+nyX9m8JiwpadtISMg9hZymdh0SWt8ujUJZGwNfKh9Y6TV7Am9bkv2Zf0iuT7gmQTB+rnUeDF4w2psaJFAgdLgBx0RV/LYwaQXA53oOOQDLZQg8KW3M6vB7trBoEfu8FDcXyErPXDW79V9V0gdoe+u6IMhC7pJIKGoO54EEkiBFzglDlRYGP/dpc4WAAzuxZ1+tMnqOC53
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(478600001)(6666004)(6512007)(6486002)(966005)(38100700002)(41300700001)(5660300002)(66476007)(8936002)(66556008)(4326008)(8676002)(66946007)(316002)(186003)(83380400001)(6506007)(2616005)(86362001)(31696002)(2906002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVcrY3VwTTB4bklHNllHTjVxREsyYzcwWUxIZmNRTjFqSDF2UHM1ODRzMEhW?=
 =?utf-8?B?eXpzdnV0SUZVazJpVlQrNEVnMDJ0bmR2V00xVkg0akRDWGlPYjJhOTl1N0dN?=
 =?utf-8?B?eHQ3U25lTkRERHhaNTdVejZiUzVaWFF2Zi9EbCtVaCszai8zTVptV29BK3c1?=
 =?utf-8?B?RlQvV0hQbU5UTVdXRzhyZkNhdi9IVDVaTVdTdVU3eXBVZTdPWENueHhLcmJ5?=
 =?utf-8?B?d0JtNXRFL2pQczNBNmFJTW5iYzVhYW4wdm9FZzNXekdwSmRleGdoLzlvUHNB?=
 =?utf-8?B?TlJSalN4MzFVa0RDWHFSUXpmYjZCM2lTaHd5TWhYbUpjd3pUdFpmaW5PQ21Z?=
 =?utf-8?B?bWNEWmdRNUNCNmU2dVd5ZndYdFk1akhtWEZucVZEeFp0aktPMkVJK1UvSmgw?=
 =?utf-8?B?dVZNbW1WV3VUWlYvTTcwaUgxbG8wc0pnekYvWUxRN3V0MnZGZ3MzTGU4WkRO?=
 =?utf-8?B?amtsb3UvdGpMaVgxTE0zQjZTNVNYb1QrRzB2Z0RFdU1VYU9yRkVpeGNZOHVZ?=
 =?utf-8?B?L0l5bkZFSlF6YU9mWkNSNzB1Ky9JdlRxRjQ0dmRWQndDaktTeStCUWt5N05V?=
 =?utf-8?B?aTc4NkxRckdtcTczcytEb1UrZ1VybWtUMU9NMVRvYlNWVXpESGlmYnV3RTF4?=
 =?utf-8?B?SVlmR2drMWxHRWdaZ3haWFhsS2s2SU1nZUM4M1hrYjdvUWhKTXBFVm5Yd0ZC?=
 =?utf-8?B?MHJIeUJ2aDBBb0N2eFdJNUVJakFndGNvMkZPdnNmR2pZb1JZblBkT3I3eG56?=
 =?utf-8?B?RGtaQkhlVkVMSjdWWUNDNlNZNUhvNVd5REdOZ25VTi9mR2xETTdjTHpPeGF0?=
 =?utf-8?B?YU9HNFZUTzl6NnQ4R1VybStwK084WityQVU4M2pYWmdPRU9nb0Ntby91M1E1?=
 =?utf-8?B?UnJXdmZZa3N4MFJDSVZZSWV2S2N0aTVlSHNHb3phV01FVUhFNjZqVHhNeHQy?=
 =?utf-8?B?SFEvRll3VGd2cDgyZW5MSlJLaTZncGk5azZzU3VVaDRtTjg4Z2xIdWRJQnJt?=
 =?utf-8?B?aG1maEJlRzhKRXR4Nmc3bTF6ZndMd2FzZ09uVnBUcHRDeXV6dktOcVJ6M0tz?=
 =?utf-8?B?b2ozelRXcGF6N0o4aGIzSTY1NnlwSk1oNkFtWmdTbWhhNElRNENOUUFYaTF4?=
 =?utf-8?B?SVZXd0pxM0NGL2UyTW16d2gvbkRSR2NBcnBUQzNGSGxhV1hoRmwxODdGMS9u?=
 =?utf-8?B?M2s0TWVnWVVzRnBCd1pwY0Vuem5yZm5hemN1L1hrYWVRZWFQQmtucFd4N0p6?=
 =?utf-8?B?NkFoSHVHYUlteGxWUE93UzRKOXJxRlFCd0dQL05UaFVGVVlxNzJvb3B3a2I1?=
 =?utf-8?B?WnJLUVk1dTFmR3kyVHRwY2gxZ1E0cklLOHl6U1drQzlQUStjOTI5cG5BdkFy?=
 =?utf-8?B?Rmk4NUk5WkV1aW41UnViSDliZGlmZWJCOU1kaGY0M0oycGpDNDExZHZMV1Bv?=
 =?utf-8?B?NGh3c1lMcDgvbVdlUWJZem5McU15L2ZoK3Z4eCtsR29DTXBvUmFjNFAzNElp?=
 =?utf-8?B?OW9pUTIrWkEvRlU3eGU2M0hDNVZCSXdPQTIxa092aTk5aGZ2Wmtkeng1amMz?=
 =?utf-8?B?ZXJ5NnppU2xtTGhtY1pxM1pYY3hGYXFGVzM3WjY5ZlpLR0JmM04wT2FQYmdW?=
 =?utf-8?B?Nmo5NS9HRkp0MDFpNnRWN3czcFRQOXVMYzRrZ1Z0RXp3YStWL05LZVBzWG84?=
 =?utf-8?B?UjdTZ3BxdlJmMW40bHZyLzRYTHJYa0Nyd200Q0JoYVFLRkM2anNrRFE0dWM4?=
 =?utf-8?B?T0tXZndwQjVvNE1DMFdMVlpvNXZRMlEzSmxRbnZvbWFRUUZkN3hjVk5kZnh1?=
 =?utf-8?B?TERIYVVhWW5qb1RZRGI3ZndRcmdnTWk1cjdGUktKQmVWbyswVXdFeVNCZmxo?=
 =?utf-8?B?SGcwa05wcnZLZUtsdTNmZWFtZkxxWmMrdkpjMGd4anJXVklJaUp4N0FBbHdZ?=
 =?utf-8?B?eHllcE90cy9KaXVnUXZuMGlQc1owdUQ3M08yN3RUZzRVVVhSeEs2S2FRcUdX?=
 =?utf-8?B?L1lLN0xkbHlBdmhwQ2NwZGVuOUVHakRudDFpWEx3VjlkZkVHamk4bTFnUjNY?=
 =?utf-8?B?RDdkaFJobFhFUC93SFBQdFFzYmdUNnFRam5sZERoYXRCVEJkYytSWDJ3OXhJ?=
 =?utf-8?B?MEU4d1haNTNRTURNRmVIU296M0xyQUxNb2pTNVkySTZhOHJncElxVkd1eWtF?=
 =?utf-8?Q?tET0i18t2gGJASTdMvMTIK369iuh9f7RDf3R6TaEhIhV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1febb8-fdce-41c8-c6f0-08db8e962352
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:39:29.4274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwCXIL3+ugW8E/WTDbR9XEBaLhHSEEmHSln9O2VSZMtnwwXFMkjhl/oYj/FM1tH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.23 um 03:03 schrieb Yang Li:
> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:622 amdgpu_gfx_enable_kcq() warn: inconsistent indenting
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5992
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index c76b6bfc4dab..80a306b3d9f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -619,8 +619,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev, int xcc_id)
>   	kiq->pmf->kiq_set_resources(kiq_ring, queue_mask);
>   	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
>   		j = i + xcc_id * adev->gfx.num_compute_rings;
> -			kiq->pmf->kiq_map_queues(kiq_ring,
> -						 &adev->gfx.compute_ring[j]);
> +		kiq->pmf->kiq_map_queues(kiq_ring, &adev->gfx.compute_ring[j]);
>   	}
>   
>   	r = amdgpu_ring_test_helper(kiq_ring);

