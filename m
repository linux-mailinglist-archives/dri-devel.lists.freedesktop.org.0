Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75C716D63
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F184410E40C;
	Tue, 30 May 2023 19:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0242B10E03B;
 Tue, 30 May 2023 19:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3rjE8qXHCyaYlulm6USzPb4w3xZknsgAxQOdYH0mut/C8AssZmOmWRMLdvMVfjWSe0ijFd2ckwj/Jw9zsf54TD3aCh9yBdVVoKRqjFLcVbPwjDFeYPgeD46xAWyrXY3FL6RPzwHNL+rd3G/36KJ3Wurojo8UNDo4/WLuCIUb1aed9+aRu98Op2Sjx+Lbbd5/myEwZ+OgtfQZKQ+tFVLtHbbjLbe4+bLCIl9fTO8pJf9UsxueitGxmPq8LAYbEYEjcyTP2RTW4hjgRK8gXVoxL1iqfKNI89mGWQO4Kon+pbS4NPOXisdXly/CxEDH9r0zNoLAOtBw+LMjT2tKGmB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycvTINdyFB+KpWF28hcPz6PYuOAr2hIOj3HbQp8353w=;
 b=fzp9CPnjh45XLkZEuOpLk/uxQp64GZpKtwq4IMMS7pMrxoHmjxKaAnhuiDaPy7jeK9j9SCVwxTQGdp5ERLua6ODoz6XzKDY5FB44Mu84XknAMNmgRj8u3tTOD1DI973UrA8nIeVJu4SjC/PBmsBIwXRqmB49lyeAyiYI49qxMJv5vnsBvAKI/J7WxvPZuIF12uhP/vvLi2QZvZz0ychTXoCC5/9IFSdxGG8fD0m42fMGEwkY1jeKc9brqv/M3WXI5R8/TzNqtmBI12+J5Ymh3eowz2uk68OP1Ui6IcdYmFs1PAjh5bOBqp+StI0fSdlQzT4iUd64T2ObSuzdQJ2WMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycvTINdyFB+KpWF28hcPz6PYuOAr2hIOj3HbQp8353w=;
 b=yLf2zE46pRMCe/lcd/yz8f3Itbc4iRMJ5wXppatoB/kFU9+sdlI3GSa/11Gp6OcXyuwJpT3ud2eOCbUFKYKPNMhqnNnTaqe9LnQEQIDU0cQAvVYBAG0t9tOLiSE2buJZZwguVGilFsf1FMqpUPli9XF2Da8+uUb8vrZOu6VdhGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH0PR12MB5217.namprd12.prod.outlook.com (2603:10b6:610:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:20:22 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:20:22 +0000
Message-ID: <4c2d8556-1ec9-fb30-97c4-98c93405a2b0@amd.com>
Date: Tue, 30 May 2023 15:20:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/33] drm/amdkfd: display debug capabilities
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-2-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-2-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0308.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CH0PR12MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e06378-6dd4-4e66-160e-08db6142e9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: os0/pXquorl9JLDIpMACnmSlFQUuSUwK2kMD7GVhsnLXFpGjQv6eBLw+KwJWc2Dh7Qke2stN3jRu3lLQgiNBeukXyImLuY+xylF6jFDobEhr0NVaQFhs07c/PeuC9CizjLnuqFQgDGApiB8iej1R8+5gT3EoD1wKdkBeLN3AlRKOWQK3/MU5RFiBjoo6WWw4rhelJjGMsA7FsInFZM+64ELgwWyFoxeX2h14pwsjxa1gKeosRa9YHgpNmWIteGaVOeXbeW/go6OQl5xseDdt46vvEZoSouhxkUEgWP90HVso33fIyUwfd8FdOmO4FcVo0eBDdm6u87DJQQ5Y251rfnPbKsG1Z7QEAxmSPfbcBx6CXtt/xnglCSNADbVXDpTRQgh4wLQ5IGycWKPsV4LyI1l1V21lHYKoGmk58LYg6raLvcif1RKDdZaBAuOAtrlmNsj1YUABziQ+fhoDjVptexPnr0vx3vhCkIbDxfyrf53uKPL0Fpqb49z0YLlaCdIodsu4OJKIUowAhGWPNBuhQdAFDOQriaEJh4PUuukTfwp85xNHA/kfVMczv+Yb/Ua0ZLS4bJTECqWnSBV3i55i3n+sfUgWIA2iHuixx6xUZfeUsmlHLiGuWtB80wmOiY5x4ULCiU5Enbagp+k1ZZSNHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(31686004)(66476007)(66946007)(66556008)(450100002)(478600001)(316002)(4326008)(31696002)(86362001)(36756003)(83380400001)(26005)(186003)(6506007)(6512007)(2616005)(2906002)(41300700001)(8676002)(8936002)(44832011)(6486002)(5660300002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEEwNDQvOU5WUGFFdlVZRXFGUHJKWGkvL2REZVdjdVZmNXBaUTUyZXluV3FT?=
 =?utf-8?B?Mys3eU84NTlVLytJRVQ1R0JJeHY3T3UyZXJMSUJXL0FLWk0vZ0tyaXBFN0w2?=
 =?utf-8?B?ZEMwNVFRdmZzZks1R3JzRW1zZ1Z2SzFrd2xMZHhXQWtRR0Irc1R1MXZDYlov?=
 =?utf-8?B?OE9JWnNOV3Z3Z0lMeGNyRDRQRWh4Y3d4SFJYa2RYMnFaZ01VaUdKdzEzT25E?=
 =?utf-8?B?YS80clJqZkNpcE82cjFhWVdKd2cyRGhxOTZwQWlkTDdHYWRONjRWaU81RkJ4?=
 =?utf-8?B?K0xHYWFScDdPZ1c3N0YwT2syOXprWU9QSEtPZHhsUHVYbnVkcnNuckJock1t?=
 =?utf-8?B?ZWt5LzVZcGxiVDZWL1dxUWhsajlVWkVHanU5RXpUb3ovMEE2NEhFTkljbTNM?=
 =?utf-8?B?Sy84RWR5eGk1SnF4WlkyZHJBTnQzNlRwNEYwYVJhZ3hMYzJReXpibUhaZjMr?=
 =?utf-8?B?TVBJQTdDdVlJR1pyaCtuOHdoRVgvRmpqVmMwMlFtaFRQck9NU2toaEI5bnAy?=
 =?utf-8?B?NHpQdU5aM3p0aXNmOEFxd05hZk9JM1pvY3BwNDh5Vk9GcHQvbDFoNDRicHZx?=
 =?utf-8?B?enliOG42ZHkzaXZ1ejRwalQyUGp5VEQ5dUMySkYyNUNnU05CdEErdU9NWFc2?=
 =?utf-8?B?S1MySTQ5VjZPQVU3bXM2T0VTYXQ3NmRuUXc1MDltKzhQcEVTM0t2S3hLUEli?=
 =?utf-8?B?eEJTTTAvZlVKL2JqbXIzc0FpZjdhakdsN1hmRTNVb2dGalcvaDVISnQ0MlBk?=
 =?utf-8?B?cjFtbkZuWUlvbkFaRVhLSVBBbG1nbm5ZaHJBWEhRMEJvTjk0TlpYV2ZvQ2Fz?=
 =?utf-8?B?OEtyTCtjWFBOQjB5NGt4VHpTTTdDVjM2MFFRRlI3RmpsNitkUEdwOWZZT3Y4?=
 =?utf-8?B?d0R0WTRqb0NkNTFlYncwcWdnMkt6NE55QlB5a1I4d2JxTDBFUS82NXhpeTNB?=
 =?utf-8?B?OWhYOEljL21kUEFSRDE1OC9STStaNk16UmY0TW0zK2QyUGdlemVBRDJUNU1X?=
 =?utf-8?B?aU8yYTJTbENiNHZjS29saldzdzMxQkZBV3VldisySzh2Sk9WQk4wOUxrdFhB?=
 =?utf-8?B?UUtiQnJaMkU3R0hqWUhMR1l3SzRQZzhCcmFLTXFISXo5Q2prQkVqc3BocVFs?=
 =?utf-8?B?UlUxeUxpLzE0YjVtQmM5UC9LMDVpeUJaM3FINXVKVWVrbHhySEcyUUtkc2xl?=
 =?utf-8?B?K2JrSWRyMXlEQ1NMMklZcnVHTkVoTmdIWXdUVHRiSWVER0FENWQvRDZ3UE9X?=
 =?utf-8?B?MjIrUXd4VHNEeUxlRzR1Zy9SK0YxeWdlWmlBbVRBSHU4V2VHUGdEVkhPMWFq?=
 =?utf-8?B?ZnZQUjdRd2RUck1Na1hYc21KZEtZZnliQkpwSkdJSzlUYk5TZ1Vidm5pbU5Q?=
 =?utf-8?B?VW00RUhmMU5zK0txZnM3Zjd6ajFpbjBqTUEyMU4xaHFCaE1rdHJ1d1poeWc5?=
 =?utf-8?B?TzQwdTZsbW1oV0Y2MkZEdFkvOGV4SnViNVNLdktITlFQU3Z4c0RmbkQ1Y2Jp?=
 =?utf-8?B?K1Zhcjk4bSsvbzRlRjF6RnJWb29IRCtIeVFrQ0lWN09STnAyVDdRMDlWYnhX?=
 =?utf-8?B?UVFxbHgwQTRDRmZ2VEU0M2txVFR1QmZlTHN3STE0b1ZzVmUxWS9DL1ZVQkpQ?=
 =?utf-8?B?akpGNUdpRzMxc0xMV2ZaQlNOY1dabnREek1aaUZZSk1XcXpmeDg3dUE1eDV5?=
 =?utf-8?B?dTl6Rklza3JvTG5RVnlQQXppUHRWRjR1MkVaeFcwekpFa0szVCt0V0d5aHho?=
 =?utf-8?B?Qnl3Y2M0d004ZmM4a0xqem1IRDY5Tkx3N1lFNVdZNkNBWGtKZTd6N0MyMEJC?=
 =?utf-8?B?OWhhTVZzL3JJRmk4Q1hMak9ycTBjS2krQ0RwV3FCKytuMXhST29GVkN0TkQr?=
 =?utf-8?B?OWJ2VTNKWW1YWlFiLzNzUE5SK3ZadFVVZkx6cWJpZEVzWFkvZGpVazc0ZUU5?=
 =?utf-8?B?eXVWUTlMSS9ncWNWOTMra242R2FabndycWp5c3JrdjFHZkdCU0xIWlVzSTBu?=
 =?utf-8?B?bUhFaEc4aDg5ZzFNbjkyM1F5cXlyYjBxN0dzNjN4NHFBdjNPT052d1BwR3Ja?=
 =?utf-8?B?a0l0SHBVTWkyQXNydWJJVEdjZVNZNlNXVlovL2V3RDY4YzNTOVg1d0E5azVR?=
 =?utf-8?Q?8m3vlSuzPxgVUwtkVsdKTnDhD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e06378-6dd4-4e66-160e-08db6142e9c6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:20:22.1987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhZzwnsSeQHUyFXBMhskgtCHCui2RhuXfqAaTCQ1aP8v4Hie4yg0Mi/fBH58iw/1SSua9rhhCY9e0xPjxwDn3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5217
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Expose debug capabilities in the KFD topology node's HSA capabilities and
> debug properties flags.
>
> Ensure correct capabilities are exposed based on firmware support.
>
> Flag definitions can be referenced in uapi/linux/kfd_sysfs.h.
>
> v2: rebase topology fw check fix with kfd_node struct update
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 101 ++++++++++++++++++++--
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   6 ++
>   include/uapi/linux/kfd_sysfs.h            |  15 ++++
>   3 files changed, 117 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 8302d8967158..3def25b2bdbb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -535,6 +535,8 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
>   				      dev->gpu->kfd->mec_fw_version);
>   		sysfs_show_32bit_prop(buffer, offs, "capability",
>   				      dev->node_props.capability);
> +		sysfs_show_64bit_prop(buffer, offs, "debug_prop",
> +				      dev->node_props.debug_prop);
>   		sysfs_show_32bit_prop(buffer, offs, "sdma_fw_version",
>   				      dev->gpu->kfd->sdma_fw_version);
>   		sysfs_show_64bit_prop(buffer, offs, "unique_id",
> @@ -1857,6 +1859,97 @@ static int kfd_topology_add_device_locked(struct kfd_node *gpu, uint32_t gpu_id,
>   	return res;
>   }
>   
> +static void kfd_topology_set_dbg_firmware_support(struct kfd_topology_device *dev)
> +{
> +	bool firmware_supported = true;
> +
> +	if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(11, 0, 0) &&
> +			KFD_GC_VERSION(dev->gpu) < IP_VERSION(12, 0, 0)) {
> +		firmware_supported =
> +			(dev->gpu->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) >= 9;
> +		goto out;
> +	}
> +
> +	/*
> +	 * Note: Any unlisted devices here are assumed to support exception handling.
> +	 * Add additional checks here as needed.
> +	 */
> +	switch (KFD_GC_VERSION(dev->gpu)) {
> +	case IP_VERSION(9, 0, 1):
> +		firmware_supported = dev->gpu->kfd->mec_fw_version >= 459 + 32768;
> +		break;
> +	case IP_VERSION(9, 1, 0):
> +	case IP_VERSION(9, 2, 1):
> +	case IP_VERSION(9, 2, 2):
> +	case IP_VERSION(9, 3, 0):
> +	case IP_VERSION(9, 4, 0):
> +		firmware_supported = dev->gpu->kfd->mec_fw_version >= 459;
> +		break;
> +	case IP_VERSION(9, 4, 1):
> +		firmware_supported = dev->gpu->kfd->mec_fw_version >= 60;
> +		break;
> +	case IP_VERSION(9, 4, 2):
> +		firmware_supported = dev->gpu->kfd->mec_fw_version >= 51;
> +		break;
> +	case IP_VERSION(10, 1, 10):
> +	case IP_VERSION(10, 1, 2):
> +	case IP_VERSION(10, 1, 1):
> +		firmware_supported = dev->gpu->kfd->mec_fw_version >= 144;
> +		break;
> +	case IP_VERSION(10, 3, 0):
> +	case IP_VERSION(10, 3, 2):
> +	case IP_VERSION(10, 3, 1):
> +	case IP_VERSION(10, 3, 4):
> +	case IP_VERSION(10, 3, 5):
> +		firmware_supported = dev->gpu->kfd->mec_fw_version >= 89;
> +		break;
> +	case IP_VERSION(10, 1, 3):
> +	case IP_VERSION(10, 3, 3):
> +		firmware_supported = false;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +out:
> +	if (firmware_supported)
> +		dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED;
> +}
> +
> +static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
> +{
> +	dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
> +				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
> +				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
> +
> +	dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_SUPPORT |
> +			HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_TRAP_OVERRIDE_SUPPORTED |
> +			HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_MODE_SUPPORTED;
> +
> +	if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(10, 0, 0)) {
> +		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX9 |
> +						HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
> +
> +		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 4, 2))
> +			dev->node_props.debug_prop |=
> +				HSA_DBG_DISPATCH_INFO_ALWAYS_VALID;
> +		else
> +			dev->node_props.capability |=
> +				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
> +	} else {
> +		dev->node_props.debug_prop |= HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10 |
> +					HSA_DBG_WATCH_ADDR_MASK_HI_BIT;
> +
> +		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(11, 0, 0))
> +			dev->node_props.debug_prop |= HSA_DBG_DISPATCH_INFO_ALWAYS_VALID;
> +		else
> +			dev->node_props.capability |=
> +				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
> +	}
> +
> +	kfd_topology_set_dbg_firmware_support(dev);
> +}
> +
>   int kfd_topology_add_device(struct kfd_node *gpu)
>   {
>   	uint32_t gpu_id;
> @@ -1967,13 +2060,11 @@ int kfd_topology_add_device(struct kfd_node *gpu)
>   			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
>   		break;
>   	default:
> -		if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(9, 0, 1))
> -			dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
> -				HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
> -				HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
> -		else
> +		if (KFD_GC_VERSION(dev->gpu) < IP_VERSION(9, 0, 1))
>   			WARN(1, "Unexpected ASIC family %u",
>   			     dev->gpu->adev->asic_type);
> +		else
> +			kfd_topology_set_capabilities(dev);
>   	}
>   
>   	/*
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index 3b8afb6aba79..cba2cd5ed9d1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -31,6 +31,11 @@
>   
>   #define KFD_TOPOLOGY_PUBLIC_NAME_SIZE 32
>   
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX9	6
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_GFX10	7
> +#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT  \
> +			(29 << HSA_DBG_WATCH_ADDR_MASK_HI_BIT_SHIFT)
> +
>   struct kfd_node_properties {
>   	uint64_t hive_id;
>   	uint32_t cpu_cores_count;
> @@ -42,6 +47,7 @@ struct kfd_node_properties {
>   	uint32_t cpu_core_id_base;
>   	uint32_t simd_id_base;
>   	uint32_t capability;
> +	uint64_t debug_prop;
>   	uint32_t max_waves_per_simd;
>   	uint32_t lds_size_in_kb;
>   	uint32_t gds_size_in_kb;
> diff --git a/include/uapi/linux/kfd_sysfs.h b/include/uapi/linux/kfd_sysfs.h
> index 3e330f368917..a51b7331e0b4 100644
> --- a/include/uapi/linux/kfd_sysfs.h
> +++ b/include/uapi/linux/kfd_sysfs.h
> @@ -43,6 +43,11 @@
>   #define HSA_CAP_DOORBELL_TYPE_2_0		0x2
>   #define HSA_CAP_AQL_QUEUE_DOUBLE_MAP		0x00004000
>   
> +#define HSA_CAP_TRAP_DEBUG_SUPPORT              0x00008000
> +#define HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_TRAP_OVERRIDE_SUPPORTED  0x00010000
> +#define HSA_CAP_TRAP_DEBUG_WAVE_LAUNCH_MODE_SUPPORTED           0x00020000
> +#define HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED  0x00040000
> +
>   /* Old buggy user mode depends on this being 0 */
>   #define HSA_CAP_RESERVED_WAS_SRAM_EDCSUPPORTED	0x00080000
>   
> @@ -53,8 +58,18 @@
>   #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
>   #define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
>   #define HSA_CAP_FLAGS_COHERENTHOSTACCESS	0x10000000
> +#define HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED   0x20000000
>   #define HSA_CAP_RESERVED			0xe00f8000
>   
> +/* debug_prop bits in node properties */
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_MASK     0x0000000f
> +#define HSA_DBG_WATCH_ADDR_MASK_LO_BIT_SHIFT    0
> +#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT_MASK     0x000003f0
> +#define HSA_DBG_WATCH_ADDR_MASK_HI_BIT_SHIFT    4
> +#define HSA_DBG_DISPATCH_INFO_ALWAYS_VALID      0x00000400
> +#define HSA_DBG_WATCHPOINTS_EXCLUSIVE           0x00000800
> +#define HSA_DBG_RESERVED                0xfffffffffffff000ull
> +
>   /* Heap types in memory properties */
>   #define HSA_MEM_HEAP_TYPE_SYSTEM	0
>   #define HSA_MEM_HEAP_TYPE_FB_PUBLIC	1
