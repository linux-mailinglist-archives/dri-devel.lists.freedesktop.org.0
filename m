Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361BD96BAD5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 13:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77B010E775;
	Wed,  4 Sep 2024 11:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0NLbW5mJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC010E775
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sxjfy0TzNW59Akufk0UAwGmjcIvxC9duOfMisvuRwancwOe8MilvTp5vWilfBJ0u2WfjEKgTzSqHkUlO1lIYemu8eaFnraMtk50JIYGfCHnRRyPApOeMME5rEV84X78jouxp8HFLlmW1zu+hC+QDUkZ9Tgp8ooptW25EmbR13d7SWTPdttOgmi4rJ0bjPCjg8gkpAsggfEu8jfxuwRq8bW91i3g+zO/FMh+0EyKAULtTVGpffDrUv9h/NVMPw0J1yrN/62TgBFfjp0F/AH9flOcRN/OhvUsNgQeGZ83MBwRveSSj9IgyEvEbLKw3VpSPXq6jVe4Ax0c9qpEE12rvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCEjvWyxozhLg+yzS6J7OC5pagFQ9+HljElf3peFFbQ=;
 b=eX6mFk8iwUVKomsPHfdRk0oWF8G4s7o522YmolX0aVN7lrefilPI8QZgawixhIMbvFdRgEHGH0/fe0kbwo+ajiFsnjefSxcX7yPepBT46cC2BrggBjU5Lr7cOqlC35U2PcyRn8EUPv06P4SsWfWIz/qLzG3p8m17ROe4w4QrqAAwVy62fipJ3a7WY0TUL3EOeGfwnXuh20hACGKvkitKiXtUt67TZpP0diFObaGvkmRtoBmyRHZqd1KATmvxsi4Cl7QTelkYt1HTrS/rWopojrJ45+S/sfSPex5QhCfsqRAa9RWSDNDXwiKHS65b63cEedOm7tzSuQpiiAvQZkpmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCEjvWyxozhLg+yzS6J7OC5pagFQ9+HljElf3peFFbQ=;
 b=0NLbW5mJuPdLbrBmngZO3Pai601mA2LB4wRw0pGUToS8tQ4WKymoVl7duGJKpEWsgdVD32QgKere5OmmIE1AXe8xb/gaRXcV21uoUWI3siUvQCvH0onszkRmpnccWFqQApQNZagh9t/rY5g/V0F7hHg0aJIq901hLVEsThPVwrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 4 Sep
 2024 11:34:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 11:34:25 +0000
Content-Type: multipart/alternative;
 boundary="------------e2kLUqsgBzP50WVfdBJ9WHYl"
Message-ID: <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
Date: Wed, 4 Sep 2024 13:34:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240904132308.7664902e@collabora.com>
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c68bb88-3e37-4929-c93c-08dcccd58735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0p0WllMaU9XNWltNHBLakZOZm93REhvTWZRNGY1dFFWdWM1YjVZRlJ4c0xS?=
 =?utf-8?B?TGhKTyt5bVQ2M3N2Tm9FbjMvdzNXVGZKZUZPZkFaQWVsQXhCTUl6enJ3Tito?=
 =?utf-8?B?MVlGdzR0Qk95M2hCNW9HN0hzK1RzNzNQd255S2pUQ1ZzdkJCRDAyTFdaR1Ju?=
 =?utf-8?B?amZELzJITENGR1luVlY2MzYyVHZtVnVPMmxMano2Nzd0RXkra3dYMlFXM0M5?=
 =?utf-8?B?ZDZTVTZDY2pGaUJUbU1tSHh0TkttalozTXNVSDFvc2hmVG90cXZvL0w0WUo3?=
 =?utf-8?B?ZHFNRnhqUDd2UXd0K1FZd01vdUNMd1hjaHkwcGpXOVV1dFd0d2p0bHk2SzNw?=
 =?utf-8?B?ZVlDR1JHZklBUU9MS1lHOS92cW9HRk5XVHlWT09sb3RqM3JmcTh2QTJtY0RG?=
 =?utf-8?B?UXVpRy8zaEV3eUZGWUlsQjFlcnh6WU1vd29SdnBoMWlPMHp3QjBrTTRZOWhm?=
 =?utf-8?B?R3YyT3grbVpVVU40ZmdvR3Rhbi9XSDlUVUdjQVJucUR2N3Z3TFdwaDhNUWFs?=
 =?utf-8?B?ZGpyald6Mk5XOWNweHAyanhWY3owNjVSYjdWM2x3NjYxaWpQdzJNSTVnSktl?=
 =?utf-8?B?T0UwS2VEanpZTEVKbHMxMWNCRDdMNVVTeFJyYWowNk56dGYxZmNJczRNL0ZF?=
 =?utf-8?B?dno1ampzMDF0eHoyNGwra2hVazZpTHFXUlVnVGJGc2ROV1lqY1JLYldwYytH?=
 =?utf-8?B?eW5UQzlEaWMzZlU3SEhyYjdjbWJGYy9UU2ZSN2hPY1Z3UlYrcS8wVWxZNity?=
 =?utf-8?B?Mm9HT2ZMSzZDNTNLbWhwN3I3aWJrelZEakVuKzV6SjBibHpSQlpMZHk4L1lo?=
 =?utf-8?B?WnFJbXgzZ1ZwMjRpVEo0ZE90SmhvTStLZnNuZGxRV3JHelZiUmVuRnBibFBE?=
 =?utf-8?B?WUU4ajlGK0tZRlllSVdmT093UzVwVWhhUkR5cC9NMDlWMzY4UWp1RXYrS0lO?=
 =?utf-8?B?UkxGaGtlRlExRDhFdG9ZK212czYzTXBCQ1ljcS9kVGhuMk4vLzlrcjEzT1Uy?=
 =?utf-8?B?V2ZMaVFtR09IK0RZaVhXbWlicVpwSEZKRU9QTUI1ZkN5SDVzd01IWTJnaHpz?=
 =?utf-8?B?QVUxZ2dOS3VrTkMrVGY2Q1plUDhsUG5yYi9NMHorSG5FMWVRYVRyQ01CRVpm?=
 =?utf-8?B?THpQR1E0ZnI0K2c3amNzOSs3Tkh3czdkYjh6OHV3c3hzOTJTcW9sckpHSHBs?=
 =?utf-8?B?UnZaaDFxNWNKR1JWZm1PbUdUaHJBTmN3SE1aODJZTzlJRzdrbk8xSGIxaExO?=
 =?utf-8?B?MW1jakhNcFRmWXd5WERDeVlrQk9RcEZwSks4VC9lM3dic3VtVUxSODZlMDhx?=
 =?utf-8?B?THd6MFI5Z3pnekxwSTRLT0c4TDI0ME45a0xnd21MazRzOVE4SUhuUlNSOVdv?=
 =?utf-8?B?V0lpb01GdHB3QjZKYmpwenRYUWJBM2RjNG9GazNTRW1qdFhjd0VvQjd0V2xN?=
 =?utf-8?B?cDFIWlFSWXNuNUZDL3RPMnFiN3RpWXMzb0hQMkQ1a3ZuUkpMMjBKVlQxWHds?=
 =?utf-8?B?cGR6MXBucmYzT1RaTTFqU0djYi85ZlR4WEtDSXg1Vmp1dWJ3andIdm5FcHh3?=
 =?utf-8?B?Qlo2VUZFVXh2cGZFSmxUdWhqcE9MK2RiejhuaHFSTG1mT3NjdURLdHVaakw4?=
 =?utf-8?B?WXhPTVFjZFBhQ2x0VDJZQktJVWFuRktNNVZvS05sU0t5Z2w0WTZGeURFRHox?=
 =?utf-8?B?Sm5TMk5wOXlpRnVMQ2x5dTdHV0NCYXM4T1F4SWN1cjRlcDZKMC9qU1FzU1F0?=
 =?utf-8?B?aWRVejV2RlhKVi9RL1VmRnI5OUpnTGRUZWNlc3FFNVFzdklDeG41WWR5dVBD?=
 =?utf-8?Q?yvZtOOYhY5CmXNDZ+GFRCl/DW3vmW1FkS/LZo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXg3cHQ1U0ZWUG1xK0pTL0dwYkNYVHJZTmY4WS94cUNadmJwUVdFaEJVSDlv?=
 =?utf-8?B?Q3lvNlJDWlQzektZMmpDU0Ryb1Yyek1JbFNKcU04bmcxQ2VZK1NaRndRUzNn?=
 =?utf-8?B?NHlCSCtVdWlybmxxME1Bdk1zeDU4Q3RQTDBrYlkrNVZEZGNMZU93NytXbWZY?=
 =?utf-8?B?THNrMGlOUnMxd1ZwdlNiNUNOT3RyelhCVWxCUFVTRnRsRTBuVFVyajlsM0Vo?=
 =?utf-8?B?YmI3QlJSc0dKd0taTUszZmtHbE1IY25aazdxZytZc1pndmMvemt2QklSY3c3?=
 =?utf-8?B?K0thRkYrTjBtSzZwcXRzUEhURkEzQnoxVWt4cEFuQkRRY3A5VS9KdXExQ0Uz?=
 =?utf-8?B?cEw5U3dNdkthTTF3M3NCbnVDc29tVFZkcmpHSVR1STQ0cEMzYWZzYXNFYmFy?=
 =?utf-8?B?bEUydElDQmwzRmlUMU9OQkJOZXRRSW5xOFI5UmVVRmxBWHRvQnkvOFMweEpk?=
 =?utf-8?B?SzUzTnA5R3JmL3g4WE1lZDhWRHI1dmg4a3BrWVBHR3VBK3daQnB6OENsbTN4?=
 =?utf-8?B?WXFlNUU2cjJkSWgrMnF3S2Q4NUxqUU8xRUtXN3l5d0k3UW1pSDc0d2FuK0xo?=
 =?utf-8?B?UmtONGt0WmkrSWxzcWM2Rlc3clI1cDNyNHF2RHNBeXNOVnovUFZ5MTBoc1M2?=
 =?utf-8?B?WlVQMEZWTjBxRk9vVmU1RWJuYkZaZjd2VVo1S3ZuSzFsZS9NN1ZQNXRhWG9G?=
 =?utf-8?B?Y2tlU1pXRzZDWHZUTlpNRDRTZTBrUk9XMXlLZ05Rc2lOTlRsSHFBT0I4UkxB?=
 =?utf-8?B?cGhYUmswYVdwSUUwbDJUekJ1eGJIVHJhaFlKZFdvS3MxZWpveWZac2tqeWVF?=
 =?utf-8?B?d3ZXbXZzUVBNaGtmdlorcDlrNU9UMjhsUjBSMFdtcXdOQ2YrQ2xETkZIMGV4?=
 =?utf-8?B?SFU3bzd4YncrSWxEaXAxWlpCVndZNGZhVHZCWkN1K3l3c3B0L1piZ25JYm8w?=
 =?utf-8?B?ZmFKb0hONkZUK01Fb3NUSkJRQnM1S3FISTJRZTI3YTZIelpJa2c5RVpjM0lC?=
 =?utf-8?B?ZHp0MHdGVGhYYW00MVgzazhXZDZVSFZBeVB2RFNCS01uWjFPelZnQkMyWVdZ?=
 =?utf-8?B?RjR4NVUzZTBKTXNDaitMYStra1JWL2dUdDNyNDN0aFRNdDdwcEs1VnZIZkpx?=
 =?utf-8?B?VTZBcjNjTW5HUCthMU4vaXFBdzlLb0RiaklLakwvTkRjZi9FS3hlblNoUGlT?=
 =?utf-8?B?QWp4bWNLZXA5R1RtZ05wOEpZK2ZhRlVEZHMzbWo4NlF5Y003azJvQ2xQVEsw?=
 =?utf-8?B?eDU4S21uZjY5VVhVTjMvN3Y3UnNvZ2dCSFFtenZzYjZOZnE1bzdSaEZUYy9o?=
 =?utf-8?B?Z2pZMFZvZXFmaFZvSXRxOGtzOEZhZU16cjZjUEhzWkRQa0ZsZCt0VEJFczJ2?=
 =?utf-8?B?bVYzeHQ0SWlyUHVlUkE3a3k5QTVncU9RdkV1REtWL21PTm5VOW5FcHdyZFhV?=
 =?utf-8?B?MG9WalUwdzZPNlIxZ1N1SitWRkV6anoybVJ0R1lSbFJ3WlBCaTQ2ODVEYUww?=
 =?utf-8?B?YWkrcUNFNlovR3pWbTJ0cm4wM2MzRFk2Q3kvZGM3L010U2daSys5TGh4em1j?=
 =?utf-8?B?YXJiWjFRUHhwLzh3TTE1ZzhrKzhZUmpYWGdNZXJiNGVVY3EzRE94Y3hnamRO?=
 =?utf-8?B?Yk5wb2k5MEJyaUM3WUpvejdlU3BaKzR3UGFhcVFVVStyaklIZDB0VDdhcjRj?=
 =?utf-8?B?ZXpxMzdwWVRUUDA4OEg2ZUtkUnhNNVNxWUluT1BQNEZOTDZ1VzJxNUMxYlZC?=
 =?utf-8?B?ZHJORDU3d2txbWIxVFBTWFJVZktDZEZMR3FMclR6bnhGSWZDOW52OWNHWEor?=
 =?utf-8?B?VmhKMlJuV1p5N0kyaFdkRVl4aERSN1YwRDlvZVhnTEtrM2xBaHVVd2hHTUls?=
 =?utf-8?B?UkhWbEMyUWxDODFkWlRLYnIvcE1GNGRtSEpxUmorRXFIMnk4WTFzcUN4Wjkw?=
 =?utf-8?B?YWtqODdMaDVXL0NVc24yWWpzS282SWg0L3psTWtnWVI2MzNPSEIxbkp0bHBa?=
 =?utf-8?B?K0VkcERyRzVrNWlOaHhQY0xOdXE3MkpGdVBXQllrVnEzMm5QMnhqZjJ1NlA2?=
 =?utf-8?B?M1RQL3ZjNzhUSkNGR3QzTVVJM0Frb2g0Z0Fzd3VweVZCdGZNbnU4Q0dNTTZR?=
 =?utf-8?Q?d/dEgHsOjxWoSxlpMlupA6zRs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c68bb88-3e37-4929-c93c-08dcccd58735
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 11:34:24.9289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGfvIUUgKEtmk6GslQvMMlZmnkAEDKiNFhqKAqWvsuxgdrZ+R83GOr5iXq7sdfTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130
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

--------------e2kLUqsgBzP50WVfdBJ9WHYl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Boris,

Am 04.09.24 um 13:23 schrieb Boris Brezillon:
>>>>> Please read up here on why that stuff isn't allowed:
>>>>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences   
>>>> panthor doesn't yet have a shrinker, so all memory is pinned, which means
>>>> memory management easy mode.
>>> Ok, that at least makes things work for the moment.
>> Ah, perhaps this should have been spelt out more clearly ;)
>>
>> The VM_BIND mechanism that's already in place jumps through some hoops
>> to ensure that memory is preallocated when the memory operations are
>> enqueued. So any memory required should have been allocated before any
>> sync object is returned. We're aware of the issue with memory
>> allocations on the signalling path and trying to ensure that we don't
>> have that.
>>
>> I'm hoping that we don't need a shrinker which deals with (active) GPU
>> memory with our design.
> That's actually what we were planning to do: the panthor shrinker was
> about to rely on fences attached to GEM objects to know if it can
> reclaim the memory. This design relies on each job attaching its fence
> to the GEM mapped to the VM at the time the job is submitted, such that
> memory that's in-use or about-to-be-used doesn't vanish before the GPU
> is done.

Yeah and exactly that doesn't work any more when you are using user 
queues, because the kernel has no opportunity to attach a fence for each 
submission.

>> Memory which user space thinks the GPU might
>> need should be pinned before the GPU work is submitted. APIs which
>> require any form of 'paging in' of data would need to be implemented by
>> the GPU work completing and being resubmitted by user space after the
>> memory changes (i.e. there could be a DMA fence pending on the GPU work).
> Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
> that means we can't really transparently swap out GPU memory, or we
> have to constantly pin/unpin around each job, which means even more
> ioctl()s than we have now. Another option would be to add the XGS fence
> to the BOs attached to the VM, assuming it's created before the job
> submission itself, but you're no longer reducing the number of user <->
> kernel round trips if you do that, because you now have to create an
> XSG job for each submission, so you basically get back to one ioctl()
> per submission.

For AMDGPU we are currently working on the following solution with 
memory management and user queues:

1. User queues are created through an kernel IOCTL, submissions work by 
writing into a ring buffer and ringing a doorbell.

2. Each queue can request the kernel to create fences for the currently 
pushed work for a queues which can then be attached to BOs, syncobjs, 
syncfiles etc...

3. Additional to that we have and eviction/preemption fence attached to 
all BOs, page tables, whatever resources we need.

4. When this eviction fences are requested to signal they first wait for 
all submission fences and then suspend the user queues and block 
creating new submission fences until the queues are restarted again.

This way you can still do your memory management inside the kernel (e.g. 
move BOs from local to system memory) or even completely suspend and 
resume applications without their interaction, but as Sima said it is 
just horrible complicated to get right.

We have been working on this for like two years now and it still could 
be that we missed something since it is not in production testing yet.

Regards,
Christian.
--------------e2kLUqsgBzP50WVfdBJ9WHYl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Boris,<br>
    <br>
    <div class="moz-cite-prefix">Am 04.09.24 um 13:23 schrieb Boris
      Brezillon:<br>
    </div>
    <blockquote type="cite" cite="mid:20240904132308.7664902e@collabora.com"><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Please read up here on why that stuff isn't allowed:
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences">https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences</a>  
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">panthor doesn't yet have a shrinker, so all memory is pinned, which means
memory management easy mode.  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Ok, that at least makes things work for the moment.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Ah, perhaps this should have been spelt out more clearly ;)

The VM_BIND mechanism that's already in place jumps through some hoops
to ensure that memory is preallocated when the memory operations are
enqueued. So any memory required should have been allocated before any
sync object is returned. We're aware of the issue with memory
allocations on the signalling path and trying to ensure that we don't
have that.

I'm hoping that we don't need a shrinker which deals with (active) GPU
memory with our design.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's actually what we were planning to do: the panthor shrinker was
about to rely on fences attached to GEM objects to know if it can
reclaim the memory. This design relies on each job attaching its fence
to the GEM mapped to the VM at the time the job is submitted, such that
memory that's in-use or about-to-be-used doesn't vanish before the GPU
is done.</pre>
    </blockquote>
    <br>
    Yeah and exactly that doesn't work any more when you are using user
    queues, because the kernel has no opportunity to attach a fence for
    each submission.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240904132308.7664902e@collabora.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Memory which user space thinks the GPU might
need should be pinned before the GPU work is submitted. APIs which
require any form of 'paging in' of data would need to be implemented by
the GPU work completing and being resubmitted by user space after the
memory changes (i.e. there could be a DMA fence pending on the GPU work).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
that means we can't really transparently swap out GPU memory, or we
have to constantly pin/unpin around each job, which means even more
ioctl()s than we have now. Another option would be to add the XGS fence
to the BOs attached to the VM, assuming it's created before the job
submission itself, but you're no longer reducing the number of user &lt;-&gt;
kernel round trips if you do that, because you now have to create an
XSG job for each submission, so you basically get back to one ioctl()
per submission.
</pre>
    </blockquote>
    <br>
    For AMDGPU we are currently working on the following solution with
    memory management and user queues:<br>
    <br>
    1. User queues are created through an kernel IOCTL, submissions work
    by writing into a ring buffer and ringing a doorbell.<br>
    <br>
    2. Each queue can request the kernel to create fences for the
    currently pushed work for a queues which can then be attached to
    BOs, syncobjs, syncfiles etc...<br>
    <br>
    3. Additional to that we have and eviction/preemption fence attached
    to all BOs, page tables, whatever resources we need.<br>
    <br>
    4. When this eviction fences are requested to signal they first wait
    for all submission fences and then suspend the user queues and block
    creating new submission fences until the queues are restarted again.<br>
    <br>
    This way you can still do your memory management inside the kernel
    (e.g. move BOs from local to system memory) or even completely
    suspend and resume applications without their interaction, but as
    Sima said it is just horrible complicated to get right.<br>
    <br>
    We have been working on this for like two years now and it still
    could be that we missed something since it is not in production
    testing yet.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------e2kLUqsgBzP50WVfdBJ9WHYl--
