Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C449A5C228
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE810E00D;
	Tue, 11 Mar 2025 13:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eFoW9N7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B34010E00D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKGxBzPUcMOwfOJGCPKxFKbBXKjPOk+ysULM/zQa6z4Huy43DN0km7cDGumXW/tlEBvh7Mnr7GvqrHm70cZA12AXPb0Lj9jod2uwjmIcaJkn8zMtx4fc9Y3AdOQFjL+KNNcu54mFxh7kKiy2vezw3xJaYuHobtKScDIqnOX8uLwKEGWA6sZdv9FEOm1s28i9H4VLRA0QXGA8fvgssm2GbzbUgpRyhqFQ6nAZd9uN8bdQqerLfZin9YfVX45/tnKabNXC2OL7Vdsm9LHIhrIuzQMTfB/9TiHyDOpr2b4MEkyIBX1r/fa+vSqmp0WY+XRfM58NqiQXn/ZvFKJV/4SF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxLWQiY7HhBtNHNWi4uOEXbWZ3sW1NLrw3F/E6/9o2U=;
 b=T/T8JNkqc27k3rEKY8e/Z+WR3cybEKqlswMVHO1zcnwzyR6ncHg4hyZz2BV4jGhnyBtxLY5dKeOwwhpMbj8bFjgjvTXZZPXQHoJdXgnXQtiA63Hvdfy/YgZzngR+rj/RrOQkLJu3COIneIMyJsFO5fA1EXbwM0f2DkSqaJ0JoVQA3+pYD8f6y7emNbN9xqokP8AOYToaLnD7cIPIF68PXc4gwWK8h6zzMFSfGpB7Ti7R2d+KND1MalLZolGWpa2X9T4inCRL6wf3qTBQEMlYGu9tfUXyjK+VCla1WA5enxx+AeX5l5IfJTtyNRHBnt4TaKyvrMN09RSXErczeQOSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxLWQiY7HhBtNHNWi4uOEXbWZ3sW1NLrw3F/E6/9o2U=;
 b=eFoW9N7RmwuUMxF7dM2YM3cf9D3SAlFOlj5c0KsVinEBkPGbWqKfhg0ZiPlj7giCsvSPLVlVNyxOu+ODHbaJcA+PTw9PRkqVou5Su6qjTNhvJZN/k8fHzXy6dHc1n7OVLOtHohpldfPCXdhUB4myUTNgmw6UK6oUYN47T2foRQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:14:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 13:14:53 +0000
Message-ID: <ab6d4da7-15e8-4247-af55-60c02ef461b6@amd.com>
Date: Tue, 11 Mar 2025 14:14:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] drm: Move some options to separate new Kconfig
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
 <20250311092339.52199-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250311092339.52199-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4203:EE_
X-MS-Office365-Filtering-Correlation-Id: fa494d88-4707-45a0-eea0-08dd609eb5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUUxOGRuZlcvZ3JSNE5yNnI2QnoyS21kb2Rrd0ZMV1dnb3ZOeldIMDBUMTF1?=
 =?utf-8?B?RXVyK2NVM01nOS9kYWpVNitqUk53MHhuM2NWaERGK2ppWE9HS3phOFR2WTIx?=
 =?utf-8?B?QjJ2VHg4TWh2K0IrM1QxbWlqT0FobGE5WDhpVkxFT2p6RDI1RkVkQjViNGhp?=
 =?utf-8?B?anVKSFdZblAzcVF6WnM3UnQ1b3hjYUYycm5QOUIwb3VNK2NPOEl1OFh3dFIr?=
 =?utf-8?B?OWFtbFo0TnVjaGVaU0k3NGdKeU4xYzg4TUxET1dFdGRGWHBZN004UWhQQmlS?=
 =?utf-8?B?eEtCNDFPKzJvUWVyYTN1eEs4d3FNSGljYk1Wd0dkVlhKbXhsSWIvT1dvN2g1?=
 =?utf-8?B?eDdxQllWdWxONGJWeUpjd2tTQ1dESEpSc0wzQzRMN2hWUERnZ0g3YlNJZ3Js?=
 =?utf-8?B?b1lESnVxdEJ5RCs3V0RIRnlzZDJHOWZpcThFS3N1Z3lYaFI3ZGM3ckEwYVQw?=
 =?utf-8?B?NDdGY3FrdURZdkdMa0l0SGZGazRQcjJMbWczWk5memJKMmJDVlExVk9IOE9z?=
 =?utf-8?B?REhhNE9WWUNtN0l4SThXM2RrU3dXZENwdzlwdWF6cHpLajB3UTJGSTBvK3hD?=
 =?utf-8?B?Uy9LajU0Y2FCZmZBZFhjR0RhUGxuQ1NIKythcHZPeFNoSElha1Rha0xJbFhX?=
 =?utf-8?B?aGduRXhNb3l0Y05ibitCRTlhWWFrdnI4UlRuNEtmMEQ2ZHJiUTF1TXFXcHBh?=
 =?utf-8?B?OTBsTVdiRldrWlYyWElsWlBDTEJwaEh4ZlAxRG4wdHZxVjNZQ05ZaEJNNjc3?=
 =?utf-8?B?NjlQOFpUME1DbDlUaUtxSG9FT2dIeXRWWlAyam12cTJ3VEI1UDQvVkZqSkt6?=
 =?utf-8?B?Vk9LTFViTjBQSURreVZodlV1WUJiRE5WemZVcGVZZTh5TFdxUDVTTkQwQ1dD?=
 =?utf-8?B?YXNYRjhlczZscitXQ3Bma0VYUXFHRnE1eHkwaGxzOXhlREJCWlpYU1V0T3hL?=
 =?utf-8?B?eDFmc0p4MUNkV0wwOE9NNTlvNElzQUc5SnRuM0pzREFjbSsyMXRXdys0TUN2?=
 =?utf-8?B?cHFaVEtFaEFRWGFSUGJLWTErcUoxNit2WWJ1ZDZ0Sm1MN1VhUWdvdStKSUFz?=
 =?utf-8?B?ZkwvY0tNbnRtOHpDTDE4ZkNORU5YK3daTGQ4MW9iU3M2aUw4NVJUY2FTU0w5?=
 =?utf-8?B?KzZFSng4d3RuQVUxMVMvWFlZdXJNOW5iMmZLb2lKdmlQYXZZd1BLQUJVc2cz?=
 =?utf-8?B?R3RKQ0RBaytvWlNXdnl0eDJVMzZrdDVJOE51Q1ByOHFodmp5YmlOd2VYdmJz?=
 =?utf-8?B?dGVESkt5d2xTYWNRVWs4aFdRRDMyNlM3b3VsWmZDL2FMalNwNXZvR1lLMzgz?=
 =?utf-8?B?ZThJWnRnbnV0MGY5NHJwc2tyaURRSjNVZCsyT0R3NDVESFBINGdEUjhtanlV?=
 =?utf-8?B?UUpXM3dvMXJKRWdiM3lnQ0F3d2VwK1d0ejNUTUZRYVI0RFpuNFdVQlA4UzFa?=
 =?utf-8?B?NFRGaTRzUWpTMldVQ1JvbjdhcjUxNTAwMzRzTCt1TDRIRTlLamY1NXJVNnBu?=
 =?utf-8?B?MkRvNDgwK0tyOGRwOEF3NldjTk45c2dudmNiU3p1aDRJMjNHYUZwRjBsMllp?=
 =?utf-8?B?VnZWSkxQRVVVVk0rREtNeDB6NFZmcGVwMlZ0VVVNb1NOTU03Y3RWTFJZaVlJ?=
 =?utf-8?B?aFhWVVFubi83WkVuNGRNMktJcUFRL2gyYjlWUXJlVmZXc0syUjM5WnBLWmxl?=
 =?utf-8?B?dnRtOVhuOHFrVlUyTjBaSW9KQVhMS2RDdmhHblRWSmw1TDAvdk9NcTUrcXpJ?=
 =?utf-8?B?TGh6TyszWUNZdDJNY1IraTBNRkp3YndHRGl2cXpXemwwb0dCcS93dnVlRnBI?=
 =?utf-8?B?WkRUSGJnVSsvSXFyQ1VScEcxNytNWTF3QWZ2TTZIMkNIa2VwTklCcE0vS1E4?=
 =?utf-8?Q?VTBGzXdBr8sUO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnRaTDlmYXlCZ0pzRTZzdy96UWk0R1FhMjI0aU5jWk5mYjJZT1hjeGlZVGx5?=
 =?utf-8?B?QnRENHJDM3Mzb3JWWFR3REFBSGtaTUdEV1pYdUxyTVFZNWZjZFZhTS93K3lL?=
 =?utf-8?B?bVd0M2JraDdRTkg0aHg0YmJoNFgvanpHMHRoTmRuVkZxY2RSVEdVQmx0eVF0?=
 =?utf-8?B?c2ZxUXNaQnhEaStkWGNuSTNhS1pEaVBobllzb2NRR0RrbXdDTngveTNla0Fr?=
 =?utf-8?B?UnNHLzF6Qm9CZWFVb3ZtZTNFeXcyZ0NQQlkwL0tvOWlNWHp2NEcvZ2x5L0V4?=
 =?utf-8?B?a0Q5WjNaZXdTOGJTNlMzUmxTb2dobU5iZzRzOFFUUUc0amdoNWtQSXRjeTJ0?=
 =?utf-8?B?aDNyYW83MlhTT2FiSW5GVUxRTEhWdDkrQkx5dzR3eHpxTzQ0ajBYUnlYOTZl?=
 =?utf-8?B?R1BrYk4rbG5CMktyckFoMllrZ3crSkVubFA2Skx0dUY4SWtIank0dEtRN3BV?=
 =?utf-8?B?aGRVODJRUHFKY2gwVVp5YlVXMVZXR0dQWlZLaTVpMFVkMjhWMVM1SlNVZjlB?=
 =?utf-8?B?d0FZQmFtT0ZPS05TMG1McnZkNWVxcE8yWWpOc0JTQm12clBRS3F5UC94VHJM?=
 =?utf-8?B?bjZwU2hrSVlKSjQ4ZEdHakV2eiswRmgrQnUrNm53ekl3aWQ0QTFnd2Y4dDNF?=
 =?utf-8?B?UWpSeGRYNGZyY25mc2djblB0QStZZVMxTmlmSlBSd2tZTUNXbXA3SHN4dVpQ?=
 =?utf-8?B?bGJZbkNxU0NUbXRiS2VSSXdUQjRzVUNlbWozWUl6V1JnM05DcTlFRGZYQjRh?=
 =?utf-8?B?ZVAwalVMNzlIYzZ2S3o1bFIzbmF6TE12ZjFJUU13Z3hYVUhkOGRveStwbGVF?=
 =?utf-8?B?NVRhNm1POXpEVnhMNzBqcE5wN1paRXRTVFd4ZEhZbllPSDVPY1AzUjZ5U1Vx?=
 =?utf-8?B?NzlBZlQzNVdEM1duSUQxY1pNV2dTK1pFZUJZMFNvNVR3RC9DMkFJSjFOQXMv?=
 =?utf-8?B?Vm5uSit6Z2tINDNUdFgzbkpLa1JPUHNXdjdaRnQyNVUybkVUcS9qWUlncWJi?=
 =?utf-8?B?MVU5ZEdOV3N1UFRlNHVHRGZRR21sTHRVRFBGZ24yRzJ3R2NPbTNSb1krR2o0?=
 =?utf-8?B?UVAwZTJKQzcwVXZ2b3E2TFJ2RzVVSmUxNDJlVHNlL0ZWLzkxbVFBVE45bWp3?=
 =?utf-8?B?bHhUcUxoL216QmE3akhvYjBtYWFXbE1nQ3hhZmRlNVJyWXVqRGw0K0xKSW44?=
 =?utf-8?B?NjE3bFVPNjhTUkkxT0NDRUR3MnB5M1E5YmdXUS9tajFCZ1dGNGRqczNmNkhw?=
 =?utf-8?B?UDRXWDlQUThNc1BMTVJEV0pGNVQya2luK1d3TmxvQkphSXlDSzNJQmNJZkRJ?=
 =?utf-8?B?OENQendBZXAzWllyK2ZzUkxUMlEvMThSdmNyN1RuRDREcWplNU9nRzBZOUJn?=
 =?utf-8?B?ZWE3R0JadWw3eHBlVXkxanlYSytCdU1wWnlzYktQRHh3Mm0rNEJCTE44Q1Zr?=
 =?utf-8?B?Y1pUYUs3U0o0OXhSUDQzUGFKSHdIb0hGeFhvQ0hJSHlGc1k2K2R0NU9ORG5w?=
 =?utf-8?B?TE4vRFczNnprcFVBSXdEaWswczJXZHgvOXNBSzV3VlVuK0xKNnRsTm9IdHli?=
 =?utf-8?B?ZVVrbHlZNkNpUEt4WFJyRWpMSUZjdjNiOFpCb2NTV21YNkJLUENFODNsQzZ1?=
 =?utf-8?B?VDgxUzlLajQxbXZuOEtvd2Y1ck5NQ044MGhZazB2bjNDNE9QeGlIeWZBWVpZ?=
 =?utf-8?B?UThRS0JJbEFGa3YyQkZGUGZSYjVlcDdKRU1tckJOVFhHM0wyUmc4S1lOSnds?=
 =?utf-8?B?eE9lWjBqRWQ0RFlVSGZYc3lQS1BQYWtyUVZnUlZldUp3K3ZKMW13MUtPT2hC?=
 =?utf-8?B?VWdUVW9SUkVkSWJ6QnFMTnRybytFNlNuUndlOGllVVg4NHFORGVZOFZkMEZ1?=
 =?utf-8?B?bFFvNzFwMzNId0JpKzlEb3F5TmtmNWdiNnJnbEozVjh3TFJ5RUd6VXc2TWlr?=
 =?utf-8?B?SStYN2VtN1Q3cEduQTVpaHQwV1owTU8yWEUwd1dhcUFQdjVVVG5OWmpJcFR4?=
 =?utf-8?B?UWkyYURrMU9vSkw1ODRySDlWcnB2b1lVNjZMUEhIQlhReDdyWllwczFrQmZL?=
 =?utf-8?B?SFViZ3NpYlVFblpNOHBscGQ5RHFhV1NNcnp2RVRSU1dxUXJva0kxSDZEeG50?=
 =?utf-8?Q?vfgAWHTrvw/YAfmyaet5zkn/4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa494d88-4707-45a0-eea0-08dd609eb5f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 13:14:53.1802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQp7g0SDpAAu3WHyPvkmt9mAHCVm4QXPzJTTzl/j95AD7LYwX7oLaOx7gV74jRg1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
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

Am 11.03.25 um 10:23 schrieb Tvrtko Ursulin:
> Move some options out into a new debug specific kconfig file in order to
> make things a bit cleaner.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

I only skimmed over the patches but feel free to add Acked-by: Christian König <christian.koenig@amd.com> to the whole series.

Regards,
Christian.

> ---
>  drivers/gpu/drm/Kconfig       | 109 ++--------------------------------
>  drivers/gpu/drm/Kconfig.debug | 103 ++++++++++++++++++++++++++++++++
>  2 files changed, 108 insertions(+), 104 deletions(-)
>  create mode 100644 drivers/gpu/drm/Kconfig.debug
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d9986fd52194..46ba24592553 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -26,6 +26,11 @@ menuconfig DRM
>  	  details.  You should also select and configure AGP
>  	  (/dev/agpgart) support if it is available for your platform.
>  
> +menu "DRM debugging options"
> +depends on DRM
> +source "drivers/gpu/drm/Kconfig.debug"
> +endmenu
> +
>  if DRM
>  
>  config DRM_MIPI_DBI
> @@ -37,65 +42,6 @@ config DRM_MIPI_DSI
>  	bool
>  	depends on DRM
>  
> -config DRM_DEBUG_MM
> -	bool "Insert extra checks and debug info into the DRM range managers"
> -	default n
> -	depends on DRM
> -	depends on STACKTRACE_SUPPORT
> -	select STACKDEPOT
> -	help
> -	  Enable allocation tracking of memory manager and leak detection on
> -	  shutdown.
> -
> -	  Recommended for driver developers only.
> -
> -	  If in doubt, say "N".
> -
> -config DRM_USE_DYNAMIC_DEBUG
> -	bool "use dynamic debug to implement drm.debug"
> -	default n
> -	depends on BROKEN
> -	depends on DRM
> -	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> -	depends on JUMP_LABEL
> -	help
> -	  Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
> -	  Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> -	  bytes per callsite, the .data costs can be substantial, and
> -	  are therefore configurable.
> -
> -config DRM_KUNIT_TEST_HELPERS
> -	tristate
> -	depends on DRM && KUNIT
> -	select DRM_KMS_HELPER
> -	help
> -	  KUnit Helpers for KMS drivers.
> -
> -config DRM_KUNIT_TEST
> -	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
> -	depends on DRM && KUNIT && MMU
> -	select DRM_BUDDY
> -	select DRM_DISPLAY_DP_HELPER
> -	select DRM_DISPLAY_HDMI_STATE_HELPER
> -	select DRM_DISPLAY_HELPER
> -	select DRM_EXEC
> -	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_GEM_SHMEM_HELPER
> -	select DRM_KUNIT_TEST_HELPERS
> -	select DRM_LIB_RANDOM
> -	select PRIME_NUMBERS
> -	default KUNIT_ALL_TESTS
> -	help
> -	  This builds unit tests for DRM. This option is not useful for
> -	  distributions or general kernels, but only for kernel
> -	  developers working on DRM and associated drivers.
> -
> -	  For more information on KUnit and unit tests in general,
> -	  please refer to the KUnit documentation in
> -	  Documentation/dev-tools/kunit/.
> -
> -	  If in doubt, say "N".
> -
>  config DRM_KMS_HELPER
>  	tristate
>  	depends on DRM
> @@ -247,23 +193,6 @@ config DRM_TTM
>  	  GPU memory types. Will be enabled automatically if a device driver
>  	  uses it.
>  
> -config DRM_TTM_KUNIT_TEST
> -        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
> -        default n
> -        depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
> -        select DRM_TTM
> -        select DRM_BUDDY
> -        select DRM_EXPORT_FOR_TESTS if m
> -        select DRM_KUNIT_TEST_HELPERS
> -        default KUNIT_ALL_TESTS
> -        help
> -          Enables unit tests for TTM, a GPU memory manager subsystem used
> -          to manage memory buffers. This option is mostly useful for kernel
> -          developers. It depends on (UML || COMPILE_TEST) since no other driver
> -          which uses TTM can be loaded while running the tests.
> -
> -          If in doubt, say "N".
> -
>  config DRM_EXEC
>  	tristate
>  	depends on DRM
> @@ -463,9 +392,6 @@ config DRM_HYPERV
>  
>  	 If M is selected the module will be called hyperv_drm.
>  
> -config DRM_EXPORT_FOR_TESTS
> -	bool
> -
>  # Separate option as not all DRM drivers use it
>  config DRM_PANEL_BACKLIGHT_QUIRKS
>  	tristate
> @@ -478,31 +404,6 @@ config DRM_PRIVACY_SCREEN
>  	bool
>  	default n
>  
> -config DRM_WERROR
> -	bool "Compile the drm subsystem with warnings as errors"
> -	depends on DRM && EXPERT
> -	depends on !WERROR
> -	default n
> -	help
> -	  A kernel build should not cause any compiler warnings, and this
> -	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
> -
> -	  The drm subsystem enables more warnings than the kernel default, so
> -	  this config option is disabled by default.
> -
> -	  If in doubt, say N.
> -
> -config DRM_HEADER_TEST
> -	bool "Ensure DRM headers are self-contained and pass kernel-doc"
> -	depends on DRM && EXPERT
> -	default n
> -	help
> -	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
> -	  include/drm compile, are self-contained, have header guards, and have
> -	  no kernel-doc warnings.
> -
> -	  If in doubt, say N.
> -
>  endif
>  
>  # Separate option because drm_panel_orientation_quirks.c is shared with fbdev
> diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
> new file mode 100644
> index 000000000000..601d7e07d421
> --- /dev/null
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -0,0 +1,103 @@
> +config DRM_USE_DYNAMIC_DEBUG
> +	bool "use dynamic debug to implement drm.debug"
> +	default n
> +	depends on BROKEN
> +	depends on DRM
> +	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
> +	depends on JUMP_LABEL
> +	help
> +	 Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
> +	 Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
> +	 bytes per callsite, the .data costs can be substantial, and
> +	 are therefore configurable.
> +
> +config DRM_WERROR
> +	bool "Compile the drm subsystem with warnings as errors"
> +	depends on DRM && EXPERT
> +	depends on !WERROR
> +	default n
> +	help
> +	  A kernel build should not cause any compiler warnings, and this
> +	  enables the '-Werror' flag to enforce that rule in the drm subsystem.
> +
> +	  The drm subsystem enables more warnings than the kernel default, so
> +	  this config option is disabled by default.
> +
> +	  If in doubt, say N.
> +
> +config DRM_HEADER_TEST
> +	bool "Ensure DRM headers are self-contained and pass kernel-doc"
> +	depends on DRM && EXPERT
> +	default n
> +	help
> +	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
> +	  include/drm compile, are self-contained, have header guards, and have
> +	  no kernel-doc warnings.
> +
> +	  If in doubt, say N.
> +
> +config DRM_DEBUG_MM
> +	bool "Insert extra checks and debug info into the DRM range managers"
> +	default n
> +	depends on DRM
> +	depends on STACKTRACE_SUPPORT
> +	select STACKDEPOT
> +	help
> +	  Enable allocation tracking of memory manager and leak detection on
> +	  shutdown.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> +
> +config DRM_KUNIT_TEST_HELPERS
> +	tristate
> +	depends on DRM && KUNIT
> +	select DRM_KMS_HELPER
> +	help
> +	  KUnit Helpers for KMS drivers.
> +
> +config DRM_KUNIT_TEST
> +	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
> +	depends on DRM && KUNIT && MMU
> +	select DRM_BUDDY
> +	select DRM_DISPLAY_DP_HELPER
> +	select DRM_DISPLAY_HDMI_STATE_HELPER
> +	select DRM_DISPLAY_HELPER
> +	select DRM_EXEC
> +	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_GEM_SHMEM_HELPER
> +	select DRM_KUNIT_TEST_HELPERS
> +	select DRM_LIB_RANDOM
> +	select PRIME_NUMBERS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for DRM. This option is not useful for
> +	  distributions or general kernels, but only for kernel
> +	  developers working on DRM and associated drivers.
> +
> +	  For more information on KUnit and unit tests in general,
> +	  please refer to the KUnit documentation in
> +	  Documentation/dev-tools/kunit/.
> +
> +	  If in doubt, say "N".
> +
> +config DRM_TTM_KUNIT_TEST
> +	tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
> +	default n
> +	depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
> +	select DRM_TTM
> +	select DRM_BUDDY
> +	select DRM_EXPORT_FOR_TESTS if m
> +	select DRM_KUNIT_TEST_HELPERS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enables unit tests for TTM, a GPU memory manager subsystem used
> +	  to manage memory buffers. This option is mostly useful for kernel
> +	  developers. It depends on (UML || COMPILE_TEST) since no other driver
> +	  which uses TTM can be loaded while running the tests.
> +
> +	  If in doubt, say "N".
> +
> +config DRM_EXPORT_FOR_TESTS
> +	bool

