Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71AADCC38
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9311D10E652;
	Tue, 17 Jun 2025 13:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cipaVKBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED88410E652;
 Tue, 17 Jun 2025 13:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuMahH1nkVyjYEwu5dqSpTQ5Ssx+cbDxk4D+hsEVyuMpwDExhPBBgaUJkFL8FHAnKjYuXBgg5XLt4BaJmm7liWZG4e47ufLD8LqUdo8wi8aBkAaE7I8r4QM9FhgvnZXbqtL7UBiN5kC7vp7XUyEr3SLmND7EapHOuxsWQSGeRXRxT4Ew8DyyQWZqpwqDpd3q2yi4fRLK7ZezTgZ00jz9tUMbJtQ/aXB2mbwYLhjYWN3OPLWcG95hWEQom5wowDfD0b0Bd2EC/UR+PJqY7jE/IKEI4JJvGsTss7++ixpMpObUC/7So/3vc3HeC6hT91DnwQokZoY8LwTujkzLxHZLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmlEsjTo1BF1l2AbjMSBXPnM3wT5RVBkj4EZ3FR8J2I=;
 b=hb4W9WUxcilHM5YhVjEaZnwhZwWPsnIiGoR6g4cDALsl7vMhrjLmM27lFILGwD1OyHvUscsUjkTbPnedLJ5UWcLrRjk1AWGdCic5emoqGz650FNuzJbI8Kr/jsOLkDVVZGho/qXdoi8QDYzY+CU6U855jkTO1HmgcdP5UiQWhOpubLxDHLYBWIuyOQe1SA+u46I24U7o/lUai+Rb52zrLs30Y6pNoLmbdI5Xpu53npye+khNbF7HNzC5KpMtBVtJ3nxZdKOOEBnEDHmEBywArkhGU/99UD4BILjWjPoKROHN4JEz6zAfVql4hmuTkPVtU/jtmEP0a/nh1mGK/RLwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmlEsjTo1BF1l2AbjMSBXPnM3wT5RVBkj4EZ3FR8J2I=;
 b=cipaVKBiE4nrgrm+cocxmFMtW3e8vNFWva1Su6ln/NfEASeNWPjuTyiuLWDokohWjcWBkQPTU2vgyuyaTI+n4LkDJ7m1axnSvLilo4BvnM8AsUgEUEmvaiLsPJwjsBuYCM7MEcWRSQUPP9Wmi653D9EPVTnUU6LF2Qd7GOpaRdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 13:02:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 17 Jun 2025
 13:02:03 +0000
Message-ID: <66bcc24a-4738-4735-a051-d08c919a1ca4@amd.com>
Date: Tue, 17 Jun 2025 15:01:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] drm/doc: Add a section about "Task information"
 for the wedge API
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-5-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250617124949.2151549-5-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0001.namprd08.prod.outlook.com
 (2603:10b6:208:239::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec7a445-b1b5-45bd-698e-08ddad9f27af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1JWbTFHMm45TFNKZy8xT2VuRzI4WGlyaWhodDY1cmxGakhEZlE0bFR1S1VX?=
 =?utf-8?B?VVNrbWlkMDhXM0VOSVoweVduWithMHk4WkZMejNpMjFBcTQwd1JqK1o0cTBV?=
 =?utf-8?B?by85b0p3QTBNRmJXZitKemxoMlNRVG9IZnB1dWUvV0I0UHg2UWxqa2lIZjhh?=
 =?utf-8?B?UmxnSTdmM1ltQVR0M1ZNdkw2QkJLYU1pWXU1RjhoUHlQTXBHajNFK29USjI3?=
 =?utf-8?B?SmdmT3NrSWtRaERWV2UzcUtxWk5IdzFySGpMZXg4MlNuWlJXUzJiVktNMXBQ?=
 =?utf-8?B?WXJTRlFnRk0rUGh2MUZMaTQwTlNEYml1dmpyZUNQaFFjZkVVQXl2eVd6QkRk?=
 =?utf-8?B?R0E2SzVNVlA1WktLSTBBdjFTNFBBaE1XR1hOLzJLakgvOUxESDNRTS9ublNC?=
 =?utf-8?B?ZkwvcW1IaDZqVjN5a2hXdGZuYkhsL29ZR1dCc2FwRkkxOTRhZVZRUklqV3Yw?=
 =?utf-8?B?UkFhTXRWMTJydHMya2ZpcWVnZlljTVZRcEExbHR0cU5qN3FaM05DOVZVbnNu?=
 =?utf-8?B?MjRmS3IreDJYUUdpY3lYNGFvR2dWUi8vRHVvYkxpeVJsYytHZXZ6RW14SCsv?=
 =?utf-8?B?WURMYXI2VGlpVTE0OGV1amxVV0VLT0QvWER1ZkE4SzNBM1hOWFRuL054SHBO?=
 =?utf-8?B?Qk1EK3lFZkw3dGVQR1BiUm5nNmZuakNMZm5lKytrWXdnMTM5eDRwYVAveTcy?=
 =?utf-8?B?dldxU1pHUER2VmF2MU41VDBlTTJTdjdBcVc3R3FWK0o0aVlTLzlzR3pYVVVp?=
 =?utf-8?B?ZW11ZEZQb3A1dEVqUTVtcVZqSEJHVmtES1JHcW0yOWhFN0dFQllQRUw1R2dW?=
 =?utf-8?B?WGUrdzdpRmJuTW8zd2VQeFlqNThoTFlpUWFUTTY3bThjUk94QUx5WktNbXV2?=
 =?utf-8?B?OHNMOFhlTHc5STdobjcwZVBQV0RZVXJFRmNZZUV5d0dZTklWQlVMSHJ2SytH?=
 =?utf-8?B?L29vTEVYZFRuWjQ2YUNKcGp4YmowUjZ4K0VFdXU1eVpNNitOSkU3NjZpZ0g2?=
 =?utf-8?B?ZklNZENFS0VGVERlTGhUUUlINktheDVRSmZOQWRLSFJEOEN0OGE5ODJDaXBk?=
 =?utf-8?B?WGVUUXdaUjJCeDdyRVZGM0Jub2x2eUd6K3p0RFZaOTZrdDROTHgxVE81UE1P?=
 =?utf-8?B?aTRpS25IOVhSN05PSld4ejJOTzNEcktNUlI5ZzRjWFg2L25yankrN2VkQitZ?=
 =?utf-8?B?WnlXeTd0empoRW9MWkUzTzFuNmRXYWQ4K1hVcG1KVmloS00vaXp2ejdhUEVu?=
 =?utf-8?B?T3RJbENpVmV0eVNhODVFVU0wU0ZBSkp1K3pydVFTUms1NVg4Q2dGTEFCOTUw?=
 =?utf-8?B?a0laM0taZ3BFRVpJdEE2N2d2M2FOZlJuNzF0RGdqanEyank0TkFRN040bkNM?=
 =?utf-8?B?MFNRek8zd0MvczhFYysvdUdTdEE4ZDFIYUUvQ05hN1pjT1Y3Z2s0OGRZOTd5?=
 =?utf-8?B?ZzZRR0VlSlNwUlpJOTJWdThYNDFjaGgyMmtydE8xZDBFT2NHZFpSVDFSejVY?=
 =?utf-8?B?amlQN0RHYzN5RGZTNExiUURCazZnM21KVytUVThDUEtmQ3U1K2dHREZlN25Q?=
 =?utf-8?B?WTlvVUxUN3VFdXBwS0tMU3NIdGg4MzRBQUN4NW1PZmNDTDlGdmpqRDI5S2FE?=
 =?utf-8?B?TVRndjd5OGhtMVFEU0JwU0tSNEU3SU1VQ1o5NnFnSUZnN0IyUDJZcm5KaG5B?=
 =?utf-8?B?T0RESTBwMVBBT0FENVVwZ0xrZTU4RjFzVDAzOEVSdDltaGZncUFXem52VU9u?=
 =?utf-8?B?cU5GckJFVmtIQnRjN0VNTzVYYXNhREVxdHpSSCtoWnh5MlErdi90ODR2Q3Fm?=
 =?utf-8?B?T2duN2NBZy9SZFFteEdYbXhENjVMWU5rYTNuaU5OdU0za3lpWVp5VWpDbVBD?=
 =?utf-8?B?SUFlQjh0dWlOelQ2RHVFMjJHSjFITmRBNFZ6NDFBVDVPUkdwNDZkblBwRXVt?=
 =?utf-8?B?S0FOSDhyaHdCVWU4alZQd3FENTRJRjBpOTNTUGlQZVk5WGM1clhoMi9HSzNy?=
 =?utf-8?B?UTBtZHRwRm13PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEFWemh4UmlydmNOblp4cHIzQTFESUpJQ1diY0E3NVpsMlZ2RWo4czZuZ25J?=
 =?utf-8?B?bk5QenFKamVHZjZ5bFRHc0Q4TVZDZzAvTTZHc3dUV0FPQldZWE9GUW5VcWtE?=
 =?utf-8?B?bG5pakU3OVJtYjJDQjZWaDMyL3hCWTFpS1VnRXdUQWZTdStWQVBJY1p6aVk5?=
 =?utf-8?B?WlNEbGNWUUxDNzd1Q3NBUEpPRzBuOUduWkVwcUFqTjU3a2x5ZFRhVHBGWHRt?=
 =?utf-8?B?T0Frbll1emJjWjhJbU1XUENhS1U2RkJzbWU3M2xzc1kvVzFEQytOOW9Qd2tC?=
 =?utf-8?B?T1JIYUd3Z0M2ZHF1b3IrTjRBN2VJVUZob2VFa2VGRzNhTGpUVjFPK3d5VDFB?=
 =?utf-8?B?N3QybkJvMmxPZEsxcDdUUFBCYmRHdkVBYjlqaFNrUUU1WjEydHhLMFhYWG5i?=
 =?utf-8?B?eUt5OVRhYkNJTm0zcHZtR2pnRGNFK3psZnlhdXloUTBNVUJDdXNYaFZZSTFx?=
 =?utf-8?B?RzQ5dWxBanROVDB6V3BMTVVMbGZFUER2NkEySjlhc09LOTlYQXg3dWQ3b245?=
 =?utf-8?B?aXNQbEF1TkxNeG5ENjJpeUlJV2JOVGEyQTc1aElvbUlXbWdLcERVU2lrZ3Js?=
 =?utf-8?B?bXdiVFh4aFhtTy9PdHhJRXJwTzJiTFIrbTZXN0M4VllVWWlnV1JOTzVLUExW?=
 =?utf-8?B?d3k2bzhlWUIvcGVxOTFkdmRXaFdLSnZLZjZlOVpSWEhxR1RNTmd3ejlDUy9y?=
 =?utf-8?B?SHBhQXRDdDZiYlc2dm9lc1JqMzZYQzdpbFAwMTlxSm9oRXZWYTV1ZFhEd1Ax?=
 =?utf-8?B?MTRZdlorQXZ1RnNoM1Fiek55a0NWQ1NDUHcwMkZNeFZSb0RzSCtmZXBKaG5k?=
 =?utf-8?B?cnE1WGZHK3JHcDhXYnMyQk1lTGhlT1V6VUQwK04yanJrU1hnYjFtMzVmK2NY?=
 =?utf-8?B?TkNLdDE2aGQ4bGJudk9GdTJuMzVQMm1iOWVlbnRBSzdHT0hjSGwrOXF6K0lV?=
 =?utf-8?B?c3dzSGp4RnRiYW1DeGxQNkEza3hzSHF0SmxNV1pKSzVORHA2cFZSWGxWQTAr?=
 =?utf-8?B?RExlUm9KTFJScVR5OG5VMW5JSVJjSXhrUG1NOUxMZjdnQmQrVUVNckZoUlkz?=
 =?utf-8?B?d3AvbmxLbFNzTzA0VkNvaWxyK0lGQUJPTDM3VUk5NTBLNmE2SXJXWUUrcVIz?=
 =?utf-8?B?cHFyd05KRHpkNUdKSEx3OUtDWEdBdzUzVmpKMUg2RVVjaSszVHB0ZUkwbFcr?=
 =?utf-8?B?OXZEMytlZDV6MzYySVg1Q1lrSjhPZDE3dUhWNFpCSkhMMmFDYWZmaVoyb2V0?=
 =?utf-8?B?eGYyUEp5UDdoQS9iRGh3UGh4NVk0TDY1bzdIZVRpRTRqWlNBZm00ZHJacVNS?=
 =?utf-8?B?dzZLamx1WGg4U293OWZ3NXBLSFUrblJ0d25NOElCWnYyMjdKbWhhcC9XSjdm?=
 =?utf-8?B?SmRKckVDTDBBTER6UUdUTllLelJEM0x2WDAxZXJiaERxNnJkRGM0dXJmc1VT?=
 =?utf-8?B?Y2UxVThuK09qUXMyaVZxTkEwRUpHRkRrWUZBVUVtTWhsa0pwQW5xbUFqcFgv?=
 =?utf-8?B?MWJIL1pva2syaEExMTVCYThETEZpNDVqVWpReUE4YTc0ejBHc2hGN3ZHVU9X?=
 =?utf-8?B?L2J3ZjVzN3lmUVZOT2VSYno1K29nQno2TGR6U0ZXaEZMTjhhcVE1Znd3QWJa?=
 =?utf-8?B?TkU4bHZaVGV2emxIdDZ2VmovQ2ptSmM3S1ZBYmR6bVFxVTJ1VnpjZldQTjZl?=
 =?utf-8?B?YUdaWUREQ0NuVTNRaXhjNGdnNnZlaHpjaVVEZUxxcFV2Z29UbWlobzVsbWlJ?=
 =?utf-8?B?cTNhYTY1YmFVNTJBUTB4dWtSK2tQdkhSV3k2YjBSRGRhVkpxMHA5MnpjMXdI?=
 =?utf-8?B?R0c5TjdQSHhNUmw5VVplb2liOWlpcWEvblNhdkpCbUhrTEVleDYrWXBMOWtP?=
 =?utf-8?B?WWJMM3R3YmMyUGRDYXdoZVZ6L2lrSHFVRmZ0NDB2clY0Q3JpVXZUY0xPSHBW?=
 =?utf-8?B?VEx6Mm1qSzNwSjQyWnR1RGxFYzluWU9ybG45SUlCOTZoaFNlcnJEVzlaVnFV?=
 =?utf-8?B?VGxZVThqaDhrLzB4aTJCZEFkbndOd1U5b0hUYUdNenlFSVdGNGdMeXlLK25z?=
 =?utf-8?B?ME1PVndSd0NITkl2bm1TcE1Nbi9YczNqWGlGL1ZaMHlYSUlZM0RnRWg4SlRx?=
 =?utf-8?Q?TiUR4YE/fqwbB+Ekdz+MxhoQa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec7a445-b1b5-45bd-698e-08ddad9f27af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 13:02:03.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2ItDm9a68Ckj9UuX+x07xF1HQbc0FQermpLlbqamk9fN/UHC1ISyyEToOy2W7d5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
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

On 6/17/25 14:49, André Almeida wrote:
> Add a section about "Task information" for the wedge API.
> 
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v5:
>  - Change app to task in the text as well
> v4:
>  - Change APP to TASK
> v3:
>  - Change "app that caused ..." to "app involved ..."
>  - Clarify that devcoredump have more information about what happened
>  - Update that PID and APP will be empty if there's no app info
> ---
>  Documentation/gpu/drm-uapi.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 4863a4deb0ee..263e5a97c080 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -446,6 +446,23 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +Task information
> +---------------
> +
> +The information about which application (if any) was involved in the device
> +wedging is useful for userspace if they want to notify the user about what
> +happened (e.g. the compositor display a message to the user "The <task name>
> +caused a graphical error and the system recovered") or to implement policies
> +(e.g. the daemon may "ban" an task that keeps resetting the device). If the task
> +information is available, the uevent will display as ``PID=<pid>`` and
> +``TASK=<task name>``. Otherwise, ``PID`` and ``TASK`` will not appear in the
> +event string.
> +
> +The reliability of this information is driver and hardware specific, and should
> +be taken with a caution regarding it's precision. To have a big picture of what
> +really happened, the devcoredump file provides should have much more detailed
> +information about the device state and about the event.
> +
>  Consumer prerequisites
>  ----------------------
>  

