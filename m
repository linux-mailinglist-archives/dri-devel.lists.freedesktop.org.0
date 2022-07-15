Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D221575C39
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 09:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF97F11AC10;
	Fri, 15 Jul 2022 07:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309CE11AC0A;
 Fri, 15 Jul 2022 07:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtnMAc2wMzMEMEBZUJduWxJgeVW7sOUqYUjqilkTgudmTCL2/3TjrT3Vo8y9tGh8oyquBDxrzWIgK6sLdVBqKej2lzDwsXgCLPDrxnx6pd0fNzFkqcKwt/fGJ+Cqe1cd+Q0AdqjnOAWqQXIqbbQpvOqVVsav9Dzyzru27s3eOpBmL1doNq/4UF/YA8E6xExrieOqrUHk5ivBsC/Lo15DaCXVJhMU9zr6OYt0M/awIFxG6/s8m5Wlk/Ac30nG5aKkaINodc4Kc/JADMYL/pLGhLlzMGoZVvKHcbW0c1zteoRfjKeQ4SNVen5cMDBrCp4DfTTp3oX5G7uvCCih/w7lrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZQjxXDz2hG/3N5bZiiZeL5fcvmfYqgo07cRTmagimY=;
 b=X/DZbNfhhv62rq+IvyHSmTY0C4WheygSXwio4RKDuCbJjM2IDgiDKx9j4GadgyVjh/8oXrBB/txfOVQi45fqxVwtPLUbpT4gjkARpRFei92a3DxHYjDqPY/TT5UaNaoQnxHux5f4cVPp+Ls+mLCphsjAd7mIgJcgjoK+y+bdAp2bunTqgLW6EcgmMjTVMX3by+uAUMtF9hoyraE38rDe1FyQLNMFUAqEC/tGrutdLAlMN800A2NTvWAS0WSL9G/0djJdVRAayLgqC9r3l473sPf0gz6OnMd+UodfdAW0TL6fjvzDG4WRYU0tGWdH1qQ6M8T9+J2OR2BDctX/YaysfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZQjxXDz2hG/3N5bZiiZeL5fcvmfYqgo07cRTmagimY=;
 b=MhBpa3i3m65O1lbz1WVRh+5TMt0Ge5sVtSoJ2DzdFVE3FINl9bEcc3vmTqAwwS4UNWzt6v0hbqmZDjEesKm0+E44hvGbt32otcRHAhZpmjJCr4TN4/nBLDpBBAtwLnD5hh5ocUl3aO+7sMKs8OzPAx/wD8qXXy3eQEeL4GzK1qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2364.namprd12.prod.outlook.com (2603:10b6:907:b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Fri, 15 Jul
 2022 07:20:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 07:20:04 +0000
Message-ID: <43c06f53-bad8-af99-0b57-781dbf716768@amd.com>
Date: Fri, 15 Jul 2022 09:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 1/6] dma-buf: Add _unlocked postfix to function names
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
 <20220715005244.42198-2-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220715005244.42198-2-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac6be9d0-f85d-4af7-5269-08da66326fdb
X-MS-TrafficTypeDiagnostic: MW2PR12MB2364:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HMQjCFRF8BOQmHXPOx8F0zMl0SdVwsgUapu86W8T/swmyPhIvASPuDDwYg2N+liSUJ98+JgcxRt8IC0JRecG5jf9B10QNj6ppB7qIaZ4IrN7XxbkPvanbz1uxx9FmlUpnG0Ok9GT9hhXY/HJ75ZQjtLx9AmTED6eJ3lbiXB64A8hyUgIFVvufz28iIfoLZKKMO1da8TtchxeIHpki3Guo4YOJo91PnIqjdu0aKFroxc1eX90WZYW4GmY5mB5umf7NRqZclPXbp9Yh/B1YRRjrDN7PSNeNUwYT3nYf1K4HvqQQ3pXrVQ5jFrKZdNOAm7IS13wy5BiMH1Yyn2T5K/cWaWooK04390QxgXN8kLpghlnvxGJrIudolT2ttjg3I73i1zq7m2UgaiU3SiTHwGH3jIo/BzlojmqhfOw3W7Qgyw/uOX+RLFPqa6LC/ZAxINtp4F1zJMXQSDHKYc6T+ED5j7LwgDMQuPcwk6A3rl0gtsPjr27aQRSOE+XNIO37DSe1Y2nWYn6LEQaR/ypclqP+01K/RONVjv/fYGNy5kMr/CjcW9J5QPWt3jvHdZLL13TuojqNwvi5rWWKaGP740CqA5sYwPPJ+0UqBsbIMfBR6dbKVaN+40X4Pq1a8Lm9AdJcniF+31TZZcJXzYXAa87WTZz+AtHEz7o/JiVTYhduxuyWAdVn4MYq0TETCKnaz3oGSFmnWe1/vSwdAfwm7OuRVTKDVjOLTrlR3uUmt2aqdTXib4BCOjnCsQ7NNISAgQZy8+ZRrjogNvTEu8bwV968jKv9xAgtx4m9AhUAdv5/HaTyHUwMhBynPUyDxcYmZDsa3cmfTG1hA1Eawrqms5BQgIjtBylE4DBepVDln5Vo/eOK3wfY0MNE+t7ML6COUuuKfhuTRIS+n0PbiiPp5USAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(30864003)(186003)(66556008)(316002)(2906002)(38100700002)(6486002)(36756003)(5660300002)(83380400001)(7416002)(31686004)(478600001)(8676002)(4326008)(6512007)(31696002)(921005)(86362001)(7406005)(41300700001)(2616005)(6506007)(66476007)(8936002)(66574015)(6666004)(66946007)(110136005)(43740500002)(45980500001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFEzZjFIODVIcC81ckhpUmQzSmZ1dmphTm8xVjQyZ1doVWFUZDRHQWVvdWhV?=
 =?utf-8?B?Q1RhR1VSdmdCVlBlbHFydXZxaGJPNytveFNVQXpYak0wU1kxOHNXQUhoS3Z1?=
 =?utf-8?B?UzROcS9Cbk0yNW9uNVIybnYvRkdGb3hZT3I2R0NOdjZuVUZpV092QjNpcGFk?=
 =?utf-8?B?T0tWYU5yeUovYXhLZkZsVW9SWm8zOXRMeHJxWnUxS3gyVE9KMElVYXg4eE9Y?=
 =?utf-8?B?TmY5SnVUMmdlV2lEenl3R1pwalBOTDJWRVNnVzR5WWVpa05sOExjUmVBUzAw?=
 =?utf-8?B?QXZCYWpsVXQzcjU4MUdXMW4wVVh1KzdZYzJTUVdFMlVVK3hGMzRqQUx3Ty92?=
 =?utf-8?B?ZE5DYlB3UXRvSHl0a0pCYm5TMkpsVEovdDFuRncxeWhjZ05ZUjZMNFFGU3dj?=
 =?utf-8?B?cjVjOWhlLzc0N28zYTdWRW5SbUIxSEkrNU1DMGJNdnlqbmw1NXhzTmZ4SFZq?=
 =?utf-8?B?VEtBMW5rTmZGK3JUZkptOFkwVTVLeWxzdytSL3VoMTU1SmYvY0ppaHFQL2Fm?=
 =?utf-8?B?dWlFVWVUcFdVZXc5QW5BeEE5OEtjblN5Ny9rRDBOaTM5OFIyaGVDVkltdFVn?=
 =?utf-8?B?L2xDbVVrYTc4YU5tTE8yZG01SU9lemdQSXhrY2VRdE13V3lvZFZ0OHZhMCtM?=
 =?utf-8?B?bkFFYTE0N1JXWjBlaVhOcmpzNDdZQ2FTWWtqeVE1azQxMHUrYnhFbktjdjZn?=
 =?utf-8?B?c2xsOW5qejkzOTZ5bGhiZS9lcDVrZEErcVZJV0FrWE9zbHE0V0p1OU1lTitj?=
 =?utf-8?B?OUplTGpibmZieXRtVGxnNmpMZjJoakFmOUo5OHlXRkJzSlZUUTFhZXVJUzFV?=
 =?utf-8?B?NUcvWDNsdDRKMHB5RkpzNnFmeHRiZ2VROFBjeThzRXFRQzlwR2dudEo4cVNs?=
 =?utf-8?B?cDBJWHhjdHV6Q0ptUDBVTTB2Z0h0VWpNZnJiWUZuenR0NERRZXhpZ1kwY3d5?=
 =?utf-8?B?VUxRZG95RENiNUJ2aUcrRk5OdHJvVGlwUlRMWkVXSlFHMW9aYVEyZitvWlJL?=
 =?utf-8?B?ZVV4YnZ2c3NXaWtpMjQ0WVJRR3A4azc1d0xxRWloRmkzNlA0dEpNVUZiZlYy?=
 =?utf-8?B?VWlJQkZqVEdDQlM1enZyVkFDWFJ2V0xtRGoxNXJhQWt4STdiTjgwZTRGL3cx?=
 =?utf-8?B?bnM4VFg2NllSUjlCdjJ1SytnL1pyd2Fwd0xSczdaQm0xU01uZG1ZRk82QVc4?=
 =?utf-8?B?VTNyZ29abVNSRyt2TXJlblZxZTdpdWNaOWxUUWdvTXdlM3MrdUMvdThTVklX?=
 =?utf-8?B?UVFjekhVMXNZYkhFYnhTT1FudkdjQmFJbjZxWnhrV2J3cS85MnFPRW5wdktJ?=
 =?utf-8?B?SmY5b2J2eHp1NVdrWDNiYVV4ck94aFBHbmNDckNLaWhRN29GWVFQZXNaRnN5?=
 =?utf-8?B?aUNFQzdTQTdSNEgwNWFkelI3V21yS3Vud2tiRjlBZ09FYmMwNllGUEkrb1Uw?=
 =?utf-8?B?ZDUzd0UrVHlZVkxOaVd2OXl1Z090VTdQU2wwclVycVkrZjZzWmQ2cmdiUWty?=
 =?utf-8?B?MFp2Kzk3Z2dWc2hia3dQV0ZRVmEvNkhVWUpDVnJxT1d5Umc2eFcrRTRrRmRs?=
 =?utf-8?B?eUxVdFNlMzBGOXZXbzRRbXh4cTN2bHpiUjBzam0vYVErMmVVRXIvQ0FwQzdY?=
 =?utf-8?B?aWVzOHdQM1NlV0JmSnM4Qkw2TGVGQ243bkhrZzljRms1aDNrSE8yWllMVHJC?=
 =?utf-8?B?VmtKUmFQUU1oK0ZJbngwNjFjYlZQZXRMTEYzV1EydW9qMC83eFdSNDFPV0dm?=
 =?utf-8?B?aCtTV2VUeCsxNmNQU3FnaEtSNW5LK2U2eVFpWlNCMGVHN29QcWNpUis2SStk?=
 =?utf-8?B?WGlYUDhHcEp2cENwMTRNVVQyR0Y3dllJdXA2V29mUmhEYjIxTG5UMVJQNG93?=
 =?utf-8?B?UzJvS1hGWmhkWXZCejJudytVRDVpU3RzcDNTU0RqSlhOMUhBSy9XZXFpb1NM?=
 =?utf-8?B?UDBFcUJ2dXU3a3dVZSs4NDZqa2hjM1EzaDYvVklobUlWRTdYTEhzWjNwTkxX?=
 =?utf-8?B?WURXS1pGWldmT3hpRUI5eG04UjROZXk0VlNmL0dGSXU2K3Z6dlhlN3NzOXp0?=
 =?utf-8?B?R0ovOWNLeUI3OTNUMXh2anMzcXgrVUpWWEs5eGRoM2hOTGF4R2NIOCtlSE9h?=
 =?utf-8?B?T0RSVDRaK1NadG51WFdHdU8zVzdvYkNGbmxoTS81cnpQb3ZCYUVxelVlZGNJ?=
 =?utf-8?Q?ewM1sTASnqNYzOZJONCJdouFjNsgFACDd+2q6wqLqPGx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6be9d0-f85d-4af7-5269-08da66326fdb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 07:20:04.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ad4VUcHe06bxnUiND8WCvHipAaixFJA0sSfOk7M/To5nkUfvwybGDv4MvjCg6C86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2364
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.07.22 um 02:52 schrieb Dmitry Osipenko:
> Add _unlocked postfix to the dma-buf API function names in a preparation
> to move all non-dynamic dma-buf users over to the dynamic locking
> specification. This patch only renames API functions, preparing drivers
> to the common locking convention. Later on we will make the "unlocked"
> functions to take the reservation lock.
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/dma-buf/dma-buf.c                     | 76 ++++++++++---------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  4 +-
>   drivers/gpu/drm/armada/armada_gem.c           | 14 ++--
>   drivers/gpu/drm/drm_gem_cma_helper.c          |  6 +-
>   drivers/gpu/drm/drm_gem_shmem_helper.c        |  6 +-
>   drivers/gpu/drm/drm_prime.c                   | 12 +--
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  6 +-
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 12 +--
>   .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 20 ++---
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |  8 +-
>   drivers/gpu/drm/tegra/gem.c                   | 27 +++----
>   drivers/infiniband/core/umem_dmabuf.c         | 11 +--
>   .../common/videobuf2/videobuf2-dma-contig.c   | 15 ++--
>   .../media/common/videobuf2/videobuf2-dma-sg.c | 12 +--
>   .../common/videobuf2/videobuf2-vmalloc.c      |  6 +-
>   .../platform/nvidia/tegra-vde/dmabuf-cache.c  | 12 +--
>   drivers/misc/fastrpc.c                        | 12 +--
>   drivers/xen/gntdev-dmabuf.c                   | 14 ++--
>   include/linux/dma-buf.h                       | 34 +++++----
>   21 files changed, 161 insertions(+), 152 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 44574fbe7482..d16237a6ffaa 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -795,7 +795,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>   }
>   
>   /**
> - * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
> + * dma_buf_dynamic_attach_unlocked - Add the device to dma_buf's attachments list
>    * @dmabuf:		[in]	buffer to attach device to.
>    * @dev:		[in]	device to be attached.
>    * @importer_ops:	[in]	importer operations for the attachment
> @@ -817,9 +817,9 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>    * indicated with the error code -EBUSY.
>    */
>   struct dma_buf_attachment *
> -dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       const struct dma_buf_attach_ops *importer_ops,
> -		       void *importer_priv)
> +dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
> +				const struct dma_buf_attach_ops *importer_ops,
> +				void *importer_priv)
>   {
>   	struct dma_buf_attachment *attach;
>   	int ret;
> @@ -892,25 +892,25 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_unlock(attach->dmabuf->resv);
>   
> -	dma_buf_detach(dmabuf, attach);
> +	dma_buf_detach_unlocked(dmabuf, attach);
>   	return ERR_PTR(ret);
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach_unlocked, DMA_BUF);
>   
>   /**
> - * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
> + * dma_buf_attach_unlocked - Wrapper for dma_buf_dynamic_attach
>    * @dmabuf:	[in]	buffer to attach device to.
>    * @dev:	[in]	device to be attached.
>    *
> - * Wrapper to call dma_buf_dynamic_attach() for drivers which still use a static
> - * mapping.
> + * Wrapper to call dma_buf_dynamic_attach_unlocked() for drivers which still
> + * use a static mapping.
>    */
> -struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> -					  struct device *dev)
> +struct dma_buf_attachment *dma_buf_attach_unlocked(struct dma_buf *dmabuf,
> +						   struct device *dev)
>   {
> -	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
> +	return dma_buf_dynamic_attach_unlocked(dmabuf, dev, NULL, NULL);
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_attach_unlocked, DMA_BUF);
>   
>   static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>   			    struct sg_table *sg_table,
> @@ -923,7 +923,7 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>   }
>   
>   /**
> - * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
> + * dma_buf_detach_unlocked - Remove the given attachment from dmabuf's attachments list
>    * @dmabuf:	[in]	buffer to detach from.
>    * @attach:	[in]	attachment to be detached; is free'd after this call.
>    *
> @@ -931,7 +931,8 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>    *
>    * Optionally this calls &dma_buf_ops.detach for device-specific detach.
>    */
> -void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
> +void dma_buf_detach_unlocked(struct dma_buf *dmabuf,
> +			     struct dma_buf_attachment *attach)
>   {
>   	if (WARN_ON(!dmabuf || !attach))
>   		return;
> @@ -956,14 +957,14 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   
>   	kfree(attach);
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_detach_unlocked, DMA_BUF);
>   
>   /**
>    * dma_buf_pin - Lock down the DMA-buf
>    * @attach:	[in]	attachment which should be pinned
>    *
> - * Only dynamic importers (who set up @attach with dma_buf_dynamic_attach()) may
> - * call this, and only for limited use cases like scanout and not for temporary
> + * Only dynamic importers (who set up @attach with dma_buf_dynamic_attach_unlocked())
> + * may call this, and only for limited use cases like scanout and not for temporary
>    * pin operations. It is not permitted to allow userspace to pin arbitrary
>    * amounts of buffers through this interface.
>    *
> @@ -1010,7 +1011,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>   
>   /**
> - * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
> + * dma_buf_map_attachment_locked - Returns the scatterlist table of the attachment;
>    * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
>    * dma_buf_ops.
>    * @attach:	[in]	attachment whose scatterlist is to be returned
> @@ -1030,8 +1031,9 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>    * Important: Dynamic importers must wait for the exclusive fence of the struct
>    * dma_resv attached to the DMA-BUF first.
>    */
> -struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> -					enum dma_data_direction direction)
> +struct sg_table *
> +dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
> +				enum dma_data_direction direction)

The locking state of mapping and unmapping operations depend on if the 
attachment is dynamic or not.

So this here is not a good idea at all since it suggests that the 
function is always called without holding the lock.

>   {
>   	struct sg_table *sg_table;
>   	int r;
> @@ -1097,10 +1099,10 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   #endif /* CONFIG_DMA_API_DEBUG */
>   	return sg_table;
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
>   
>   /**
> - * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
> + * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
>    * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
>    * dma_buf_ops.
>    * @attach:	[in]	attachment to unmap buffer from
> @@ -1109,9 +1111,9 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
>    *
>    * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
>    */
> -void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
> -				struct sg_table *sg_table,
> -				enum dma_data_direction direction)
> +void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> +				       struct sg_table *sg_table,
> +				       enum dma_data_direction direction)

Same here of course.

Regards,
Christian.


>   {
>   	might_sleep();
>   
> @@ -1133,7 +1135,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
>   
>   /**
>    * dma_buf_move_notify - notify attachments that DMA-buf is moving
> @@ -1330,7 +1332,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>   
>   
>   /**
> - * dma_buf_mmap - Setup up a userspace mmap with the given vma
> + * dma_buf_mmap_unlocked - Setup up a userspace mmap with the given vma
>    * @dmabuf:	[in]	buffer that should back the vma
>    * @vma:	[in]	vma for the mmap
>    * @pgoff:	[in]	offset in pages where this mmap should start within the
> @@ -1343,8 +1345,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
>    *
>    * Can return negative error values, returns 0 on success.
>    */
> -int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
> -		 unsigned long pgoff)
> +int dma_buf_mmap_unlocked(struct dma_buf *dmabuf, struct vm_area_struct *vma,
> +			  unsigned long pgoff)
>   {
>   	if (WARN_ON(!dmabuf || !vma))
>   		return -EINVAL;
> @@ -1368,10 +1370,10 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>   
>   	return dmabuf->ops->mmap(dmabuf, vma);
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
>   
>   /**
> - * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
> + * dma_buf_vmap_unlocked - Create virtual mapping for the buffer object into kernel
>    * address space. Same restrictions as for vmap and friends apply.
>    * @dmabuf:	[in]	buffer to vmap
>    * @map:	[out]	returns the vmap pointer
> @@ -1386,7 +1388,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>    *
>    * Returns 0 on success, or a negative errno code otherwise.
>    */
> -int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
>   	struct iosys_map ptr;
>   	int ret = 0;
> @@ -1422,14 +1424,14 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	mutex_unlock(&dmabuf->lock);
>   	return ret;
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, DMA_BUF);
>   
>   /**
> - * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
> + * dma_buf_vunmap_unlocked - Unmap a vmap obtained by dma_buf_vmap.
>    * @dmabuf:	[in]	buffer to vunmap
>    * @map:	[in]	vmap pointer to vunmap
>    */
> -void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
> +void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>   {
>   	if (WARN_ON(!dmabuf))
>   		return;
> @@ -1446,7 +1448,7 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
>   	}
>   	mutex_unlock(&dmabuf->lock);
>   }
> -EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
> +EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
>   
>   #ifdef CONFIG_DEBUG_FS
>   static int dma_buf_debug_show(struct seq_file *s, void *unused)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 782cbca37538..d9ed5a4fbc6f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -449,8 +449,8 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>   	if (IS_ERR(obj))
>   		return obj;
>   
> -	attach = dma_buf_dynamic_attach(dma_buf, dev->dev,
> -					&amdgpu_dma_buf_attach_ops, obj);
> +	attach = dma_buf_dynamic_attach_unlocked(dma_buf, dev->dev,
> +						 &amdgpu_dma_buf_attach_ops, obj);
>   	if (IS_ERR(attach)) {
>   		drm_gem_object_put(obj);
>   		return ERR_CAST(attach);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 170935c294f5..e354ad140a0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -883,7 +883,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   			struct sg_table *sgt;
>   
>   			attach = gtt->gobj->import_attach;
> -			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +			sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
>   			if (IS_ERR(sgt))
>   				return PTR_ERR(sgt);
>   
> @@ -1008,7 +1008,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>   		struct dma_buf_attachment *attach;
>   
>   		attach = gtt->gobj->import_attach;
> -		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment_unlocked(attach, ttm->sg, DMA_BIDIRECTIONAL);
>   		ttm->sg = NULL;
>   	}
>   
> diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
> index 147abf1a3968..f71f3b2d20e3 100644
> --- a/drivers/gpu/drm/armada/armada_gem.c
> +++ b/drivers/gpu/drm/armada/armada_gem.c
> @@ -66,8 +66,8 @@ void armada_gem_free_object(struct drm_gem_object *obj)
>   	if (dobj->obj.import_attach) {
>   		/* We only ever display imported data */
>   		if (dobj->sgt)
> -			dma_buf_unmap_attachment(dobj->obj.import_attach,
> -						 dobj->sgt, DMA_TO_DEVICE);
> +			dma_buf_unmap_attachment_unlocked(dobj->obj.import_attach,
> +							  dobj->sgt, DMA_TO_DEVICE);
>   		drm_prime_gem_destroy(&dobj->obj, NULL);
>   	}
>   
> @@ -364,7 +364,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
>   
>   	if (args->offset > dobj->obj.size ||
>   	    args->size > dobj->obj.size - args->offset) {
> -		DRM_ERROR("invalid size: object size %u\n", dobj->obj.size);
> +		DRM_ERROR("invalid size: object size %zu\n", dobj->obj.size);
>   		ret = -EINVAL;
>   		goto unref;
>   	}
> @@ -514,13 +514,13 @@ armada_gem_prime_import(struct drm_device *dev, struct dma_buf *buf)
>   		}
>   	}
>   
> -	attach = dma_buf_attach(buf, dev->dev);
> +	attach = dma_buf_attach_unlocked(buf, dev->dev);
>   	if (IS_ERR(attach))
>   		return ERR_CAST(attach);
>   
>   	dobj = armada_gem_alloc_private_object(dev, buf->size);
>   	if (!dobj) {
> -		dma_buf_detach(buf, attach);
> +		dma_buf_detach_unlocked(buf, attach);
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
> @@ -539,8 +539,8 @@ int armada_gem_map_import(struct armada_gem_object *dobj)
>   {
>   	int ret;
>   
> -	dobj->sgt = dma_buf_map_attachment(dobj->obj.import_attach,
> -					   DMA_TO_DEVICE);
> +	dobj->sgt = dma_buf_map_attachment_unlocked(dobj->obj.import_attach,
> +						    DMA_TO_DEVICE);
>   	if (IS_ERR(dobj->sgt)) {
>   		ret = PTR_ERR(dobj->sgt);
>   		dobj->sgt = NULL;
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 42abee9a0f4f..ee3333f346b7 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -232,7 +232,7 @@ void drm_gem_cma_free(struct drm_gem_cma_object *cma_obj)
>   
>   	if (gem_obj->import_attach) {
>   		if (cma_obj->vaddr)
> -			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
> +			dma_buf_vunmap_unlocked(gem_obj->import_attach->dmabuf, &map);
>   		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
>   	} else if (cma_obj->vaddr) {
>   		if (cma_obj->map_noncoherent)
> @@ -581,7 +581,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>   	struct iosys_map map;
>   	int ret;
>   
> -	ret = dma_buf_vmap(attach->dmabuf, &map);
> +	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
>   	if (ret) {
>   		DRM_ERROR("Failed to vmap PRIME buffer\n");
>   		return ERR_PTR(ret);
> @@ -589,7 +589,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
>   
>   	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
>   	if (IS_ERR(obj)) {
> -		dma_buf_vunmap(attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(attach->dmabuf, &map);
>   		return obj;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8ad0e02991ca..c5e7a84ead06 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -299,7 +299,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>   	}
>   
>   	if (obj->import_attach) {
> -		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> +		ret = dma_buf_vmap_unlocked(obj->import_attach->dmabuf, map);
>   		if (!ret) {
>   			if (WARN_ON(map->is_iomem)) {
>   				ret = -EIO;
> @@ -382,7 +382,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>   		return;
>   
>   	if (obj->import_attach) {
> -		dma_buf_vunmap(obj->import_attach->dmabuf, map);
> +		dma_buf_vunmap_unlocked(obj->import_attach->dmabuf, map);
>   	} else {
>   		vunmap(shmem->vaddr);
>   		drm_gem_shmem_put_pages(shmem);
> @@ -617,7 +617,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>   		drm_gem_object_put(obj);
>   		vma->vm_private_data = NULL;
>   
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> +		return dma_buf_mmap_unlocked(obj->dma_buf, vma, 0);
>   	}
>   
>   	ret = drm_gem_shmem_get_pages(shmem);
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index a3f180653b8b..b75ef1756873 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -930,13 +930,13 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>   	if (!dev->driver->gem_prime_import_sg_table)
>   		return ERR_PTR(-EINVAL);
>   
> -	attach = dma_buf_attach(dma_buf, attach_dev);
> +	attach = dma_buf_attach_unlocked(dma_buf, attach_dev);
>   	if (IS_ERR(attach))
>   		return ERR_CAST(attach);
>   
>   	get_dma_buf(dma_buf);
>   
> -	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
>   	if (IS_ERR(sgt)) {
>   		ret = PTR_ERR(sgt);
>   		goto fail_detach;
> @@ -954,9 +954,9 @@ struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>   	return obj;
>   
>   fail_unmap:
> -	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
>   fail_detach:
> -	dma_buf_detach(dma_buf, attach);
> +	dma_buf_detach_unlocked(dma_buf, attach);
>   	dma_buf_put(dma_buf);
>   
>   	return ERR_PTR(ret);
> @@ -1052,9 +1052,9 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>   
>   	attach = obj->import_attach;
>   	if (sg)
> -		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment_unlocked(attach, sg, DMA_BIDIRECTIONAL);
>   	dma_buf = attach->dmabuf;
> -	dma_buf_detach(attach->dmabuf, attach);
> +	dma_buf_detach_unlocked(attach->dmabuf, attach);
>   	/* remove the reference */
>   	dma_buf_put(dma_buf);
>   }
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 3fa2da149639..ae6c1eda0a72 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -65,7 +65,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
>   
>   	if (etnaviv_obj->vaddr)
> -		dma_buf_vunmap(etnaviv_obj->base.import_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
>   
>   	/* Don't drop the pages for imported dmabuf, as they are not
>   	 * ours, just free the array we allocated:
> @@ -82,7 +82,7 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
>   
>   	lockdep_assert_held(&etnaviv_obj->lock);
>   
> -	ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
> +	ret = dma_buf_vmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
>   	if (ret)
>   		return NULL;
>   	return map.vaddr;
> @@ -91,7 +91,7 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
>   static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
>   		struct vm_area_struct *vma)
>   {
> -	return dma_buf_mmap(etnaviv_obj->base.dma_buf, vma, 0);
> +	return dma_buf_mmap_unlocked(etnaviv_obj->base.dma_buf, vma, 0);
>   }
>   
>   static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index 3e493f48e0d4..8e95a3c5caf8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -366,7 +366,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
>   	int ret;
>   
>   	if (obj->import_attach)
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> +		return dma_buf_mmap_unlocked(obj->dma_buf, vma, 0);
>   
>   	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index f5062d0c6333..5ecea7df98b1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -241,8 +241,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   
>   	assert_object_held(obj);
>   
> -	pages = dma_buf_map_attachment(obj->base.import_attach,
> -				       DMA_BIDIRECTIONAL);
> +	pages = dma_buf_map_attachment_unlocked(obj->base.import_attach,
> +						DMA_BIDIRECTIONAL);
>   	if (IS_ERR(pages))
>   		return PTR_ERR(pages);
>   
> @@ -270,8 +270,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
>   					     struct sg_table *pages)
>   {
> -	dma_buf_unmap_attachment(obj->base.import_attach, pages,
> -				 DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(obj->base.import_attach, pages,
> +					  DMA_BIDIRECTIONAL);
>   }
>   
>   static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
> @@ -306,7 +306,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
>   		return ERR_PTR(-E2BIG);
>   
>   	/* need to attach */
> -	attach = dma_buf_attach(dma_buf, dev->dev);
> +	attach = dma_buf_attach_unlocked(dma_buf, dev->dev);
>   	if (IS_ERR(attach))
>   		return ERR_CAST(attach);
>   
> @@ -337,7 +337,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
>   	return &obj->base;
>   
>   fail_detach:
> -	dma_buf_detach(dma_buf, attach);
> +	dma_buf_detach_unlocked(dma_buf, attach);
>   	dma_buf_put(dma_buf);
>   
>   	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 62c61af77a42..6053af920a22 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -207,13 +207,13 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
>   	i915_gem_object_unlock(import_obj);
>   
>   	/* Now try a fake an importer */
> -	import_attach = dma_buf_attach(dmabuf, obj->base.dev->dev);
> +	import_attach = dma_buf_attach_unlocked(dmabuf, obj->base.dev->dev);
>   	if (IS_ERR(import_attach)) {
>   		err = PTR_ERR(import_attach);
>   		goto out_import;
>   	}
>   
> -	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> +	st = dma_buf_map_attachment_unlocked(import_attach, DMA_BIDIRECTIONAL);
>   	if (IS_ERR(st)) {
>   		err = PTR_ERR(st);
>   		goto out_detach;
> @@ -226,9 +226,9 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
>   		timeout = -ETIME;
>   	}
>   	err = timeout > 0 ? 0 : timeout;
> -	dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(import_attach, st, DMA_BIDIRECTIONAL);
>   out_detach:
> -	dma_buf_detach(dmabuf, import_attach);
> +	dma_buf_detach_unlocked(dmabuf, import_attach);
>   out_import:
>   	i915_gem_object_put(import_obj);
>   out_dmabuf:
> @@ -296,7 +296,7 @@ static int igt_dmabuf_import(void *arg)
>   		goto out_obj;
>   	}
>   
> -	err = dma_buf_vmap(dmabuf, &map);
> +	err = dma_buf_vmap_unlocked(dmabuf, &map);
>   	dma_map = err ? NULL : map.vaddr;
>   	if (!dma_map) {
>   		pr_err("dma_buf_vmap failed\n");
> @@ -337,7 +337,7 @@ static int igt_dmabuf_import(void *arg)
>   
>   	err = 0;
>   out_dma_map:
> -	dma_buf_vunmap(dmabuf, &map);
> +	dma_buf_vunmap_unlocked(dmabuf, &map);
>   out_obj:
>   	i915_gem_object_put(obj);
>   out_dmabuf:
> @@ -358,7 +358,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>   	if (IS_ERR(dmabuf))
>   		return PTR_ERR(dmabuf);
>   
> -	err = dma_buf_vmap(dmabuf, &map);
> +	err = dma_buf_vmap_unlocked(dmabuf, &map);
>   	ptr = err ? NULL : map.vaddr;
>   	if (!ptr) {
>   		pr_err("dma_buf_vmap failed\n");
> @@ -367,7 +367,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>   	}
>   
>   	memset(ptr, 0xc5, PAGE_SIZE);
> -	dma_buf_vunmap(dmabuf, &map);
> +	dma_buf_vunmap_unlocked(dmabuf, &map);
>   
>   	obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
>   	if (IS_ERR(obj)) {
> @@ -418,7 +418,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>   	}
>   	i915_gem_object_put(obj);
>   
> -	err = dma_buf_vmap(dmabuf, &map);
> +	err = dma_buf_vmap_unlocked(dmabuf, &map);
>   	ptr = err ? NULL : map.vaddr;
>   	if (!ptr) {
>   		pr_err("dma_buf_vmap failed\n");
> @@ -435,7 +435,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>   	memset(ptr, 0xc5, dmabuf->size);
>   
>   	err = 0;
> -	dma_buf_vunmap(dmabuf, &map);
> +	dma_buf_vunmap_unlocked(dmabuf, &map);
>   out:
>   	dma_buf_put(dmabuf);
>   	return err;
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index 393f82e26927..a725a91c2ff9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -119,13 +119,13 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>   		}
>   	}
>   
> -	attach = dma_buf_attach(dma_buf, dev->dev);
> +	attach = dma_buf_attach_unlocked(dma_buf, dev->dev);
>   	if (IS_ERR(attach))
>   		return ERR_CAST(attach);
>   
>   	get_dma_buf(dma_buf);
>   
> -	sgt = dma_buf_map_attachment(attach, DMA_TO_DEVICE);
> +	sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
>   	if (IS_ERR(sgt)) {
>   		ret = PTR_ERR(sgt);
>   		goto fail_detach;
> @@ -142,9 +142,9 @@ struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>   	return obj;
>   
>   fail_unmap:
> -	dma_buf_unmap_attachment(attach, sgt, DMA_TO_DEVICE);
> +	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_TO_DEVICE);
>   fail_detach:
> -	dma_buf_detach(dma_buf, attach);
> +	dma_buf_detach_unlocked(dma_buf, attach);
>   	dma_buf_put(dma_buf);
>   
>   	return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 81991090adcc..bbfe196ff6f6 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -78,15 +78,15 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
>   	if (gem->import_attach) {
>   		struct dma_buf *buf = gem->import_attach->dmabuf;
>   
> -		map->attach = dma_buf_attach(buf, dev);
> +		map->attach = dma_buf_attach_unlocked(buf, dev);
>   		if (IS_ERR(map->attach)) {
>   			err = PTR_ERR(map->attach);
>   			goto free;
>   		}
>   
> -		map->sgt = dma_buf_map_attachment(map->attach, direction);
> +		map->sgt = dma_buf_map_attachment_unlocked(map->attach, direction);
>   		if (IS_ERR(map->sgt)) {
> -			dma_buf_detach(buf, map->attach);
> +			dma_buf_detach_unlocked(buf, map->attach);
>   			err = PTR_ERR(map->sgt);
>   			map->sgt = NULL;
>   			goto free;
> @@ -160,8 +160,9 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
>   static void tegra_bo_unpin(struct host1x_bo_mapping *map)
>   {
>   	if (map->attach) {
> -		dma_buf_unmap_attachment(map->attach, map->sgt, map->direction);
> -		dma_buf_detach(map->attach->dmabuf, map->attach);
> +		dma_buf_unmap_attachment_unlocked(map->attach, map->sgt,
> +						  map->direction);
> +		dma_buf_detach_unlocked(map->attach->dmabuf, map->attach);
>   	} else {
>   		dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
>   		sg_free_table(map->sgt);
> @@ -181,7 +182,7 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
>   	if (obj->vaddr) {
>   		return obj->vaddr;
>   	} else if (obj->gem.import_attach) {
> -		ret = dma_buf_vmap(obj->gem.import_attach->dmabuf, &map);
> +		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
>   		return ret ? NULL : map.vaddr;
>   	} else {
>   		return vmap(obj->pages, obj->num_pages, VM_MAP,
> @@ -197,7 +198,7 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
>   	if (obj->vaddr)
>   		return;
>   	else if (obj->gem.import_attach)
> -		dma_buf_vunmap(obj->gem.import_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
>   	else
>   		vunmap(addr);
>   }
> @@ -453,7 +454,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>   	if (IS_ERR(bo))
>   		return bo;
>   
> -	attach = dma_buf_attach(buf, drm->dev);
> +	attach = dma_buf_attach_unlocked(buf, drm->dev);
>   	if (IS_ERR(attach)) {
>   		err = PTR_ERR(attach);
>   		goto free;
> @@ -461,7 +462,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>   
>   	get_dma_buf(buf);
>   
> -	bo->sgt = dma_buf_map_attachment(attach, DMA_TO_DEVICE);
> +	bo->sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
>   	if (IS_ERR(bo->sgt)) {
>   		err = PTR_ERR(bo->sgt);
>   		goto detach;
> @@ -479,9 +480,9 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>   
>   detach:
>   	if (!IS_ERR_OR_NULL(bo->sgt))
> -		dma_buf_unmap_attachment(attach, bo->sgt, DMA_TO_DEVICE);
> +		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
>   
> -	dma_buf_detach(buf, attach);
> +	dma_buf_detach_unlocked(buf, attach);
>   	dma_buf_put(buf);
>   free:
>   	drm_gem_object_release(&bo->gem);
> @@ -508,8 +509,8 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
>   		tegra_bo_iommu_unmap(tegra, bo);
>   
>   	if (gem->import_attach) {
> -		dma_buf_unmap_attachment(gem->import_attach, bo->sgt,
> -					 DMA_TO_DEVICE);
> +		dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
> +						  DMA_TO_DEVICE);
>   		drm_prime_gem_destroy(gem, NULL);
>   	} else {
>   		tegra_bo_free(gem->dev, bo);
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index fce80a4a5147..12b73e6ad054 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -25,7 +25,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>   	if (umem_dmabuf->sgt)
>   		goto wait_fence;
>   
> -	sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
> +	sgt = dma_buf_map_attachment_unlocked(umem_dmabuf->attach,
> +					      DMA_BIDIRECTIONAL);
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
>   
> @@ -96,8 +97,8 @@ void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
>   		umem_dmabuf->last_sg_trim = 0;
>   	}
>   
> -	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> -				 DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(umem_dmabuf->attach, umem_dmabuf->sgt,
> +					  DMA_BIDIRECTIONAL);
>   
>   	umem_dmabuf->sgt = NULL;
>   }
> @@ -143,7 +144,7 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
>   	if (!ib_umem_num_pages(umem))
>   		goto out_free_umem;
>   
> -	umem_dmabuf->attach = dma_buf_dynamic_attach(
> +	umem_dmabuf->attach = dma_buf_dynamic_attach_unlocked(
>   					dmabuf,
>   					device->dma_device,
>   					ops,
> @@ -222,7 +223,7 @@ void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
>   		dma_buf_unpin(umem_dmabuf->attach);
>   	dma_resv_unlock(dmabuf->resv);
>   
> -	dma_buf_detach(dmabuf, umem_dmabuf->attach);
> +	dma_buf_detach_unlocked(dmabuf, umem_dmabuf->attach);
>   	dma_buf_put(dmabuf);
>   	kfree(umem_dmabuf);
>   }
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 678b359717c4..de762dbdaf78 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -101,7 +101,7 @@ static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
>   	if (buf->db_attach) {
>   		struct iosys_map map;
>   
> -		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> +		if (!dma_buf_vmap_unlocked(buf->db_attach->dmabuf, &map))
>   			buf->vaddr = map.vaddr;
>   
>   		return buf->vaddr;
> @@ -711,7 +711,7 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>   	}
>   
>   	/* get the associated scatterlist for this buffer */
> -	sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
> +	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
>   	if (IS_ERR(sgt)) {
>   		pr_err("Error getting dmabuf scatterlist\n");
>   		return -EINVAL;
> @@ -722,7 +722,8 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>   	if (contig_size < buf->size) {
>   		pr_err("contiguous chunk is too small %lu/%lu\n",
>   		       contig_size, buf->size);
> -		dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> +		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
> +						  buf->dma_dir);
>   		return -EFAULT;
>   	}
>   
> @@ -750,10 +751,10 @@ static void vb2_dc_unmap_dmabuf(void *mem_priv)
>   	}
>   
>   	if (buf->vaddr) {
> -		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
>   		buf->vaddr = NULL;
>   	}
> -	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> +	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
>   
>   	buf->dma_addr = 0;
>   	buf->dma_sgt = NULL;
> @@ -768,7 +769,7 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
>   		vb2_dc_unmap_dmabuf(buf);
>   
>   	/* detach this attachment */
> -	dma_buf_detach(buf->db_attach->dmabuf, buf->db_attach);
> +	dma_buf_detach_unlocked(buf->db_attach->dmabuf, buf->db_attach);
>   	kfree(buf);
>   }
>   
> @@ -792,7 +793,7 @@ static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>   	buf->vb = vb;
>   
>   	/* create attachment for the dmabuf with the user device */
> -	dba = dma_buf_attach(dbuf, buf->dev);
> +	dba = dma_buf_attach_unlocked(dbuf, buf->dev);
>   	if (IS_ERR(dba)) {
>   		pr_err("failed to attach dmabuf\n");
>   		kfree(buf);
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index fa69158a65b1..39e11600304a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -309,7 +309,7 @@ static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
>   
>   	if (!buf->vaddr) {
>   		if (buf->db_attach) {
> -			ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> +			ret = dma_buf_vmap_unlocked(buf->db_attach->dmabuf, &map);
>   			buf->vaddr = ret ? NULL : map.vaddr;
>   		} else {
>   			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
> @@ -565,7 +565,7 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>   	}
>   
>   	/* get the associated scatterlist for this buffer */
> -	sgt = dma_buf_map_attachment(buf->db_attach, buf->dma_dir);
> +	sgt = dma_buf_map_attachment_unlocked(buf->db_attach, buf->dma_dir);
>   	if (IS_ERR(sgt)) {
>   		pr_err("Error getting dmabuf scatterlist\n");
>   		return -EINVAL;
> @@ -594,10 +594,10 @@ static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
>   	}
>   
>   	if (buf->vaddr) {
> -		dma_buf_vunmap(buf->db_attach->dmabuf, &map);
> +		dma_buf_vunmap_unlocked(buf->db_attach->dmabuf, &map);
>   		buf->vaddr = NULL;
>   	}
> -	dma_buf_unmap_attachment(buf->db_attach, sgt, buf->dma_dir);
> +	dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt, buf->dma_dir);
>   
>   	buf->dma_sgt = NULL;
>   }
> @@ -611,7 +611,7 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
>   		vb2_dma_sg_unmap_dmabuf(buf);
>   
>   	/* detach this attachment */
> -	dma_buf_detach(buf->db_attach->dmabuf, buf->db_attach);
> +	dma_buf_detach_unlocked(buf->db_attach->dmabuf, buf->db_attach);
>   	kfree(buf);
>   }
>   
> @@ -633,7 +633,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>   
>   	buf->dev = dev;
>   	/* create attachment for the dmabuf with the user device */
> -	dba = dma_buf_attach(dbuf, buf->dev);
> +	dba = dma_buf_attach_unlocked(dbuf, buf->dev);
>   	if (IS_ERR(dba)) {
>   		pr_err("failed to attach dmabuf\n");
>   		kfree(buf);
> diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> index 948152f1596b..7831bf545874 100644
> --- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> +++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
> @@ -376,7 +376,7 @@ static int vb2_vmalloc_map_dmabuf(void *mem_priv)
>   	struct iosys_map map;
>   	int ret;
>   
> -	ret = dma_buf_vmap(buf->dbuf, &map);
> +	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
>   	if (ret)
>   		return -EFAULT;
>   	buf->vaddr = map.vaddr;
> @@ -389,7 +389,7 @@ static void vb2_vmalloc_unmap_dmabuf(void *mem_priv)
>   	struct vb2_vmalloc_buf *buf = mem_priv;
>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>   
> -	dma_buf_vunmap(buf->dbuf, &map);
> +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
>   	buf->vaddr = NULL;
>   }
>   
> @@ -399,7 +399,7 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>   
>   	if (buf->vaddr)
> -		dma_buf_vunmap(buf->dbuf, &map);
> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
>   
>   	kfree(buf);
>   }
> diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> index 69c346148070..58e4595f3a10 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
> @@ -38,8 +38,8 @@ static void tegra_vde_release_entry(struct tegra_vde_cache_entry *entry)
>   	if (entry->vde->domain)
>   		tegra_vde_iommu_unmap(entry->vde, entry->iova);
>   
> -	dma_buf_unmap_attachment(entry->a, entry->sgt, entry->dma_dir);
> -	dma_buf_detach(dmabuf, entry->a);
> +	dma_buf_unmap_attachment_unlocked(entry->a, entry->sgt, entry->dma_dir);
> +	dma_buf_detach_unlocked(dmabuf, entry->a);
>   	dma_buf_put(dmabuf);
>   
>   	list_del(&entry->list);
> @@ -95,14 +95,14 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
>   		goto ref;
>   	}
>   
> -	attachment = dma_buf_attach(dmabuf, dev);
> +	attachment = dma_buf_attach_unlocked(dmabuf, dev);
>   	if (IS_ERR(attachment)) {
>   		dev_err(dev, "Failed to attach dmabuf\n");
>   		err = PTR_ERR(attachment);
>   		goto err_unlock;
>   	}
>   
> -	sgt = dma_buf_map_attachment(attachment, dma_dir);
> +	sgt = dma_buf_map_attachment_unlocked(attachment, dma_dir);
>   	if (IS_ERR(sgt)) {
>   		dev_err(dev, "Failed to get dmabufs sg_table\n");
>   		err = PTR_ERR(sgt);
> @@ -152,9 +152,9 @@ int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
>   err_free:
>   	kfree(entry);
>   err_unmap:
> -	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
> +	dma_buf_unmap_attachment_unlocked(attachment, sgt, dma_dir);
>   err_detach:
> -	dma_buf_detach(dmabuf, attachment);
> +	dma_buf_detach_unlocked(dmabuf, attachment);
>   err_unlock:
>   	mutex_unlock(&vde->map_lock);
>   
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 93ebd174d848..558e8056eb80 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -310,9 +310,9 @@ static void fastrpc_free_map(struct kref *ref)
>   				return;
>   			}
>   		}
> -		dma_buf_unmap_attachment(map->attach, map->table,
> -					 DMA_BIDIRECTIONAL);
> -		dma_buf_detach(map->buf, map->attach);
> +		dma_buf_unmap_attachment_unlocked(map->attach, map->table,
> +						  DMA_BIDIRECTIONAL);
> +		dma_buf_detach_unlocked(map->buf, map->attach);
>   		dma_buf_put(map->buf);
>   	}
>   
> @@ -719,14 +719,14 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>   		goto get_err;
>   	}
>   
> -	map->attach = dma_buf_attach(map->buf, sess->dev);
> +	map->attach = dma_buf_attach_unlocked(map->buf, sess->dev);
>   	if (IS_ERR(map->attach)) {
>   		dev_err(sess->dev, "Failed to attach dmabuf\n");
>   		err = PTR_ERR(map->attach);
>   		goto attach_err;
>   	}
>   
> -	map->table = dma_buf_map_attachment(map->attach, DMA_BIDIRECTIONAL);
> +	map->table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
>   	if (IS_ERR(map->table)) {
>   		err = PTR_ERR(map->table);
>   		goto map_err;
> @@ -763,7 +763,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>   	return 0;
>   
>   map_err:
> -	dma_buf_detach(map->buf, map->attach);
> +	dma_buf_detach_unlocked(map->buf, map->attach);
>   attach_err:
>   	dma_buf_put(map->buf);
>   get_err:
> diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
> index 940e5e9e8a54..5a50e2697e95 100644
> --- a/drivers/xen/gntdev-dmabuf.c
> +++ b/drivers/xen/gntdev-dmabuf.c
> @@ -592,7 +592,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
>   	gntdev_dmabuf->priv = priv;
>   	gntdev_dmabuf->fd = fd;
>   
> -	attach = dma_buf_attach(dma_buf, dev);
> +	attach = dma_buf_attach_unlocked(dma_buf, dev);
>   	if (IS_ERR(attach)) {
>   		ret = ERR_CAST(attach);
>   		goto fail_free_obj;
> @@ -600,7 +600,7 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
>   
>   	gntdev_dmabuf->u.imp.attach = attach;
>   
> -	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
> +	sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
>   	if (IS_ERR(sgt)) {
>   		ret = ERR_CAST(sgt);
>   		goto fail_detach;
> @@ -658,9 +658,9 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
>   fail_end_access:
>   	dmabuf_imp_end_foreign_access(gntdev_dmabuf->u.imp.refs, count);
>   fail_unmap:
> -	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
>   fail_detach:
> -	dma_buf_detach(dma_buf, attach);
> +	dma_buf_detach_unlocked(dma_buf, attach);
>   fail_free_obj:
>   	dmabuf_imp_free_storage(gntdev_dmabuf);
>   fail_put:
> @@ -708,10 +708,10 @@ static int dmabuf_imp_release(struct gntdev_dmabuf_priv *priv, u32 fd)
>   	attach = gntdev_dmabuf->u.imp.attach;
>   
>   	if (gntdev_dmabuf->u.imp.sgt)
> -		dma_buf_unmap_attachment(attach, gntdev_dmabuf->u.imp.sgt,
> -					 DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment_unlocked(attach, gntdev_dmabuf->u.imp.sgt,
> +						  DMA_BIDIRECTIONAL);
>   	dma_buf = attach->dmabuf;
> -	dma_buf_detach(attach->dmabuf, attach);
> +	dma_buf_detach_unlocked(attach->dmabuf, attach);
>   	dma_buf_put(dma_buf);
>   
>   	dmabuf_imp_free_storage(gntdev_dmabuf);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 71731796c8c3..9ab09569dec1 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -601,14 +601,16 @@ dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>   	return !!attach->importer_ops;
>   }
>   
> -struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
> -					  struct device *dev);
> +struct dma_buf_attachment *dma_buf_attach_unlocked(struct dma_buf *dmabuf,
> +						   struct device *dev);
>   struct dma_buf_attachment *
> -dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
> -		       const struct dma_buf_attach_ops *importer_ops,
> -		       void *importer_priv);
> -void dma_buf_detach(struct dma_buf *dmabuf,
> -		    struct dma_buf_attachment *attach);
> +dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
> +				const struct dma_buf_attach_ops *importer_ops,
> +				void *importer_priv);
> +
> +void dma_buf_detach_unlocked(struct dma_buf *dmabuf,
> +			     struct dma_buf_attachment *attach);
> +
>   int dma_buf_pin(struct dma_buf_attachment *attach);
>   void dma_buf_unpin(struct dma_buf_attachment *attach);
>   
> @@ -618,18 +620,20 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags);
>   struct dma_buf *dma_buf_get(int fd);
>   void dma_buf_put(struct dma_buf *dmabuf);
>   
> -struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
> -					enum dma_data_direction);
> -void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
> -				enum dma_data_direction);
> +struct sg_table *dma_buf_map_attachment_unlocked(struct dma_buf_attachment *,
> +						 enum dma_data_direction);
> +void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *,
> +				       struct sg_table *,
> +				       enum dma_data_direction);
> +
>   void dma_buf_move_notify(struct dma_buf *dma_buf);
>   int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>   			     enum dma_data_direction dir);
>   int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
>   			   enum dma_data_direction dir);
>   
> -int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
> -		 unsigned long);
> -int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
> -void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
> +int dma_buf_mmap_unlocked(struct dma_buf *, struct vm_area_struct *,
> +			  unsigned long);
> +int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
> +void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
>   #endif /* __DMA_BUF_H__ */

