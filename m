Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8FE8AF77C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 21:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607A311362A;
	Tue, 23 Apr 2024 19:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tH2r7lRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840F0113629;
 Tue, 23 Apr 2024 19:47:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxNqvdvtNQAVzf2Afw3fcm1HzJaOnfjYBeN3LKihLrf6qTnlis4HiLhml5D8dKRcmNHEhafE52M1gXxzbXHjS9vDn5aFgMMQpzL1Fx6C8omeGqI2ScljF0ZJceIZpwKHuMsVGbGHL+I0SALbDMy6SaBLDlI5NG43IfXEFQRsWeq9edhJGtyim0oARcejZ/N4NeyMNgljkbuWAXDikXB+AtI5iy/6L5xGKKT2GauflQMp63/qu5u8wxMymJpN4MM/ca5uN5iCRQD/ivtCq63aryDZvo3iv1a3XWG5vMQt/bbUMwA4RWUK52j403wHLKMuZ+usbqnSB+62nmrLTez9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3A/O29Q1yd2rJH9BeamM43ZUYLpW3ynC+Fo8VCP4028=;
 b=QZGOtBlMAwGkf0rdPZIIeBHc3upoWu3Mc6GNYyOsvIiElzVMBLUHIzz+TIAWDFqtklsw1APFzjVL/IcTRJHBpK7ExRw2ZD1PDYyo9Vla0O+DASwzzY+fEvBCiuswAKGz2wuFIWGfH2YbpUpoI+nvSO0cSlqIXRZLGHlZmxXobQamhfEugXZ5tyYBDbK8xi9dyzTxxx/Yyfbua9HjPYl9wjJHObwGILdXOKcCorDeX5vU2dhDWeIm6FZ3YfPbuquSK1J9xunMkbgQ6/kx3IVaDPbUj56DGQV/qOQ8pg60Q/ceWhTB3JwqaiB79dQBGHjC7ZGR7iCYgFKLYIS19IVtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3A/O29Q1yd2rJH9BeamM43ZUYLpW3ynC+Fo8VCP4028=;
 b=tH2r7lRlt7FqczTmTkQdqMYrFdF47lLeS6uYhusye+smPHzz6B/2nw8JjxJGoSHNiIc8+l1EG3TES9AN/T2l9IXdBvFnNZD24C7BLyH4eKov/AkAR+4rW9UHuuShNrVdZi1nc047Z7VGdSLxWkCZQGb5JWhT55nA+4SguKWzHwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by DS0PR12MB9400.namprd12.prod.outlook.com (2603:10b6:8:1b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 19:47:22 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::2243:aadd:acd3:3455%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 19:47:22 +0000
Message-ID: <a5f06933-3cbc-4b6d-99fc-23ee31b291ca@amd.com>
Date: Tue, 23 Apr 2024 13:47:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Remove duplicated function signature
 from dcn3.01 DCCG
Content-Language: en-US
To: David Tadokoro <davidbtadokoro@usp.br>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222141900.295254-1-davidbtadokoro@usp.br>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20240222141900.295254-1-davidbtadokoro@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:408:f7::17) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|DS0PR12MB9400:EE_
X-MS-Office365-Filtering-Correlation-Id: 96692465-3e71-47b5-1dcf-08dc63ce316e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akt5N1JBazRSVDVLUGhkc1lQdHpCM0c0ZE1kNTlkbFNNck01RS9hSk8zN3hr?=
 =?utf-8?B?VHppN3VsN3ZKVmdxbU9qS3Jybzk2dlVvUGtmdjl6eW13L282dDdXUUNLSUZ6?=
 =?utf-8?B?MVZNM3hFR2pyZTNDdkh2cFpvZS9IK3Q4b3JpRTdIYWhzUDJQMC9rUUVybUIy?=
 =?utf-8?B?N2pzUENhMjBkRUtlRGxNbUlBalY4WDNBTG94cWltR3VBemtGVy92WnBrbW9x?=
 =?utf-8?B?TWd3Vm00bG5yakdjWFJIbDZlU1VmVXFIZldhamc3OVNkN2NGM09ieWNQVHMw?=
 =?utf-8?B?eFVZN0VZbklWSjc5RThFanFmS0p4MTl1ZXFkNEpxRStnSE02MkI0WXJCd0ph?=
 =?utf-8?B?RHd1bS9zZEpaSVhwZ0hNQWhORFM2dGlGb2FPSlRnK1pPOEZoKzNnbERPV3Fh?=
 =?utf-8?B?UW1JWnlvNlhSTDBSdWlvZ1Axb3BYQnpqamY1WTNYZVJXN0hsR1ZLdllGb0pa?=
 =?utf-8?B?Z3E3SExNQ3NGUlA0U1JWL0M3Y2NYaldjZUZrakE2V2dPZ0tSdENWd0xDdUt5?=
 =?utf-8?B?SmpsZlhnb0FYSk00MUoyN3pwVTZUeitCSVJCS2Njb1NoOGVxWFhzNjVpK0hL?=
 =?utf-8?B?dkpkY2xudVQxQXFwcHU3aDZ3YTZnYi85dXNva0FqSmZ3V054ZUNTcDV6dGNV?=
 =?utf-8?B?clg0bHBpb0RadXhERy9Wc0MvOUphYmVtQllBeUp2WjRnSktOK1lvSHVwSWE5?=
 =?utf-8?B?YTBxOWt0ZGpEb2hFRVFNaW10ZFU4TUlzUlR3SFp1M3E0ZThGeDYxV0NNS3NN?=
 =?utf-8?B?bk5yd0ZERi9JZGh4Z1E5NXFzNVJGN1AwZTdpa1NBejBHWStDTlJWSmVpYk5Q?=
 =?utf-8?B?TFZzbVl4bVJkYnJKV0cwdXk5SUhsREFlSkI1b2dDUTNOR1U5TTVCOXBEd3dX?=
 =?utf-8?B?TVFra1VWZjlIREMvSmFtTXBRWXZPekxnQ0xzNW1YT3JSd01lSUYyV0NQTXJF?=
 =?utf-8?B?dkZvajE2WE10SlhWVzhIVjZ0aGVaMUxWckg0aTdRM1paNm1qeVFGY0RtZ0pu?=
 =?utf-8?B?NkRWVlFQZGF6UXJvTjNRRE5tcWxYeVlNUlBTQTNpYk5LV21abmV0RHZMeklN?=
 =?utf-8?B?aDJSZEVGOVc3WUM5OFJyMTNUekNPSHlkWlNFK1QwQXh2VXE1VmdOMlU4b2ha?=
 =?utf-8?B?Rzl0ZHpUMUpvVDkvVlVCaXIxOXJ1anhGNTg0VjI3T09WL2E4VHN4MjA5dmd2?=
 =?utf-8?B?ZHAyUzJ4MHVuaXFTb2tJMVdQQWlhVXlXOEJDd0VyOUpZcmxjaE1ZY3YvdEh4?=
 =?utf-8?B?K0lBemFHSHZYZ3dURjhMUC95RzU3dWNWRnQ5a3poakhzb2VTajBsQkMwR2Zo?=
 =?utf-8?B?R2I1K1oreGhBdnpNdURRQ055eG0za2JrckNENmdKbldhL3JKcHp4OTBpenRN?=
 =?utf-8?B?L2c0cHlZaEZDRVNWSldzS3NQNW5BT2t1TTFDOXVKTkJRTlEwTFUzNHZSVFl0?=
 =?utf-8?B?eFZSdmxzb09TRlpWTk1NbWs0TTNIQSttS1VmSDJhalFld2J1NnpWbWFCSGJL?=
 =?utf-8?B?M1Rnemt6cHZqamZFVklMRFFad0tJQ1U5UDdRckhsbzF6d1N1TW1Oek81VlZS?=
 =?utf-8?B?dmdpbjJMOVZRTWxzRngwRDA3V1J0THNmOU5oSUNEdFNMV2x6UFNXRWJhWGpO?=
 =?utf-8?B?YnhwblRpYnAzbzY3dHJMNEVoa3ovM0hic2Y4dmN0KzNIRlk5NTl4ZXN2bmo4?=
 =?utf-8?B?ZGJxRHBQQUlqZ29zdmxROXluVnN0TVAydW1aekdVMWpNbklEeEFYdTR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0ZJRis2NHh3VlVRb1JRRHVoSi9EdytSRitmSDQzdHN0Z0k0SjhlTzYxa3gy?=
 =?utf-8?B?R0xRQlJkQ1owUG9vUzY5WHFGS3BkQmR2bUtnM1c1Qk1pU21SQ1hxcGZRRDBX?=
 =?utf-8?B?N0ZDYnhzRHhiNHF1TmNYdXZiVGRTYnNwMWJZWkdIKzc4UVdqU1NNalRCVmYv?=
 =?utf-8?B?ZUdiLzN0QzdBdmwrODVMZnZTUTMxYjNIbWlyMFA4OWVFdGNOZEhtbmNJYjQx?=
 =?utf-8?B?WXFGbFM0YitqTGQ4dGV0UkVXVHpPOGRjOUVWQ0Q3VWRDbTJrM2FjTlNqR0R6?=
 =?utf-8?B?L1BJSDkwcUZ5SlR2aTVtekFaZUJ4RU4vREFPM1A0T1graFp6bkpYb0NTVkNE?=
 =?utf-8?B?a21VT3RNSGptbkgvcVNINWVsN3lKWWZkcWYwQVhqTHQ4NUhHTDR5Z21PYjM1?=
 =?utf-8?B?b1ZyY0ZBNzBreFVCRGF6TWtMeXNodXMrRS8yUGNHSzJkSjFLVnZkVytEbzJM?=
 =?utf-8?B?emxyNGxFTGZzOU5SQytmM2Z3VHFOaUkwRGJCYk9uV084ZWQ0dmVFZk1pcFRx?=
 =?utf-8?B?ZXp4c2t2aC80eFZzdTlzaHd6SzBqc1FpdnVKYkZyeFc4QnNYcUNBKzd5VmRV?=
 =?utf-8?B?ZjBwYzdWYzhLVWEwbXowTTBaYTc4M0p3d3VrcFFsSldUVUtsM3d0RFBQVVJH?=
 =?utf-8?B?ek9jSk9PNDhBOTQrcDNSS29ja1VSTjVWSzBtUlhqYTFWVjZZY0FoOStZSm1y?=
 =?utf-8?B?Y0Z6NXhZNTNXVXRQOU5nNnptUVNyRS9OK0I5dDBhWkdIMUdYbWVHRVpnd0Nv?=
 =?utf-8?B?T2tiTUlUdTRvcmIzZ0NPK3Y0cnpoVy9mTU1nYkYrYi9EakJrMUN0bC8xMnJF?=
 =?utf-8?B?Qm4wbGVaUnAxcnVzRWxibm5qVFJoaFBVMG52WVg5RVdvSzdKK256NDQvMkp1?=
 =?utf-8?B?cWViSE85U0JkbERuTnh2aGZkWUkxTjJUVGlTbWFhVXQ0WS93c1UzMGRNcEtq?=
 =?utf-8?B?c1UyODdUMzhQaUgzQjJqaCthdDR3MkFsaC96YXQyaDF1MC9kaFQ1VW50VjdI?=
 =?utf-8?B?S0R5S3hLbVRrbXY0V2NxRVZ3ZnU1YUt0djJRVGwzczBwS3FJQXpRMkVFOURH?=
 =?utf-8?B?bnVFNkxIcldpMkNBakNUQ1piWEJIY0crRHkyd0xaWmlSUkYvYmp6SGw5T1RV?=
 =?utf-8?B?MU1ONlBqdjlmb2JvNjFmVkJybEpPbDN4Vyttd3BaempibFhKYnl3ZUZGb0d4?=
 =?utf-8?B?cm0zSzVnRjhUczJCWlFxL3JYQ3hBeDhRN2x2Mjc3MkVaTUd4OUt1VnZMN2hI?=
 =?utf-8?B?anNXQ1NSVjdIeG1hY2E1ZjhBZjN1ZzB4WWVRbUQzdGlrcXlwL1gyZE1HUjFQ?=
 =?utf-8?B?YlMzYUpUTFdMQUtudDQ5TnNsWEFDMUdmUitsSnZmMXlDeUo5VEVSMmlrVGd2?=
 =?utf-8?B?UDFjVElNQ2tRUjM5azZUNkUrZXZEdzhjR2V0UDlKcSt0YlFvR2pSTEdYV1ZR?=
 =?utf-8?B?QWNhQXpkNGxVNW53bDFLYlI5UE4xVk94b0hqaGFJYTlmajlMMlQ5UG5jVUxx?=
 =?utf-8?B?Ym1GdzZpT29hVitsYnNhejRHU2prbjRpd2UxZmMyRHVJci9uT1R2dUUvSWJC?=
 =?utf-8?B?bmtaZ0FtVEZnczRuMWZkTDd0S1E4SmFJUXkrd3FpMlg0LytoK0VndDRrbzMv?=
 =?utf-8?B?bG1ieGxURkV2TlBtYW9YSWRRR1E5MFhMdW1xVXNVUjZjaXZBL0kzOHQ5dWhL?=
 =?utf-8?B?WVlmM2tNU3pNNmp6WlIxcC9LYkNPcjFEcjZ5Tm9icG5abHJuUHpmeGtzbEJ3?=
 =?utf-8?B?ZlNmVEVkNGp1TFI3R2g0akFDN0hDT1VFemVCcUlHVXc3R2ZlUXJSTk05azMv?=
 =?utf-8?B?MGdNdHBVOFZ2TndHTDZTUkp5Vm9YZWc1bUgrd3NoUXRvbzJTMlR0N1EzZ04z?=
 =?utf-8?B?dk1mNHFaWm54b2pyWXZWQnJnbW04SEVmUTB3OTc3MjlaeXZIWHQxdVhyendB?=
 =?utf-8?B?Nng2SmQxRVlwbEhZSFZtRXdhdEsySHliVmdqWkZpQi9HQkw5d3VuSG5yQTFm?=
 =?utf-8?B?NGM4Z0ZZeTAzdytobGluUVBoQTlyUWEvZlpoSjFOTFlwYjNTVU5wNWhHTjB5?=
 =?utf-8?B?UC82KzlxTjNjL1dDc05iaUg4VEwxeXJwRG9lTWxSRFhOd083VE56SkJ3VTlJ?=
 =?utf-8?Q?ridxpL52xjEMSr7axwkhrGftq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96692465-3e71-47b5-1dcf-08dc63ce316e
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 19:47:22.5437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncp3hv/p5jjEgEJK7ymdFY51CHNzUNMNRFXTpzABF606uJ9vwLa8wst5lH472D2C8Eue+vvc/X/u8/VuBt/BHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9400
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



On 2/22/24 7:19 AM, David Tadokoro wrote:
> In the header file dc/dcn301/dcn301_dccg.h, the function dccg301_create
> is declared twice, so remove duplication.
> 
> Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
> ---
>   drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
> index 73db962dbc03..067e49cb238e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_dccg.h
> @@ -56,10 +56,4 @@ struct dccg *dccg301_create(
>   	const struct dccg_shift *dccg_shift,
>   	const struct dccg_mask *dccg_mask);
>   
> -struct dccg *dccg301_create(
> -	struct dc_context *ctx,
> -	const struct dccg_registers *regs,
> -	const struct dccg_shift *dccg_shift,
> -	const struct dccg_mask *dccg_mask);
> -
>   #endif //__DCN301_DCCG_H__

Hi David,

Thanks a lot for your patch.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

I already merged your patch into the asdn.

Thanks
Siqueira



