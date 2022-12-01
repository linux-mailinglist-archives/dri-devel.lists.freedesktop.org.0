Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47263FA13
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 22:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BC810E184;
	Thu,  1 Dec 2022 21:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2075.outbound.protection.outlook.com [40.107.96.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C02210E17F;
 Thu,  1 Dec 2022 21:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiBhTNscCwRLOCVrGn3PIxilsVkETQgZ8xMW90QYjyIgaczRZS8Yn0611j6oved45PpUAG2DX2UIE7mGAmPfNMO4PHfnEWsoiHUAXnQfWxOR7aIJvqrOYhUiBPVT31WEhyMCWa0ZXouhZZw1MjNXQRhac1WoZxQCutTzAllN/DzIX6JiCMws5vO12KhsuwvZwgcYiisJ0RP1ie5I6BMOZfmmwG/vH5qXRO2FPqKf3IwJFKdZlGqzF3xvIRuQ+y+bOmBgU3Ws/RClUUEEV7ho8HenUme+tWsIOgsLyMSMVGY1eptNX0vEwp1XqQQcHmJ3smJQ2/nupYxPyrM2m0oDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+CkvHGLmrV1/BwqVdC2cQNeywJ0Te6o1r1Ak+NlSb4=;
 b=l15w7+S9E36yTNgM/gzdyZIdumbMLvXRC7bMEz4M3vANjWDSsIZCIcj1rSKEALd1sEh+pmHSvRvKWs54SARgr0rr0r5AFLZp/QUgWJwecwZ/ObK46ggPZ9R0SQPoZJb4Pqi9f9awNMsMYnD9pXGIJXccecGGS4C1yPdD3yFTVz64ztjOZ9bZi6fxRHVpULa2C3jxjUUwu20JGkPBGAqBx8M19VBHydm5MmfMWU73BMcSxA4JQ8szGFCZ80dPlyPVEQ+tp60G+5UbwZEQd6lpal/e7z+CTc/v+krOs1foM5NZESIIAkBdt5DZjmf+Q31RGvObRhFF6++EegjFkv+xmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+CkvHGLmrV1/BwqVdC2cQNeywJ0Te6o1r1Ak+NlSb4=;
 b=3AYmMj11X+VIJiTQIsMfm/kMOUcTWjmU2WgTWNHOuzwOY1iIb+mFQ/1d1X9OVw4NWeV4BmVgNABbl7sh4k9/jGq5iPJrBKIzyxLCf5VJSDKZkQGhfXMPdhqbIlea5gPHlw1knV1Vip2Nux3Ilc7vFJZKeLuVqi2jmKh/4/tr6kU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 21:51:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 21:51:07 +0000
Message-ID: <36f2e82a-4f60-bc85-3146-e04ce68923a8@amd.com>
Date: Thu, 1 Dec 2022 16:51:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] drm/amdgpu: add GART and GTT to glossary
Content-Language: en-US
To: Peter Maucher <bellosilicio@gmail.com>, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221201153820.257570-1-bellosilicio@gmail.com>
 <20221201153820.257570-3-bellosilicio@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221201153820.257570-3-bellosilicio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:610:11a::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: fa102f14-a795-48a7-7175-08dad3e626c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f824i2mS4fiMI54CC6ZleWniDl6kZD7sfqzgqVF+Fx+BKJ7o30JJP8KDNBhSVni9h9Mtm3jCv8BCQfvMGmHRErPtHHRj3DCQghGhDPCy2bbiCcu+TexGY9hdbhvNRQjXcn2HTPPkUKdYbljqcM+6/MhjBDuU1d/NK8Q4y8e8Tz54ZR1gWLHvJH27SyBurHdyg4Cm+kn5c2u/8xtt4ZEgoBgT2jShPdCMw0PAxoHkzBarpSDQnFrE3orLHSN8hItkxQA2UDjalBg1NGrNm0y0O+EP1zhN5A81jwxui6ETx8KymhtAvN/L79CuTh23CR8DQy4arezmdZq/wzrp0zocawovx/m0oAmgspnAbMUgCuYdNU+DPYBKmBUoY8nfxZsKElQD8+gYRLzi7K+02lSpsmYm7hphJV2kHzRCk0V4WvVeBsQLiDcqV/u1qbtVIAqiNGn/AS/GALSU7cHIfAW+y1YQMmT6AxceL1W2Ct6eeLXFGBBR4tbzDBK4yvr0kVph/B+80OxIRGjxUU6mP6vr5ZY5o7rl/ElnzJK5fo53PHKj6SrfouL2FFCt4qAgYmdkc1IResJZl4x8mSfEfv/whlOANfyFQ2rVhnW3o7f4uarb5WvbZp8XTmQSAfSsL2yF/7CVDJcxXSBetw+oebchHLWWsBmI15xNwUmaIisFmxtx6jKGdCKDdbYOO4gpmh7tZT5f+etXzxwIgRDjKJ9Ckczr3ScSeFC9YyMhvmlyY/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(2616005)(186003)(31686004)(316002)(6486002)(478600001)(86362001)(38100700002)(31696002)(36756003)(6666004)(6506007)(26005)(53546011)(6512007)(4744005)(2906002)(8936002)(36916002)(44832011)(5660300002)(41300700001)(66476007)(66946007)(8676002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZThLcURtRk02TXpIY2ZrN0tJMWpULzZHdkJmTzJyaVBGUXpkWlcyWU5PSHhH?=
 =?utf-8?B?NkhKcnpubUxLc0dkTmxBMDlCOVNOVTdhcXMrV04yTGdXakdQd1FOSExsUnND?=
 =?utf-8?B?WHlpbHJla3ZMNmpkNC9KWFpGd2FJWUFycmNueHdMaXFRWTVOcVdxNzJ4NzIr?=
 =?utf-8?B?OXJYL0ZWM1dyV3Q3c1Y1cWRMMU9UaU9vT3BXME1RdmZaZkVyNmdxbDFnb0dm?=
 =?utf-8?B?VGh2OG4vTTRkN2RMaEttcGF3N2t6VUUvNDduN1lDa083MjFQL2h2dkFlOWpt?=
 =?utf-8?B?ZHg5SkFYazBRa3BLTHdFdktPdWhsK0ZkOVJmMm5PdDJka0RDU0ErNVNIT3JP?=
 =?utf-8?B?Mm9Eb0ZSRDFFUnVBTWZDU2pyVmU3ZUp6akVxU1pLajZpRVVpdUtSTll3Mmxo?=
 =?utf-8?B?ZWFlcUpIeEJMUlI1WHNoaksxc0l6di9pWGRaVytFbXlvM3Z5OFFFS21ka3VQ?=
 =?utf-8?B?cVRnVkQ1UURQaGIvODJSSVVSTUFUdGk2elgwTXRrODNacEpzSUFlYkt0aUM0?=
 =?utf-8?B?R1l6K0hCYkJmZ1ZZVHVEckk2U1FUNEh5OWJDMXdJdGd1c21uVHVmRWpaZzdQ?=
 =?utf-8?B?MTJpdnFOWHpvNGk4VnR4SmlGaGJzUHFSenhpM0RFYUVoQ05jWGJ0cVlqOSs3?=
 =?utf-8?B?UUI1c2wrTVhGZ204bkxENW9TbmRqM0c2K0FxNTZnTURKNHBRRmRkOVFxY21Q?=
 =?utf-8?B?V0VvbmZpUmdzblQ0MzBnSWpqd2QvRlpicURMaks3TklIZWFyN0ZYSTRVTWhG?=
 =?utf-8?B?dURxc3hWSmIreFdwYnlGN3Jnc3pyZHpxakc1TkdPUXVIVzYzTXZWNmpXcVhs?=
 =?utf-8?B?T0lid0lBdnFueHNsNGp5QzU1UkMwaG5Yd01YWndhd2lBM3NnZ05kQTlmdWNF?=
 =?utf-8?B?a1diTlFTZ1BYb2NmUEtPSmVqdlRIdGlqdDgxcVU4cTNYaUg3N05LdEpMMmZ4?=
 =?utf-8?B?cHdpdXhhKzNrOTFYajdYUjlCaEV0bjkzREFsV1BnK2VZbU84S2NoZCt4bUM3?=
 =?utf-8?B?UmRzZXh5a0NwVTk5VW5RUHVJcWNzdVJrSzEyc0FoNFJVOUJXQVlIc3plZFRm?=
 =?utf-8?B?WlZBZVpMSnh5SWdRS0srNkcvdlRHNnh4YituNm1wbFc3T3V5TzRDTDdyM3c1?=
 =?utf-8?B?bTJQdThBZWJIS2p4aFZiZ0JMbUNQbG5XNkZsUVA2Z1djakNHQktBM1RKYWI2?=
 =?utf-8?B?bkFKUzErYjc5a1VxNm8rVm1uQlZqTHd6ZDYrOHdqTUpnSFVDN1pUVlBHMWYw?=
 =?utf-8?B?OHRtekNQeHE2WGNuU0Z2VnNTZzBZVXNxMUpUbWpsMGVjSkxnZDk3QUpZUEdD?=
 =?utf-8?B?TlBrTnpWQTU3cTVZWno2N3A4RWpOL2VXR3B6eWNWRnJqS2t5UTRKSENSbUpp?=
 =?utf-8?B?UzhaTk9KYjZqYUVtN3BXTnI5MkY0UEQxalhsUmJNOTE3ZTJyZUVDVmNnWkQ0?=
 =?utf-8?B?NmMwVnUyVXBucW5ydlArditROE94bUZaWHNIQ1hwZ05pSjB5SHdQN1A5VVN0?=
 =?utf-8?B?aFFZb05JZGJIQXFhbGQ0NkNaSmVnRzNIUDJVVmZsdlhzWCtDMHpnUzFNd2pY?=
 =?utf-8?B?UmVYM1hQZUVLZHFMY2ViaCswaXl4K2NLalQwY3NhWTFMUWp6QjZCamhkeGF3?=
 =?utf-8?B?ZlZSZ2xhT1pkWjdkWXpzYXNmaGZDRkhMQzAyZ2dQcTUwbWtEWUcya1h4MzRZ?=
 =?utf-8?B?QndxWnVMSzdsUWU1dWhGY2xLUTZVRVhKdDluVk9sZitnWlRGeU15eFhLd3lW?=
 =?utf-8?B?YWZ5OUJHSE96RVRjUEdpRnpxRnlLdHV2czhVdGVid2JzbUdrTGRKWVcrVnhr?=
 =?utf-8?B?dW5WL0gxWkx2ajcrL2F2V3FPdFpYNXBYNVhCQnRTMUxKU0ladndud0YzMWhV?=
 =?utf-8?B?bEJuUTIvNXdYQjl5QnJSZERSOHBUbm9zdkJDYlEyNUFIM3Bxa05oTzdESFNZ?=
 =?utf-8?B?Nk9tVitQYjFFQVc2cGJLRWp3dytGeUplWEJrR2N3djNraVc3clhjcHlDY0tl?=
 =?utf-8?B?YVcrV3RWazZ1dVJwSjVjTnltUmt4cXRhSk5VLzRKYnlZcnhaMmgyc0tYa2Jm?=
 =?utf-8?B?ODFjc2E5M0dma1htVUdjeVF0alh2VC9JL2p4VmFETkR4a095SjZXbVREOHlv?=
 =?utf-8?Q?vnZyRtEEbLgK96+S+gIFw0Gtv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa102f14-a795-48a7-7175-08dad3e626c9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 21:51:07.5051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFvQnwPK4klnClmVkcws4sOcTzcFWH121U64EjHiIGTUGgA5usf3ECNkFRc/rVa0nILHLfPT8QQG6nw4hoXCJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261
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

On 2022-12-01 10:38, Peter Maucher wrote:
> GART and GTT are two abbreviations that should be mentioned in the
> glossary.
>
> Signed-off-by: Peter Maucher <bellosilicio@gmail.com>
> ---
>   Documentation/gpu/amdgpu/amdgpu-glossary.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> index 326896e9800d..d86bea7926dc 100644
> --- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -30,6 +30,12 @@ we have a dedicated glossary for Display Core at
>       EOP
>         End Of Pipe/Pipeline
>   
> +    GART
> +      Graphics Aperture Table

The "R" stands for "Remapping". I've usually seen this as "Graphics 
Address Remapping Table", but "... Aperture ..." would work too.

Regards,
   Felix


> +
> +    GTT
> +      Graphics Translation Table, mostly synonymous to GART
> +
>       GC
>         Graphics and Compute
>   
