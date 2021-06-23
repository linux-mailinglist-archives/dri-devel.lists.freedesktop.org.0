Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A73B1615
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82DC6E88D;
	Wed, 23 Jun 2021 08:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D1A6E88A;
 Wed, 23 Jun 2021 08:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCFLutry2OnvFuG8vpNLfPua4Jah/ZgEnH502ozmMyEdmaCaTJRF3+LK4boDcYbmtRtDI5OmTwBuuFi4V82g/AASyvEVitmXdlooVd+MsSL/D40lgi0RFyeCbV8+OiXyVsQ70mxIHuFIrgfSLlrzuQQgGNqMRrDuNsOwX60aPmXVBXQzHczbXAYtxrCUk7E909QHR2bBYqVxDVVDOfBTOOs2XJYK5p1D0b10vssaVJH0CfNgoQRYOi20SWuekiB5chpYQffZgWW+jIneZwrukYT/jSJsHdY/2/zNKf1LWeIGzW90Hq9mDOUnYmpaEJTSH63SOLQ8zwYct9VIHzvAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4bttyA7TwhgL/8KT6uLT6ofh6nU5q+At4+DhAepn3k=;
 b=DJ1ZsamHAdWLuWymhhqPo8nGbP+b6ARZe02lak7D67SYIeq5tlYgmhtiP/8SrZS/JCzFO70YQQCgOP2oLVdEeQeAH0rpnPfex8HFysw2ss9tAbrdq8U1F2uMTk+9lnfyeVcOnAgYJCNEyhLqoLF+j4fp3cM/OXfBFoxUApHlEgkUoFByznZ0ZLv3bkhv9zYM6orjxtEokdPGoClkpzgUzQVCDeHXINKrRkyVMGKdst/h05yj1uUCmUels2+eBPYLLOGXUYK39eI8QGNQX7VojnYajlmSxd6NE8J5mDtoQqGxY+rFtrVwQHmGtVb2N3vtzx6KeJuWKt1qd8TYW7C6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4bttyA7TwhgL/8KT6uLT6ofh6nU5q+At4+DhAepn3k=;
 b=axCE6aRoFTb2YGIMN8r1rvEyWoic2q8y4tJ+QBX9NceFK2o+Zydyske31LYT3iYV7s0fIlteD5RfeRA6DuH7t7S7e9pUYrmfNW43SeIuQS16wU1kRQABlVhbaz0tTBam/L392xhD2fU1YfDD9B+CeFXYcKEy/FkJ8vlnUShGLZk=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB4239.namprd12.prod.outlook.com (52.135.48.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Wed, 23 Jun 2021 08:42:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 08:42:56 +0000
Subject: Re: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
Date: Wed, 23 Jun 2021 10:42:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
 (2a02:908:1252:fb60:69e4:a619:aa86:4e9c) by
 FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Wed, 23 Jun 2021 08:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d2e155-bfad-40b5-94d4-08d93622e592
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4239F7A2395A6E52DE36359E83089@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUAjNymOZqC+E7QRM5PnJ5kwGL0QzcwjeUOKSzlte2mz+EM2U81XbYGACY3FzhQTqIGE/LsKITWRmKOlipQXxTVcnyr1AOWViHYezMO2vtYQVTegVYhHfQFCBW41cmXRijMuwkdh0DE5FB5Z7+0C5B/SR5oi4kfx2rEXm6kS5o1l2s/3knyEAGVkU58GOeUz3+tUYKx3eUZ4YiD+W2IIqy+XN2puLZm/18bd3eYD1Smtk3iYrzBn6+vrAz6cMEQle272yLU520mkL6WUDovbGHhUdc2Zpz4mVTYLA8g3w/fNug2vO6LctLrfRmXox3x+O+UGgGnSE/6Y5GWfUQdGyHGpEmTMEzV/Q99A0FczWNQ80CN/gl5N69gUsxiuxQZGeuGEQZjNl/zk6v+4Z4JnTflQgs2md36CNfTT8hw+9nNTQvssQP5Afmzqf0nuwRIlUT8S5+oCgU/l5iOZowpOfeNplYALHMzryXqrpfsLwU2tfZREZAVKt4MOwirfiVnqZUCwsze55AmgQHUSO8FJjr5byozLuKfqdPOt49wiAa6fh2olA2cjCzFKDHN+Mb5XRRnFm+DXPc0+P23mFTxqC/CLsN79gtpIIcIPGL2FLPH1US0E/tjGiLMC5zzHe6eqXNbe95047q0NzeY576dlb/ULLa70v8I0xMa2QYgbN4Q672NVlJ9pkDJo31lI8+MZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(66574015)(31696002)(110136005)(6666004)(38100700002)(54906003)(7416002)(2906002)(5660300002)(83380400001)(31686004)(4326008)(6486002)(66556008)(2616005)(36756003)(66476007)(8676002)(16526019)(478600001)(86362001)(8936002)(186003)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpDK0ZUVk82MXlSWk5Ja296SFdjM2lKRnUyTDlkZjdweml1V0hEMFMrRTBT?=
 =?utf-8?B?TTFlR25FdEwybzZiSjl0dE1tSmNJWk9hdGEvek15YkV6dTNFSkxkemtFNmdY?=
 =?utf-8?B?dGE2Vy8vU2Jsemp3Q0p1bFZEYkJzYkJvQXNBR3djcGpZdXl5K3RiZnV6OUxu?=
 =?utf-8?B?RTZYSXFZMnROU2tJWHRaUUQ2NXVsWlNSVmMvK3psSUIwNGVZMkl5UENoMU5K?=
 =?utf-8?B?SW4xeitYdGFwN2JRZ0s4cGpHM0kxRFZzeUZqTTM2a0IreEdiODhyZ1FNa0Fi?=
 =?utf-8?B?Tks4Y2dHRzk1Mkw1K0sxU1puajBhZVV2cFM5NG5hZHl6YzBnMm5RcEZ2R21y?=
 =?utf-8?B?RkRuWHMyTE9SWDJkTDhrb1MrZzM4aHlHN2piTGxTL25mZVJFK2E1M3NtV0xv?=
 =?utf-8?B?SkxycmlRNFh3M2lnclBHWTQ2bnFyUXFudkd4MWZxYitEWmc3bHp3YXU5RDZm?=
 =?utf-8?B?VWNrQThHL1dQM1RSYThxQkFBc0N3aHN0SEJQMlo1Tlp3UXA3aHN0eFBlU3F2?=
 =?utf-8?B?VG1lTnJlMWZ3dGlRUzI2azRuOHFZeC9mOVpNeThaZkdDK3cwRjNwK0pDaU5D?=
 =?utf-8?B?T2UxTkkvR21QWk84NnBpbmhVYm90MVBDODhTcFB2eTFmY3FVLzg3bjBGSnJF?=
 =?utf-8?B?a0w4bkx5VVBORXJYam8vSkI2WDZaOU9yRGNCbVhob3lBZjNpMmNVd1FlbmFu?=
 =?utf-8?B?eGM0aFM2ZmJMUWo5bVozeCtXRzAreWY5a3dqY0lUTEtVdzM1bmtPRnNyL3Zs?=
 =?utf-8?B?bklTM3pMVHlSREREb1RHWVJxY24rLy91NXBoVFMxbGtCZWRBazlVaStRT29a?=
 =?utf-8?B?MHR4K3Q5Q1NvV1phRmMwRDB1S1VPRnpQTVBGdEdaYUdyMUo3MmVDSWlkQVdT?=
 =?utf-8?B?QUxOSHYwV3lHb3ZPWFJCNWwxNDBLVjA1SzJDYWJZd21oZDU5UE9ZS3hjQkow?=
 =?utf-8?B?YUZ1WVRrS1poc2U3VGVQSnpocExIVHR0V0dSWmFlcHVjNVZpUzJKbm04OVN6?=
 =?utf-8?B?QkFDVXViS0FkU0FNU1VqNFFaMGVGR3hDVFAzdlk3YkYrVDF6UGlsSVQ0VEZV?=
 =?utf-8?B?NTE4UWYvMG4rSmpPK1ZvN2Nvd1NGdXROcXk1YkpvUm9JdFY5cVJGWFpTdVE0?=
 =?utf-8?B?K2pYd08yZU51ekxMY1VKYXRwQlpZd1lBUzR6OXh0ME5HdUdOaFYrWmNUWE81?=
 =?utf-8?B?bGswT0NGbEI3c0xCMUlMNjBVWkwrMUc2U25DNyttb3hDWFZvSXdrbmVjYy9I?=
 =?utf-8?B?ZVg4a0l6ZmdBOHBOaE10V1NCczVJM3JNQm1ZYWd6YzVadTBiUFI3Y080eFpk?=
 =?utf-8?B?NTJpTkJGSHZ1VThIUFd6Wm5GYXNRd3lDR1pYZjlRMzZmaVpwcGl5Yy9ibEhH?=
 =?utf-8?B?cnBwUFg2a05aYTdOUXBmTEo0cWhGL3NNSnI3WFdzSTZhakRYeGFRbE5DNWJI?=
 =?utf-8?B?c1M1Z051YVZFRVp5VnZOMSt1RXZjK21RV1VQejlIUjJKcjRlWDVoMDUreklG?=
 =?utf-8?B?Z09jeUpScmYvb2VmWC9NVUJiRnliYnhLbFd4Qi9WKzNFaVpDbWxtZ0w1Vlpj?=
 =?utf-8?B?NDgwcWZ4UHlhTHVja0tTY0NkNjdHdCtNNFlxNElaR29FRTJKRnJMYmxOakMy?=
 =?utf-8?B?NFA2VWpjSGowY2JpOGlvOVd2UktZY04rSGQ0cXJmODlYcDVldWJibWFqTGVX?=
 =?utf-8?B?Q2x0SWwzRGh4ZVI3OFBybjJSWFZ5WTNnUlZSWlVVaURQV3E5N1Y4cXRXSjBw?=
 =?utf-8?B?ZVFmcHBjVHNEVnNXZk92anpDdWNPVWkvYS9DeVl1OXNTdkZhdXhXaHMwb2hm?=
 =?utf-8?B?QnVDRHFZZDdRSWFQUUJPR0c2a0hRZ2RTM3A2T3FzYURSV3RwYnFVT3o3b0FO?=
 =?utf-8?Q?gDRQuRkxxOYBS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d2e155-bfad-40b5-94d4-08d93622e592
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 08:42:56.0571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Tja8CHpHg+XV5C52jPJke4hnhbSWBkL9SdPG/LQAdzo7S03CRm77AybC7yIwhKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 18:55 schrieb Daniel Vetter:
> Spotted while trying to convert panfrost to these.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/drm_gem.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ba2e64ed8b47..68deb1de8235 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
>    * @fence_array: array of dma_fence * for the job to block on.
>    * @fence: the dma_fence to add to the list of dependencies.
>    *
> + * This functions consumes the reference for @fence both on success and error
> + * cases.
> + *

Oh, the later is a bit ugly I think. But good to know.

Reviewed-by: Christian König <christian.koenig@amd.com>

>    * Returns:
>    * 0 on success, or an error on failing to expand the array.
>    */

