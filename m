Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40EEAB8964
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 16:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F08C10E8C7;
	Thu, 15 May 2025 14:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HCwTG56V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D9D10E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 14:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv5yw3kEnRzbYTACYzGauc/05u+CxXhPSxmmxb90LVCt+nGL8S5u/y1hoDRlK4NU0WZnERVBu7JGX9dz6kLQpNB1Ci22aOijYFpeJJIMFmT9BPkwn9ca9EW5zoArgJpV8//UoTeqF/QTbJjCmZbkfSyihLOc0yQfMPde5DkWT84cyhlMm6a7ZOcVYxgOkUDzof7N99lRKZw8Q3hYyaHcXvJ/MGcj3RDKP4tWMy8FQxooDmAvsrur1xdOGiQehj6BdTwyqsRMQsE5bpVWbhI4jumbJ5LgQttL1bTURQyxRx/HI7ge0nZxEcgpOTXmGcEbCd06zkazdF3Q6xNjEABoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnFxfZ7+H/a3m10Zt29T3/3TOf8r8p6ZZNxkb0DPMJ0=;
 b=a3TmQgBMhGeMD7SWFbz/Hh/JRCVxr8yDsBpbxNbfTASZEqXt900zuK8EHuLdQoHCrScd6N9BcZO/NBAhKq4cOltjgBV/vIlqOxY/r/AE0ZJsRZhCGPpXdlVme7me4cl+RtlXvxi+xdxSUK+g36BNkYfJ9EWN6M0yvH1tA/sMm4325BSJrCkPpRIEXC0pONKHPgnKpp1+h31UL0JiLXcZ8wvnyylJxoVjBgsvRXLLKEGdgHhCFUZxL219AfWrEfrOlYjwOR/61euFVHUlvl0cHb7PLVdPSKumEBJyeIMIgc4aw+aw1xphgsG4UZZSTNpyOTo3Ym+gp34fG7U/1JKfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnFxfZ7+H/a3m10Zt29T3/3TOf8r8p6ZZNxkb0DPMJ0=;
 b=HCwTG56VdfW8CkHzVnRJdQN68ITPUWfak8HF9a78pm1nyjFSCst0DB7oD4gBUzTPi1cU0x3tU8QMI5581xS43miEpflxdaM8OCursznnR+KW7uKsDx7GtogAX6Ts4vFtyX3zyWnKch0Bfxubnzl/pMXpZZhNJn5WmPds8H1bvBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPF5C5D42165.namprd12.prod.outlook.com (2603:10b6:f:fc00::64f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 15 May
 2025 14:26:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:26:14 +0000
Message-ID: <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
Date: Thu, 15 May 2025 16:26:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2755aae2f1674b239569bf1acad765dc@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPF5C5D42165:EE_
X-MS-Office365-Filtering-Correlation-Id: 457a12d7-cd0b-4d77-4e9e-08dd93bc7292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RytpTWt2S29uRGUvUjIwSEZ0KzV4dmwrZDF1d01UYzA1SzJmRFdEbnJEb0tS?=
 =?utf-8?B?RTNDdzZSaXJiOVBpcEdqdW1tWWkvY004VEhCZVE4RUFTbExFVlFvdmJHU29m?=
 =?utf-8?B?ajNLQm8wSVhpcFV5RTJyaUthV1pUV2I3TEpmNVNXbkxvQWZEOHNVZGJ1QTBi?=
 =?utf-8?B?WWRVejUydlVEclRrMkt3bkYzcGl4WjlaUG41SFNNdXd1T2E1Um1Dd1MyNEdR?=
 =?utf-8?B?YzRFaXRlUFVwN0hreDJoczZRTUlKUDZEc25oK1BLWEY1M3lZM2RvZFZWNTVR?=
 =?utf-8?B?aTdLUGkwbW1XN1d1WDlLS2NBWUU4VWE0K2kxMXBOYjAyd0dzeHpEQ0Nsak5D?=
 =?utf-8?B?RWVWRHJ6ZDZMQ0MxWkd1cEdGUTFVU1krMnRlcnZhd0FCaE5DSU0yUHBnY2J1?=
 =?utf-8?B?eG5OSng5NEdMWjR5aS9ZZDJ0V3Jicld5VFhpL3RMYWlReS9QTUN5R0ZhMmIz?=
 =?utf-8?B?WkVRM1loWERXd2ErTWJQT1c4YWh4djFtNDU3SHdpdWEvV3h6eUpNK1Rra0Rj?=
 =?utf-8?B?azhGVVRscm03QTNpdVRTNTBDWkJLcUlsS0lXZytSK0UzMW5RSWVKNXMwaVlQ?=
 =?utf-8?B?ck9FYU5DaGJIRUxPN21ObTd5b0tjcVNIaWxBUm1GcC9LUzJodEk5cm5VUlhF?=
 =?utf-8?B?ZkVaVjNFMmUwaEJPV29BTlFGajBBMEtDQk9YdnNkT1BkWjB6WVA1V1JwRldv?=
 =?utf-8?B?SldNSG5FNzZJVzluVllwMVlob2ZLNUYrMTZuMllGWVNVVmJTb1p5WmhLN0Ru?=
 =?utf-8?B?TnU4ZUR0c3VTRDMxZCtpOTZtU1pxUFplTERybzlCYmt5MTdocXBmK0dzVTkr?=
 =?utf-8?B?N09QczNoWDBUb09jQW8rd0FXVnlzVWZWbFdpOXRmYWJVM2pYVXZCdmFFVm1L?=
 =?utf-8?B?OFNYTGVGOHAzaTVQWEhwYlNkUy8xbEd5YzhlYkN5bXlvSUJxVHdGVzB0M3JH?=
 =?utf-8?B?aDJrRENyUXd6Ull1Z2F5MlhCTXlJWTI4bkM0MWdwV0RlWE0rUXhyWDAyVGxB?=
 =?utf-8?B?ZUtIczU1NEFOUW9uZFZpNGlWSUUwRmRnUkVpbmdudjZSYTIzL3pZU1FmVDR0?=
 =?utf-8?B?cWFDYkwxTm5xQVM5YXQyYVJPMXZ1dlhxV3RqL0RJTVhkckplWnBNYnFONG9K?=
 =?utf-8?B?VjJnNDJVcVMyWXZNN0lKSXdMbnY2Zm1pYlRrVkRjVGhrTGNUeWVPdFF6WVZH?=
 =?utf-8?B?Z3BVbzZjaUZDMnZST3R2SHBDWG9naFRoYklIVlFLY1RndTEwNU1OMDdJTXpk?=
 =?utf-8?B?bUFzNzBBb2g5R3RhNnlMeTlRUHFOVlpFbEpvOE92NkwzWGp4M1pZS1JCZER1?=
 =?utf-8?B?RjFGay9ia2NGVWpoNndHVTZhc1l3V1VINUowRHByS1BVQ0gxNmlXMDFJek9L?=
 =?utf-8?B?T04wZzNySmhRelo1QkM4UXlraDhzdStoNXhNN0x6UEhLVHZnK0pPUHZKL3Uy?=
 =?utf-8?B?TnMreE0yZXJ1MkduV1pmMHJid3p5UDRGaFlPTWl0L0lTMjUxeDJEM0V1Z0Zz?=
 =?utf-8?B?bXFYUzNQUHRGVU1ld2tZM1RXVzNjQUJaOUNFcFc1dFdwUXAvSG9UdFRSY3Q3?=
 =?utf-8?B?Nmh2R3BIME1Ec2lKNzY2dklEMHFFWVRJNnBneTNTNStsNDl5Qy9adDFWQXhx?=
 =?utf-8?B?VnlSenpuUHJhd3RKRXNQK1AvaC9ub1ZsRlNvWnBaTnZtS091M2lablZyMWlF?=
 =?utf-8?B?YlE5VE8yem1scW5kbnUyN1NOclVQMWdoNitaajJhUTV0RXoyeDBKY0VFMWFC?=
 =?utf-8?B?cWdTU3F6VjlhejM5YjBiN1VkYzgwNFc2b3hJSW05d3REVHh6aGkwZ0NYdHZs?=
 =?utf-8?B?SUVVS3AyNGxBNTJ2dngvV3FlaXFJT00zWG0xQnYzZjQxdExpMUNUZXpxbHBL?=
 =?utf-8?B?Vk1IdW0wbUlsa08yN0pzVmczUDNwMmI2UUFLamtWdERpRzlsRmRNb295UXJR?=
 =?utf-8?Q?BCRfxsRvWe0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFUvalpyaWxUWWVmNHJQUmtnYXN5REo5YVJEeDU0V2dWQmlaWk5Bb3czWFk1?=
 =?utf-8?B?VzUrU1VJTVpaS3lTV3RUbldCdWhQRTZZV1ZUUDk5NjZoVWNFYkE5dllleCs0?=
 =?utf-8?B?YUVhaGlmcmFHNDdsWVl1ckovTHpER2Q1aHpUU0FteDljVFFHSExxanNhN1Ru?=
 =?utf-8?B?N0htYlA3WEtMWVk1SklXL0prMVgxQ1cxZWRKWEw5WkJEQXdHQnlZN2FxVGZW?=
 =?utf-8?B?ZFZ3Z1VaaUxTa2lxTC9YRFVza0plWEF4bktzdFRyY1E2ZXp5NHJYNmduQjBk?=
 =?utf-8?B?QXNZTnNaaFpUQjgzS1Y4UEptaXIxbDFvT2JyOHFwVTZ6TXdFWHFpT2ZiWVZu?=
 =?utf-8?B?SjRLcjVGNHZYT1ppL1Qzdy9rRFdEU0JUUk1pbm5lOG9hNjdCSlZtVGFnOXVC?=
 =?utf-8?B?akQwQlZ4VWg5UlJJRXZaeGNLUXQvMW55Uy91QXY0dlFEcmtmRmlHVFI4Ujd0?=
 =?utf-8?B?TDlUNUQ3dUhQN2tjK3BlTVRPT1o5VEZyYytsZm1HalhOcDNYVEl6RmpPUUJ0?=
 =?utf-8?B?Ukp6ODVac3BBSy9IcENDRGRaNDd3QlMraWFSSEhDMG4wL1hUTnAvUUs0bU9w?=
 =?utf-8?B?bENiTEdWRCttUW5rUVU4QXVTNHRrbmd5ZEZNL05nUWRmRUlReDVGazUrc09v?=
 =?utf-8?B?U0JMcW1UYkJxWENRVUxOSmdSUVEzRzNYQSthNExiYjBjYWFUN0pqWWNKT2RK?=
 =?utf-8?B?L2dGUnRmNjBYMjBsd21GYmhxdUZkT0w1UTdOSUhZQlBVbUxkSUw4dVRGNEJy?=
 =?utf-8?B?R3BJQ0grek55dGo3SHRoOXF2QWg2aEJpRVlWU1VWb21hTkxpUStNRndqQk1Z?=
 =?utf-8?B?NjlOalk5OVZ1dVlYWFRoejBmWkxjUFdsSCtKSFA2L29TMVZBQ0dubWtJTVFW?=
 =?utf-8?B?VmFtM1J4TnhXcTN2QTRpVnMwRlUwbVdhNGsrbFFoMXJheTlaZFhFc2hQMWVa?=
 =?utf-8?B?UTRCRVpmVmE0S0xQYXdMYk5qS1JQQUhNNnROUlZlWEFwa284TDRPRHJYdHYx?=
 =?utf-8?B?MUIxVksxdnNUbS81RkhwTXMveVpSUzJNdFVmTmxWbFUwL1VsKzg1SWNoTXhn?=
 =?utf-8?B?L1U2R3pROEM4eWRZMFdaWGUxbE1WbHhTdEdrRlNsQ0N6b0Iyelh1bEsvSEJw?=
 =?utf-8?B?ekJSSThQd0gzSHF0SGhYSW9ob05CYlBKWG9rVjA0SWFFeWRaNmI3Z3EwZXRW?=
 =?utf-8?B?VXJIeTUwby9VdFZGaDZvZk5OdjFPcmErZ2ZBc0I4a25mWG1jWU9PTmNFM3dM?=
 =?utf-8?B?Z1Eyc3R6ampOd0pQSTBaellsdURkdXlyNGhQMSs2NHdIY3UwR0tOTkNYWFBF?=
 =?utf-8?B?N0NteDRUTUJkcFUxUEhlV1hmR3U0RjEvd1UxUUVGTVFBcEVnbUdVbmlJNXdq?=
 =?utf-8?B?TlZuRHh3ODNERHQzYWRQTUpHSFFSR2o0RzFraVZQV2Z6QWxPUXJkd3oyb0pN?=
 =?utf-8?B?YlRVKzlGQ0JrQnpZMjZKNWluWEtINlNNVnhTU0NsU3MzdWRwZnB0Q2w1Mkxm?=
 =?utf-8?B?RTBLQXpWclczdy9nYjlDOUFmcnlMdFJvMFZLVFB3c0xUcXEvOHF4dzlrTUFz?=
 =?utf-8?B?TncrYWxVaGtkN2d5WDROQWJQUXl2Rk5aT0dZcEt5RU1jcTQxUkxFQ2VqZ01x?=
 =?utf-8?B?WEZvZTdTS0I1R0pnSEhpemFoSE9YQU5ha1YybGl2NGFqZzVraGtIR05hZHBw?=
 =?utf-8?B?STBTUC9LZWpIYmdiUWpQVjVYK01HOC94c1AzV1d3SkpKRWh4dUd3c3llK2t2?=
 =?utf-8?B?QTlmT3BRZlBka2ZoSzVzQ0VMeWZuQ2NIWGtqd1E3SXA2cWtmYnZ1cHZBcjJY?=
 =?utf-8?B?blh2UlpGS1NiMElxNVMwZk1IYTU3aHpneG1FNFp1d3A3OTdBRWxkV0pnWmkw?=
 =?utf-8?B?aENNaHJqdmR0aTV5bktiN1RkRGo0QlBBY011S0IrdW15cGloMHRoNlZXQWZ3?=
 =?utf-8?B?MUtvYnFuVVU4R3lvOFk0MXViWlpRNE8yL2Z6c0QxYzE5VTQ4NGQ3Nlpwc2RS?=
 =?utf-8?B?MjhObmE4TnZ4Zmg3K2RpSmx0RUVLZW9hREhHUEM1YzVvcjRVelFMcXlwWGtL?=
 =?utf-8?B?WHp6bE8zRUtleUl4SmdDTEYvSGkyQ0k0bUV3VWRLNEJzYlhMWHpUQkZxNE5o?=
 =?utf-8?Q?mErBurIZSB4ZO7ePkz20Z9DoP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 457a12d7-cd0b-4d77-4e9e-08dd93bc7292
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 14:26:14.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88n8MJTNFSofDXPRaTUHh2kz/wb+5Znyp/3tOVqNO5oe0jHuOLgs+vH7TwI7Y0E2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5C5D42165
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

On 5/15/25 16:03, wangtao wrote:
> [wangtao] My Test Configuration (CPU 1GHz, 5-test average):
> Allocation: 32x32MB buffer creation
> - dmabuf 53ms vs. udmabuf 694ms (10X slower)
> - Note: shmem shows excessive allocation time

Yeah, that is something already noted by others as well. But that is orthogonal.

> 
> Read 1024MB File:
> - dmabuf direct 326ms vs. udmabuf direct 461ms (40% slower)
> - Note: pin_user_pages_fast consumes majority CPU cycles
> 
> Key function call timing: See details below. 

Those aren't valid, you are comparing different functionalities here.

Please try using udmabuf with sendfile() as confirmed to be working by T.J.

Regards,
Christian.

