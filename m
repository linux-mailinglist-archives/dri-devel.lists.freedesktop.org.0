Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJNnE3jWk2l79AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08514888A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07C610E423;
	Tue, 17 Feb 2026 02:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sVK39vB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C5310E430;
 Tue, 17 Feb 2026 02:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct1duEU/JvnLDVWVJtPKUxpni29+INDsvaUcVIHL8OHuklkctbMX3f2tlUlbzlyeb14DSUdG8j02w48weNtE3Hn7LYMGKdgdJbfiZHdPV+oIiRkqRDEWRuBXpT6b2FAqAFO3IiceeBxzkyo+HUb4+i8bFbgsdzJ860Bn1+3itdlW0nsZSDfzDMThrfehfhcOnLsgYxmxnFnz8M8featawHB9JZnw6Hk3tKLoUJTIikCiU1eFvfa6Mj1EDinbAg62TEcmazEkElbgjzmg0RuFaFVmEN/8cql6E9LtFdIiQuTqfIJECbWXTMN6YayDW0VGSNx/jQSPP0e2zGXWbW9Hkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgqAz2VIZR6nSjL/nHGYokUKZjiojvqvS6BvvJ8XRxY=;
 b=iJJWfRJeIVEL8T6oeAp/XqjRMpmVoeGdo2b6gZ7keHOtumuyZsl+0vWMGO0CCFfYlAsu/irfPeMc30B/pdSwU6DvfZHDDrFlZUa2E5gJCHofL2aUxdHYA4q/oFzq2YnIpQxc2e3sJroNW3Hnbamqnc7HA795BdxosXLkB/ZbOzIDIkLIwi8wpRsHwmvzO3H27yc43xXPjTQ80JIxEr2InrgqPirbFcYCSSk2+EmHiY8d8x6dliJRIcO6a2N5b3v0JGOA6CAnwHPzPevFvpDbr1jEojY2eYLhRFHqkiPvbma0l7t4pyV86l+d5YLkrWY/gyDmPJeBqF7b9+ySQ3dq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgqAz2VIZR6nSjL/nHGYokUKZjiojvqvS6BvvJ8XRxY=;
 b=sVK39vB2BshyUQ6CVzbNooyZYKQE2jX71OzHlgcLnvItj4myrw6PEIM14tjPE46cg+F+gQrDYtMyIMaMevBNv3bvAqsHaUa5XLPNjy++X1x+E9ZovzGsfOzgpqh3FpeUrIujFu8moQfVntnvwAO/05dbfxKMb57gIRBB/UZdWsqBcByGddfubm1bKEjzKt/+ZBmzdpKgy+cvOzVTXbKHmBg/g25VM4y68cAqW9w6y0gdFCQGHu5y0wZVSVyucSe8oo3hhUFZW+UevH4KqM4bho/2ER5dpsoOHLzsHxDfpMmEIlhv/ALXtLgxzRcP7+rjhhaWwOYUQwl+JECwU8O1mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:51 +0900
Subject: [PATCH v3 3/8] gpu: nova-core: gsp: simplify sequencer opcode parsing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-3-b4e2d45eafbc@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0072.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0fd2e3-ecfc-4aca-8149-08de6dceb2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW9SV21BOHNHb3RLSlY0RHozYTdZM2VOTGt2a0Ixd0xRazJTWlc1eEVrRnFF?=
 =?utf-8?B?S1BaWTI3SkZqcmJuNnIvY29lWndiZlhhQXdYWmtPZ3BWZTBaSGFXVEMwM1o0?=
 =?utf-8?B?Y3I5TkF5TnFmZDNScmhHUGhlTEhXL0pQclE0WmRDMlFqTktwbkM0Z2F4L082?=
 =?utf-8?B?VWVwelFVRTFENStxQ3RYL1JMU2JpVzFYRTJtSjFnMk84RDkzNXZtOTNLTDgy?=
 =?utf-8?B?YlNuVDZOWjRSTERZUWFJQUJaTGlwWWR5KzNmUWxZTnhERyt4ZUtlMTY5NVJT?=
 =?utf-8?B?elZMMVdqUHJyOU5rcm9BQXlNcUVQcmZveTFGbVJiZE9rZ2JyWWVnRW0wc3VY?=
 =?utf-8?B?eGszME1KaXNVVGZjOEc1aXVBZHFYdlJmQXQ4cUFyQWtHNHdQV3lTNDIyaXFp?=
 =?utf-8?B?ckRDekNVTERTOXdBVkZWUmpINzVYc1hGcDBZTmFPdHNSOG9XTTR5bHJqL3gw?=
 =?utf-8?B?amlLeUNQeEppVGVYNGhkVTVQRVRZWmpsdDczeVhmY0VXRkk3clJRT2k1U044?=
 =?utf-8?B?bHJGUjRjNmNoYU5UU3B6MDlXWVRuV2ZnNWVxeUJCODQ2ZWFpM1c1TVljK1l1?=
 =?utf-8?B?TjMzRytoRm1Na2tPRmt1SEh3NVJSNmwrdGl4MGswcmtKNFJYUUNWRFFPRHZ3?=
 =?utf-8?B?UEhiaE04RUVIclgwVkVPSUwvZDF5Zkp5b1kweFg1YmVaU1VhY0cyTUpOdTgw?=
 =?utf-8?B?Smt2dkpBRjg3V2N0SFV0U3BQaEJmUnNLbEdrSlQ0N3F1cTlDL3djOHYxanZG?=
 =?utf-8?B?VWlBQ3B5eFJ2dFR1eDBxVEg3US9jUmZDVGxFQThvbnk1R3JSdWRXcHllSjdw?=
 =?utf-8?B?dFpUTTNTcjIySDNqQitobEgvRTBRbDBSQ1Z0MUtxdDdKbWo0QWlIZlc3R0R4?=
 =?utf-8?B?SmlZNkhUemIzUzBlRkpjUGdLakRsV0xzM2htUkVyT3Z5VisycWVTS3lQdFNU?=
 =?utf-8?B?UXNGNlVvRHdVYVBnUEhIUWVQZFVHRnAydHRQZURRNVNvcUw3N3diZEFpL1R2?=
 =?utf-8?B?eEF3cUJpQm9hc0U2TWovN1R6YzNwTGdNMkZscVNZak1XdFdvMlhBUlBuOXF3?=
 =?utf-8?B?Zng5M21PbE1TMmh4U3ZxdTNFVzc0RHZadG1pYU01Z2c4TGZBcEs3ejBtWU1Q?=
 =?utf-8?B?KzBNM2RpQllqVkRIS2NMQ2MySzl3TmtxanZ3dk5Lc0VlRENUdmZ5QW9UUkZx?=
 =?utf-8?B?T3ptRi80UlpiTjNFYzdzTm1BbGNWWkIwampQb0xEczh1d2dhYm0rK3M3R2pz?=
 =?utf-8?B?cy9NVldCYjNqUW4xYW5zOFp3bUhvVlB6VXdHV1Z4UWdKZGdsZEQ0TUt0Z1Vy?=
 =?utf-8?B?bmxERlZZTXprempXbzNjK1FqaktueUdxaE1JODhDRTZsa1BYejZHNzhkaW1E?=
 =?utf-8?B?cldnR1VDanlDdkVwS1NCUTB6K3RXNW9yTzZkcG52aGYrdTQ3WWZGcmIrSTR5?=
 =?utf-8?B?RUtpSlFmcHgveE5DN0gyNzRXM1ZVWWU0ZHhDT0xzaG95cVBKUHl1TnNzVDg4?=
 =?utf-8?B?Yk5TMjVHdDVKakhVR2l5VVJSazZmOXZHYjY1UXVSdW1vb29NdHY4ekJDS0Jh?=
 =?utf-8?B?NnNUY05CcXZvMTNUQmFUVEt5elJ1eHh3cUpIR0tyaXhSZmpjdmFOSGp4c091?=
 =?utf-8?B?b3QzL0ZhdUZ2ZlFzOTZpbXl6d0RzNFUxVnVjc3pJTnU1TVF6a0RnLzJFemx5?=
 =?utf-8?B?cDhSMmlYQUV3d1lLVlpaYzdqWDZoajVUZXZIcHgzNmlkeDVDbGRnanRreDJR?=
 =?utf-8?B?RzhkdXFPaWdaTzBQMWIxMFpQQ2tGV2J2RHU3QjVaQkVGYkR3VkV6VjB3S1pJ?=
 =?utf-8?B?Y3FpL2VlVHpnZWJqaGF4RytGMlJIVXJHUFY0WmdRZHI3OEtnSkw0MXNBcG9P?=
 =?utf-8?B?aWVVQm1HeERKSS80NU5UUzZ4SVdPcUxWY2h0czRlWkUvc0d5YyttNVZKeTBY?=
 =?utf-8?B?K2lyZDJvRVphU083VFpKV2FJeW0vTVU5YUd5d3huajVya2h3aDdSbzVVYjZy?=
 =?utf-8?B?Z0pGN3Ewa0U3c0VoamZ2M2VRckFzVmhvT0phRXZoQmxJTEJTdFp6U2VXeVNB?=
 =?utf-8?B?cHZaMWtMclA4UUlSQXpBRlB0YVV1TmxJaW5tdzcvWUhMUldFQy9nMUZaS1ZN?=
 =?utf-8?Q?hLUU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykpqd09TRi9EdURUZCtueDMrRkt5bk16N2NwbG5MdlFEWFJ5SkR0MDJzQTBq?=
 =?utf-8?B?ZnBwaU9PRTR1cjFxRkc0Zmp6OG1reURKUzEwci9YK2hKUUdhYUtiZFdYY0py?=
 =?utf-8?B?MkdyMy9TRDVQZVV2WWdQVnBxeFA4UmNuQkpTWlVOc3M0QVNiQUZUVmw2VFBP?=
 =?utf-8?B?K1VWOG5qS2VSdEtRNGV3am9tK3VRc2lMMEZQVGtqN3VPSDdzajlQOXZxcDQ3?=
 =?utf-8?B?QnFXaUgydjFaWHFJbWNCcHpnSHVqY0pmc2F1eUkrb3l5cTFiRmpyOFJCVHk4?=
 =?utf-8?B?akc1TlZNL0UwcWtESlNpWVJFLytyeGZBWno3OWFScCtQaDNZRWIvTmZxdXhn?=
 =?utf-8?B?N1pMQWU2Qkw3K0RiRmxCNWh1Q25OZktrOGdwTTBCOTBGNVQ5YVBPRTNPcjlU?=
 =?utf-8?B?UG01bG9vREEyT2diZTh0L04zSkZ0MGVtSmpGWk9qN3Z2cUdRSkZFb0l0eXlK?=
 =?utf-8?B?NXZ6NUdpb2pweGdPNGJFazhTTkZrVEQ2ZEJBOHlSL0RsYjdCeVpSTkRPVDJr?=
 =?utf-8?B?WWc2YWNvcmp2RVJyNFpxWmQ0NzJCb0xqODZqcDBvT2FXd3VRcmsyYlh3RTJS?=
 =?utf-8?B?cDVIVGsrUmlDUkE2YmNNMmNKaUcwc0FUdTR1QWZpR3c0U0VZb0YzNjBQTEEz?=
 =?utf-8?B?MDFuNzdsOGxXYlJPWFdXMjdDU3ExVUpIWHI4eVJWdVhxK0U0ZFNTZ0RnT3l6?=
 =?utf-8?B?YktSWktTenFnazRiL0xJbUwxcnI2d0xwNXZHaEdwMUZZc0E1WHY4eEFaelJo?=
 =?utf-8?B?THN2S1dRWVJwYUVSc2U5MkUxVXNwTnIrcGYvc2hNNWM5d2dqWGo4dERQVk9X?=
 =?utf-8?B?clhVb0xSTDgvVmttY1RUY2NkMEpQSG5KUDQwYU42MnJJNkRXcDNMR0ZaOTZq?=
 =?utf-8?B?YkluZGhVNE5HNTJqTmJwY0xpOHRrZGJSVlpkc0NuQVFocmpFQktwcXNmUlZw?=
 =?utf-8?B?UUV0MG1zMjBMaWZxaGZ3dDVscGowaXRlbVA5dWc5TllVK2c1NEZJd0NrNlM4?=
 =?utf-8?B?UjhwUFdEbExqSzF1cUFhSXpXaVlCcmdwN28rVE1LL29HNDlJRE5MME40aG5l?=
 =?utf-8?B?dzFsVHJzWWRvSDV4Z2Y2cEVvRm4wQ1ZMWERYOGkvSHhHTHRKUWZydlZyUktH?=
 =?utf-8?B?VE4wb1NWN2RTVitKSjlkU0F3NUxqb01pOHIrcFE1cTVuaWRVMHdvVmc3TVpG?=
 =?utf-8?B?VFlXenhmdjNaTk9TQTM4VGlWelFpZW5FVUtVV0drNFY4aVY4Q2E4V0JWa0hC?=
 =?utf-8?B?ZDFDV0Y0UFQweHNjNUZZbENHT2sreVNjVzlIOU4vUU9oY2R6eUZFcEt0UWZY?=
 =?utf-8?B?M0pLMmhFc0NJV2ZvUzZSemNFbW1WZ045V1c0enF4b0hJdDhhSWNDdDR0L3Z2?=
 =?utf-8?B?ZlhXQWo3V2piS2VPcUo1eVAxZHI2VjhOalc1NFlHVEtYQmwwWjlrNzRHZjdm?=
 =?utf-8?B?UVRFaHdaSGMxcFU3Y0x1ZG1mWVorYXNGbmVjYWxGMTNnN2hEeUxXWTZLTFcv?=
 =?utf-8?B?QXBQR0xvTWZ4SitnTW0weGtJRFVuWjlkVXNQQWt2RmN6WEtOK0tnQURtTSt6?=
 =?utf-8?B?bkYvbjZUcGpFazlMemVFLzlUdHVpT1FjditFdGQwSXBQazZta0VzR3hPQVVN?=
 =?utf-8?B?UXJsWk1TUFpCcmRHcGR6cFBNd1hGTk42MmJaakR4WUxrSHpsYVFxK1Y5a0lH?=
 =?utf-8?B?dGdLcjFZTHgzemdySjB0L1VsVldaRkJkc2hRa0FveW1pZHBQRFBFZGFSenhm?=
 =?utf-8?B?U2ROWmp0cmtBbkZoZkJQTW1leXVwVVVzZ1BjK0cxRDlTVUpHenZzb05ZWTlj?=
 =?utf-8?B?OHk5QzZUN0xPNk9VcmxKSE1nN2JOUUZPYTBjV1U0RmtHVUd6MkN4aUJUSjFF?=
 =?utf-8?B?TnVLc1lndmtHVzI5NkU1dWdEVk1Lb1JPT2g1Z0JSRkl0NjBIQlZaVkc5d0xD?=
 =?utf-8?B?YjdwWnRrTE05enVxWjJEZCtXYTl2bjgrTHY2Sk1XbndxSkhQZ1Y4VFFWYk9l?=
 =?utf-8?B?aUFJMVBvRjVXeGxnbVFOTmE4NFNjNlRDNmRNcWFoRFRTY3gyWUdIaEdTMDV5?=
 =?utf-8?B?cWt5VFpMNlZwbGFyQkx3eWQvMExybXUrK21BTHMybng5ZVkvWm16ckk5TEJL?=
 =?utf-8?B?V0R3ZUFjbVJqZWFlK1g0dkJYY3d5QVpiODFYTDhZNisydTBRU2IvdkIvVXgz?=
 =?utf-8?B?RUpyRXFyWjk2dHNZU1ZMOGNCOXlaUjRHTWVWWkRZRjhLS3Vsd1FYWGRFQi9m?=
 =?utf-8?B?WXpGSCt2am0zdGN4OEJ5V3VJM3JzeGNrYTgxOEdjSDdwN0tuRFMyblZKbURW?=
 =?utf-8?B?Mm9PL25JVUNEUDJXS0U4WkxmeDQyTjYzRjllMGs2NnJwb0JpY3JqK0JmZHI3?=
 =?utf-8?Q?fpTXpKck9OwkJKJDAfhfx/WozycsvWQtONM7VHM32yrXe?=
X-MS-Exchange-AntiSpam-MessageData-1: C9xKtghSd+Jo4Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0fd2e3-ecfc-4aca-8149-08de6dceb2cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:06.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El8IAiRZlAZqYkVR+VsPq+KlmPl26G5jYmjZ1wt5igRxGD10CZ6FaAlGPp4Vz3DoSTtuIlBVzpWQuNcMKebOzQ==
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
X-Rspamd-Queue-Id: EC08514888A
X-Rspamd-Action: no action

The opcodes are already the right type in the C union, so we can use
them directly instead of converting them to a byte stream and back again
using `FromBytes`.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 40 +++++-----------------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 3c26b165038e..624f5670ed50 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -472,13 +472,7 @@ pub(crate) fn reg_write_payload(&self) -> Result<RegWritePayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegWrite`, so union contains valid `RegWritePayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regWrite).cast::<u8>(),
-                core::mem::size_of::<RegWritePayload>(),
-            )
-        };
-        Ok(*RegWritePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegWritePayload(unsafe { self.0.payload.regWrite }))
     }
 
     /// Returns the register modify payload by value.
@@ -489,13 +483,7 @@ pub(crate) fn reg_modify_payload(&self) -> Result<RegModifyPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegModify`, so union contains valid `RegModifyPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regModify).cast::<u8>(),
-                core::mem::size_of::<RegModifyPayload>(),
-            )
-        };
-        Ok(*RegModifyPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegModifyPayload(unsafe { self.0.payload.regModify }))
     }
 
     /// Returns the register poll payload by value.
@@ -506,13 +494,7 @@ pub(crate) fn reg_poll_payload(&self) -> Result<RegPollPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegPoll`, so union contains valid `RegPollPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regPoll).cast::<u8>(),
-                core::mem::size_of::<RegPollPayload>(),
-            )
-        };
-        Ok(*RegPollPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegPollPayload(unsafe { self.0.payload.regPoll }))
     }
 
     /// Returns the delay payload by value.
@@ -523,13 +505,7 @@ pub(crate) fn delay_us_payload(&self) -> Result<DelayUsPayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `DelayUs`, so union contains valid `DelayUsPayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.delayUs).cast::<u8>(),
-                core::mem::size_of::<DelayUsPayload>(),
-            )
-        };
-        Ok(*DelayUsPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(DelayUsPayload(unsafe { self.0.payload.delayUs }))
     }
 
     /// Returns the register store payload by value.
@@ -540,13 +516,7 @@ pub(crate) fn reg_store_payload(&self) -> Result<RegStorePayload> {
             return Err(EINVAL);
         }
         // SAFETY: Opcode is verified to be `RegStore`, so union contains valid `RegStorePayload`.
-        let payload_bytes = unsafe {
-            core::slice::from_raw_parts(
-                core::ptr::addr_of!(self.0.payload.regStore).cast::<u8>(),
-                core::mem::size_of::<RegStorePayload>(),
-            )
-        };
-        Ok(*RegStorePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+        Ok(RegStorePayload(unsafe { self.0.payload.regStore }))
     }
 }
 

-- 
2.53.0

