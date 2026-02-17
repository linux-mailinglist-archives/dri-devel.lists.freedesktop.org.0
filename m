Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM+SCH/Wk2l79AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880E1488AA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7376510E421;
	Tue, 17 Feb 2026 02:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VW1Zbei0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012058.outbound.protection.outlook.com
 [40.93.195.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE73C10E42B;
 Tue, 17 Feb 2026 02:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbtVU2cgQ4wWPIZYpI5NyCHFjDuCLtAtIj308nqLat4m/TkoMdNlzJMZy08xmrXx1lx4b0Ua3i3GPusBCe6E8rwvIXu4gho6XOAyXILXXasrVn3SffcUU3p7bIsxgxzKCfbxbabROtCDqPmUFuJ+WOar6+F2Qxbd8TjB1obDC+bUr+rPQjtncb1XVyXktdAqefbf9gdRsq9A5SgSZi0fDV4J9eiTKuKjKG90pql7DZyUNSfLflalYJ4mP50debjuhHGRzBMD1rko0krZOtzrcDsRIMUe4bCsWVL4uh7nNxVg6SLG0G3frMb/Y15tfretc1iveEWzwVWw6C6cItdJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bbkm2gETjVp4Z0MprIEPS1yRsLzdSXAHY/csiqcwZkY=;
 b=uTJXEsWb6+OBaJh2rWqL9bqH04vRjE8GK+GSAFRHxY7e1SCUH1RvDBKv4plGRb0MdHE9EeDMs5EI009XvlpQijBjdlIvhPXASDt5VbO9DQtrt30LltATX/Rb9JaAnr1ls4ZK2w+EjMkF+1C8pnzdCuO4risOZ6XiTdEq+kzQsCK7sGynF/CIQ8CzTl1AZz9PMu0hCV7+S2ki1LcU0RhSLJZ7q6rSZvHFZOAf87mRCtgLbpt0Chn4xNAmGqizyJclspLnA0G1hhS+mcoyb2eIpy1+ClkS/x6HIQ9FjIwabECMaTRlMg7o0PMTkEZeKQjDkF7Mpj7NVG1c9AdkNHy/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bbkm2gETjVp4Z0MprIEPS1yRsLzdSXAHY/csiqcwZkY=;
 b=VW1Zbei0u+noq1C9/jGTxRYZYoio9LMx92ZUr4h9+ZrtybJ2TiFMBIIWAqWuf5ksTnO89A76GCkMK4xXhGuC2q9HSm884Mx6wy4LFgcaR1DmgWhuFwRrxy0qPV2DkyQvGt8m3jVZm3D0CxmPUqh1kwYn9Xfzh2vWNT42G2Zku87hecJ6TEPNCwI5jeLdy1jLFKVVaJlZzHaJZsWljWtQR07ZLVLj0e5P08YEsOPKjdUXDr2IDkfWqeW8MJO/Qf7UhYteBd0W+QKSsHMWslJtDyl7ngEV7Ed8FPh8RsqaA0fx1tA44HrCzv19jzrqmNgmo5J9Lx2pKCFuIvvLMBUrHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:53 +0900
Subject: [PATCH v3 5/8] gpu: nova-core: gsp: derive `Debug` on more
 sequencer types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-5-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: d0517560-a8fa-4a15-9b9f-08de6dceb727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzJwT1FQaERuTG9mVkNhY25TblFHNUdFOVRpa1NIVHBSVWRTZVBBYlR2amxB?=
 =?utf-8?B?MnRmd2VUbC81R25Fa3BqTzBCL0h3TnNMWVM1cmh6a0FhSjRROWNoamM1NUZm?=
 =?utf-8?B?Lzg1ZzJFVlFDZ1Z2VG1JVGZOUDkrbmxEcHZxUHFIZE1kRVVqSzFOUVA2eFRh?=
 =?utf-8?B?ZG45Q1dLZG1saUhITWQrL3U1RnFGbU5YZEwwUU9TSVBOY3FSWDFMeG4zbVNR?=
 =?utf-8?B?M2xjY1ZvRXVwd1Bpb1lPSUo0R2J1MnVzczl1ajVxNXkzcHRtdFlyY0dUaGJz?=
 =?utf-8?B?cG9RTklsZnpCUHNQSUV1N2d5QTh1aFc5aDZwVkpsQ1dWTll6bHF4UHhEbytN?=
 =?utf-8?B?djdVNlJ5VjdSakxSRDlueTNFc3dTU0FkRlk4Nmp4d0FBMldicFEydnJXY3Ay?=
 =?utf-8?B?dEJhcDVsNjdtcHJSRS9oYlVNTWVHSVJqb2EwSnlRdXFFK0RQRkdUWWlxUjFh?=
 =?utf-8?B?bXVscWF5dWZ6SzRuWklFRmh2NFkzQUJPT3YzUENtNnFybmhWcVd3SjRWdlM2?=
 =?utf-8?B?WFNxYWlwUVhqRVh2cm5xNm96dlRFM0tHaVo2OWhCQXQ2eVJCcDV3Q3FwNFF3?=
 =?utf-8?B?ZlJwejBzbGIxWXh3Q0ZiSnE0T0ltZzAxbmt1YytjZDJKTGJwNWx0dFVLdCs4?=
 =?utf-8?B?a3JsNnNPV1Z5WUk3TXJtR0NFWU43Q2I4SXNrVHo4cVB4RG0zbFQvVDBpYmRD?=
 =?utf-8?B?MEdEUUNYYTd6dFhROGJIc1JOdGY4cC9LK3RmQUREbjRmT3VoVWRDWVdpL3A2?=
 =?utf-8?B?WlV1S0NnL2daZENiWXNHQjhJUVJPb3RLWlErdjBwWnljZnl4WEtsZHlpdVI5?=
 =?utf-8?B?RGptS0RSY0RjNUg1UFdQRmJIQWp0QjZTUS9NcHh3QXRZd1Fxd1FuVy9Ncjlr?=
 =?utf-8?B?SndqQUs5UnJ4dnd4YkFiWS9TUGtOaVVRRUhsdTB3ckpJcXJ1WXB0RlVEVXhB?=
 =?utf-8?B?amQ4Ry9yYXJaTHJjcGxieVVWWE9nSUV2VXNHTHFwaVFJNGZhNnQ1cW42RzBE?=
 =?utf-8?B?WmMxYzYrT0xhbURFcVlYN2FrVitkbTExTUVJTS9RbDRVWC9LNkRZSVRxRits?=
 =?utf-8?B?QVBzdkFvbmxiUTl0UnU5YTBCZlk2NlhLdFgrQWhLMkNDTnNsKzZTRzVxeVdQ?=
 =?utf-8?B?NS9mYUh0clZtT0RrZ2krbmUzcDVVQytKS3ByZ05rU0lvRUVKT3lKaUJEZDdM?=
 =?utf-8?B?eFhFdWFuaGhuQjJJeHpNSzBJd1Y2V0xaZjI4a1lTNUNabEtvcWV4RVNFdVJi?=
 =?utf-8?B?dzNsR3kxQ2dGZWpCa1JYd1EzMXJnWDJJRDB2NkNZSk5JOG5rSG1CUnhSNlhF?=
 =?utf-8?B?NTJiZzlQK2phVFFJSFZSSHdDNzc5UjN3SUM2akxvNHJ0N1ZvRkoxT0tHMHgr?=
 =?utf-8?B?WjZnc3kveG5hYVdiQU0xVXJ2VmRpZ20wK3JUOWNZM1FiZFpiczk0dnVMLzV5?=
 =?utf-8?B?c3laS3QreDRsQk8vTGZ5S1JjaGo2QjNNSUNsVzJGTW4yVklQUEZkMys1TWNL?=
 =?utf-8?B?dzk4dmkyK3o3MTBHM0xWcjZrbFc0NVk5VVlZYzEyQzhLblg2dlY2eVM4dW9D?=
 =?utf-8?B?Yms1dkhaRWp1dzdiU1JPeXMwZy9pNjc2b0w1SXJCNmtKUmk3QzJZZjlDNmxv?=
 =?utf-8?B?aWJLOTFoM1ZuVHF0Z2lBNVNoa3ZoTkEzVVpIUkRIU2J5RmdMUzJRU2pEaTRj?=
 =?utf-8?B?MGhuYmsxY3ZETEF1WWpTOUF3dGRYUXF0b2xIRlhJOVcyOGJhM2N4K1l6dVJU?=
 =?utf-8?B?NEhiR3B2eUZNc3NYU1Z3U0I2cFpRdHcwcld4QUErK3RnbzlXQzZSQjNBeWli?=
 =?utf-8?B?S3V0cmNBTGlXUVl2TGt3ckphYjFReTNuNkRyaHZwZy9LWW83bkszWHpmQk14?=
 =?utf-8?B?MnJHaFBYM0h6dlFzNkFMMEVGVFpLK1YxQXdvRnVkK3pRbk5FcENkMWdsUW1o?=
 =?utf-8?B?TWZWaXNtZThSbE9Bb0FFNVFqM0djVS9pcmpQS2FNb2Y3U0tET3A2NDhjWlJi?=
 =?utf-8?B?VHJZd29DN1NMQTd0WTBhcnhtaVd1NGhmZ2tGME1NSU40am5hanRhZStQcnZs?=
 =?utf-8?B?NVhVSlpOS3FNNlhVUTF1eUhBY1N2YzArbFd4ODh4eTZtYzBCL2dVL0dzTlRZ?=
 =?utf-8?Q?lBa8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkY2V1RZc1hpTjEwVTRWakNKSFhKSHVIcmVMaC9BYk9WemxYSEZleGl6WlFJ?=
 =?utf-8?B?U3prR080RFVldEVTdlB4ZTM3TWE2OFExd2trZmxwRmFjZjRKbVZ1UkxrVDhE?=
 =?utf-8?B?bHVvTUdrRzN1d0hlYTNHcFJFaytkZ1VzNWpzWkNtem8vSzBFZzVYeHNMOFlk?=
 =?utf-8?B?d1M3c3BnWFJzdnhCbjV3aTJMRkRNK3pXdVVDTXB1cUdwNnZacTQrS0lqamJw?=
 =?utf-8?B?M2Eyblo3ek9BL2NwK0JUWVJpbGxTV1RhQ05LMmVNUU1qQ3RiN0lTTVovZ3ox?=
 =?utf-8?B?dHNVdjdaUE1GTHo3WXBkTnNndFQ3YlBpbC9taGRqbGtYQ0F6VnRCMCsyUllW?=
 =?utf-8?B?M0w5K2lUKzZ5cDVMdUppajluUDZITVdUd3RWYWF6ay9tYklyZUQrdElFNnY0?=
 =?utf-8?B?aHhHSHlBbzVFUDVrYkhseGx3bWNhQmRTU09ZT3hIMGJmbDl3S0tDamxJR1F6?=
 =?utf-8?B?cVdJS21vSW5aTU5sRVJBTXo2R2hHdllIbVBWajlMVHVnYW9TbzlNSDZQWHdr?=
 =?utf-8?B?Z0gwaFptQURueDFOK0s1dENGMFlWeHBUZ1hEdmpKSytpUldBTHpNTWN4SjVW?=
 =?utf-8?B?TWYrZW5POTk2RStDRnBJRHJxKzFkWjgwSjV5VU9sQmxGcUlkaWt1SGZ2d1Bq?=
 =?utf-8?B?RThuQlJiMERYTllBeWJuQUQxZ2x6bk1LM0E2dDFtbFFRVTJwNzVlTFpDWGxw?=
 =?utf-8?B?MEpmTEFGWFZxcFg2enlvQzBGYU1KdlpMbFVuWUZ5SEpDZUVFbDU1QWJqM0pI?=
 =?utf-8?B?UTRZamdOdTJwS0tablMybFd6dFA1RDF2WGVRR0gzSzF3Q0VIeWpscTBYWlZW?=
 =?utf-8?B?RFFtV2lXc3lQSHd1eGg5VGRWVm5BSkN2dVBMUzM0WUEwUUFKWkpGdVR4Tmtp?=
 =?utf-8?B?c1hya1V1UXFnWUozYWJINzMxYnBSd0I4dVUyRWtlS25oajk0akkyS3Nid3lR?=
 =?utf-8?B?Nks0ZE9qeDRKNEN3bnBqSjRBa3RZVVBYZUtpV0h0Q0NWRDQ0N0tkNTAwYzJM?=
 =?utf-8?B?T2Y0NnQ0R2hidy9IN21Gd1ovNjduN1labDNJdjJ0NElRSyt0ZFJUd2grQkVs?=
 =?utf-8?B?blBVOTBMajZoTDRqQkM1anU3WGd2ZUdwc1F4RC9QN0c5SVFGZ1V0WTNicTV1?=
 =?utf-8?B?VldjTVk2TlNUYWdndVNYUTdneXJEY2paWS9JZTZzVG1lOWJxRWRwYnREQzBu?=
 =?utf-8?B?WXVzcWdhczhyMWJXK2VwM3l0TitSeW53UE9YZGhrcEUxNzdjNmpVcUYrMHVH?=
 =?utf-8?B?WlY0VDZIVHN1UUEvd2Z3YVRWY3hPdkVwQUUzeWU1Q291WDJhdzkzb3hsMUhX?=
 =?utf-8?B?WXBXN21Jb3A0eEFhUzF2Zk4rZE15VkRMT0IzWHQ4QUNYRUUybkxlWjhxaU94?=
 =?utf-8?B?YzZzYy8zcEQvZTRvU3F1ZXRKU1E1bWNGNldTMERhMmhIOEZweVdSQ1VyQWF1?=
 =?utf-8?B?YzRWM2p4MUhkRWIvYldKQUZwM3l2d0lzUXVpQ3M2Mi9SdFhoT0xhUmZpUGgz?=
 =?utf-8?B?N1grL2tzd3VOQWxKaG1MT3RMcEw5VVpxb3k5REE3U1FzaUFqeElCaGJIa2xs?=
 =?utf-8?B?RktmTlh2YnZCbnVWaC8yaUFFWlhDdW5aRnVFeVF2ckhPUGFXblRMcDJ0WGlv?=
 =?utf-8?B?UXlVMGNZK1kraExuQ3huYjZJeW1RaWxMamMwc2xVQVJUSnpmaklOV2lQL2dM?=
 =?utf-8?B?dFRWKzYvNFRGdjB2MkpibG9sa0Fla25EK3BNWlBGYWZtNmE4VWsvU1FhbU9n?=
 =?utf-8?B?SXhENW5JczUyRzExNjdaL1BzbFdHbWs0ZDdpd1VSMXE1K1ZVWUlIdk5EUFF2?=
 =?utf-8?B?TEl1aXZLUXVGWnNHU094bjEzWWpvR3B2MXZCNFFhc1AxZDdtYkZqNkpieC9y?=
 =?utf-8?B?OXVVODVUalMvYVZxUjJDbDBsR2wzd05GNkNKN2x1T3VSaDEvWVpEamlsbE1U?=
 =?utf-8?B?VkRuR2tUbGdTNGV2bnRjUUswYUJEQ1Bud2hFSXhtS21pWHZxK3pxZXRoNGhz?=
 =?utf-8?B?alUyQURqVTJIOURTZm5ZU2J1MDQ0UVNIZVdPdlFsTmc4SFdMU2l4SDVWNWNM?=
 =?utf-8?B?RVpzZE5OSk9XcE04bUlGeGQ5R1VXcjB3cllENUxZQnM0OVA1SUhWaTI5cXNt?=
 =?utf-8?B?NVEwL210b21pWTNqaktOYXV4S20zMkNjekJUYTRIMDZvQUV6a2JGdTJ1V1RX?=
 =?utf-8?B?ZkZ6cGN4NEUwOGtDZE9aejh2YU81V04vRVdnUzRFeEN3Rk81aUZXeEw3OFZD?=
 =?utf-8?B?a3VQZTlxTVNjeDZvc053YzJiV241UDBPREhBZHEwZkxBTmdGV2Ftbm1WRjA2?=
 =?utf-8?B?OGlKSHR0UFdNd3czYXdEb1NNbE1NekhxQlpuaTVaejNTb3NkRTFkM2NMbXBs?=
 =?utf-8?Q?6+YqMTxpCG1YOq7zOgK97Hiu1GflBUr4uWc/F4Vg7TzMi?=
X-MS-Exchange-AntiSpam-MessageData-1: hP3Bo6kasGHJCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0517560-a8fa-4a15-9b9f-08de6dceb727
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:13.8230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiT9cVcqG+kp06Q7DFqfzm+6MBXWPr4qda0qJ1vEUoOLnFTwOkVwWwE0myhP0YOqIIRYWtu1psJ213Y1pOWzfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 8880E1488AA
X-Rspamd-Action: no action

Being able to print these is useful when debugging the sequencer.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        | 10 +++++-----
 drivers/gpu/nova-core/gsp/sequencer.rs |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 624f5670ed50..f1797e1f0d9d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -330,7 +330,7 @@ fn from(value: SeqBufOpcode) -> Self {
 
 /// Wrapper for GSP sequencer register write payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
 impl RegWritePayload {
@@ -353,7 +353,7 @@ unsafe impl AsBytes for RegWritePayload {}
 
 /// Wrapper for GSP sequencer register modify payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
 impl RegModifyPayload {
@@ -381,7 +381,7 @@ unsafe impl AsBytes for RegModifyPayload {}
 
 /// Wrapper for GSP sequencer register poll payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
 impl RegPollPayload {
@@ -414,7 +414,7 @@ unsafe impl AsBytes for RegPollPayload {}
 
 /// Wrapper for GSP sequencer delay payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
 
 impl DelayUsPayload {
@@ -432,7 +432,7 @@ unsafe impl AsBytes for DelayUsPayload {}
 
 /// Wrapper for GSP sequencer register store payload.
 #[repr(transparent)]
-#[derive(Copy, Clone)]
+#[derive(Copy, Clone, Debug)]
 pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
 impl RegStorePayload {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 9278ffd5216d..0cfbedc47fcf 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -67,6 +67,7 @@ fn read(
 /// GSP Sequencer Command types with payload data.
 /// Commands have an opcode and an opcode-dependent struct.
 #[allow(clippy::enum_variant_names)]
+#[derive(Debug)]
 pub(crate) enum GspSeqCmd {
     RegWrite(fw::RegWritePayload),
     RegModify(fw::RegModifyPayload),

-- 
2.53.0

