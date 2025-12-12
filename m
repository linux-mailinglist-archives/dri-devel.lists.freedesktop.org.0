Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D9BCB8683
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 10:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B27610E576;
	Fri, 12 Dec 2025 09:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3b+nAG9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012039.outbound.protection.outlook.com
 [40.93.195.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1881110E576
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 09:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPVusYXZdaS+mddzTExh/B1Wjb7ak8YbsiNiZtHQ29g7jY+k3WF0cD8jJTfQzs+HEKBXESDnJQ689fbVNNbTHG04Jikz5jdm0SXqmfojq4Pd7I+cbKMcLmRcZwdD7SdZBMYTKIl6kkHMsjnY9UPZEfr6vwJs/NGYZnxzYgEmxrvIx2X8S8FxUXIRAcovVi77/KvSGjoZgn4rQk312bZdxCJh00Md/Ryowi9Nj0ZDJCfoT4p/9Yce4tQ5j4EQHfk8zCa4n4QFeXZ+zKAm2pq7NHXgFNVZhFIvl4Y62e4z+B6YGoNH+lwh7ZKmr2pRvU/nZNMdOv3b9zwwkgsP8tEA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4KVpBPRh1a8vbN28jTcq6RVrTqFK46QJRpE/aCkdAM=;
 b=e3lkYbvgWgrpv/3uNHb0P9IXz+ngoy2FbqBL4u84xM+GV6gsYAV5UYPQ0GJsiqwM56ZRMS9VT6r+HWaQAkKrnSQir7LP2m3JVpGoS1S8o+210KZp4DCPGZYK1BDbcJMup5+jC8x6BHNBefReZ0nP+WqoVQUS9N16c1gyDtSUeUe8g0h5s7zB0IapG1wgcnVQUgVv+t2xLodsPjbEA0obY01Ae3AG+EDwo7GplIx7XHeKkuFba91fagmo0AWUfzIbxfzGL3joR5kNkca66FRKQGqC8W7UVi4Ou0URy//s+WKwnU9J+bfxgYKyziJkFDR7diHlzO8WbTe7/Si318u9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4KVpBPRh1a8vbN28jTcq6RVrTqFK46QJRpE/aCkdAM=;
 b=3b+nAG9GWJHYAhvAgo9KS0Xrv9nCakG5CEbSim/e5KirF8LMFu+mPBZYyUKPwnY4mVSizfrepEdkjCFMdPiFGYHPpiWF3mDjPXPCatu+spbNLEXScHpZHn9aNFEGNKw2nNwn9JCdeGuq1wHbo7Vv+wV4fYShUvhbwvn7lmNQuco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:17:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:17:37 +0000
Message-ID: <ee754704-f81c-42da-955f-bce0b2f6a574@amd.com>
Date: Fri, 12 Dec 2025 10:17:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Independence for dma_fences! v4
To: phasta@kernel.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <34407595c6ffb9cff3e00736b1256abb75c1adef.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <34407595c6ffb9cff3e00736b1256abb75c1adef.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:408:eb::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f698e8-7b3c-4a3a-46f5-08de395f4ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEZraTRSWWF4c1JuVkR5ZUJzMzloNGlRVjJzbTBWZDZ1NmJPZUxha3ZRbGli?=
 =?utf-8?B?clZuWFNlYWtUaTJ2dkp2UXdxeWRjQm1zTktueTFWYld4LzIxb0hHbmZ5Z3l6?=
 =?utf-8?B?cm44OEhkYytHeXcyZDFteGxoVTBNTnBjVXE4ZTIrZWZKdHB6eUVPNUp6dUc5?=
 =?utf-8?B?WWFaZUpSaWU2OWJuenZTL2JtMktHUWNOOGE0eVJOZjJnd0tMSG1UQmZFbGdJ?=
 =?utf-8?B?MVNSOFVMRWcxcEt0UG50VWFEM3FTLzJzanlGa1hPaGFuNSs0Q1JnaGQyNlJn?=
 =?utf-8?B?RGVITFdobU4yUlY4eC9RQU9wMVh2cVYwV0RTS1lBSHNtNUJlQ3JmaHBWbXQy?=
 =?utf-8?B?MjNWNUtxdENhRi9yZzg5Tmd6dXV5c2g2QmpiZVJYNmlmN1o5RThqUlRYZ1BM?=
 =?utf-8?B?ZlM0bnNWSlkvQlNqY1FLbEZmd0tPcmRmM2ZzckU3ZTRtMlFSanVWT01Ic0dp?=
 =?utf-8?B?RmI5V2thTnpodDZtaWt2S2h3QWpSbHEydC9NVkJVeG5nUmNGUmNsTC9Gd25s?=
 =?utf-8?B?VlRmcHdaZ0VYdU52RzJCYWZOUTFlb0pCbTZ4NXlqektkbEFqenVNcGw5Nzc2?=
 =?utf-8?B?YllOQ0wxdXRLVmFITEVQWkZGc09pSk5Ca2ZVMG8wTWJJVTRYRnA1MVpvVzZk?=
 =?utf-8?B?VFJjUkhxMHFkRkVTUmRZZk9IdHpBYmdyWmRIZGhYV3c2c09QZWYvYkEvZkQy?=
 =?utf-8?B?L0l5WWQ3OWZodjJ0VkpoVjBTdFZxL2NINWxzVGxEKzJ5MEVKNHp5ZGtJT0Vx?=
 =?utf-8?B?dVRQZXJQcEJVdmU2OWxSQUlzaVNFYVl4WC9jZURhUDhFUWRBUVNwblFiRDZU?=
 =?utf-8?B?aXVqeWxGWEp4L2tvcXJXd3k1dkdPek9MVkRWN0RnV3lKQ2h3bmdMSTE1OW1J?=
 =?utf-8?B?clZjekUvNjRNZXFlTFJDMFMyNmgzNHAwYmF4YXJ6a3kzRmwwWXVOSVhPekc5?=
 =?utf-8?B?Z211em9VNzNSaGNwZUR5MmRjYVFDcXl5K3hWOHhRQmc5dlMyTU9QUXBBd0M4?=
 =?utf-8?B?emJYNkwybXRraWEva25iM2lSdDV2SDdQbExzaDQyY0tjci9mUnpZK3lVT3Nl?=
 =?utf-8?B?TDBTZEEzN09IT2k5QlZnVk8wQURjeWZQbHhsUmNPUnNZM1V3VXRkRnRzc0U4?=
 =?utf-8?B?bjN4QTdXRFhxM3lPVXFXSWVYOTdoYVg0RTRCbFNaODVGOUlsQnBvOFU3VjBC?=
 =?utf-8?B?RWpJMVIza0lNVkZpN2hSNmJlZ25jeXh6RUd1TzI3MEF0cHVJM25yd1NPakE1?=
 =?utf-8?B?TllQSkROT0JXaFZkM3V1emtLbVRjWnp1QndJb0JpNUhESGRlVlFSTm5zL1J4?=
 =?utf-8?B?TDdURGdVeUh3K2VNWkJHNDVqbm9KZFRVRWNSNkFPNVlUOGVZeW82Y1ZQTHR2?=
 =?utf-8?B?VmdEVHJqdlJDK1BqS0NTRkE1WUdhWld3UEIwTndWNlVla1RNem9RajNYWGFx?=
 =?utf-8?B?UktHVnpmTURMUlhxcVBCaktIY09jdjAvQlZ0VjEvTFdtK2ZQOVo0c2xHVnZx?=
 =?utf-8?B?MmJwRjhOdGl5VXY0RVFPcTlQMHpEY1J6cEFCaXpRTG9YRXprQlVFaGU5dGdP?=
 =?utf-8?B?WTNVQ0V5MXkzVjRNZllvUE9acnVKZDJRWk4vWWhxeDg3VWhrcnBMVzhTbFRl?=
 =?utf-8?B?S3E1bG4rVWJocGczcDBtTWVicm5MZTRubCtTOU84M3ErSENaelpLWFV5OFhF?=
 =?utf-8?B?Njl2ZHZpZTA3b3E2VzBEaW1zTUhMMWsyNXRkSzBQQTIyMy9JWVFZUnhYRUlL?=
 =?utf-8?B?ZzM1T3pqMkJEMGNzS1Q5SmFkcW5kZ2M0TkE4WnBwQ0d0NU9LS1d2RmJqSExr?=
 =?utf-8?B?RlNsUmcyV1lrc0xDS1hSRWowQXJDQnQ2VWdPOHdOb3YyanpqUU9Vd0h0Mzdo?=
 =?utf-8?B?T3BBT0Z3MXo3WjRJTjA4S1pZR2tVNDlvV0dHS0ZOWlZLalNyRDc0M2VPT0FP?=
 =?utf-8?Q?inrMszQ0vk4yWK4LvKQhT0GrzO+yIfvW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHpHcmFvWHBReUZDZm1ZOGpTeThsTFVCdVo5SjBoSUlUaGxYVWJDVXZIOHNn?=
 =?utf-8?B?bTgxelFYa012cVU2ZnFROXZHMEdtbVk0VjZaTHk5MkIyRys3NzlqTUE1MjlX?=
 =?utf-8?B?Nm5lQytRMnZnVWJ2Z3Z4anlpS1ZCZU5RREd2T25NOTJnRWlBNFhQQkp3dVlj?=
 =?utf-8?B?NndtN3JyekNtRm5PUHVzNVJLMkU2em9XZzlQOUZlaVU1ZnhQYWkwM3YzSG5r?=
 =?utf-8?B?Yy9YQjNNNUhubGhNWWlxWUlaSENyclAwMVJyM0FVem94Ry9nTmNoWU51WUJr?=
 =?utf-8?B?SmNMREhzOWFCMXIvcVdwK1cwVUtEQ2N2cVhNcEFsaVFWUWlnUGxtSDZrT0NW?=
 =?utf-8?B?d0NBWllRM3JRWWxDUGI5ZzBkRDNxaE9qSFZSRk0wcGRtaGdna3JxYkt0aVRV?=
 =?utf-8?B?TUJaODZNYlFvWTYyODRBRE8vWEVnNjJhV3JJQmgxQUI3cXVHaEMycEc2dlk3?=
 =?utf-8?B?WG5ZMFZTNFBZM0l1RkRYRjk3T2tXVVppbEZmUFZiYlpZV2h4ekwyOE10RFo0?=
 =?utf-8?B?djBkYTdVNGNjS1drSVorLzZRL3p5SFc4ZmN0WXhMYTZUVXhFZjVuMUp5bUxa?=
 =?utf-8?B?V09mL3FaVldqRUhQbmgwYkVCTmlvelA3cTFTendkcUF2TCtSQXYwSU9aOUlh?=
 =?utf-8?B?SUp6dURhNnMrT3BXcmxNMzYxZWxaZFpKVGQ5Y0M2WnYyTld6Y0ErL1kzWnpz?=
 =?utf-8?B?YzRzbHk1U0lJM3V1TXIzanRlU3dlMjRKUU1WRDB6RFBWV2tYdXJPNUxwZWJV?=
 =?utf-8?B?Vml6enl1OHc3b3JsaXR5QkRYVEhkeHNoMG85eWRKamwwSUlneDZyRUhIczVJ?=
 =?utf-8?B?Nlc4aVlrN1V4ODJGYWp6VGlqd2hsL3ZHeDd4WFdnZVhhZ0xTdFJ1TGRJQmRr?=
 =?utf-8?B?amJ5SlZZZWxUK3o5Y0xHeGlCUUY2cWNGeG5QU05QWWNuRFNIWTI5TmNZODB5?=
 =?utf-8?B?akJoVjFVK1E3c21iQ2oyNkZUK28waGRoWHlEUy9ZeVVCRlRUREpJc3pJeW8v?=
 =?utf-8?B?Q21tK09MTUttd3pDaVNLbUJGR0EwTG95TEgvRWFId1RKZFhLZWlzV3paWnpH?=
 =?utf-8?B?c1hIVHVHSjU4bFFOWFlCREo4dXFsQ25CQzE5UFJicVVqREIxS1diV1RiMW5T?=
 =?utf-8?B?OVZoTEd3ODJQc3diVXJQaVFOZmxHeU54ZWI0bkswVHd3V0UwbnpUMjFEV2dT?=
 =?utf-8?B?a1Y2bHlSL2dsbEZJcGxzSXNWeWdjUHNvd0NCbDdqejZVVHlaMUFFSmhKdDNG?=
 =?utf-8?B?eXloRlIyTlFTTnlSN2lHRDZ0Tk5ENDltRjhqYjAwMmg5Y3R4aU9ZM3d1MjdI?=
 =?utf-8?B?MExEZ0N0RzBwRk9nLzNGUkh2WlhCdk5acVNYYno5azFYS0IzeWwxYS9DTmEz?=
 =?utf-8?B?eDZjTFE0QzhuYkdNbHZWWmNRdEdZUlRzQnJhMTFPOGdrVFZaN3RvVmIxR0Z1?=
 =?utf-8?B?d3UwY1MwTXQvNmxqYlRDQmd0dFovUGoxNU9EcFdJa3AyOCtUb0IvUGx6TkU2?=
 =?utf-8?B?TE9WbUE5RVlETW9RbWFhU2E2bnRRN0d6OUo3WkdXWFJTSC9FSUdZOC9vUXcz?=
 =?utf-8?B?N1ZvM0VpTm1HZnFoQVJVQlRjYmYwSlhVVkhmMjZmQ2N3Y09yWnJFbDJ6UE5q?=
 =?utf-8?B?MDRMajZKN2h2NVNlUysycjNuelc1VTFRMFRGbExBSllZUUxBSnRiaWpwTXFy?=
 =?utf-8?B?U0Y1TzNyRnBkU0x5YUFiUTlNdGRvV3pVQU5vemFHTEt2QkNXR2NqdDFGNHl5?=
 =?utf-8?B?S2o0M0FYUXRUaENYWWpLMExndjF0cEI4Skg0MlczdTN3ZU1DdlY4R3IrQXNk?=
 =?utf-8?B?ZGpUZkFXL05kZkp2S1AxdlB1My83a2hGMVpaYS9ESEVHakh0VXZ6RklsRVEr?=
 =?utf-8?B?WTYwb1ZxOElqbURONWFFNjVac2ZZNmFOV2dDWGpXRnd0MFBIbCtabDJzQ0s5?=
 =?utf-8?B?dVhKTEh1UlI0OG9FZ2lZS0NaRzFyc0Z6SGR1YWdFenhUSTArNUlpSzFwRWQy?=
 =?utf-8?B?cnFMTUYzQTBaSkZuU2tPYWc3b3NVU0d4cHVCRldyWXlTU2FKTVNFcEhXQmsv?=
 =?utf-8?B?VlloWGlhVEdCM3dITDZ0S2VPKzBDc1Y5aHBaK3YxQmJiWkhjVGJ3Vm5NZGtP?=
 =?utf-8?Q?y52Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f698e8-7b3c-4a3a-46f5-08de395f4ac9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:17:37.4569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4BFbALJcLKDYaYfXF8hFG3uOEQpnwvVGPWhrrcUREJdT6GeNcnfEMrNhvcJSKFt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292
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

On 12/11/25 13:33, Philipp Stanner wrote:
> On Thu, 2025-12-11 at 13:16 +0100, Christian König wrote:
>> Hi everyone,
>>
>> dma_fences have ever lived under the tyranny dictated by the module
>> lifetime of their issuer, leading to crashes should anybody still holding
>> a reference to a dma_fence when the module of the issuer was unloaded.
>>
>> The basic problem is that when buffer are shared between drivers
>> dma_fence objects can leak into external drivers and stay there even
>> after they are signaled. The dma_resv object for example only lazy releases
>> dma_fences.
>>
>> So what happens is that when the module who originally created the dma_fence
>> unloads the dma_fence_ops function table becomes unavailable as well and so
>> any attempt to release the fence crashes the system.
>>
>> Previously various approaches have been discussed, including changing the
>> locking semantics of the dma_fence callbacks (by me) as well as using the
>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
>> from their actual users, but none of them are actually solving all problems.
>>
>> Tvrtko did some really nice prerequisite work by protecting the returned
>> strings of the dma_fence_ops by RCU. This way dma_fence creators where
>> able to just wait for an RCU grace period after fence signaling before
>> they could be save to free those data structures.
>>
>> Now this patch set here goes a step further and protects the whole
>> dma_fence_ops structure by RCU, so that after the fence signals the
>> pointer to the dma_fence_ops is set to NULL when there is no wait nor
>> release callback given. All functionality which use the dma_fence_ops
>> reference are put inside an RCU critical section, except for the
>> deprecated issuer specific wait and of course the optional release
>> callback.
>>
>> Additional to the RCU changes the lock protecting the dma_fence state
>> previously had to be allocated external. This set here now changes the
>> functionality to make that external lock optional and allows dma_fences
>> to use an inline lock and be self contained.
>>
>> v4:
>>
>> Rebases the whole set on upstream changes, especially the cleanup
>> from Philip in patch "drm/amdgpu: independence for the amdkfd_fence!".
>>
>> Adding two patches which brings the DMA-fence self tests up to date.
>> The first selftest changes removes the mock_wait and so actually starts
>> testing the default behavior instead of some hacky implementation in the
>> test. This one should probably go upstream independent of this set.
>> The second drops the mock_fence as well and tests the new RCU and inline
>> spinlock functionality.
>>
>> Especially the first patch still needs a Reviewed-by, apart from that I
>> think I've addressed all review comments.
>>
>> The plan is to push the core DMA-buf changes to drm-misc-next and then the
>> driver specific changes through the driver channels as approprite.
> 
> This does not apply to drm-misc-next (unless I'm screwing up badly).
> 
> Where can I apply it? I'd like to test the drm_sched changes before
> this gets merged.

drm-tip from a few days ago, otherwise the xe changes won't work.

Regards,
Christian.

> 
> P.
> 
>>
>> Please review and comment,
>> Christian.
>>
>>
> 

