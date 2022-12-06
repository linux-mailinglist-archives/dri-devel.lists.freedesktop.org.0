Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CA06441B0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 11:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A8310E004;
	Tue,  6 Dec 2022 10:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243F910E004;
 Tue,  6 Dec 2022 10:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePmQdIdHM1UrRAVYvq9NX+9WAxVca+T0jI4NCXOTmCiocuI6rvxd558YU/2R6X0x9aGeOY/V4kWZ0LSZn9XSAEdcW6B6UZH3DQfIhPKYkMlih4VhndHi9B/NRnrmAyhLrPzVsiHeshn0IBOpOzdBhvOHM+KeF45FFNcbA2VVrtL6MBCgSHOOYK/V7JXHA3+hqBgGmXDpe9qcLJd0WovgteoYxguxzAG0IObVmjeoedjKsFfRQkN1EEIdLYi/RxOHR4RbD09LCdZKlLukwMjIBTYXXD/j9oeFVkf6DkUiLU9V+N/a4gqYd10xJyOm4HyfacEkHLyf1+8qbWWfmrUXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgNAFKmgmDM5b9LAjs8uNQ2RpEN9cGhNP9I/Q3jRY7E=;
 b=axwLPT8bSaj7SEaTR+ecGtrYHn0aY7Rx7NRTtEnUM8BNTVzTgf+SKSbk1HjqbFPRuM1foqY83IrPOycXFYek13oiHmsC8i2jAGk/d54N6M+EaiRYYKsMbXhZI1ZQ545mW30ykhCsUSCQwVBOb9QqGPf6kTx5KZqkhDDSunZgSWqHIW5xw65OulAdSSgbwXBB6B7yl98x0DeCECLnL/3IO8b+lbTkrf0GSWpqzUQVP2nPRKm4sihywKgDFQPHToYejrUKJuoe3mtok1+ujPHU2bR5vd2IhdvgA67MbUBT5Y54iz7rj9y22XElhVY+qMGj9UOrsjvPG2ksdorEOLQ3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgNAFKmgmDM5b9LAjs8uNQ2RpEN9cGhNP9I/Q3jRY7E=;
 b=eF3S5LGBOs9UN/9F+34+cErJOm73F4M0JJaWuBKAOJ9HVox1YYEyI7a2UkqzPyVFdexioUmlCOgfNh8uiwfrXhyfpK0VrB6X8LpVHeLoxyJzlkAjBzAenbYEuoBR66zGatK2S0v0JKGOM2h06ylquXmI40p34GYMjcjt4nnHZMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 10:59:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 10:59:07 +0000
Message-ID: <53da1f40-c305-b70d-aaf9-8d2e23c64349@amd.com>
Date: Tue, 6 Dec 2022 11:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amd/display: Added pointer check
Content-Language: en-US
To: Denis Arefev <arefev@swemel.ru>, Harry Wentland <harry.wentland@amd.com>
References: <20221206104757.31512-1-arefev@swemel.ru>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221206104757.31512-1-arefev@swemel.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5ad54b-8431-42b4-dd00-08dad778e5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqH+WXMRF+kr2A+v9Z3eHydzpxEtsZDZDK7s/pU5OQCGlNyZoma9x3GLbMc46C80qbU3wT7newDbXyEjdEoZoiBPrMuHkNfNEYTfO0dltGFy0nG+MhwDsxRAumWhXMAnQfcWsInD0zXs3HkChEahmdCyGkMTIJ4ECN7GsSwn6r09cpbDs+4Ic0/uCaq88zZUIRLLkCw4bg/Cx16SqQnpjgJ5rrinXKVoRX2HyGvif0ZiyByXshvs8WDrmEcRIcUhT6+YrBvDHPGQH59b+0hJBrltg6ucQFhuKYg/cDqEI0Ira/8cOsfV9ShydF537PCksjVkeHsuFblSwEk2z+xbBNw+plo+ou51sGxL0gIOPLYQoc8Q0JYUToZF97cC74pC2zChX8QDPtqhQ3Rb4ZNHvZvEWRELmUVdLk0bIfwL8TTmloEJn+V00i7IuS++GZzmahxkEj1tRb2xEaaF3H/q74pR86QjALMcmoH3akTq1xAyxkTqUFmpQRS6swEDFuV67XkTmA3gtoZxAQ74iEEdXY3OhoinoHm3Hc6wVhxG3e05igCIBZ9K7v905oSOm4SLmoAIF0pCBykPs7RCzH3ehTe3OsAXocewiAZHkxtlo24tm0PpIXizFsH+A0Q8wstjmNupf60ZiWSiaoyNeNdvEgXoYCrjcVbuy04aLNYauObSqzN56r8/aOi1E1OYnYPyeUxj8EpXVuWzBrgH4nH2hYxWBnGi1o0iQTtEJNQ0O1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199015)(5660300002)(6636002)(110136005)(36756003)(316002)(7416002)(54906003)(83380400001)(38100700002)(2616005)(41300700001)(6506007)(31696002)(86362001)(6666004)(478600001)(6486002)(186003)(6512007)(8936002)(4326008)(2906002)(31686004)(8676002)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JzWkVLNmg3MDZqNVI5b0NmYk0xQ0ticU1oR1MybGpWUDY1UEN2OTI4K3RT?=
 =?utf-8?B?c1cyQlUvVVd6RWl1QjNHWkp3VE1BbkhaM3ZwdVN4ME95dHRNSlpEWVN2M0Iv?=
 =?utf-8?B?TllpUFo0VXlWbWl2L0xHejVtSUZ1eGV1Ny9lR3dIeG5XREx5TEkwVzljT0VN?=
 =?utf-8?B?bVB1MGw4Skl3NmNrcktXeVhoT3phVytwWGJkeVhlV3NaTFh3WUVXY29rSkN3?=
 =?utf-8?B?eFU5RUFXZytZZlBZKzZOaFNnL3ErcHZtMTBnWHhtT015UHlQSytoYkNQRzNi?=
 =?utf-8?B?Z2k5N0t0QUdOQXM4bUlJb21ZVlk5UWhKSGoxaFFZUVpSMjhHdDQrVjhoNlNy?=
 =?utf-8?B?YkpqYnBZc1BGSGpGRVFoT1ZtZDhhWWQ0c1QvWnkxM0htemRTcFJpb3hEd0s4?=
 =?utf-8?B?MVEyQ01iNjlmVzVRenFwcnVXVTVGelhaMTgrUzhrVVdWV0JFRXdPaFVYZk5D?=
 =?utf-8?B?RDdMUHFVUG5iclN1NTBTUDJhL3IzOEtZRkE1QUdzYSt6TnpBNThiU2x6Y1J0?=
 =?utf-8?B?a05YVlVZWUJtdHRMZExQa21URGlLWG5IYlEwMmd2ZlJwN2R2Qm5GQ3hrM29t?=
 =?utf-8?B?NmtuUW9wMHBKbWI2SHJiZitISlRBRHE3cTNiWmtKQ0g5QU1zNEl5UVBtTHJ6?=
 =?utf-8?B?Uyt0UUJGK0c5WjVndmxvd0ZpKzQ5OVRSTitBeGdlWWdtRkRRR0xlaDRxOWp0?=
 =?utf-8?B?U0o4RmFWUUg0b2tlRndwY2VvdVhkWXUydWVWN2xUM3JyZVJ5Ti9yZzRKM0JH?=
 =?utf-8?B?R1p4d015Wk9DZ3Z2SzltZ0FwaGN2SGVncXlUZXNCQUtEZXRTTTc5eEd6bzdN?=
 =?utf-8?B?ZFYvbHV4b1VrZm1GQWFiZGRXUWFsR0VlWmRtOTVFbG1KNXRnZjdIeEJmT0tr?=
 =?utf-8?B?UkxSYlMwcFh2akFLSW1KZmFiRlVMT3dqajMyUzh0ZzBoS2RYSU5OSDg0T2Y5?=
 =?utf-8?B?Vm0yZ0R4cnUvV1JrZFQvQTRNQ2hlWVZxSXBWM3h4cnlaNlEzMXpqNTFuZzNP?=
 =?utf-8?B?eXliVTZxcm5UeEwrOUM4RjloZk0zQ211NFY2TVkvZkRpc3UvVXlJaGhxdnB3?=
 =?utf-8?B?YVlVNU1XS0pnNjVsZGpTUWxudlVTZi9sZ0E2dGFOSnFERDJHcUNKampVa1ZT?=
 =?utf-8?B?MkhQNkpkNjRXRENSbEVhN0s0a3Y3czg3OGFPN0VHTm1QdGdMWFpwWXRENlFh?=
 =?utf-8?B?R1NNYkt4YnFkUGVTNlphNDVlcGdLTXkyTTZwN0VPRVMxdE4zbmxLMGhBeVNy?=
 =?utf-8?B?dEZ2bnlBMmtEV29waW5iUVlJb1ptd1ZSUUF1MWJxTXp6WmtmT2RhcEdGdmtM?=
 =?utf-8?B?MFpZeTVFOVlkWnE1aklBazRNNURXWHY1NEZHejlHQzRTZVQ5S2tybWRiTXFQ?=
 =?utf-8?B?Nkk5REdSNlFqYTdjUHFXMVVJVjdpV09oMEg3OUtSMy90MnZCeVRLQlNUQStt?=
 =?utf-8?B?d1N4NlZ5dGtHd2NJc2czalNHQjFjNXBTU0d2SDFkSk1SaFlHTHArWFViY3U5?=
 =?utf-8?B?U0g1eFErSGtoSndzR2xJd1UvN2l5YXJzbzFqTjkvRGZIbFpyN2VpVkU2eDl4?=
 =?utf-8?B?QUI2UVNFcXJIZW9CV3dHb1grZC96QkxTazE2Y013V2o2ZU8vTEdyREV1bHZo?=
 =?utf-8?B?ZlNJaEF6WEJ0R0lwYmtoUXp4NjIxT09lWHhxSnhZVlNYL081R0ZwTVA0TGpk?=
 =?utf-8?B?YzlIcDU1eGZjK21oem5NTklGZDhTd2Z0bTg2bktzR25lT0FBMThtb25hclBZ?=
 =?utf-8?B?RkJDZlNHOHVob0s0ZFBPQzY3bGNWZy9rWURITlpuWGdjdnZSQnhMOVAralYv?=
 =?utf-8?B?eFY3YnZ2QjU4Ni9ZcWxCM0xvZlVxMnZlZ1dza1IxR3NFRUJxaE5TNXBxRkNR?=
 =?utf-8?B?MEdJRW80MlF5cFgyRkdvaVNWTUVwMytZZXFPODdPejBEMmJ4dmYrSVVGdFBZ?=
 =?utf-8?B?cjdGdlhRczlIK2dCL096NmxaRVVHMU1yL2xERTlUZGxIb3piOE4wbWJESFNJ?=
 =?utf-8?B?OUp2dFlwcmE1ZXE4NytBRWlZaDIxMkZXbm1ISDBLdTU0eHJ5UGgzclVLOEhM?=
 =?utf-8?B?WGQxcndDbFhUa0pRTC9SZEErZTlMejM2VEc1cERhbnVWY1FCRjU5YnUzOXVs?=
 =?utf-8?B?WkZtRFlDZW1PcHVjOFNxbkpiR09DT0pUZWhpNzNxSHZEeFI3ZVUzbUZoa2Zt?=
 =?utf-8?Q?hVE6QofllHCkWCtWM0AvPwtzu+a2H9ethrxzKoZjojsl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5ad54b-8431-42b4-dd00-08dad778e5a9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 10:59:07.8008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4Y+WrFjV4ek43yQtzaOLNOVvppRntC4QNq5ttG7OdtE0fzR62nBmUIDMYRVIjHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284
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
Cc: trufanov@swemel.ru, lvc-project@linuxtesting.org,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, vfh@swemel.ru,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.12.22 um 11:47 schrieb Denis Arefev:
> Return value of a function 'dc_create_state' is
> dereferenced at amdgpu_dm.c:2027 without checking for null
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0f7749e9424d..529483997154 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1960,7 +1960,9 @@ static int dm_resume(void *handle)
>   	dc_release_state(dm_state->context);
>   	dm_state->context = dc_create_state(dm->dc);
>   	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
> -	dc_resource_state_construct(dm->dc, dm_state->context);
> +	if (dm_state->context) {
> +		dc_resource_state_construct(dm->dc, dm_state->context);
> +	}

Single line statements shouldn't have an {} around them.

Apart from that I think error handling when dm_state->context can't be 
created would be more appropriate, but that's something our display team 
needs to look at.

Regards,
Christian.

>   
>   	/* Before powering on DC we need to re-initialize DMUB. */
>   	r = dm_dmub_hw_init(adev);

