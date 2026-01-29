Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLpxJEgQe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43973ACEC3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F7C10E802;
	Thu, 29 Jan 2026 07:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kFuoblG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279EB10E800;
 Thu, 29 Jan 2026 07:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs0IRG3DXb8ng75zKqez/2YgDh74UQwNjb0Qy5qkvrHQcX1Emh/uwDAx9FvGE6X+NsNlCi1rWf8eF3y/j8BkdKYpkgZ/AGnzOSdJ/3O8multU3HkW8Bm77rcQ8mx765+NwEyLOU6O0xDOjPlB8sFg9S1GvW6jY4plIa/smijF6IjheaxW5cznaPq/GiJNFvmqo7/rCN5bnO+c52EKFEw3j5w+heXLB52j0sxxpsGoa54Qw6qiTZMGQgVWyK1W5L09+p0tLJ4Ttodcp7K/sG60ekOOY2fZ7k33eeMIoQIZdmvgklzoQ46kXUXHIHYUUaX10fgOVJ1cBWzVdGQqMt0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk5Msn7riPQmUQfNCaHRA92VHRN4heCxj1mAQzhx/zk=;
 b=sKICpCWjEag0sEaJwzmUHYTo8RrZuCXtJnNVg4FLFpiBPQgrGS6f0l1KkfLtcYMoNmSHJ5+VdYG81+UZR6eQyFu8pWZ1o8H/RyN55tDQ7MhmTT8Q8n+NFibS0rfFwMHPpMoTxY3eH2xfXU0fXxKFkuLGHCTBp7/M4ibtlD304q6+TKNGRkYXmv5la/9xlMWpbSlENuTFbhmlialNrN/wqQPEj6R2puDLzLOQEY1RvLoXslppcvpx5JxPnX+NDwfjF1oGq3HLL09VefiqyC7KRqED6FqQZaCQNadAM51tc+OAtcP+wTnBGnvGx/0GI4EUwzqu3uMPV2lGHgNJbiP8lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk5Msn7riPQmUQfNCaHRA92VHRN4heCxj1mAQzhx/zk=;
 b=kFuoblG+d0D+4Gwetna59bvQGZeTJ4NUnpr7eGse6T69R7PlxDERbpDz1MpKaPxyTaycUuB6LOXOhGWb2MXtX+qJUEOv9kprWxpMmYRdcXUv1Qc8n7aIW2ZzRA926NwV5A3RC1FW9pLmvcY759DMVJg6FiYKN9Yilzi4Gt2/24/7Elb2tML2OlG6JUQ+Ex5FCZpIBtGwsdZ1DcjQBagKLGbNSs9TpSHYnbPZ+nGIYUzimRe7jXUr5nvwgp5+M4DvCxK8Eso1y0MlRfWx/boe2K2y7KcMiUfZ4t2DLTbAYS87P9HwYVmtbXwhKBRGeO9DXHM9uQfkj06hLNC0D/v/7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:46:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:46:00 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 29 Jan 2026 16:45:01 +0900
Subject: [PATCH v3 3/5] gpu: nova-core: gsp: use empty slices instead of
 [0..0] ranges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-nova-core-cmdq1-v3-3-2ede85493a27@nvidia.com>
References: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
In-Reply-To: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: ccff2bd9-5b58-4a90-128f-08de5f0a725e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG02RGIrc0tUbEEyZVpORXhuejUxYlArS0hFZW4zYzMvNVJJOGJyNlFKSTNY?=
 =?utf-8?B?RWo3eSttQWNxaFNFM0hYenNETjMxOTFpcE1nMmpDeDA5cVNReDIyZlROWDVR?=
 =?utf-8?B?c25rVG16R2J1Nlpaem1ZTVVya2JxY0xOT1ErNmZyV3J4VVN1YzRkeFg5MWlW?=
 =?utf-8?B?S091UUprZFc4RnlwcnFuMmQxOENRRkZ4QmVwb3VuZ0ZMcmpHaHZVNHRWbDRi?=
 =?utf-8?B?ZGhKSGZEWjA1b2daZnBZOGVkcE5hdzlRQithdFNQTXNYLy9Nc1B4NzJxeEtj?=
 =?utf-8?B?Rkw3dnFvMkpHQUczNDVTUUxKRzVnbitMYWxvQmhka053TzdIb1AvM2IrVnMr?=
 =?utf-8?B?ZHhma3k0UnJZSldFRWJXYWpxRllVZThKTnRLS2Q4d1BOSnhKc3Y0aXduMllr?=
 =?utf-8?B?ZkJVSzZhS1ZPdzd2UGdLeDhLRXpQVGhtUnZYY3RPdnMvbFVSS1pzQjRjaEp0?=
 =?utf-8?B?dDZOZlQ2OEpmelpndUhxaFU2VFU3SzlnaUlzbkNMRkxpdmlBWVZDbVNsZ1Rz?=
 =?utf-8?B?S0wxUHBwdHRWYkFER2UxZWRDTGt6WjZFNi82YlJ0WlBnVUIwemVWK0dDVW5a?=
 =?utf-8?B?cXQrTEo1OXV6TXM2VXhDNU1hUU9jU2FLOEJId21UTzRmVER2S0QyT2VhbjhO?=
 =?utf-8?B?SWwyZTJIaStaR3ZHZUlabTZaazZ1RWNPM2ZmdGNYeWZvR055NDlYT1pkZ29N?=
 =?utf-8?B?ampueFI1SnpzeFZZRzh1RHJEZXcxeC9sNWFzN21abXU0bVlnWjhTdGxqZG9J?=
 =?utf-8?B?dUl4YkZmaTFEcGtuZ3dYL0xid002ZXBsaHR5Y3JCQU9UMEhUKzNwV2ttQXBE?=
 =?utf-8?B?Z3g4Ni9kS1JqZkpFZE5Kd28wRXFhNDQ1N21SSk11d3c3WW9ySlM0dlpTMTVQ?=
 =?utf-8?B?cWM2RDhiSDRLeGV3QTE0V1FPN294T1I1aHdLWkxaV0xtN3JnekRBVzR5Sm5L?=
 =?utf-8?B?YzRSZEFrVEU2MzN1aWJWSWxmWnpsRXVOVlZoa2QxaFIvVkoyVmZwbGNFaWVr?=
 =?utf-8?B?Nk9tekx6SlVXN1RLRzRXdXNqdWk3U3lxQTFtWmVjRHpyQzVzUUREU2VaWEtY?=
 =?utf-8?B?SWNTUGtJRjl6M0Y5MUkrN3VIZThveGcxSGN3RDJVbHNYbXU1NjZzNnhUc3Rs?=
 =?utf-8?B?bFo2dnJ6RkNZcFpwZngwRktjZ05HSERmOHl6cmRuNDF0bExpZDcybUFMWmUx?=
 =?utf-8?B?NDloT2JTUFREeUdmT1lLL08xLzc2aVNMd3FLd04zQ2NQVDRUVS8yOWFBWERh?=
 =?utf-8?B?ZkQvSlJidU5JUUtKSDc3aDRHL295ZVlCZHBzN1FPVFZoMGJ6T2dxQ1NHdVlJ?=
 =?utf-8?B?TGwrT3paZ1FLd3BsM2tUb0RYRC9ZQ0VBa2xmd1VoSXU4clppTDJYMHdBMG9J?=
 =?utf-8?B?b2FxS05ZdmFEMFAxT3YwWlRhMjllWXJHS01CRUlaMk12V0JzYlppWnpWdUYz?=
 =?utf-8?B?TW5sV2I2UVhQeGJ2KzZYbWwyS2N5dzZ5MWZlRFNLQzNjQWF6WXY0NUY4TmJw?=
 =?utf-8?B?MkNMTVFZM01ZSEk5V20zaXZVL05PaHg0T2dKb0E1NmhzVDJsN1ppUVQ4eDdI?=
 =?utf-8?B?U253OFJpSm5ZRjZ4T1Y3NkwxdUtzaGg1NnBNRy9IZEVadTJoRVZVQmR4Y213?=
 =?utf-8?B?M2dmM3BFUkhPejFpKy9uc0E4KzhwdmozODB5VDhtWG1XMWFKSnhEcVZyaGtX?=
 =?utf-8?B?dHNWQU1rV2VYbWtjRk9ndnBQMGFkT3dQaDBxRmozNk5ERndnQkJnakF6WFFa?=
 =?utf-8?B?aTRwRmNrRTVGcXBpeXVFeUhONUJaR3hNVFJxTXBzbkYxRGNSSDU4U1EwUnYv?=
 =?utf-8?B?T1grVDRRbWpzemZnNlE1YmtwVzJuTmlzcTVnZk5xdFF3MHlERVJMUmRNK2Zy?=
 =?utf-8?B?bStpeFUyd3IxanFRQVNaSVVVZlIzeVVQeDZGME1XQXdhd1JobXFDajZaVU13?=
 =?utf-8?B?a0MwV3A5dmVUUjNLTUYya0FXSmRtMXp1WDQ4anRqR1BkeDdtQ2phWjVGQ0ZY?=
 =?utf-8?B?WUVaVXVHR2hQTEtFNit1V3ExNHAveXcxMXRYaE1sRW5yeVFHbXlqODk2MG5F?=
 =?utf-8?B?Uy9xWEh5eGhRUEIwai9lTzJtcGlQZGRscDVDVHg0VG5hSU5JZ2lqNEZSWEZt?=
 =?utf-8?Q?APoc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3FncEtHRm1oQ2t0eHcyMmMwWnVyeHZwTUltanpGeDB3ZTQ5QnRpSjRRR2wr?=
 =?utf-8?B?TUg5bmJaMWdVSG42czVkd2oreEtLWFRySWNIRDdBUk1kb2ZicTQwQXcxbUh0?=
 =?utf-8?B?eVF5S1BVOTcweWtabk4vN3JkeWRYWnh6RUxRN0JjUjA0ZFFPN1RnR3FmTHBk?=
 =?utf-8?B?cHlLck1KY3pnbE5zVE5LakFJR0J5ZUFqM1d2YmNYcmlVUkRlR2t2OURQK0hE?=
 =?utf-8?B?MDJyUVY0VTI2aUlLckJ3TnBtN2J3cG9vMzA3WE42dzZrVGRaVDNIazRaVXVN?=
 =?utf-8?B?TXRndHh2d3piT0hFN2tVNytpTWgrd09WQ2puSzR0anFVYTlFYzNyTWhvUnNs?=
 =?utf-8?B?NVQ5OGJJTkFuZHJuNlVIUVlwbTZCcVpNTDBMRlJsaDNuZHM5SnVSME42dWIy?=
 =?utf-8?B?dXFVR25FUmluZzRaMzgxWndaMzQydGQxemlYd0ZSN1ZXdmN4S3REa1ZNQnZ5?=
 =?utf-8?B?a0Z0dEo3blJhSzJVSWx0ZXlxand6aXl3NGozb3lRNVJjb2wxWGJ1cU1iWTdY?=
 =?utf-8?B?bGVsOGoxSGJlZTdLRjJrL0VtUkp6WmNEY1pkZDVwZFNzQnY1cm1TVzYwYVFO?=
 =?utf-8?B?d0l2b2tkUGlnbG9BQ1NSQmNLNnBBQmZoWTczQ1U4ay9IYjZYK1NmMzkzRFd6?=
 =?utf-8?B?Q1FNNnh6QzZzOGRldW9ML2NtcnVsd1pCYVUvbnVlRDFxMTFVVWY2ek9mKy9C?=
 =?utf-8?B?UXNTQk9ZdStZOENiVkltcFZwSmFLRmtYaDRjV0ZsQUVoWFF4N1RQMWdlNXVX?=
 =?utf-8?B?dmFFU29aVDIrWnVlYjZ3b3NsSnFGUWswTmtLZUNzOEdNV1d1UlJjY21GMGRC?=
 =?utf-8?B?cTN4YnNud1l0N1NSNS9NTkZRNDlWOHk5Z2U4Wmo2RmsvOG04Sk9mdVpTSXlM?=
 =?utf-8?B?L2lkb0REWmhGN0hYZnVxRTY4K0ZUMUpaQVZpODBDRzY1Z0I0RkxtbUJEOFBS?=
 =?utf-8?B?clJpNDlwRXBXMklwT1FoTzlic1lSLzdTeFFwNC9VdnhFMElzTGNMVHRmM2Ji?=
 =?utf-8?B?Y3g3Qkx0VGE3Q3BjWW9NOTZvNnV5TkFoKzNpU3dYa3F6RnhvZkUxdGxQbUUv?=
 =?utf-8?B?VmJyeEI1S3NVZUcycm82NGRVY2J1SkNtWFJVMEQ4bHhYM3R5M3hwVHA1V1Z0?=
 =?utf-8?B?RUo4eU1sSCt4VEJHR3lHZ3ZHYjBOU2wxSEUzMHZRWWV2Zm9aQjRYT3hGQlg0?=
 =?utf-8?B?TFZ0NFZ0M2puZmdJa2gwTnpuM3IrQ0xjRmoyNVFGT1JLejZRbzdRc2p5YVEy?=
 =?utf-8?B?TjFNelVrRlRta1l1ZlhoMk52ZHpWaWdGSVl0UFczMHRkNHdaSzRTRUZJeTlQ?=
 =?utf-8?B?TitKWEdRTGVPZTJZR2Y1Q1VVaG82Ym96dTQza3VOY2c3aEZUOFRTMlBPOVow?=
 =?utf-8?B?SXZaOWZkaktTT3U4MDhFdU5MenBwdlU1OHVXRWdhOVRqL2YvSWRvUDVUNDUr?=
 =?utf-8?B?OWdBY1VtYWNtVHMzV1hqNGpiYXlGMHhaME45cWNZZHc3WXRRcnRLL3FGWlo4?=
 =?utf-8?B?eHVOUHp5Tk9VMUlvUW1zazZ0V0VjTkVqamxuTWJTUzNYM1FIMDM0VXZnS1JS?=
 =?utf-8?B?c0dlZXovS2ppZzJWd1A1T211WHJSRWdNMXBUaWVPWGZ2cm5ROG9pd2tiUFQ0?=
 =?utf-8?B?MHFucGNkMW9jekg1bUxkNiszSy8rWGpKaVliaS9BWmF0djJrV0NqV1NtdjZy?=
 =?utf-8?B?azkzQXlIUzErYjA3UHFPdHZxQmhYbm1Tdnk2VXluMFYwazQ2b1EyL1F3Y1hy?=
 =?utf-8?B?aDhoRGQrbG9vbUNBeWxxRHlPUjdabFZ5L3FQdXBRMk5FMFRNR0Y0VmRFeWky?=
 =?utf-8?B?MmtMUFZkakdXQmU5VjFwZ3JLc0FGT0NhQ200eCtuVyt4RW5QY1lGa3Z4czVh?=
 =?utf-8?B?ZWM1MzcrSUIxZ3UwOHNnWU9rR3k3aDlzcWlCZGY4V3BXMTFKNHZYd2I1RWE0?=
 =?utf-8?B?VEZkOUJxOEVBY1ZGZlZoNzNSaGhwbE5YQkh4d29FK2t4Yk5QWHduYUVUZ044?=
 =?utf-8?B?VDZqcyt2VjZ6dS9VNFpYKzJiaUZxUzI4SVhGZmV2OUR1TFU0ZnFId2RhcnNh?=
 =?utf-8?B?ZzBYeWFDZFdlUEthU1A0cS83MjRJdG1Zb0phaEFGNVpnRlVxVHpSN2lOYUhH?=
 =?utf-8?B?ZUlhWlhnSkFXdlBwdTJ6b3d1a1dqSGtwK2IvY3lTckt1cE9SVXcveVAydVNr?=
 =?utf-8?B?VmJYTVVpMVVUT1JnNkFKYllqQ3lsUG80eVRUUVlBNGlsV0hWQVVOdTlzU3Jy?=
 =?utf-8?B?c1ZraExoaE42MTNiWnVqVkVOdDRvMnF0cXNZRy9kbTVrVW9KaUtlbG1pQ0tX?=
 =?utf-8?B?dks5V2xuUHZYRHdIYnVsV0FsQU1zdWtjM1ErS3dXbVRXaFUxZGVvZlVwSmgy?=
 =?utf-8?Q?r3Eff+GmAJOAEJYJ4JcggWhbCpw8g9xggjrN3oO+uTuv9?=
X-MS-Exchange-AntiSpam-MessageData-1: g//Q9J5HYlfWHg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccff2bd9-5b58-4a90-128f-08de5f0a725e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:46:00.7042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RbRdP3fvXLsPTgwhdTdaqmsLT4Urq4JTAoY0OeDfl29CNAINWthduSrSoZL7Dxu7zEFIvjbvw7/Pgr0LYHv0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,Nvidia.com:server fail,gabe.freedesktop.org:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 43973ACEC3
X-Rspamd-Action: no action

The current code unnecessarily uses, for example, &before_rx[0..0] to
return an empty slice. Instead, just use an empty slice.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0743597779f1..b88ff8ebc098 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -232,7 +232,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
             // to `rx`, minus one unit, belongs to the driver.
             if rx == 0 {
                 let last = after_tx.len() - 1;
-                (&mut after_tx[..last], &mut before_tx[0..0])
+                (&mut after_tx[..last], &mut [])
             } else {
                 (after_tx, &mut before_tx[..rx])
             }
@@ -241,7 +241,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
             //
             // PANIC: per the invariants of `cpu_write_ptr` and `gsp_read_ptr`, `rx` and `tx` are
             // `<= MSGQ_NUM_PAGES`, and the test above ensured that `rx > tx`.
-            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+            (after_tx.split_at_mut(rx - tx).0, &mut [])
         }
     }
 
@@ -263,8 +263,8 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
 
         match tx.cmp(&rx) {
-            cmp::Ordering::Equal => (&after_rx[0..0], &after_rx[0..0]),
-            cmp::Ordering::Greater => (&after_rx[..tx], &before_rx[0..0]),
+            cmp::Ordering::Equal => (&[], &[]),
+            cmp::Ordering::Greater => (&after_rx[..tx], &[]),
             cmp::Ordering::Less => (after_rx, &before_rx[..tx]),
         }
     }

-- 
2.52.0

