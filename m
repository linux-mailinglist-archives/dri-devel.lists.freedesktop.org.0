Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B827120E8
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BF110E7AE;
	Fri, 26 May 2023 07:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B12810E7AD;
 Fri, 26 May 2023 07:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYv+db9IVNJduRE6Y0eJbLOqOtpmESvj9wCvCONA0Er9rh1DpgEolEGpEdnwVHL+oWkrdULh1VnMWeNN3FnB0UhF1HO5qfMwQXNwwI+wcryJtc/kg+6tpvPHdcWAPPMDZINtcQXuBeblx7HkgaevXI5rTsu44iAl/GSVFaBS/90wzV3V6dxLR7YQ6sjWOPkeifoVxOzfbaPZsUstD1APySYxel9/zssyT7YrPZ8RWxIfyY0ZaDciy1ykYIXpSpwF9zVm1wLH9wFx/uUIAr9LYOcHB1T4SWhJDh3eg36if1hXJTRLExpCE3tSg6o/sMsbAnD/x7bTfOMprIJg6a07Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlqCrwIS9z+twgOjkjcWlXPoO26XC6+w2JI/l8UDRRY=;
 b=HNj9zQshwu8y//0KPQhruMarHdxawPDtHaWm5al+t873fOYNuc3qy7om0qysu0Xe2DvgLttf2Y9cBg4kZZjsBspjE504Do5cpD30BqmH6pACdt0L0I4phvyMFuyMQnZBdmkw8okmQxSnv3J4q+QDClakb7PTG4HCp3lZiftkqgeOzr8xsULfomno/7rUe4FT9xDwAerB6DKIPsqswTx9Ra8Myf8tZultyNOYYFECuS6W4MazjumhENvtaqnBYHJ3e484y1okfYFuZg7u6YRjbEZ4G6Ex5gkOdKYga/BMqFimXDomx+mU3BToJ1P/A+Lb5aygIdkzttGz2YuMDTwpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlqCrwIS9z+twgOjkjcWlXPoO26XC6+w2JI/l8UDRRY=;
 b=e1xK9Uqh+k1tAfdq0964bwPLsuedDJLeQiCkbsZUxBSYGRBNMoNx0PrsQfNb77zZDsPx1svnHEa/J1o6o1eMyjqWkA1K4AVYBNt3Hc+Trc+O29G2oSPLtA0mFagkl2MpBaX+oIQU0VaFYvTdzNkUpSkFCH1pZ4E2gPqe34LMqXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15; Fri, 26 May 2023 07:27:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b%4]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 07:27:32 +0000
Message-ID: <5b5c7b06-ef99-d275-3693-b2e3d114cac9@amd.com>
Date: Fri, 26 May 2023 09:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: Remove unnecessary (void*) conversions
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, evan.quan@amd.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, tomba@kernel.org, emma@anholt.net, airlied@redhat.com,
 kraxel@redhat.com, abrodkin@synopsys.com, ray.huang@amd.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, sumit.semwal@linaro.org
References: <20230526033225.1310824-1-suhui@nfschina.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230526033225.1310824-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c78d7a-0db9-491f-92b8-08db5dbaab28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cntyKeaf0LUylv9dUiN4pVghtl3sjFllDigJFxLpMJdopBTXH/yxZFBfyo3Gub47ZeIplFgjeYbj3mMTZcMzoTw98+qjC0g+fTl54Q2pGLdUOUnSS/ss05Rtt2vP44V5F2x0KaPgQarZN3FK4Tn53TDzNS0iUE/Tls3AlCJ9E3w/wwbu+PQh9N02IF/Ja234FLJxUOL7fnNKeiQwB8rbaU7Cs0qxbEq7Xl9nwskA9f5YaDLG4gfAcKgB83+wxN19v7al60FZBkXslno/2OvUQgWW7z9r9dxEK64omcD7pwB+0N62StpVyOE22xE8LfzsLNzE+Q+UdHNbBsMXildt99COaalliRNhUSHryd8rci509LEqtkxGCazCeQ2nR4nXyZceg66pLW+Sv6keVrCT0yATtP8ADFodc7eadpGx2LCOardnTsIRFXvLZ1cj/lI8jV9yy7h1CS84aN1hX9kHCOw+/VoVsFzBltnSJt4+f4Zzhkzmun9S6tb4SedPy20EUPPfNyWrDMzHJGKxClPjBwJNnawBQ6OGji0zHLKppowlR/LPZqDs6NiXwhYmLQiU2eb9rfw4dAerqwGaxX9hM0iXqHvgSW1nqQGQwubNfqpH3jK7bltKRb541vlaaNj+oORkkDbWk1z0obU5p3Zu+yetaTiHkBSjlWLOw0WzjqY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199021)(4326008)(7416002)(36756003)(8676002)(5660300002)(8936002)(66556008)(66946007)(66476007)(316002)(478600001)(31686004)(110136005)(6486002)(41300700001)(6666004)(38100700002)(921005)(2906002)(6512007)(186003)(30864003)(83380400001)(6506007)(2616005)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9tMzNpbyt2Q2ZOR094UTQ5bThzdmhXaVVrOW51c2UrSFRHQ0pOYm1DM3h5?=
 =?utf-8?B?MU5QUjJYcHNJZkRLcm56bERRNC9td3JiMlRjbG9ETGFZYjZLemFJanEwUG9U?=
 =?utf-8?B?cktWOXA4a1J5RVNSQmNkZ0t0eHZqM0QwZ29ENWwrbmVYMzh0VGxhSVYyOFBW?=
 =?utf-8?B?U2FqVEpna1RoNDhnUGdOcUdreHZaRlpBdEJrK2hQc1JpMTNQMFVXWlBoSmdV?=
 =?utf-8?B?VkNPVHY0QmE5WlFKQUxtODdnVWNQMmdEZGNKTUFSb0pqUVFUcEwrN2Z6WEZj?=
 =?utf-8?B?bmd5L1FvbHBlajREaWhlL0krSVNtSXdnSEpYeWxkeXBINXIvREQxMGlITHEz?=
 =?utf-8?B?Qzh0NTg4VHNuZU1RY01BNDBFTlFxOVJLeDFDdjZWWHJ0b25CSFArUkdUeU9h?=
 =?utf-8?B?M01hUnZnVkQwTkhKeSs4L1gyZ2NIVUZlbTBZYUg5WG9TdnJ3MFZxNlVFTHhv?=
 =?utf-8?B?czVEdlJBT0dFNU5SaHFqV1V2MGh2Vnd5QmJKclVoRXdtRVM1R1cremY0RXdF?=
 =?utf-8?B?ZDhRek5IUzQ0ak5md1lqY3JjMzVlbmtwWlFmczRuZENlUXRJRE1SQlk0VUZI?=
 =?utf-8?B?K2IzRldEWmRONTdTQjE0VXFjVUQxa1kyckExVFAydnhiWjQrUTBRTGZNdlpW?=
 =?utf-8?B?Nkt6UlUrd2sybDRjanU1NmtwQlBHSW10UEZma21OYnhmV2w4dDhqMmF1M04r?=
 =?utf-8?B?TTg5cVYzUzNMODM0cytGakhoY1ZDc3FQbFRiOVN5NjRkOXl1ZURhdGV2ZlhC?=
 =?utf-8?B?d21pWjI4Z1o3NzZTOWVSMGtHZDlXVDNoMXdtNzQyZldjR0pOTVV1YTFZN3E5?=
 =?utf-8?B?ajRJV1NndEd5N3psNk9rUFgrRHBtZ2JoUmJkOSt1bVVJSU5qUmVYaGhlVGY4?=
 =?utf-8?B?ZEhTRC9GM1NOSjNncG15UzN1Qi9GRjM0L1RubGRvdXE1M2hrTndEdVFDK2w0?=
 =?utf-8?B?TzhBYXJWWHBjRFRXaDNhcXN0OC9OMnFjLzY1K0crOEpkNTRWQTNhUTVxaFYz?=
 =?utf-8?B?elF0WFU3REEvZlhlQ0dJdzg5RWlpT3Y0bnpCSVVvWnR1S0xzcUNWRFZCRklH?=
 =?utf-8?B?Ni9mTjdOQ1hISzh2MnI4cFMvOHdWanNCd1R1VnhDS0JHM0JKeHI0djVyeVhh?=
 =?utf-8?B?cHR5ajFjMXkzd04rV1MzVGNCQnhhQ0h2WlVKK2d6ZldpQTNMT1k5RVN5VDR3?=
 =?utf-8?B?SGsyV1BHV3JPVVk4RmtMNU55cUZYRVVGMktYVUY4eDd1Z2RDMHlUT3k5MDlm?=
 =?utf-8?B?SW4vTmh5cTVaMnppbGdPWXEzYzVxdUxhb1NOdHdFQSttNUY3Vi83amR1bGFr?=
 =?utf-8?B?Z3R6UTlwSWxVZGRLZWpWM1B1UWovK2t3VFVEdng4ai9vbmhUR0Y4bG9Qc25v?=
 =?utf-8?B?QWdjQUdNSE11dXZrNXFlRUk0Sk1tbFc4NU9maFZ5V3ZON2xYT3BDSGJhcjhT?=
 =?utf-8?B?bFpyMHUzSDh0ajRxVXJudlR6eUFnczNSOEVSRGpzMkpDTmRsL2dienF3OVFQ?=
 =?utf-8?B?T1poenN1K1JCRWs2Nmd3ZDhXa3QwUDhIV0doMUhKSU8reDhvMDNBeVdiZGdz?=
 =?utf-8?B?T2lFRHhqSmxSbHRZWThpc2xjOXpwcWlNTWttcm5yVmlVVU9Vb3NJTkRRaVNJ?=
 =?utf-8?B?S2oyRGNtcis4T1lBTUFxT0ttUStRN2Z5VkN4ZktsdzhOaXBDNEsrb08rWkJE?=
 =?utf-8?B?SmJZQlIxWXNGbHFpdWZpUFF4ZmNXWmM5TzdQZWg4b1UxbWM5NTg3Q0NMek9n?=
 =?utf-8?B?QXhTTktHR3RhdklpazdrUm5aTGFrZmRKbEZOeE1wVjg1N0JYNVZ6eDNVRkp0?=
 =?utf-8?B?SGh6N3RkeWJaYXREbWFzTFRUNHFkZk9ROXdkL3F2M1dHY3gzZUIvQ1BDak9B?=
 =?utf-8?B?UXppSCtONmtUeDNSYzA3MUFOZENlb3RLeU1qekRXdndCdXdKOXRzVXNnZ2JW?=
 =?utf-8?B?TnN0R1VwWjZiNmZXYXZFdHdzNlhUdlFDREZ4bHM0WTlseEhBUFpteTNlS0Q2?=
 =?utf-8?B?NlQ4T1EzaWtmSmNWZVBjTFZCc1kwV0lxOEZneXVvcklIVUlKSjd6RHRNamVO?=
 =?utf-8?B?TnBmYzRSeHIyR3JBd3pjY2hQNDAwTVhuM0xXNEJwTlk3cjZ0dW95QmpIUXlS?=
 =?utf-8?B?bHhtRFVXVUQ3RE5lbE9YZVBNM1R5TlpPL2tJRU5qK2FPUzFWTzlvZ0ZVenZT?=
 =?utf-8?Q?Tns36qVVX5qwUwl5/eDi2zujO/UfuihOvOrh+Kbo16ls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c78d7a-0db9-491f-92b8-08db5dbaab28
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 07:27:32.2476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8jyQr1zHk7Y5ehS67v5Ju8wlz/8amvecN3eo4KVd1O85TLDdXh8nvkG+VVjyWcD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.05.23 um 05:32 schrieb Su Hui:
> Pointer variables of (void*) type do not require type cast.

Please split that up by subsystem/driver. Taking it through the misc 
tree might just cause merge conflicts.

Christian.

>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c                        | 2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c                     | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_debugfs.c                 | 2 +-
>   drivers/gpu/drm/omapdrm/omap_debugfs.c                    | 6 +++---
>   drivers/gpu/drm/pl111/pl111_debugfs.c                     | 2 +-
>   drivers/gpu/drm/qxl/qxl_debugfs.c                         | 4 ++--
>   drivers/gpu/drm/tiny/arcpgu.c                             | 2 +-
>   drivers/gpu/drm/ttm/ttm_resource.c                        | 3 +--
>   drivers/gpu/drm/virtio/virtgpu_debugfs.c                  | 6 +++---
>   drivers/gpu/drm/vmwgfx/ttm_object.c                       | 5 ++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                       | 2 +-
>   12 files changed, 19 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 827fcb4fb3b3..8a2c39927167 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -3312,7 +3312,7 @@ static ssize_t dtn_log_write(
>   
>   static int mst_topo_show(struct seq_file *m, void *unused)
>   {
> -	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
> +	struct amdgpu_device *adev = m->private;
>   	struct drm_device *dev = adev_to_drm(adev);
>   	struct drm_connector *connector;
>   	struct drm_connector_list_iter conn_iter;
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 58c2246918fd..e6c870bd307b 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -3671,7 +3671,7 @@ static void amdgpu_parse_cg_state(struct seq_file *m, u64 flags)
>   
>   static int amdgpu_debugfs_pm_info_show(struct seq_file *m, void *unused)
>   {
> -	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
> +	struct amdgpu_device *adev = m->private;
>   	struct drm_device *dev = adev_to_drm(adev);
>   	u64 flags = 0;
>   	int r;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 31a7f59ccb49..dd57f7164e9a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -198,7 +198,7 @@ static int etnaviv_ring_show(struct etnaviv_gpu *gpu, struct seq_file *m)
>   
>   static int show_unlocked(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *dev = node->minor->dev;
>   	int (*show)(struct drm_device *dev, struct seq_file *m) =
>   			node->info_ent->data;
> @@ -208,7 +208,7 @@ static int show_unlocked(struct seq_file *m, void *arg)
>   
>   static int show_each_gpu(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *dev = node->minor->dev;
>   	struct etnaviv_drm_private *priv = dev->dev_private;
>   	struct etnaviv_gpu *gpu;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 2a36d1ca8fda..96b59d5d68ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -37,7 +37,7 @@
>   static int
>   nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
>   	int i;
>   
> diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
> index a3d470468e5b..a94ce502e152 100644
> --- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
> +++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
> @@ -19,7 +19,7 @@
>   
>   static int gem_show(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *dev = node->minor->dev;
>   	struct omap_drm_private *priv = dev->dev_private;
>   
> @@ -33,7 +33,7 @@ static int gem_show(struct seq_file *m, void *arg)
>   
>   static int mm_show(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *dev = node->minor->dev;
>   	struct drm_printer p = drm_seq_file_printer(m);
>   
> @@ -45,7 +45,7 @@ static int mm_show(struct seq_file *m, void *arg)
>   #ifdef CONFIG_DRM_FBDEV_EMULATION
>   static int fb_show(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *dev = node->minor->dev;
>   	struct drm_fb_helper *helper = dev->fb_helper;
>   	struct drm_framebuffer *fb;
> diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
> index 6744fa16f464..4df03ec5d368 100644
> --- a/drivers/gpu/drm/pl111/pl111_debugfs.c
> +++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
> @@ -32,7 +32,7 @@ static const struct {
>   
>   static int pl111_debugfs_regs(struct seq_file *m, void *unused)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *dev = node->minor->dev;
>   	struct pl111_drm_dev_private *priv = dev->dev_private;
>   	int i;
> diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
> index 2d9ed3b94574..5b4fe3049529 100644
> --- a/drivers/gpu/drm/qxl/qxl_debugfs.c
> +++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
> @@ -38,7 +38,7 @@
>   static int
>   qxl_debugfs_irq_received(struct seq_file *m, void *data)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct qxl_device *qdev = to_qxl(node->minor->dev);
>   
>   	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received));
> @@ -52,7 +52,7 @@ qxl_debugfs_irq_received(struct seq_file *m, void *data)
>   static int
>   qxl_debugfs_buffers_info(struct seq_file *m, void *data)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct qxl_device *qdev = to_qxl(node->minor->dev);
>   	struct qxl_bo *bo;
>   
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index e5b10e41554a..09f728355aba 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -338,7 +338,7 @@ static int arcpgu_unload(struct drm_device *drm)
>   #ifdef CONFIG_DEBUG_FS
>   static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_info_node *node = m->private;
>   	struct drm_device *drm = node->minor->dev;
>   	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>   	unsigned long clkrate = clk_get_rate(arcpgu->clk);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7333f7a87a2f..540faabcf8a4 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -727,9 +727,8 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
>   
>   static int ttm_resource_manager_show(struct seq_file *m, void *unused)
>   {
> -	struct ttm_resource_manager *man =
> -		(struct ttm_resource_manager *)m->private;
>   	struct drm_printer p = drm_seq_file_printer(m);
> +	struct ttm_resource_manager *man = m->private;
>   	ttm_resource_manager_debug(man, &p);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> index 853dd9aa397e..577691af9707 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> @@ -43,7 +43,7 @@ static void virtio_gpu_add_int(struct seq_file *m, const char *name, int value)
>   
>   static int virtio_gpu_features(struct seq_file *m, void *data)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_info_node *node = m->private;
>   	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
>   
>   	virtio_gpu_add_bool(m, "virgl", vgdev->has_virgl_3d);
> @@ -68,7 +68,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
>   static int
>   virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *) m->private;
> +	struct drm_info_node *node = m->private;
>   	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
>   
>   	seq_printf(m, "fence %llu %lld\n",
> @@ -80,7 +80,7 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
>   static int
>   virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
>   {
> -	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_info_node *node = m->private;
>   	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
>   	struct drm_printer p;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
> index ddf8373c1d77..e9e3cc8f5b49 100644
> --- a/drivers/gpu/drm/vmwgfx/ttm_object.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
> @@ -513,8 +513,7 @@ static void ttm_prime_refcount_release(struct ttm_base_object **p_base)
>    */
>   static void ttm_prime_dmabuf_release(struct dma_buf *dma_buf)
>   {
> -	struct ttm_prime_object *prime =
> -		(struct ttm_prime_object *) dma_buf->priv;
> +	struct ttm_prime_object *prime = dma_buf->priv;
>   	struct ttm_base_object *base = &prime->base;
>   	struct ttm_object_device *tdev = base->tfile->tdev;
>   
> @@ -554,7 +553,7 @@ int ttm_prime_fd_to_handle(struct ttm_object_file *tfile,
>   	if (dma_buf->ops != &tdev->ops)
>   		return -ENOSYS;
>   
> -	prime = (struct ttm_prime_object *) dma_buf->priv;
> +	prime = dma_buf->priv;
>   	base = &prime->base;
>   	*handle = base->handle;
>   	ret = ttm_ref_object_add(tfile, base, NULL, false);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index c0da89e16e6f..3267a4e61382 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -220,7 +220,7 @@ static void vmw_bo_print_info(int id, struct vmw_bo *bo, struct seq_file *m)
>   
>   static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   {
> -	struct vmw_private *vdev = (struct vmw_private *)m->private;
> +	struct vmw_private *vdev = m->private;
>   	struct drm_device *dev = &vdev->drm;
>   	struct drm_file *file;
>   	int r;

