Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459518AF7A5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 21:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6979211363F;
	Tue, 23 Apr 2024 19:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JvUwtCiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139F011363E;
 Tue, 23 Apr 2024 19:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lv6/wySHFCnQYTTONWvFB489fZOnNEweOzKlkc0x5+BBWHfvi0LSVjjOLyFxB17lN0Ki9dqGpamE+Lz0hitruVZJKVi5DgiqVtxeK/tRr3qnsgEfRIUIfxnk39oFiRkcvfBzY2z+H2d+sxRR5SO/H9e/crHqH4KoDkpIyloDlD4vKzEt+q36W0QM+2EBjaW5Q6N5OkoTL4/+sSlTEHWEmQivcngdbY/J745QzZ2UWZ0+920b7y1uRBxfTZqwhqJ5NTxkRpW55O0tcRRSLip27p+BTdtofFmRbqapdch3j00IDbKkpEAdNTXS/8hOwuyUFsuVxjWd9GtNWy8VW/hDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CXDinjABTub6cWVZAFcd95qdrihVEZwYI8XvYt8k2M=;
 b=c8Fwcz+T+OeXXi9iriXO1k82zoX7VTxf8ZW78z4LBfVlK+lQeXX0X3l5TEnqbqYDJs0KWrygztlp+Pq0HSVmIiqiAuEAmvanxo1A/qtZYkTCjCur4Y2kXqs1xwhvuUEH1K4U4XhZuJNvtxgZmTUFPxHrVxRxyei6ekdEqVajt4ykpkFsy17QSA4zqkzy5Y74SmN1Qm90iJIZ0HyywFHy3xnGwUSVKC/kbyc+pnm1u3My56rRWhdUwNXgPZ/LCyjy4WAaJ2FdZIfOffHu6ka18Lt5GCJ+jDJKutxYy+7MORv2N56++99cbGMVS8lTJ6u+PaGi9RHXF2pyoog3MvevSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CXDinjABTub6cWVZAFcd95qdrihVEZwYI8XvYt8k2M=;
 b=JvUwtCiSTuNh2egDDN4LJyCBf5Ws7zvd29gTBYWRutvVCsbQlnSH2wGXd/zEy6cBdKFGX0t80+MJIrgyqEUt1ixen6TzAxJWX0lfByAgZjbHIUI7DswntSuMTm1oJpMYIAG/ErwPP7z94lmjCauIqUIBHO1viKeMBC+ZP5Uq+d0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 19:55:14 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 19:55:14 +0000
Message-ID: <a51e328a-f6b4-4bde-bcae-4abcd5c983ec@amd.com>
Date: Tue, 23 Apr 2024 13:55:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: clean inconsistent indenting
Content-Language: en-US
To: Joao Paulo Pereira da Silva <jppaulo11@usp.br>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc: jppaulo <jppaulo11@hotmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240213224339.379599-1-jppaulo11@usp.br>
 <20240213224339.379599-2-jppaulo11@usp.br>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240213224339.379599-2-jppaulo11@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR10CA0005.namprd10.prod.outlook.com
 (2603:10b6:408:e0::10) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|MN2PR12MB4205:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cacc952-cbfb-4c9c-fb3d-08dc63cf4acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWxxYTFtWSt1MmFKY2RHOG9MOU5mMmp2ZTFlTlpISEVhMDduelVrL2c2dENO?=
 =?utf-8?B?N21oV0FDb1RtbllibGNWbDhsdkZMbTRCVXg4REgvSXU2bDFTSDZqOXN0Wk02?=
 =?utf-8?B?NzdIUk82by96a3YwMWdlN1dHS3dmMDlqVHU0Y2hEamRuRkZaSVBWQjc3VDdr?=
 =?utf-8?B?UzdCbjdiWlAvR0NwR2RuZmdqKzRIZW96TEMwZEZ0VHVlL281SXgvZW41SXlj?=
 =?utf-8?B?R2tNMU82WmpxTndJRFhZRmljdXdXWUVBcnVTRnp0TjkrN1d1NXhCdTdDK1dp?=
 =?utf-8?B?Sk5NRkxENW1McURXUXk0V1hReWk0N2g5eDNQYnhWT25VM01PUzJWVHdtaTBZ?=
 =?utf-8?B?QUhUdU4wYWpab2lhWUhocUJ4K2FoR09vVytjdnF6RlpRZTI2MXZVRVo0ckhP?=
 =?utf-8?B?SlZHRW1JZUhLdU1VSzFpQU1jWTJzWVRaR2d3bmJ3WllybGJCcmZyM2kzcnpI?=
 =?utf-8?B?NGFvSG1FcXMxWllFR01ZQTNkZTZVdmZZaEhNRXkzaXNnTlVpVTc5VzNkUGIy?=
 =?utf-8?B?c1NYSkRGZjBvaHRrODFIWUxqQUx5N3I3NnZDaFBFTGNGTm9WK2t5Z3ZNR1VB?=
 =?utf-8?B?ZmRJY0ZMM0JGenJSQklqRTZqYVVrTEdPeC9ZLytuTXd0QlNvQWh5dHhhbG1B?=
 =?utf-8?B?ZlowQUpreC80Q2JlaVhlbnhaOTQyMEVlYUZ2NksyV3pWY1d1eGFDcjJZenRr?=
 =?utf-8?B?QldYd2pHMHFBSDZnY3hYZ2lRdG52UlErRGJJQW9GRzJOdmE3ZWxsUzYyT0dN?=
 =?utf-8?B?K25zS2lmN0pEdmZaOG5FUVg0SnJFQ3FLeElGb3NXTnN2WTVRVkpQK2lLbS9z?=
 =?utf-8?B?THVKRjk3aUZzYkcxcWZTWnNmTGZZakZoY3Bnc0x5T1BFaVp2TXREVTVXRDVK?=
 =?utf-8?B?aEhabGpoYXpZZ0VWc0pQYmdJV2xWR2FQNVA3K05xdGZnbWNpYjduaHVGVkFz?=
 =?utf-8?B?aGd3ZFpQNGkydnlEV1ZTelkrU0FoeVE4WkpmQlhuYndNMGtzTkxtQi9pVWUv?=
 =?utf-8?B?em52eStUS2RTWHlDM3ZrVnBjRnpXaEFtaFMwV3ZZcHJNVnNyR1Q1ckc0eFph?=
 =?utf-8?B?OWtxaVhVZVg3RHk5cTNYVEptVW1mUHdVanNJTUNPVEFJTS9vT052VC8vUDg1?=
 =?utf-8?B?aS8xL0RGUjlLbEhFT2pSMi9RVnNtSVNaem1QU0ROZW5JNlczdEwvTkk0Q21E?=
 =?utf-8?B?U1pXVXFyd2NEZi80OVFsYTJpZWs4YWlqQTNzUmlxa3lBdTcrVUlTZEJxYUY2?=
 =?utf-8?B?RXV4b3UvMG95RVB2bW5RbDhoR0szenBpQmlycmpFQTgyeXVHbThXZ1R2UmRZ?=
 =?utf-8?B?ZlhueHhsaktSMG9HdWRxSC9RekluQ0hoVGxsTTNmbjYvRnZ3WHVoTTQ4dFhQ?=
 =?utf-8?B?U2dYOXVEVUR1OW00MDhLK2NkUThTUnYyMlB0WDFQZTFuaXdsOTBLOERJSm5j?=
 =?utf-8?B?NXI5WmZvVzJYL2M5aW5hMm51Sk5Hc1V3aS93V3FvL0RaMi9XWFlySGZDbUVm?=
 =?utf-8?B?Yk53aUNDbk94OFBkSkRwTERkTVFvQlhNTy9RbmZ4dGc4UDVCV3I2dkxnaGp6?=
 =?utf-8?B?UXNJLy9JL3c0Rk4zOC9POFhWUnBLdnZtY2VSN3V0eExtNGcrZzlNa0R5ei9G?=
 =?utf-8?B?YUtiUm1HSEpxZk96RnpwN0FIMkR6RG03V0dxY3dsVVJmUFZXQklucU81QXpJ?=
 =?utf-8?B?THlaeklHb2RsaytJYjRtK2d3TnJpQVA3eVh4YWg3enJZeXB0cVl3TkpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHd1dDFrU3V5MENaNEpoZDFieVRURFBna3JPRGNka3hKbUxHQWlTYkV2SndX?=
 =?utf-8?B?a2ZSZGprcngxTG1oUng0c0NNWllHd3pLdVNnTjcvdSszRUNNZTgwZVF3MGww?=
 =?utf-8?B?STZVaXhOVVRtd0pBenlFajdXTUNpajVvSjJpaWlVc3JDcU1WcHN6MjFQeC83?=
 =?utf-8?B?SW9JUnY3dkhKRjM4OVBsNDZFMEhvTWZjMENqUGJ0N1ExYXByQ3pBdUhMWWdT?=
 =?utf-8?B?MGphSm12MHhUN3Y1UWNTTStNTTdsWmlkWndIK0h3SzR3U0pXWGFBUkdqY2Iy?=
 =?utf-8?B?bk1TQlB1NDhVMytOY1IrV3lueVdhR1JJbEJUbUdnYys4TUJJM2J3TTZLK2NK?=
 =?utf-8?B?K2QrYUVyYy9DUWdYNmFIVXhoNU8zd010dCtway9aQmY1UHhPaFdXMWVnbWJH?=
 =?utf-8?B?N3hUQkZTc1hLUFVMditTdE5WdW1nZzhBL21Md29lOWl0bS9sMk81MjgzMXVQ?=
 =?utf-8?B?K1d1TDRHSWtnS0NYRVBzOVZXMDE2b25pSVlPd2oyVUg4NVh0UFdQOGRSVVBw?=
 =?utf-8?B?cjhWNWdMdG0rakxKSDZQYXI0dXYwdkM1UUV4c21LdGNZQzlzUUlCbnp2VmRB?=
 =?utf-8?B?ZEh5VENOMThUL0NNUGc2NnpaU01KODViOFZuSmtUbDFUN1d6UGE1VGdlS3N6?=
 =?utf-8?B?MlV5M1UzVktIV2NFLzVERkE0Rlpjb3VzYTJhMXMxTFNyKzR6RXYxdGJHdXNp?=
 =?utf-8?B?aHFzNUZXSEtVQi9UekF3NFVZTHFXcks2Q3lFcVJLYStMV1A1aC9WdTNhTTRj?=
 =?utf-8?B?N2pYL1F4QVRwODZOcis2VlRzdkVwbHl3NEVGaUExWmNRL0FhbGsxZnJlS1Rx?=
 =?utf-8?B?UWRTT0Q2SVduTzU2Yk01QUY5ZC9HQVBBdTN1SEpsdGtNSHlRejlMb1NWY3px?=
 =?utf-8?B?SUJGa3JJZWhNMFJ0cC9WS1BzTWJwcXNtb25QdVFHb1BURzlkYTVyZFVjT0RU?=
 =?utf-8?B?K3pzUW1CY1BVV3JWNnp5UkUrWERhS3JTbW9vVkZyRUVWK3MySW9KWkR4VkE4?=
 =?utf-8?B?UG5OWEhwWFdiUllRZk4rSVREWndmUHZjVHh4OTNSdFp1Z0ZOOTZ4RnV3U3d0?=
 =?utf-8?B?Nythck5DNDdoWWJSR29wenNka0IwUlZhUi9xUE5jaGtNOTBOYW5FWGphU0JG?=
 =?utf-8?B?NFZYVlRoZlFhbFgxODlXOFFoR1ZWQ1JZS3B4TFVGb2Y1UExZZUZMNmxYN0l2?=
 =?utf-8?B?V0hxVEtKNUNpYmxCZGM2N0doMmFQaWdIUTcwNHM2eWdOY3FMRTBIcmZva1M5?=
 =?utf-8?B?alVXQkxLNnYrUWREM1JuSGJUUXY5WVZHVXQ3MkRjU2UwVUdhSStNRzlvNFNj?=
 =?utf-8?B?UktHa2Vuc29YbVVsK2l2WjVVRktjODA3ZkRMS1Z1Y3gzcmpRaXI1VmE5R044?=
 =?utf-8?B?TEN5NlNXek9yRU1jRnRHcXFUZUExZSt4SnVrT1VRK2NGOXRjcUdXQ3ZRWVlY?=
 =?utf-8?B?dWRCeWlrOWNJMExjOUJCNXMyYlpYUmxmT3V0WTNvTlBUaFFyc0JiK2Y5eVJC?=
 =?utf-8?B?ek1ubVM5L0JpNnNXOWtSeU4veDhDZnNtQUtTeVZObFZVQ0ZvbnBEc2svdU9T?=
 =?utf-8?B?S3BzdGM3RTRyeEt4TVhCRk9FSGZDR2IrYmNGQzYyaitPemV6WjZVR3pYc1Zq?=
 =?utf-8?B?eFBGNzc1UVpaYzByRXZqYm1lMGpsNExIaDMxWi9Ja3QzdVBsWHJsZEJxNjkw?=
 =?utf-8?B?OXBCVkl0aFJMTHdDdm82U1IxQVF1VytSaE9qRnE2bDVESUZWQ09ZV2sveERG?=
 =?utf-8?B?Y0JYK2xzaFp1TDR4TTdHSng2SFA2bjBkWC9Xa2hjTWhhYjFyYlE0by9ydDZr?=
 =?utf-8?B?cVZDdEtBTjBVMDJFZnlqQXVkOW83cVJrYjlJdlhORVFqd2NUOEx6dlgwQ3lS?=
 =?utf-8?B?Nnk2NjRPcFN5S1lUdytCUnRiK2d6WVZpK2VVNEZqNmlBYS96WFIzS1JRdVha?=
 =?utf-8?B?RnMxUG9ZZ29JN2pKeTE0Y3BtK3lsT29EbUpualhEbDY4aVZ0UE9DaG9hWHJP?=
 =?utf-8?B?T2FFK0I3NUs2d0hBRHNUMVdvWmIxSDdIYWhKUDlXa0oza0NySERFNW52aldn?=
 =?utf-8?B?M2FmMFlpYWFoNGRJNHB0UTAvdmErblVzTGJuWGluSWM5OEhNdlJlTUtLc2Y1?=
 =?utf-8?Q?iR87OYD+4jScSY1L0kQERB0OF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cacc952-cbfb-4c9c-fb3d-08dc63cf4acb
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 19:55:14.5726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJS+EAuYHezVmQSc186KYQ6o6RMPhd5YQn4C3SvH5zTkkYYcEPLGHu0RznrqxbwH+7KDXn0Fqwtyaj0hmql3hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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



On 2/13/24 3:43 PM, Joao Paulo Pereira da Silva wrote:
> From: jppaulo <jppaulo11@hotmail.com>
> 
> Clean some wrong indenting that throw errors in checkpatch.
> 
> Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index aa7c02ba948e..7832832b973d 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -962,7 +962,7 @@ static bool dc_construct(struct dc *dc,
>   		goto fail;
>   	}
>   
> -        dc_ctx = dc->ctx;
> +	dc_ctx = dc->ctx;
>   
>   	/* Resource should construct all asic specific resources.
>   	 * This should be the only place where we need to parse the asic id
> @@ -3155,10 +3155,10 @@ static void commit_planes_do_stream_update(struct dc *dc,
>   				if (stream_update->mst_bw_update->is_increase)
>   					dc->link_srv->increase_mst_payload(pipe_ctx,
>   							stream_update->mst_bw_update->mst_stream_bw);
> - 				else
> +				else
>   					dc->link_srv->reduce_mst_payload(pipe_ctx,
>   							stream_update->mst_bw_update->mst_stream_bw);
> - 			}
> +			}
>   
>   			if (stream_update->pending_test_pattern) {
>   				dc_link_dp_set_test_pattern(stream->link,

Hi Joao,

Could part of this patch not apply to amd-staging-drm-next (the second 
part is already present)? Could you rebase your change and squash these 
two commits in a single one?

Thanks
Siqueira

