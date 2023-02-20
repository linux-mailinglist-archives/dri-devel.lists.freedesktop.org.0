Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C794A69C651
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88210E05B;
	Mon, 20 Feb 2023 08:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5F410E05B;
 Mon, 20 Feb 2023 08:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYSUmCkWcH9A9GID5z63NUerjZf9T6tNDPh8HY6y8Bu+1kD3M9nrhGiBrKLSUXIZoh/uo7IdWpBXhzlcKRhQlrys+f7okgYn4DiX19tBskpHQ+l+2sSJQ+N3MvJ1wLEhaqMg2bdAxGDBpJfeWUsFnJbTBWeFIE0X9TtBOvf25Laf5GEO6tfpZhWaG4poPS/YbMNmI3JbPUXi8qsYOXsb+q++MRGsvuVWMPhYPILp5DZYEVM6i9SzURIA6aYJz56rhVOC9U6LR2X7wJOKmqCuLC8EJ+PN8Br3jMLk3nmUnnP8b8RSKUiv8CdZHGNLTgqMi13hXbL/0oLum22xeXyaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nBVyfxyzrZk/CZxuEUNGQTOLkWFVD0NDAdZoxwnFII=;
 b=oKq6PvLmqhQlvRE+Pb4vI/LvvsjufSuIpLHVm6SkW9wwIAHuOp103dDdFuPCA4Ycu+pfWnNNRyZfQk0vo3zjWYaU6KRexIXVe1hR/3wNLO5S0Yer1FMCYfE1bGdDjgsQ9eg48IGFEmWm/buCT6B79AFG2EhTAeORa53QdZSOvYSAyxPsoyQgI8EFBEkYVc/BmDHHcVtt4MeHrPj/h/EZCurrYehYmB2BykzrKkWLf0A3fWKsG/MsE5qqFi0oHTgDlUKKIYSpNaF7QUcWazUrUl1yLubmcTzucj4aJM2lIF12J2Rva5h3MzHTt81MooIYaCU2V7YcM5Ixcn0LXbNkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nBVyfxyzrZk/CZxuEUNGQTOLkWFVD0NDAdZoxwnFII=;
 b=BWRIa6RFq4eZema73P6UBzL9gF9tdU8wdmFrkWFGX8YQH+q44Ci1VY06Ic7tWLIWx9k3SVHFfmPTYG22P44GQVRNKGvwUgmIE6Xdn/rTa9I+B+guIOhf14Ie+hiVvCvdpzMUlVRH8okLOkyUITrjRBNOwUonu465Xc+U50NRi+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 08:11:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 08:11:25 +0000
Message-ID: <3e289d99-eae5-c5be-aff1-2e95b89a406b@amd.com>
Date: Mon, 20 Feb 2023 09:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/3] Resolve warnings from AMDGPU
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230217181409.218008-1-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230217181409.218008-1-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: b41c7d7d-c60e-4616-e081-08db131a0f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqBEKRN+OUgY3N/AFD1IFauUZIjfUpQTNAHEwCQNWJhqoDc07sZXcJCtDIrUeZa0izfUL1C9jRnP6LuATO7FKI4F0tIl16nT0iHLaKCxtiHvdtuHhI+lNIb+DO4UvaIOOQlQ0qihdpqEiDk7RbtG37kNP+gQwkpMuqWZg8/LExmR65bXyiHQXSa+ZfNGjSCrmifprjHjMgUuGOALEJRTj2tCfG2syyHejiG6QpdJ0pp4xNjIzt0k42ni4NJsdVNpHjFBEmU5iNa/+UnbaSteeOzzosbz6yGMEbldIC8Wvj1JhOYMSa9LSVf8nraQHnzB/bTX0c3PMGYvAhqCARY9tqgPb39nHNilMP4WIMWCxzWQY7lt6Nicx61L8q8MUFIvBLLkNB1qeISKxNfCxjC4KExCi2HfeIvbu9sNl1qTJBffOOxNsZoN3XpVgetujtCbKcFhClqswcX2sOe7Nnl1GPDJoUcb/j4AJdr4M8563c+goqYYSI7gTNHYQdmKV5Uq1XmMdHwHkpT1/uA5bhz2qPsHapT58sUNGByI42Rq2468m5zNI0L9GY2o7PH92c4lFfRYnd7oD4Nq1zF+NbURFy8fs9A3ndUDL/edi3NAfmqfexhWDKtiZaO432XwNAYiWcsnwzSzVDCnugB9EHChMwxo7vI3XsFA4zKh6Fj8srlUoeERH3TgGlxP9vTZ+xGVRpc9/WBees0H8kASN7G4Ac+ywfDmzQhT8XSYxAoQ2oY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199018)(31686004)(8676002)(66946007)(4326008)(66476007)(316002)(6486002)(966005)(66556008)(41300700001)(8936002)(5660300002)(36756003)(31696002)(86362001)(478600001)(186003)(6512007)(38100700002)(6666004)(6506007)(66574015)(2616005)(2906002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldFa2xxaENDRmpmMlF2b1FxN0dSa1VXUjhEaWtSMGhqcHlkcGdZZUluZzJS?=
 =?utf-8?B?ZnRBemcvMHRyRkR2Mmt5aG1BK25HNStKcE9PK0VTaDBKLzZuYStFUndBOFFD?=
 =?utf-8?B?Z01pKzZieUtXZWIwaUl2czVwZUoyYTJzenp5ZkpSMzdBcTA4dm04NVM1SG4x?=
 =?utf-8?B?NHBkYi9FRUdVeFNPZTZBUFJPRnluZmFzQURxYTd6VmxsMjZnQ3JQZWlreXd4?=
 =?utf-8?B?eVJ0cHY5SWJPNXdVVEk1VG15NEZEanMwVzJsdElyTThqM1haRFdtQWMraW9L?=
 =?utf-8?B?S2xHNDBodDFCUHcycWkrU0VTMFppYTBXVXFVMFNKLzhTTXN5d01nOU1yK0Jz?=
 =?utf-8?B?cTNLTUc4MXIxS3ZQQ3A3MXY0WHlHbGhXZ3d1Q0x3Wmxha3RMNTllN25mbFJh?=
 =?utf-8?B?anpHWE04QVp3NmRBbTVLZHpEc1JSMkQrblRlNHRycFFScVlhNVMvUzNKenpU?=
 =?utf-8?B?WXN3ZHIxd3hZaHUxbjRmellYZCs2c0M3bVZUY2lFR0NSdXhrNG1GMFc1QWZO?=
 =?utf-8?B?TEZDL2x5ZzJGRUlodG80NUxEZmlMOUx0bHNpZ0NNYW9wYys1ak9tb0lmaTIr?=
 =?utf-8?B?emFob3daS2tJRmRzbkY0M200NEV3ZnRHQTd0RUVZSHNxSkxoSm9vd3IvcHZm?=
 =?utf-8?B?bC9oZFVuWHpKWXdIYXFXcFFLdjJVRnZKSE1sUDBTWFBuZUhxOWZnWVFnbWpr?=
 =?utf-8?B?VWYvc0xQK2l1M1d1RjArWUtPOVRLemt1Wjkyc1Y3Z1VkVjF4SUMyQm9HNlhH?=
 =?utf-8?B?VEZnWEg1KzVrSmQ5dWFLcUJSNk90TERNaXNFVUFlSExwcDR4RU5lYTBUNUM2?=
 =?utf-8?B?b3hSd3NyQVhONXVmcGpnK3JTcno4dWtpaEVDa1g1dGRMNUo2TlNqYmpZM0NO?=
 =?utf-8?B?RGVzTmIvMWxndXVzZFE4R29JMHVXZWZVTnhvd1BtNmczTHVUQVdkS2xrRUFY?=
 =?utf-8?B?eElKSjBsdmpjeHRlNWV3UzBuMjhndGk0NDdESUZlU0VOTElWUUZGNEFsS04r?=
 =?utf-8?B?Rm1LaWNSbHkxcUIrYnVBYWh2U01BUWZPd2VHUlMrZDArNUVCaFI2bnN3NUNM?=
 =?utf-8?B?cWZ0MVZPZW42aDA2YmxZQWtLcE0zWE4rMXpuNEZWTlR1bUR3TXZUbUJYNlB6?=
 =?utf-8?B?TE9UVGNhYmQwa1pIeW5ydDREVnYxWlRvQUZ6UVJlY1RaTHk2MENZcFpRNmlR?=
 =?utf-8?B?REtMdy9vNGtUdk1MNkNjRUROdWtXSlNNU2ZCc1l4SjBIYjZVc1dPSFVlUEJp?=
 =?utf-8?B?bFpSNG8zc0pnZDJUQ1RPZWpFa24rOHllaWJic2MySllyQUcwamVESkI2ek41?=
 =?utf-8?B?YnZKSDZXR21nQUpWUTBBbmJzTUxFeWZLM3BTcDVraThjQWpsc3FKQjFnN05v?=
 =?utf-8?B?ODdxaXc5QWxYVVJOaUR6anBvRVNpWVppbGswYk5aWlJ4dWJ0d0hNOG55dFNJ?=
 =?utf-8?B?RHpJcHcvMGNuTnRZQWorcllFNi9Ta0s5UXN2NHZqM0MraEluM1VJTGU3L21y?=
 =?utf-8?B?Y3BvRWMvaFIzTWxEc0MzQkJtUVhMZnhvQ1hZRGRmTVBvVmVqQ2cxQ094UlFB?=
 =?utf-8?B?WUJ6SHlsTG9hbUgzejM4WEVLMlpTWEtyblA3Y1E5U1BSLzRqaGxRMktJRlli?=
 =?utf-8?B?TzZvaitzNEZVYUR1Z3h4Zzl4b2w2Tmx0WFpHejBMbEFrWG1URGI5YVh4ZE5Z?=
 =?utf-8?B?ckhodHJuRDN0SVl5WU90MFdFV29sNjgyZmdRNnltbHVudHZlaWt4NmNaUUdO?=
 =?utf-8?B?c2plMlBOdSt2anFqN2tSb3ZRU0FlOHU0ejV2dzVTRUlpblFOeEhWblYzKzBG?=
 =?utf-8?B?RmFlZVh5WDRLZkdwTmxGM01aMi9UTjJSbk9IWVVCbGNTQUpIaVRJc1FPakRS?=
 =?utf-8?B?cE1qRndndEpDcExjS2IySE01RENOMHhUTytlVTVUeUF4ODdJR2Z0WnljWW04?=
 =?utf-8?B?RnVZUnRaOHUzM21QOEYxdVlTT0lYU3lYY2drZTM2WTk0U04zb3RaRGt6cnRB?=
 =?utf-8?B?aHpObFg2WjN1RGpuNnZ2cVdZckI5R2xwVE9MbnFoSjBFL0hmY2JBNjVUMFRY?=
 =?utf-8?B?RFVmeWFzQ3h4ZUh2VlRjNkFydzdpdGIvMXpQSFF5anYzYjVMbkR1K0RHelFJ?=
 =?utf-8?B?WmJOUDk4YUNaVks0K0JCUVB0Y0o0MWQ0anhaM015U2JHN09wR1hTTlYwWnRE?=
 =?utf-8?Q?kZX/HQe7IylnEpTiR9qvonjw84lIl+QIGTWs+v+ancJ/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41c7d7d-c60e-4616-e081-08db131a0f01
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 08:11:24.7884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgKXxfdxN0MvgYzXsQ7QcCq/wxkc9LBXxKHM+A5OS+8aaYyX+AgV3S7WyXC6Aztl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, mairacanal@riseup.net, alexander.deucher@amd.com,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Christian König <christian.koenig@amd.com> for the whole series.

Am 17.02.23 um 19:14 schrieb Arthur Grillo:
> Hi,
>
> This series resolve some of the warnings that appear when compiling AMDGPU
> with W=1.
>
> Each patch is focused in a specific warning.
>
> This is my First Patch for the GSoC Project Idea about increasing code
> coverage of the DRM code[1].
>
> Thanks for reviewing!
>
> Best regards,
> Arthur Grillo
>
> [1]: https://www.x.org/wiki/DRMcoverage2023/#firstpatch
>
> ---
>
> v1 -> v2: https://lore.kernel.org/all/20230213204923.111948-1-arthurgrillo@riseup.net/
>
> - Use dm_odm_combine_mode_disabled dm_odm_combine_mode_2to1 instead of an enum casting
> - Maintain register read
>
> ---
>
> Arthur Grillo (3):
>    drm/amd/display: Fix implicit enum conversion
>    drm/amd/display: Remove unused local variables
>    drm/amd/display: Remove unused local variables and function
>
>   .../amd/display/dc/dcn10/dcn10_link_encoder.c |  3 +-
>   .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |  7 ----
>   .../drm/amd/display/dc/dcn201/dcn201_hwseq.c  |  2 -
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 -
>   .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c |  4 --
>   .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  3 --
>   .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  | 41 -------------------
>   .../drm/amd/display/dc/dcn32/dcn32_resource.c |  5 +--
>   .../display/dc/dcn32/dcn32_resource_helpers.c |  4 --
>   .../dc/dml/dcn20/display_mode_vba_20.c        |  9 ++--
>   .../dc/dml/dcn20/display_mode_vba_20v2.c      | 11 ++---
>   .../dc/dml/dcn21/display_mode_vba_21.c        | 12 +++---
>   .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  2 -
>   .../dc/link/protocols/link_dp_capability.c    |  4 --
>   14 files changed, 19 insertions(+), 90 deletions(-)
>

