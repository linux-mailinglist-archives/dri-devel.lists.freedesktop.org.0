Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F012CEF71E
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 23:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679E510E2DD;
	Fri,  2 Jan 2026 22:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ne3PbOO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D91710E2DD;
 Fri,  2 Jan 2026 22:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7EFpAhRNK5lnmr5KWjKpCa8+dMF3SKX8ytCwIrR7GQLrC7VKEkh6jCsqfrl5WUeAH0WPbhzU4NpLgepM+pDIsqcraR//x1hCFzdNs4M/ZqbVvXhS1MVqmDNd0oDpiFMxJ17+FpR9PlmyL3+5UAZeo2oVlhHabdhQLCAdh8hem0SmYLw1aB0+FpL1sE7NLklKHY3KvPBntpHtu0P3TMTs6dYZlSRrbHN8haOe9Kt5n2uzMJRRanlu7WxMjXOMujJEGWj/263qwsbROa8Un/EpG90SKHCj8kmVkTbxr4tB90TbiyfuulmCPaKt2ZfT1lNCxAUAk38J0f/MED5SZ2MSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZJlsTV0XtWndg92zlhnXJ2KyWKkdwwQF6wcO5NDxrE=;
 b=dqXWhyz8VFbyOLsD8peITw02V3ZJ2P6ZctnuOxJ5lKUr1/gfFKKFny3mBtr300V7ZxPp+A25+SAJMSXguaI6OllN80k/HbyrcqyAptUqS+5DBrIHuus9zOxME9QmvZIvjo2eIvCH2H/6yfQjVsfsygzVMBbwFoqmRdO9GbNpsJ07CZUKJwscklwlTy5rJfjTj6+JA2lpCnX3Y6C3LOq8yjb01gdkhwwq44rfxOFtt2qWw4aupr7HAx4oWnyFGwW5VF6ywuDf2XclDM2UGRval+yYuHUPYF/8N0YtR1IoKlzzS6lSPhkxVYFxtRqyqtGifaekNPbxq35LkvPfVTAmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZJlsTV0XtWndg92zlhnXJ2KyWKkdwwQF6wcO5NDxrE=;
 b=ne3PbOO5cpX/uvmn60ixRpZR2g2gHssMQm8U0CxZF2NuSVwFbml/22peFt+TidDm7ULglGwsJOPu8pK/NvFe+T3y7Byghb9G3uYiKbtfp0zor8ovsWK0aCws0Bj9ipP8oKj9M1C/i++GQg7K0yD601qvJI0sn+LqmuvDEWAX34U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 22:46:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 22:46:55 +0000
Message-ID: <668b84cf-2435-4695-a192-c6c2b89737a6@amd.com>
Date: Fri, 2 Jan 2026 17:46:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: update outdated comment
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: yunbolyu@smu.edu.sg, kexinsun@smail.nju.edu.cn, ratnadiraw@smu.edu.sg,
 xutong.ma@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251230175353.105289-1-Julia.Lawall@inria.fr>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20251230175353.105289-1-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::22) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3a3b1e-7ee0-4497-6610-08de4a50d483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZngybkNjd1BtK1F6QklRWkNkOFladnAvQTZRMTJOYlpiSWxsWlNmdEx0bmJr?=
 =?utf-8?B?QXFseXJPNnd6azlPZXdmQjBySkdEMmQ1WFdwaGFpaTlYaVhTeGdraDNoeFdL?=
 =?utf-8?B?N2NFSFcrcE9OY2h3aEEyc041OG9LT3RNVHRKdmFFa3BsbzhnZGxBMlkvOHlW?=
 =?utf-8?B?bDAreFl1a1QrdVBUOUdXWFJPVXdPY1NKNDZDT0QyTnl6NE80VFJEZGh4MFcr?=
 =?utf-8?B?dm0rSGhQdWQwWng0TFlhRXpQbHBxNEtGRmlMZ2lUNkxzUVhVL25tZEI3NFU3?=
 =?utf-8?B?RTJTcE5xNzUrMFMxSGs0TTd1WFgxbjZwOFVNajFOSnNNVlhYYWJJRnBtdWhR?=
 =?utf-8?B?dWpjZmpSUGg5elNmSW5GSG1xVGRSTkNUeDhydVo4Q2xVYmhwbW96R2JxVUFM?=
 =?utf-8?B?ejlKK0x2dE5KOUVRbHNWZnd3d0tUaTZ5eVMxMGNJdStqNWQ1K2hJa1FpZWJZ?=
 =?utf-8?B?SjkyZDF6Y0NBdEwxREoxbGE2S29jeWlCNFF0K09kM2dhZTNPVlFnQUZheUQ0?=
 =?utf-8?B?OHB6VDZUcEx5VlJ3UDdoeGxHeFh2OHZ1ckJ1bEdhRTFGU3hVd0F3aUpYK3Zt?=
 =?utf-8?B?Y0wxaFNOVG4reEpxSU1KV1kvODR3WGRtNjIwOG5BejhYZ0hQVG5mZ3ROYkpl?=
 =?utf-8?B?OWpxa2gwVFdLVXhNaXVaR0VFU2J5MzhTQVRBR3E2L1JuOTk0c1Mvc0pMdllw?=
 =?utf-8?B?UVJBanpxVXNSVExCZEtlWU43SGN0MitxUWZ3RjdleWhMQ2lDdndNelZqZ01O?=
 =?utf-8?B?TFJBd0h3MzE5T0N3RGFZbHUrK0d0c3dQQ01NaHc3bTJnL0M2RXVNSDlRTGIz?=
 =?utf-8?B?TEZWaE5zMVJrMUE2SmE2RjJHU05CSVROL3RWZGtwQjBCbC91RnJ5YUZmTjFT?=
 =?utf-8?B?TWoyN29DNUdHcklNUmtydEcraWZlODVhYktmcGZPY2ovdmJTZXhmZHJldUF5?=
 =?utf-8?B?Y2d2NGk4cVYxbWJrclFxaFpLMkc2Ry9zMjFVL0FZYlZ5NWNZRFB2KzYzTS9j?=
 =?utf-8?B?OS90dStRSGsxK0FzV0t3S1JOTHdjN1FJVkt2WHJIa0FEN05UNW9CSGhnTjZL?=
 =?utf-8?B?QkJ2UEIxWE50eDFXU2UvdTE3dmliWkx1UzZ1aUNZZHJHWCtwUmpaSWpNSyt4?=
 =?utf-8?B?U0taSzUrYnJ6b3NGUGQ5OGpidndiOGRlbjNvcWpMMTNVODBqc01ISlBiTWEv?=
 =?utf-8?B?d3l4M1hBaGlLUDg3UTRZQTBhTmZCS0FxSmRyTU5uL0dxSXJFeFNQSzl6akhU?=
 =?utf-8?B?L2FSVkVULzhNbGhpd2Q5UFBta2RzV1BkQXRlYXllREpIdG5YNzZkOGc3aHU2?=
 =?utf-8?B?RzVNM2ZDYWFkaVpYS1Z1SjBESHhzNzRLMVdvWEhzc29wSXhtZWJnc3pVdDdq?=
 =?utf-8?B?c2lPZjUrMjlxQ01ZaC9tamE5Y1dZNmNVcVBUb2lvMjhpckpVNDk0ZXFaZlNn?=
 =?utf-8?B?WU1UelUvZFhYdmkwYW01Rm1QaUJxNDJjOWQ4TW9WVzRKL3JCdVY1a1FaZDRD?=
 =?utf-8?B?TmpURUdzL3dBZWN2UGFLU2RQVlVkVDdWQmxIN24zeHAvTHNVeTRDaFFHVjRH?=
 =?utf-8?B?YjM4bytyK0RFd3dnYXRNbmxFaldzdTE3M1EwNVJZRDA2UWhOQTllMzhXSWxy?=
 =?utf-8?B?bXZHcWZ5dXZHUGFvUXJ3eFVtRnR1dk5IYk1HOUhJbkdhNnJNV3lqVWJvOUJu?=
 =?utf-8?B?NWhTSXNqS3JtSytOVE5FcjFlcU9ZcFBzWlRQUWVvd3RjTDBWK3JzcXYwREdp?=
 =?utf-8?B?VTdUMnJ0ckFQeDRwR0VSQXZFeUNWbFlwWisxdWVvanlrTHZxTFZUcXUvZGRq?=
 =?utf-8?B?b0VpUFJHZ2cvRUlKS00xTi90aFV5OHNRdUFoSFRPdXAzb2g3WmdHd2k3Q09T?=
 =?utf-8?B?Wjd1ZG1BcmFtQUpEbit2QkEwMUtka29JMkp1VGdrTTJDcDBacmVPOThka0FM?=
 =?utf-8?Q?68Vlu1ot90GcJseDam886PjsPrYUdIYv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzdxcVIzNlZ4dTg3blZUT1JaMXZYTTFTaUhkVVk4aHdveitqWEVuY1l3WjJM?=
 =?utf-8?B?ejE1SjRId1dneThHeTVuRzFxMHl0RG9zRU43VjAyaURKbWVHdVZ2QjdjT3dQ?=
 =?utf-8?B?SkJkcjRjaU5VbXJuc2dzRHgyMENhaUxlbVBmWHhiYy84UjhNcUxBekhKVGxB?=
 =?utf-8?B?RU1WcHBhVEhGMDNDL05RZTBpa3VuUnhuTk1mUHJ4K1VIbUJsNWlWYjJzaFZz?=
 =?utf-8?B?VnBNWDJXTkt3U2s4M1dCbUxzUm94VWc0S2JGNUU4N0RlL1dSbjVTeGdmem5D?=
 =?utf-8?B?NUx2Sit6a3B6V2UrbmtGTXZQTTRvd1Y5Nm9tZGFOT1c2a3VtZ3ptUDZTands?=
 =?utf-8?B?SFJpbGVuS3Yyam51NWhHTDNaYjJtcVZvMDJjUDJrcUxKdU9qME10MWFsd0gy?=
 =?utf-8?B?N0xOck5YUnRMYnJyaWVROXFSTmd6WmRzWm4zSm9lZU1xczVPM3p4TzMzbVVy?=
 =?utf-8?B?NDNxZ3N6akdibkk5aDZ1Q3NpL1A1K25zemlVU2wwMWpPY25ZWjZETHJDTkQy?=
 =?utf-8?B?ZXdHdGZWYVJPWXFPSlE0ZmZiaEhjY21IUFpxTzVRVG1BVk0vTTlua1Vud1JU?=
 =?utf-8?B?SS9XR2pjbm5kR3dwbG44WUVLQjlBQmdqRmV0RXZlSU91ZE41bThXSW56WDEz?=
 =?utf-8?B?ZlhkSU5EVlhSWVgwMzNvVHFKSDFyV0E5aXFBSVZMcy9hZUlKa2ZVbTZGMUVT?=
 =?utf-8?B?eHNrbm9aejM4U3ZkbEdhV2RMbmF1WnJkN28rTnNwK2daZWNBdzMwMlJLRkxD?=
 =?utf-8?B?QlR4bDhZMU9IbUxnVEVKTmNWdTVtaWpKTlExR05uZ3MwTEJBZTI1ZUxuTTEy?=
 =?utf-8?B?Z3V2VTQrc2gwdFJoYU1iUldqMldCTExVUW40RHptMkFwZ29FQ0tRMUF4OG5U?=
 =?utf-8?B?TFlTTlpMcjViclFzV09wNWg1dVY5QjNkTWhrbGpVZlg1RzVMb1VjdkZMd2l1?=
 =?utf-8?B?YnMrRTk3ZENpVUxHT20zSThPQkJYZlBWRE0xaFNoVUZnQ3RxWTViKzdTVHRh?=
 =?utf-8?B?NlFhY3MvS0U5SGMzeXVJUmsrNlplQzJsZExOc3p1MmhSV1NHblh2NW9HaG9Q?=
 =?utf-8?B?enpDeXF4ZUhRN1IvOXNIcVd0WEVoTmVZNVErTllqMnpaMWhadUdWdW9zVkw4?=
 =?utf-8?B?eEk5TnducmNSSG4vZmxWbjIvbElpQmpCdm9XVFA3dDVPai93b2xKY2F4T3U4?=
 =?utf-8?B?aCtiVytZVnBDbG1EL0FXN0dpUnlWMWxBQXRQc1BvaTArV2xZQmFqZnA3cmhO?=
 =?utf-8?B?SjF4QjRjOXNPYUYvSitETERsdXF6ZW9YQUpEQms4bkpmSmM5bHFUaDN4NDZP?=
 =?utf-8?B?ZTlKVFdPMS8vUXRiVXBZRkNGNzR5ZTVaRnRiV3RBVGRDNGUxMklpSkUrUm9i?=
 =?utf-8?B?c0Z0dXVnVHRlWVZrMDRPYXBHK05BL1BkQU8zeGFMWVp5eSsxKzVKblZSRmVK?=
 =?utf-8?B?S083V3EzQWljaUErejBKZHRSN2NlUUpkaDlqOE4rbGxMYWg4alo0dVVKaXgx?=
 =?utf-8?B?YkdLaFFaL200MU5QVUN0MkJ3dERpdHBjZFpoOW1GU2NRWjJsN3B5YWw0c2li?=
 =?utf-8?B?bUZxR0ZKalk1WStVZkZjT0x6Z0dZYktiRkoyVWFyUTd4WGFSMHZ3YVVuVm5N?=
 =?utf-8?B?Z3dTVk0rTU5DWHRHbTAwQ3RETmVDN3ZrRWJMZ1l0VThYNnFjR0FVQzdBcEU0?=
 =?utf-8?B?dGlGbnVHd2sybm1VOXBqVjN0eFlMYXpxUkxMTms3R2N5QWdsNHcwSVZ6Nklp?=
 =?utf-8?B?Y1JJQzByeVE3ejFwYUdlN1BwRVc2VGFvVFZCbFNjUFRzSDFWaTFFZkd3ZlpR?=
 =?utf-8?B?d09VNHhkZzl1eUx5ZEQ3ckZGZVhDNDgvZERZeWhDN1Arby9uc0JNUmJoWHhk?=
 =?utf-8?B?OU40QUtBcnIycFN4OWpzWVU4OTRRZHI4c2ZNZlplTlg2NG5HaUhYSHhQK0hm?=
 =?utf-8?B?eVNtSEZjeDYzMlZzUWVkNGlaWFo5dkZ2bTlWQ3hiS25uVVFjb0dyM0NyeVdI?=
 =?utf-8?B?b2VWOWhzaTRpNjJkTDhkMk1CR01YVXdRR1RWVHNyc0xTbFY5SHkrbHcwdDNI?=
 =?utf-8?B?ZlNVUncrN0NzVk90YWYwdGtMWURpVjdZMWVaMzBCcWJRdWVCWkxDS2xjczMr?=
 =?utf-8?B?ZHpxbURTanNCSFNIYW5iM1hmUk42dFYrNXZ4ZitQS2lPZnBCRWFlQk1NSTZY?=
 =?utf-8?B?L0tIUFVZblEzWE5HWlJVM1JKeG1kK1kzeVluR2VlZ0h5QjUyZTVDOEE0bE5S?=
 =?utf-8?B?TU5Dd0tZV1F2cmdDbTA0cnduendoeVJQbjFIWStoSGRTRkJ3V0JWejlkYWwv?=
 =?utf-8?B?aHJvSUhLc3ZyZXVGYlpJS1Ixc3hjdzlMSmNZOUJPWUFhZ3ljM2p0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3a3b1e-7ee0-4497-6610-08de4a50d483
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 22:46:55.8325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioNGA1m+cc9BbiwnsL7FPSrV3cQNuk7cQIr+wRzr+TpDfJCgtgvnOwf4GglnOd79nvThxCzP5grhcdG2i8277Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719
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

On 2025-12-30 12:53, Julia Lawall wrote:
> The function amdgpu_amdkfd_gpuvm_import_dmabuf() was split into
> import_obj_create() and amdgpu_amdkfd_gpuvm_import_dmabuf_fd() in
> commit 0188006d7c79 ("drm/amdkfd: Import DMABufs for interop
> through DRM").  import_obj_create() now does the allocation for
> the mem variable discussed in the comment.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

for this and your other amdkfd patch. I submitted them to 
amd-staging-drm-next.

Thanks,
   Felix


>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index b1c24c8fa686..4782265d5e91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1987,7 +1987,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	drm_gem_object_put(&mem->bo->tbo.base);
>   
>   	/*
> -	 * For kgd_mem allocated in amdgpu_amdkfd_gpuvm_import_dmabuf(),
> +	 * For kgd_mem allocated in import_obj_create() via
> +	 * amdgpu_amdkfd_gpuvm_import_dmabuf_fd(),
>   	 * explicitly free it here.
>   	 */
>   	if (!use_release_notifier)
>
