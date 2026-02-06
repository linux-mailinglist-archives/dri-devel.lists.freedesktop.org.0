Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLhYOt05hmmcLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:58:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FA3102549
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8955C10E8CB;
	Fri,  6 Feb 2026 18:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LuaVxgpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011061.outbound.protection.outlook.com
 [40.93.194.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB62810E8C6;
 Fri,  6 Feb 2026 18:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcekRohw5KkN8SyAz+LGTDgA8kXrHWEgmOz4u13Chr7MM+M9YELdeaMQgYG4rYbp4IYJwm6FW3YW5zTE4L4ra4SOx5LoAbXIKjSAfq9wh5YQ1Nvx8A1aQLvR/SjuoViqO2WZXaIMUn5AMdxLucuuNtoNCE82f36cpo6yC2rrlyIsVOfHJq0Q1xmIm6/JKd9ljafGU76g38Fg9xIgHcDh4KFvJ3+P/iAOw0yv9uEVZ7fdc0WynISGM0s/V1Ma/A67dUw9qngj5DheycXojwitHnTLvWvMbE8j5ff46u6J6Tngd6u800z/50p2HuTyr0+nC6EOSPBX0CbzZDF/Usmhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DpRXmTLowRG6Mp87ZGJHk06b2yuTVMq8m5Vv/yhmIY=;
 b=bHfCw4jpMwN/o4Zztl2EJxKWs6Xi8yx1O+SWnBzJe1Tx5xI41Jwx5nPt7u089a2zeNKpZejeGzn2GjjXpR8MHEVhuRiLpJi/hGgFPdEqbOYHjh/M5kh7uJYSRV78JhrnrHMg2Y2W3atQpJHvsKtFblQIYZMwd7EwEXdK48DrYAPu23zf5qeAL26aKwxI37ZWOb+xP/d+rNlTl2qjza8q+n7pH4cbnSNDFobaj2ppjeYox9YwKL4DGFcG3b/Z4JEUuvTI2+EeVjGSr/idPRiYkGt4OIiz2pV7+wF+urbz3h1V8tUJzvGJz9EoqFBdyyz56caZfdc+VLjBtaTMD4SYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DpRXmTLowRG6Mp87ZGJHk06b2yuTVMq8m5Vv/yhmIY=;
 b=LuaVxgpchNwDs4JJUswwRetOitgoqod9JmqpM9uHpbpueyK3qtsoPw5AbkC/JyGQLYPp4nlvV9t2OPiZzshXsKKY/bo5laOOP4rwVGfkhwGzhkzmTVV2AGm6sm8mQDaSUuww6Vvh+eOSg3TaDXlBymXeBUEM7dBSuGmG4h0QxCA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 18:58:30 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:58:30 +0000
Message-ID: <ee4a21fc-3625-4086-b2d0-9acf20b5d2ef@amd.com>
Date: Fri, 6 Feb 2026 13:58:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/19] drm/amd/display: Add HDMI VRR desktop mode
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org,
 admin@ptr1337.dev
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-20-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260203185626.55428-20-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::18) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: a34bc4df-45b7-4173-d5db-08de65b1b7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1NkMThDbm1LNlBvaHBySnB4Q3VVejlBSUZqUEJWRllHdzZlbUowNnI2U3o5?=
 =?utf-8?B?K0pUSHM2MUxQOHJ3L1JSK3U1MVQ4MStXcTZZcFpndzcwQVljRzFjVW4xRHVR?=
 =?utf-8?B?Q0lMZ1h1WGJYdzNBVUY1TlNwd1k5ZjlwMk1yam10S2poSHlzSUJTVU5PRGQz?=
 =?utf-8?B?cmxUWGdZSGhtUEdtdmFxdm9hL2liQnJOMGVQUXYvQ2o1T3BQV3p3eGx2OFpp?=
 =?utf-8?B?Y1F2UzU5dC9oNGtnVUczZkhNeGZmVHBwQUNFaVM2ZjBEbVMyWmNmcDNXQVAy?=
 =?utf-8?B?R1JjUmkwdGpBSWh1VUp1WEVqVTBLOTRNMDV1TkFBanBHNkZyc3cwYkczdm9X?=
 =?utf-8?B?L1NqUnNQc1RMRXlXUy9DNFJVdUxOZVdwemNtM0ZPa0V0WG5qYTdkVWo5RTFw?=
 =?utf-8?B?ZVVRc2xBaTdmQmpZWUlaaHZzMi9jc1lwdTlwdVU4UDFVeG5uY0pHeGtTNjNB?=
 =?utf-8?B?VlIzOVlrcENNUm5meTRZOUl3ZGtTZnNxMTdISWcyL3RxL1VxSTUwUU1rdGNn?=
 =?utf-8?B?S09BV0tja1MyQjMwMFZBY2JpTjBlMmJha0xJYjNXc21HeXpyc0QxY3RjWXVO?=
 =?utf-8?B?bzZDaFRGVTBXdnMzanI2Tll0NEE0TWxOdXcxR0xRVVArUmJJbitCTGx0MmtR?=
 =?utf-8?B?aTlpVTNzWE9pc2ltL1NjanNQSjBqaXBGd2ZsV09Xalo5WmpzdkZBRUJsTlRE?=
 =?utf-8?B?NWFWaGc5RmlDeS9HVG9RUWY2U2tKbkRnK3l6QUp5SzI0a3RmdDBQKzEwcHJU?=
 =?utf-8?B?dU1rblVKdEFxaTA5QkVxWTk0MWk4VGYzS0cwTnBxN3NMaHI4OHFvbEl4cDg4?=
 =?utf-8?B?VnhYdTBxZFU0S2o5MGorN2kyZ25qSFRnVHc3bGgvRGxqcjVVcVFtNUVSZk9r?=
 =?utf-8?B?T3hrN1VnQWFCeUFmWjZhSWFTMzNjQThaVDZUczNtYzZLRTRKcU5LWUxHV0lW?=
 =?utf-8?B?Tjhmb01lcjVvNzNKNml2VjllYnIyU0tLZzZyNjFHTUxaQ1NxV2tUQWtXbUwz?=
 =?utf-8?B?b3lIUEtkRzN3WTRMZVB3bTU4UGdmcHdXY1gwZWNYN05sYXlVU1pGTy9wZU9h?=
 =?utf-8?B?UC9DdmNTVUNJUFowTGt6QWt1UUNET1A2VzZSZFFwcG54Z2NoUnQ0ZEZPSElo?=
 =?utf-8?B?ZFFTbGNJVXludHEyNFZYTVNuWHREMDRhdTN6azlHZ3U0ejkrdHovS0R5Y292?=
 =?utf-8?B?cFZGWEtnUDlVeVBBTnVlRVE0VlhsaGErVGVHOUtYSXBzNjNWb1NUZndDU290?=
 =?utf-8?B?bkorZGhJTWdxV002dW9ydnJnV0RYQzNPNitHNHZFU0lBY2xsaCtrdkFIZDdh?=
 =?utf-8?B?ZTByeGFuUHBZbFRXTEQ4M25iek00OXV0M2R6a0ZNTjRJTlAveEt1SjI2cTJF?=
 =?utf-8?B?bGVWMHNzVXpObSsyTzdsYUU1YnkwQXBqQTFpR3FiK3hzL3pmSmdRcGpodlFR?=
 =?utf-8?B?ZTVUT2pqbURqQUpDRW1iUFQvbnBVdkcycFQ2Zy8zdE5xQmMxQ2EvUkFYZG1u?=
 =?utf-8?B?NHBHc2pVaXhtaUlKSzF0NnpBemUvY2FNclRSRDNuRlBDQjRYbm1GcStkRTFC?=
 =?utf-8?B?R2Z5ODJLajJoRzFKZ0hyaGpwbnBUbGpJeVhoTFBPOStIU1M0SEJrMEh4bFVY?=
 =?utf-8?B?OGhvNW9ScDNPdGJETUZCcGtyZ2ZOemwxSHc5NkhTOWQ4U2wwT3JLREc4ZmpR?=
 =?utf-8?B?RkxjNHJRc3Z0ZzVDL1l6UnEyV0M4d2JNdGhXN0ZoZGpXbTlmaU5tWmtET3hn?=
 =?utf-8?B?ZW8xbVpNTFVqM1V4SVJZRnNnRmgwSTZRYk8xdWlKM0dSb1JTOFlFTWtKUEZk?=
 =?utf-8?B?Y0xrS3o3TWY3cHE4di9HaWZrYm9uMUtHNk13QWtpMUtLcFhrS09jaWlxM3RR?=
 =?utf-8?B?TUZaN25Wa0FOdG5DdGNpL2VnVmJUMkN6NithaGJNaHBBL3VyeGZLSENESmdU?=
 =?utf-8?B?YlNvMnovSFk0bEx1K2FIR09SUytYVE16UG1Vb0hDUGkvVWpuaWJESllTcWZo?=
 =?utf-8?B?RGVia2ZOOVVHS0FLVFBUVnowY1pqeE9DMHU2cmdhMkN2QmIzSmwwODdDVVQw?=
 =?utf-8?B?eTBURkRWQWZLYTNwekYzN2FZbkNvdTloNEFFTGQ3VENXcHQyRW1BdE1EOHR3?=
 =?utf-8?Q?M6RE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXBvSit4TVpyLy8zek1DYkwzNVlPYnV4MUorZzJxczZzdHoxYkJZTFRJUWNr?=
 =?utf-8?B?QXRwV0pISEc4ZEI4ZEJ5Y1ozZmtaTmlmS3F3Wis4b2huYWdyS0JXSW14TzQ2?=
 =?utf-8?B?VWFyTmpaSWhIVjV2cHRWdUpYU21aVHoySVNDWWRuQ0FjRFlCZEN5L1lneDNy?=
 =?utf-8?B?K0tWb1FIWU50c2d6aTVKUHBVU0hkM2hZbmluZTIyK1NXKzVGVnJRMWFDWW95?=
 =?utf-8?B?MFd2QzV5K3hVK1V6Nnp3aVhaNy9ka2dGak81Qi9IZGxZVDZlbWY0YjYxVm9o?=
 =?utf-8?B?L3paVW1mYWRCZTNadUROMDMxR1dMR3RTMXRtV293TTMrWStVT3JId0FCNWhK?=
 =?utf-8?B?K3BzL2FobmZjUFl2cWp2b2laT0FmWWFOeHNnSlFKaWg3RG13UjYzTDdsd2lP?=
 =?utf-8?B?SFc2UFhMVlJ0UGUvMXIrL0w3bXdJQXcwMnVUL3VqUkgyci9PaWkzLzVwWVJ2?=
 =?utf-8?B?UTc1K01tRWdGUnRTRzBvRndNcVpaeEVOcTJLQTMySm93dzBWcWk0cWo5NHd1?=
 =?utf-8?B?cUFIYytyUFpUd0F5MVBNMm9heVhoVTFmblNmYjdMYytvVndZWlB2ZFcyYW5J?=
 =?utf-8?B?VTJJYmhDcW1KeW4zSEkwS0M1SlpwNnlMOW1xSkx0QzB4alN6YVQ1d0V0L24y?=
 =?utf-8?B?TkZReTloV1A2NUQya0pISURndjlqK3duYmZmU3kzTXBPN2RGMFB5WDYrTnRp?=
 =?utf-8?B?enRzSFkrWEl0bnlMTUg4TUV3bjZCR0ozcmxoQlhBUmlxRGdRWmZnVXZNNnZC?=
 =?utf-8?B?c3JUSmZsL3FnT3N2dzVXcGM1bktyNmI3OXpGZXJNWlRKZ205RU1qMFFxVVJX?=
 =?utf-8?B?SElTSTJoQkxVMFE4UUZUVm9XQzBySndsVGdlNHVqQWV2SXM1TTVyNUNOZmNs?=
 =?utf-8?B?NGlCcGo3ZmN0eDhpc1NGVTZCaHdGYUdZRnQ3ZmNaS2cxdkhCM1V5aW9yTnRD?=
 =?utf-8?B?UzQrRy9ESkw5MTBmNlVxZldQUVIrb3k4anNvZFliQ3hjRUN6TTBDTFdNcnk0?=
 =?utf-8?B?VUhZZWN5ZnVycTJHRW9rbXd5SHkxbFF6YnN6M2NSRG14eFliRlN2Q2R0bVF0?=
 =?utf-8?B?aTlYNjdDRUZnbzZURzJZaHcxaFFsMTh1YzR6N1pJdGRjVDJ2QTVUOWR3RWhK?=
 =?utf-8?B?STZIczdlazM5SkJzdjBYM1hKcGpwN1pWK0tOY0hlZDNTRnp5U2JnTmFTejdq?=
 =?utf-8?B?aFBmZEFRMGpUK0k4aG5NRGlqNFEweU9HOXQ5bVMxOXgyb1RwYklLZ3VQRCsx?=
 =?utf-8?B?U3FXaGthTzJXeE5VaW0rU0E1eFJjaUlOSmdaVXBjMDlwcTZYdVA3UWQ5MXhh?=
 =?utf-8?B?UDVXY3k4eXdPSVV1d0dVWFl1cWZSVHJhMUpMb2NRSC9rY01rblBOdEp3NUpx?=
 =?utf-8?B?Z0cvUDNhblQ4ZmdBK1pSTzQzZHA0RjR5T2txT0xqbTJpQ0U0TEVsdmdLcVNF?=
 =?utf-8?B?Q0krVFRQYVZ6QVJKQWFjSGloNEpJZXBMZWREVnNmMnlSdGk0S0lqbFJhMFF2?=
 =?utf-8?B?SHNVNTN3Z2JLTHZEOEtWc1BZbFUrNHJkZ09lV2hoMVFpVmNLSnFlQXBkY05F?=
 =?utf-8?B?ODhQSmFvZ3M3cFZOVHQvOE5ZNkpNRHF4dm5CWXVaUUxTN3N5ODR1TjAxaWhP?=
 =?utf-8?B?STNQSUc5YjZsMERFQjFvVTkyendmRlprMkp3MzhOZ3dyMThBZEYwMU5uRkZG?=
 =?utf-8?B?TzhnN0t4UWkwamF0aTNzV20vUW5uNUw1SUZTSmVVSmd6aHJBeXBEd3QyQm5j?=
 =?utf-8?B?bXZ2c0tqQmxiUzl6OEExa2ZSVkwxOHZUdjhFcVE4R1g5SVF0d2MrSmQySkpG?=
 =?utf-8?B?N0hHZEFqUngrQnZNOU41V1NId1lHUGFTK1hQV2xGVjlkZG1MZHBra0QvNWEw?=
 =?utf-8?B?cWliN0tBN0lic25VcVlUK1A2Rnk0UUxhUTRleHVqdUc3SjVOcE5WYS9CTmxL?=
 =?utf-8?B?ZGNJMmZibTFMVFRuRUZHdHlNcklzRGRhZ1ZOT21ybTVLWTZTaVNWdlcxWkJp?=
 =?utf-8?B?ZS9FZkhKMXZTQzdadlZMR2MvY05aNlljM2FhZ29qeVBPdEZwMTU0am50cndC?=
 =?utf-8?B?RUl4ZVc4RUw2ekNhdEZVL0grYnU4WVZEbXRhOFlZaVFxVmFGVURUNkt3bWhz?=
 =?utf-8?B?T0ZxL0FMSlprSGJ0TzZ6SGhPUWYxSDNmUWtMS1BOdHN2RWgzeTVTL0V6NGVq?=
 =?utf-8?B?ZmUvbm1mUEFiNnE0WGxNL3FJOGttZXgyRkpwZ3czRlg2bXJONWREdnJBSDJ0?=
 =?utf-8?B?ZmJidUN3RU8vUytGdTRqWVdNM3BXK1FEUWFNQmNoem1wMXA1MmFkWUMza3dL?=
 =?utf-8?B?Q3hzaVVUTzdSYlhYeTFPQzk1ck1meFpNTThOWUp0SHRhaWJPNzcvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a34bc4df-45b7-4173-d5db-08de65b1b7c9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:58:30.1409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGoD7MmGiA7xazK+N0p5SFm3E9fqYINSR1b8R1uCa/3W3aQ15yByTGi20SyiHpu8aEX28SmK8aXmdohSFiuzpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 88FA3102549
X-Rspamd-Action: no action

On 2026-02-03 13:56, Tomasz Pakuła wrote:
> [Why]
> Many TVs and other HDMI sinks suffer from blanking and possibly other
> glitches when VRR is toggled. With FreeSync present on such sinks, they
> behave like the signal is always variable, even in fixed refresh rate
> situations.
> 
> [How]
> Keep HDMI VRR toggled if it's supported and not explicitly disabled.
> Additionnally, add module parameter which allows users to configure HDMI
> VRR triggering to only happen when the signal is truly asking for
> variable state. This is useful if end user has a TV that automatically
> toggles ALLM/Game mode when VRR is active and such user doesn't want
> gaming mode in normal desktop usage.
> 

Can't this already be done by the compositor by simply setting the
VRR_ENABLED property on a crtc?

I don't like doing behavior behind the backs of compositors that
they might not be expecting.

Harry

> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                 |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c             | 13 +++++++++++++
>  .../amd/display/modules/info_packet/info_packet.c   |  9 +++++++--
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 312aa32064d5..d49cd55e0f35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -269,6 +269,7 @@ extern int amdgpu_rebar;
>  extern int amdgpu_wbrf;
>  extern int amdgpu_user_queue;
>  extern uint amdgpu_allm_mode;
> +extern bool amdgpu_hdmi_vrr_desktop_mode;
>  
>  extern uint amdgpu_hdmi_hpd_debounce_delay_ms;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4b038c8bbf9f..f53c2ffeffa2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -249,6 +249,7 @@ int amdgpu_rebar = -1; /* auto */
>  int amdgpu_user_queue = -1;
>  uint amdgpu_hdmi_hpd_debounce_delay_ms;
>  uint amdgpu_allm_mode = 1;
> +bool amdgpu_hdmi_vrr_desktop_mode = true;
>  
>  DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
>  			"DRM_UT_CORE",
> @@ -1146,6 +1147,18 @@ module_param_named(hdmi_hpd_debounce_delay_ms, amdgpu_hdmi_hpd_debounce_delay_ms
>  MODULE_PARM_DESC(allm_mode, "Changes ALLM trigger mode (0 = disable, 1 = enable (default), 2 = force enable)");
>  module_param_named(allm_mode, amdgpu_allm_mode, uint, 0644);
>  
> +/**
> + * DOC: hdmi_vrr_on_dekstop (bool)
> + * Enables FreeSync behavior mimicking by keeping HDMI VRR signalling active in
> + * fixed refresh rate conditions like normal desktop work/web browsing.
> + * Possible values:
> + *
> + * - false = HDMI VRR is only enabled if refresh rate is truly variable
> + * - true  = Mimics FreeSync behavior and keeps HDMI VRR always active
> + */
> +MODULE_PARM_DESC(hdmi_vrr_desktop_mode, "Changes HDMI VRR desktop mode (false = disable, true = enable (default))");
> +module_param_named(hdmi_vrr_desktop_mode, amdgpu_hdmi_vrr_desktop_mode, bool, 0644);
> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> diff --git a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> index 5fd9e8aadc98..b41e2240e1ae 100644
> --- a/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> +++ b/drivers/gpu/drm/amd/display/modules/info_packet/info_packet.c
> @@ -654,8 +654,13 @@ static void build_vtem_infopacket_data(const struct dc_stream_state *stream,
>  	bool vrr_active = false;
>  	bool rb = false;
>  
> -	vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
> -		     vrr->state == VRR_STATE_ACTIVE_FIXED;
> +	if (amdgpu_hdmi_vrr_desktop_mode) {
> +		vrr_active = vrr->state != VRR_STATE_UNSUPPORTED &&
> +			     vrr->state != VRR_STATE_DISABLED;
> +	} else {
> +		vrr_active = vrr->state == VRR_STATE_ACTIVE_VARIABLE ||
> +			     vrr->state == VRR_STATE_ACTIVE_FIXED;
> +	}
>  
>  	infopacket->sb[VTEM_MD0] = VTEM_M_CONST << VTEM_M_CONST_BIT;
>  	infopacket->sb[VTEM_MD0] |= VTEM_FVA_FACTOR << VTEM_FVA_BIT;

