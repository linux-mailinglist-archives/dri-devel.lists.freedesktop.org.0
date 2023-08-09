Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A017752AF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 08:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFBD10E3F5;
	Wed,  9 Aug 2023 06:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AFB10E23C;
 Wed,  9 Aug 2023 06:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSt7+R0WqGiZKXXOV8kK/g42X7tU3jaLmcogER24j8boq4nvKQhXrO85UY0zK35zgOzF8RSPlp9U6WyFW0MjCQNSfCU7z50GLwUKOUZpd3rBEC1MeYerbs+yjgbcwA1xFJcMUbnz/yMylTm0juXnLr3vwixQNTPfEa/a/BZ5gDsO42XsMSajKhoXxkirrix+sjF2rVPoNpiGYcM/q6W/Phlejq40X+e8BXF/ohjbe8Cje+Llv6YkGtsR+ESg7M989u0XEdk4JP+xO7yT0k2j+cKBKG9BaSGWpwLrIBQuGnfkK5fRuSPXIL1WsAbmLJ7p1B4PKg0+gOhocmTSeP2PQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqKdQWNsZujQELLTqxPkmyoj62uEMHdzP7cZc4NWsc4=;
 b=QKJFiQkPMYH8edANr0BlIBmgFS1Tnad8fbOXXtSA60tIN7GdF5BUZgpKse9XFB3NV5LBchDSAP8AIUqlOGmXpR0LSfvJvsYBpV+L5Ol/CNQXoa1gq6rykqgc92nMa+Yk52OsLDSE3OXDfg151nyhE7+6z+9lc+IuW4v8XGffdzoZu3FjBVJ34M3S5kW5f1aXjGP6Mz4LBfoP8meKCW5nZ8vnJTRi9/6sdz3s2qWkZn7TWqz0YsKTsXaNzY7z4MYbeaEzrP7omV/8X89fzeu3DWCKxuiZ0AEJn7LvY492TcjuD1SkK7GIHu/riS1kpTvmlw4nZm6tkeVu74Ras8Cyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqKdQWNsZujQELLTqxPkmyoj62uEMHdzP7cZc4NWsc4=;
 b=gKAYPQse0GC/UbtnGwG3yCJMRG7wNcxuWfnPbyy6bUobMjilnguO2GnJPH2BFqZng3AQthUuDo/pjJlRQoJHuDTtnB8nSQmXRYrzWJYom+vQGhYQLJiTtMlnJGW/Ni0DbE7ygj/kOh/wnirQ6NPboB2qiypRedXidERPPy+OCIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Wed, 9 Aug
 2023 06:15:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 06:15:33 +0000
Message-ID: <c2b0d96e-b768-b295-c672-3ae52e14b10b@amd.com>
Date: Wed, 9 Aug 2023 08:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 1/7] drm/amdkfd: Remove unnecessary NULL values
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, marijn.suijten@somainline.org, bskeggs@redhat.com,
 kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
 haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
 george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
 jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
 aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com, jiasheng@iscas.ac.cn,
 noralf@tronnes.org, jose.exposito89@gmail.com, javierm@redhat.com,
 mairacanal@riseup.net, davidgow@google.com, arthurgrillo@riseup.net,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
 <20230809034445.434902-2-ruanjinjie@huawei.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230809034445.434902-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0207.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: db2f1aeb-8c33-4dcf-672e-08db98a0098a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9lBNf5pI3/wHCv3eD6u2IqjyxcG0626nG1CbrHWZJ2S3wW7ztPIG8rsvQYRfW4S44nU1+gbiMpQLO5bE2p3xYe91G3iAT9DjZA2b8s59lzqzAHfQNRaze0qJv6QCsFswEYuQj/mBv+9WcBAx9yv3Gwe3Zd0+5quqAj37YtKibpWB+UEYoFvopudW0EVd3sThQ7GiYn+aDId86fj9vQF235dlwqnPMnCvHacG1c5T3pdznj4PJz0vdIuAcZK2g1lgMxX/eJMBRPFXLdxaTZNPZq8oKfiHuw79zWGkWcuMl+bHOF+Pgwcecvhfx4RWxOFuiAYHIJ6hgQE0n69ADAOAs6FbTe7tVsmh9t3wVVQ5/Qdxzt8P7ZRBCqTvX/I79+I49zgmkgm4Nmp+bRrkneDZZdi4EFmy7ykdFumkkGL0WIHydRtRbp7s2Atl3QNgZtGsyPHYsgnQrY6FcLgJi3HdxnWYbQU29x/65H23YBvOq2oqqCk7XSQVf7lCQ+fBwGoXWSSR74GmOCCnJ6KnEcp/3jwlGdRv/fcYZXGN8z7gazVgT5U3wne+RXs0oucfv5J/fbM9WLN41BuYg1c+tMVpRgOixlcFt5Yj2Y7PKt5iFntEphVOYc6a0mlCN3A5iK4rneHBFZXAIZPT6ANwKMS0rl8gN2LYw8FyBh1bjU4BWiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(1800799006)(451199021)(186006)(7416002)(7406005)(8936002)(5660300002)(8676002)(41300700001)(316002)(83380400001)(31696002)(86362001)(2906002)(6512007)(31686004)(6666004)(6486002)(1191002)(2616005)(6506007)(66556008)(36756003)(66946007)(66476007)(921005)(478600001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFB6ZDE5V2w5NSt0UVZaK2tQcGJXNUF5Y2kreWNzMnV4VDE5bGQ5Um1MVC83?=
 =?utf-8?B?NHVrd1p5V2pGOFJMYUFFa0huZ01SMlVmN1dsQ2dQOUtqSU5yUm52TzkyWGs4?=
 =?utf-8?B?VERhQUc3Z0FVdDNlenBlcTgzZzRLU1p2TTdtNVEyeVZldTFuVVFYVlErUFMz?=
 =?utf-8?B?WkkwTnVmdUJyVjFFYTlSdlpNNllYWTI5U0o3Mkh2TkFyNHE1Vm5wRERxWFpn?=
 =?utf-8?B?UnJmUndleGZDTG9DRW5HOWF6cWtPdTBmM015RUJ6S21WNlhvMEQ4T1J5TVY1?=
 =?utf-8?B?OHcybnk5VW1ET01sNUZOQVhFT3pOYkRid2lwYW55SXZrQ29ldUF2UStqTnFC?=
 =?utf-8?B?UlNjUm94aWV4aDNFditxZC9KRXh5UnQwQ2VCQUtOYlJPS1cxaHYrNWpWTWxw?=
 =?utf-8?B?RVBMS2NxS2ZJTTM0dlZVT3RFODdBc0g1cnFBcGtXbW9FMGlnNVh6VTdMdHhi?=
 =?utf-8?B?YlRFSDBNajhMcURsTkRocUxGY0hXaktpdkNnSExnZVVrZW1qTGxWN1QrcFpa?=
 =?utf-8?B?U1FmZGwxOW0yTDJ3N1B0ZnU2VzlOeURmTkFtTGlyRmp6NTVOU2QzSTJLcE9U?=
 =?utf-8?B?RE1NZ0N1ZERNMHJkL0MrVU41emEwOGJjMG9IenhibTJpNmJSMURVWko4aGNF?=
 =?utf-8?B?YmMvOXJ0NExZUlBFZ0l0eElma3dyWTQwREJiYzFDcit5bVNJRmEwMkhZQ3pB?=
 =?utf-8?B?OC9Zb3kzcnhpSFgxeXpZMUlVM3NCaDd4NWxDOUFNam10SktEalA5YkpGRGpq?=
 =?utf-8?B?MzlyNmNZdUFzS0kyNmhPZWNiak5rUGN5WmNYcWV4TVNhbFN4cFpvemJzWUlx?=
 =?utf-8?B?aXBPN2oyWEdPSXVGNE10NmxJWHQxZ2VIUjVZZGc0b20ybzlsaW5vSTNkejU2?=
 =?utf-8?B?Q0U1SjYvaUsvSlE2cUora3pvWklxdFRNd09MMGQrVUIxTUFWaDJ4NkgzcE53?=
 =?utf-8?B?dWZKZUM4bWVwNXVrcnprNHpZRXZrM2ZOa3Jvc3o3dWpHdTU0ZWg5ZHlCaWVm?=
 =?utf-8?B?RVc0aS9oU0tkK3M0SklvQStDSVJWR3I4Z0F6bnJXN3pxUzkxSEJKT2NaeFdl?=
 =?utf-8?B?dW4wUGpUaWJGMEhIYzRPYUl6N0Q5ZksxRnFseGtwc3FvYWZ2Q1M4TFhaRzdj?=
 =?utf-8?B?VWJ1eHZHSFl6cXp1N3VCdFpsajduc3l0K2wxWlNJQTM2R0NNWFF5Qy9uQ2RG?=
 =?utf-8?B?ZkVac0x1S0duSHdmMHVGUFdYaWdUUmQ1QU5PN3VCaytsQlE5Zmh2TnZGNU1o?=
 =?utf-8?B?V0hHa3Y5U1I4dXJOalIzbHBNdE1PdjZOTzZDaUY0Y2JOaXNDV0FEWi83blQ3?=
 =?utf-8?B?VTBmNEtvQ3R1SHBnUmRoLzBJL1RveDBFUGkyYktoS3dRNm8wYlY5eENNaG9R?=
 =?utf-8?B?SXBPdnBYMzl6OEhEa3hBT3N3Z09NSEI2VGxRam9NbEVSR3hjZHV6T2psUlhQ?=
 =?utf-8?B?cFE5SG0yQS9RS3RPWGQvZSt6NlBocnBtdjd3ZjJ0TkgwTHFDbG1NWXZDNnN1?=
 =?utf-8?B?ampkMjRWeU1BaXBzOENwZVNTaUtXTFFTelNBVFdrVDFLekJwOHlpM2E5ckZr?=
 =?utf-8?B?SlBmS3UzZThDNGRFZEYzTXB0Tm5uMXMzZTd6Y1Y0MGR2M0FBM3p2Q0FxeWZT?=
 =?utf-8?B?MXVkUFpnUWVWZHZBbXJXYUMxK2RGbzJvZ09aT1hSSUt6bGhsQ0FCTHRWeHlt?=
 =?utf-8?B?b0NDMTU3ZHNaRnNBZTd6cUFvTW4ycWw4ZmZFVzhFcVl2YlZDQmdBYjFGOFR4?=
 =?utf-8?B?K2NYSEo3cGlGRnlnU05hdmk3Nzk4bEthUHNjZ2lDTWg2VkhqelVVRkxHSW1m?=
 =?utf-8?B?RjJYRkd3djM2L1JJTTl3RGs2eXl0VXVON1M5Yk9UdFE1cWVWdFk3TzlibEdv?=
 =?utf-8?B?eVM3ZGNuV1ZuSWUrZUtyaW5DZ0pFWWpIRktUdU9NOVVCcDNQaklNZU5pUm9L?=
 =?utf-8?B?NGZpN2g5M09xVitKZUNXYVFrblRVbkhtVTFKdzZ6Z0htaGI1L1hOT2ZTbWNR?=
 =?utf-8?B?ZmtJQmphSjkyU0FJRGphT1JaUU9KNHN4WmpnZnNCWFpjaHExQU5xZUdiODRI?=
 =?utf-8?B?V3QxUnlLSFZtMm5PanZSV2pXNk5pdFFjeW9WNVBTbG8wa0J4MGlxME4zcXE2?=
 =?utf-8?B?a1g4Mm5EYTRFRDUxRjZZcFNXZ0lVOVR5T0RLUTZ6T0JieFIwSld4S3g0dUVI?=
 =?utf-8?Q?lCL/gFM7KuZktA/kSXMsflTLet2M5HLpXg4TlNI433YX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2f1aeb-8c33-4dcf-672e-08db98a0098a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 06:15:32.9069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNlZEvRvIgEQhQzuGsOmJQYPSJsOurd+bv1gYRBgzDXrWuVsEs0AqZbg1XYXknjU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.08.23 um 05:44 schrieb Ruan Jinjie:
> The NULL initialization of the pointers assigned by kzalloc() first is
> not necessary, because if the kzalloc() failed, the pointers will be
> assigned NULL, otherwise it works as usual. so remove it.
>
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for this one, 
the amd display code and the radeon stuff.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> index 863cf060af48..d01bb57733b3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
> @@ -48,7 +48,7 @@ int pipe_priority_map[] = {
>   
>   struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct queue_properties *q)
>   {
> -	struct kfd_mem_obj *mqd_mem_obj = NULL;
> +	struct kfd_mem_obj *mqd_mem_obj;
>   
>   	mqd_mem_obj = kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
>   	if (!mqd_mem_obj)
> @@ -64,7 +64,7 @@ struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct queue_properti
>   struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_node *dev,
>   					struct queue_properties *q)
>   {
> -	struct kfd_mem_obj *mqd_mem_obj = NULL;
> +	struct kfd_mem_obj *mqd_mem_obj;
>   	uint64_t offset;
>   
>   	mqd_mem_obj = kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);

