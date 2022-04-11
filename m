Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C898A4FB107
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 02:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB27010E319;
	Mon, 11 Apr 2022 00:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215E710E2FD;
 Mon, 11 Apr 2022 00:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7HLay4yaiTFeaePfi5i/9bl0LJI4VHbgHQld0rPu+JGhVZ7gzM4xaiB6uWRDY1dKWHiAr14yvnw3pZ1Q66+mdH98Jgedq/rMPdrPjSsmkjzX4K4PutyoXG2+GEsiiLEiGymo6ii+TSGcPxv1jz3mmP0COu30TMGdZOQmtwRswKX1uTfXdBs+nv9fzNIWGPoAMdnPO0u+JBobk+R2dUeXFN+joMryedtEFkHQo4cVQKw9VV4Z8T8+qBUwF/6sKK56PA+IeurZemKlN/AqmIw+oWEnXp8V9IhsYsMdJUDo2Zo+ZZOhnwL/IRHqn4VSvgzCqNseYtPeM++O+j7hyYfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCwdFPIK4uXaiYfTEEdCj77aSTfaJm88lPClAB6YWFM=;
 b=cO40pfl+oHPgrbDyIFf5qjJOudseyvHoCL5oemjbaTSxb9Df/+qz66IMPMKHo4nq8Tl1tgNbazjdgSIxbzwmNEU/IT02faegktkgGg/yBveZSVE0oXwpUBateux/hyP94Fu4p66OMo+35ZqJ/pCAfeVXExh8OZXdoqRtzmDVO5X9Ft/ViLwB/MwVN9+CXiW3vU0f8vicSwv737cJhmh7NDiHtbkToi+T4enayfNi9bLawFRMCRTqVB3S2m1o+50wu68ePAHzujFqDglrXGFr9IqB3we72vr3UXu32Iw8/pdfC0V4BJa9zNQtGN9tuqtoC/BY1W66fB5tW9eoH4QiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCwdFPIK4uXaiYfTEEdCj77aSTfaJm88lPClAB6YWFM=;
 b=2yFSTP4dfyNDlhA/xl6rQaE5PddB8mmBMIDVLpjsfZPpe9S3K1cnw9sVlDuiHawPtgXi4YaQlE5i4XieaqQdYFVsto2LJFBSapf1XcHGcUHerGlFNyz2nHq6p+C3RKXPWXbzkgVcNxfI0u1fvNF66gTdzf279eh7D0aF/vrhFDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 by CY4PR1201MB0072.namprd12.prod.outlook.com (2603:10b6:910:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 00:30:10 +0000
Received: from SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f]) by SA0PR12MB4526.namprd12.prod.outlook.com
 ([fe80::7ceb:a37c:cd60:9d5f%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 00:30:10 +0000
Content-Type: multipart/alternative;
 boundary="------------vaYlf0zfMaa4R1X0VSshO90o"
Message-ID: <f60dda88-c487-60c3-e217-588955894c78@amd.com>
Date: Sun, 10 Apr 2022 19:30:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv2] drm/amdgpu: disable ASPM on Intel AlderLake based
 systems
Content-Language: en-US
To: =?UTF-8?Q?Nils_Wallm=c3=a9nius?= <nils.wallmenius@gmail.com>
References: <20220408190502.4103670-1-richard.gong@amd.com>
 <CA+nq7DsCU97Ana34GcyQZ_GzR4eiQbzkzPLUBRQTAtNYa-OiLA@mail.gmail.com>
From: "Gong, Richard" <richard.gong@amd.com>
In-Reply-To: <CA+nq7DsCU97Ana34GcyQZ_GzR4eiQbzkzPLUBRQTAtNYa-OiLA@mail.gmail.com>
X-ClientProxiedBy: BL0PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:207:3c::30) To SA0PR12MB4526.namprd12.prod.outlook.com
 (2603:10b6:806:98::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71f468e6-b172-43bf-5327-08da1b526fc0
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0072:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0072D9DB04B932383D091A4195EA9@CY4PR1201MB0072.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MWE4fsUWsnZnZbYok94Jpm8eqof4tBMrecCxLJJ9gCZrAKIUHEbwyVDwz/KwmmPQ/P+RavNZda8Nt8vdBUxX27CeAWoMrFoAnsMQRcx9L6Ovz+MFkznS4Hpx4cGwzmvJZO3nXV6dPSFjwzj2ij+v8+6Y7EwTn5En2pEl8ouE1Ee1sXFQdtvSlUKuI0xrA8XbaheoRyOrbxq7NOMKsD81ULH2suFUr0jDVAeOkwISQzfHVieZydX9YnhCEWVY13cfoMTxuwDIXXUS0EBFQR9Tya4zpaSpzJmGzo3bIWdmnEOikeo8s8DfMgSuBAmotOmiiwxzKocqEjZKR5bX+uIcjINCDTvDcdsN6Xy7YjRmcjQFfxMj+Sad6bmGDSc2WtQo4MwUppgkbjtFJ/s7ljErfzJNdgyc09xHQm4u05CoTJwrqA4c6F9x7oryxchEnIRq+5DtFYxtkB+KzsnDHisx+sixwis55Ec2ASRdwU2If3izbENRN3f2EIoEsiwfmC5zsPKDeKmbwZbHhp6qEVjBkNWmpSq9g22u6q1xNDmceCNkrAmzpOATYg92C/rppjwIkA5wuILZmD2aXAhQf2/tZufouaG+YtXTXmQTMPhsPY1DO2MhJfOUfxI3VAgs+uRq/IvyeLKXfIB0PMUwq41bUz1Fqu24BVfN+o0ny6GVCwgP0WGwVs14IhW5MoVuPjku2u0cZKq9E2+IcoT2ha03sT58jH7zqX3lA2LRoaGgEEdaZnQTQn3G6irdbvFWgvks
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(8936002)(166002)(31696002)(186003)(38100700002)(2906002)(5660300002)(6512007)(316002)(66476007)(53546011)(26005)(6506007)(33964004)(2616005)(54906003)(6916009)(508600001)(36756003)(966005)(6666004)(6486002)(45080400002)(4326008)(8676002)(66556008)(66946007)(83380400001)(31686004)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnJJRTZYam93cGVjUGx4bFN6N1ljU1ZSRTVJa05PbXA2T2xMWmszU1E5VHpK?=
 =?utf-8?B?Rm5GTmVWVXJIU1czQWFmTW13RE44U0hoSmpZYmtrOUxVTW05S3dHUkkxd3lr?=
 =?utf-8?B?clk5VWRYTlVpMW1EdG5IMjdYVDJha2hSb2Q5TEU1TFk5WW00bXE4UUVnQ21Z?=
 =?utf-8?B?RkFvYTRvcnlGbWhCb0txOXVLeTB2RzRaN0RBOEdkem14ajg1c2xGUU82RUtl?=
 =?utf-8?B?LytCbHo0UVBWTkRkS2hqMWk0eVpoYVNxK2pGc1ZSckI0cnV5UXVFc0NNSXhI?=
 =?utf-8?B?MEZxTXBFaFF1OTE4L2NjS2tVZFIvaGYyWW9Eb1I5TW81T09lNFcyRkQ2bmwr?=
 =?utf-8?B?dW5SVFpKcWgzWll3dDBZVGlGV0FBRzNWaWdYcFhyTm5KaTVkL1BGSm5UQlZF?=
 =?utf-8?B?UVVaakVRWlBuOUxQSnZJTktkUmFubGhNQ0tLRlB0UjVZYkJzWFJvRDhDSWNF?=
 =?utf-8?B?eW5oa2lldVA2OHIrMFY1WUM2cXk3UHlvNjJDKzJlSnJpaldSYUIxdHhQMmJi?=
 =?utf-8?B?ZU01UmJTN1E4L0NHdGNMY1NWNjUxS1BXdDM2R2EweGJMQi81TmdEMXIvSlQ1?=
 =?utf-8?B?U25sSnNKNVlyN2hNUWNHUEt0TTRLVm9xck5EK0dnYWZodWVvN1JHbk1WQWFx?=
 =?utf-8?B?ODhLeG0vZDN6QkJIeCtFbFg0STR2ZHFtUTJmRk1BcGVUV1VDcno5MDMzcSt5?=
 =?utf-8?B?ZGlMWXpCL2ZtT0pZemc3ck4xdFNoU3BPbnVRS1lJMVkxWGxFTDN0U3QxT1U2?=
 =?utf-8?B?TVdLbnFJRW1PU3FES1R3cFNNM3N2ei9WdWxFUENsTExJd1BZcFJPazZIRDdO?=
 =?utf-8?B?TDcwTXBPcTgxMHRKUkQ1N2VOQnNOekRVMVR5T3VhL2tXY1MrVHNBaUhjdVhS?=
 =?utf-8?B?VG4zbnFDUzFDdHNpRVZGcDVESXBWS3JRMTRqbHA4VHpMZkllbndKdnpSUUoy?=
 =?utf-8?B?Vk54dXpLdmVDdEJ3djkyWklMZU91ZTR5SmVtU3ZwYjVsbXMrQ1I5RDFER3dS?=
 =?utf-8?B?SnhDTE9DMEp4aE1nWDJsUWdvQWhhcklxS2pYTlNVTEk4WTJnL3lMK09HWFNF?=
 =?utf-8?B?Z1R1aUVoSzNoeVB1ckI2Nk5RNm1QQllKWko5Qy9EaUxlSFUzejNHSnNZNjNy?=
 =?utf-8?B?WU9TUFlsUEZoS0N3ZGc3dkdQUHpOYjNMU09EODZvanhlUXNpYmJ6Rlh1Smpn?=
 =?utf-8?B?YUg5eWFsSG0yY1hIOWdxdUJXb29NeUFJTDRYVDIyREQrUWp0VDJXbzVMcktP?=
 =?utf-8?B?N3BwNFU5WXdibEYyMmRMTG5tbStsTjlvWjdkc25CdG85cG9oOXFRVDVHN05R?=
 =?utf-8?B?Q3FlVFd3ZkF0Y1VVa09RaGw3dzRhei9adEdIUzlPZlp0djVWMHY2aGtta1BK?=
 =?utf-8?B?WVBUUThwZXRkWVdsanJpSTU5aTVZKzVyWTNLL2JnWVovNVphblNxYUlBdjAv?=
 =?utf-8?B?bFhGWGFqUUVmdkFNaVJNVWp5Z0Eva1dzeXZ0YUhFc3QxSVJGSVBneWt1c2Z4?=
 =?utf-8?B?YTBUditaRG8xWi9zQXZVMlliSW1ZbXFOUmFZWWZCdTN3dXEvSGVGYXNoWjBY?=
 =?utf-8?B?SG1qSkxYUFhoMVMweUFUNE5iRUpzeU1VV2Q4KzdkZTZ6VUU4UzU3OVRIeEpD?=
 =?utf-8?B?ZzAxelVzaUkvbTc3bjk3aVkxR1pTZE9UczI5ZXhSMW9FYWQySWdhQ1FlWGlv?=
 =?utf-8?B?djExZ0FnOUczQ2ROeUhoOEdENUJHd2RTMVVzQ1dOYmRlRTF6OUNYR1A5QWNM?=
 =?utf-8?B?V1hnc2xhdmprUVc5cHJmUnNGTUE5L2dhaVdUTVpVL3orcXlKZkJsM1AyMndp?=
 =?utf-8?B?Yy9kVmRqM2dQMWMxZllQQnpRUGpDL3pFeUE3UERYZlF5bnRHNzJ1aXJRcWlv?=
 =?utf-8?B?SjlRa3QwMHdDREFZVXRPaHlOTTU1eGkzNS9pMy8ralNkUUt5SGdsdzk4Umwv?=
 =?utf-8?B?OHRyUzI1dzVNbjEvU25QbEYxcTd1WWNHelNVMkoyQlZOeXBHM3hQZ0VoeS92?=
 =?utf-8?B?ZnNBVnRLRlhjZzNuMXJqRkpqUXIwVzlXVjVPNEVyUi9wcWRVMU5FRXBPdy9T?=
 =?utf-8?B?VTdEMzlObjZwSVQvaXhKZThJRXdwY1oxM1dVUnNTTHVobVBHdmNXS1JmR0M1?=
 =?utf-8?B?dzQ2Uko4OE1XTVBhd2h6ZmxqMDFqMDVleHdnamhzMVlSN2Z4TENRdjVacVhv?=
 =?utf-8?B?WUY1d1hvTzEyNEFtY05pZ3hMdzlFMWZFZEpOaEpnRFhULzhqRmx2aUdGcFdM?=
 =?utf-8?B?ZmtYeUNKWUZhUCtqUGs3RUpZci9GYkdGQzZhMXFEakV3K2VQckp2T2pWL29s?=
 =?utf-8?B?NTh4YVlJeUZsVlpJV0hCKytrU29NZkw4SDNsa2FOelhMaFk3YUFsZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f468e6-b172-43bf-5327-08da1b526fc0
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 00:30:10.3739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oqHyKKFQRxGuYzZhDn5kT0ebz3wroucSOn/Cc6FKeHWw3OH5GURhCA6PEj1BCVA6iHoiVxwG1KK8XBZf6K2Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie, xinhui.pan@amd.com,
 linux-kernel@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mario.limonciello@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------vaYlf0zfMaa4R1X0VSshO90o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nils,

On 4/10/2022 8:54 AM, Nils Wallménius wrote:
> Hi Richard, see inline comment.
>
> Den fre 8 apr. 2022 21:05Richard Gong <richard.gong@amd.com> skrev:
>
>     Active State Power Management (ASPM) feature is enabled since
>     kernel 5.14.
>     There are some AMD GFX cards (such as WX3200 and RX640) that cannot be
>     used with Intel AlderLake based systems to enable ASPM. Using
>     these GFX
>     cards as video/display output, Intel Alder Lake based systems will
>     hang
>     during suspend/resume.
>
>     Add extra check to disable ASPM on Intel AlderLake based systems.
>
>     Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
>     Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&data=04%7C01%7Crichard.gong%40amd.com%7Cd46b7fb14c6d44a277d408da1af99f63%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637851956929855129%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=B3SXfB65dqx3EBQzUZh6xCmtpO9ynPj3PvwrWe9Q%2BpU%3D&reserved=0>
>     Signed-off-by: Richard Gong <richard.gong@amd.com>
>     ---
>     v2: correct commit description
>         move the check from chip family to problematic platform
>     ---
>      drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>      1 file changed, 16 insertions(+), 1 deletion(-)
>
>     diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
>     b/drivers/gpu/drm/amd/amdgpu/vi.c
>     index 039b90cdc3bc..8b4eaf54b23e 100644
>     --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>     +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>     @@ -81,6 +81,10 @@
>      #include "mxgpu_vi.h"
>      #include "amdgpu_dm.h"
>
>     +#if IS_ENABLED(CONFIG_X86_64)
>     +#include <asm/intel-family.h>
>     +#endif
>     +
>      #define ixPCIE_LC_L1_PM_SUBSTATE       0x100100C6
>      #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
>          0x00000001L
>      #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
>      0x00000002L
>     @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
>     amdgpu_device *adev)
>                     WREG32_PCIE(ixPCIE_LC_CNTL, data);
>      }
>
>
> There's a typo in the new function name apsm/aspm. Btw might be worth 
> a comment why this check is done?
>
Thanks for review,

s/intel_core_apsm_chk/intel_core_aspm_chk in the next view.

Regards,

Richard

> Regards
> Nils
>
>
>     +static bool intel_core_apsm_chk(void)
>     +{
>     +#if IS_ENABLED(CONFIG_X86_64)
>     +       struct cpuinfo_x86 *c = &cpu_data(0);
>     +
>     +       return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
>     +#else
>     +       return false;
>     +#endif
>     +}
>     +
>      static void vi_program_aspm(struct amdgpu_device *adev)
>      {
>             u32 data, data1, orig;
>             bool bL1SS = false;
>             bool bClkReqSupport = true;
>
>     -       if (!amdgpu_device_should_use_aspm(adev))
>     +       if (!amdgpu_device_should_use_aspm(adev) ||
>     intel_core_apsm_chk())
>                     return;
>
>             if (adev->flags & AMD_IS_APU ||
>     -- 
>     2.25.1
>
--------------vaYlf0zfMaa4R1X0VSshO90o
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Nils,<br>
    </p>
    <div class="moz-cite-prefix">On 4/10/2022 8:54 AM, Nils Wallménius
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+nq7DsCU97Ana34GcyQZ_GzR4eiQbzkzPLUBRQTAtNYa-OiLA@mail.gmail.com">
      
      <div dir="auto">
        <div>Hi Richard, see inline comment.<br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">Den fre 8 apr. 2022
              21:05Richard Gong &lt;<a href="mailto:richard.gong@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">richard.gong@amd.com</a>&gt;
              skrev:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Active
              State Power Management (ASPM) feature is enabled since
              kernel 5.14.<br>
              There are some AMD GFX cards (such as WX3200 and RX640)
              that cannot be<br>
              used with Intel AlderLake based systems to enable ASPM.
              Using these GFX<br>
              cards as video/display output, Intel Alder Lake based
              systems will hang<br>
              during suspend/resume.<br>
              <br>
              Add extra check to disable ASPM on Intel AlderLake based
              systems.<br>
              <br>
              Fixes: 0064b0ce85bb (&quot;drm/amd/pm: enable ASPM by default&quot;)<br>
              Link: <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=04%7C01%7Crichard.gong%40amd.com%7Cd46b7fb14c6d44a277d408da1af99f63%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637851956929855129%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=B3SXfB65dqx3EBQzUZh6xCmtpO9ynPj3PvwrWe9Q%2BpU%3D&amp;reserved=0" originalsrc="https://gitlab.freedesktop.org/drm/amd/-/issues/1885" shash="QJ86gCfnpDRZOYDu6DNKyhICvZCTAiKthyZJL7UwoaEmZWBseLQiGXPOKcbAes5grQMqNdYcl0xvG4KtbFZYpfMpiwjpPMWdd8ZKhwzKyne9wejyvRaDfhuo7NK6KnKdzlOtP8yxfR4sMoMZaOxTy/GCBFSKgVT6cmg5w2urqSE=" rel="noreferrer noreferrer" target="_blank" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/amd/-/issues/1885</a><br>
              Signed-off-by: Richard Gong &lt;<a href="mailto:richard.gong@amd.com" target="_blank" rel="noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">richard.gong@amd.com</a>&gt;<br>
              ---<br>
              v2: correct commit description<br>
              &nbsp; &nbsp; move the check from chip family to problematic
              platform<br>
              ---<br>
              &nbsp;drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-<br>
              &nbsp;1 file changed, 16 insertions(+), 1 deletion(-)<br>
              <br>
              diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
              b/drivers/gpu/drm/amd/amdgpu/vi.c<br>
              index 039b90cdc3bc..8b4eaf54b23e 100644<br>
              --- a/drivers/gpu/drm/amd/amdgpu/vi.c<br>
              +++ b/drivers/gpu/drm/amd/amdgpu/vi.c<br>
              @@ -81,6 +81,10 @@<br>
              &nbsp;#include &quot;mxgpu_vi.h&quot;<br>
              &nbsp;#include &quot;amdgpu_dm.h&quot;<br>
              <br>
              +#if IS_ENABLED(CONFIG_X86_64)<br>
              +#include &lt;asm/intel-family.h&gt;<br>
              +#endif<br>
              +<br>
              &nbsp;#define ixPCIE_LC_L1_PM_SUBSTATE&nbsp; &nbsp; &nbsp; &nbsp;0x100100C6<br>
              &nbsp;#define
              PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK&nbsp;
              &nbsp; &nbsp; &nbsp;0x00000001L<br>
              &nbsp;#define
              PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK&nbsp;
              &nbsp;0x00000002L<br>
              @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
              amdgpu_device *adev)<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; WREG32_PCIE(ixPCIE_LC_CNTL, data);<br>
              &nbsp;}<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">There's a typo in the new function name
          apsm/aspm. Btw might be worth a comment why this check is
          done?</div>
        <div dir="auto"><br>
        </div>
      </div>
    </blockquote>
    <p>Thanks for review, <br>
    </p>
    <p>s/intel_core_apsm_chk/intel_core_aspm_chk in the next view.</p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <blockquote type="cite" cite="mid:CA+nq7DsCU97Ana34GcyQZ_GzR4eiQbzkzPLUBRQTAtNYa-OiLA@mail.gmail.com">
      <div dir="auto">
        <div dir="auto">Regards</div>
        <div dir="auto">Nils</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            </blockquote>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              +static bool intel_core_apsm_chk(void)<br>
              +{<br>
              +#if IS_ENABLED(CONFIG_X86_64)<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;struct cpuinfo_x86 *c = &amp;cpu_data(0);<br>
              +<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;return (c-&gt;x86 == 6 &amp;&amp; c-&gt;x86_model
              == INTEL_FAM6_ALDERLAKE);<br>
              +#else<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;return false;<br>
              +#endif<br>
              +}<br>
              +<br>
              &nbsp;static void vi_program_aspm(struct amdgpu_device *adev)<br>
              &nbsp;{<br>
              &nbsp; &nbsp; &nbsp; &nbsp; u32 data, data1, orig;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; bool bL1SS = false;<br>
              &nbsp; &nbsp; &nbsp; &nbsp; bool bClkReqSupport = true;<br>
              <br>
              -&nbsp; &nbsp; &nbsp; &nbsp;if (!amdgpu_device_should_use_aspm(adev))<br>
              +&nbsp; &nbsp; &nbsp; &nbsp;if (!amdgpu_device_should_use_aspm(adev) ||
              intel_core_apsm_chk())<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>
              <br>
              &nbsp; &nbsp; &nbsp; &nbsp; if (adev-&gt;flags &amp; AMD_IS_APU ||<br>
              -- <br>
              2.25.1<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>
--------------vaYlf0zfMaa4R1X0VSshO90o--
