Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 692769D4A66
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 11:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA5510E3EC;
	Thu, 21 Nov 2024 10:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BvPZJmgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BA410E8CF;
 Thu, 21 Nov 2024 10:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adXf8KDbuZa1RoTiI1xRuAT6fQoq+Jz1DxpzGks+V/2gyuhdfTHt8vIE0VcD/0zVn+9JaiYV04OJe0dB2u8L6WWAuQBeJcLQiWOD7FJs82q0k/I9oWxurfZPqCu97Urs2reEipx+EDIgopVMprOGlIh4dgZW05Zv8HL5jLjIlsrPLvSCH2EknSTkxIchAhJUCrrkFLklh5kL/MxjELLD6+fZLc0Tq+n8kNAYhXQmI+qS1K+SmSpuhsKsOoJS5YtFlGA0aycyN3eWqSi0WYO9Hsc7A/vVvLmThRH4KhvWVOOoEaMnB5JS2Von0sa0yS3EVzitOJTXgbnFRKuYhSXI/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLCP/x7XrHfHPpadOYeQZQ9ptqmt5ha6jgo3vBayQAg=;
 b=ovtCmrZuR6lnTfF01ReWDEOkdpDMiob0lSQbv5NxbEzm8+Shlo024pkGrAsWKTu/0bE6fiWr39GbOLvqgp1eFVP/6Sk6BR7v6Y6zy5Z6/zkyekREKYfH5YFVR519SBSjyNKkAQjCy+5pdEztb/af/lpKH0PDEPIhlmWDejJ2M23I2xRaku18cDtj2B9tRzh/Pv4xMFzTyJ2E/T50elLvrRn5EOJYjqvnH/yVCT93Nie1G5xpd7O0LkDWDaxZy58Vl9EDShxV1Wi3sXXbHZGmvK5CNK7tcm6krxd80C8SUxNkl/AyiUteNGEfH2105Gch5y5qX0XUi3bmBrEakmlqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLCP/x7XrHfHPpadOYeQZQ9ptqmt5ha6jgo3vBayQAg=;
 b=BvPZJmgUdsESgzMRThURWzA2oqx4ywQ3UMu9hwB66fDBebweqx14WkJIbPnogpu1n6VBR/svt1/mRxA2sp1MdTXRRgvpOO3O+iclrHHRQiHXJGIEEQAtu7FHyWXuk718EC0K/OIDqfGreHp21ZcfZ7vzD68RhcP1516Hx3axv/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 10:04:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 10:04:54 +0000
Content-Type: multipart/alternative;
 boundary="------------mus9LstxEzmUu9xTfkWXKVtZ"
Message-ID: <12cc3711-c097-46b8-9602-191d5c676e17@amd.com>
Date: Thu, 21 Nov 2024 11:04:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/29] dma-fence: Add dma_fence_preempt base class
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-2-matthew.brost@intel.com>
 <431e53fd-ab98-427c-a6ed-6c2907438952@amd.com>
 <Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5161d5-8e7a-415a-f9d9-08dd0a13f20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1FGYnBIQ25vMng2WGcyRnd4UnZTaWZnL0I0NlArM0ErcTBJUGJUaDFGL0Zt?=
 =?utf-8?B?WGVKMGdKZXRnSXZnWWdUUExJYzNzTmxJK001U1NrZ29hRzNpQ2l6alN3L1M3?=
 =?utf-8?B?a0NrSmtZU3Qxc09GejdYSStzK1dZREdFTTBZMTVnVzgvZ201SHJLelJGdEFt?=
 =?utf-8?B?UW1GLzVidFhMWmlwZWJqTURZOTNNbnMxaU1tNXdibUVsZmQ4WDNLUTFYNUJW?=
 =?utf-8?B?dGtxUGdObURHV0hZcFdyMExSdlZOeC95d1Y1SCtWSkZkWmxhZm5JNWFmNS9J?=
 =?utf-8?B?SG5FWkxxRlN3YXNOMzJiVk9jS1FDdFhwYUExUzhJLzB5bm4vc1dVbW5oem1s?=
 =?utf-8?B?Y04vUVRpVC9JMUlUQWt3cHpXTGs1WFNoRHZFV1RLUU1ZM1oyN2NVOEo4VHQ1?=
 =?utf-8?B?d1dVZGxtTHpjU3A5a0ZUb0xwUEM4UGdhN1ZvZXlyWXhyOWJURGgyREY0THF1?=
 =?utf-8?B?bGxXelVmM0drZXhlREU0aFdxYTlJKys2MlRzb0FMMjlsYk01dVhkaUZibU5n?=
 =?utf-8?B?UVV3bGdpYnJZT3NoZFNxby9SNE9SY0Vqb3IydUkxQklIMkdmcjZ6cmRiUUky?=
 =?utf-8?B?N1l4TkVzeEI2VFB0R1ROTFdNcnNGQk9DZ3kwdUQwbzZhd0YxRHJ4ZERKOUc4?=
 =?utf-8?B?dG54WUhEWVlLS0wzcjJJM1l3TkZ6bWRxeXk3RnViVGpBN1pNZnJXcWRVeHhJ?=
 =?utf-8?B?UnlEaUEzQ1pKbXJhNWhvaTNvbllENTdQTXlXM2FJSTJ1dG5IanJpems1ZFBL?=
 =?utf-8?B?RHpRKzEzNXhyVkgyblRBRitWUzRoVnlWZDNQVjhLZWRqZjJuM1FaTm1RRFI5?=
 =?utf-8?B?aWExcDUwYlBVdWNRS1IrSko2RStmRE0zcWpzNEl6Z3dUS1FMbUdkYzlWQWhl?=
 =?utf-8?B?V1RxakFBLzhaRG5GdUFxTEdPdmpoM3NKMGF3VERPeHloUE1pdWhNTnRoc0hB?=
 =?utf-8?B?cVNFdnNhQlpXRkl0amdWVjd1REovRk1CcWR4QWxwc1lUcFhEUU5QbUZYa1JX?=
 =?utf-8?B?YWtIVW9pQnZ3UmFPL1B6ZVBVVVFGNWVobnRQR01GM2kxajMvaWdXY2VFRXdm?=
 =?utf-8?B?WG5rNGxUWUR5YjNlaXJoZExVQ29WSzIvRkVKaE9haVlZUTJPOWxlTzQ4S2Z1?=
 =?utf-8?B?cSsxaFBXdlgvbm1VeURFTEllRlUvbFRsRjUrejF2RWc4Q2JCN0prMFNlU2Vu?=
 =?utf-8?B?UzBzU1NBT0FFaUdIR2thS2w2WmVBWWIzbjl4cjRrTUtCREk1UGRrTUY1OWVv?=
 =?utf-8?B?WGQyRVJ2cFdITk9JUlpQQTNvMUh3L094V01YWWZOek5zNmZ1Yy8wak1LTUdG?=
 =?utf-8?B?YlVYekVhaFI4bGUxQ0loOUl4UzhoN1lEYklrRCs2RkRqUFdqZmx1bTRNWE9j?=
 =?utf-8?B?elFCcjE5WkRFNE9ML1hMUWxNWDgzSUI4TG91bzRNRG5ydk14bGF1R2dwdS9F?=
 =?utf-8?B?VGtNcXJoR29CK21ETy8zZFN3bUs0OW1RblJVdE5GRFU3VVh4b0VGM3lqUEhP?=
 =?utf-8?B?T1JjN3F3VjhZSVE3UFpQTzU2VW9JdFp6SjRiNnFya3VjekVabXE1K1R2SGNl?=
 =?utf-8?B?eDIzOW5TZ25vN0ZNdGJwMDd1My8xUitUbm9zd2RHNlVmc0dBTFBGR1VLa0Rn?=
 =?utf-8?B?QkZON3BrYnhoTHhoclJHeStac0pRaXVMMDQ1enlRWGFaTXY3SWZHU0Q2aGZB?=
 =?utf-8?B?RWNwaTF1UTFKQnBoTnRPWGE5eHg0cHVoUi9zMHpETE0zTlg3WUlWcGhiL2pY?=
 =?utf-8?Q?RgOzOXIbpxIxfTXD+KwBT2l2aKy7K5NENUc13ir?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNhVzlsWkp3bk41NDJoV2lJVjdxT1JRcnZucjh5VitXNkkxZ0ZzYmZ6QXk5?=
 =?utf-8?B?NExuUTJ2UkZLVWRuTnhLSnduYmVWamM5MTVBTkZIOVZTa1hiNlA0bWJFYk0r?=
 =?utf-8?B?SG5Nc3MyREpCWHdSMm91ZlM0VDFtSG9GSFNveDd4S0NnaWRmZ252czNjckFm?=
 =?utf-8?B?Y2pQdkJXT1gzdXNQWW42M1p0VjQ1TEFpK3M3eE5rbUdMbkNxL3ZOckNsZ2Ev?=
 =?utf-8?B?R3BORmZaNi9CaVhzbUw3djdtd0MrVzlyMW82U1JwQjl1VzRyZmNZSnJ6UUw2?=
 =?utf-8?B?SXhWbjFwWFU0dTlMZncvWitTamNkemloQVhhSFRIbkIzR0ZmcUZ0cktRSCsr?=
 =?utf-8?B?TGE0Y2R6bEVhMWxXOUZhNFI3RjNlczhQdW0xdUpPUm1zVC9uM3loQ0JvUnRk?=
 =?utf-8?B?MUIxK3hMcFJkR1NTcElUZThZR2lYOXBpL1RBUVgzZmxmTEg3anhWeUxEZTgr?=
 =?utf-8?B?RjczNmNBODM0WGZQdGJGRzFqRGpwUE1yekViSGszWXV5S1hDYzloWGlsSkJr?=
 =?utf-8?B?SmRsTnozb3o2cm5IOHdscDMvdTFvWXlReUJZWExPaXdRS04xYXZvaTJkVE1k?=
 =?utf-8?B?dXFleXdvREVYazF3aTNNZ09yd21PajZDZlFsU0JVNEJFMU9mMGdmRUhFbWJX?=
 =?utf-8?B?Ukl0WWJrMFlJMEpQbzRPcmhkS01jU2h0N1JiUXVoR1h2a1BnOUFRLzJZR2k4?=
 =?utf-8?B?aFFOK3NZZkh0ZzZleE4zLzFDakl2dHczS3lEeVNPbDk1UWd1U2xzYXVNQTEz?=
 =?utf-8?B?OHkrMDRVcDhxV1Jzcko1RlpEa2VXajVZRHdXNVArRUNmdUw3ZHFmT0k1R0lY?=
 =?utf-8?B?eFVkVUU0NnF6THJONjhBNVhVUkFWM2tqaUhoSk5NS1l5aTRtM25YeithZTBu?=
 =?utf-8?B?S3dlT1hBZkVDWE5ncVl4L1F6ZjhrdUtZZTdoWU1tdEZjL2x4RDJpdm5vVGVr?=
 =?utf-8?B?Z1VzbXJKaVRGZ3lva293QlBZNUp0dldjZmRscExJQzdZM2tyRmNJK2VvNGlt?=
 =?utf-8?B?S0JYaFM1VkduVHBZZHhhWWVoNFNwNHYza25nTjdRZTFSTmlNajdYczdLNzRz?=
 =?utf-8?B?TFN2V05abmRHSEtCWUYySGJLbkRHdU5IaldURWxXMG5yUDVFM2JHeDR3aUFQ?=
 =?utf-8?B?UjUxZXJEcHlQR0FySThCdW44NGFRUmdyUVBPZm1XYTE3Q1l1d0p0WXUrSkhl?=
 =?utf-8?B?eWdCT0NzRlU4bWdleEt0ZmszNG1LZG1xNmlkTEV0SDdiYnJiLytHVWE0Rm9W?=
 =?utf-8?B?RUFERnFVZjhwSFBCaS94ekF4d1NQYXFTZElwUnFVOFN4V1BaR01OTzQzRXdo?=
 =?utf-8?B?SDZlWFRaTmJXR3VubzdsOGFPNUVBS3R2TG80Q2RLcm0xTFVVK3A4QTdybXRH?=
 =?utf-8?B?NmNHTDBjUHBNSmU3ZXBFeXBTa3h4MmI5WGw2QTNwUTI4K2JabXRQSDN2VE1H?=
 =?utf-8?B?Z2NHajM3ZDZIb0VyZm9yYnR1c3Bqckx1MjhuOHhHeENCTDYzSVV6RExqQkNj?=
 =?utf-8?B?NE9EOW1IenorYnBpS2xQVVNHV3hkaTh1R0VFenlpaWFuRVF6TnNCSHU3ZXdT?=
 =?utf-8?B?M3Q4bUdDczVTd2c4c2F1cmt4Y2hSZVlnbGJHQWdPSjR2WkthMzNqYzVBNXZi?=
 =?utf-8?B?OTNTYkE2N296ZWJlamRWdmZRdmIyeGcydTQ1NDRraUlkaWwvZU9ENk4xVjdP?=
 =?utf-8?B?ZnhWWHdLaHgraU1mU2RZU24vVDFrU3pzU1hPUXU1bk0rWVdMeVJIUXh0QkJn?=
 =?utf-8?B?MVZjTDlpWHVIZklIdW5HV2Y3ZjFIZUlRUi80K1pxS25sSEh5c3RQb3hvZjZR?=
 =?utf-8?B?and2RzJGYTlrV0dXdVJhblBkZGQxLzJEbE9lWnJJMWw4UFlvUEJrY3RsM29a?=
 =?utf-8?B?NEVZUFMvMzhMSXJIM2ZFak0vR250WlYwNFRBOTM5K1ZpczRwRHZOTEQ0Umpx?=
 =?utf-8?B?alJHWkR2YXR1L0ZCQndyZFhSLzJ5NTJGdlIwQi9OYklUelRBUkJKVnlVYXFP?=
 =?utf-8?B?UjBvTUY0NHVwSkczb2FZaDRYdlZzUjM1U20rejVpYVBGSFFQUzAvcTJMMXVu?=
 =?utf-8?B?SHVmL0hQRjUxTDVDYnhraS92ekh3QnNQdlVEVXZZRUorT0hqOWFsblI4cGdL?=
 =?utf-8?Q?CUF95InKUjguliCcMguZpa293?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5161d5-8e7a-415a-f9d9-08dd0a13f20c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 10:04:54.1021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCmMZGtWGvTWqO7HkwHBs5Mybab2JkAyBhMFlOY9defI41ZqM/mkBoGJC2Ol3/YM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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

--------------mus9LstxEzmUu9xTfkWXKVtZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.24 um 18:36 schrieb Matthew Brost:
> On Wed, Nov 20, 2024 at 02:31:50PM +0100, Christian König wrote:
>> Am 19.11.24 um 00:37 schrieb Matthew Brost:
>>> Add a dma_fence_preempt base class with driver ops to implement
>>> preemption, based on the existing Xe preemptive fence implementation.
>>>
>>> Annotated to ensure correct driver usage.
>>>
>>> Cc: Dave Airlie<airlied@redhat.com>
>>> Cc: Simona Vetter<simona.vetter@ffwll.ch>
>>> Cc: Christian Koenig<christian.koenig@amd.com>
>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>> ---
>>>    drivers/dma-buf/Makefile            |   2 +-
>>>    drivers/dma-buf/dma-fence-preempt.c | 133 ++++++++++++++++++++++++++++
>>>    include/linux/dma-fence-preempt.h   |  56 ++++++++++++
>>>    3 files changed, 190 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/dma-buf/dma-fence-preempt.c
>>>    create mode 100644 include/linux/dma-fence-preempt.h
>>>
>>> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
>>> index 70ec901edf2c..c25500bb38b5 100644
>>> --- a/drivers/dma-buf/Makefile
>>> +++ b/drivers/dma-buf/Makefile
>>> @@ -1,6 +1,6 @@
>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>    obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
>>> -	 dma-fence-unwrap.o dma-resv.o
>>> +	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
>>>    obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>>>    obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>>>    obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>>> diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
>>> new file mode 100644
>>> index 000000000000..6e6ce7ea7421
>>> --- /dev/null
>>> +++ b/drivers/dma-buf/dma-fence-preempt.c
>>> @@ -0,0 +1,133 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/dma-fence-preempt.h>
>>> +#include <linux/dma-resv.h>
>>> +
>>> +static void dma_fence_preempt_work_func(struct work_struct *w)
>>> +{
>>> +	bool cookie = dma_fence_begin_signalling();
>>> +	struct dma_fence_preempt *pfence =
>>> +		container_of(w, typeof(*pfence), work);
>>> +	const struct dma_fence_preempt_ops *ops = pfence->ops;
>>> +	int err = pfence->base.error;
>>> +
>>> +	if (!err) {
>>> +		err = ops->preempt_wait(pfence);
>>> +		if (err)
>>> +			dma_fence_set_error(&pfence->base, err);
>>> +	}
>>> +
>>> +	dma_fence_signal(&pfence->base);
>>> +	ops->preempt_finished(pfence);
>> Why is that callback useful?
>>
> In Xe, this is where we kick the resume worker and drop a ref to the
> preemption object, which in Xe is an individual queue, and in AMD it is
> a VM, right?

Correct. The whole VM is preempted since we don't know which queue is 
using which BO.

> wrt preemption object, I've reasoned this should work for
> an either per queue or VM driver design of preempt fences.
>
> This part likely could be moved into the preempt_wait callback though
> but would get a little goofy in the error case if preempt_wait is not
> called as the driver side would still need to cleanup a ref. Maybe I
> don't even need a ref though - have to think that through - but for
> general safety we typically like to take refs whenever a fence
> references a different object.

The tricky part is that at least for us we need to do this *before* the 
fence is signaled.

This way we can do something like:

retry:
     mutex_lock(&lock);
     if (dma_fence_is_signaled(preemept_fence)) {
         mutex_unlock(&lock);
         flush_work(resume_work);
         gotot retry;
     }


To make sure that we have a valid and working VM before we publish the 
user fence anywhere and preempting the VM will wait for this user fence 
to complete.

>
>>> +
>>> +	dma_fence_end_signalling(cookie);
>>> +}
>>> +
>>> +static const char *
>>> +dma_fence_preempt_get_driver_name(struct dma_fence *fence)
>>> +{
>>> +	return "dma_fence_preempt";
>>> +}
>>> +
>>> +static const char *
>>> +dma_fence_preempt_get_timeline_name(struct dma_fence *fence)
>>> +{
>>> +	return "ordered";
>>> +}
>>> +
>>> +static void dma_fence_preempt_issue(struct dma_fence_preempt *pfence)
>>> +{
>>> +	int err;
>>> +
>>> +	err = pfence->ops->preempt(pfence);
>>> +	if (err)
>>> +		dma_fence_set_error(&pfence->base, err);
>>> +
>>> +	queue_work(pfence->wq, &pfence->work);
>>> +}
>>> +
>>> +static void dma_fence_preempt_cb(struct dma_fence *fence,
>>> +				 struct dma_fence_cb *cb)
>>> +{
>>> +	struct dma_fence_preempt *pfence =
>>> +		container_of(cb, typeof(*pfence), cb);
>>> +
>>> +	dma_fence_preempt_issue(pfence);
>>> +}
>>> +
>>> +static void dma_fence_preempt_delay(struct dma_fence_preempt *pfence)
>>> +{
>>> +	struct dma_fence *fence;
>>> +	int err;
>>> +
>>> +	fence = pfence->ops->preempt_delay(pfence);
>> Mhm, why is that useful?
>>
> This for attaching the preempt object's last exported fence which needs
> to be signaled before the preemption is issued. So for purely long
> running VM's, this function could be NULL. For VM's with user queues +
> dma fences, the driver returns the last fence from the convert user
> fence to dma-fence IOCTL.
>
> I realized my kernel doc doesn't explain this as well as it should, I
> have already made this more verbose locally and hopefully it clearly
> explains all of this.

That part was actually obvious. But I would expected that to be push 
interface instead of a pull interface.

E.g. the preemption fence would also provide something like a manager 
object which has a mutex, the last exported user fence and the necessary 
functionality to update this user fence.

The tricky part is really to get this dance right between signaling the 
preemption fence and not allowing installing a new user fence before the 
resume worker has re-created the VM.

>>> +	if (WARN_ON_ONCE(!fence || IS_ERR(fence)))
>>> +		return;
>>> +
>>> +	err = dma_fence_add_callback(fence, &pfence->cb, dma_fence_preempt_cb);
>> You are running into the exactly same bug we had :)
>>
>> The problem here is that you can't call dma_fence_add_callback() from the
>> enable_signaling callback. Background is that the
>> fence_ops->enable_signaling callback is called with the spinlock of the
>> preemption fence held.
>>
>> This spinlock can be the same as the one of the user fence, but it could
>> also be a different one. Either way calling dma_fence_add_callback() would
>> let lockdep print a nice warning.
>>
> Hmm, I see the problem if you share a lock between the preempt fence and
> last exported fence but as long as these locks are seperate I don't see
> the issue.
>
> The locking order then is:
>
> preempt fence lock -> last exported fence lock.

You would need to annotate that as nested lock for lockdep and the 
dma_fence framework currently doesn't allow that.

> Lockdep does not explode in Xe but maybe can buy this is a little
> unsafe. We could always move preempt_delay to the worker, attach a CB,
> and rekick the worker upon the last fence signaling if you think that is
> safer. Of course we could always just directly wait on the returned last
> fence in the worker too.

Yeah I that is basically what we do at the moment since you also need to 
make sure that no new user fence is installed while you wait for the 
latest to signal.

Regards,
Christian.

>
>> I tried to solve this by changing the dma_fence code to not call
>> enable_signaling with the lock held, we wanted to do that anyway to prevent
>> a bunch of issues with driver unload. But I realized that getting this
>> upstream would take to long.
>>
>> Long story short we moved handling the user fence into the work item.
>>
> I did run into an issue when trying to make preempt_wait after return a
> fence + attach a CB, and signal this preempt fence from the CB. I got
> locking inversions almost worked through them but eventually gave up and
> stuck with the worker.
>
> Matt
>
>> Apart from that looks rather solid to me.
>>
>> Regards,
>> Christian.
>>
>>> +	if (err == -ENOENT)
>>> +		dma_fence_preempt_issue(pfence);
>>> +}
>>> +
>>> +static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
>>> +{
>>> +	struct dma_fence_preempt *pfence =
>>> +		container_of(fence, typeof(*pfence), base);
>>> +
>>> +	if (pfence->ops->preempt_delay)
>>> +		dma_fence_preempt_delay(pfence);
>>> +	else
>>> +		dma_fence_preempt_issue(pfence);
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +static const struct dma_fence_ops preempt_fence_ops = {
>>> +	.get_driver_name = dma_fence_preempt_get_driver_name,
>>> +	.get_timeline_name = dma_fence_preempt_get_timeline_name,
>>> +	.enable_signaling = dma_fence_preempt_enable_signaling,
>>> +};
>>> +
>>> +/**
>>> + * dma_fence_is_preempt() - Is preempt fence
>>> + *
>>> + * @fence: Preempt fence
>>> + *
>>> + * Return: True if preempt fence, False otherwise
>>> + */
>>> +bool dma_fence_is_preempt(const struct dma_fence *fence)
>>> +{
>>> +	return fence->ops == &preempt_fence_ops;
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_is_preempt);
>>> +
>>> +/**
>>> + * dma_fence_preempt_init() - Initial preempt fence
>>> + *
>>> + * @fence: Preempt fence
>>> + * @ops: Preempt fence operations
>>> + * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
>>> + * @context: Fence context
>>> + * @seqno: Fence seqence number
>>> + */
>>> +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
>>> +			    const struct dma_fence_preempt_ops *ops,
>>> +			    struct workqueue_struct *wq,
>>> +			    u64 context, u64 seqno)
>>> +{
>>> +	/*
>>> +	 * XXX: We really want to check wq for WQ_MEM_RECLAIM here but
>>> +	 * workqueue_struct is private.
>>> +	 */
>>> +
>>> +	fence->ops = ops;
>>> +	fence->wq = wq;
>>> +	INIT_WORK(&fence->work, dma_fence_preempt_work_func);
>>> +	spin_lock_init(&fence->lock);
>>> +	dma_fence_init(&fence->base, &preempt_fence_ops,
>>> +		       &fence->lock, context, seqno);
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_preempt_init);
>>> diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
>>> new file mode 100644
>>> index 000000000000..28d803f89527
>>> --- /dev/null
>>> +++ b/include/linux/dma-fence-preempt.h
>>> @@ -0,0 +1,56 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __LINUX_DMA_FENCE_PREEMPT_H
>>> +#define __LINUX_DMA_FENCE_PREEMPT_H
>>> +
>>> +#include <linux/dma-fence.h>
>>> +#include <linux/workqueue.h>
>>> +
>>> +struct dma_fence_preempt;
>>> +struct dma_resv;
>>> +
>>> +/**
>>> + * struct dma_fence_preempt_ops - Preempt fence operations
>>> + *
>>> + * These functions should be implemented in the driver side.
>>> + */
>>> +struct dma_fence_preempt_ops {
>>> +	/** @preempt_delay: Preempt execution with a delay */
>>> +	struct dma_fence *(*preempt_delay)(struct dma_fence_preempt *fence);
>>> +	/** @preempt: Preempt execution */
>>> +	int (*preempt)(struct dma_fence_preempt *fence);
>>> +	/** @preempt_wait: Wait for preempt of execution to complete */
>>> +	int (*preempt_wait)(struct dma_fence_preempt *fence);
>>> +	/** @preempt_finished: Signal that the preempt has finished */
>>> +	void (*preempt_finished)(struct dma_fence_preempt *fence);
>>> +};
>>> +
>>> +/**
>>> + * struct dma_fence_preempt - Embedded preempt fence base class
>>> + */
>>> +struct dma_fence_preempt {
>>> +	/** @base: Fence base class */
>>> +	struct dma_fence base;
>>> +	/** @lock: Spinlock for fence handling */
>>> +	spinlock_t lock;
>>> +	/** @cb: Callback preempt delay */
>>> +	struct dma_fence_cb cb;
>>> +	/** @ops: Preempt fence operation */
>>> +	const struct dma_fence_preempt_ops *ops;
>>> +	/** @wq: Work queue for preempt wait */
>>> +	struct workqueue_struct *wq;
>>> +	/** @work: Work struct for preempt wait */
>>> +	struct work_struct work;
>>> +};
>>> +
>>> +bool dma_fence_is_preempt(const struct dma_fence *fence);
>>> +
>>> +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
>>> +			    const struct dma_fence_preempt_ops *ops,
>>> +			    struct workqueue_struct *wq,
>>> +			    u64 context, u64 seqno);
>>> +
>>> +#endif

--------------mus9LstxEzmUu9xTfkWXKVtZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.11.24 um 18:36 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Nov 20, 2024 at 02:31:50PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 19.11.24 um 00:37 schrieb Matthew Brost:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Add a dma_fence_preempt base class with driver ops to implement
preemption, based on the existing Xe preemptive fence implementation.

Annotated to ensure correct driver usage.

Cc: Dave Airlie <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a>
Cc: Simona Vetter <a class="moz-txt-link-rfc2396E" href="mailto:simona.vetter@ffwll.ch">&lt;simona.vetter@ffwll.ch&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
  drivers/dma-buf/Makefile            |   2 +-
  drivers/dma-buf/dma-fence-preempt.c | 133 ++++++++++++++++++++++++++++
  include/linux/dma-fence-preempt.h   |  56 ++++++++++++
  3 files changed, 190 insertions(+), 1 deletion(-)
  create mode 100644 drivers/dma-buf/dma-fence-preempt.c
  create mode 100644 include/linux/dma-fence-preempt.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 70ec901edf2c..c25500bb38b5 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
  # SPDX-License-Identifier: GPL-2.0-only
  obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-fence-unwrap.o dma-resv.o
+	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
  obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
  obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
  obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
new file mode 100644
index 000000000000..6e6ce7ea7421
--- /dev/null
+++ b/drivers/dma-buf/dma-fence-preempt.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include &lt;linux/dma-fence-preempt.h&gt;
+#include &lt;linux/dma-resv.h&gt;
+
+static void dma_fence_preempt_work_func(struct work_struct *w)
+{
+	bool cookie = dma_fence_begin_signalling();
+	struct dma_fence_preempt *pfence =
+		container_of(w, typeof(*pfence), work);
+	const struct dma_fence_preempt_ops *ops = pfence-&gt;ops;
+	int err = pfence-&gt;base.error;
+
+	if (!err) {
+		err = ops-&gt;preempt_wait(pfence);
+		if (err)
+			dma_fence_set_error(&amp;pfence-&gt;base, err);
+	}
+
+	dma_fence_signal(&amp;pfence-&gt;base);
+	ops-&gt;preempt_finished(pfence);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Why is that callback useful?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In Xe, this is where we kick the resume worker and drop a ref to the
preemption object, which in Xe is an individual queue, and in AMD it is
a VM, right?</pre>
    </blockquote>
    <br>
    Correct. The whole VM is preempted since we don't know which queue
    is using which BO.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">wrt preemption object, I've reasoned this should work for
an either per queue or VM driver design of preempt fences.

This part likely could be moved into the preempt_wait callback though
but would get a little goofy in the error case if preempt_wait is not
called as the driver side would still need to cleanup a ref. Maybe I
don't even need a ref though - have to think that through - but for
general safety we typically like to take refs whenever a fence
references a different object.</pre>
    </blockquote>
    <br>
    The tricky part is that at least for us we need to do this *before*
    the fence is signaled.<br>
    <br>
    This way we can do something like:<br>
    <br>
    retry:<br>
    &nbsp;&nbsp;&nbsp; mutex_lock(&amp;lock);<br>
    &nbsp;&nbsp;&nbsp; if (dma_fence_is_signaled(preemept_fence)) {<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; mutex_unlock(&amp;lock);<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; flush_work(resume_work);<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; gotot retry;<br>
    &nbsp;&nbsp;&nbsp; }<br>
    <br>
    <br>
    To make sure that we have a valid and working VM before we publish
    the user fence anywhere and preempting the VM will wait for this
    user fence to complete.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+	dma_fence_end_signalling(cookie);
+}
+
+static const char *
+dma_fence_preempt_get_driver_name(struct dma_fence *fence)
+{
+	return &quot;dma_fence_preempt&quot;;
+}
+
+static const char *
+dma_fence_preempt_get_timeline_name(struct dma_fence *fence)
+{
+	return &quot;ordered&quot;;
+}
+
+static void dma_fence_preempt_issue(struct dma_fence_preempt *pfence)
+{
+	int err;
+
+	err = pfence-&gt;ops-&gt;preempt(pfence);
+	if (err)
+		dma_fence_set_error(&amp;pfence-&gt;base, err);
+
+	queue_work(pfence-&gt;wq, &amp;pfence-&gt;work);
+}
+
+static void dma_fence_preempt_cb(struct dma_fence *fence,
+				 struct dma_fence_cb *cb)
+{
+	struct dma_fence_preempt *pfence =
+		container_of(cb, typeof(*pfence), cb);
+
+	dma_fence_preempt_issue(pfence);
+}
+
+static void dma_fence_preempt_delay(struct dma_fence_preempt *pfence)
+{
+	struct dma_fence *fence;
+	int err;
+
+	fence = pfence-&gt;ops-&gt;preempt_delay(pfence);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Mhm, why is that useful?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This for attaching the preempt object's last exported fence which needs
to be signaled before the preemption is issued. So for purely long
running VM's, this function could be NULL. For VM's with user queues +
dma fences, the driver returns the last fence from the convert user
fence to dma-fence IOCTL.

I realized my kernel doc doesn't explain this as well as it should, I
have already made this more verbose locally and hopefully it clearly
explains all of this.</pre>
    </blockquote>
    <br>
    That part was actually obvious. But I would expected that to be push
    interface instead of a pull interface.<br>
    <br>
    E.g. the preemption fence would also provide something like a
    manager object which has a mutex, the last exported user fence and
    the necessary functionality to update this user fence.<br>
    <br>
    The tricky part is really to get this dance right between signaling
    the preemption fence and not allowing installing a new user fence
    before the resume worker has re-created the VM.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	if (WARN_ON_ONCE(!fence || IS_ERR(fence)))
+		return;
+
+	err = dma_fence_add_callback(fence, &amp;pfence-&gt;cb, dma_fence_preempt_cb);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You are running into the exactly same bug we had :)

The problem here is that you can't call dma_fence_add_callback() from the
enable_signaling callback. Background is that the
fence_ops-&gt;enable_signaling callback is called with the spinlock of the
preemption fence held.

This spinlock can be the same as the one of the user fence, but it could
also be a different one. Either way calling dma_fence_add_callback() would
let lockdep print a nice warning.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm, I see the problem if you share a lock between the preempt fence and
last exported fence but as long as these locks are seperate I don't see
the issue.

The locking order then is:

preempt fence lock -&gt; last exported fence lock.</pre>
    </blockquote>
    <br>
    You would need to annotate that as nested lock for lockdep and the
    dma_fence framework currently doesn't allow that.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">Lockdep does not explode in Xe but maybe can buy this is a little
unsafe. We could always move preempt_delay to the worker, attach a CB,
and rekick the worker upon the last fence signaling if you think that is
safer. Of course we could always just directly wait on the returned last
fence in the worker too.</pre>
    </blockquote>
    <br>
    Yeah I that is basically what we do at the moment since you also
    need to make sure that no new user fence is installed while you wait
    for the latest to signal.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I tried to solve this by changing the dma_fence code to not call
enable_signaling with the lock held, we wanted to do that anyway to prevent
a bunch of issues with driver unload. But I realized that getting this
upstream would take to long.

Long story short we moved handling the user fence into the work item.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I did run into an issue when trying to make preempt_wait after return a
fence + attach a CB, and signal this preempt fence from the CB. I got
locking inversions almost worked through them but eventually gave up and
stuck with the worker.

Matt 

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Apart from that looks rather solid to me.

Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	if (err == -ENOENT)
+		dma_fence_preempt_issue(pfence);
+}
+
+static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
+{
+	struct dma_fence_preempt *pfence =
+		container_of(fence, typeof(*pfence), base);
+
+	if (pfence-&gt;ops-&gt;preempt_delay)
+		dma_fence_preempt_delay(pfence);
+	else
+		dma_fence_preempt_issue(pfence);
+
+	return true;
+}
+
+static const struct dma_fence_ops preempt_fence_ops = {
+	.get_driver_name = dma_fence_preempt_get_driver_name,
+	.get_timeline_name = dma_fence_preempt_get_timeline_name,
+	.enable_signaling = dma_fence_preempt_enable_signaling,
+};
+
+/**
+ * dma_fence_is_preempt() - Is preempt fence
+ *
+ * @fence: Preempt fence
+ *
+ * Return: True if preempt fence, False otherwise
+ */
+bool dma_fence_is_preempt(const struct dma_fence *fence)
+{
+	return fence-&gt;ops == &amp;preempt_fence_ops;
+}
+EXPORT_SYMBOL(dma_fence_is_preempt);
+
+/**
+ * dma_fence_preempt_init() - Initial preempt fence
+ *
+ * @fence: Preempt fence
+ * @ops: Preempt fence operations
+ * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
+ * @context: Fence context
+ * @seqno: Fence seqence number
+ */
+void dma_fence_preempt_init(struct dma_fence_preempt *fence,
+			    const struct dma_fence_preempt_ops *ops,
+			    struct workqueue_struct *wq,
+			    u64 context, u64 seqno)
+{
+	/*
+	 * XXX: We really want to check wq for WQ_MEM_RECLAIM here but
+	 * workqueue_struct is private.
+	 */
+
+	fence-&gt;ops = ops;
+	fence-&gt;wq = wq;
+	INIT_WORK(&amp;fence-&gt;work, dma_fence_preempt_work_func);
+	spin_lock_init(&amp;fence-&gt;lock);
+	dma_fence_init(&amp;fence-&gt;base, &amp;preempt_fence_ops,
+		       &amp;fence-&gt;lock, context, seqno);
+}
+EXPORT_SYMBOL(dma_fence_preempt_init);
diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
new file mode 100644
index 000000000000..28d803f89527
--- /dev/null
+++ b/include/linux/dma-fence-preempt.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __LINUX_DMA_FENCE_PREEMPT_H
+#define __LINUX_DMA_FENCE_PREEMPT_H
+
+#include &lt;linux/dma-fence.h&gt;
+#include &lt;linux/workqueue.h&gt;
+
+struct dma_fence_preempt;
+struct dma_resv;
+
+/**
+ * struct dma_fence_preempt_ops - Preempt fence operations
+ *
+ * These functions should be implemented in the driver side.
+ */
+struct dma_fence_preempt_ops {
+	/** @preempt_delay: Preempt execution with a delay */
+	struct dma_fence *(*preempt_delay)(struct dma_fence_preempt *fence);
+	/** @preempt: Preempt execution */
+	int (*preempt)(struct dma_fence_preempt *fence);
+	/** @preempt_wait: Wait for preempt of execution to complete */
+	int (*preempt_wait)(struct dma_fence_preempt *fence);
+	/** @preempt_finished: Signal that the preempt has finished */
+	void (*preempt_finished)(struct dma_fence_preempt *fence);
+};
+
+/**
+ * struct dma_fence_preempt - Embedded preempt fence base class
+ */
+struct dma_fence_preempt {
+	/** @base: Fence base class */
+	struct dma_fence base;
+	/** @lock: Spinlock for fence handling */
+	spinlock_t lock;
+	/** @cb: Callback preempt delay */
+	struct dma_fence_cb cb;
+	/** @ops: Preempt fence operation */
+	const struct dma_fence_preempt_ops *ops;
+	/** @wq: Work queue for preempt wait */
+	struct workqueue_struct *wq;
+	/** @work: Work struct for preempt wait */
+	struct work_struct work;
+};
+
+bool dma_fence_is_preempt(const struct dma_fence *fence);
+
+void dma_fence_preempt_init(struct dma_fence_preempt *fence,
+			    const struct dma_fence_preempt_ops *ops,
+			    struct workqueue_struct *wq,
+			    u64 context, u64 seqno);
+
+#endif
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------mus9LstxEzmUu9xTfkWXKVtZ--
