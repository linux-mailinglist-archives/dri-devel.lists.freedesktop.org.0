Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11B7F2885
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8B510E322;
	Tue, 21 Nov 2023 09:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BDB10E322;
 Tue, 21 Nov 2023 09:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGRiSuoEtMu6/8woZCg4JB558lYfA8c1uemScjWzydXJoLVfMemz5klLVqk2/jh9a3fPgLiCgecgLhlOGX6McKpbXudzLAPwHfaH77rVEY5LLefmG8ngXiv2hSzP5k59fukjNMtDuZLF884kVLv2OSig4oi75bu1BSLKgYpzHO0BblDDg9noLntMvi0s554aKUzEqjpadc7FKl85ZGlkY7pxDhd8qsCaCIA7+j5L5awMdOUOsoNiJw2Ncasq6huiYGdVtkJ4KHdpt+feg9vdZIiAms1USRqCzZZqs367O7ruWTka1H/VBmAEBiRZf6Ftdq7fugZG/w2q4WU630gooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6FleHveucG2H5Fm6Z3n3w4GeKDeMhQsStOBTI5aFxY=;
 b=QjazYbFYF2Fthanxp0TwAjL2f/HB4mbObYna7KdMiSJOIb+3O4woOC1PCnDYt4c2AsWuoxq39d0qy760h/f56rlGDF46QeVqshTHmyacFEeCwLaVxetq6YsViqxBxP2gnMFjbGNBVTr4y2dv2sFqOCh+09b7hOf+9teRSmV+UDdTq3reRXVz1N7QLXo9B1NT8l/JoY+678QSeXqOY+Nfv21r+kruMAHDTDdnUxk5wGhjeEgDbx5bl8NAOUGpS729Rb+SOwMSgApbFk0hr+KJTtP684HUmK0Kc7DRS+6vUIKjJqQ4YdX7EJ/+e0DwYogE+oQs2SbU7qm8ThGV1FREJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6FleHveucG2H5Fm6Z3n3w4GeKDeMhQsStOBTI5aFxY=;
 b=Uf0bRjHw6vy2hIrheSWCJgvdM8oMwop738Mq2PlelbmFtvgrDmYGlElBnH4rl+Y3lb3iCAZiYprDmn6MXsCDGP2MBDuIXbmBTh1zYL6JeAH1WUVhXNrb/N3aiKJgxIQH/YcxxGL3XG99FFr+P+dKI9pRDyBPZo0pJu1gnktWjgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6600.namprd12.prod.outlook.com (2603:10b6:930:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 09:17:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 09:17:06 +0000
Message-ID: <bac617fe-6b23-411f-8dc9-c97cc84208f3@amd.com>
Date: Tue, 21 Nov 2023 10:17:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: display: remove unnecessary braces to fix coding
 style
Content-Language: en-US
To: RutingZhang <u202112078@hust.edu.cn>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20231121043621.9351-1-u202112078@hust.edu.cn>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231121043621.9351-1-u202112078@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6600:EE_
X-MS-Office365-Filtering-Correlation-Id: 780feb06-2842-4659-7d2d-08dbea72a184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8dpPTc3TPL6A82wRB/vRNDHyp/tJSuRSKIHdm2FVXWEaKI+Ii1WLmcsKLrFLQccFRuINdzIav3CRXncV0srUPtYqBJedIrIQ/WE8OLK1LHH0VgOE4CpKXUO/QR/uQ1Gnjnw56CtyDmkpjOlRCNq0jIP17DlPsOMJPYTKWfT1vyTqp0Hc2hW1S/ZPFDROd49CEJInFcFXLeOgQg9ckdMHT8U+xVFekaiKTyL7Sz0dLO2FOPqcK6+srR/ZLdD2v53W4WYWiPTg/bS39HYujOXZTUlnavRfoBgWkV8CndHm6HJr4q/aI+nlRyAG/Q/DK6tAaxADysw/gFh5U2Qf662UoPBpiaBtmmgEdRBokQPiXh7lgXBDVS6DEhGx6rmlBIWBmAFdiRkmz1+9ZezjyKSKvXqWM3P3ZTMUn2Z4NqHx7odBPK5/ksl4Iq72GA1ivOrw/3yC+uV3QRGagAwR6d6bQ4X8r2Xti/xH992/jYH9C0ObYdWAwLGVoKQ1/uky0G6E4h5opvbkd3XEVSpdwoPnwVme4rDDWaVJU5S6XF81DdNjHN291Sz0CsFcWRZEBwRicDA6yjLQAVwM2ffsFLd2/TQ1zT3wRJkz975fCKl8bXP3T0b2gFFqyXD602Fp69nqXv7kJhQ/tWOlU4IYQujMJyjTmjQKNlvbfA0k3pxWCCKNTnMv8L0O9647RF53YL4J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(451199024)(64100799003)(1800799012)(6512007)(31686004)(6506007)(6666004)(6486002)(478600001)(316002)(4326008)(8936002)(8676002)(66946007)(38100700002)(2616005)(110136005)(66476007)(66556008)(83380400001)(2906002)(5660300002)(31696002)(26005)(41300700001)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDV6bUcyMEF3N0xhbGhGMDIvMTIvR1Vzd2lRNHZKTzRldUxwUzcwSTdna1pS?=
 =?utf-8?B?a2ZCd3V5L0YrWTdIK3NjQy9CWmVnWjV1cldJTVlIYk9aTWl4SGNONEVHeGVO?=
 =?utf-8?B?bW1xc1M1UlJBWEdXSEtjdXlweXh3cGV6RDdMZmU1NW0xSVlJSktwdklmN01T?=
 =?utf-8?B?N2g1TGhBN0FWT0FWWFk2cFMvbW9mWWk5aWw3R0crSXZ5VzZEYWxnUFd1Z0d4?=
 =?utf-8?B?bEFoSGtPZlo4a3lTK2FPLzFxUjVuWldoczhwblJjYk1DYi9BWWJCOHE4R2Vs?=
 =?utf-8?B?dUZqd3JIblVLbWludzRIMjRIOUtrdUpEZE1FVWEyRm9SOEI0VjhncXpoRHN0?=
 =?utf-8?B?cWdGZUVGR0R1S3JwNGI5NHpkYTNwNVhKM0pKLzFnMjZZRCtHT3R4T0hsM0Vk?=
 =?utf-8?B?NVJrRDcxbVNPYWtWdkRXZGhWL3k4V29URlZEems4ZHMwMGVhUDZQSitLS3Jv?=
 =?utf-8?B?L1p2bG0zZm9ncUxQZ0poeDUzdkN5WTVkS0pCSHllc0FKMFdLUStmQS9HdHM2?=
 =?utf-8?B?N3NvVjF5clBIZm5ueXdqNWxlYkNFRGpORG5KZWJScldKWFZ5WkY0RXVCaUlR?=
 =?utf-8?B?NFF0YUxqS2ROVDFnNWt1M3oxa24vWXpYdE1pYUVSTFlrbjNDeExkbnA1bUFl?=
 =?utf-8?B?ZUJHQ3REZDcwNjBHdGVUVHA5RFNTWkZzekFMSWhqUytmY3h6MUdJeVFpMm0v?=
 =?utf-8?B?OEFHOUwrbis4aFNndloyYmswUklqdzZlY3JDTmxUZSs2MkozZ2ZOZ1pZMjZj?=
 =?utf-8?B?UmRLSDFjZ3ZEcEN4aFBQT1pHbXNjbzlEVU55dWRWcG5VRFdrRUNjQWZUdVZ5?=
 =?utf-8?B?Y2lRT3NCUlZwZU10SVAvRnI3ZFJWT1FiTkw0UEVYY2ZBMk1HREUxcjRZeWFY?=
 =?utf-8?B?dVBWa3lKM1ZPUjVKQU52Zm1acVllejVJSzRGYlNiTE1qSGpNNStLUnBWUEdw?=
 =?utf-8?B?Z3BiNGdpMjdZZytSc3B1VFgxN1YzRE91b3NNS3AyY0NJSGczMGJKdEx2SklK?=
 =?utf-8?B?eHprY2dmZmdWK295eGNWVEF0UlQ1RmVoWTlPd2lwWElDQTcvQzVFcjR5eWo4?=
 =?utf-8?B?djNUQWp3YVF5R0Rid3hOSVQ4Y3psS2ZCSGpqZ29oV0hHaUQxRTl1bVJKcTNI?=
 =?utf-8?B?RTI2cGxySVNDUUo4YmNkNjVUZGVtdHRmMFpINVQ3SG9ZTFdxeXk2Qzc5ZUEx?=
 =?utf-8?B?YVUrMUZmNytiNStjK05HV1FiVW5iWEdCUXhwNGU1RlBFTkVXWnNiRUVMcStk?=
 =?utf-8?B?TW45bm1GcURJVW9mRDJCbWlhbzVVSktkMUdKZW5CN1dVV1V4WFQxOFR5VENo?=
 =?utf-8?B?QkY5OCtrdzNQdVdEMnRlN283K3pFQXpGeGl2RU54SmFXekJJYzE3WDZNM2R1?=
 =?utf-8?B?dndyVUEwelNwOTAwWndhNDJ0cmpPN0dqZGV0V21PV0dqWXZ1ZTJLSmZHUDE2?=
 =?utf-8?B?elBmSUpmVE9QdEV5L3J3bzZ5aTA2bWpxdkRXRjJiSnlPejVTZFZ1d3BSR1h0?=
 =?utf-8?B?NXcwY1ppOEwzRTd5dk8wZGNMc3hKY1YyY1hMd0YveXNHWkY4U2J2cDlYdlZj?=
 =?utf-8?B?WlZteS9telJubm9YNkxuS1l5T1F5MkR3YXBHb0taNkNIckc1cGF2TlR3alJv?=
 =?utf-8?B?NGdjcy9nSTFjbytDanVMSHZEQnJLV1grMzZRTVJ5STJ5REtPSHpRVmRSckFz?=
 =?utf-8?B?bE01WVoybjM5Mk1RbmNoUUVSQ2tjZW0vRitFSjI1TE1na1NDYVVRYzB5Rkp2?=
 =?utf-8?B?MmtJc041Mjd3SFA5NmhrdENKYVAyUWt5QVoyRlpJdXhQeXFONi9lN3BOQXE4?=
 =?utf-8?B?N2VJT3BaZmlhdjUvaFdHVDNEUzhpNWVjWG5yQW5EaW1RZVVYTVYvNEhzTWl1?=
 =?utf-8?B?RkRKL3BWQllsVzlLN3B2WlJGdFhRaDlKWDZhcHdoQkkwc29uc21RUUR0dVpN?=
 =?utf-8?B?OGtvZURBTVFDVnp2VS9DOFpnOEJmRWJSTXAxSHp4aW1vUTVCMThzVlZOZERH?=
 =?utf-8?B?R0FYQjBsWTdnUGdNK3o1bnVvVXdMVG5SaGE5QXludXF2dDNTS0MzdlNWRWJJ?=
 =?utf-8?B?ck5FNGZ2VTgzY1RtR0QzT25lT1Q0bjV2cmpkOEhYVC9NMlRycVNEQXM1aFQ1?=
 =?utf-8?Q?A598vAYzu3EA9ps452VFuroqx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780feb06-2842-4659-7d2d-08dbea72a184
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:17:06.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqcUafJ4HjjewtkG5LkpEr0PlpsFZCij8OznedfsG+1jOZ/w1o31qPpw6FzqIjjS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6600
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
Cc: hust-os-kernel-patches@googlegroups.com, Dongliang Mu <dzm91@hust.edu.cn>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.11.23 um 05:36 schrieb RutingZhang:
> checkpatch complains that:
>
> WARNING: braces {} are not necessary for single statement blocks
> +                if (pool->base.irqs != NULL) {
> +                        dal_irq_service_destroy(&pool->base.irqs);
> +                }
>
> Fixed it by removing unnecessary braces to fix the coding style issue.
>
> Signed-off-by: RutingZhang <u202112078@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Subject line prefix should be "drm/amdgpu".

Apart from this nit it looks good to me, but might be already fixed 
internally.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 447de8492594..6835dbb733a2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -713,9 +713,8 @@ static void dcn21_resource_destruct(struct dcn21_resource_pool *pool)
>   			pool->base.hubps[i] = NULL;
>   		}
>   
> -		if (pool->base.irqs != NULL) {
> +		if (pool->base.irqs != NULL)
>   			dal_irq_service_destroy(&pool->base.irqs);
> -		}
>   	}
>   
>   	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {

