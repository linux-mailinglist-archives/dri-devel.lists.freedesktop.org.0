Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05049F62E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 10:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C2E10F139;
	Fri, 28 Jan 2022 09:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F010F133;
 Fri, 28 Jan 2022 09:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGYWA2XPOGqxSPYeQbaq2gLuQAul0ZehH7qEbfOvxDFLSAUWlpmaf+3gqhW5+swUzhevMRFQY6Ra457CvAmZlfvkhuLTvsTMdbc7F0UcaL7IEQgqlUutx8ZU9vO6kSgDeV+ug6idP//He4uNEPDSf/PD80fTjYvw4B9yLj7hw4255XIYZZyCwZYJ3kjWeBsnlG4CEzlhDlqj/GucIMfWScVvl4SjG+mSbU+OOfgpl5Sbw7ZIm74NJxqajMx2biTkIJRidpcEW/88ESRQZXAQ5OHTr4lJ839rlNizt/jLKuje/6n4anNb0zeFMtXlrPJ8d8Y3l1pE5Z7DHheT4IlGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNHqMKBPQPHzzTSr7gkme3Uky0Lo/rs6L+1098Fuj8s=;
 b=YX8tZMLu+bJXXegXRBZeh8uNWH9O8s7snoaneIMc10F2B3LVGmj/DdECvXiJEDnOzThdotM4YC6awsRu2EJIQmJ+jfaCay/SEWwt0K9B9tDpeIAOJnoeJoHjdY7J0ApEqQQFkd+vfNLF9JHQ9P90BQQ6QeEqc0xlRC+SKwrU17iopLIOJhBjiRpLuf3nv+K34jgL1vr3uByjaawojlzHg/qYsxjnAHFY8dNPuJKgY6snlPZ2Xdq9VIlOV5fEIqWvDesW7c07OjpfLfye2x7dtCo/Jl4rFtzyrsFejWRostTxhY2OCKOJcHJY0vzQekTCJT1gjAojWGmYS/NAWbUb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNHqMKBPQPHzzTSr7gkme3Uky0Lo/rs6L+1098Fuj8s=;
 b=zw3xtLRGkhYV+GDe9onOtKVPAtWFtzzeGs6JhsNe6ItdKnlX1zRbbTtuiW3Msvgz7PoPDV13l7Ot7vxzwPjhHVWMWYuJWh6uJ9PD/EXnFHkwdQjkNUXtCt08MWb4uVCiLCLT3V/lx8t/X5GvC4jeNhHcPJ0k5oyD9K2CXa4q6wU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3394.namprd12.prod.outlook.com (2603:10b6:408:49::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 09:22:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Fri, 28 Jan 2022
 09:22:07 +0000
Message-ID: <27870484-6d16-5bd4-aa06-0ec513111d99@amd.com>
Date: Fri, 28 Jan 2022 10:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/14] Rename dma-buf-map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
 <a45a8cef-f5e7-604c-64f1-e893ec9ba8af@amd.com>
 <20220128091213.qaq6v4vbeerzvd3f@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220128091213.qaq6v4vbeerzvd3f@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c112b5e9-b9ed-4873-4a5f-08d9e23fa748
X-MS-TrafficTypeDiagnostic: BN8PR12MB3394:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3394F06E12BE6050B1A288B983229@BN8PR12MB3394.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udxKQ8+sHIHK0e/ERkI+cBGCNf4M9IMcV2naDuzXH1x/vOehgngK3qes24lWOBjr4X/GC8umA1kmQw/EyNOrrUHLEH5S59lXJ/vHzTsu48ZlCf4j7PsyEqTbhMlsb3qErcOkvdJT/QYhPeWaULJjkiwWh5tRc5d1ngAPaLV78jyUfFjflPVLZKPDCGMJUjaRPobfa4oFKfxUgmGqUuhEpg6QcTcBn7oQva8eXPWLL9Uo8tlfYrmfU/xNZ+Tr98tXsSGokRcOBkk1AwmWyyP0jpWeZNlM1Jb3l3XMxuAoYf3Wrf/SDEi9MNinm6Io+FyeTRSYOL9nIa+p6+449peqimvsLuOE7LkP0nEj3fW09UIXNXF9j9O44V34v7av1Xtpvvobh4yw6dMPQsHjQO5YFfU2Xhp+cxamD2xxa3vXswVlfUlQgrspx7K2FzJQFIqKj7/dJDXgDPnEVZ4GCwOlUniWUedaF1Ia9tJuVDeaR0By+vufxjZPCNIev98awiOqGXrDTaT5KYPqpn1hGSxZEZkrxdVD1ebZxiO2psAmh13AHtrQ0TSmOxbRgFrdBDqN4/gL4VltJdSAmZNHtVpmLTCQrJOlNcBjltSIdZXANMQczQyyjaGnQXbyY7hEo7oz6QiflQK62qsX45dOLdE0QLME4Mrb212TjeZBjRJdb6EHnsZRupBpiGI8rKuAUggmbDUnNorkxq+BgIr1AERcgRCMGyR+9Z9HHJercb4MvR1fpS/CO/W+IJqZc4nQCutdPlTqkEacvi8BfsMA3/lGVjHa77xaSwakTXKROlu6ZphG9DcKAnwTLyn+gfiTER6m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(66476007)(66556008)(2616005)(31696002)(36756003)(6512007)(8936002)(31686004)(8676002)(6666004)(4326008)(6506007)(316002)(38100700002)(7416002)(5660300002)(45080400002)(508600001)(66574015)(86362001)(186003)(6916009)(6486002)(2906002)(966005)(43740500002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUhyR0Z5U3RuZDBqb3BNdzQ2YzdFRlIvVWVPTmxrSlJTYnFHQy9YR0ZNUFBQ?=
 =?utf-8?B?TU1sSVliZE1SMlFqWnVyM0tPZmc1Z294dDVaSFhtZkI0UUU5OEtSaWl1Z1ZK?=
 =?utf-8?B?eWF5cDY1NklJQkZ0OGVuak5ueXd6aTlhSGdkVi9lNG1qcHdhY3VTckZLdjRN?=
 =?utf-8?B?cnd0bmxtV2hpN0ZxUm1zTnZUR1NkSHc2RzRHZUNDVFZjR0RWbGEwb2xlYWFM?=
 =?utf-8?B?MTNPdUhlZHFpTUE2YXV5Z0RueGNJTE9zVFBCQXpreHI1Q01PSGZiNDJ5YU0r?=
 =?utf-8?B?b3l5cWFtY0M2Y096OUdJRnIrMjBWL3dyMXIvQzRYckg3Ym92QVU3N2xpRnJn?=
 =?utf-8?B?WVRGOFk2TGZLTkhWYk02WVVvbHRBZlNUakNCNEk4TzJFN2ppQnpLbWppZ2tu?=
 =?utf-8?B?NGhYSmlRS3g0UXRaRURTN2IrbmszVVU3aUNmb0RYeCtzeDZEYmNKSm1lWjRq?=
 =?utf-8?B?bVh3K25rd0F2MWVxS2lRZnRsTG5sdE5VSFhIb2p5TTZKeUw1YkdzTVpZeDIy?=
 =?utf-8?B?UzdOeEFaZEdEOU85NDhQOVRFRWo5OTdvUXZHUzVBM1pSUEN5ZW9rcXF4eVZx?=
 =?utf-8?B?TVBQbm1pdkhSbFErMURPUnA4WlY4a09vMjRQRHk0aU1GK3FwN0YvWi9Cb1pI?=
 =?utf-8?B?OS9aNTRmZHRJcHQ1cnN0SmMwYXJrcDh6ZVp2dGRhdDZvcVNTTTlWVm9ETzNW?=
 =?utf-8?B?M2ptUnpldEpSMFF6RTMvTEZuVzl4WHZVeXJqcTh4N2Qya3hRSHlWWnBJWE5t?=
 =?utf-8?B?aWhBamF2OFc2bDBxVTRNaFNtYmZyQnR6WHc4dXVOV1NwSWp6bVdUbHVrMXk2?=
 =?utf-8?B?T1RhSkZwZkhuWVh3YVVsVnM0V1UwRzQxQmZVTHBocHNHZXRkdHAvaWlFbGdr?=
 =?utf-8?B?SzMzdytGb1JvSHlxelNzaGNzanJmbk9TbUZtVU41ZWdmR2lTZ29VUWpJTDNO?=
 =?utf-8?B?RzJXSDN0dTRDazdsbjZRZHhCMWFCQkpUU3BvZjAvanpzWE5NcUNib3NtOWV5?=
 =?utf-8?B?NDg5VDEwRkl2cDN1d1NidEFCNzhsSkVPTzRIWGwyN3VFYythWWRsUU80aGNZ?=
 =?utf-8?B?bDZoKzd5L2ozZUxzR1FCMGZBOHgwbGFtRUZyOWY4bkQwRkt2MThXN3hEeXFz?=
 =?utf-8?B?T0pxM2RGc29JZ3RJekhvU1VuZHkwSWpYcTBZcnV4Y3R3RmZBczR2aFNUWUx4?=
 =?utf-8?B?OXhkM0EwdSt1Y25UV3o5ZFRPdW92dzZyelZHWVh0V2VUdFF1NU1pbnE4bWpu?=
 =?utf-8?B?bmIyUzBzVVB0cVFBbXhVSzE5U0ljRWlheEUrT0UwUG9Vblp4OU5UclVuUi9i?=
 =?utf-8?B?RTlsUExLeWo4ako4RTc5K3RLeEh3dGZSbXo3eFhzMDd6SUFuNHJOQkM1U1Jy?=
 =?utf-8?B?a3AwTmF4QWtIbG1XaDJNRVVSY3FDaFpiWHVlSjhaT2dMWFJFeExwZW4zNWhk?=
 =?utf-8?B?YVpOZFZhazEzb2t1dnRkTlgraDA2WklmdGx0K3pvV3F3ck5wZENIMmlHazc4?=
 =?utf-8?B?VzRDQlA1TWt5cm9vTzVKSFJlb1lmQldOWHYvd09RL3hUc3V5Wkl5cTNMS3Zl?=
 =?utf-8?B?WmlyREJUNUpWQlF1clZNS2xHdmNjVHEvTlF6Q1dRRGVkRUxsdDRWSHRQV25Z?=
 =?utf-8?B?SmlHeW1qYW5YSTI0NWM1dFRVdlA4TUxqRmtIM3ovNkhXMWtVNTJiL2tXUzE4?=
 =?utf-8?B?cW8yRTlTWmxiMm04eEN0ZEM1K0x0S0xPZ2syVWxzNVhiNnpUNldHQTgyeHJU?=
 =?utf-8?B?VXJJWTRkVmRLdTJPaXp2QjJaTEk0RFNIVHViRmh3WG9uRjUwbGRnRGFSY3h1?=
 =?utf-8?B?TWVHcGpteEdXVEE0VEFFZnVETVV0ZnpFQmpYZCtWVEVrb0YzZzRWYUVNZlJN?=
 =?utf-8?B?cHJNZHhVYWxQSzlsUTJQUG9lRHkyQTBiMjVvNUlTd1VKTmJTVGFrdHlMam5V?=
 =?utf-8?B?czZIcW9NTzlBQ0ZKQTNJbk8zYjdzem8zaEdsSTdDaE9BV1Y3RnE1MTg0NElh?=
 =?utf-8?B?VWZQVG5IRis3UC91ZVZLRDFTQ1I5N3BlcDMzalc2bGplQXBHNEoyU2hIY1JP?=
 =?utf-8?B?Z3hwNlBoOEIrNjFZYU8rZjNPcEljREdqNVM5djRTQVpncVlvZENHL3czdUEz?=
 =?utf-8?B?aGc2OTRMMmF1UTFZSDRVNWFaenF2Wm9uenpHV1NIdzhoNnVvTU4ycjJ2c3Vl?=
 =?utf-8?Q?AlcIqbt8Sqcayph55E2lxMM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c112b5e9-b9ed-4873-4a5f-08d9e23fa748
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 09:22:06.9016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWm4ACDCaCf6rUyAoUSi+4PwEvL+86JWSbvcU9liouynKwEW7eQxNCQwl+o1Ybzb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3394
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, srinivas.kandagatla@linaro.org,
 tzimmermann@suse.de, gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.01.22 um 10:12 schrieb Lucas De Marchi:
> On Fri, Jan 28, 2022 at 09:41:14AM +0100, Christian König wrote:
>> Rule #1 is to never ever break the build.
>>
>> Because of this all those patches needs to be squashed into a single 
>> one as far as I can see.
>
> what config are you building on?

Well I'm not building at all, I'm just looking at the patches as an 
engineer with 25 years of experience with Linux patches.

Just take a look at patch number 2:

-static int fastrpc_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+static int fastrpc_vmap(struct dma_buf *dmabuf, struct iosys_map *map)

You are changing the functions signature without changing any of the 
callers.

At bare minimum that causes a warning and on runtime this only works by 
coincident now because the structure pointers just happen to have the 
same layout. This is not something we usually do.

Regards,
Christian.

> I built this series, full config with
> CONFIG_COMPILE_TEST and doing:
>
>     git rebase -i <base> -x "make -j$(nproc)"
>
> I split these patches in a way that wouldn't break the build on purpose.
> There were a couple that I couldn't build without cross compiling: tegra
> and rockchip. The others were ok.
>
> I'm not really against squashing everything in one to merge, though.
> It will be hard on the conflicts later, but should get the job done much
> quicker.
>
> Lucas De Marchi
>
>>
>> Regards,
>> Christian.
>>
>> Am 28.01.22 um 09:36 schrieb Lucas De Marchi:
>>> Motivation for this started in
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20220126203702.1784589-1-lucas.demarchi%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C15bd6767b2fb4b2c027e08d9e23e46af%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637789579371467295%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=yAllbKjW29SsXA0CMrhK%2BDDvZ1A5CrSptshmsh5vYNQ%3D&amp;reserved=0 
>>>
>>> when trying to extend the dma-buf-map API to cover new use cases: 
>>> help a
>>> single driver with allocations and sharing code paths for IO and system
>>> memory. I'm leaving the API additions aside and first renaming the
>>> interface as requested.
>>>
>>> There are already some users in tree outside the context of dma-buf
>>> importer/exporter. So before extending the API, let's dissociate it 
>>> from
>>> dma-buf.
>>>
>>> The iosys-map.h is introduced in the first patch in a way that allows
>>> the conversion of each driver to happen separately. After all the
>>> conversions are done we can remove the old one, which is the last 
>>> patch.
>>> Another possible way is to squash everything and merge together,
>>> but I believe this would make much harder for review.
>>>
>>> The conversion was done with the following semantic patch:
>>>
>>>     @r1@
>>>     @@
>>>     - struct dma_buf_map
>>>     + struct iosys_map
>>>
>>>     @r2@
>>>     @@
>>>     (
>>>     - DMA_BUF_MAP_INIT_VADDR
>>>     + IOSYS_MAP_INIT_VADDR
>>>     |
>>>     - dma_buf_map_set_vaddr
>>>     + iosys_map_set_vaddr
>>>     |
>>>     - dma_buf_map_set_vaddr_iomem
>>>     + iosys_map_set_vaddr_iomem
>>>     |
>>>     - dma_buf_map_is_equal
>>>     + iosys_map_is_equal
>>>     |
>>>     - dma_buf_map_is_null
>>>     + iosys_map_is_null
>>>     |
>>>     - dma_buf_map_is_set
>>>     + iosys_map_is_set
>>>     |
>>>     - dma_buf_map_clear
>>>     + iosys_map_clear
>>>     |
>>>     - dma_buf_map_memcpy_to
>>>     + iosys_map_memcpy_to
>>>     |
>>>     - dma_buf_map_incr
>>>     + iosys_map_incr
>>>     )
>>>
>>>     @@
>>>     @@
>>>     - #include <linux/dma-buf-map.h>
>>>     + #include <linux/iosys-map.h>
>>>
>>> and then some files had their includes adjusted so we can build
>>> everything on each commit in this series. Also some comments were 
>>> update
>>> to remove mentions to dma-buf-map. Simply doing a sed to rename didn't
>>> work as dma-buf has some APIs using the dma_buf_map prefix.
>>>
>>> Once finalized, I think most of this, if not all, could go through the
>>> drm-misc-next branch. I split i915, msm, nouveau, and radeon in their
>>> own patches in case it's preferred to take those through their own
>>> trees.
>>>
>>> Lucas De Marchi
>>>
>>> Lucas De Marchi (14):
>>>   iosys-map: Introduce renamed dma-buf-map
>>>   misc: fastrpc: Replace dma-buf-map with iosys-map
>>>   dma-buf: Replace dma-buf-map with iosys-map
>>>   media: Replace dma-buf-map with iosys-map
>>>   drm/ttm: Replace dma-buf-map with iosys-map
>>>   drm: Replace dma-buf-map with iosys-map in drivers
>>>   drm/i915: Replace dma-buf-map with iosys-map
>>>   drm/msm: Replace dma-buf-map with iosys-map
>>>   drm/nouveau: Replace dma-buf-map with iosys-map
>>>   drm/tegra: Replace dma-buf-map with iosys-map
>>>   drm/radeon: Replace dma-buf-map with iosys-map
>>>   drm: Replace dma-buf-map with iosys-map in common code
>>>   Documentation: Refer to iosys-map instead of dma-buf-map
>>>   dma-buf-map: Remove API in favor of iosys-map
>>>
>>>  Documentation/driver-api/dma-buf.rst          |   4 +-
>>>  Documentation/gpu/todo.rst                    |  20 +-
>>>  MAINTAINERS                                   |   2 +-
>>>  drivers/dma-buf/dma-buf.c                     |  22 +-
>>>  drivers/dma-buf/heaps/cma_heap.c              |  10 +-
>>>  drivers/dma-buf/heaps/system_heap.c           |  10 +-
>>>  drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
>>>  drivers/gpu/drm/ast/ast_mode.c                |   8 +-
>>>  drivers/gpu/drm/drm_cache.c                   |  18 +-
>>>  drivers/gpu/drm/drm_client.c                  |   9 +-
>>>  drivers/gpu/drm/drm_fb_helper.c               |  12 +-
>>>  drivers/gpu/drm/drm_gem.c                     |  12 +-
>>>  drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
>>>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
>>>  drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
>>>  drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
>>>  drivers/gpu/drm/drm_internal.h                |   6 +-
>>>  drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
>>>  drivers/gpu/drm/drm_prime.c                   |   4 +-
>>>  drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
>>>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
>>>  drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
>>>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
>>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
>>>  .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
>>>  drivers/gpu/drm/lima/lima_gem.c               |   3 +-
>>>  drivers/gpu/drm/lima/lima_sched.c             |   4 +-
>>>  drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
>>>  drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
>>>  drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
>>>  drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
>>>  drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
>>>  drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +
>>>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
>>>  drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
>>>  drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
>>>  drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
>>>  drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
>>>  drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
>>>  drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
>>>  drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
>>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
>>>  drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
>>>  drivers/gpu/drm/tegra/gem.c                   |  10 +-
>>>  drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
>>>  drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
>>>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
>>>  drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
>>>  drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
>>>  drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
>>>  drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
>>>  drivers/gpu/drm/virtio/virtgpu_prime.c        |   1 +
>>>  drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
>>>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
>>>  drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
>>>  drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
>>>  drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
>>>  .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
>>>  .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
>>>  .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
>>>  drivers/misc/fastrpc.c                        |   4 +-
>>>  include/drm/drm_cache.h                       |   6 +-
>>>  include/drm/drm_client.h                      |   7 +-
>>>  include/drm/drm_gem.h                         |   6 +-
>>>  include/drm/drm_gem_atomic_helper.h           |   6 +-
>>>  include/drm/drm_gem_cma_helper.h              |   6 +-
>>>  include/drm/drm_gem_framebuffer_helper.h      |   8 +-
>>>  include/drm/drm_gem_shmem_helper.h            |  12 +-
>>>  include/drm/drm_gem_ttm_helper.h              |   6 +-
>>>  include/drm/drm_gem_vram_helper.h             |   9 +-
>>>  include/drm/drm_prime.h                       |   6 +-
>>>  include/drm/ttm/ttm_bo_api.h                  |  10 +-
>>>  include/drm/ttm/ttm_kmap_iter.h               |  10 +-
>>>  include/drm/ttm/ttm_resource.h                |   6 +-
>>>  include/linux/dma-buf-map.h                   | 266 ------------------
>>>  include/linux/dma-buf.h                       |  12 +-
>>>  include/linux/iosys-map.h                     | 257 +++++++++++++++++
>>>  80 files changed, 579 insertions(+), 552 deletions(-)
>>>  delete mode 100644 include/linux/dma-buf-map.h
>>>  create mode 100644 include/linux/iosys-map.h
>>>
>>

