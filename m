Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C8ADA8CB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81610E2BE;
	Mon, 16 Jun 2025 07:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YLOuPtXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBAC10E2BE;
 Mon, 16 Jun 2025 07:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT+KAMyMXqvBv22GPUWwsIb/jBlt5rltEVAGpEOk/QzbejXFntdzxfjbFkHEpF3pRLeIFSsLwkyeNRjymMZxHJLYTAf6ymAT+Ecd54u9Xy8FlXlqWMu1PF33N+dvQQmL8hThHtoCZ9C/799FXkVaSvYDOnKTQ4/kzv60Boa/sgmJ77r7ThZHp7+1jzBhPeWZGpvkKpUTBIRoDLeHrxh1gWhfyIfqTPecKA44yV7D6Kq9uFfouLMjk7AO6NRtnfcd9BHj7O2dAA6PVkbXRmFT05UpBHKIj20fjg75gRsij3XzVGcD8RonunUhcN1j4w8tri1Uy/hGgijJWTHqisXwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7tFcDJcKTcavCnpA3kY+UvomL9GyPBjfhmbHArBrwY=;
 b=FHwp1ifLw5NuiDmDBM23v3zAAFU9NDIkwu+fWdqJXpnpJkUUZH9fZpAXnpH/hCBQIu7lTXStQrayo0I6AjjEJAyiBvUCJqDHPZvs0mmzRp+5JvNP0QpG2rtq2JN0cFltX0SfVBfm/VxYlmkLuWC/BdRq2yuumLsYuSiafTneVPmFe9PpQA24NYKB1F31PMGGa6DoPwphwRJAU+7jXYv1Wvn6hLSkfEkJw9iOqJCD4JJlweeW0k8MPRpsHv7EA/wMZyOAC15YqCnvds1O04Z6Fn3QwrVX95LymydtjBomyEQLmfym1mirWrBWJBJTufk8saoFIGCBx0rLzL5HBCxU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7tFcDJcKTcavCnpA3kY+UvomL9GyPBjfhmbHArBrwY=;
 b=YLOuPtXk3hwNmV2MT5DITHDBlbT2ft3F7gp9sa723mB5nMSnnkWUxZKWMjDng7OmwWEMlIVG6/ioLnkXaUiJ48/XBU0/SIcR/LGghwWrwbCC9agQopaLclW9VXfO7e/B9IXB0giWx1U7HDz+iYdR4TYG2fIS2R/DJBv78/QIK7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 07:03:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 07:03:11 +0000
Message-ID: <22217fcd-f408-49f8-b52e-99196e2872e1@amd.com>
Date: Mon, 16 Jun 2025 09:03:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: amdgpu: Create amdgpu_vm_print_task_info()
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
 <20250613184348.1761020-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613184348.1761020-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: f72aa8d5-83e9-41ce-f694-08ddaca3daf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWpTdVJZZDRNMDdXcVMwbjJUSWdLQTlHNlRVUVhIcEx6UW1tSDJqbFpHQVAy?=
 =?utf-8?B?L2VJVUxzaEdmMkZMNXNwaTFzeW5XdkphLy9yellrcndhUWdsNHQvYkpMNWM0?=
 =?utf-8?B?dSsrTzNQeXl3MisrMVBOSkl1RHJZbDFMeFdmNmZVUDRJREgwWkR4UjBZNzNV?=
 =?utf-8?B?VzhGN3crZTFsSjRDSUlBaDd5WTBMbjNuOHhtVlhBMmsrRHJKS3ZzNWxvUG5X?=
 =?utf-8?B?Nk1wOGJzcjF5aEFLQy9NOEVpb0tBMUJldUFQVTZld0pYTUxiNEMyMkRDMEp6?=
 =?utf-8?B?a0Vmd2RSUjJQbTdBSkpXV0p2WElBNFRrUXcyRHNDZ3l5RDVxUDg0aW5GVTV0?=
 =?utf-8?B?ZEhPWnRjTTlMaWk2U3o0dnI1MWNsZnZCL09tQXFsOUFpZlc5aERaL00xc1U2?=
 =?utf-8?B?a0ljcmxQRXlNVHBjakhnRjZTS0xtUnkzMXFzR3VtVzE0dGQ2SmxjVkp0UVcz?=
 =?utf-8?B?NktPeVM4WFhjSVZLMXpUbmZQaEdzVkxweXVadDM5UWMvUmZNcmRCaXZ2UHpq?=
 =?utf-8?B?by9GTXRBTjB5YXZKZGFuNjNaWEFOWnBZTlpzZ2xLbGlUWGRFaEUwZmkyZ3E3?=
 =?utf-8?B?ZGIyaW9NVFFGZ3Y1dnNwMzRHblhkQWIyN1pyL3Q2WmIxbHoyUXFCaFZvRUlD?=
 =?utf-8?B?VkRaaVZjNVBkRjJRTjFLb0czQUhab3NEK0l4RzNBdXFFSG1zTFNraHVPWVd4?=
 =?utf-8?B?ZnUxNTYwdks1YW9Ib3A3cEwvUGxsYTZZd1FRTE14cGxOQmlUT080US93WTcy?=
 =?utf-8?B?NFVlRHhCalplejNQQkxoVFV4MTV1TTZJTHVJYmpEVlhKSFZVRmYyS29lNzZ3?=
 =?utf-8?B?Mk82eG94OTBoTUZvVUh3V25wc0xGKzdNM0xPSENsMytRczlKUUprOFBIQVBY?=
 =?utf-8?B?V21Wd0xhayt4WStqOEFidUpMb2FoaVpJNmczWXk0ZDBtMExWYXpMRmtCV25h?=
 =?utf-8?B?RFhVSFlPSHRUODNsMHNldmkwR2FVMlpVeHAwNEZyQnloSWhTMW1hRlZRd0VJ?=
 =?utf-8?B?eTlpVlFlbEhQWVI1N2FKSlE3QkRIMlRPbGtDR1oydlRmUHM4S2xXT2h2VlZR?=
 =?utf-8?B?L1oxcW5jYW1LWTFSSE95bG9JVnhqZWdGNnZaRTMrckkxTy9KM0dwME5YMFVr?=
 =?utf-8?B?UzJmckNzM2JCYzNmaFBQRHE4NTV2QTVWTUpuVmd6UG04VW5xZHBYMzAzcmp6?=
 =?utf-8?B?N2s0bkQzMGxxSFNsNDNYUExsZ3B6dzZ5MXhnTEMvQVVTNzdWWm9TMjVKcHRs?=
 =?utf-8?B?amhNWll3Q1E0emlMSHpLajJkUVZWQ0prUGlCa2o5Ym82REIyc3l3R29oYW4v?=
 =?utf-8?B?ajBETlk2Lzhka01QdGNKdHFLNU9DUDk2K09CaVRUczNXdEpJSTlRTDZSU2hi?=
 =?utf-8?B?UEdsMHlZRDUzUjRjaU5XU3p4Z2l1czRtTjBrdEZxaE5uYzZ3YnhiQklkendB?=
 =?utf-8?B?WmNFOUd1WHFGRGVyd2h2WktnM2tIUGJaZXpaZnd1eS9LaEI0WXdrRmFEbkgx?=
 =?utf-8?B?VjV2WEJXWVRta2NIK1FLZnZlaEVtS1g4b0lRSDZ6MVdKNnczdWRTQUxJbWJo?=
 =?utf-8?B?RmNsRlpxRXFYTUQwMFZvQnlleEhjdis4QlBhdGRZQmlpN1ZTTzJxUndYMUhV?=
 =?utf-8?B?RHh0YlJJV0RsT0pTYUtsYlg0WGt0d0pPOTBLMzl4UzcvTk12ZzVNZXdZWmFx?=
 =?utf-8?B?UElPUVVZQUZzL0I3NHFRcWxtaExPOUl5MEJncldPUkx0NmFmKytQeVFobG9Z?=
 =?utf-8?B?ZlhmU1lJb2xMNDJaV2ZOMlQ3OFlqa3B2Y1p5endIRFA1STg5bnpJS2YvamVY?=
 =?utf-8?B?Yk9IN2NvVnN5LzZyN0tkd0hPOFhGQ2ZZZ2Y4RnlkV1JmeFFNb1Qwc1RpVU5C?=
 =?utf-8?B?Y2xFbkZhbE1YQUlVNkRuZG85bnprQzRhbHVmZTVlK2FsVVVhZmpGcFpDOGYw?=
 =?utf-8?B?Z1Rpc202TlQ3QU5Jd0wwcHJwcnp2SnNIQmU0WkVMMGtrUzQyeGpoWXNQcUta?=
 =?utf-8?B?T3BhbFhJRlJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3FGcXV4OE12eDIwMUJqSFRscFU2VjdHanJmejRSdGVvYklseW5FdktWemFC?=
 =?utf-8?B?RUs4b2JkOW9OWFp3SXBhU2FMM1NEYlpsNUtyWlE3Yk1XZEpscWZHRWNDVGth?=
 =?utf-8?B?cmh5NUpwZHRaanNSaTB1NGJxdjR4TklDdHR6cGJBdVNwL0FMUEtMcXBaNHFL?=
 =?utf-8?B?VGZHVGs4cittMkJMTnVmM0lnNzZ1K1ZnM0lsUU1WbFJGaExBVmtjYVFncVI1?=
 =?utf-8?B?NEpPMEdwc0RwK3k5MG5nWXVGWDdVbjR6b0lqaERzS0JaSWxYZnpMUWZFcSth?=
 =?utf-8?B?a2ZTY1dzZ0FNS0FPdUZNTlV0VWJlUlpVUTBuVzFydktFZjRSbTR3YVhscWUr?=
 =?utf-8?B?Z3o3THB4VU9kMlgxWFVSdjFIc1VxZTJ2a1c0V00zeEV6YlZlUDZWMUJiRjVE?=
 =?utf-8?B?eUE4d0l4Z1Q3U0RmL21EeWVtYlNDZk1DcXl2QTZ2RFhNU00rcWZKOENaandh?=
 =?utf-8?B?TCtVU0llU3dkcVhZbGdnQzVPbHJkT2pRbzJrRXhpZHYrOEcyR2hkTy90UU40?=
 =?utf-8?B?bnl5YjYvcERPMmwwTGIxbnV6NnR4WGRrU3hlZlN5RFBwS25nNGlJbnI2SDgw?=
 =?utf-8?B?WXdTeURZdVVrYk5BTEVqY3dEKytuV0pyR2xDcmd3bnhoTnQzY0NSblJ3Vm85?=
 =?utf-8?B?Z0EzQ3Z3WXMyTXhWNHRTdnU5dS9sc3NhTGJ3eEgzUXYxWkNvL2tKS2pkRWh5?=
 =?utf-8?B?UkZ6ZEdSSFZQYkExNW9jVzh4eFV2NFZkeUxYUDdBT1lscC9URnhEc3JobExl?=
 =?utf-8?B?UDc5M1NTaThqTlh1TlM1blMvdEo5cmNNL2sxN1M2OS9rdGhXY1ZPeS96QXFL?=
 =?utf-8?B?c2dXWHlJR0ZNbnBRUG4vdUJGK0g1Z0VBQm02Zk9RWVY1SVVFa1lYSVVtZ0hL?=
 =?utf-8?B?U1VlSVl5OEs4SG95dFA4Vmt1MWtCSm9MR1JmajloekMxakdDSkc1ZzRTOGJv?=
 =?utf-8?B?NTVaSnE1U1NHTnVDakJweTlzbU5KUVovejBmU3VOUXFtZE1PZzVkK3pDTm81?=
 =?utf-8?B?Tyt4WTMyeWhncnptdjBNMXR5QmhsOWNoS0NOeGh5NXhmQ2NpMWZiYXQ2Vk1k?=
 =?utf-8?B?N1E0Yjk0aUxuN29VL2JhemVyNldzdE40SU93NENnOUJBb0Z1NkZ4eDVtSGlS?=
 =?utf-8?B?R3pMYWdrOXMycXJ5SVNZODVzV3l6V3U1WFliY2prOU5jSWkvNDRkZktUeUVr?=
 =?utf-8?B?aUkreVZ6eHdTQnlzNEpsRjJ3STROa3FZbUFvVVNENEYwdnlMSk1zZEhDRHhQ?=
 =?utf-8?B?K0pHUndYdnFhM1JUUFQ5djM1YktqYmlKTFJaVnVTbUVzTldlSDhMT0NUOXVm?=
 =?utf-8?B?b24xMDhqb0hMTFdMbGZ4Uk0xYzBuRHZmRlg2NnN1UkJZcFFpU2tvbDUwZFVh?=
 =?utf-8?B?UTRqZmgzejhPZ2xBZFpvb2dzVUpWb3FNMUtVcXEya25LdmdmTFd5cjBqRjFS?=
 =?utf-8?B?dGt0eGhYRDNGb1VLRGZVN1dKZGZLK2VWMG00L0xLMnBudmFER2JCRU4yMUNS?=
 =?utf-8?B?WmR6MVp1TngyUVBTRjZPelA0TGxoUDhHWXJsVVFkOWw1b3hWbkpjVUt2OHdV?=
 =?utf-8?B?L0tDSENHMlNZWEdCV080N1ROUTZ0ZUcvd3lVSnY0OG0zZjJ1VG01OFVIaEhJ?=
 =?utf-8?B?Z2RlczA3TkJ4UjREOGMyMUNiVFQya3FyQVRyejRmclU5UTBVTTJiRWtNaGVv?=
 =?utf-8?B?RzlvTTBzOGVVTDlPTUcwbDJZN0NmL2xTbUVnVHpsRkpFZzZhTVFUWkJGZkVu?=
 =?utf-8?B?MmpCMmtTVjBIOHR2dy9QTFlRcXlWUkhuWlJUb3FFVmVmOWE4Q2RFZTRveUxU?=
 =?utf-8?B?cENydG9FdGdJZ0ZjakExTSs4SVZvbFVHSEh5ekpCOW9lQ01ZMWFmc3RrYkJj?=
 =?utf-8?B?QlZiYU1SRU0rejJtZ0xkb2dFeXRCRnZPMThZUkxKVEZHbWMyOWluRG9GS0hE?=
 =?utf-8?B?aXB5RDBLbktZTTdqeElsNGV4c1pRbVVQdEtzS3owcjd3OFNOclp4MXBHRi9H?=
 =?utf-8?B?aHJQKzlRNEVLY2JGUkJqSFNNL1JacEtaTklnbGRVSHBRdDdUUk1LSzVNL2Zn?=
 =?utf-8?B?VTJkcXJoRStzUVMyTlVaOWYydzNLazRFTzVITFdaeXdhU0wrVXZEUkZRYmRH?=
 =?utf-8?Q?YYJeDjW5b2Q/MZmw/ejC4B7re?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72aa8d5-83e9-41ce-f694-08ddaca3daf6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:03:11.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2FfmrNCxGDJgHmmntUPwtPZ9/7cT//DwAtbze90QUizSBswdTqeO6/ZoACByXNQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

On 6/13/25 20:43, André Almeida wrote:
> To avoid repetitive code in amdgpu, create a function that prints the
> content of struct amdgpu_task_info.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v7: new patch
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 +---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 9 +++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  | 3 +++
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c  | 5 +----
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   | 4 +---
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 5 +----
>  8 files changed, 18 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 75262ce8db27..3d887428ca2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -124,9 +124,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  
>  	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>  	if (ti) {
> -		dev_err(adev->dev,
> -			"Process information: process %s pid %d thread %s pid %d\n",
> -			ti->process_name, ti->tgid, ti->task_name, ti->pid);
> +		amdgpu_vm_print_task_info(adev, ti);
>  		amdgpu_vm_put_task_info(ti);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3911c78f8282..f2a0132521c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3156,3 +3156,12 @@ bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
>  {
>  	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
>  }
> +
> +inline void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
> +				      struct amdgpu_task_info *task_info)

Please drop the inline, neither performance critical nor really applicable.

Apart from that looks good to me.

Regards,
Christian. 

> +{
> +	dev_err(adev->dev,
> +		" Process %s pid %d thread %s pid %d\n",
> +		task_info->process_name, task_info->tgid,
> +		task_info->task_name, task_info->pid);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index f3ad687125ad..3862a256b9b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -668,4 +668,7 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev,
>  				 struct amdgpu_vm *vm,
>  				 struct dma_fence **fence);
>  
> +inline void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
> +			       struct amdgpu_task_info *task_info);
> +
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index a3e2787501f1..7923f491cf73 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -164,10 +164,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
>  		entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
>  	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  	if (task_info) {
> -		dev_err(adev->dev,
> -			" in process %s pid %d thread %s pid %d\n",
> -			task_info->process_name, task_info->tgid,
> -			task_info->task_name, task_info->pid);
> +		amdgpu_vm_print_task_info(adev, task_info);
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> index 72211409227b..f15d691e9a20 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> @@ -134,10 +134,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
>  			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
>  		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  		if (task_info) {
> -			dev_err(adev->dev,
> -				" in process %s pid %d thread %s pid %d)\n",
> -				task_info->process_name, task_info->tgid,
> -				task_info->task_name, task_info->pid);
> +			amdgpu_vm_print_task_info(adev, task_info);
>  			amdgpu_vm_put_task_info(task_info);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index b645d3e6a6c8..de763105fdfd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -127,10 +127,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
>  			entry->src_id, entry->ring_id, entry->vmid, entry->pasid);
>  		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  		if (task_info) {
> -			dev_err(adev->dev,
> -				" in process %s pid %d thread %s pid %d)\n",
> -				task_info->process_name, task_info->tgid,
> -				task_info->task_name, task_info->pid);
> +			amdgpu_vm_print_task_info(adev, task_info);
>  			amdgpu_vm_put_task_info(task_info);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index 99ca08e9bdb5..b45fa0cea9d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1458,9 +1458,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
>  
>  		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  		if (task_info) {
> -			dev_err(adev->dev, " for process %s pid %d thread %s pid %d\n",
> -				task_info->process_name, task_info->tgid,
> -				task_info->task_name, task_info->pid);
> +			amdgpu_vm_print_task_info(adev, task_info);
>  			amdgpu_vm_put_task_info(task_info);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 282197f4ffb1..78f65aea03f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -641,10 +641,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
>  
>  	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>  	if (task_info) {
> -		dev_err(adev->dev,
> -			" for process %s pid %d thread %s pid %d)\n",
> -			task_info->process_name, task_info->tgid,
> -			task_info->task_name, task_info->pid);
> +		amdgpu_vm_print_task_info(adev, task_info);
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  

