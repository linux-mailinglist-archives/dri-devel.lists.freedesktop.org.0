Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B723579BEE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 14:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37F11AF86;
	Tue, 19 Jul 2022 12:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0111B02D;
 Tue, 19 Jul 2022 12:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH1kGJ5ZVf2wpVgrRQ0ngDEMb3lIqg+AQ58Yaxau9zvDNFeGHnjBoi5Krr72EEuLzJLzJOQ89wS/ZObWk5AqZLgd3MWzTP8Ok29dbUZpYXxskoYy+Jg7vTYQCokZy3LKhY9bac3srY2BJzURanWrsUEw13PfOYzcnngQMAucNIrQyrpHhmQ4Z7ClbLecMlUL9OHRozezSAjygv6hloIfzo7tfAWpsBT4imuFN9+HYvjoaCfSHD0LZsbmattXyncaNg11COUY0iAwdmh8KGTeXACGe9yP8v/ziEJltnwsvFf19MZs1QVIWGdnqjxr3zF37FahrXmHc2obcAkNDANYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA90YvujaYDnQjIkwGxveD0M7NqK0ULpi/5zYfIABds=;
 b=RX8lr1M/8dEFXnJvjoY3vV4fRduKU2HBPjRU4pPeKVzzqPFCK7DGvwImUJ7f+RW1zRwwj7/qtzcXJX1HDSDIqZ+HNpUzmEDwEne4YOb4NcM9admljU4GLZiIqS/8qM4A4uwxhmD2qiZiHwl5bLAUV3Ug1FG9+eJ8zlFpsMRui1WOkVh6MWJg9C7Zwi0gMPULc6ScZ1lVGtwbv2RcWD6lm3LZLifCUbcig0P98qL10j5ueGxnPJM323JMONanOQ2uWhN+2lfT8cMrdv0+9UIFokxg22uv01rt3ipwmRX3YYAYzJT7hisMk2VLtkO/ABhXy7F0p8kSZpRSHjhDSnrxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA90YvujaYDnQjIkwGxveD0M7NqK0ULpi/5zYfIABds=;
 b=KtvwUzoaYXxZbvP+rppeJ5B2CfALTsQg/3FTwCuwogSyZOkycfRs0gsadVFJ/dLhY57HRRrFZqB5KPcJ5EHY2A/aL0uNMvurbDxv1JO82m9zUgpRNJ/vLnjEopGi9GTM8GWW5ZyD4eVeUTUQXTfy6x1oXYySUli+ShGhNAUXWHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4917.namprd12.prod.outlook.com (2603:10b6:a03:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Tue, 19 Jul
 2022 12:33:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 12:33:55 +0000
Message-ID: <ada7fc21-17e3-d3e0-5316-55ee6669ccd3@amd.com>
Date: Tue, 19 Jul 2022 14:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/radeon: Fix comment typo
Content-Language: en-US
To: Jason Wang <wangborong@cdjrlc.com>, daniel@ffwll.ch
References: <20220716035732.30449-1-wangborong@cdjrlc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220716035732.30449-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d1a5e3a-edb7-4d4b-bb9d-08da6982f1cd
X-MS-TrafficTypeDiagnostic: BY5PR12MB4917:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: roqHP2erNd9YhMTWLTPh2k2QqUOdrXZTJXD4rbMrj1Y2VqetexBD1Wg3sHitxI8AtwNpEYS1WWo2d7PiJC7MVjbYmsR6GNgjJQDEzpPOXgETLkwVniPjfWxBh2EbA7h39Z9MHG7SQD5iiMXNmhTM9Owk9lXDjnmbu1r1F/xI/ay8h9A0AjvI+M2oxnQ8W2jjJGlpH1L9UBIIUyxZ1WkyZmpSM2+PZLjLkTCiWXRA4pQQncYSjjFdM14uJyuQJZVOyUGXE1CVUaDwtZj5N77rhsi6e/yWOtB/uDQ+hvVwU/f9fC1HJ3bSpoiS5t9wxgirMa3SyY8hu4YfXEP4NUXqedy/5Mu3KpEcQLNVWc5xrtuW2SWdXY+ngJU8hQ0ze/M6flHjz2if+sWwcRZO/gssLnBeAiWbFGRSIpi++BiM6Gu9R6dORy4eMLMHGDTjR9Ob/OiZYNdMadGyxzMIV74NRWm9eTaqHvU3v0HcZGzagcG4i6S52xF0g1pInkP6VYbfGVgPFS85j9jJ6PaDwEsunJIT8i26uiTR+LdnAnRmBPcgWI7p9cOUSooUfR+x0xNYKo1Pv8/xrowYUrnnx4AMyHZq76Qt+hVdUKnk4WE2vUggBcy77aYVFi0DvkwTCdGBwSyRPj5XcGnbcQBChmx8ikAzajHNxT15c06ZtVJqPDV3hFkpzKzh75TUqipxF5/EwXSTEW8lFos9RTjp/XCtZwvCMbExNZ0x7PLJ5uuweHsbzdqdiG5bkV+oc8il+4AbH0Is1y9mo8E7rBhjjlOnCPvGZ62f1lrBAnpzL9f0Lo+6bg8DtImM2+KvWKgNUHsCLd4DijRiwMKjFjVqQvtyCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(2616005)(66574015)(6486002)(66476007)(4326008)(66946007)(8676002)(66556008)(316002)(31686004)(36756003)(86362001)(31696002)(6666004)(41300700001)(6506007)(6512007)(8936002)(38100700002)(5660300002)(83380400001)(2906002)(478600001)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alUzeTRCdXN1T2FlWU4vZWpzVnIrbHN3R3lpYjM3TGN4Q1RoWTEzOUZsKzJ0?=
 =?utf-8?B?cm1ySVlVRWJ2ejAyS3FyVXZYblB5dTR4MytTcHpNbFIxMFdDeUZTdG44Vkt5?=
 =?utf-8?B?THNydE5oZlcxdXBKdEhkWm95Z3VTN0ZNTG1LSk5WNlZCcWg3R1V1YUJUYzBl?=
 =?utf-8?B?SjZ0Y0xjdUxSMDVvS242SnVpWVZpZkc3bk1oU0djaHlqTTZtdXE0MlRQM1VQ?=
 =?utf-8?B?NFAzTFJOSTdYL2FteDRVc2FOS3NOSVNuOFlmRUVnTCtjQk04T3ZOd2tMUjlC?=
 =?utf-8?B?ek55Z1VvSHNDSXJ2b3F3REVNSllMTXFKd0RmNGlzckkzbkE1THQvUWRFQnNk?=
 =?utf-8?B?R2p0K1l0eG83T1ZwSDZsRnVMeWRiUVcwWlZvMmhGeHEzVmZSOWI5U2YrWllE?=
 =?utf-8?B?LzVvUUlMQmkzb3pmallmTGpiNHozT2MxbTczbmRuWnRLUlFuRWN6dEQ3bWR1?=
 =?utf-8?B?V1h1bHBJc1hTeUZwR1BacTU4Z2ZHSXBXMHRnZ1lhM2lvbFN3Z0h5bm1uTE0r?=
 =?utf-8?B?YjZrUDA1eUs5S1dCV2JlY3R0ck5VVVhVOGNGeWxzbFZTUFFMVGVUNkluOUJH?=
 =?utf-8?B?aVZKb3pqNEViaktPSTFwaTlRYnZiTTU1OXJtYTlFLy94QmloSjlaUUl0bWhj?=
 =?utf-8?B?MkdDYitYYURITTE0VEhPeER1ZDZod0V0Ulc2c1Q5MEw0SWtGTm5DeTZqakVu?=
 =?utf-8?B?Y1BoakZCUlhkaUhaVHdnOGJzbEx5TzRET3M2TnNMNzFBYlFwNUlHemlnTHpY?=
 =?utf-8?B?b3ZmZWdFWnF3TlJlUlRlVjZIUDFSeFpCUkQrWW8reGxycGRNR2o2aUR5aHlE?=
 =?utf-8?B?Zjcvakdic1hSNjQ1eFZyMm92dmpLckdwa1NMb2tIWUVzUHladzNvTDBNdWd0?=
 =?utf-8?B?ZW8ySEVWK0Vpcmo5RzQ5L3NvbWVDQkVFbE93cnAyRk16bDBMV3ZPczBaQXFR?=
 =?utf-8?B?VWROK1drWTU3NmMydzkxK2gveFJHU3pzeXlOQ2VEdU91cDRJdXVLUnMvZ0pZ?=
 =?utf-8?B?M0RMNGNrWERmRUxSOHFYeEdNVzF3TFlDNnVVcG4xTFgwOWRhMTF3WVdzLzdT?=
 =?utf-8?B?MnJkbStQNll1STl5b2xIVzVnYUZPb3pYYjc1bS9wY1pWUlg3cjhxYVIxRWtB?=
 =?utf-8?B?QkRiTkFQS001OVJsNXh3NHdhK0lHSU00S3pPdnJzdlFZYmNyWjlZTlFBU2kz?=
 =?utf-8?B?dFpSeGtQVHlNcWpTYXRhdkl3eXEvSk1NQmVzR2FUQ002RmRPdEE4T2I2OTFP?=
 =?utf-8?B?cCtkeFFPU0RWY3Q2TGU4N3did2FleGRJQjZjWWZLMHc4bXVDQlR1NXVxV1Ni?=
 =?utf-8?B?VmMvUkJ1SnluQmEzREFNbzE0MWhYRTRzNEpHVGpWd1NUbjZUbGsxRGJidi9C?=
 =?utf-8?B?ajQ3V09WQi9DRDZSc0lKQm9VSzFFSmV2VTk2MjR0SEsrMkpUa2hLV0p2aUlZ?=
 =?utf-8?B?a0tPUWFDK25GTW5pYmZPTWtMejlKaVdhdWdQemNKZ1UwWmFtQmNrNmZ0UlpJ?=
 =?utf-8?B?K29DTWRFclNER0NJYWE1ZlNOVXR3V3Z1RWtmOWhIODV3bEx5WDhra2lvTjdJ?=
 =?utf-8?B?UkdGN3BqWUVLeldSTWYvNHFiUnRTQXVFeC90dy8yRExnOHQxK0NmemlnbW1t?=
 =?utf-8?B?RkJ4SVlsME84VlY3VWpiR2RLOXpCTCttV1FwMHUrWkR1VmxpQ2NJNWw4dHNn?=
 =?utf-8?B?VGdPTDVVeC91ZDhUck14TFg0TmFRZ0d5UHREaFRuNm1VKzNTelJwOGwwNG1p?=
 =?utf-8?B?aE5yVXhFOFNOU2hNYlV6VFV1d2lSaHNQclBNZ1F4OUhxbkkxL1dmTzFXc3Yz?=
 =?utf-8?B?SldrcFlzVzYraWhEeXhhZkZTRVB5bS82bzVGOFVsampHZTNhOWwwYjNyWGN5?=
 =?utf-8?B?ajJubUw1c0kvbGRiYlQ3S05UUDBCeUpLcFd3ZzFXdDJNS1pGQVhCbmtNMXVW?=
 =?utf-8?B?U0NNQXpnRDQyeVRGMUFrV0RmVnBDUDcxbmQ3ZmwvbHhZMWRzRG40SWZ2RDFE?=
 =?utf-8?B?Zjdlb2s2VVNXYkV5Nkl1d1gzZDIxdUhyd1dOY0ZwbjNMK25ENitWSXdDcFY5?=
 =?utf-8?B?VHhDbG9tL1BsVWpBVWxuZzFYT054MDRwWXZ2OE1TTkh4TE9oWGJ6aklUdjZu?=
 =?utf-8?B?RXdCakRDc1J1UGpSNENsTktGSHloSXViV1dsOFY2Tm1WV1IzblVXN2NWaTFx?=
 =?utf-8?Q?25yTLEuEHFhMAeiycNQxLloa/HvdEFh45z1tMliflRsE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1a5e3a-edb7-4d4b-bb9d-08da6982f1cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 12:33:55.2147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyWDxykkDZisvZOxehWBjnqbQ2xlKMfAHZQihyDr0iz4EFaHJahVq6qr4SfUJi/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4917
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.07.22 um 05:57 schrieb Jason Wang:
> The double `have' is duplicated in line 696, remove one.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 84843b3b3aef..261fcbae88d7 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -693,7 +693,7 @@ int radeon_gem_va_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	/* !! DONT REMOVE !!
> -	 * We don't support vm_id yet, to be sure we don't have have broken
> +	 * We don't support vm_id yet, to be sure we don't have broken
>   	 * userspace, reject anyone trying to use non 0 value thus moving
>   	 * forward we can use those fields without breaking existant userspace
>   	 */

