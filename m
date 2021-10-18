Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5687043240D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 18:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615546E44D;
	Mon, 18 Oct 2021 16:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE06E442;
 Mon, 18 Oct 2021 16:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXLTiaQHWc3EHwxnJJ9NPpYG+EXoeo/N/9m12ZeKn/8Gsn0XzX56pLoFRnBwkOHECU+eKnoV7yvOUwThDt9m/dzie3rYo2+fZ830E3DvQtnVkaMmMrzxE02YksEWYh0HMmt2Mor5CYLlo800aK8qRpIDMGvLs499eAC2FLzRqW8B7OrNe0/2gjp5q0UBeOWiRmbcAcO2IZ8r0ksVnAzFRlPmcWgR4B+2Yc9qpek3DPu745iJm71bs5E7cL22U8js7q4MSgCwa/WKrWnOxTKOp8sJzLnmnlzIjglCzSE7el4uuw80hC5+wh5otMUTBafEtjq8YTYfv1zDws+ut5c4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2cerJGAvz73K3ClIMLYjWfDOiS+WheFbGADjNje4M4=;
 b=Lw+nVIQOAvM5fTWAW0PcaXAX1z3uILWxqjYhu7srW94UDgSiTqElYzinfAblvfA3VIb8nobYWCQZKqcu7vp9+toAbsIkqHEcifBmWimv0vmyAW4eFxsxRFQvG2a59774fXUf2AG7C2rOQ6OSksyr5oUxzZF0v2W+qTx8wefN2weLoD1Y/88eTeWn6TSZrNtKzUe7KZvd2rJw5tC3utYI/M0Z0ZzYUblKi6oICQ0Zh49jYEkGukl+Mz/Z3w8s0+3Kxwq+uOyrrRFIXcwad4vvaVTSKW25xmmWN57g9FcHmDrGuTlnIx99XRcqBFeRfwPjPaHcRn0Dp/Lv1ryEEHre1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2cerJGAvz73K3ClIMLYjWfDOiS+WheFbGADjNje4M4=;
 b=Vfc0swyifLx+6YOy22RCJhQFrZJ/xXay9ebEOTy11zC0RucyHDqFJrEMZsdvp4xnMcdNMKJGl2/U9Ar2fwQpELtxIX/cUHzq9OAWdTyDux6fV/JRJn04saicn47nlXCVW/Yw7dU+1HqNihIYDsY9TXPaD/PpoKytamShOaCshMQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2478.namprd12.prod.outlook.com
 (2603:10b6:300:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 16:44:23 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.018; Mon, 18 Oct
 2021 16:44:23 +0000
Subject: Re: [PATCH 2/3] drm/amdgpu:move vram manager defines into a header
 file
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20211013133837.143101-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2d1b5bc6-cd88-de00-b48d-941cbae5c4f5@amd.com>
Date: Mon, 18 Oct 2021 18:44:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211013133837.143101-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:bac0:61ed:f1d8:827b]
 (2a02:908:1252:fb60:bac0:61ed:f1d8:827b) by
 FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.13 via Frontend Transport; Mon, 18 Oct 2021 16:44:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7abd9f7-2410-46f1-11af-08d9925689b6
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2478B1200A83321A922B5B9B83BC9@MWHPR1201MB2478.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lY/gFzpSTU+ttKcmi489RAmkULSnUWszf+eYXtsT3EXlOfJwVDV/IU1ul0plp01FssK/Bh3nmp5RUER5OkSR37do9bzxacgViyjM/C/bFcyPw7snL6zs5cG7JbWLI5M4bW3UF1qXfwHMp24Rsng12irFKUT0bhVERDQ4UZoMa6qUdK+olIx0zRH7gnRealw/JKkdSpmkxtcugRgkD0So53X9p4RLpjyrFotO4wmmmbMCXLDbiZInJJZ/wGMkIg41Qp5L+G6A+9RlIKQBvRh4x1aNS0kp0IIj46bVK6YJIsRg2WSPrJQ8xh9knXOWrLdtCMT4NwMLneuulQcwbaqqjBOveJkLn7cijwgsID1z0/ZpLZpI1A2td0kLYV6aJENdMAevdEBpuxHBWWTrJPrY6g3V3sF/gOyOBgIX9yFSb4nMciLKWilcdDrzbieUACnPiTLjeX7KLqKLc9y9ofgc40+z0ib6ck8VXd30bSMnP7frOp+UitNAdNxF7RrD6Hfj1NfzkMFHre2UiFKDQhm53Kyc2/u7wGhwbIoEqHV8V5Gpl+L4Ug5cGkg5CzeQm9yrqIZE0ZQxeRJrNDy64kD+cSkSDJPFRXAn4KxewWfZGxXV//+M4fMgrK0HZG1cw2VNR+SfS3JVTmGzD3x5p4mZwiZevq8KGujo+62n2f/H9TxopvGvOF+JWHcDM+pGVdxoRcXxIjWbyf8qV9OIdoEiw0fhhivyQXZWNwOiKiS5b2PA2+vR2ZyFlrFPmpsTArSu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(6486002)(66556008)(31696002)(38100700002)(31686004)(450100002)(186003)(508600001)(66476007)(66946007)(8936002)(86362001)(8676002)(83380400001)(5660300002)(2906002)(2616005)(36756003)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEo1QksyZTJYY0lGaXZ1V0RTTXNaLzAxQ1g2WHBsa0lZTnNGcjQ1UXRCREJO?=
 =?utf-8?B?NTZNNmh3Zkx3U1hjb3ZrSGN5M2NKeU9kL1ZLVmRyNlkvalpDZkxVUngwRmYy?=
 =?utf-8?B?RlV2dE9iVzRWcXpGVVRFZXpLSFN4YUpnWGlPcjlMblpJL3NrMC9BckVaMzA5?=
 =?utf-8?B?enhsWG5pam8zc29KcUdrNTUxRTZjbXVjMXJidnR4T2NUMS93cXlPa1FCSXpM?=
 =?utf-8?B?aFRSRmNRclYwZk84ck9PcHJySU1WOTBuTWVlVG1DSE1tYXY0UW83b0hULzNy?=
 =?utf-8?B?dlFZYitPS2dnMDdEL1ZWTXpTZ09qRytLcW5EK2ZXTFcvTUsvOHptSjF5NGJF?=
 =?utf-8?B?akllcDRNaDdaamVkUEExSXpGT2szMHBSYjFZMzE2QWhlY1RRZHZ6Ri81Z2d2?=
 =?utf-8?B?OGRZTXJjSCtWNWxnM3FWZTdac1VZZXpUMXZEaTIzQTJXdGFLWGlPMHJhTndr?=
 =?utf-8?B?T0pkTkYzczFGa20wSjZWdzdKTWRPbnZXRkM2bHBzVVhDWTRSL1dTU2NxRHNk?=
 =?utf-8?B?QXI3YmJOQUp5Wm5wOUpHN3R5eWtLdHg4dXdTRnVuQjMvMU5JNE9pRkxwTWdH?=
 =?utf-8?B?bVdFZ1pRcXFHN3dqeS9oR0EvdVg4THluZjh2dmUwd2g0OXJIOW4vNXlndWNi?=
 =?utf-8?B?aEh2aHUzZ2swamZ4clhBaXM1RzZWWDY1OWNqSEhseHR3VFNGdmNURkFsb2RF?=
 =?utf-8?B?NTBiRWo4aGlpcnBLNDBpWGNGL2ttaDJ3a09DRnk2Vi9LU2RZQ2xEUnVrV3BK?=
 =?utf-8?B?N0xIN3BFUkdoUUk5Y3ZlaUkxcDBJdHpVUDZ0Sk83dlZoMnRxR1NSbzlHcDhz?=
 =?utf-8?B?UFlUYit2ZkV2aERQVDZtWHFCQnRMY0dFbHBwd0lBOE0yTUhZaTZRV1FiQnIw?=
 =?utf-8?B?Mnd4SXBXUjEzZVI0L0M0RW9wbzhnaFRxOHhzWEx0S0pqSmVhYlVjTW1jSGlR?=
 =?utf-8?B?TVYrUVFrSjlvVlBwcURTTVhZS0RhcUVmS0w2VmJld1FVMlkwTWNybCtvdEdi?=
 =?utf-8?B?VHM3dUVwejJ1WisvTmNxalE5SHpUcmpRT1NrbGlOVVppTmc4WjJDbTdUaXJK?=
 =?utf-8?B?aEN5V3hHT01LWDl5TzRabUd3ZkdCQkR0QzJuNDJBNUZHNER3bVJKYnZoNDI5?=
 =?utf-8?B?Y21BdytFSG53UG1kam5DOUl5TnNCZ2pMaHkvMnlaN01WWWVzbVJBV1VmZWtv?=
 =?utf-8?B?S1ZZWGJ3S3d6VnBTb1NLOVZsaUJFMTBvTlhOVW9paW9aQTJtKzUrckFSbGpS?=
 =?utf-8?B?WFh0cWJ6THhvSWM5Zk51aXdHWm9rcnZHbTdPYlQ0ZmYzRU9UajZ6bkVJQm9F?=
 =?utf-8?B?RWFYdHowMGFwYUdKd2tHaFFBU1pvTXdQRkQwSjZ5cmdhQ0l4TzUyTWxkRGhF?=
 =?utf-8?B?REpXS3h2RUJlaXd1bnpYYWZyUXh3V2Z3aWRtVGtnTVJ2MUNnRHFWcDEvL3Ex?=
 =?utf-8?B?UGhMNmh3UkVVSDRORTdTbHluWmVqM0Y1NUUxQWZlQ0EzOUJiRlJ4bDZJMDJa?=
 =?utf-8?B?ZTV0MEw2eXVzOXlyT0xIcHV1MjZSUzlLNnVBWDdQNlpZVmxqQVpJSjJ1QVBL?=
 =?utf-8?B?TkhMQ2hTVXpKV2tIVFBvSWpJNjdaVm54VjRGVXhzMVVNR05vNnNPMmluOUJI?=
 =?utf-8?B?ajE4VTg1bmptWUQrUFlvRmtsQm13QzNzb3hrMm1UWGlZemE1NTk5WkorZ3py?=
 =?utf-8?B?UlN3dEJlRmJRdW1BYlhUS0dHU05uV25JTkdPSDIxMWlvMHFCRHUvTmc1dUxz?=
 =?utf-8?B?TmZZVDBYRE9sS3c0WXJ2cHZTN3U5QkpiM0NMV1I2MEQrUm9KZ3M1QWFsa2lW?=
 =?utf-8?B?OXZaWnF2dUVWQ2VkMU9rQ095SDFGNEpZWUJXTE1oS2JScEFMb2V6WE9xVHZu?=
 =?utf-8?Q?OsFrL7y2L6jWI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7abd9f7-2410-46f1-11af-08d9925689b6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 16:44:22.9537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOgsJtAVzmyxQdQtu6nCjfKKHmhgft6di+RtbLsYSex8Iwai2kHRRHd13ECQGFVx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2478
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

Am 13.10.21 um 15:38 schrieb Arunpravin:
> Move vram related defines and inline functions into
> a separate header file
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 72 ++++++++++++++++++++
>   1 file changed, 72 insertions(+)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> new file mode 100644
> index 000000000000..fcab6475ccbb
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __AMDGPU_VRAM_MGR_H__
> +#define __AMDGPU_VRAM_MGR_H__
> +
> +#include <drm/drm_buddy.h>
> +
> +struct amdgpu_vram_mgr_node {
> +	struct ttm_resource base;
> +	struct list_head blocks;
> +	unsigned long flags;
> +};
> +
> +struct amdgpu_vram_reservation {
> +	uint64_t start;
> +	uint64_t size;
> +	uint64_t min_size;
> +	unsigned long flags;
> +	struct list_head block;
> +	struct list_head node;
> +};
> +
> +static inline uint64_t node_start(struct drm_buddy_block *block)

In general please prefix all symbols with amdgpu_...

Then why are you moving the inline functions and structures here? Are 
they going to be shared with code outside of the vram_mgr?

If not then please keep them inside the C file instead.

Christian.

> +{
> +	return drm_buddy_block_offset(block);
> +}
> +
> +static inline uint64_t node_size(struct drm_buddy_block *block)
> +{
> +	return PAGE_SIZE << drm_buddy_block_order(block);
> +}
> +
> +static inline struct amdgpu_vram_mgr_node *
> +to_amdgpu_vram_mgr_node(struct ttm_resource *res)
> +{
> +	return container_of(res, struct amdgpu_vram_mgr_node, base);
> +}
> +
> +static inline struct amdgpu_vram_mgr *
> +to_vram_mgr(struct ttm_resource_manager *man)
> +{
> +	return container_of(man, struct amdgpu_vram_mgr, manager);
> +}
> +
> +static inline struct amdgpu_device *
> +to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
> +{
> +	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
> +}
> +
> +#endif

