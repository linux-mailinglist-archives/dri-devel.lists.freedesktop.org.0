Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA438C1C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8E26E4C5;
	Fri, 21 May 2021 08:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A2F6E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:26:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcS3PxTwOmECFhsJJwBxYAVFhhuZ/uztWwtgERtFVdH+TF0npAWuUUkwFXVeWcJ565GDBRLy2X9Rb0GQ0gZfTOY/vHeAC0W7q/RxRsdfzXFvVuMDOoWPOkbGN/rWLMZPOu85VfmTiKKmzJvp1Zx2ozww32JciqDX8Y54KwjeGLvf5Avke5KEzgfoHqYTgxNQOn4Wk6hMIr+xDmX8U0Sy+adBeDd05AjvzsC7jYNrPyjsQ9buy/JwxHFztIsovK0w25qQAzvuh3KbzVnfFzCxEaHocxA2eY4vnAmkg13ykYY2egXwIXwGqYPPpyhMQnE99Md5PJCEv6tZu85eyveeFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm53H/hfQ0HfNCpNlOFtJbiftLPmyKizsSEEcr76cvM=;
 b=FN9bX5yDXzK6w1g/wqbGTxS8W+gNggmNiLhtb49FGE3JiH1b7v1gnYqza/Vu3KRwTXsb63fIqn9qB1LlOJo+ERjhqoj/NlvAmAiWT4DG6JIuHg2I4WccxMpxf98nKECnonkzK4aAdvqQb5DUWHeLSm/YAhRSYGf3FxgRIjU/Q5MSCmLxJL2AzeccwpyISVISIQNhG+GohLP6nZBQ5bZDwF0dDJAapjGF1P+IEldU10pd/mm22V6aFCY1AMLf6F2o3Cmb9cuvC++Y0QSLq6yzuvpsK/ZnhCGW9uSs8JyG9tDSccBMde5O/4OSwO2oZLckfKI2UIQWP0x8aCNCFXIeXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm53H/hfQ0HfNCpNlOFtJbiftLPmyKizsSEEcr76cvM=;
 b=LbVqhv3fvicGQWQ/xvpnklNQGcVWelEjY6XFFrFzZw00HZzzxV9wQ/qwbERYtxPWx/fCnkwKxbuGUTcOLlupxdRqWlsqQZJUXT3CcETm/DqiZxKjV90vbvTpwgvn2npsdIirViq6m+j8gYnZzFAyuJXmKRCO4L4nMHGGC1SmszM=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Fri, 21 May
 2021 08:26:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 08:26:33 +0000
Subject: Re: [PATCH] drm/doc: Includ fence chain api
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521082457.1656333-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b8cfff00-2545-8a09-1591-f2f162e2adb7@amd.com>
Date: Fri, 21 May 2021 10:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210521082457.1656333-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:26:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6691074c-b768-4bad-073f-08d91c322479
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39508D21E42A007AE8AAD3AC83299@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTYdb16kp3UnDVDHVMtCLB3elK8BvaKzZTZX75K93DqU+lIwe/DgTSnbyrQw4WItMGbJkYRZ/6BoSnMJkR566h4sgG2ji0PP8rNPYhGIYYgwxr4cBN+DqMrLHxWpN/ALl7wtVbnE/D8HUXkXeqGXXpOnPaljqsj6Ucj7OKZJrnBGRLtufLLSdDCJr6clWIalxDr/usaLnSmflks1fjbMTgXpM0T74sRHa9/lDnsT0rLH/OQCuqu6VsfJURyb4J2qRWARrFO2K6WSmcujwsih+L1VKuOQ1WfASpeELnm6S2jpEHYqoolA6GrkqADdWG7/cxaBa1ekp63UaPnMIsKCnNoCgxvFCcZZFeS7UVG7yY+zeFKsMPZMYwB2rxtO5llYfXpu06pLLqV59AgROaSGOBz88N+aMuO3zmBLyzgvy52d/kS+OpNIBwsTe/hfUAihrqqQQmoj4LeIJmJp9aRzkh2zm/3vz7aAuVIovTWSp+ECEKt/bt/wiUd0qssrMreBq2f7vSKmVfH7/vJKdE1xLKrvUmoM2p3hFbjo6osEojnenLuIWB8XtRXxcSw9Ms9a7GmPruJu5sGX3dLgrjA+yGVHJXj7ZiBI5gycFGoTubqQJ+m1lzbFwDbdQfDbcf1LhSS1D5oOZ+GDs/BQFPoswyqdskVvETjZKwXl2dk1ExKmqQ0nDTQe+66qHTQPJyjA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(6486002)(2906002)(86362001)(52116002)(31696002)(2616005)(6666004)(478600001)(38100700002)(5660300002)(8936002)(36756003)(66556008)(16526019)(316002)(186003)(54906003)(110136005)(4326008)(31686004)(66476007)(8676002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVN4ZmgxVXc1NU9nMVVHL214WXNqMms1NlpzMWdkWGJ2RFZCd0Y3bTFlVExM?=
 =?utf-8?B?TE1HVElnK3B1bGVJZ2NYMW40QWxPSWpvOWhHT1pKRnNSN1BFdHFkRXVVM2pC?=
 =?utf-8?B?Yi9kMmN4K1VuVHU1UERha28ycVlNd0M1VENLcDdueFdaVjlMUmNySHhNdGZo?=
 =?utf-8?B?M3pyUGYwUW56aG5OY0pOeHh4T3ZwUmR1bmtndTljV2s0TXhUVzJHL0NXS3VZ?=
 =?utf-8?B?b2pueE4yYS8yRVV0SW80Z2UvYnRkTEZqMFBPYlNPOEs2bHF5dzljMHBGMFZR?=
 =?utf-8?B?U2Q3Ty9zY1RFUXR0TWZFb200QkgzM3U2QktZWHJFQkcrMUZjaGw5c2hmWHlh?=
 =?utf-8?B?eng5UkZmcU1RZEI4RWJyM3Q4d1JKMzkyWWpiUmViVkp1b3Y0NDV0SkZ0WWRY?=
 =?utf-8?B?R3J6SHlrSGU2WUM4K0JRbkpYek9FTFhyK0kwMjYvUlU2WE5lTkZnalFEejJP?=
 =?utf-8?B?SUJEMXF3enFmeS9kckNSc3ZrSUNRZER1OFU0bWt5VDQ1VU9VMnR4WFQ0b050?=
 =?utf-8?B?bElyQi9oLzVOTnZMd0ExMDA4VlpVa1ppSy9Pd1JsdGJ6N29IalJ1QmJEWTgw?=
 =?utf-8?B?NEhrT3lxSUtzeWluV3lmZjk0MVc4eXdidkM1VHAraDBsZWwrWjQ5UjQzdEp2?=
 =?utf-8?B?cWVLR1ZURE1IMkRCTmxrRkdBYkhQZ051dHRHUjJsRjhhL2ljaEJmN0tMNWtM?=
 =?utf-8?B?elVyakcyNkFDUmcwMHZDVTZhNG1POGdoM1FyT1YxNXdxRXVtZFdIMHVpbVJj?=
 =?utf-8?B?bC8xS1lCQkhGRVhwWFVVRWxabzdidHJUTjZ3ZEhkQ09GMmVhRVl3UUdhd0RH?=
 =?utf-8?B?Y2REYjA2ME1xVkc4SUlpRFFUMU54dGwrcThwbkJEQzFBZWlGTFMzZHM1bXlG?=
 =?utf-8?B?TGMwWGF0dWFtZ2lDSm1JbGdzNTJDcENqdUxKVUVlY1NFVFNLSG9RSHRHb3Zy?=
 =?utf-8?B?VEVTMitXTHpJZE96bFB0b1FQUnFBckFRVzFMN1NrVzJlck9EYWxXajBNU0E0?=
 =?utf-8?B?Q3NiUmJPMFViNjNUbERSV2xMOUFCTVN4b09IRlErN251RzZmNkswUkxFdjgv?=
 =?utf-8?B?U3NIMmx1MTRGYzNVT2xpT0FSdFNqbEV3Ui9IeDBDT2RnTEpDdXpBbVoweGlz?=
 =?utf-8?B?S2hWR2VUUzhXcHdhVkhBcXE4TGpNNlhmb04yL05qcGZIdXdrTThoUnk0cmJF?=
 =?utf-8?B?RGtydG5ROXgyL1ZPZXh6TXNWT216dUZFanlSbWlyTzN0U0RCVkNkekxhWjA3?=
 =?utf-8?B?dEdoNlJ2Zkt3RmxpdmIyQ29GMmU3NlYvM2czTC91QW8vU0NGMWU2b0JPZklz?=
 =?utf-8?B?cm81T0pzWXZ1WTAyQ0tOdmcwSHR1QU42OXkwK0RQUFpqeWZwaGtYNysrM0RX?=
 =?utf-8?B?OEUzeDVQY0hJYW1HY3ZYcldWYjR1eTkrTE5XalN4T1BLdThaNnFsUitYWmJk?=
 =?utf-8?B?LzQrK1kzYm4zemUyQmVDYjJGNVhpZnprbDByZWQ4Z1lTYjgxdEowd2ZmN3Mv?=
 =?utf-8?B?MC9aN1Nja2FzMndTSFUrdkRSVUdaczlmZ1F1YTFNVExIQXhCTzFTMmVMMDJk?=
 =?utf-8?B?VnRxR0dLTWt1M1dIa3ZvUDNJRFFtbytVaWhVNUJxMlo2NTBWeXRwWlMrM2p2?=
 =?utf-8?B?dmZBcE1pb0h5WVFtazhMakkxSzh6RHBZVmRjMDNWckZmVDlLUDI4bUJqMldJ?=
 =?utf-8?B?MkU2ek8wZkVYQUEybzBmYmxBZTRlVThZZmhVaTAvS0ZjcWRwK2IvYTMyMzNR?=
 =?utf-8?B?VXlXamMweVd4WTBqb3NSeXVoUzRsOEZ1ajhYSVVSY1FpdHJoSkVtckl6Mm1G?=
 =?utf-8?B?N0JYalBMYkVYU2p4Qlo5L2hmOEtRd20wZ2FlYjlBZFl6Q3N5TUlTSE8zR0pt?=
 =?utf-8?Q?6QyFgFpG0c8of?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6691074c-b768-4bad-073f-08d91c322479
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:26:33.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJwhP9sWBc7PJnMiEozyA0MRAI8+meKMhJGggOZ6FJRKPdjzlJcb1RsJ6SMXwO1D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.05.21 um 10:24 schrieb Daniel Vetter:
> We have this nice kerneldoc, but forgot to include it.

Well I didn't forgot it, I just didn't had time to double check that it 
is bug free :)

>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   Documentation/driver-api/dma-buf.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 7f37ec30d9fd..7f21425d9435 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -178,6 +178,15 @@ DMA Fence Array
>   .. kernel-doc:: include/linux/dma-fence-array.h
>      :internal:
>   
> +DMA Fence Chain
> +~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/dma-buf/dma-fence-chain.c
> +   :export:
> +
> +.. kernel-doc:: include/linux/dma-fence-chain.h
> +   :internal:
> +
>   DMA Fence uABI/Sync File
>   ~~~~~~~~~~~~~~~~~~~~~~~~
>   

