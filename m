Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8A3D0E22
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 13:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215C26E8F4;
	Wed, 21 Jul 2021 11:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558CD6E8F4;
 Wed, 21 Jul 2021 11:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSLrYWt4MIswSPkKGXXtJYyrgNyzZSvh1dq9B1fBCVNYvaBMpvv4pcq1kRYqNfuNYZmtPMo3GKMVx7TU/4HcdKutwAksIRGxClDAyLd4O7KOV7D72ig2C5ARljyfN86MY3X6lFiGhJ+3XMiPjqIR95LGpCm4XlAPFg1Lg1pP/1W/jlVNiIIVR15FA1rIIelXuxNlDmEopOyAgrafc8hSqfPpt/t8OWSvyF4cXfM3CbZH8c9kiCJEQk/onS6PSCH9diX/iHTQxVjPGmX3i7QRhnUfEakTrRdh5Us9d95iRvQGzF7T2QMHFjHyIjHewd54C/qxqNB5uHPUUbPbTufGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW1cOkHRLr+5Klc9Rk2SHvlYHhirMQ+npHeUbZqV5po=;
 b=NWXos4jnuOSTD5Fq29Md7EEr5E9CaWTy5YAcE/hErjRIH5sKVSy6yFyhXuKY2OGLRrzr9RU74ztULq0XNEyqAccXExFgcEzROq21i89+a6GYkLFNHJeDAdLZB+EBivvf3FQdmXhAlkY9Bldqwelpt5eSAMMJuT+PeUyXWMcSf6jefPngCtIBqM/CoGP4ASgh5kQBCadQ5wGIBHqnmcf9fk2iJzSRxmhj4XjyW9J2YxD6WXuKKittTG5R2O4hQhIhzyXxko9iB6TKOiCa+YSVh3dzX6qoeGeAnOs75V+EpwkG3GlxJFX87xffKRA7EJ4rsfI4lSmAcrZcKjzDHi/e0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW1cOkHRLr+5Klc9Rk2SHvlYHhirMQ+npHeUbZqV5po=;
 b=qjn9K40h1tA94Lln3WxGYYniiRP/vhW4+GpTBfe0MwxtzJJbXU8eKpCFn55yO9qfXSxy0bvCGoGX10wiq9VtBHUhLjU22IFiXAxVFtxvELIw8c70IObcmvkm5pCRlZwVNUzFJgQk5PYwkmrljFVu1RcsfqV5dQMoGRAhYXCglsI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Wed, 21 Jul
 2021 11:52:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 11:52:45 +0000
Subject: Re: [PATCH v3 2/4] drm/amd/display: Add FPU event trace
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
 <20210720004914.3060879-3-Rodrigo.Siqueira@amd.com>
 <88027c93-b254-875d-c640-8aeb6dbdd0ac@amd.com>
 <20210721114457.jhponmsgeliwalkc@outlook.office365.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cb84b50a-ff3b-e92c-7a25-d69a498f7ce1@amd.com>
Date: Wed, 21 Jul 2021 13:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210721114457.jhponmsgeliwalkc@outlook.office365.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0011.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9bcf:837a:d18c:dc66]
 (2a02:908:1252:fb60:9bcf:837a:d18c:dc66) by
 PR1P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 11:52:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f48ec2b-f880-4869-5583-08d94c3e0daa
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48685128E06EFCAE3CE646C283E39@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Aqp7pu8/yNzChtby+GsvV1KNTwjrMg0zLl+EQUaQFaEZthABx5raLI3cL8jPCgPHu2+HsRtcgPNhZ3+W9xgdctdeE+/tYXeyg0nB3JyuA0PdgldK/DhCRkXtKZ68UkM+IDNXmH1HWwBjjR6v79koiIY4LMj90ZegfNe0HyqSJjcPE74sU2ZfiDG0qhlvaXH/xFfWO3UFN3mlmPQiG0lX+hNHrnkIa29oAfhO6xXyl2oPGz/KsyGw9U1WHIhMdM8A3Ey0/dIHphP6g529Ss2CdMiecfhzTY2gs3/cw8SSqefM310aR36vgWrsetQcAzWPpa8gKRT1iVVeIkkVTy3UYU4UZxPYy5pnGtVptMnAs/sFgaaN5cdenxRAZg4MwW+PbvJYJSaIzw06K35ELa6I6btSNadzELXMPcAu+MgK+Fykq6+xleV/0J8/54oCl5AXgTcYADL72gm4LWecJ3Gz7tg+3ueVPBHaYOO2tBZ1TAGmUckFj7ndPN/+gm67ORmWcE+9Xr+JbUY6CAbZdfyCaIGq6Gz06qsUz2Grr7fXPn4hX3qSpRZciELU3FliW7JEcTaXCzOWs8KCoANciRK6NzyAwjmqkyPABZe5RZjavEiBND7bMQACCS1OqlTKi1p2KzarmubWM4QYq7p/96o1QGc+p46Z4L9fHi4tw1xtN3wAqReySFmv5v7xfiirdkvdi7DJlnj98mVvVjKKipoZvMtqWRR2iyUfQ0Q1RsKQ+3XHeQn3T03aBtZoq4HeVcV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(86362001)(66574015)(6862004)(66946007)(83380400001)(38100700002)(8936002)(6636002)(8676002)(31696002)(2616005)(4326008)(54906003)(37006003)(2906002)(478600001)(66556008)(66476007)(31686004)(186003)(316002)(5660300002)(36756003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNnRWhQUXhGVUxEV2ZsdEUrVDd2bWVzakRCRXgxZ0Q4bDU1Y1E0TzlMbkJM?=
 =?utf-8?B?Wm03VWpka01qcEFmU2tTWHozcWROaWM5Y1RUYVkwNHRaVVBaRFBYL05iaTQy?=
 =?utf-8?B?dTBWNWZYMUpxT0ZxOW5BNFdRVWtZa2pxaWs5dXpEdENlZTIvYlZENGNuMEFL?=
 =?utf-8?B?Kzh0RTg2RzVrcUc4dHBvV1lsaWFueGFBWVY1NitSR0xRY0krOE9lemYzMUdx?=
 =?utf-8?B?OFMzcHFlQzNCVHdRUXdHanUrOG1oSzZ3UmJpQk0rNVRGODhyZ0dmeUYwaml5?=
 =?utf-8?B?V0RvV0JJeUNhbkZtV2ZGNE1PMU9rRFFnSnpyS01DYWJIeFArdXRPQllVZGt0?=
 =?utf-8?B?M041Y0JQbmw4bXpiZ3JGOUtXQzNOTlpKc1BPRU5hc1lUcVJEM1dBSmlFVktz?=
 =?utf-8?B?aFAxQStqeG9PWnZ4Mk9QVVB3bXN5ZC95TVhHNE1XSEwxWTFIL1JOemxJd3lT?=
 =?utf-8?B?bHJmd2w3RG5QUDR4OHQxOEN1ZG85bHMraU1iOHIyaTFkS2V2Y3VqSzBCZ1Vi?=
 =?utf-8?B?eVpmVEM3NTNTQ2owditmQ0xMMVZyQWtTYlFXNStEODJzVVI2VHdJSXRScng0?=
 =?utf-8?B?S1hTeFpQVWJLdHhwWTJad3ZYRVdxN2QxaTkrYjJrUlFac0hEWUlmTnh5MXJl?=
 =?utf-8?B?TlBwdUV6bm9TaSs5b3VWcjNCaEJxZ2p2RVhGMDZzcndTMTQ5UCtnWlQreW11?=
 =?utf-8?B?ZGVHYTNPd0lWTFJZS0tIczJiYzkzaHZnTDBOZGtqOUZOZ2U3Wk1PM0lxSTNB?=
 =?utf-8?B?Rk1sOWZhaHAzeCtFaFdxekRYcmluTnhCMU9XUUlnd1hCS3B4RC81YUx1b0F1?=
 =?utf-8?B?c2MwczBXUEpsaGFWOTNjS2ZKNGJhQzlxc2wxQ2tpN2lDY0NoTkRlMWIyWndK?=
 =?utf-8?B?c1JQWDFzQ1NmdFZUQ1VBenNwNkoyNllweVhKTmwxOFJPQ0FDMklQREd0dVpY?=
 =?utf-8?B?UUprczFKRCtSbWRtdmpmbEFTQjIxRDhUdUFsV1RLdFQ4UUlOTTlFYmNsdlo2?=
 =?utf-8?B?L3ZNWkxCNDdzdDhTNVlCUStGbjRVQ1lOZG5oNHFvMnhDSHZydVRaWCtRTWVn?=
 =?utf-8?B?NWRsUmJqTG5qN21hK2pacjljeTJ6ekF2YmoyZTRpUkYra01ERXg4SWllcDNK?=
 =?utf-8?B?VzJRRFdUYVVjb1puNmZQaURHbkRkZGNkZm03MHFZRlN6Q1l3ZXM1MEtRNWVR?=
 =?utf-8?B?UVFZTDVnWjZ4NmRyanh5dllDUEV4VXJXWFJMcmdlTkRialFkNEw3WjFQWFFB?=
 =?utf-8?B?STErSndNVDA1UVdIQUdKTlJaSmFqYlRYY0pVUXJibkJUayt0UlpmUUFRL1E1?=
 =?utf-8?B?cUVqeTE1UXp4OFlpQUoxWGpNNE01a3UyU293VkVvSnBQK0FYbytxNVVWRjFV?=
 =?utf-8?B?ZCtLN21laUNJZkxWZFh5aWIzbUYvajkxL0tkL3puS2grWDN6MFhGYTYyQldS?=
 =?utf-8?B?WUhYd3lkMVZrYjZaTE5tM29GY3RDUVhtbjJwMlpnOTFNYzBETnkyTFhsRG5Z?=
 =?utf-8?B?dVpKTDB4bWttdmlDNExyUlNXK1NqS0F3UGZETWE3RGJVUFdWaERGYUZJQUhK?=
 =?utf-8?B?Tzg2U0NBd3orQnlwZE5WdWs3ODlhZnE2N1hjajlBaXByME84SXo4WENXUkFp?=
 =?utf-8?B?MUNLSENKOE54cXA5OE55b1dOYisxOHVPRHdhVHh6YUp4d24rWTBINko3MW9H?=
 =?utf-8?B?L25NZnUvSE1Dd2tNZUJ2ZUtPTnoxRXdVSW9GeHFDdUd0SXhXOG5Wb1FYanRs?=
 =?utf-8?B?UkREV2VJZVBic00yNWhrSEozWm5tOFlMV29COEYzOWl1SVBFT2llQno5bnJC?=
 =?utf-8?B?WUVvd0JzYm4wZldjOWZLQWlzUnFuQU5WTkRWM3hrVEpxQkNZbWh1eG94cEZU?=
 =?utf-8?Q?5vjhuz7KE9YlX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f48ec2b-f880-4869-5583-08d94c3e0daa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 11:52:45.2904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnxWKWL8+hd/kEt410HDBMbrqdLR2GbDTnHy+uNDdqXNsPVHE1+j8f2F9e98cMW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Peter Zijlstra <peterz@infradead.org>,
 roman.li@amd.com, dri-devel@lists.freedesktop.org, sunpeng.li@amd.com,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.07.21 um 13:44 schrieb Rodrigo Siqueira:
> On 07/20, Christian König wrote:
>>
>> Am 20.07.21 um 02:49 schrieb Rodrigo Siqueira:
>>> We don't have any mechanism for tracing FPU operations inside the
>>> display core, making the debug work a little bit tricky. This commit
>>> introduces a trace mechanism inside our DC_FP_START/END macros for
>>> trying to alleviate this problem.
>>>
>>> Changes since V2:
>>> - Make sure that we compile FPU operation only in the context that DCN
>>>     is enabled.
>>>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Anson Jacob <Anson.Jacob@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>>> Cc: Aric Cyr <aric.cyr@amd.com>
>>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>> ---
>>>    .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  4 ++
>>>    .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 21 ++++++
>>>    .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 64 +++++++++++++++++++
>>>    .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.h    | 33 ++++++++++
>>>    drivers/gpu/drm/amd/display/dc/dc_trace.h     |  3 +
>>>    drivers/gpu/drm/amd/display/dc/os_types.h     |  6 +-
>>>    6 files changed, 128 insertions(+), 3 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>>>    create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>>> index 91fb72c96545..718e123a3230 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
>>> @@ -27,6 +27,10 @@
>>>    AMDGPUDM = amdgpu_dm.o amdgpu_dm_irq.o amdgpu_dm_mst_types.o amdgpu_dm_color.o
>>> +ifdef CONFIG_DRM_AMD_DC_DCN
>>> +AMDGPUDM += dc_fpu.o
>>> +endif
>>> +
>>>    ifneq ($(CONFIG_DRM_AMD_DC),)
>>>    AMDGPUDM += amdgpu_dm_services.o amdgpu_dm_helpers.o amdgpu_dm_pp_smu.o amdgpu_dm_psr.o
>>>    endif
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
>>> index 46a33f64cf8e..230bb12c405e 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
>>> @@ -637,6 +637,27 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
>>>    		  __entry->refresh_rate_ns)
>>>    );
>>> +TRACE_EVENT(dcn_fpu,
>>> +	    TP_PROTO(bool begin, const char *function, const int line),
>>> +	    TP_ARGS(begin, function, line),
>>> +
>>> +	    TP_STRUCT__entry(
>>> +			     __field(bool, begin)
>>> +			     __field(const char *, function)
>>> +			     __field(int, line)
>>> +	    ),
>>> +	    TP_fast_assign(
>>> +			   __entry->begin = begin;
>>> +			   __entry->function = function;
>>> +			   __entry->line = line;
>>> +	    ),
>>> +	    TP_printk("%s()+%d: %s",
>>> +		      __entry->function,
>>> +		      __entry->line,
>>> +		      __entry->begin ? "begin" : "end"
>>> +	    )
>>> +);
>>> +
>>>    #endif /* _AMDGPU_DM_TRACE_H_ */
>>>    #undef TRACE_INCLUDE_PATH
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>>> new file mode 100644
>>> index 000000000000..d5d156a4517e
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>>> @@ -0,0 +1,64 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright 2021 Advanced Micro Devices, Inc.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>> + * copy of this software and associated documentation files (the "Software"),
>>> + * to deal in the Software without restriction, including without limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + *
>>> + * Authors: AMD
>>> + *
>>> + */
>>> +
>>> +#include "dc_trace.h"
>>> +
>>> +#include <asm/fpu/api.h>
>>> +
>>> +/**
>>> + * dc_fpu_begin - Enables FPU protection
>>> + * @function_name: A string containing the function name for debug purposes
>>> + *   (usually __func__)
>>> + *
>>> + * @line: A line number where DC_FP_START was invoked for debug purpose
>>> + *   (usually __LINE__)
>>> + *
>>> + * This function is responsible for managing the use of kernel_fpu_begin() with
>>> + * the advantage of providing an event trace for debugging.
>>> + *
>>> + * Note: Do not call this function directly; always use DC_FP_START().
>>> + */
>>> +void dc_fpu_begin(const char *function_name, const int line)
>>> +{
>>> +	TRACE_DCN_FPU(true, function_name, line);
>>> +	kernel_fpu_begin();
>>> +}
>>> +
>>> +/**
>>> + * dc_fpu_end - Disable FPU protection
>>> + * @function_name: A string containing the function name for debug purposes
>>> + * @line: A-line number where DC_FP_END was invoked for debug purpose
>>> + *
>>> + * This function is responsible for managing the use of kernel_fpu_end() with
>>> + * the advantage of providing an event trace for debugging.
>>> + *
>>> + * Note: Do not call this function directly; always use DC_FP_END().
>>> + */
>>> +void dc_fpu_end(const char *function_name, const int line)
>>> +{
>>> +	TRACE_DCN_FPU(false, function_name, line);
>>> +	kernel_fpu_end();
>>> +}
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>>> new file mode 100644
>>> index 000000000000..fb54983c5c60
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.h
>>> @@ -0,0 +1,33 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright 2021 Advanced Micro Devices, Inc.
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>> + * copy of this software and associated documentation files (the "Software"),
>>> + * to deal in the Software without restriction, including without limitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>> + * Software is furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + *
>>> + * Authors: AMD
>>> + *
>>> + */
>>> +
>>> +#ifndef __DC_FPU_H__
>>> +#define __DC_FPU_H__
>>> +
>>> +void dc_fpu_begin(const char *function_name, const int line);
>>> +void dc_fpu_end(const char *function_name, const int line);
>>> +
>>> +#endif /* __DC_FPU_H__ */
>>> diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
>>> index d2615357269b..d598ba697e45 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
>>> +++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
>>> @@ -37,3 +37,6 @@
>>>    #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
>>>    	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
>>> +
>>> +#define TRACE_DCN_FPU(begin, function, line) \
>>> +	trace_dcn_fpu(begin, function, line)
>>> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
>>> index 126c2f3a4dd3..2ba49aef370d 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
>>> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
>>> @@ -52,9 +52,9 @@
>>>    #if defined(CONFIG_DRM_AMD_DC_DCN)
>>>    #if defined(CONFIG_X86)
>>> -#include <asm/fpu/api.h>
>>> -#define DC_FP_START() kernel_fpu_begin()
>>> -#define DC_FP_END() kernel_fpu_end()
>>> +#include "amdgpu_dm/dc_fpu.h"
>>> +#define DC_FP_START() dc_fpu_begin(__func__, __LINE__)
>>> +#define DC_FP_END() dc_fpu_end(__func__, __LINE__)
>> This still has the issue that you don't correctly handle other architectures
>> than x86.
>>
>> I'm pretty sure the kernel bots will complain about that.
> Hi Christian,
>
> Kernel bots will not break because we are using CONFIG_DRM_AMD_DC_DCN to
> isolate DCN architecture. Currently, we support DCN on x86 and PPC (idk
> the details for ppc); in this series, I'm trying to enable us to start
> to isolate FPU code to a single place. When we start to move the FPU
> functions to a single place, we can take the opportunity to refactor the
> FPU code. After we isolate the FPU source, we can safely start to enable
> other architectures such as ARM.
>
> This is why I did not try to enable it for other architecture yet. I
> think this is the second step.

That sounds like a plan to me, but I have to tell you that this will 
still break the build bots for PPC.

>
> Thanks
> Siqueira
>   
>> Regards,
>> Christian.
>>
>>>    #elif defined(CONFIG_PPC64)

Because of this switch here.

You need the unification of the floating point handling from the other 
mail thread as prerequisite for this series if you want to avoid this.

Regards,
Christian.

>>>    #include <asm/switch_to.h>
>>>    #include <asm/cputable.h>

