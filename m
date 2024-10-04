Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE398FF76
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 11:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C5F10E9C3;
	Fri,  4 Oct 2024 09:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OxNkm9j7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6F10E25F;
 Fri,  4 Oct 2024 09:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0TRmH3lle76arMlMVmYouQYotYaDW9epqS+L3w4s5JKJSuthOB8+5LJvehi3YbMd7sWrW9dhHSDtxOLlwmrBLNOv5sgO1cXnRppuxtiYCYQPDM408UzTb4gNdC/ty04LeJqoS7n6ZgGDBtiOm1heXnH8t4z0N7gwEUHAJbSsyWVE0uRSTUJ+aadMVAhVn5lC9D5TbKj2q6ltVZZaJdii/RTrnGTny3RXbhI6XLljuonixOmWA/GnYFf3YaTZNIe6Mw8KdAC2eTIlPkT20aWvLJjVM24iqBe3uG61E9of9x7Cx4cL16KXdWchifIkSYNDLaf6JOXrzJv+a3aHFZbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GtKWZVCupXFvfh/9Zb7UJkMBla7UkckWFzS+Y+R+VM=;
 b=eo5sCGXug6CAv5X3oeXcgmTmmLTrDAuehFsQRSIJgoF+tB7DTQFCLWGsc4qaMdq3s449dIcNV7aQByVOIbFqXIzYF2l+ToMvE4fo7wxU6dMTJWUxF3JCRmuKZ9kCstvCK5FORZktTt6QwECxdXzKFSg1yzHaiMu5KFfyKIDfvJq1AMxuSt/ETIbuokvdnMf1T0FN2FVWJj24nGTyWC0BmlWyp13TBWRapUW+5NgiX67hDOVVbzdwUZNncRNei84uSmR2fl9eG2ZnLR9JOE4A9UGlMofmV+n7VhuMrnPuiPhO2NrcK8StE8Kts+KKPipPClo+E8nVNnI/MOzekx6egQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GtKWZVCupXFvfh/9Zb7UJkMBla7UkckWFzS+Y+R+VM=;
 b=OxNkm9j7U33YdhE5cYJty7UwJ26+Gg7PsTg9qmw2sUToQZiw07rTL+bF7FrVR95aRyUOjwowb4knn6XpwijNddIFv8Y3KAU4mRRgBKVTcDFY559au9FPV1c0TYgbbdDQ1vjKF/f22tdgXRKTJ6mw6suQgTlBDhaBaAmC7SAUQ24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6304.namprd12.prod.outlook.com (2603:10b6:8:a2::7) by
 PH7PR12MB6810.namprd12.prod.outlook.com (2603:10b6:510:1b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 09:15:47 +0000
Received: from DM4PR12MB6304.namprd12.prod.outlook.com
 ([fe80::81da:b334:9e6:2b91]) by DM4PR12MB6304.namprd12.prod.outlook.com
 ([fe80::81da:b334:9e6:2b91%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 09:15:47 +0000
Content-Type: multipart/alternative;
 boundary="------------sohC0i00oVtE69nNHtN0etfc"
Message-ID: <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
Date: Fri, 4 Oct 2024 14:45:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
Content-Language: en-US
From: "Sundararaju, Sathishkumar" <sasundar@amd.com>
In-Reply-To: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
X-ClientProxiedBy: PN3PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::6) To DM4PR12MB6304.namprd12.prod.outlook.com
 (2603:10b6:8:a2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6304:EE_|PH7PR12MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 91add126-25e2-4966-0fe8-08dce45521fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0V1ekI5MzIzdjhmRzlibnZ1RkpiN2pQckoyV2dzcDhXT28reWw5QXpnV21D?=
 =?utf-8?B?QzdIdmEwUkZPbGtCRTNxNHB1VHVDdzFyMEhIUk05OVhyTmMzN2h2ckphNTBF?=
 =?utf-8?B?WTVOalREc0xjeE9SMFdaNzFhdzBFUWNKeEQ2R2lDUzVtRnJWMzlpb2NqMncw?=
 =?utf-8?B?TnBEZVlRYWpGbkpIVHovWEh1YkZ0d1A0eTBSTDlyNzVQYzY1WVdUdHBQOXhj?=
 =?utf-8?B?eWVzRC9iVUJ4YzFYREIwWFpGVUY1RndMUi93WkM2SkVEdGdvNUFKODhLSFF2?=
 =?utf-8?B?Zi81SU15VDlpQ2tqSW82K09td01zWGdhYXByUm9mRlc1RzIzMHVITGpVVjAr?=
 =?utf-8?B?dTMyUnBBbm1ydStGTGFhNnJlZWlXSzZHMVQwVTNGUEhOZGlPZkVQOUthUFVj?=
 =?utf-8?B?bGFlK2F0cEVTWStPWXpYMDA5NWZRYUtwd1VZdDlmWDZDWllqei9wMGFta3NI?=
 =?utf-8?B?VnVLZEJCTjhxZHMrNUtrNHlMbWk4eEwyU0laV01SeGp3dnBBNGsrV013cHhq?=
 =?utf-8?B?K2kwQVZLMXVSeTRFdVgrSWtpM0ZCd2R3dkM5WmYwUnRwV1U3YUlLZ1BJRkNI?=
 =?utf-8?B?MklWOFQxMmVPbEEwY2RpMEk4Mlo2dklRME1TcGpzMFpwamM1Q3pPbkRQWmE5?=
 =?utf-8?B?d2g3emk4UFBSTGVPRHVMdXFOWE15eWl6WTF6OG9qR0NwZ3VDZERNYWkzbHlK?=
 =?utf-8?B?a2xwcTJ4eDNFWlp0dzNXZmFVOWdUU2RaQ25xU0V3Znc0WkwxblZ5amh2TitW?=
 =?utf-8?B?MUJaWkNFL1BVU0tiRVlTNnhOZnNCNjBtSmE2dThxZlFLaGtnd1haRGF0TUh3?=
 =?utf-8?B?bGhWMHJXbTB6d0U3MXVrK0p3ZnVGaGUvUzhnNkRQekhMdDFLSGJXL1UxY05u?=
 =?utf-8?B?RVFCd2tVUEFNOFJMbTJRRlpudEhTbTBPZkxFOFROQjZEUEIxeDBXajVNT1ZX?=
 =?utf-8?B?ZC9LUk56dC9xUXZ2dXNVaWxFWnM0Vk4yYVNHRzJQL2cwOFVHUkh4NTR5OWZ6?=
 =?utf-8?B?UjVucGZRQWNSMnpobmNianZ2Z1M1bm9nelp0TjlGRWt2NUkyNWZoWkc4TFh4?=
 =?utf-8?B?MTcvbEM3ZE1EUHZCdEdzWmxLR3hOUy9aNUxBRmpNQmViSmhTb3NITW5ZZlVo?=
 =?utf-8?B?a28rVC9TT1BjUFhnV2hwMWJCSzhTTU5OWDBnMDYxc3pYREQvRGhoUmJLbGlx?=
 =?utf-8?B?TjNHOU0yR2lJMk16Y2RtNXo5dDVmMEN3SHdhMXZQaEQyYXdiK0RUTnhHcjZ1?=
 =?utf-8?B?OFNmOFdaNDluZEZxWVF6OXB0eVczTmNoaUxnUHhkRGJXTVlDY3JScVhDRDhS?=
 =?utf-8?B?SlFvZXcranpJL3B3eDRjMkxLRURsU2FxMmc1Mm02UlRiVkNaQkMzYUxYNks1?=
 =?utf-8?B?bk1tVlFDeWtUMStEQk5SMllIb3BUeWJtMGVjT0hLUmI4RXdUVTl5THVUeHM5?=
 =?utf-8?B?azB0Yjl1dHJ2enhBWEVRdGFmUVBIb3NxT2dyR0o4M0hhTG9yTWo4K1BJTVFZ?=
 =?utf-8?B?OVFnRDdhQ3dXRTlIbzU4UkpJN1pjTzVuREY3V1NHTWlWNGJJcDRlNW1aQ3dD?=
 =?utf-8?B?Umo4T3B1SXZ3cS9LdXJHQ2FRdnA3ZnlVL2xHMUgveFpmcVM2UTdwNnVvZGZr?=
 =?utf-8?B?RndPTWgrMU1LK2NWNi95ZDVGT0ExR2dKd0hoK3h2T2lld3lQV1UvR3V6TTVi?=
 =?utf-8?B?a050TnhOQmlBQ1FVZHFBR05NL09yd1BSVForNWhCQkdUTWRlMVVweW1NTDlB?=
 =?utf-8?Q?B7kTEX1EZzE42HmG+hYgQhXF6R9KNdlvHKIOhVF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6304.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTduUlRkczNrTXhLQ21KWTQ2anJ1RTFaSVdZdVM2QTZua280RnVyS0RGalNi?=
 =?utf-8?B?dUM3aXUrUWU4RlQ5U1gvaThzSnlTTEJzRTNMS0k3Zjh1RTAraDZFNEhTam1l?=
 =?utf-8?B?SE1ZTmZXa3Q3eG4vaWorTDV1cVBFQktTVTFtc3RncFZOdEJjZzF0NEEvdXd4?=
 =?utf-8?B?TmJRWXdPZGIvSTJoZG94RE52bTRmemJiSytYOG1lQTcyUHVOenFiY0M2WlRH?=
 =?utf-8?B?emlnRElmSE9Gd2lzcmliMGFCYjBPOU8xekljbWVPbXhuMWhpSW9Ub0Riczlx?=
 =?utf-8?B?QWZEMDhieUFhNmdXMnIzVWROcmVnZWF2VC9NbHNGUjJmQWtrSVBzYlZCOHB5?=
 =?utf-8?B?Y2pEVy9Jck55SjZUNUxGUmZOTlB0TkhHM0tJdGdIdStwWnpUbCs2UGU3UWFT?=
 =?utf-8?B?a1NmbTlkMmlKNDdHUzN0Rmw0TGJ6bjVpZ3hNK2hMTXhUSmczY3pjYXYrNE9F?=
 =?utf-8?B?U0lYN2tFSTYwMkVuaDI1ckNETGozcm9NazVLUDN3R0I3a3R1Ykl1elN1dXhP?=
 =?utf-8?B?TE1TRXZjRHJMUGVaWWpxQ1NHVThZNERpS1R1T0U3a0xQK0dWM0x1SWMwN1V0?=
 =?utf-8?B?Rk1qdkk2ai9Vb0l3QWQrQmN5VjJUVm9VRzNRQUptSWVXdTIyOVV4UWgwQi93?=
 =?utf-8?B?WUFGMm5hMUFLbkRJeDFidDY5NTczL0ExS0lySjZMN1RVajJRNExMeGRGZm55?=
 =?utf-8?B?Q05wQnFyTnorYktQdkttcjY3c3JuM3lZc0pMSkhpd296Rk5ueFlBUzBUS1Bv?=
 =?utf-8?B?YUQ0c0Y0aTZRVEZscWdpQ1VxVjQyeGE5WUlkQUFuc2VOZ25QVVIwN0RlaGVj?=
 =?utf-8?B?UDFwQXQ3WDhudDYzc1k2S1JDUXhWc0FuWW9kaUFGZklqY1kzUzJ1WHg0Y1k1?=
 =?utf-8?B?cTd2WFl1Z3VFMFFOaFpXRXRTb002aUZUaVNwbTBLSEkrREVLdVgwWCtXL1FK?=
 =?utf-8?B?cUJicTIwenN1a1NleGlraW9Vc0EwdjFBYWp1QUhOKzFOUjNpQ2IvdjNicXky?=
 =?utf-8?B?TEVINzBuUDZHa0trTUFpcFVOV09yNi9hbGQ1cjBQK0ZKRTliMzlib2hWRjYr?=
 =?utf-8?B?bG5vZk5JSmNlNTh4aE9KbllJS1lSUWxpNXZleUZ6ejh6MVk1NmlSTFAydGpL?=
 =?utf-8?B?SEVCalZoUVlHeDVLOVcrbHFQWGxFeWpINFFDekNJZXlDb05wc0ZiU2hoLzE0?=
 =?utf-8?B?UEFtRzh1Vm5ETEtkNDg3MEhZVTJhVmEzSVBaamVmUnVtd045UmJFZGQrY0o0?=
 =?utf-8?B?aHVrUzFKaFYva2tPaXFDcHdlQ2M5WmhiUGd1YWFiRThBZVdHMU80S0d5VkxP?=
 =?utf-8?B?QlBycENsYXVWNE1yM3d2MnF2TUdaaUdvakJZMUdrbFcwYVpTZ0V3bnpiNnNr?=
 =?utf-8?B?cEE0Q2pXSmwrN01JUG9YcVY5ME9KaTJJUTNHZU1oczFibU4ydi9kVk44WEZu?=
 =?utf-8?B?SFVNdmVmVE5DMnpFZkhkVVZRZUM3eVM1a1FrZExPdUx4cHhLWCtxeVArSEp5?=
 =?utf-8?B?NnlDTGtuNUMrYTdsT3R2aEhkMlRDK09UcC95QTkxOHJpNVBMOWh6Ky9VQlFo?=
 =?utf-8?B?S3RITjkrdTRpdjYxQnhSdGtzSmhZUkYwRUw0bXZscDRRT0N2djREV0paWlRY?=
 =?utf-8?B?Y1Q4ZXBVejZNTDFielMydFJLN0piZEJGYW1mUExYL0NwVHp5SlVJaFZ2OWMx?=
 =?utf-8?B?OTZzQUluWVVWMGZKaGN0QTc2Z3JDTzZJdTBWMk1rSE1OSjc3bDk1NWZsZXMr?=
 =?utf-8?B?cDd1VDhXTENCQnQ4dGdVNHZiaTljUWNORmZVV1pReHBpSjcxa0tsK0grbkM3?=
 =?utf-8?B?NEFMSTIzd1VRenFpSFZ4TFZWRzhVOEc0NnJvbnczZ1lqSjhjMGJXWnNtK3VK?=
 =?utf-8?B?ZzRoNTFZRFlOMXdtZVlaTHFuQ1p0TTZvSzN4SG91N0lsWEx1QlN3d1ZXcWFC?=
 =?utf-8?B?VDRxNWVDeXVpK2dFaE5GSWtnd0ZhU05LWUUvdlFwT1gySDhEOWpYTXVEZFNN?=
 =?utf-8?B?N2FVL1BTbTJjQnVpS0tUd3J5cDlrTzY2OVM0citaTWg0a09EcE0wcVNla0xN?=
 =?utf-8?B?SHBmUkFic2hIL3JuajJtYnlVcWNjY3ZBRmdsaE9kRFpHMDhBdlhMWkY5QnF4?=
 =?utf-8?Q?+oE+5ZkP0za7m2LwxSQ5MxnW/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91add126-25e2-4966-0fe8-08dce45521fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6304.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 09:15:47.7121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHnPZnhkBcoDzOMSsWm5vKXNGaU/3iIQf7kdMbqbvqkbkwkUPD0tY+YklDXkLtsBrWeCPtM7HULg6lhoYHjEaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6810
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

--------------sohC0i00oVtE69nNHtN0etfc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


All occurrences of this error fix should have been together in a single 
patch both in _get and _set callbacks corresponding to f0b19b84d391, 
please avoid separate patch for each occurrence.

Sorry Alex, I missed to note this yesterday.


Regards,
Sathish


On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
> Fix shift-count-overflow when creating mask.
> The expression's value may not be what the
> programmer intended, because the expression is
> evaluated using a narrower integer type.
>
> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> Signed-off-by: Advait Dhamorikar<advaitdhamorikar@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 95e2796919fc..7df402c45f40 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>   		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>   			ring = &adev->jpeg.inst[i].ring_dec[j];
>   			if (ring->sched.ready)
> -				mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
> +				mask |= (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>   		}
>   	}
>   	*val = mask;
--------------sohC0i00oVtE69nNHtN0etfc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <font face="monospace">All occurrences of this error fix should have
      been together in a single patch both in _get and _set callbacks
      corresponding to <span style="white-space: pre-wrap">f0b19b84d391</span>,
      please avoid separate patch for each occurrence.</font><br>
    <p><font face="monospace">Sorry Alex, I missed to note this
        yesterday.<br>
      </font></p>
    <br>
    <font face="monospace">Regards,</font><br>
    <font face="monospace">Sathish</font>
    <p><font face="monospace"><br>
      </font></p>
    <div class="moz-cite-prefix">On 10/4/2024 1:46 PM, Advait Dhamorikar
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241004081618.27599-1-advaitdhamorikar@gmail.com">
      <pre class="moz-quote-pre" wrap="">Fix shift-count-overflow when creating mask.
The expression's value may not be what the
programmer intended, because the expression is
evaluated using a narrower integer type.

Fixes: f0b19b84d391 (&quot;drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs&quot;)
Signed-off-by: Advait Dhamorikar <a class="moz-txt-link-rfc2396E" href="mailto:advaitdhamorikar@gmail.com">&lt;advaitdhamorikar@gmail.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..7df402c45f40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
 		for (j = 0; j &lt; adev-&gt;jpeg.num_jpeg_rings; ++j) {
 			ring = &amp;adev-&gt;jpeg.inst[i].ring_dec[j];
 			if (ring-&gt;sched.ready)
-				mask |= 1 &lt;&lt; ((i * adev-&gt;jpeg.num_jpeg_rings) + j);
+				mask |= (u64)1 &lt;&lt; ((i * adev-&gt;jpeg.num_jpeg_rings) + j);
 		}
 	}
 	*val = mask;
</pre>
    </blockquote>
  </body>
</html>

--------------sohC0i00oVtE69nNHtN0etfc--
