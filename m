Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNgGGeiofGnuOAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:49:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D45BAA4B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 13:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB1910E362;
	Fri, 30 Jan 2026 12:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="28JqEGaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D137410E023;
 Fri, 30 Jan 2026 12:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpojiC4IHlccHv+us0Mdx4cNkNY5uR75ZG86bRH3E2vH6f2vn9oQY2RBlakwUtOgYkFC2HdxbJWhOd7Gix3ODQx6TVNguoeP7vg0tTqPNjJpcbxC0FlKtcbKcYKnig/TxodLYWgjt96P3KK94a3zx2xJjO1wt+LDrXCqBkp2LgNLudvzigN2yNisl7unrKFX2t/F+ARARls+6A9TH5Jb9UaDOI77LP02AjzULzf+V69DU2yvF2g+CGKcp1mCqb/lzpNvtonnjfJxu7tuzQ0RrurMXdl0710ANw/uDNu9gpLGInnmMlDcVFa+1PJnv7q3KTKsMI49eJFOPqaUzmDhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQSb2bUszriTV2yE4HDqPatJuc/ndfJA5+q5ZxxC6ww=;
 b=V4ZJDVna5ob22GsH3/icjBsukSbDbLEzsPBQim9lKvqLjxdhm5gkZQAazttxkGswsd8q4Mb3tvlqmxgS5peJ6jLX3ZescqtjItzEPHxrjML2/3ObYCFNUpJJbpLSs2umly4a3iweP1rC47gpVD4cwf3rlcC3IZp2uiDWBvuPgtgh2kKwKFwbO13MAgHg9Aie/5RxbHeYXM8L+X3/khOpBuvfJcWlOsk0M+Dizn4yaeVD2g3n9fgwet2fK/OT1DVSahMbCf2AOn3c/p3HS8COK56D7nipBoFadTWTd9NnqPoznfLzUbZy2cMZLjJufyVCCXM6c/RAJU/m1fLgy7+BDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQSb2bUszriTV2yE4HDqPatJuc/ndfJA5+q5ZxxC6ww=;
 b=28JqEGaqGV5kN8SLR2kui816tXGR3l8Ay4zupflwA48iYDwsQU10RpL8aM9GnoIzBSlVdFDrtBETqUAhaU8zkGgHFSekxkWp7RH12cg6uP6DIHW8Lb78k4nbusu+SV2HK37ib6y44RblpJ4G4DL1sNyDd+jhmECs5/jr6dOhN/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 12:49:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 12:49:36 +0000
Message-ID: <fc8d0548-1352-40b3-85cd-271cb9c9bf47@amd.com>
Date: Fri, 30 Jan 2026 13:49:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] drm/amdgpu: add amdgpu_gtt_node_to_byte_offset
 helper
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260129153336.7473-1-pierre-eric.pelloux-prayer@amd.com>
 <20260129153336.7473-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260129153336.7473-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 486215e4-6c3c-4105-14f7-08de5ffe05f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk9JYnB1TlhFdEpWWUFXWGhhejdOMUptYm1Wc0ZmRjQ3anhnbzc5ZGsrYmZJ?=
 =?utf-8?B?OHB5eXNmdW9kOFIvTnJhZmk2TXBVL2h1NjR2ZStNSElQQ3VEVmJzUjBNODZw?=
 =?utf-8?B?c3plNFBzYlJ3TFNxcG0zQnVEUjFGcGZGYnZUSmdHTnNUYUlEcVdlV0RZZi9O?=
 =?utf-8?B?RWJ4WUpTT1FIVGxqYVBFZUhtVTltTW9Cc0ljRGdSNzJaTVhWbDR0a21vUzk0?=
 =?utf-8?B?M2NXcFdqWGNwZ3ozeUVUbXVxK2dOZS9sZ3d0eGExeGVBaDlLZVZaTkFmZEpU?=
 =?utf-8?B?U2tFSVNOVk1yU040UDZyMjRHaWdndXVpTTB6T2NRNjBOKzZQWlFzNGhGcmlr?=
 =?utf-8?B?MWc5U28zUlJZcWZUQjRKNGZPR0p1Zm5kZXdveUF3YzRTbDhGUFdqalRWUnc1?=
 =?utf-8?B?Z1JWbXFkRTZ4ZkhFUm9TS1RyaUpER3NqeVZvSUlUMG1UOTh1R2FUbWdNSGhm?=
 =?utf-8?B?TTg4RUd0M1UyalpYTytTdGpVZEZLZFVNeFY4UUx1TTl5a1A1Y1ZlMkJTN0xm?=
 =?utf-8?B?T25KZjI3VWZMa3JKRnJ1MGRxVzNJL2c1QkgxbFJjYXgzNjFVQkFObHJsT3lR?=
 =?utf-8?B?T1Bqek83eVUrQlBxcEhpTmFFK0NZbVlvVzFyZEdXa3hlRTMraEtoSXlKaDIy?=
 =?utf-8?B?cjd3RDkyOGZCT1NyNFpRUHlSL1pkZURKVndwY0hLbXBCZW5zZWFXL3RseCtK?=
 =?utf-8?B?WVE5UFZrcFg4WDNzS2tXdXZzNUM4aEZVcTBJdHBBUEdLOGJzdXdPL1FENHRI?=
 =?utf-8?B?bkZFMDN3Y3YreGdDTnhqM2tmcTdpUFdVLzc4K25UeE1rSyt3Q3hqVmJXY3NI?=
 =?utf-8?B?OG1Ud2JrSzE5K1ZDRUw1TjVKY0xFMVhxWmdyMFdqT0ZDZXNtb2haa1BWSjVu?=
 =?utf-8?B?YndoSDk4aU1zZ3R0NGxLZ1NkRjl4OEJRMkZmRll4akFwYXI1dy93WS9rWHF3?=
 =?utf-8?B?RU1tMVJFMGV0bnhrMWdTZmUvQUVYK0RSWE9FSUszV0dTQnBZVHBZTjBkaE14?=
 =?utf-8?B?ZFFtK2JtWmtXSW8xZ3g4aHFvY2VnWDlpZkxpcmswNVhqNkF6NHVTVEw2b0Vt?=
 =?utf-8?B?N2RaNzZXdCsyK1M5WXlyUlR3eGZzTUtYYWlvUGpZWnhzVG9aUWxlb2NDNE1D?=
 =?utf-8?B?ekFmWm5tRDBRNGx4ZjViMnlBU1Nzbk5kOWErbDlCTWtyZnFNY2x2Ni8zSEVB?=
 =?utf-8?B?NDAxSVI3U3g3d1hpdTlSR3ErQUoyTDhMbkt0d0JwNGIwb01HeFgxb1U0NDFT?=
 =?utf-8?B?UXQrblJOUWhIRUVwK1YzQnVhMHJTSHRYaHdGOWRwbE4yTk90YXRhNG9OeGli?=
 =?utf-8?B?bHN3QjUxQXZzaHNLaUpOZXRyeVB2SmplR0F0VjJLRk8xUVdCby9ScUdLTGlo?=
 =?utf-8?B?TTVmQUQvUEJva2pYODhldXJ3SDVQQnZqaTByN3pxUGgyYWkxaTFXRHlGOFBz?=
 =?utf-8?B?WVBOVVk0KzlyalRJYkZ3UURMQ1p1TGdtMkNENlA2Rjg5RG1BS1RRWEhpQm1C?=
 =?utf-8?B?Y3NoSERzVFpYb0NXUjRsYzllSHAwdmpIcmY0UUFvKzlyL3dIVFJkTm1zVUJy?=
 =?utf-8?B?SHUveWd1Ym1BL3RVbFB5bURuK3Zxck5JVGJKa0F6OGVTZkFsNFZpdzFnd0hw?=
 =?utf-8?B?eWhsZVI3MzFnYzVUb3A3RlhhbnZlamZCQXNlcTRHOW81ZUtvR2cwWFVlRzRT?=
 =?utf-8?B?R1BHbWFnQ2Z1cFc1RkxPRDFYRXF3ZS9DclE3QU45TFRkUHM4WDB6bU9vNzRu?=
 =?utf-8?B?UTZQSlpqM1YrYWcxeXp5TUtjWjFqeE9kQWF2dHJIN3ZXNnZGY0Eyc1VNUjJF?=
 =?utf-8?B?UjZZUHNBUDlYSDVESXZpS2xyMnFRblpsRzFJWjlEYVFxckRLbm9tV0l4aGUw?=
 =?utf-8?B?YlcvWnpLRHdZRm5MVEl0TitYWDE1NzFLYTU3M3VONHNkNVFOOUQ0aEhkNXM3?=
 =?utf-8?B?TDUvWUVrMEdlQThkYnMyUjNCRDVOT2F6Rmc4SzRGcXk3VEdJZGtDSUlDNGpy?=
 =?utf-8?B?Kzd6WGlZVWV6QTd3aU53RVZPeUo0Rm5Bc1Irajl1UGRlQWRRUDJDNFZjcTFn?=
 =?utf-8?B?aXNiREpDMnVDNWxvSURKV01xTEpUanRPY3JMRHVEdWtRNDRteTZkMkFNbm5T?=
 =?utf-8?Q?8cAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGM3a0Z2czFuS3dJSTUyY1ltb2FCaDR5ZDB5WC92SkNGeFV5MFZZWHFiZHpC?=
 =?utf-8?B?WGNXbmhRU2ZUengvZTFaUlJMYXVWMmtWUlg5RktnSTBvT1RyVUJoNkM2bGt1?=
 =?utf-8?B?VVhwYmsvTHE1OU1vZGVvMFJHc3hvWDZJNk12eTBTTTRMdUo4MGhuazVpOW1B?=
 =?utf-8?B?elZkdktVYzFrUU5iT3FPTEtMTXl3MUg1cGpRbzRjRUttaEhNTVpuUkpCbHBa?=
 =?utf-8?B?R3VSaDN5ZW55UmZydlZGZ0VRM2ZtV3BUTWVIaXJXcXIyaFJreUpsMGdLSGxO?=
 =?utf-8?B?QzdIeWd0TWtua041L2czZVB4K2o2eS9CLzY0dnNOLzFMSTFsNmNpREk0V1ZZ?=
 =?utf-8?B?SVBvK1NKVkNnZXBteUVTdHM1dzArc0F0a1pmdWl2ZDBCM2R1YXZ5T2dvRkRW?=
 =?utf-8?B?eGcvbmJIZDdiVUFQN0NaT0NxUEpSOW5UeEFWZ1hIeE43bDFMUHNxa2pPS2xU?=
 =?utf-8?B?Y0VqbnNRN2g4WTlHVy9RbUlRMVUxbFRPZTAwcmhlS2tCRDdsNDY0ckVJMnlQ?=
 =?utf-8?B?dDEwOWI0UnBLTVBCMW1VelNPMU1SUGJ5MW5tUkdUL3g5UjRmT281Ui8rd09k?=
 =?utf-8?B?SFZPcWlUc2NUS1llVEFFNTF1SCtlN3hFVTlQR2ljZklhVm9BamcrVGdiY055?=
 =?utf-8?B?MjI2dWhxbno4T0pLZVNQQ2RqN3FGczg5ZEJ1SlNMaXZER0tzUGY4eGZFWHB1?=
 =?utf-8?B?M3BPQzk5ei9BU09LVjRlVHhac05sSENHWnJrTmN3N1VsT3dmeFJDM2x4QkJy?=
 =?utf-8?B?UnJlNm13NnQwQm9YZkZvaGl1Qm9JZHFmZmNNVDNKekJSM2Jqdi93cUdYS0Fq?=
 =?utf-8?B?OC9ScEFmTVg2amxaemNLSWQwS1ZHNzV0OElpN1RkMERPdFRBR0VVS2hXUlQ4?=
 =?utf-8?B?U2JYczJtN3hxUW9mOUZsVXpRa2Jzc2liSVYybzkvVEE5MGNVTlVBRVpRN3I2?=
 =?utf-8?B?TEk1SFY0YUdjTzBnTTBsNmc1Rk84WkpSanMwczJ1VW1tSWtLSWxVMnFCSTNO?=
 =?utf-8?B?L1FDQnB2QnE0elNtKytCUVVIYVBVK1VvdGdzbTExNS95ZmJrNG41LzVCU2Rx?=
 =?utf-8?B?SXpPaUdUa3BmT0pYbjQ5WEdoNXVGRzZmNmUxdGhuWlBxUFA5WmhVcE1BSERw?=
 =?utf-8?B?alVCOVd0OG53OEdFWWNBK3Z3blM2dmM1UkpJWHJNbGFKY0wzc1hMTzRkazVB?=
 =?utf-8?B?ckRNeFk0Q01JSWRIZCtRVEpVTno4bEhTWVpJZ3ZTeVFpMzhwOVZNZ3Y3UlB3?=
 =?utf-8?B?cXl0VE5iL1ViRmlEc053cVJuZ0l2cHlUenNaMVN3bjVESGVBOTBWbUdYeGVU?=
 =?utf-8?B?TFE1RHl3ajNpOUFCSWxlMWU4N3JIMDN6eFc2ZklTaHREMFNvSWlNckt6Tm5a?=
 =?utf-8?B?NXZaL1ZUeDRZYzlKN2xxcGFkaWloVEFMYU5keGpXclgyemFKQXFMejExTlo0?=
 =?utf-8?B?Q2ROcUlRbTRnYUxPQjMzRVQ3VmNHUE1uUXpDK0VMUGhXbDR0ekJlZ1cwbU5l?=
 =?utf-8?B?MGVoWWpXcmlxSzEvc3VOdjA4M2JFbTFFR2dHcWFCZ2ZMamRmV25JSFZPTkdp?=
 =?utf-8?B?Z1VwUzlVZnBneFo5cmZFMURxUVJSNFgydEt5a0wxVmpqQ1R3cVF5djNjTTVp?=
 =?utf-8?B?TVVuSnhjbUFZK25FVHRtQm9lRnZLU3BjbENDN1lZSlpCci9IdU9rYjZjTWFM?=
 =?utf-8?B?eFNYWXd0WXpldXRuR2EwS2xVZ2lTYTdUY3NlQVJnbEZsUjY4NWVoRlFzclJC?=
 =?utf-8?B?UFl2MUhtSm9YVGxHUFNNdlF5Skt4azYwMm1wNGZIR0VyZDY2V0crRkVTb3B3?=
 =?utf-8?B?RXhEdGVXeW8vK2oyL0FLYjJVTFo5L3lROEVERUd4d21jZXVsZ3Jubk0zRXVB?=
 =?utf-8?B?M2ZvNng0cEQxZ1grd0NTTytQZkNUMHZkWXZ6emkwNlZ4SDVhVS81a2JSb3FB?=
 =?utf-8?B?NFVIYTZHWStucUhUcGxTVU41ZkF0UHZWNzJQUTJmY3FoS0VvMFg2cmt4SGsr?=
 =?utf-8?B?OHZ3b21qZjNrOTQ0dXU3c2JKY1gyYkdHQlFuYk5sVHRpNDgxQjBUaFptbUZl?=
 =?utf-8?B?OXFwZ2pPcFpNRGEwOHpNVE8veHh5MW9ydkNLaHc0WG9lMjN2TFQ3ZnRXcEcx?=
 =?utf-8?B?bUJrdmJBK2IzK08vOWVrZ2txanlSRUY3ZDBZa0tnTm9jTmpDWkxtYnR6OVc0?=
 =?utf-8?B?UEVGektvV09ZeHJHalBDeUFKbHBsaVVQRnhaNVJDeVQzdGpFbDRJK2RNb05p?=
 =?utf-8?B?OWdFdWtYUEpkWEhJRFphT1NIcUxKbnJTMUZUdDJTcjgwOXRqWVpHMGVwbExM?=
 =?utf-8?Q?wBtieMwgGQCskl9pKz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 486215e4-6c3c-4105-14f7-08de5ffe05f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 12:49:36.2530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+6k3gXWwMWUm/K502X9o7FmixSir6/uUzVX0TiSW5jjpKTSGhReevOAHm3fKQCR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8285
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 12D45BAA4B
X-Rspamd-Action: no action

On 1/29/26 16:33, Pierre-Eric Pelloux-Prayer wrote:
> Having a helper avoids code duplication.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 871388b86503..c43f352df953 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -220,6 +220,14 @@ static inline u64 amdgpu_compute_gart_address(struct amdgpu_gmc *gmc,
>  	return gmc->gart_start + entity->gart_window_offs[index];
>  }
>  
> +/**
> + * amdgpu_gtt_node_to_byte_offset() - Returns a byte offset of a gtt node
> + */
> +static inline u64 amdgpu_gtt_node_to_byte_offset(const struct drm_mm_node *gtt_node)
> +{
> +	return gtt_node->start * (u64)PAGE_SIZE;
> +}
> +
>  void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct amdgpu_hmm_range *range);
>  int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
>  			      uint64_t *user_addr);

