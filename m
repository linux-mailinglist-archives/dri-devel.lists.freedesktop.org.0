Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF05AD137
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453E10E305;
	Mon,  5 Sep 2022 11:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87E410E2FF;
 Mon,  5 Sep 2022 11:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JM2Zl8mYoTJt2Q7wb3X07K6kYOTsxhoFmWv6f2Mb6glwkBmZOholYZDg0q7BMJds7OfrTHJwlpPAb2tIPJdc617RU09y1hprkJ7n4PYQTi9ZuqFeW0kDJmM9kWFijZtIxht0Df2CubO0EA4AqNcYoRT3eXahuNxDNcB+Zp2v5/r17J81OHPxRsd31E21DadTbgd/Hix1OsniuKYNWqKJZoAy8po9+h9XbETRDab646cxbVTs0MzPqrcdkev2CV9IBkXTonnZ2kXoqP5+h7k0IfHEKwOeFrIAUOOD3N+18xIY7LXf/J03284LXhIU0c7E/geYYiSPEmPPF8QZgz6uSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri8KVhY8inXsalARBt53Dv/lqGjTHOVhTlIA0qAyRU8=;
 b=QW/tkaC137kqjbF/EzVKYvmV/1CMqXz+7eadV94CZsSRnZ1OfUWphM7EEgfQPiFcAOPsnJsgTxaiDQ5TvCCiCdtOuihkxpFuhX52Uv/60z5z126f1roHb55m/xW7uwLzHM8odQfD4ArQqG9dQiRALRMutNe3tl3uG+D8iHkbFXo6lnTqkimpnkTiqKVPi7uTJnE8Ig7wEMI5lR7/x6Nxzh1JfbvWGr81y/M56CrHbd27YRRd3jeqzV4JfMT+Z+Mq6BamXNhW5lXHIhY+KSlarZi2HBMvVtwwSEglGBHnhE4Wlok6uw8xvd90q3RDRtN6AwgyyULpCI74LVF100vQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri8KVhY8inXsalARBt53Dv/lqGjTHOVhTlIA0qAyRU8=;
 b=PzIIMKNx5GoTH1HYl1aBPFHb1B+KPmQjmArFQZawFF3tVxsTjcu8Rov2m9P1JQT1SVzSjPlW1jPMpnCDtRb4S5XJfmkd6Vf+u21k5uu+61zzDX+ymT2mhmgcZGTrZVhamGcBhgkmoq2BzWJhPdWZ+cqimmMQ4dK9l3U0HfrOcZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4853.namprd12.prod.outlook.com (2603:10b6:a03:1da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 11:12:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:12:58 +0000
Content-Type: multipart/alternative;
 boundary="------------SMOa2XnKRIgyMPTnSbocOT0W"
Message-ID: <ff048af4-74b4-bbaa-5454-88fe137efa9c@amd.com>
Date: Mon, 5 Sep 2022 13:12:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IFtQQVRDSF0gZHJtOkZpeCB0aGUgYmxhbmsg?=
 =?UTF-8?Q?screen_problem_of_some_1920x1080_75Hz_monitors_using_R520_graphic?=
 =?UTF-8?Q?s_card?=
Content-Language: en-US
To: =?UTF-8?B?6ZKf5rKb?= <zhongpei@kylinos.cn>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, isabbasso@riseup.net
References: <2gm0yx7o7er-2gm28v1398k@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2gm0yx7o7er-2gm28v1398k@nsmail6.0>
X-ClientProxiedBy: AS9PR05CA0057.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::35) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77916a8b-6603-42f4-a84b-08da8f2f9703
X-MS-TrafficTypeDiagnostic: BY5PR12MB4853:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THRv9bDsR2qBnJsXreMiLDNg+tq8UpTuNpoEMcnLg2rpaqqMJcy8q/GRodpG/SaIXmAevxfWduI1b/KbEEFZvZmm+YpdU+s0j2NphJS3D0HkT+K8MgRr7W2xQGuxjyLaShGxIezUp8cTpDWvtLFHaMVtMcMD1AdqF9Lw1cE88/zHGHUz7WAskfB/nsmWStb32hlEf6CVIVaCYAIkEqTRrcVT8OUuEeAEw3bf0uAknAGPVxtYbjg3r2yIpi5Qn38UACpuuaA6hSL9wgWRgAdyKFscg9f6Qc95NrQqGoiuRNlyAWuuD2Q9fo8QKA608qVu106bmCNg7R1zpsNdoTLgQ5M5yR1J0xB1sGZGkI8z1trRIrgz56qtdYt0L1OychlNKos9sZprFdgtB/FzFdn74NBRmZ8U4PDtHqUVUmYLcU4gy5fzn5mnejEVEvVyTuk8SV/qsOLVE1MvsglOZbQURRnjWZk2BSUQqzpNQFaKfTbzSVwr5yt0Ydv6W4eEUmZci2RbRd4GRU1y15Spn6xTvd9UpymyMejr/abA7cqUHGioeuq/NRr1pK89Y9n3g/uCxGCFIlqf4KzKXOXBpRDfu36wzMf4ZeylXBMRT8fE3JBbfYKT0uZ5yDpNSDfLoFaGd4wJ7YQFrWSatGS1DIjQRdgd4NlMPBrvLbwvBBLK3N8/0mKKqI21yBDoXQjOjIimhugr/K9N01FX2QueEvo4Ys5e7Yi4GZlHRjxp2oi8u8gB74QsRZtugqA+ZujN5Xp9Oku47ppY6bALRHQyLWaONR1WD+ZRwm5c2WDJ80G8dKE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(66574015)(316002)(31686004)(36756003)(224303003)(186003)(38100700002)(83380400001)(2616005)(6486002)(86362001)(4326008)(66476007)(31696002)(66556008)(66946007)(6506007)(33964004)(26005)(8936002)(5660300002)(6666004)(2906002)(6512007)(478600001)(41300700001)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blpRbmtPY0FBODBheVBhc2kvTFRmUFUvUGJwOVdBTWVCY3hYN1MzZndrSHVh?=
 =?utf-8?B?NDlTd2FNM041NGV1WlJwekdmNlVWZ3NHMFNIVGpzdlRSdGdoUnRBNTZhMGFK?=
 =?utf-8?B?QW5MSFZSS2s2TmxReUIrRkZGUTlOUnQxcXdEU2VtcUYwS2NHeDhjcCtFYzIy?=
 =?utf-8?B?RVowd3lURGRSSEt2QWhnK0ZhcDRDb2pEaWdzNlk5aFdQTUUyNGErdjhqbmI2?=
 =?utf-8?B?d0E4SVcvZ3BTY2czRyt5NzhVT1VteXNXM29KNXY3dlFnN1F0dE5mVE5mZm10?=
 =?utf-8?B?YWI5K0hvK2RMU004cnBGOTJVSEJCL0Vta1dqektOY0ppQ3ROWnhUQU0rdGFE?=
 =?utf-8?B?N0RESHE0S2NWNVpzQ0h1bDhQeXFqTHJBajBGQ2xlWGUwWlV1VjlXVWQwZHFI?=
 =?utf-8?B?NHFTU2NTUzhNbGRxTHJRd3hqQ000T3ZNUzNlRTNMSnlSODlseldacWJ1TDRI?=
 =?utf-8?B?akRIdXpLbHA3aDZKczJYK3ZONXRYNGhnaktabVZRUVJmeUQ1bVZlTU1jck1u?=
 =?utf-8?B?S1lEL1hBdXQrZjBIZ1VjNmdENVpJN29jYlBsWnRabE5ab1RXSjRic0pYTytH?=
 =?utf-8?B?VlplTi9hbXF2eWtQVHRTQm81Vk1qRy9oOEJCWWlSQlFQNHpMSDBZOTVWOFNW?=
 =?utf-8?B?TFlRTWJ1MG1vbXV3THZma2o0aDRtdUFDS0lDdkVwR3RDVmQ1b29qUnRzZjVv?=
 =?utf-8?B?VnF6RTRkVzVxSm56UUVxd040bDU2QldYcjUrVllZZmtiYmd5enF3Mi9UZzRM?=
 =?utf-8?B?YitoZDdZaGhadHh2b0tNN0VWaU1vb1dNUnZ2eEs4Ti9BdjErL29CSThHREhF?=
 =?utf-8?B?cjRNd0drbEdLOXpEcDYyMGx0L1RtWnBEZkZFazlPNk51YmU4TStZOHYydkZN?=
 =?utf-8?B?Nzd5Y0Qxd0VnbCsvSlFuYUczWG5XNzF0dkpnN2IvclRmNnVoQU01bC9hRHoz?=
 =?utf-8?B?RDhUZmYwV0pVV0ZFd3FTSEZDT2Fxd1RFbjdQc1FlU09XVzJEUFVGVkRuTFNS?=
 =?utf-8?B?MzdPVmtmdlhCSDlneURPV3dVSy9YNy80R2FTMHBrSG1KS3ZMU0RLYmU2cDV6?=
 =?utf-8?B?S0N2OHpMZTBuWlNhaUVZZkExb2xQWHcvL1htbkcyYk15aUpDMFVTeFhSR09x?=
 =?utf-8?B?UkIwNCtyWmZzbGlxUDM2ZWJBRUlyMGpCbDVEV3ZFS25wMkhrNlpITUhGV0dq?=
 =?utf-8?B?M2pBNlNTZi9EeXpyTjY0aWlBdk9LVXRTNVQ3VmdLeTBRd3dseHFDSlRIYzdO?=
 =?utf-8?B?bnRPSVFoS1RnTk1EbGFqbTc3eTlmWEpLeFNXK25jK29OSTlBVzNmLzZkUmkr?=
 =?utf-8?B?bXRGQzczdGJ3cGpGeXNXbG9yWTRhNlJuTDZGRDdUTzZ0bWhHNjdBRy9PbTZp?=
 =?utf-8?B?R1NSYWU4VC9LaThMUTZjMXdTYURGemlpN2Z3d0VUZjhGYzAzZWI3bS8rVEl0?=
 =?utf-8?B?QzZkWERWdFNJUkF6ZW9GN3pnZDQralZZaDZFdFhGVVd1ZEdCMzZPaHJHeTJn?=
 =?utf-8?B?ZkdPU3NPSThxVUFzM3JMaHJHQStTZ0hSblNyd1JsbmlGeC9GZU1rRHFiT3pX?=
 =?utf-8?B?YzhjTVFHWkRYeE5NSnIzb3ROSEliNUh5UXB2a3YvZlBKcmlwTEhxcHRzTVov?=
 =?utf-8?B?dnpxY3I4Y3NRTFJhTm5CMkorU0M1YTZkbnRaVEh0UjhjWWU3R0ZGMkZsQUty?=
 =?utf-8?B?Qm90R1pRWTJiZjVBUEVwZ0dkemRzb2w5M0RZSmFtUzB2QVkvSU54NWp1NGgx?=
 =?utf-8?B?anZlbUN0QnRrS1A1T2gzSnkxVEhkVmlrUFUzUVAwUWFGajQxMU9zU0xmRHVV?=
 =?utf-8?B?OWcyNCtOUlN5VWljU2ZLUHF6N2Y0M3lPeWx4RWVGUUFaVC95L1RoOGJvVzNW?=
 =?utf-8?B?b3dMbWFDanJ2S2F4MlVka25NVFliYVAzcDd5VS9zVGY0L2pra3V4dEFocHRw?=
 =?utf-8?B?dm45Y2w1YzlwbGpOaDlNQ2lKdktDTW5PVUtDdW4rTk96OStXbW1aRnhLbHF0?=
 =?utf-8?B?Q05KMkN0a2pmZkhwbTFES0J2cHlYUXBxZkFkbjlld0l6UUgya3JCTUUxNmJp?=
 =?utf-8?B?OGNNd2hTSU5JYVg2bzZMRHkvMXRPTnB1MmxUQzFkd1dMK1ovVUhRZXQxTElG?=
 =?utf-8?Q?8QZo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77916a8b-6603-42f4-a84b-08da8f2f9703
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 11:12:58.8368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YraBA2qqlrPN0GJedbYV3U3g4cJUzGVsxB0VLfVJLNggHCqcxbIaNVS9VJ6qnYMV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4853
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------SMOa2XnKRIgyMPTnSbocOT0W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 05.09.22 um 10:10 schrieb 钟沛:
>
> Thanks for your reply!
>
>
> We found that in the amdgpu_pll_compute function, when the 
> target_clock is the value contained in the drm_dmt_modes defined in 
> drm_edid.c, the diff is 0. When target_clock is some special value, we 
> cannot find a diff value of 0, so we need to find the smallest diff 
> value to fit the current target_clock. For the monitor that has the 
> blank screen problem here, we found that when the ref_div_max is 128, 
> the diff value is smaller and the blank screen problem can be solved. 
> We tested some other monitors and added log printing to the code. We 
> found that this change did not affect those monitors, and in the 
> analysis of the logs, we found that the solution with a smaller diff 
> value always displayed normally.
>
>
> Changing the value of ref_div_max from 128 to 100 can solve the blank 
> screen problem of some monitors, but it will also cause some normal 
> monitors to go black, so is it a more reasonable solution to determine 
> the value of ref_div_max according to the value of diff?
>

Nope, exactly that's just utterly nonsense.

What we could maybe do is to prefer a smaller ref_div over a larger 
ref_div, but I don't see how this will help you.

Regards,
Christian.

>
> Thank you for taking the time to read my email.
>
>
> Best Regards.
>
> ----
>
>
>
>
>
>
>
> *主　题：*Re: [PATCH] drm:Fix the blank screen problem of some 1920x1080 
> 75Hz monitors using R520 graphics card
> *日　期：*2022-09-05 14:05
> *发件人：*Christian König
> *收件人：*钟沛alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net 
>
>
>
> Am 05.09.22 um 05:23 schrieb zhongpei:
> > We found that in the scenario of AMD R520 graphics card
> > and some 1920x1080 monitors,when we switch the refresh rate
> > of the monitor to 75Hz,the monitor will have a blank screen problem,
> > and the restart cannot be restored.After testing, it is found that
> > when we limit the maximum value of ref_div_max to 128,
> > the problem can be solved.In order to keep the previous modification
> > to be compatible with other monitors,we added a judgment
> > when finding the minimum diff value in the loop of the
> > amdgpu_pll_compute/radeon_compute_pll_avivo function.
> > If no diff value of 0 is found when the maximum value of ref_div_max
> > is limited to 100,continue to search when it is 128,
> > and take the parameter with the smallest diff value.
>
> Well that's at least better than what I've seen in previous tries to fix
> this.
>
> But as far as I can see this will certainly break some other monitors,
> so that is pretty much a NAK.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: zhongpei <zhongpei@kylinos.cn>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 17 +++++++++++++----
> >   drivers/gpu/drm/radeon/radeon_display.c | 15 +++++++++++----
> >   2 files changed, 24 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c 
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
> > index 0bb2466d539a..0c298faa0f94 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
> > @@ -84,12 +84,13 @@ static void amdgpu_pll_reduce_ratio(unsigned 
> *nom, unsigned *den,
> >   static void amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev, 
> unsigned int nom,
> >        unsigned int den, unsigned int post_div,
> >        unsigned int fb_div_max, unsigned int ref_div_max,
> > -      unsigned int *fb_div, unsigned int *ref_div)
> > +      unsigned int ref_div_limit, unsigned int *fb_div,
> > +      unsigned int *ref_div)
> >   {
> >
> >   /* limit reference * post divider to a maximum */
> >   if (adev->family == AMDGPU_FAMILY_SI)
> > - ref_div_max = min(100 / post_div, ref_div_max);
> > + ref_div_max = min(ref_div_limit / post_div, ref_div_max);
> >   else
> >   ref_div_max = min(128 / post_div, ref_div_max);
> >
> > @@ -136,6 +137,7 @@ void amdgpu_pll_compute(struct amdgpu_device *adev,
> >   unsigned ref_div_min, ref_div_max, ref_div;
> >   unsigned post_div_best, diff_best;
> >   unsigned nom, den;
> > + unsigned ref_div_limit, ref_limit_best;
> >
> >   /* determine allowed feedback divider range */
> >   fb_div_min = pll->min_feedback_div;
> > @@ -204,11 +206,12 @@ void amdgpu_pll_compute(struct amdgpu_device 
> *adev,
> >   else
> >   post_div_best = post_div_max;
> >   diff_best = ~0;
> > + ref_div_limit = ref_limit_best = 100;
> >
> >   for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {
> >   unsigned diff;
> >   amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max,
> > -  ref_div_max, &fb_div, &ref_div);
> > +  ref_div_max, ref_div_limit, &fb_div, &ref_div);
> >   diff = abs(target_clock - (pll->reference_freq * fb_div) /
> >   (ref_div * post_div));
> >
> > @@ -217,13 +220,19 @@ void amdgpu_pll_compute(struct amdgpu_device 
> *adev,
> >
> >   post_div_best = post_div;
> >   diff_best = diff;
> > + ref_limit_best = ref_div_limit;
> >   }
> > + if (post_div >= post_div_max && diff_best != 0 && ref_div_limit != 
> 128) {
> > + ref_div_limit = 128;
> > + post_div = post_div_min - 1;
> > + }
> > +
> >   }
> >   post_div = post_div_best;
> >
> >   /* get the feedback and reference divider for the optimal value */
> >   amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max, 
> ref_div_max,
> > -  &fb_div, &ref_div);
> > +  ref_limit_best, &fb_div, &ref_div);
> >
> >   /* reduce the numbers to a simpler ratio once more */
> >   /* this also makes sure that the reference divider is large enough */
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c 
> b/drivers/gpu/drm/radeon/radeon_display.c
> > index f12675e3d261..0fcbf45a68db 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -925,10 +925,10 @@ static void avivo_reduce_ratio(unsigned *nom, 
> unsigned *den,
> >    */
> >   static void avivo_get_fb_ref_div(unsigned nom, unsigned den, 
> unsigned post_div,
> >   unsigned fb_div_max, unsigned ref_div_max,
> > - unsigned *fb_div, unsigned *ref_div)
> > + unsigned ref_div_limit, unsigned *fb_div, unsigned *ref_div)
> >   {
> >   /* limit reference * post divider to a maximum */
> > - ref_div_max = max(min(100 / post_div, ref_div_max), 1u);
> > + ref_div_max = max(min(ref_div_limit / post_div, ref_div_max), 1u);
> >
> >   /* get matching reference and feedback divider */
> >   *ref_div = min(max(den/post_div, 1u), ref_div_max);
> > @@ -971,6 +971,7 @@ void radeon_compute_pll_avivo(struct radeon_pll 
> *pll,
> >   unsigned ref_div_min, ref_div_max, ref_div;
> >   unsigned post_div_best, diff_best;
> >   unsigned nom, den;
> > + unsigned ref_div_limit, ref_limit_best;
> >
> >   /* determine allowed feedback divider range */
> >   fb_div_min = pll->min_feedback_div;
> > @@ -1042,11 +1043,12 @@ void radeon_compute_pll_avivo(struct 
> radeon_pll *pll,
> >   else
> >   post_div_best = post_div_max;
> >   diff_best = ~0;
> > + ref_div_limit = ref_limit_best = 100;
> >
> >   for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {
> >   unsigned diff;
> >   avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,
> > -     ref_div_max, &fb_div, &ref_div);
> > +     ref_div_max, ref_div_limit, &fb_div, &ref_div);
> >   diff = abs(target_clock - (pll->reference_freq * fb_div) /
> >   (ref_div * post_div));
> >
> > @@ -1055,13 +1057,18 @@ void radeon_compute_pll_avivo(struct 
> radeon_pll *pll,
> >
> >   post_div_best = post_div;
> >   diff_best = diff;
> > + ref_limit_best = ref_div_limit;
> > + }
> > + if (post_div >= post_div_max && diff_best != 0 && ref_div_limit != 
> 128) {
> > + ref_div_limit = 128;
> > + post_div = post_div_min - 1;
> >   }
> >   }
> >   post_div = post_div_best;
> >
> >   /* get the feedback and reference divider for the optimal value */
> >   avivo_get_fb_ref_div(nom, den, post_div, fb_div_max, ref_div_max,
> > -     &fb_div, &ref_div);
> > +     ref_limit_best, &fb_div, &ref_div);
> >
> >   /* reduce the numbers to a simpler ratio once more */
> >   /* this also makes sure that the reference divider is large enough */
>

--------------SMOa2XnKRIgyMPTnSbocOT0W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 05.09.22 um 10:10 schrieb 钟沛:<br>
    <blockquote type="cite" cite="mid:2gm0yx7o7er-2gm28v1398k@nsmail6.0">
      
      <p>Thanks for your reply!</p>
      <p><br>
      </p>
      <p>We found that in the amdgpu_pll_compute function, when the
        target_clock is the value contained in the drm_dmt_modes defined
        in drm_edid.c, the diff is 0. When target_clock is some special
        value, we cannot find a diff value of 0, so we need to find the
        smallest diff value to fit the current target_clock. For the
        monitor that has the blank screen problem here, we found that
        when the ref_div_max is 128, the diff value is smaller and the
        blank screen problem can be solved. We tested some other
        monitors and added log printing to the code. We found that this
        change did not affect those monitors, and in the analysis of the
        logs, we found that the solution with a smaller diff value
        always displayed normally.</p>
      <p><br>
      </p>
      <p>Changing the value of ref_div_max from 128 to 100 can solve the
        blank screen problem of some monitors, but it will also cause
        some normal monitors to go black, so is it a more reasonable
        solution to determine the value of ref_div_max according to the
        value of diff?</p>
    </blockquote>
    <br>
    Nope, exactly that's just utterly nonsense.<br>
    <br>
    What we could maybe do is to prefer a smaller ref_div over a larger
    ref_div, but I don't see how this will help you.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:2gm0yx7o7er-2gm28v1398k@nsmail6.0"><br>
      Thank you&nbsp;for taking the time to&nbsp;read&nbsp;my&nbsp;email.
      <p><span class="qkunPe" style="color: rgb(234, 67, 53);
          font-family: arial, sans-serif; font-size: 14px;
          background-color: rgb(255, 255, 255);"></span></p>
      <p><br>
      </p>
      <p><span style="color: rgb(18, 18, 18); font-family:
          -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;,
          &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;,
          &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;,
          &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size:
          medium; background-color: rgb(255, 255, 255);">Best Regards.</span></p>
      <p>----</p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
        <br>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><strong>主　题：</strong><span id="subject">Re: [PATCH] drm:Fix the
          blank screen problem of some 1920x1080 75Hz monitors using
          R520 graphics card</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>日　期：</strong><span id="date">2022-09-05 14:05</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>发件人：</strong><span id="from">Christian König</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>收件人：</strong><span id="to">钟沛<a class="moz-txt-link-abbreviated" href="mailto:alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net">alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net</a></span>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>Am 05.09.22 um 05:23 schrieb zhongpei:<br>
        &gt; We found that in the scenario of AMD R520 graphics card<br>
        &gt; and some 1920x1080 monitors,when we switch the refresh rate<br>
        &gt; of the monitor to 75Hz,the monitor will have a blank screen
        problem,<br>
        &gt; and the restart cannot be restored.After testing, it is
        found that<br>
        &gt; when we limit the maximum value of ref_div_max to 128,<br>
        &gt; the problem can be solved.In order to keep the previous
        modification<br>
        &gt; to be compatible with other monitors,we added a judgment<br>
        &gt; when finding the minimum diff value in the loop of the<br>
        &gt; amdgpu_pll_compute/radeon_compute_pll_avivo function.<br>
        &gt; If no diff value of 0 is found when the maximum value of
        ref_div_max<br>
        &gt; is limited to 100,continue to search when it is 128,<br>
        &gt; and take the parameter with the smallest diff value.<br>
        <br>
        Well that's at least better than what I've seen in previous
        tries to fix <br>
        this.<br>
        <br>
        But as far as I can see this will certainly break some other
        monitors, <br>
        so that is pretty much a NAK.<br>
        <br>
        Regards,<br>
        Christian.<br>
        <br>
        &gt;<br>
        &gt; Signed-off-by: zhongpei <a class="moz-txt-link-rfc2396E" href="mailto:zhongpei@kylinos.cn">&lt;zhongpei@kylinos.cn&gt;</a><br>
        &gt; ---<br>
        &gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 17
        +++++++++++++----<br>
        &gt; &nbsp; drivers/gpu/drm/radeon/radeon_display.c | 15
        +++++++++++----<br>
        &gt; &nbsp; 2 files changed, 24 insertions(+), 8 deletions(-)<br>
        &gt;<br>
        &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
        b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c<br>
        &gt; index 0bb2466d539a..0c298faa0f94 100644<br>
        &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c<br>
        &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c<br>
        &gt; @@ -84,12 +84,13 @@ static void
        amdgpu_pll_reduce_ratio(unsigned *nom, unsigned *den,<br>
        &gt; &nbsp; static void amdgpu_pll_get_fb_ref_div(struct
        amdgpu_device *adev, unsigned int nom,<br>
        &gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int den, unsigned int post_div,<br>
        &gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int fb_div_max, unsigned int ref_div_max,<br>
        &gt; - &nbsp; &nbsp; &nbsp;unsigned int *fb_div, unsigned int *ref_div)<br>
        &gt; + &nbsp; &nbsp; &nbsp;unsigned int ref_div_limit, unsigned int *fb_div,<br>
        &gt; + &nbsp; &nbsp; &nbsp;unsigned int *ref_div)<br>
        &gt; &nbsp; {<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* limit reference * post divider to a maximum */<br>
        &gt; &nbsp; if (adev-&gt;family == AMDGPU_FAMILY_SI)<br>
        &gt; - ref_div_max = min(100 / post_div, ref_div_max);<br>
        &gt; + ref_div_max = min(ref_div_limit / post_div, ref_div_max);<br>
        &gt; &nbsp; else<br>
        &gt; &nbsp; ref_div_max = min(128 / post_div, ref_div_max);<br>
        &gt; &nbsp; <br>
        &gt; @@ -136,6 +137,7 @@ void amdgpu_pll_compute(struct
        amdgpu_device *adev,<br>
        &gt; &nbsp; unsigned ref_div_min, ref_div_max, ref_div;<br>
        &gt; &nbsp; unsigned post_div_best, diff_best;<br>
        &gt; &nbsp; unsigned nom, den;<br>
        &gt; + unsigned ref_div_limit, ref_limit_best;<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* determine allowed feedback divider range */<br>
        &gt; &nbsp; fb_div_min = pll-&gt;min_feedback_div;<br>
        &gt; @@ -204,11 +206,12 @@ void amdgpu_pll_compute(struct
        amdgpu_device *adev,<br>
        &gt; &nbsp; else<br>
        &gt; &nbsp; post_div_best = post_div_max;<br>
        &gt; &nbsp; diff_best = ~0;<br>
        &gt; + ref_div_limit = ref_limit_best = 100;<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; for (post_div = post_div_min; post_div &lt;=
        post_div_max; ++post_div) {<br>
        &gt; &nbsp; unsigned diff;<br>
        &gt; &nbsp; amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div,
        fb_div_max,<br>
        &gt; - &nbsp;ref_div_max, &amp;fb_div, &amp;ref_div);<br>
        &gt; + &nbsp;ref_div_max, ref_div_limit, &amp;fb_div, &amp;ref_div);<br>
        &gt; &nbsp; diff = abs(target_clock - (pll-&gt;reference_freq *
        fb_div) /<br>
        &gt; &nbsp; (ref_div * post_div));<br>
        &gt; &nbsp; <br>
        &gt; @@ -217,13 +220,19 @@ void amdgpu_pll_compute(struct
        amdgpu_device *adev,<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; post_div_best = post_div;<br>
        &gt; &nbsp; diff_best = diff;<br>
        &gt; + ref_limit_best = ref_div_limit;<br>
        &gt; &nbsp; }<br>
        &gt; + if (post_div &gt;= post_div_max &amp;&amp; diff_best != 0
        &amp;&amp; ref_div_limit != 128) {<br>
        &gt; + ref_div_limit = 128;<br>
        &gt; + post_div = post_div_min - 1;<br>
        &gt; + }<br>
        &gt; +<br>
        &gt; &nbsp; }<br>
        &gt; &nbsp; post_div = post_div_best;<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* get the feedback and reference divider for the optimal
        value */<br>
        &gt; &nbsp; amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div,
        fb_div_max, ref_div_max,<br>
        &gt; - &nbsp;&amp;fb_div, &amp;ref_div);<br>
        &gt; + &nbsp;ref_limit_best, &amp;fb_div, &amp;ref_div);<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* reduce the numbers to a simpler ratio once more */<br>
        &gt; &nbsp; /* this also makes sure that the reference divider is
        large enough */<br>
        &gt; diff --git a/drivers/gpu/drm/radeon/radeon_display.c
        b/drivers/gpu/drm/radeon/radeon_display.c<br>
        &gt; index f12675e3d261..0fcbf45a68db 100644<br>
        &gt; --- a/drivers/gpu/drm/radeon/radeon_display.c<br>
        &gt; +++ b/drivers/gpu/drm/radeon/radeon_display.c<br>
        &gt; @@ -925,10 +925,10 @@ static void
        avivo_reduce_ratio(unsigned *nom, unsigned *den,<br>
        &gt; &nbsp; &nbsp;*/<br>
        &gt; &nbsp; static void avivo_get_fb_ref_div(unsigned nom, unsigned
        den, unsigned post_div,<br>
        &gt; &nbsp; unsigned fb_div_max, unsigned ref_div_max,<br>
        &gt; - unsigned *fb_div, unsigned *ref_div)<br>
        &gt; + unsigned ref_div_limit, unsigned *fb_div, unsigned
        *ref_div)<br>
        &gt; &nbsp; {<br>
        &gt; &nbsp; /* limit reference * post divider to a maximum */<br>
        &gt; - ref_div_max = max(min(100 / post_div, ref_div_max), 1u);<br>
        &gt; + ref_div_max = max(min(ref_div_limit / post_div,
        ref_div_max), 1u);<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* get matching reference and feedback divider */<br>
        &gt; &nbsp; *ref_div = min(max(den/post_div, 1u), ref_div_max);<br>
        &gt; @@ -971,6 +971,7 @@ void radeon_compute_pll_avivo(struct
        radeon_pll *pll,<br>
        &gt; &nbsp; unsigned ref_div_min, ref_div_max, ref_div;<br>
        &gt; &nbsp; unsigned post_div_best, diff_best;<br>
        &gt; &nbsp; unsigned nom, den;<br>
        &gt; + unsigned ref_div_limit, ref_limit_best;<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* determine allowed feedback divider range */<br>
        &gt; &nbsp; fb_div_min = pll-&gt;min_feedback_div;<br>
        &gt; @@ -1042,11 +1043,12 @@ void
        radeon_compute_pll_avivo(struct radeon_pll *pll,<br>
        &gt; &nbsp; else<br>
        &gt; &nbsp; post_div_best = post_div_max;<br>
        &gt; &nbsp; diff_best = ~0;<br>
        &gt; + ref_div_limit = ref_limit_best = 100;<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; for (post_div = post_div_min; post_div &lt;=
        post_div_max; ++post_div) {<br>
        &gt; &nbsp; unsigned diff;<br>
        &gt; &nbsp; avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,<br>
        &gt; - &nbsp; &nbsp; ref_div_max, &amp;fb_div, &amp;ref_div);<br>
        &gt; + &nbsp; &nbsp; ref_div_max, ref_div_limit, &amp;fb_div,
        &amp;ref_div);<br>
        &gt; &nbsp; diff = abs(target_clock - (pll-&gt;reference_freq *
        fb_div) /<br>
        &gt; &nbsp; (ref_div * post_div));<br>
        &gt; &nbsp; <br>
        &gt; @@ -1055,13 +1057,18 @@ void
        radeon_compute_pll_avivo(struct radeon_pll *pll,<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; post_div_best = post_div;<br>
        &gt; &nbsp; diff_best = diff;<br>
        &gt; + ref_limit_best = ref_div_limit;<br>
        &gt; + }<br>
        &gt; + if (post_div &gt;= post_div_max &amp;&amp; diff_best != 0
        &amp;&amp; ref_div_limit != 128) {<br>
        &gt; + ref_div_limit = 128;<br>
        &gt; + post_div = post_div_min - 1;<br>
        &gt; &nbsp; }<br>
        &gt; &nbsp; }<br>
        &gt; &nbsp; post_div = post_div_best;<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* get the feedback and reference divider for the optimal
        value */<br>
        &gt; &nbsp; avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,
        ref_div_max,<br>
        &gt; - &nbsp; &nbsp; &amp;fb_div, &amp;ref_div);<br>
        &gt; + &nbsp; &nbsp; ref_limit_best, &amp;fb_div, &amp;ref_div);<br>
        &gt; &nbsp; <br>
        &gt; &nbsp; /* reduce the numbers to a simpler ratio once more */<br>
        &gt; &nbsp; /* this also makes sure that the reference divider is
        large enough */<br>
        <br>
      </p>
    </blockquote>
    <br>
  </body>
</html>

--------------SMOa2XnKRIgyMPTnSbocOT0W--
