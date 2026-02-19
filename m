Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMHPNegsl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB451160309
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CED710E70B;
	Thu, 19 Feb 2026 15:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k6gTV24U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DDC10E6F9;
 Thu, 19 Feb 2026 15:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqWHdLJYVtPnv5gE4GUTgpl7rOlrz81NcZgSkpn0FDx1jfWTMlXuSzOpujI98vSiES6IJpafe3gRzMk0ejHRVc5v5RKZ6ew51JSsGVcU9CXZJXwZAKVF04KcrMrb3N1LdsebUqM6tuKefCZY8QsCLHpZTNq0fsauHFvIUBxHgECdOXheTyH4kU86V+wA0vkBCTpMlozS4SAe1AfdoIZGvFPKOMavvtiTbcIN4pyLARjVW2y9NvxoD00EB9ZK9/h60oqOd8WFJkL7kf0Hqn3GSaYFy5agFuZGVA+ak37TrRT1bHGllFX6GvScpZdStXtptHGFPDT4w7I017ZbvgBqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyAZNHrQr4XlWjrNcC7LoVEm+8mFOjmTujby72tZrQg=;
 b=gg16g1XfIJfSSxIW7pfCWn92cN1fQiZOpOjI2BaptuIOA9wWX9NPZJBUok0vXlK+AL8A+Eax7zvb9hYxaCmebCv/2Wlkxg3aLwsm2nh4OclPodTawYePn76+mDHPecvYGh2ShR3/0bjK/MnpjGoDFtwsHaPajSxk8GVM8sy0E674mQa7wVuV+HoqP/Sg6JoruWkFgi6eLkcafmERLEovBc/Afn6HsmaK08Yu86eoSIu16St8DPKfO0OZuwNwoqR3J6Eap8oR9YRJTywtT+BzP44uYXK31TOMh9sfVmiCywPR8A+KsLNbxEh9wN4M4sd1kr++G9Y229G+rKSaNuxAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyAZNHrQr4XlWjrNcC7LoVEm+8mFOjmTujby72tZrQg=;
 b=k6gTV24UpK/Jq2p5WfyVAnxPY7WdJrOPu2cU3HbHaV+9YxsxEWeveDadhQ/A91rG9SrW2geJxQFh5EcMwpUNN4LEoD3z513/lXi0+kdd5rbuUrUWqmlt/mClodLbmNyPy9RHJMwoG7iuje0cSxqXJQmcn3tEZLxlHHU8WsfxvVuTfnl+PMp5B63fH5lolM6znjD0GdDqH9cbozquAEcXVU84O9RKGdwle6jy3kqeHQHqZI4iBvS2sqATByWx4JOtKFnBCn8xf7kHha8HOVDGwSiot1bQdUYSgE/EmGLaZrKlgJv1LgbApnKo63IHOC2I5O/7VRYzzHUnV0KMk0Gevw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:31:37 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:31:37 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
In-Reply-To: <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-8-joelagnelf@nvidia.com>
 <DGIITNWQG26Q.VN7FUL89C5D5@nvidia.com>
Message-ID: <3878ce607deb5dc4cfaeb440895b5133@nvidia.com>
Date: Thu, 19 Feb 2026 10:31:35 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:408:143::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab6f90b-041e-4ffc-5f78-08de6fcbf898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWJkbVFSUGhYemFNbmlwTlIrc3crbFprcEdpWDNwZjNZN1ZDRGNEUzNlT2ZW?=
 =?utf-8?B?N1c5N1JWQ2RNV0hoV2Z4RTA5c3c3aXlZMVRxTkRqMWx6N0QrWktiUFF1RXpx?=
 =?utf-8?B?WUpLa05TTHRQQnRGbGJqbzRlUXI2MndubnZDSzhNa2RDdXVFbU5oRTRHajUv?=
 =?utf-8?B?R21DTWVEK0J1eDlyczZ6Um9OeUdwV2gxTjZ3cVExL1JMUkszLzY0S2pqUm5T?=
 =?utf-8?B?WUkyVWdUNllCTGRaNVJsT1Q2bTAyWUFEM2NPMnpoK2lsbmJWbFhYeEJPR1pv?=
 =?utf-8?B?ZnVIRUY2bUo1RlBlOXdweEtWTU9uQ3Q5T2N2NWlhYlY2ZWNFYXg3REg4TVlF?=
 =?utf-8?B?Zk9rVHdRVjJNUUw5N2FzZ0FYRURWbmNLTnhZNjZXcnlCQnNZaGRkdjNmeU9T?=
 =?utf-8?B?bnJsNHVtcERZTG82OHZ4aWdFREx3b1dSNHBuMmFPOEIrT1hEZDBaZ1dPd1Vp?=
 =?utf-8?B?bWN1bDVzdkRYMk9ZdDFSck9wMHYrK1l5R2VzbytLdW93WStYalRwRUpWZHNk?=
 =?utf-8?B?ZDVuaWIyYWFYZGt2Skg2Mm5rN1NGZyt4Q3h1c3NCUWNzTFgyeno2UEdNNGdT?=
 =?utf-8?B?ejgvaVZtWUxmQjFwMnlkMWVDZ3U0RHNiell1WmFSZzlRY2xucXlKQ3lEd1hY?=
 =?utf-8?B?MFBQNXh3c1o1dm1ZemxMS0Q0dXlsa3JreWFyWTNGSk55WDlxNHpVM3docm5J?=
 =?utf-8?B?SG11TGZ5UysrL2x1Sks2UEorbE9RZEJud2JNNE4wUUhFSG5iS3ZJZFA2Sm9x?=
 =?utf-8?B?S1JRdkxSVC9SbFNOcnNlcm9raDNGMWcwaVhiZUp5Mjhub0JKR0dGa2syMVpR?=
 =?utf-8?B?QUE3QWpNZitpR2U3SU1GaVkvVFNTOEJJalZ3V0trL2dXb1RLbnA3dUJUdHI4?=
 =?utf-8?B?cTJqOGk0L2p5d1hYMGUydnNzaWZyL005eTIxMjZpK1NRaXozQ3Y3SXNlc29K?=
 =?utf-8?B?elRGMFFxY01FS2laaloxMUwzZkFqbVJnTW9IbG05QzR0VjR2QWlLSHZZWC9X?=
 =?utf-8?B?UjhkNE5YMG5INlFnbHBPTXZiRGFVaWpqNU4zemM4d3R2MDR2TDhMWXN3K1NN?=
 =?utf-8?B?RThieEZpZWx6aDRMaWFWV05WMVpUZFh1bUFnVDFQTXdEMVNFcDdCdnd0OVkv?=
 =?utf-8?B?UlJpSWF1aDFKSjN4UDhVbkZvVGFLMDk4dEJWTmovWW5xaTNPbjN0STJwbUps?=
 =?utf-8?B?ZGo2emRMa2RWL2RhQ3hLQi8xT2FZRi9INHAzMHBjb1ROTjJQc3gzMjY5Wm5x?=
 =?utf-8?B?ZTNybVplbWh3ZENLM2p2WGIzMHc3VEt1dUl5Yk1KVE5LK3ZGTm1tSkZZV2FW?=
 =?utf-8?B?OE54K1BIb1dwWTRVbThKem9jc1JPL2xQcVZOV0d3Q3F6R2tFMkxJVDlpZCtw?=
 =?utf-8?B?NUhrRTJLWGtGTFhzOWh2bVNnaEVubHNUVWtnRG9ONTM3VHJQVnZUL2NjaEtH?=
 =?utf-8?B?YnRpUzhTWmMwRGs5MHdSN3dicmV1ejBGV3pHZllTUSt6MnBWSnVUMDhoS0RL?=
 =?utf-8?B?WkFOYVE2SlQ1M2JlVTltaXZDWGV0ZTlMRitiejJLNGdXWnJwM3RpRmVtdk9W?=
 =?utf-8?B?UFhGRStBT0I1L3B4Q0NxWGpoUXNicWJnd2dTbnRLc1Q0ei9qaHhLbGpkSGxw?=
 =?utf-8?B?TkZqV0EybEM1aEVpR21ScHlqY3JEZjQ3QVcwNlJ6b1BLeElNSk1mR3Y5bCtl?=
 =?utf-8?B?MTFZT2ZnK3FRYVhtUmlyTXR0QzYxeVBMV3VtYXgvaEF2RVRkVi8yUERHS1dG?=
 =?utf-8?B?enJBZHp3ZERLdGR1R0o0dHlWbnpqMGhqazBLQkZGVWtYTjhOOEJUR0dRd0pz?=
 =?utf-8?B?bTBSOWk0Zmt1TXJtWWttb2dwRGpGZnlmRld5MXFJSXh6bms1Tkd2TWxJVTFo?=
 =?utf-8?B?ZCtBTXc4bFVEVGkzYTlNczBhNFlIbVk3ZFZBVnhCbnZFSG0vRjVTMk1kMkpF?=
 =?utf-8?B?czJ1bUhmT0htOGh0WGNYS1diaERYV091MmZDTThWaDdaLzVCR29Pdm9YcHAz?=
 =?utf-8?B?ZVBtODZtdUxCYWxjTmwwTG5FYjlvUTBFRS9tUlFEUUhHcm5meDNrTW13cWVk?=
 =?utf-8?B?d29NTE9aQVNSZkRkaDk5U3RxWng2amN6ZkhnL3IwTWtEbTg2VnlnVjB3Q2Vx?=
 =?utf-8?Q?rBoo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhSYVprQ3RQK20xUENmWmJTNng1aDJhV0RWUzRqQTZ3bk5PVnZ3UjRGdldt?=
 =?utf-8?B?eHdYekhiOVg2S2lWK2lCdWlrbXViMUJvSnUrMzV1RVJnblVMV1NpWHUyd1lX?=
 =?utf-8?B?YndJajBaN2pPOWpnN1JxVGVzR3BiMXh4SUpYc3JTZEpQSlJ6Z2pOTURaTTc4?=
 =?utf-8?B?UkE0RFQ2L3MyZXZzZlZGRFNsYVFYV1Q4SzNqUFd0ZGhBZk9CeFFidHpIV1Ft?=
 =?utf-8?B?dUNpbnV4dTNqZ1ZyMjVmYXBRYnhYSStCTHhzbnNwNUpzODZsSm9BTXUyUXZX?=
 =?utf-8?B?T1NEd0w1cVlRZHF2Z1lGUHRmL0s5aUh6UkhRS0l3WDRQeEVrQmsyTWVFVmp2?=
 =?utf-8?B?cENHaWQybS9EUURQVUZZTFRNZjd2L2ZReW9BUjBTTWJVTVJzYXprbWVyVm4z?=
 =?utf-8?B?UDUvSEZPT0paKzhNNVNnQWw2QXFBMFRMREU0aVAzYVUzc2dpQmxtNWhRMnJq?=
 =?utf-8?B?SGo0U1hzQmM1MkZVdHFnU2NwSVV6TC8wVjJnMFhBSTFCN0FYemVtQ1ZjVm0r?=
 =?utf-8?B?L213MVFGblo5N3NLL2c1WTVLNFZzZURsUTkwNlE0UE8wU1hNUGpIUkU5R1hq?=
 =?utf-8?B?K2tkZGNUUytOeEZrQ2NOZmtQa2FEVE9VNHJObWh5ZjVSZE5NbHVmZlovdW9P?=
 =?utf-8?B?cU8rZzJvRGQ2YTNsQlBSSXJid0M3UlNqM3JvUFJ6dFJ5WXM1VlFyWkJkaG9x?=
 =?utf-8?B?L2RJTS9QVmJqc0E2citLQWJhUWJQNUM3TE01dy9GVTNOUGRMYnk3TmdMdFJh?=
 =?utf-8?B?ZlE2eFIwMzVRUVlNVlFMK25Yb1c1dE9DMm9sME45Y01FZ0hMNmljd0l3S2Ru?=
 =?utf-8?B?YU1nSWtEbWNTTWhiTGlJYThjSm9vdDhqYVlLRGFkQ1VqUEFyRXBhMzJTWUFH?=
 =?utf-8?B?a0pOclVxY0owWW1JdExVTXpXdjBJenQxWXIrdk04OFFzY0VrU3VUUGZNSWFP?=
 =?utf-8?B?TDc4NXA5eHhmdzYyUkpzYWpFNG03M2hzajlCOXVQMWIvT1dWOUtUZXl2NFVV?=
 =?utf-8?B?c0xCcDlIMlJDcFp0WnprQ01kK20zN3ZnUmlpWHFFWHVKVkgvNVNHYUZlWlFH?=
 =?utf-8?B?VlNLTWRtT2pvak9QSlY3UzREMGx2VGhDWDY5SzRpa3NvaHEwbDUrZ0dPK2Vm?=
 =?utf-8?B?MDVDRlhIRU4wbVpSQXBnTWNicmlxd1cvZW5YbVR3UFNJR3g2Z3hLN3g2OW5L?=
 =?utf-8?B?enk4VWt3bVJ6R3NyRmRaekgxRmZzc2hxdzRhckNsUHN2ejQ5Y3Jlazk4RFQv?=
 =?utf-8?B?MjZvajhzdUpYb0V4aWlXVEtVK0dkYmJGRkZZS3FSQW1IOHdXUzdTaEV3OE9p?=
 =?utf-8?B?V0FTcDVleGJUN09vQm5sLytkUlhvQklXVmQ3Ryt1UnJVd2w2YnRtSGd3ZmdJ?=
 =?utf-8?B?RitURFYzQXNjYjM4OXV2RnJTMGJYMGI0ZXZOb3ZlTGJBeDVMeTY2aWpaKzN4?=
 =?utf-8?B?RlRBNlNPaERVSENzOS9nVThuMjhhekRxWnlYZjhiTEJCS3lxV1B5MEJOdWVy?=
 =?utf-8?B?THVZaEw3ckwvVDNNUU1qbXhBSjZHQ0pFRnV6aVA4Y04rbWJhVTRwQlpaY1NS?=
 =?utf-8?B?aytDOVo5emFBcE8yR2p4VDNXdHN6UkVZMW9ubS9PTlAveVZjYldhOUQrTjRj?=
 =?utf-8?B?T05hbkxIYUc3SXNza2xzckVWUzM2MzNudHA4QU91Z0s4ZEVUS2tsSGtvTzZs?=
 =?utf-8?B?VXEyVUpwYnlVYU9Icm9zbU5neXdKZ0JOdUt6b2pSMmxheU0yVmVFZGNNSmNK?=
 =?utf-8?B?Y2JENlRPRXJvdjFuaHVaN1lSNGVsd2RQVFk2bVBYR0JnUkg5QTdsdG9iWGcw?=
 =?utf-8?B?V0NvUm1oaDJXSTBxRi9MQVZVZGU0WjRROXFrQjFGQllTa1F4dlkzc0YyR3Br?=
 =?utf-8?B?Wk12M3lKbzB0RWlhL3ZhWnVXUG5kVVlPZWNrQ0hNNWw5WUJRUk5GeWRaTzFI?=
 =?utf-8?B?TVQzM0JadTh1cGpzY084UGJwNktXT2ZvbUFvZHhIZXNZVmNuUmhhSXZtL3RG?=
 =?utf-8?B?dXpkTGxvRE0vSzhTK0tZcE1temlCa2RBRzh3Vi94MUdCcEE3ZUYzK2ZGNWd2?=
 =?utf-8?B?aHQ3dFFDY0ZLMXA3czU4QTR4UFh4WVBmZnV3YXdJOXZrM3BHOURFVWVRUTZH?=
 =?utf-8?B?L1d5V0Y1N1Brc2JZakpmeGJZVEhJNVZJL09pNjc1ZXhaNElOdXE2SmFVcTdK?=
 =?utf-8?B?RmdQbU1NOUx5MXhrbkEyLzk1dW43cUJ6enQ0ZjRnUVNGakdWSnNkdENSU0dZ?=
 =?utf-8?B?dmtrenRVeXhOZ2luUFEvenFrOU9EQ0JjcVQ0THNURmZreURyOEZrR3FrVEFX?=
 =?utf-8?B?M29qZi9hb3V5QlFDTFBDWHJTY2JTZlNGTGpZaXU0eEtGbThZWkoyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab6f90b-041e-4ffc-5f78-08de6fcbf898
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:31:37.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b51hkvl3uI7QBw8Ez10srIX1+XKw+CwE/k/1f/2Y0VCjsoYK0NhAbK+NedDjNmV0qDVaAlotBtq1ZXPNsz2+aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: DB451160309
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 09:44:28AM +0900, Alexandre Courbot wrote:
> Subject prefix should just be `nova-core:`, as this touches the module's
> configuration.

Will update to "gpu: nova-core:" per John's suggestion on the
convention.

> I'd also suggest to select `GPU_BUDDY` in the series that actively
> starts using it.

Makes sense, I'll move the GPU_BUDDY select to the patch that
actually starts using it (the mm patch).

Thanks,
Joel
