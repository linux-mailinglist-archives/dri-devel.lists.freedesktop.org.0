Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702DEA91617
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82810E18F;
	Thu, 17 Apr 2025 08:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GC9OfJ9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AB10E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:06:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhfQEKNkMWXfLR2Wb3exW3Vn/BcGX+lPqHUzXDPUfodQtYeRyxzKMjFGiGznaXAE+yP/Vj7G710Kme88NrY9i3OafNR3hdGW6JlNBkIvfrQ//epQYqe0nudc3rB3MH1/HjUEy7V16k0u9znHstqsXgv7ID32U+bA7e5Jzhu1kPfGURVjj5XLUMBwpER3rGpH4PNGbXyQWjE++op2eBA0Q0kpiDaFbQ4DpTDq2+sxE9zgI/60SOfB0w7mSAmi9w8fzr6pVtgo3AxUq0iv0rYerCmcp0dPPrWTYH1T2xCz+W3n88B3P2a5vg/5DdLe0bE+dtTjicxbVcC2jGIZNlXvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/by4yEUBXfSR4EgKS4Oa9xf+6LyBJan/unodA1zUsA=;
 b=OwIWzUv0MrAH26MLR1DX6A5q4fXGF210QtWppkaNw1tbMlsN58reEifitFikF2RDuRaFBEcXpSQo/lkxP9B09Ky242sMfSexlMa+Dy1RrTxldYz7oZ0g+Io0LYq4CWAXXM7o43uuAyG1Bv8/h7iUl/df5IZDRPzkW/2oIwz2sA6wQKBaLHzcfRtATVpCmiPeLz8wva793aGp1EOEkzwydv+dR15j8ZJKIXFR5N8KFHMME3oNfb6Uabw8js92FE//7IolhCE3s7A2Z1VjqMhuyMHfDqNWWsPYIKePt4/kxWHeOlvKOuss8rTlk8mO5kccfDyooTCVnTET0vZMZWAR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/by4yEUBXfSR4EgKS4Oa9xf+6LyBJan/unodA1zUsA=;
 b=GC9OfJ9LQiJ6cDQY9ZgzFCT43pHxUg6ltlQLBf1K99TqgaJR0HLhN6aqBqMCAerIDeQmkcrXZX6mEj0ysijvgWKaeyfmvqkPB6MRl5mZw3LYiFYDK+V+34DRiGQ960DXEOXE/DqjOWqJuFnN3vn3/9/s+EOjWatXkRsAKqtms6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 08:06:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Thu, 17 Apr 2025
 08:06:44 +0000
Content-Type: multipart/alternative;
 boundary="------------Zt9qnF0CCBHZCJmBn3xLB8Wh"
Message-ID: <21cbda3a-1997-4ac0-ad5d-6e6d447fc11c@amd.com>
Date: Thu, 17 Apr 2025 10:06:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, baohua@kernel.org,
 dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com,
 Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
References: <20250415171954.3970818-1-jyescas@google.com>
 <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
 <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::19) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 6693b984-8b0c-441b-8975-08dd7d86caa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1hRU3pQd20yQll4dkY5aC9RODFIRW0vOSsxWWpoemN5dGgvc1VFekI3eXBO?=
 =?utf-8?B?bWF2eWUwQUtGS2xsNDFvb1NWbmc3M0NWOU1Fam1NNWlseHViS2RySWpzZkFM?=
 =?utf-8?B?YkFkWkY1MEt1SVVwQkEvaW1WOVovZEpEWVp4dFlDVGtJLzhOTWxreFZWRy93?=
 =?utf-8?B?TEhJNmZhZTExeENibWpDVk16dFdjS2d5aS94R0tWVzBCVTM2WVloWk1KZEU4?=
 =?utf-8?B?NURoWGJrREVLb2lNckxYYnREMVM3Y2J5aUxjMVNTbktPdlpsbjFLUGVmMnA0?=
 =?utf-8?B?VjJodUR2RWtBcWI2ck9rdGJMVDN4TGlUS0VaQ1hDazJKOHVKa3JKS2dabklE?=
 =?utf-8?B?RjltWmlHdmJ0dUxlZklrZmZNYnJPNjM0MnV1ZFU0WDlxb3dlL3J3NkJHYWpY?=
 =?utf-8?B?L2U2Sko2blpxN0tzRVEzLzBlM0NVeVJtZnF3ZEZ1SDVHQWJFZTNaV1BOMDlR?=
 =?utf-8?B?RzdwWmpkRm1yQWppcUdSSkI3Z29GRW1keVppTk12NWF1cHZjYkRsVjFnSHJr?=
 =?utf-8?B?NXpEMm9JM3hSczRHd0RsQlI1MStBK2dsbjEvUVk2b1hXZnpYV3ZSUTl0Mmlo?=
 =?utf-8?B?c2V2aFpmcFhMZ2hWSk55cFZBK1p6aFdTWFFWN0NuS3BPS1hFQjF2QVRML2ly?=
 =?utf-8?B?bjFyUklURzlNaTJIZkN3VXRaYWRRSjdIRUxYUUZWb1dqRjVPd2hXb1ZxUEM2?=
 =?utf-8?B?OGlPaVRQUFRCNUQ4dlpTaHpJWS9HY3hjaUM4SXdkYjZtWUxBU0dQSytBVUpz?=
 =?utf-8?B?dUI3WjBZdmo4RkwvTkZJTjRsamZjRjBCMStNeFNyVDg1Tm40Z1lHQjZLV2RR?=
 =?utf-8?B?QXk2WlBSSDJickw4S0ZoT0ZYNnBoK0g3WW9FNTVtN3duek9VWHp5NE1TaXpj?=
 =?utf-8?B?ZDNaTUFUeGI5Z0JhUTU4S3dBbWlRays0VjE3L2dPaGZDQUtqbWV5bVd1elFZ?=
 =?utf-8?B?MzdYaGovcVlWcVIwdUFZOUQwRkx2S2RnNkFzKzExM3RjeXNkdktLMVI3R1pN?=
 =?utf-8?B?elkxRUQ3NGtiYSsxN281UmNOSXB4eW02NWwzdlBSYjRzRnhuZlkxODE3RVg4?=
 =?utf-8?B?M1lNUjBLR2N4bktDZ2VpUm4xWmp2M2dub2t2bjFGdGZvL2drM25LZkFxLzNx?=
 =?utf-8?B?Sm9INDF2Zzh3SzEwMHVnOUZEb0xZY1Z1MDlxQlVhem91TE4xSU5WQ1VQeTRW?=
 =?utf-8?B?bDR5TDcwK0Jra2k5bWxkVGs5TUdPa2t5Mk41YkphakpFSVpuWVNUcGxFdDRF?=
 =?utf-8?B?U1A3ZHYzWm14ZVF4aWxIOW5rZldLdkdZb2tTWVZBSUFkQU5wTGFmdkQ4WG1I?=
 =?utf-8?B?akJ6NTE5aFMzMjlRaHdPRW5FSlpzVXJjKzNHa3dyNGp4WWs4YUtROHU2SnlR?=
 =?utf-8?B?YXEvT255TEFqbFpBSDRIWWIxZHlJcmtxNGxJeW5Ja09XQ05uWnlNYk5ZNXZn?=
 =?utf-8?B?TEE3ck1SS1hLek5Ed0drcTJuMkFoRU82WVdIeklGeVl2cFdXUHBLZ1pTUGxH?=
 =?utf-8?B?WjVQdEpjUkt3bGNPVytsajI3MXM0MUx1Zm5QU3d4SUhpYVJ1WXlIWlR2Rmw2?=
 =?utf-8?B?UG00ZnAwSVMrS21wblVoNlc5cWlLRTlZdmVNVjNzYUhUa0pqalVVYmwwQmtx?=
 =?utf-8?B?UUtyMDdGUXlqcWpENW9JSHByN2I0ak1vc0hEbXZDdTNRVE55OWMyYldNdXA3?=
 =?utf-8?B?bE1iSE15bUZvTEZvZFFWSStqRkNWSGt4MFJUVzFMTHBleUtTUnRYbTNIdERP?=
 =?utf-8?B?U3BWdGo1SFN1K29GWGIvQlpZZXNuUHVTWEtKWUdGVTdzUzJHeU1VMkpZZFht?=
 =?utf-8?Q?m9dydkNLqPz49HRKguJ0nPdefW3VjkQdVHwD0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkJtenFNK1pwRks4WGZ0Rm1FMW1CZGJ2YllhSUpyMnZPd1phQ1UxbFhIbHZs?=
 =?utf-8?B?OUlJZWc5UnNQc3pQK0h0bVZQNzdnZnNadlFWRnkvVkt0SDRpdm55bkxMWE9m?=
 =?utf-8?B?cWxGL0liLzBUWEZtdUpicDU4Tnd2ZDJ2dVFYMy9sM0FCL2Y5WnQrTCtnWm1t?=
 =?utf-8?B?cUM5MGdlcS9mOUhYcHVQNzIyTTVrQ3N6SFB6UmlRQVY2aXg5aUd5cko1NTVC?=
 =?utf-8?B?L0tubHJkM0RUeHZaczdsc2VMSWVnYjlhdFRvVEp6UnZRUGJnMlUvNW1kYXFk?=
 =?utf-8?B?VHZJVU1SQmUrazBZSndUSTErempRZGhVaGVyVEdkSjVXNFJpcXl6U2FwWXN5?=
 =?utf-8?B?dHFiNHBseDRMWm52am1nRFo4MmQ5cVQ3S3d3VWdEWkQrTTRRdHJCUVNyTS9X?=
 =?utf-8?B?aTdnWjBlNGU3OE5XRS9Oa0dvdWdyd2JaV3BobFBMRkRVajVlZTdqZTNKZnRa?=
 =?utf-8?B?UWJsKzdNaXY5TjdTVllUaVJkOXg3alZiUlV6NU8rdkdWaVZvckhHWWhIdXFC?=
 =?utf-8?B?MEduREpDUERybUJlQWd6RFJLQmhST2dDbFdqa21GdHo5alRkczJyN3hwNkpr?=
 =?utf-8?B?TDd6a09rb25VY010Sm5Jb2J3VUpESnJTMXMvOGdlREZ0Nmc4S05KMmJSZC9I?=
 =?utf-8?B?SXdYdU84dk11NnR6VGZXeUN2Y09xSnI2T2NTVjdFQTg0U3NLcDc5TTVOS281?=
 =?utf-8?B?ZThNTUNONmRKZzEvYnBubWx4a2RrMERoSmx5WjVZTG1yU2YxTlh5WmdVVzIy?=
 =?utf-8?B?L0oxRmZwOWk2VHEzWHg4TFVyUTFYWVZZZWY3TFhEaDl2VzlkdFZtcVYzTm1O?=
 =?utf-8?B?VFYwVVUwMlVpKzQ2Q2JSVFFJVUlGOEo4cXIvRThtREhBamRsUzRoL3ZmSi82?=
 =?utf-8?B?R0dxN3cwM2JVMDBZRjNySmdzbVViU1cyTXUwOXJCVk14WUxGRENhUDQ3ei8v?=
 =?utf-8?B?MFloSkRDM1J0Wk5wZld2V2FPVlRCOG9oOE93V21wNU5SZU1SMXpUUGg2em5I?=
 =?utf-8?B?c2JpS1Zjckh5d0hjK09SOUxkVVJBQ2hFNno5S3RpSzJuY3EwNW0rbnBOZWMy?=
 =?utf-8?B?ZVJTdmtuNFh5VGNSR1IzVCtEV2Z6RVVrZHcwdzlxUC8vK1hROXRCNEs0ZzVQ?=
 =?utf-8?B?Zm5LSGR3a3Z0SGlBWHNuRzRXeSt6QUtzc2ovMkpaeUN5S3U2bTZjZjdyTzZV?=
 =?utf-8?B?RTlSd2lyUHNDSTZyWjNFWU5FL0JURmI0V1Nhd1VOL2VUbm0xMCsyVG12MURU?=
 =?utf-8?B?Y0ZJRWp5SFptYXNteG1GRDNFbngwbExYZVIzVDFBZUtuSUgyeU5GTTZFRDJY?=
 =?utf-8?B?L0VyT1dBSUp4Sk5tRVc5ZG1SU1djOVlpYUYyUmJJWVhNclE0dkFnS09VUUZj?=
 =?utf-8?B?aWV0SDU0S1NrUWtYbU9ZY3lOVUJHZUpHT3plb214N1BXWmtzaUVKYkFpSHlI?=
 =?utf-8?B?ZmV2T1JNTXUyOVRCOTk4ZW9CVmFZcXV2SmlTNndNTUpXTWZNR1htTXhLdE1K?=
 =?utf-8?B?ZkxBY3FGb21GbXhIU2YxNFZrNHdZSWlBbVcrR1BmSXJZMWw2djBkNmYwT1Rh?=
 =?utf-8?B?SSs0WVp5OE5Gdi9jN3RhdmhITGVwL0x5bUpZWHl5VnpieXhZK2tLK2lCLzVv?=
 =?utf-8?B?Rm1QZG5NVTVla3dOc0MwTWxuSUZaQnpyMUVpR3psc2dJSE5Ncy9CTjZjTnc0?=
 =?utf-8?B?UXMyWTNkMlVmQm5KRmxPVENSNHAvdWZETjZ4Y042U3BoV2I0RjBBYUkvS1R1?=
 =?utf-8?B?Y2h6MFo0TlJuU0lxcWRSUFd6ZGtZRDdkdjRPVmVpUlBTalZvV0NSQWpzcmZr?=
 =?utf-8?B?bmFpUzJjV2hSNzllemcyb21rTUhpSGw5UTI5VVoyNHVaT1ZkNnJiTk1Ma1pr?=
 =?utf-8?B?b2xzOVk2eE4rcFVWWERMNmFWTnI0a3pDUVZnWEVISTEzZGVhS1VJUjNZaldM?=
 =?utf-8?B?OWxvTFJyMWpFYytpcEZRbkJwZmoybTFxNk14VDBhZWRoWlUxTEtyT2RJYXRI?=
 =?utf-8?B?YmxsYXM2VTdjSzhFNUVBUzdsZ1hiNVN5cm5RK1UrRldlbExSNFFjeGl5Q1ZP?=
 =?utf-8?B?Y1FSQ1p5ekdhcjVmcXFoVmQxTC81ck5tZHFHOStVTnVUbkNHRnMrTVoxUWV2?=
 =?utf-8?Q?u+7oBYTGbAmqlfuavoDnAWLZs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6693b984-8b0c-441b-8975-08dd7d86caa1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:06:44.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVwetJedihhFpqu7xnr+luK/TRqHGw8I8VyhYJd2RNbY6Tb+Y4r6ynNW6gJF1v/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636
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

--------------Zt9qnF0CCBHZCJmBn3xLB8Wh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am 16.04.25 um 23:51 schrieb Juan Yescas:
> On Wed, Apr 16, 2025 at 4:34 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 15.04.25 um 19:19 schrieb Juan Yescas:
>>> This change sets the allocation orders for the different page sizes
>>> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
>>> for large page sizes were calculated incorrectly, this caused system
>>> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>>>
>>> This change was tested on 4k/16k page size kernels.
>>>
>>> Signed-off-by: Juan Yescas <jyescas@google.com>
>>> ---
>>>  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
>>> index 26d5dc89ea16..54674c02dcb4 100644
>>> --- a/drivers/dma-buf/heaps/system_heap.c
>>> +++ b/drivers/dma-buf/heaps/system_heap.c
>>> @@ -50,8 +50,15 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
>>>   * to match with the sizes often found in IOMMUs. Using order 4 pages instead
>>>   * of order 0 pages can significantly improve the performance of many IOMMUs
>>>   * by reducing TLB pressure and time spent updating page tables.
>>> + *
>>> + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
>>> + * page sizes for ARM devices could be 4K, 16K and 64K.
>>>   */
>>> -static const unsigned int orders[] = {8, 4, 0};
>>> +#define ORDER_1M (20 - PAGE_SHIFT)
>>> +#define ORDER_64K (16 - PAGE_SHIFT)
>>> +#define ORDER_FOR_PAGE_SIZE (0)
>>> +static const unsigned int orders[] = {ORDER_1M, ORDER_64K, ORDER_FOR_PAGE_SIZE};
>>> +#
>> Good catch, but I think the defines are just overkill.
>>
>> What you should do instead is to subtract page shift when using the array.
>>
> There are several occurrences of orders in the file and I think it is
> better to do the calculations up front in the array. Would you be ok
> if we get rid of the defines as per your suggestion and make the
> calculations during the definition of the array. Something like this:
>
> static const unsigned int orders[] = {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0};

Yeah that totally works for me as well. Just make sure that a code comment nearby explains why 20, 16 and 0.

>> Apart from that using 1M, 64K and then falling back to 4K just sounds random to me. We have especially pushed back on 64K more than once because it is actually not beneficial in almost all cases.
>>
> In the hardware where the driver is used, the 64K is beneficial for:
>
> Arm SMMUv3 (4KB granule size):
>            64KB (contiguous bit groups 16 4KB pages)
>
> SysMMU benefits from 64KB (“large” page) on 4k/16k page sizes.

Question could this HW also work with pages larger than 64K? (I strongly expect yes).

>> I suggest to fix the code in system_heap_allocate to not over allocate instead and just try the available orders like TTM does. This has proven to be working architecture independent.
>>
> Do you mean to have an implementation similar to __ttm_pool_alloc()?

Yeah something like that.

> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_pool.c?h=v6.15-rc2#n728
>
> If that is the case, we can try the change, run some benchmarks and
> submit the patch if we see positive results.

Could be that this doesn't matter for your platform, but it's minimal extra overhead asking for larger chunks first and it just avoids fragmenting everything into 64K chunks.

That is kind of important since the code in DMA-heaps should be platform neutral if possible.

Regards,
Christian.

>
> Thanks
> Juan
>
>> Regards,
>> Christian.
>>
>>>  #define NUM_ORDERS ARRAY_SIZE(orders)
>>>
>>>  static struct sg_table *dup_sg_table(struct sg_table *table)

--------------Zt9qnF0CCBHZCJmBn3xLB8Wh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 16.04.25 um 23:51 schrieb Juan Yescas:<br>
    <blockquote type="cite" cite="mid:CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Apr 16, 2025 at 4:34 AM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">


Am 15.04.25 um 19:19 schrieb Juan Yescas:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This change sets the allocation orders for the different page sizes
(4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
for large page sizes were calculated incorrectly, this caused system
heap to allocate from 2% to 4% more memory on 16KiB page size kernels.

This change was tested on 4k/16k page size kernels.

Signed-off-by: Juan Yescas <a class="moz-txt-link-rfc2396E" href="mailto:jyescas@google.com">&lt;jyescas@google.com&gt;</a>
---
 drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea16..54674c02dcb4 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -50,8 +50,15 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
  * of order 0 pages can significantly improve the performance of many IOMMUs
  * by reducing TLB pressure and time spent updating page tables.
+ *
+ * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
+ * page sizes for ARM devices could be 4K, 16K and 64K.
  */
-static const unsigned int orders[] = {8, 4, 0};
+#define ORDER_1M (20 - PAGE_SHIFT)
+#define ORDER_64K (16 - PAGE_SHIFT)
+#define ORDER_FOR_PAGE_SIZE (0)
+static const unsigned int orders[] = {ORDER_1M, ORDER_64K, ORDER_FOR_PAGE_SIZE};
+#
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good catch, but I think the defines are just overkill.

What you should do instead is to subtract page shift when using the array.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There are several occurrences of orders in the file and I think it is
better to do the calculations up front in the array. Would you be ok
if we get rid of the defines as per your suggestion and make the
calculations during the definition of the array. Something like this:

static const unsigned int orders[] = {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0};</pre>
    </blockquote>
    <br>
    Yeah that totally works for me as well. Just make sure that a code
    comment nearby explains why 20, 16 and 0.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Apart from that using 1M, 64K and then falling back to 4K just sounds random to me. We have especially pushed back on 64K more than once because it is actually not beneficial in almost all cases.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In the hardware where the driver is used, the 64K is beneficial for:

Arm SMMUv3 (4KB granule size):
           64KB (contiguous bit groups 16 4KB pages)

SysMMU benefits from 64KB (“large” page) on 4k/16k page sizes.</pre>
    </blockquote>
    <br>
    Question could this HW also work with pages larger than 64K? (I
    strongly expect yes).<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I suggest to fix the code in system_heap_allocate to not over allocate instead and just try the available orders like TTM does. This has proven to be working architecture independent.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you mean to have an implementation similar to __ttm_pool_alloc()?</pre>
    </blockquote>
    <br>
    Yeah something like that.<br>
    <br>
    <blockquote type="cite" cite="mid:CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
<a class="moz-txt-link-freetext" href="https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_pool.c?h=v6.15-rc2#n728">https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/ttm/ttm_pool.c?h=v6.15-rc2#n728</a>

If that is the case, we can try the change, run some benchmarks and
submit the patch if we see positive results.</pre>
    </blockquote>
    <br>
    Could be that this doesn't matter for your platform, but it's
    minimal extra overhead asking for larger chunks first and it just
    avoids fragmenting everything into 64K chunks.<br>
    <br>
    That is kind of important since the code in DMA-heaps should be
    platform neutral if possible.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Thanks
Juan

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> #define NUM_ORDERS ARRAY_SIZE(orders)

 static struct sg_table *dup_sg_table(struct sg_table *table)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------Zt9qnF0CCBHZCJmBn3xLB8Wh--
