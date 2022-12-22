Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578036547D3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 22:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB0F10E17F;
	Thu, 22 Dec 2022 21:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE38410E17F;
 Thu, 22 Dec 2022 21:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtchnrIg4P//0DC70xokpeqppeDkhdtKfwcga55WBTItcH630fbntigQEiIWJLYGl1CFtSYxQAjnp00OX9OHmqscjDGV6xA/FUgA+yeJQ4vjqf7WK4xFe95rzE1EZngIbQMhq0PV+gZ3cMGATtI5+VXknbaBox7jWA/b6ZEkJAUEDdiaUe+4wPVHwdKVJntASh0SyLQjH1YZRy02JEBeVlbuxiyJWovEqIslUTSVtFB1Cjs5jVLsX4ZEq7U98lHWD55CixlYlzCgsNMFV2uIW6EMUtLr2P34IXyLH0zmk/ZnS/LAZ4JWC+6Xi3o95ZNkqxC7MVto+yKNZM1vUcHduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRQbPN4cfNIZ4KiGP4aDPTGboAZM3MuIVJ3CN3KcRjs=;
 b=l1sLHQGirLT++4dvpujEV9Qb2CpaP6g+OICWxqzdkp4T42XVYpRB7Dxb1gvw16WyR32mq1iYdePTMnFGgWTTyv4ujlXmfKU8cO9GR6SyKR8RzfaGXMmIqaBS2t9sKZnYrItsK4pvsYwyoKZipVJx/r9VHCc8FaiaD4emwXQWx2uSPV1/3IZudGDP1abstAu6SaoRGucMmKmEjIrlfNXYhQl8/78KtATwkKcNfobWXx7X6p8Acd0Hr2mfT6kc33jstyboEgYdEg3myisJNdr0sL5NXFeWTHtiYvc8ubH+Gd6Rzt5cnjTryvhhXpnKd8wnSlSqqOnbkIODgatDpJWCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRQbPN4cfNIZ4KiGP4aDPTGboAZM3MuIVJ3CN3KcRjs=;
 b=AzN0d+9nfBQ03pc9/dNj69TCap31BlbZCRaNaY0KZQhTbFBuNSAMafq33Fxd7G2g1b9eHxK00jBO72fdQeEg2m80kAKtbmDhfqwKBQwJHyXzQ8COUb7Vm0yNCapIiN3OyAQwgP/v2QKeJq4Fh5I/RAKeSqOXXpJqiBdPzuOSEJMJojv1+lNq6ghp4BR1qDaGFlOHJgw0XxDUXiAlQGSy7wAKNpzpM7bd0Bp62o3TnL+GCCONjzDnn/AoeqFuYBTrzretOpucVRxzKaqjTVi/zVT2GVJMYoMcXHVOqbCPe6JLpBbdaThN22fksC4uj0zvUV3+UwqZKcx955m7sxD3pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com (2603:10a6:20b:56e::11)
 by DB9PR03MB7307.eurprd03.prod.outlook.com (2603:10a6:10:22b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 21:24:14 +0000
Received: from AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::264c:4825:bcb5:e4ac]) by AS8PR03MB8832.eurprd03.prod.outlook.com
 ([fe80::264c:4825:bcb5:e4ac%9]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 21:24:14 +0000
Message-ID: <56310773-a062-0e48-28f7-6d2c5d035fee@seco.com>
Date: Thu, 22 Dec 2022 16:24:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 0/2] drm: Add component_match_add_of and convert users of
 drm_of_component_match_add
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20221103182222.2247724-1-sean.anderson@seco.com>
 <68562aca-5256-9e4b-bcd5-983e43408a7d@seco.com>
 <2db73405-464f-6980-a7c1-7fe232611331@arm.com>
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <2db73405-464f-6980-a7c1-7fe232611331@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To AS8PR03MB8832.eurprd03.prod.outlook.com
 (2603:10a6:20b:56e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8832:EE_|DB9PR03MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c39ab5a-158f-4fb4-0b2d-08dae462e017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4xsc/YlrsK118S8OJT2dmoz1pm7IvHTy7e2e2fRJsr9mRfHpTCVp/XOjI9mQ9v6fezkXkTxtleVITqLAXR0+aN/oRz/IXpOwWlqOk6KOqVUU8064M1o22jswawgdDOE/EaDnpT8hBgYAzMYIOVpZp6Q/onCuFFYrY2qb8Rw9Fh9h+C2qLewwRqlIW3gLRWa90yAkhn+ovRxMwuFBJbvvXVU7hhFjGFyVzdj5KE8pGDr8+oOJ2J8liTTSBNi2obrBTZCX6Aqp5bb12a5txcMDiotDLATH5S59fPkNUXERj4qzI5z59+/QCZluRGwxAa4Fv8KsDHXOXXpuZ84A7KvLLiuirSU0gUdeV42AGWQ97sFur7rXcDHlqmH3Zp7TtdFmJAjSx1byNLumSTMBsGcHBGBlOzxqCMAdbbditKdgT30u6TCBfnAmMWl6hyPUzJnof/gZDM3KSlSIApA9vl+9nXj/V5tr/TwetXujpNFUTxQreHSwi5OCyYRmDGVqAiJFeoYR3C5BUUJseFntsaL5ZLcCoH3BqraeiXvhQzR2vyo6TEaJS6V/xBy4CKD2mBsv1KOEZrKh3tuSiJAJ1vaZdv7Wpset4uesk+Zm3Olm0QsIYUq7vCgHJ6IJ/3zbFW2GSqmtnKw0CdA+ftkQJO89Rx3dZXpDH7SOVa6sPQRixT0j+3NUz34PpOrrf6aEunY2M6qQ1FbuU5d9OuSxSTdGeP2hvxJfr9M+/OQgGsWzaEbvN4cT1SuNNdnjqEFsnbQLoPBiweAAqZKVSnJrZOUR3nvE2gFAd5sC8Iy6ZAvvK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR03MB8832.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(39850400004)(346002)(366004)(376002)(451199015)(52116002)(36756003)(2616005)(966005)(6486002)(478600001)(8936002)(44832011)(7416002)(5660300002)(38350700002)(38100700002)(2906002)(4001150100001)(83380400001)(110136005)(316002)(41300700001)(31696002)(86362001)(66476007)(66556008)(8676002)(66946007)(4326008)(6512007)(31686004)(26005)(186003)(6506007)(53546011)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9JS2JVSTEvSXYxbTA1aFVvNXczU3ZlUENSbWRwVDZCeXZXWC82OFg5N2Vn?=
 =?utf-8?B?a3VHejl4VlYxWGEvdnBuTmZCaHJ5Q1I1ZXg4dVM5MzVuczVNUXhCbFlFNnk1?=
 =?utf-8?B?QUt0RWlKMjhLeVNEcW14QzVoOHIrSXF2OUR1UjkvbXh6WmVDaGNuUG85K0RK?=
 =?utf-8?B?cWxnTy8xbVVQaDFveGJaMjNkUUZQVlNmZUtRdVlSL1NOc3Q0eEovaE8yZUN2?=
 =?utf-8?B?ZGUzUmpRMFFYeDZ6U2gvb1o4ZGY2cXRBMjVjck5xdWx2U1RrTXhEOFVsclJF?=
 =?utf-8?B?b2VYQmR2OXFEczR2cnVOcW9KY1VrV1lXZ3NaZ2FTcWRIeGV3ekVTUXlrUXho?=
 =?utf-8?B?NExYY29na0daelE4dnBEUmZwbDZVaVFYc3ZxbUZ4V2JUMWhSWWxpUnlJeEJD?=
 =?utf-8?B?bVdaMGlYNERtbjloZktjczArTlFyMWg4Y1FxZkxGZ0xTZGI4WmdoTDJjNHVH?=
 =?utf-8?B?bXhkZ2JpbFFpdVl5NFdlRS9MWkh2b3p3S1cwV1B3bkVCOFQ4bzR3YkVXKzE4?=
 =?utf-8?B?OUdyK0VXOGEwckZPYXFxVVR1WU01dTl4WHJQaEI3QjR5TFpCN1UxY3pqZ0xt?=
 =?utf-8?B?cW9wZmdrZHEvZlMrczNXeGZqZ0JmZWVSbDVKMGx2S1lxVyszM1Vnd1dMNlhG?=
 =?utf-8?B?YzRLTUdQV1RQYjFTNEpSTEFaQTFOS09YeXFaemlJRmZWK04zdCtZZkRTKzdz?=
 =?utf-8?B?YjNLSHFwMkRnS3krY2RCczBxYzJpT3JnMXpFMmFQQmFuWnhNMHJQZGQyS1JO?=
 =?utf-8?B?RlN2c0Z0OTVjUjJsdm9TLzBOWkJha1o1dUxLSEtmd3Z6eHBOenVpa2FjRmh0?=
 =?utf-8?B?SWZJMFdzVVlIR3g5NnJ5YUE3WXowTGhwbWlOZVpiUC95R1JsQ21tUGRGeGRq?=
 =?utf-8?B?a2ErOVlXZlpsRGJnZVVQRTRRU0I3QldiOW9wYW45cTlXaWlvM3ltNUlIMHI0?=
 =?utf-8?B?Q0dVY2c5QTQ2bzU5NFV4ZjVxWVl1SVRnKy9pUmtDY3NKK0hlSjhCVnlwQ1Vm?=
 =?utf-8?B?Umc0Z0diakg4dDFEcTNETlgzb0RwSW5aZzJYT1pxRE5DTDlDZURXTDFTd3lG?=
 =?utf-8?B?cHBPSU9qRzBGNXFjVFZJelhVbmhXcnVDWEhVMHVlOWM0bEJMQ1VsYTVzY1JQ?=
 =?utf-8?B?QkNSUklxQ0pEZFlLVXQ2TjFHWUdoNHhqd3B0MmQ4L0tVa2pBcU5QUVUwTW9i?=
 =?utf-8?B?S29oMXp0eG5hVTRpUzR2dEUxdWZsSkg2Z3RSb1c0aitrNHMyeDBNcTJSbFJx?=
 =?utf-8?B?ZzRhTTVGUUMyUWxRM0g0Y25TWEdpR1VaMVVzMDFhd0lTelFqUDRncWdjMTdR?=
 =?utf-8?B?UmVWVi81Q2tEOEp6WEdYT21vbVBWRVgxbm9qUFd0TklqZkZQNytBMnVzbzBE?=
 =?utf-8?B?UytlNno4eE5jYlk1T0l5S3FPN0luYjV2bCtJNGpaYUdCYmU5d0xoeHRmV1pr?=
 =?utf-8?B?aWU3ek9yTXdITFJDZHdYZDVvNVphcU5VaXpTcXNxZGJtM2ZmaXBSeVJ2dFdh?=
 =?utf-8?B?M3JDZitSV1dtakZrZlVIYjBoMGc5ZzlJeEU4QjIwdi9pQmJPZ0pBZ1FXMlVy?=
 =?utf-8?B?RmZSZnlqdWpKOWVqazBZNFNEa1JBaDM0blI3Rm02aytGb0d0SmlqUHczSnBB?=
 =?utf-8?B?Z2IvTWdnQ3BXRTQ2N1JKTGprZXFCNTd2UDhTM0FZSE56aG5LNHFicXFZN0No?=
 =?utf-8?B?K284NThXQzU2b1hOUGg1UEZPd0FsYWcwZi9vSm1qRzlZN09ReTIzRklBc2lv?=
 =?utf-8?B?ZGxYNm9paEZGdzVLODR1RERqWWhWWFAwL0RJaUpod200anc1WHF0UWRacThT?=
 =?utf-8?B?b2ZPWU5kZk5tbGxmOGEyTUJtMzZCVGRzcVptUEZ4bHE3djFoTnhmTWZVSUxF?=
 =?utf-8?B?SUQvaWs5MGtMVi8wb2kwdGhMYzlZSFRTVFRuKzZ0MWcybmg2TFQyOVVSLy9C?=
 =?utf-8?B?RTR5V0pBcHJPKy9rR1BpL0ZXY3pZMzRsVTcwYkF0MDVmWDJKL2RhWVE4OHpI?=
 =?utf-8?B?aXdYOHdQOVBMQ2szMmo1M3o5eFNrMjNPcjFXc0ZDSHROTm5MZGlla1NwQXNr?=
 =?utf-8?B?bk12UHpqNFVRTDNCa0RJR0p6d2xsNyszYXc5UGpLU0M2aWo0ZFhqODMxVWlt?=
 =?utf-8?B?TDR4b1BoL01sNmdsbmUrRjlkc21sM3R0ZTlNZGtKU0pMZFdWeHQvaDVEUjRn?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c39ab5a-158f-4fb4-0b2d-08dae462e017
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8832.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 21:24:14.6380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VggdDe1rLJM2xJnF+ZkDBsNDEJx9zVR8raURblc8QgfN40RPTzRksip5cIDgFLdOqAAJmOFJZs6yGNswF9RBwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7307
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
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On 12/16/22 12:41, Robin Murphy wrote:
> On 2022-12-16 17:08, Sean Anderson wrote:
>> On 11/3/22 14:22, Sean Anderson wrote:
>>> This series adds a new function component_match_add_of to simplify the
>>> common case of calling component_match_add_release with
>>> component_release_of and component_compare_of. There is already
>>> drm_of_component_match_add, which allows for a custom compare function.
>>> However, all existing users just use component_compare_of (or an
>>> equivalent).
>>>
>>> I can split the second commit up if that is easier to review.
>>>
>>>
>>> Sean Anderson (2):
>>>    component: Add helper for device nodes
>>>    drm: Convert users of drm_of_component_match_add to
>>>      component_match_add_of
>>>
>>>   .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 ++--
>>>   drivers/gpu/drm/arm/hdlcd_drv.c               |  9 +-----
>>>   drivers/gpu/drm/arm/malidp_drv.c              | 11 +------
>>>   drivers/gpu/drm/armada/armada_drv.c           | 10 ++++---
>>>   drivers/gpu/drm/drm_of.c                      | 29 +++----------------
>>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 +--
>>>   .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  3 +-
>>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 +-
>>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
>>>   drivers/gpu/drm/msm/msm_drv.c                 | 14 ++++-----
>>>   drivers/gpu/drm/sti/sti_drv.c                 |  3 +-
>>>   drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
>>>   drivers/gpu/drm/tilcdc/tilcdc_external.c      | 10 ++-----
>>>   drivers/iommu/mtk_iommu.c                     |  3 +-
>>>   drivers/iommu/mtk_iommu_v1.c                  |  3 +-
>>>   include/drm/drm_of.h                          | 12 --------
>>>   include/linux/component.h                     |  9 ++++++
>>>   sound/soc/codecs/wcd938x.c                    |  6 ++--
>>>   18 files changed, 46 insertions(+), 96 deletions(-)
>>>
>>
>> ping?
>>
>> Should I send a v2 broken up like Mark suggested?
> 
> FWIW you'll need to rebase the IOMMU changes on 6.2-rc1 anyway - mtk_iommu stops using component_match_add_release() at all.
> 
> Thanks,
> Robin.

I am preparing v2 of this series, but I don't see these changes on
drm-next, which seems to have been updated to at least 6.2-rc1. I tried
searching for these changes on lore [1], but I don't see them there
either. Do you have a commit hash/lore link for these changes?

--Sean

[1] https://lore.kernel.org/all/?q=dfn%3Adrivers%2Fiommu%2Fmtk_iommu.c+b%3Acomponent
