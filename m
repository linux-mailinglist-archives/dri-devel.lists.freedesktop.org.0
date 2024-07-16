Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F76932634
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDBE10E68B;
	Tue, 16 Jul 2024 12:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gRUDObie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C21910E68B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngDGn2xHZN4Ta9Y/Pxp6+dhg5Agw2KR4JmxxbP9ziDfQWAi7TpRkyZSnXtfHTM60xh5huqYEAJVh0gy7VMeGOr7zbKCyYhTnbDyHSXSBYpfWdS5fpfue4q0E15ouneeieMXDbVSREKo/5eVp7Wj1HhNt7ODf8JtQHRCSjR2b2JJpot0UTtr6Fa6S1H0P2g2F/3DKMAKCwFFjRhS2CfGw8HbYBgb6s/5yquVnbWBS1ZpHVh4YtSD/wSAnvyc5heSd6QZUqTqpMFhd4a9odHvLtbxXLVAQlWKhsXezRFt6oj30AXNulIAs/MhmVasYqLGOUWUQZtBE0qwVz9xzG+OP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqVCtoy8HHHsrufcKChlmZaC42u0DTdB3Bxv73LBqY4=;
 b=RgOmQBMDwb/bC1TD7afVhE4gjh6pj9m12TWIc/SuNkCbKpG2B2aLyTlBUuEeO6nOLajz4ibTbfGDk+ZHRYspXKxRHEbXF7jN+zWQn4T1CGQmez5Lb07sfAK/xLvCDuS7bZ2NDida9pmfxWtcYBTlSgJ5eHVXoDJkFDX/PfB2J5/Xb9eMo3hky6bu4MxlbHl0sE8/kqFAow0RefaWRo1ALyTl7Z2vZHaCLCsD7rGcnfY39kc6lMFiNVpIJwqJ1rw1yDFWIkmX/uExFdhJfAd3QAkybxLpkJ5Y9n7g12aKhpuhmgjLnv03q9PSOC1dhcuND/+T7iP0W0QKfiWnzvIO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqVCtoy8HHHsrufcKChlmZaC42u0DTdB3Bxv73LBqY4=;
 b=gRUDObieLuyvQtgx7l9B+Mf2IH4AX84+3Ot6kAPSBZ3lpsJpGSI6GHbuSm5HPgHlNog37LCCd+YgvppOsgMphyH5aJNIdVIf6Jx6JYrGY75WVTet3VN5LbmKbjoTWcywqy7iAATjtWh3iUsMgUblaC1f/mJIWosa+guaPehXO18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 12:07:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 12:07:27 +0000
Content-Type: multipart/alternative;
 boundary="------------sM5TImLdZNsao0x2zJkRUKrG"
Message-ID: <d3ad46ea-df7f-4402-b48a-349e957f198b@amd.com>
Date: Tue, 16 Jul 2024 14:07:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <ZpTnzkdolpEwFbtu@phenom.ffwll.local>
 <99364176-a7f0-4a17-8889-75ff92d5694e@amd.com>
 <06713006-c5ce-4773-a1b3-ca3bea56ee45@vivo.com>
 <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZpY-CfcDdEhzWpxN@phenom.ffwll.local>
X-ClientProxiedBy: FR4P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: c1844897-6f33-4ef0-d591-08dca58fdbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTM5VGRPQXI3WEw5YlBUU3IxWGJtS0FOZm5aUi9IWk5SYW9EMDdrZW13V2RH?=
 =?utf-8?B?eU9PNGxxRzF0M2E3eXFQVnhFamhlQyttR3MreDhFbGg0UmhxV0VoOSt3RHRw?=
 =?utf-8?B?VDNDS3VuSFNabDRnU0lhRkg4T2NhelFQUmluYnRpVTJJcFJnbTFwb1lYR1BQ?=
 =?utf-8?B?b3VTS2VLQ25WY01Ed0JrdmNXcFRXN2hhWjcwanNWZ1ZCakpGd2FwREZweTlq?=
 =?utf-8?B?SzV3SDViWkpjYWRuckVPNlJzWEZVbENpTURBbzZJZzFkOENEV3RIOC9JVXVY?=
 =?utf-8?B?VWpQUGFQcnNJb1dIb1c3ODVIY21uRzF5YlJod1o5S0RyajJleUZGUU9ZbjBu?=
 =?utf-8?B?NUJoZ0Y2c016WUxWTEx6VlEwWFFYcUMyWWlPZXJyU1h0eVk2Y0NZVFp6clVl?=
 =?utf-8?B?Kzd5KzBiMjZ0L1oxWVhwK0RlSmhuWWQwa2hrSStPaytqc1ZRNk5JNEd0Vkhn?=
 =?utf-8?B?ZzczbzBoT1VCbWlSL1ZMMmJuRi9GK2VzTWFWbktaTGF5dUlXbDB5SFhtV2pm?=
 =?utf-8?B?TlB2dGljcHlDREs1OVJPc0E1VEVHOGt3SVNXUXlUZDIvTm5UTEtjcUNZQTRG?=
 =?utf-8?B?RlQvL2swTit0TjZPQW9xZ2VwRFpNa2wvNjF6U285ZktBUUZYV2pXNDZSSTNB?=
 =?utf-8?B?YUtHcGY2YTdGKzc3YS9IWXlNUGxWVzE4eE5xMHNRYTdwTEpuZi92WGNhSFhn?=
 =?utf-8?B?RjBQUmpqRFhNMVhONFVWSmxiVGlkbFlERVVxTk9XTGl6eGNJNk1xSjkzb0dY?=
 =?utf-8?B?YjN3VTlnYnhMU1lpSUN3TVFsR2cra05NWWlIaGM5YUFnZENHMjQwbHdPdDNm?=
 =?utf-8?B?WW81Y2pUSGZCL2MvWXdPTDBSQTlNM3p0WlFRRkpkWE96LytxSnRCd0FSS1po?=
 =?utf-8?B?aWlYWHhra0F3bGFxOWRiMjFrV0VwTzdUajl5RXU4TFI5Ym54cHUxQ0cvczU1?=
 =?utf-8?B?VkZpUGR0T1JJZGdHa1hHVklMeWFJSHZHeE5ZdnlFeUJMVUJ2Rm1NcnJWWkZh?=
 =?utf-8?B?THpSUjJKbVpaa2JuazdwUTZkb2ZKVGRJNVplVU5lbEFod0ZXakNhdE82U25E?=
 =?utf-8?B?bGxMaFV4bU9ucDViTmtCYjVHdmMxYTN6Njg0V1o1ZkcwbCs0ODV4UEMvWnJs?=
 =?utf-8?B?OVdYNzUyTEFmOWR5ZDNSNGs5VTJqNTJtVFRTYnZxdlliVTk1WWp3Y0J5LzI1?=
 =?utf-8?B?c0dtV3pPSlFqODJMVk1xeFpObCsyVDdSU3NiM1lrbFgyNDdad1MxanN2Unha?=
 =?utf-8?B?S2pKMllxZ3VhU2lzWjJ3cE5PWkVSZ29UQWdoZFV4NUcvTnlhSEVnZUhPRFE3?=
 =?utf-8?B?S2JUK2FpbEtsaE15N0twUEo1aXdDMlk4cUp6cm9wZVdoSTdvbU4wdmMyNXV0?=
 =?utf-8?B?SDBxSUEyNjIwNXpwQklUV3M2cHdMQnRtY2Nka2JQNUg0dlpXUGFTWFdzYzd2?=
 =?utf-8?B?dGhLOElSQW9hQWYwV0FueUMwMVZjRVp6RlZHSjJiUTBtL0s3bzZVb2pheXh5?=
 =?utf-8?B?RnBaK1NuVFBVMkRvVG1kc2lFbU9sLzVYa045a0hHSVQ1YmpTbTVmUHk5bnBo?=
 =?utf-8?B?RGVTbmFCUUNFNDBtZ1N3OWsrMnhFQWsrZzErWlk2Qk5ONWpzdUJVU1pjMWYw?=
 =?utf-8?B?R094OFJ5VmwxS3dkT3RqRkdtV25uT3hxV011SWREZExkL2Y0SkpBR2JGRllL?=
 =?utf-8?B?c0JuUVF1WXMxWUJXdi9hdmVyamFsd2ZQMEQwdjBoN2haT2hIbVlEcndDTmdz?=
 =?utf-8?B?YXhST3huOElldU9WZG4xSEhwaEkrQ1o2ODBic1YxazNpKzgrM3p0TVpPaTQy?=
 =?utf-8?B?M3JZblI5N0JZRVJHY1pBa0tEVkNhQmJndGcyUTVRbVliSHprVnZxRkc0bmtF?=
 =?utf-8?Q?/eYKQ43vTq8JY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnBjclg3dnZmd1ZnK3hQczlnK1hMVXdESDkycFJIWW5KbnlEN1hrc09rQW5B?=
 =?utf-8?B?RjQzMDZac3pQVXVxVGh3djU3ZHgrMmx0RWtsMGdLS01ML0dzYk5rcjJSdFdu?=
 =?utf-8?B?WTBRNVlvUDZwYk0xMnAvOFZ1K2E2czdQM0h6cGNhSVpPaFF5SjNTN1pJd2No?=
 =?utf-8?B?eFluR2lpSDNRT21zNmVEV2pjUzRKYjhORVphRTRkRS9sZ0N1NkhsSnBNT1hu?=
 =?utf-8?B?TVd0M3FLbmRzNzJYQUZYaS8wWXdmeStQMEhjZ2NqdU1kZDV5UzNzSVRmS0pQ?=
 =?utf-8?B?WXhSRkZZQ21xalpmajJGQWs4bUozYUR6WDkwWjd5enRLYzAySzVPVUFpS051?=
 =?utf-8?B?SkpySVdoQXJqZ00reGpmSXVsRERFOU1hNFFxbDJhVUwzcVhWUnBlOFo0ZkIy?=
 =?utf-8?B?KzZ6YzhacGVQVllGUFVYcHFGZ2ZEVG9HdXY2WDUwcDd6Q0pDWU1Uckt6dWZY?=
 =?utf-8?B?WFM3eXZhTGMrREJwOXU3b1VILzY2SmNjTEVtaVdWZEtSVEtvOUZFZ01OR0x5?=
 =?utf-8?B?RlNpVDlQM1kyZkZXR0dJalhyRjZlcndYWnh0NXRhdVhvMmFPa0dhZzdhUHZi?=
 =?utf-8?B?YkxqTWh4Q1FjaVlXOVUvODhGMzB2UWpyYy84bHZwTllEQVp0QVloWGxVcVoz?=
 =?utf-8?B?K21tK1ZHc3NCaGEwakh2MElNQWwySGdWVU5BME1SSFJHU3VMbXdpRUlvZ2JX?=
 =?utf-8?B?TjF0QTByWjk3K24xTHNaTHNYWUdRSWtadWNaRjZDWm1WZjRoRkxydktvYU15?=
 =?utf-8?B?U2xtaGRGSmhvNlF2NWNJQnNxWEcwODZuamZ1KzdMdC9CTllLTkFPdUJTaU4z?=
 =?utf-8?B?Tm9odFh3czNvd0ZiR2VJbGRlUzJmc2dmTU5tSDhNTmw5ZlVZTVhzWWFVemVz?=
 =?utf-8?B?RURIOStaRzF4SlVaOG5OMnIrbTFkUUV5K1lRbW54VlhwZzFxN3BWcGxsNjgv?=
 =?utf-8?B?UGwxNWp6REdsQU1mMXlCdUIvcTQrajM1WjFMV0xJRW9YemJLMEdLbDRzTkRk?=
 =?utf-8?B?WXVJSEtYNHFuZHRTQ2ZxamtVZkhVRFBCU2Q2b3Y3OEFzdEVyd1RyOFVDNWlP?=
 =?utf-8?B?N2pEMUlESXQyL1RSSjVLZmhoQ2RpM3o4Z3lvUFBEb0NMK0JwRjJYSTVBd05j?=
 =?utf-8?B?VktuQ3gvais0NkJ1NWQ0ckpnc1pseEtVZk92S2F4c28vb2hSTGtrdGdoSjY1?=
 =?utf-8?B?dTl0YXFvcFFMdTJNWDdGMHhNZlBRR2M1c3BOOWtQTkh3UEs3c2JWR2FhcUlx?=
 =?utf-8?B?NlQvY0pFWTVWQUlrZTdKV0tPTHNLRjR4azZoSHB3QWdPWi9xSVFoU0hNZ3BW?=
 =?utf-8?B?L1E3RS9NQStvdVpmaUZYK25RMlVpUzZsS0lwV1ZoRUZzWU9jWEgzeEZFNS9p?=
 =?utf-8?B?YU1EUFRLa0tUWThaMkpDVE1mdHpOUVE5ODhMMHlLeG8xNlF0SjVZeW9xem1V?=
 =?utf-8?B?NHpkNjR5YWU5ZUNDZTUzekJpUnJRdHpjUGJFMFN0S211bE5UZjZFRnM4NEh2?=
 =?utf-8?B?c2gwby94SU9VNUczY3ZtVlRpTTF4YmxMWDVLZTQ3b3RMeEhMckZmN0VQcmlx?=
 =?utf-8?B?OTZXSEVTakNFVTd5eWVDVzE2Y3ZhSWorb25YSkk1b2JlbXdjeGJvR0p4a05D?=
 =?utf-8?B?L3lObllveXhMaDRnSXV0cHNtSFVweGRTRkMwOGNYcTRNUnBKMUp5QkFwYUdW?=
 =?utf-8?B?ekhWWDFWYnB5RWlhazdaQ2kxYUdLYjQ4Q0xxaUF4eUdibURCcXVQZGUrKzFw?=
 =?utf-8?B?VGwweXNOSjdSaDRUZGNlaDIxVWtKa2V0WkJ6QXhpMDlVek54VmlFcVhnOXRX?=
 =?utf-8?B?alFTSS9YaktTN1V2RWR4QTB6QUlxMVhHZGpSbTBrZDF6ZTAxVytPNnZqUTJV?=
 =?utf-8?B?NzJCR1dZcS9LaHhoaEZMZFhib2RsbEN0MlhsblVPZWdTVEtyR0pwZ256bEZo?=
 =?utf-8?B?Um5XRUljTFBiOFNaQndXdk96d1hObTVWclZpdVcvcFFiNk5kUzgrMUZCWW5G?=
 =?utf-8?B?d3FPV1A3U0RtQ2pMT2xQRCtuK3ZuTGl5OE9RaHR6RVpUc05XN094YkJtMUtX?=
 =?utf-8?B?Y292WHhCODRUVGxxc2k1QnhhaDI5L1JtR1oxcGMxNGJsUjRXemdQQm5QVG1o?=
 =?utf-8?Q?CF1Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1844897-6f33-4ef0-d591-08dca58fdbef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 12:07:26.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os1qn3aFz92lMy/L/XUl8Ve4a2PD9r1aOlRcblvK/FJKKEnu/g73HKq9xn7YXSOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722
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

--------------sM5TImLdZNsao0x2zJkRUKrG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 16.07.24 um 11:31 schrieb Daniel Vetter:
> On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
>> I just research the udmabuf, Please correct me if I'm wrong.
>>
>> 在 2024/7/15 20:32, Christian König 写道:
>>> Am 15.07.24 um 11:11 schrieb Daniel Vetter:
>>>> On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
>>>>> Am 11.07.24 um 09:42 schrieb Huan Yang:
>>>>>> Some user may need load file into dma-buf, current
>>>>>> way is:
>>>>>>      1. allocate a dma-buf, get dma-buf fd
>>>>>>      2. mmap dma-buf fd into vaddr
>>>>>>      3. read(file_fd, vaddr, fsz)
>>>>>> This is too heavy if fsz reached to GB.
>>>>> You need to describe a bit more why that is to heavy. I can only
>>>>> assume you
>>>>> need to save memory bandwidth and avoid the extra copy with the CPU.
>>>>>
>>>>>> This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
>>>>>> User need to offer a file_fd which you want to load into
>>>>>> dma-buf, then,
>>>>>> it promise if you got a dma-buf fd, it will contains the file content.
>>>>> Interesting idea, that has at least more potential than trying
>>>>> to enable
>>>>> direct I/O on mmap()ed DMA-bufs.
>>>>>
>>>>> The approach with the new IOCTL might not work because it is a very
>>>>> specialized use case.
>>>>>
>>>>> But IIRC there was a copy_file_range callback in the file_operations
>>>>> structure you could use for that. I'm just not sure when and how
>>>>> that's used
>>>>> with the copy_file_range() system call.
>>>> I'm not sure any of those help, because internally they're all still
>>>> based
>>>> on struct page (or maybe in the future on folios). And that's the thing
>>>> dma-buf can't give you, at least without peaking behind the curtain.
>>>>
>>>> I think an entirely different option would be malloc+udmabuf. That
>>>> essentially handles the impendence-mismatch between direct I/O and
>>>> dma-buf
>>>> on the dma-buf side. The downside is that it'll make the permanently
>>>> pinned memory accounting and tracking issues even more apparent, but I
>>>> guess eventually we do need to sort that one out.
>>> Oh, very good idea!
>>> Just one minor correction: it's not malloc+udmabuf, but rather
>>> create_memfd()+udmabuf.
> Hm right, it's create_memfd() + mmap(memfd) + udmabuf
>
>>> And you need to complete your direct I/O before creating the udmabuf
>>> since that reference will prevent direct I/O from working.
>> udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
>> (same as dmabuf). So, must complete read before pin it.
> Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
> rdma folks would be really annoyed if that's the case ...

Pinning (or rather taking another page reference) prevents writes from 
using direct I/O because writes try to find all references and make them 
read only so that nobody modifies the content while the write is done.

As far as I know the same approach is used for NUMA migration and 
replacing small pages with big ones in THP. But for the read case here 
it should still work.

>> But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
>> need suit it.
>>
>>
>> I currently doubt that the udmabuf solution is suitable for our
>> gigabyte-level read operations.
>>
>> 1. The current mmap operation uses faulting, so frequent page faults will be
>> triggered during reads, resulting in a lot of context switching overhead.
>>
>> 2. current udmabuf size limit is 64MB, even can change, maybe not good to
>> use in large size?
> Yeah that's just a figleaf so we don't have to bother about the accounting
> issue.
>
>> 3. The migration and adaptation of the driver is also a challenge, and
>> currently, we are unable to control it.
> Why does a udmabuf fd not work instead of any other dmabuf fd? That
> shouldn't matter for the consuming driver ...
>
>> Perhaps implementing `copy_file_range` would be more suitable for us.
> See my other mail, fundamentally these all rely on struct page being
> present, and dma-buf doesn't give you that. Which means you need to go
> below the dma-buf abstraction. And udmabuf is pretty much the thing for
> that, because it wraps normal struct page memory into a dmabuf.
>
> And copy_file_range on the underlying memfd might already work, I haven't
> checked though.

Yeah completely agree.

Regards,
Christian.

>
> Cheers, Sima

--------------sM5TImLdZNsao0x2zJkRUKrG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 16.07.24 um 11:31 schrieb Daniel Vetter:<br>
    <blockquote type="cite" cite="mid:ZpY-CfcDdEhzWpxN@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Tue, Jul 16, 2024 at 10:48:40AM +0800, Huan Yang wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I just research the udmabuf, Please correct me if I'm wrong.

在 2024/7/15 20:32, Christian König 写道:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Am 15.07.24 um 11:11 schrieb Daniel Vetter:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Thu, Jul 11, 2024 at 11:00:02AM +0200, Christian König wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Am 11.07.24 um 09:42 schrieb Huan Yang:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Some user may need load file into dma-buf, current
way is:
&nbsp;&nbsp;&nbsp; 1. allocate a dma-buf, get dma-buf fd
&nbsp;&nbsp;&nbsp; 2. mmap dma-buf fd into vaddr
&nbsp;&nbsp;&nbsp; 3. read(file_fd, vaddr, fsz)
This is too heavy if fsz reached to GB.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">You need to describe a bit more why that is to heavy. I can only
assume you
need to save memory bandwidth and avoid the extra copy with the CPU.

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
User need to offer a file_fd which you want to load into
dma-buf, then,
it promise if you got a dma-buf fd, it will contains the file content.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Interesting idea, that has at least more potential than trying
to enable
direct I/O on mmap()ed DMA-bufs.

The approach with the new IOCTL might not work because it is a very
specialized use case.

But IIRC there was a copy_file_range callback in the file_operations
structure you could use for that. I'm just not sure when and how
that's used
with the copy_file_range() system call.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I'm not sure any of those help, because internally they're all still
based
on struct page (or maybe in the future on folios). And that's the thing
dma-buf can't give you, at least without peaking behind the curtain.

I think an entirely different option would be malloc+udmabuf. That
essentially handles the impendence-mismatch between direct I/O and
dma-buf
on the dma-buf side. The downside is that it'll make the permanently
pinned memory accounting and tracking issues even more apparent, but I
guess eventually we do need to sort that one out.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Oh, very good idea!
Just one minor correction: it's not malloc+udmabuf, but rather
create_memfd()+udmabuf.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hm right, it's create_memfd() + mmap(memfd) + udmabuf

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">And you need to complete your direct I/O before creating the udmabuf
since that reference will prevent direct I/O from working.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
udmabuf will pin all pages, so, if returned fd, can't trigger direct I/O
(same as dmabuf). So, must complete read before pin it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why does pinning prevent direct I/O? I haven't tested, but I'd expect the
rdma folks would be really annoyed if that's the case ...</pre>
    </blockquote>
    <br>
    Pinning (or rather taking another page reference) prevents writes
    from using direct I/O because writes try to find all references and
    make them read only so that nobody modifies the content while the
    write is done.<br>
    <br>
    As far as I know the same approach is used for NUMA migration and
    replacing small pages with big ones in THP. But for the read case
    here it should still work.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZpY-CfcDdEhzWpxN@phenom.ffwll.local">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">But current way is use `memfd_pin_folios` to boost alloc and pin, so maybe
need suit it.


I currently doubt that the udmabuf solution is suitable for our
gigabyte-level read operations.

1. The current mmap operation uses faulting, so frequent page faults will be
triggered during reads, resulting in a lot of context switching overhead.

2. current udmabuf size limit is 64MB, even can change, maybe not good to
use in large size?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah that's just a figleaf so we don't have to bother about the accounting
issue.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">3. The migration and adaptation of the driver is also a challenge, and
currently, we are unable to control it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why does a udmabuf fd not work instead of any other dmabuf fd? That
shouldn't matter for the consuming driver ...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Perhaps implementing `copy_file_range` would be more suitable for us.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
See my other mail, fundamentally these all rely on struct page being
present, and dma-buf doesn't give you that. Which means you need to go
below the dma-buf abstraction. And udmabuf is pretty much the thing for
that, because it wraps normal struct page memory into a dmabuf.

And copy_file_range on the underlying memfd might already work, I haven't
checked though.</pre>
    </blockquote>
    <br>
    Yeah completely agree.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZpY-CfcDdEhzWpxN@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

Cheers, Sima
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------sM5TImLdZNsao0x2zJkRUKrG--
