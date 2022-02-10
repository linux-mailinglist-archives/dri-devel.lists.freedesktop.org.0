Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 589984B06CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 08:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DE510E725;
	Thu, 10 Feb 2022 07:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B91910E71E;
 Thu, 10 Feb 2022 07:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHWUEmzWH3HjJ+pI8P5JKtPejoaVRL1dLLslb3+c2BdjVboAsEXMnO7CRH8GTGU6d7TMK+1VWnrhQ8YaAD0zkDwoUZRgMJHEx3EYVBaVB1UcX12yU5rJUS72p/zCJyFgYO7NtkKBht614+9vT71ACLJ9Trlm1G6LmboS+IP6QPEMamC3NGT2NgXzo7Nl0lv8geSHkBmF/i6zE84rkFEXVh89Jx07J+Bk2IXJOR9wLACTwP/b3aZF1J6JCa7e62SINtUTaNxvwif6qizm/4+W4LWAvOGOrdOhDtfH02M531lKQLJwamfN9N06Hr0COLe6l2LVuTe68FksXsM8ctxuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BYENhU5l6+qMd67dewRKFynBxUyG+PTBy7Zo3yQNA4=;
 b=dDf2O1emNkxI+MahhrmXLuZ3aEu0X21B4KirDEe7VsjbkB7HMc9duqB9e/+gMSchL2HgPu/51MibpYgf7Ecd8IT3TR0CA68eFIvgaHEszy2TX7+W0KHDar0KhIFPohY9L7i9VMZAyr9xMyFt2b/NowW68zfhOeiW2SdSkV8x5xlQlHzanJey1A0nQX75fOx57Vf2Ju6tgbwUfkxTTZ6zEeku+/XLWiWYvoXG9ZRdp3EK0NXHrioTBMSzt/ThAB+dkX1ic6jFmAdUJYUuFTfBLO0DJJBZKF4iA5s2IQcqn9SOQCaDlQxctgPyHnKt1ohUthlM51u3yLZfG7wsijcenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BYENhU5l6+qMd67dewRKFynBxUyG+PTBy7Zo3yQNA4=;
 b=07QBGciazRfguCA16YCXtp6EHMySaMqDK4spjnkA/ETX9cSZOJBoFLcHn/y6GbbBawKkaehpr5277sa4b4FSVJ71ALYlSPSHAn/hxfhh5ulcPKT+YH6JD3EyUVElRErEekcf20MdpjSKWe6IXtUI6s4LG3mYTt8FPbZ+rfsmObs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB0075.namprd12.prod.outlook.com (2603:10b6:4:54::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 07:06:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 07:06:47 +0000
Message-ID: <8b125a02-3fff-b3c3-0827-c31748446ce0@amd.com>
Date: Thu, 10 Feb 2022 08:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Fix compile error.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220210031724.440943-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:203:90::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11457c42-3860-4eed-0dec-08d9ec63e727
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0075:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0075E7D8E491144C66A55C20832F9@DM5PR1201MB0075.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:160;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/pLQNzb9v445y2Qr+4ZiKGq0HjmY4FV1Hgj+KCEz3FUW+3jZDkcJChX+zM8k6ARGlZjacK7fv3wyABZ1R20ciBxKe2fnXBy83pxC4vQgM6WsOAG3o8SwbzGSt6BKnRHnCjs5yF1qchh59w/N5pCtssiCYo9TJnYmw/jjWK0f9TBWDccotrGjbP8wPi7/7Qt9KX/fCyrN/kd775r4MRahjDKpQyMhZqi6BbePYxpR+rUmSSfoaDyuzupA1XSOx5vb6hiDRgm8xpW0Xod2NE88XwTmbOgB+0MHDr0aNXauKCfSDoYAJtwhKHVfapNkpgWgZRpQMQa+DQFDhcX18JEe0POUgSwKqto5Sf/Mv+islXvfbpHoj/RWVxBpC5yBZp5I1StUgQ/EpC3G2zhBbSwZgcZtJahr1+tVZQjmzK9p5oUy1icB36RYw4kgyusO7PykNqOgmf7X5UpUr9MHMnt9rHfnRGDYRf89nRraipHvkUDT7M70s036pwOWyAyL6K1rbsJDf3DF3ycM3ovOuuFTHBTLUuKVxK1GGGsW5bpCMPPC17ZaM2ssvOVkdvuA4N1jnoJh7FI4p072B6vZzpS5SKCGoRcU1PZfEOulUg3GPXAeELzx/ZIemKOcy33r6A7c6c1bhdx5d4uzvTttcrDH2pNMqwQq7GSj83F28pAfX2uFBmKzZcJ7Im8Jb7zIFT05f2FMvCx+kSa0XCA0hG8bRtWhpWnlZn8x6Ztu9BVZQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(2906002)(31686004)(83380400001)(31696002)(66556008)(66476007)(6506007)(6512007)(4326008)(6666004)(8676002)(186003)(26005)(66946007)(8936002)(36756003)(508600001)(5660300002)(66574015)(86362001)(2616005)(38100700002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3dNVld4WVZaL3B2SndRaG16amlUeXBWM0VOZkdtRHVxakFwbXk2RkVvZDU5?=
 =?utf-8?B?SmNtQmFRZmx4RjR4QUpmeHlMcnEwOUczSVAzMFBzOTJzSkJxS0k0R1VvNkdH?=
 =?utf-8?B?b1NCa2tLcGZKbFJBdUJUVGZWU3BtY3h4emZRNVl5WW5HQjloUEloT0EwMEd6?=
 =?utf-8?B?c0pabVVKbHhsd2NETHhYbUV0Z0VIMmRVTW9OQzkra0xDelJMb25mcUhsRkx4?=
 =?utf-8?B?bWpEOUw3WGFIajZzOUFaSHNUckZ2LzZMdWc1M2xUYjEreWRMZ2Z0citET0pl?=
 =?utf-8?B?aG55K1g2QTRuNzZrQklXc0F3UGp2UkthT0xsOXlOTGpWa2hkdXBjWXhyQW5z?=
 =?utf-8?B?cUVKT1hCUDJ1SncwM2pSZzFnSTVuUERDUjhiSVFIQzRoajc3dUt0WFB5YzJB?=
 =?utf-8?B?Yy9yR1JabjltcU1UL1B0b3JaSi93emhQTzBWU3BwQ1FmNWpEWXJSYi9iYU0x?=
 =?utf-8?B?dUFObWoxcUdiTFRWTkEwTEE1a2FGc3lBMk8xS1A4ZGxpQmhCaEtaMHIyR3NF?=
 =?utf-8?B?dXlIblN0UjNNQWpnT2didnBaYzhSL0JsdVJCWUJUS2dSZ2xxMmQyMGJYTjdN?=
 =?utf-8?B?RG41NFhHdTdaYlRyYVVqYXB2aUJFZ0hobnBJZjBHTU44Qmoza3NsWEdKRVVy?=
 =?utf-8?B?b2FVVTc0bDJZenkrczVBdUxzYW1yZk5oK1JtT1FWMTIvZktzdHNvREdDd3Yx?=
 =?utf-8?B?dFR3dFNMRFFLaDQ1Q1FUNmFWMklYdkxBYy9GSGtmT2ZXc0ZFYzBoQnNadDRU?=
 =?utf-8?B?M3o4cnBiRTZldGdtTFNuN2VyOExzQTcrMDZLSkh4eXpDeGMwRitmNFVvRHdx?=
 =?utf-8?B?dVBQTVIzZElpZllsenVPbHFPVXJNek9GMHU4WFpSQWJ0TlNESmJwU2ZlUWs5?=
 =?utf-8?B?TGNnUE5IT1E0N2tjT1Z0amEvU1gyMUZRMVJEMXM3UktuUXUxelNiVXRGNGV6?=
 =?utf-8?B?ZFJjZzBSQXlKMURPZ3FuODF2aWpuc0YxWnJ0a1dCMTYrNmdwZTQyendLKzU1?=
 =?utf-8?B?NU9vUE1CTVh5eGIxY1V4K0FZcDJHZ3hVNGtBL3lHZVpkRzFuQVVwRVJoS2l5?=
 =?utf-8?B?a2FvSzBNSndXMUNpTFdyUm55UU9IMFhGSzdqMDB5RGwvdTNoQVZSclFkY1VI?=
 =?utf-8?B?cTdkNks4MzM0d2xmK3FEYXV1Y2Q1RWtwei9XbHVOTndkU0llT3hCUjFyZGND?=
 =?utf-8?B?TlFFSkkxbVFCMlRjY3dEcDVxVXJxcHRMWjBjR0dBSEZDUE1VWEpCdnJCTGwz?=
 =?utf-8?B?S0g3cmw4Ym02Y2l2TVVBbTNhNzRDalJzZEg5S2xydHY1SHV4UHd1cE41Y3lo?=
 =?utf-8?B?TkhEcFJJQkw4UkhsQ0xOVFNtMHJGdGxoWVFLV3pwY1QrYStOUVBheVlkRWwr?=
 =?utf-8?B?UjZ1b1pqNGQrNXF6UWl6OXZyWWpydGp2bWFqcEZuTmpxNTBRdGxlTkJqUnNZ?=
 =?utf-8?B?cnVEZXBiM0xEUElFaGp6d0RIdUtSc0czTkxWMjRPTHVOOXhqUWEzSG8wL05m?=
 =?utf-8?B?MWZEQko5RFRvTFdrbjk4K2RDUVBJSHlMbGhiK0xxNXlyODY2dFZvTXh1SmpW?=
 =?utf-8?B?V2pmM1ErOG5mclVaK09pcnAwWE83WEpIZTJqLzRqeklLNEk1aHVBRy9uOWUz?=
 =?utf-8?B?VEpkWFphWDdGc09uMjhlaFYxNVFvbit0cHlaVExXQ1R5S2RaWlJGMnhVNmJB?=
 =?utf-8?B?WXJsOXBzclVicVpkcVlIZzlFZktNWDhHVDB1T29sL0x4M1EyZDl5TDBCZTlU?=
 =?utf-8?B?dDJ2bDdvWHZ1NnhmWFY0QWxiY3h1UU8zRUorRzNDWk9zeDh0dVhIem1scUJy?=
 =?utf-8?B?aWxtc3NzMmIyS1RYczNTV28zYy9XRkR2K1g5Nk5DcVMwTHpPMm5kQWt5bGl2?=
 =?utf-8?B?cmlHSWQxc0t3WUFTNTB6Vkg4QitWWjhudzg2L0crQ21uNmJkUStoVGtBMFkr?=
 =?utf-8?B?NTE2cDdTblIvN29tSGZNUHNGQyt3S01qVzdndFhFbUIwL21XM214QzNvUTdC?=
 =?utf-8?B?MmV6bWZheGJIYW5uS1JNSXNHcEErNndnWHdJZ0xDVGVOblFTMWc2K2JEQzRr?=
 =?utf-8?B?M0hXN0pFODlBeXpwNXdIYTc3bUV0SndOTXQ5dmRYdG9ldDVQNjRrc0pEK1VQ?=
 =?utf-8?Q?UROA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11457c42-3860-4eed-0dec-08d9ec63e727
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 07:06:47.5368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTuvDEUqLjlpfTolK3Xt3+QemGutV1lCX4PFXnyHdfiQMd3Uy61GtYPRY2TE3urk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0075
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
Cc: kernel test robot <lkp@intel.com>, horace.chen@amd.com, lijo.lazar@amd.com,
 jingwech@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.02.22 um 04:17 schrieb Andrey Grodzovsky:
> Seems I forgot to add this to the relevant commit
> when submitting.

Rebase/merge issue? Looks like it.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 92de3b7965a1..1949dbe28a86 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -118,8 +118,7 @@ static inline bool amdgpu_reset_domain_schedule(struct amdgpu_reset_domain *doma
>   	return queue_work(domain->wq, work);
>   }
>   
> -void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
> -				     struct amdgpu_hive_info *hive);
> +void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>   
>   void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>   

