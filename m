Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULoaMIa8lmntlAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA615CAE3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF68C10E691;
	Thu, 19 Feb 2026 07:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IR5hijts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554710E67D;
 Thu, 19 Feb 2026 07:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFmsN4SDFwlctZUEPP3EHGQ6q/QoldLmaT7OZ7q+v+dwvJfJHWv9Ecsp6aL7vW0XUF786UNAe8AOZ0ybVV40Ozp3pwq1mGbimR7ekTCBbby6g0jq3w2/UlSfjyGqZItjnJCWouCnVRaku3mcbqXMTXhIuYkjqb1pvAJRNpgpYVCNlfcMlpBBKl+gOLMzLPTPiP1u6dR7kyosPr1kVgSj8qsOvmNJFeVct2k+lWTojkMaT1uI6h+mM1KuVpwWCBWaR6UQG97JES6X+qq4g6GnL3nj1hCjhRLBiYHrJnRq328BZW3A96ou1yTEEUiciPivTZhL6yiUHb6aqqfNVhR6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2r9mfsQkvEOZSm9B6UApD4RQcJZeFBme2wIUp3EktFs=;
 b=uDLqJ/8BdL1WhtmND1gKHz2gOqCiMCP8PaS8plrQ4qo4Uw+fqj5kaxYKlYfk+pFAg7r9cvTMYAAIPgJUQwyn0TsR19HeZeJu9oT1vaExWiiuhaCuHpJP+FWoVWx8+Z/wwSd2uAgOPyI/BMpBRnGlHcSQZGEmlXIGj3QlNo53Q+6ZHZY4bOymmaBCX+QtVZo1qDZjVs/jBVMoR2Qz3DHBPePsGRkD/SQ7H1xHo3xeLwdKBNXZ+dk+uj814ZC+YOB2hzCFz4/brmo7JzMbWYJyOgQJuH4465Uo6KjBtCwv7u1VB8JBTGeFUTrCsEnQ8iMllthIKS4k89H1nNryg7AYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r9mfsQkvEOZSm9B6UApD4RQcJZeFBme2wIUp3EktFs=;
 b=IR5hijtssE7WGt+/An0X9CtjA988ub+rbn3WtmfpEO78XXUu2w267cyPRBa7ktnPNp7N/sKv4PRughTo1LSNomF7+s/tE5HQ9tmtjw0CIByBNbzsjfgZA2ci92/lIKtVInjrG+cfkb2jm7uh9FDOAhZwA+cxd9VWTHMLllPBerWqxNed2Er/xiV1HkXe5L2MmujoelhOB5yifGogCpQ5ZO4FK+TVQB7fGgPz6c9A6xNgkEpGzu5IbUISUT16m8/bJpxEBM88TyGJK6IwbNBg7yfWI2TDmlyALkrgXInL3mYnG6u54WtIToY8FyA+G8APK+hbu/Cfy/7gaTgH3NQIjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:15 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:50 +0900
Subject: [PATCH v2 1/9] gpu: nova-core: gsp: sort MsgFunction variants
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-1-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: f7435132-d485-400d-d340-08de6f890123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME9wZFBhUjBPQ3BwTGx6VXZxYmwrdlVpYllMY2hKU3JnSFNCNHlQTmtVRHQ3?=
 =?utf-8?B?SW04cmhBb3pKOThGWm9wSExPSjFPMlpqKzBwL0cxNDJ5dm54bUxpZkRCUUZa?=
 =?utf-8?B?anZIRVRGM0Q0WkVyWTduaElnNnZBNTY4bWpBcmxhdGpDYWxteHVLcFN3WVRh?=
 =?utf-8?B?blV2UEw3QjRNRzB2Ulk5RmdtOVlSa1RYdlhEMnFNUHdvdlVNTXVJZkwwQjlJ?=
 =?utf-8?B?NytOdjlxN3I1cG9lbzE0SytESEp0bU9qL3QwWDRHSHYxV3lsZjcwZHFhNTNw?=
 =?utf-8?B?WGxwYkVhME1qSUM1UW1pQ1VwcmF4Qk1JR3JKbGg2clBWZHBkTHNVanhON3g1?=
 =?utf-8?B?L3JuK2dtbFpHSC9FY3YzcXcxK3gyMVhXK3pjZ1oxdno0WjVGVGhaT2txNnE2?=
 =?utf-8?B?cGNxZ1BISm1icG12MElBZVVXOTd0ckFPOXFBU2Y2MUZ5OFlqSDIwUm9EUVo5?=
 =?utf-8?B?QUJ2TmV2RXVsK2lnUDc3OStyM1dHQlMyUGFjZThmcnlmU3ZtcDRmSDBNeklQ?=
 =?utf-8?B?OUJKNGJ6elFYQ0tBOEdiNDB0WldzQy9kMi8ydUtmcVpqaVZEUXBJaHNHKzJY?=
 =?utf-8?B?aFhPdHpiQm1PcFpxMnpKQzAvekdJWEt1b0h0NHc4VlhzbHYzckIwcjB0cDN2?=
 =?utf-8?B?YUZoWElwVzJnUWZIUS9uMStwUTc5empPZVRaWndldlZPMFJpVVFjVDNkbHBT?=
 =?utf-8?B?SHZKNjRXZ3NERTE5K1Fxc0t6LzZvUGsxMlpHR0lKMHFZeEZ5c0dNbC95dmt1?=
 =?utf-8?B?NXh5WUtXUUN0T1ZmU3dZazJOWGdlTU0ydVBJLzZ3dXpSc1JPTVdFeThjaW1Z?=
 =?utf-8?B?c09heUFuQW9CRlFLYW8xcmpFdFZhbkJFejA3VmNyVFlXaDY0Y2JxVlViU3hX?=
 =?utf-8?B?cldZRWhiK2xMRkkxU1U4d0gyOEJkS2dHZjRVRitONkkvcjRoa2pZNmQ0eXZu?=
 =?utf-8?B?Z2hJQUMrckpGTmt0OElFQjB6M2dORmh6dnJ1aFVWVTgzUDgrK09waTV0ZkJI?=
 =?utf-8?B?MnRueUVVeHpyWUdnQUlFMm4vNzNlWFY0K3owT043RElpMUNnQWtNaXA1blJk?=
 =?utf-8?B?NmlpWFlZazJOWjVMTmtVNkgvcXFLMDc0VmlRaGVLMXRmMHdqSHo4d1M0VGNs?=
 =?utf-8?B?UkdvemJ3TjlPeWlvSU5jY2ZpVTJZaXNtdktId1dJUFEwcXVqNlBhY1dNdUdV?=
 =?utf-8?B?T3JFbGNpTzRVcHp1TkJxRFNDUHZwVXlGdXNDdTFXUStVbUdiQlowT0l3RTJV?=
 =?utf-8?B?S0N0TzBGbkFibHdRK2NXREY2WGlDSmtvTVhFRG9pZUxmeFFrRll1bU9MOXA0?=
 =?utf-8?B?Y0Q5aFFIOUhNYkZ4NkdVVE13YzBSa0x3Myt6WkQ0Z1hFR3BXdnI5OUNkQWVa?=
 =?utf-8?B?Tm1tZXRiVmJRUXZVS3lwK3NIWm1ka3F5UTZpVjBWWVkrU0U5Q1NPZG4ybWw0?=
 =?utf-8?B?L1orSzI2MDdOeVkyUHk5MXc5REE0dGRkZGV5MTk2ZmdNVzhoclg3K1ZpbE9E?=
 =?utf-8?B?czJvN3RQT3FRb2tMaDNSenZoT29GMFhzUWNsZkRlaU5rbGVKMmxoY0YxTVNu?=
 =?utf-8?B?d3AvRXBVaFJMaE9WSVJTZVdoUy9tbW43NVROMGRmTXc4TDlGejlnMElmNDB2?=
 =?utf-8?B?VWZabnBMS0pUYWVrK3YwRllnV1E2MUd1OThTLzFCK2RxdzVGeE96SGUrNk5a?=
 =?utf-8?B?UHFaN1BobUhOby9iZDJqY2tHem9FdFRjdkxNUUh2eFAvU21OUWZodHdPRjZo?=
 =?utf-8?B?WndSQXpjSDF3MXVsK0IwSnVHTjZBM0hiVS93a2FaWFZ3bFZmcDhMZldid2Vi?=
 =?utf-8?B?WmdORFhTNEIwWHpNc0VWVGh4RjI5bDRuMC9Nc3EyaTRRSjhOS3Nlb3R4c0NF?=
 =?utf-8?B?UDJaOGg3QU56bGx1K2FMcHpGdUtvazVVVzZhRlBjTDhFbUNaTVdqVWNLNjJ6?=
 =?utf-8?B?bE5MUjB6Zm1QM3NiNTRhWmFjbzZRMVhUWmRiRGpaMXBCU0w0dC9hc0Z5M1c2?=
 =?utf-8?B?ZFVKTHJobVdUNVhMM0YxckhsZkpxNUJMbDRBWnlBTDR2dElnVGtkSjRMbkhP?=
 =?utf-8?B?WkdhbVArYTNPTis5NCtsNUYyQW42cW1qWmUvMkNLU2RaNHNnTXU1WkhBU2VI?=
 =?utf-8?B?ZXVFRTZ1V3hjc0JraXNPWjVJeHRpRms5WTRRWk81d0w3dDVpZVdjZ3JGVkt3?=
 =?utf-8?B?NHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEhJQlhjYzNnNXBjT1dEUm96c3NkWGswaHNIZTlMWHcxL21MWEpwU1NQWXM0?=
 =?utf-8?B?ZXl4SFZhT0dpZ2tHY1hUNytVVTdyb1NQYnh2dmNkL3Mxbk9RWHpwdFNUSzIx?=
 =?utf-8?B?NllJbjdBN24yTlYvT1VPZDVVNGNrT1Njb25ISUtEYXNFRmdPbUJ5SXhtL2Ur?=
 =?utf-8?B?WjB5YjQ5OWxNa1Z3SGZqWGxvL0wyT3krZUxSM3JON0cyZTZ5WWpvMWVRS0w3?=
 =?utf-8?B?VGZNV1ZhL2w2UWpURnNoSExlc2JmR3I4cGQzSXlYanVaY3o4cGpoUHBZOCtU?=
 =?utf-8?B?TXpkVWlXRHNzRTNyTG1paGxkYlpOdTBGMWU5UEEwbFkzbm5OWDRndjZzNEww?=
 =?utf-8?B?R0YzRElxQ2IyNmJuY2NqQ1VIMWRyWENhdkFxdjZtUDJ5S0tZYVRWQ2ZCcmZT?=
 =?utf-8?B?YURSZTBQN25LM3FPNkY5K3dxajZRUGFKN0FxaXdOZklxWXgrSFJxQU5jMHF0?=
 =?utf-8?B?VkdVUXJGdEVUZk12TjlhTkxtaGJDSFMzQVd1anpSZ3E1Q0ovTm9mODg0VTZw?=
 =?utf-8?B?cnRPUW5kMEtBa01RWUo2Y1k4OFQwTXhZYmZFSDJiUDFjd0hkSlVoSnoxZ3Za?=
 =?utf-8?B?Y0VCUE1odEtIenVGS0RrV21IbmVFbGM0N1FQNTBoSzFTT20yNXVyVUZYbG1j?=
 =?utf-8?B?VzZqNC9Nd3lkUHlNNnVhZy9MM2Z2RklDTXZmdWZZWUt6WmJvd3I4UHFOVDRy?=
 =?utf-8?B?N2RrQUp4czEydW9wV2FiYUNiWjlldmx5NWozbUxqTStCVXdUSmdGOWtQWVhz?=
 =?utf-8?B?QnJDSTczOXlQUVdwZnN3NjFyL2ZlWWcyaW5jYXFYYUl4dEdxeWt1aUxHK0hu?=
 =?utf-8?B?K0FNN3JWTG81T0JnYVdvSXFGaUZGb0x4N0NrdWh0NmorTFB1SEVtUkV4ajVZ?=
 =?utf-8?B?L0lYNnVML3FGNUhJSHl5TERqOGZ3ZTN4VGI2WVBWeGtnczZBOHR2Nitxb3dL?=
 =?utf-8?B?VFR3WWxVVms0YmRTa2ZxMUdabHZ1V0VVOE5CWGtGOVhxbHdXTWxFTmkzOGYz?=
 =?utf-8?B?MUxXeHRmK3VtRks0Q2pkUCtNTlJJMy9yZ0Z3OG01cmpOcmhwcHVOS1JJWnla?=
 =?utf-8?B?V3QyVi9RbmlaeTBPaENIc2VQYi9HeldIUENsRmltVUVFV200amtrZkwycHBu?=
 =?utf-8?B?Uy9lMmFJUFQ4T3RQS095T3lGUVp6RjVnQkNXaFRwZGF2cGxIMDVaZEhKS0pX?=
 =?utf-8?B?ZWNCem1BYnpSTHRxZUpacGxESXhRQTg4cktFSEVsYWtIclRMSVpQem1Nb0ZG?=
 =?utf-8?B?WTFtOG9yMFp1WUM2MWJVMG1ub0Z1c1NXazZsNnBJdFBvRENoWmR0eTNWZVhE?=
 =?utf-8?B?ZjZiUlpvTjFDT01LdDdpMmVTWW5HWUNNVEkvZVE2eVc2YWNKNTN6bE9zTUlD?=
 =?utf-8?B?QmsrbVNJRFZ5TEoxZk1kd2xFZUYzaHBkQXMxZnprZUpHODl4YmM3NzdaZ1hK?=
 =?utf-8?B?NDdicFBTVjdXK3VRV0EvNkZHeUZ3bnRDZUphdDBJNnZFdjhBS0x1TTdRSFBU?=
 =?utf-8?B?NzFVWmNBOTJwenNwSHByS2xtWFoxeGpkaUE5S0RtY2ZaRXFIM2pVaGdJV0RY?=
 =?utf-8?B?VnRTeVBvbm52NSsveE1QVG0xWkt0U1BXZFArSmpxM3AwZVVESm1kcnpWNVhR?=
 =?utf-8?B?ekV2VUpkYWt5SkpMcG50ZHRrU3Eydm1kdWtFcHF4QjZhSkszMEdSYndKNXRB?=
 =?utf-8?B?M0lGbFZaQ2tlM1MrdTd1QXhRajlyb0N2ZXdnYjFiZS8wSnNySHZ4cEg4bHZk?=
 =?utf-8?B?NmFSNWNXSkJ2SXBTck96NnF4VFBsdE1zcDg2bXBNR1RVcTJDVGk0aUhka2x5?=
 =?utf-8?B?cjlBTDJXeVZoVGlHakRubGJzN0EyWVZGckNxZnlOQ08xRFNMeGxuc1czWmNS?=
 =?utf-8?B?TkhpUi9vNEFWZHMwb3R6cXZ3dXh6SUNibkpwOHNRRFhLdldJeUFwWnNMVzdP?=
 =?utf-8?B?OWsvdUI2TWdsdUQ0Vkt5MjJjOEgrZVFoaTJYM1YyRnlpRTBsSllpVWFlQXFo?=
 =?utf-8?B?cUdLWTR4S3g1QnlEKzVaZmdvZ0tXOVcwTlNpZmhucWlVSU1rT2NSelIzbXhG?=
 =?utf-8?B?TlpZa3FWZWZzTy85K1FQME4zNS9TVXQrR0RzcUluUlpleSt1MU9PTURNeXU4?=
 =?utf-8?B?WlNkd0FXMk9yQTFkZEFxS1R1ZzdHRkxWbi9FL3EwL1Jqd01lS05WbkRyd0xi?=
 =?utf-8?B?UHpWWUFjQUIzNTRLTkV5WkY2enpHUDc3WHdsUTMvSTNqaEJnenVyaXIzV2pD?=
 =?utf-8?B?RTU0WVVpU3JVanQxdTlKLzdRRC9jRWdheTFybTZoeFNmVDBhN2JxNlBmVGhw?=
 =?utf-8?B?NFNpM0hVUTFBTXhzWWdQVlZXS2UrdjUrand2K3UzZWNGR2Jic2RUcEpwNjVG?=
 =?utf-8?Q?ohLbbhLUyiMjv/CiK+FQOXupOQSuMJKb/i01zG6AKt89M?=
X-MS-Exchange-AntiSpam-MessageData-1: p6QZZjhQcceW+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7435132-d485-400d-d340-08de6f890123
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:15.4743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HIEoiEiQx+CvD9cuwMhm7jVO+2YcktBdvbKQiDfT0g0LPQbswuRnbUoc0N1bTf+MXodPyxvH5nWOwg05gZTaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 71FA615CAE3
X-Rspamd-Action: no action

There is no particular order required here and keeping them alphabetical
will help preventing future mistakes.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 97 +++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..5b96f5e622a4 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -192,34 +192,34 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
 #[repr(u32)]
 pub(crate) enum MsgFunction {
     // Common function codes
-    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
-    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
-    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
     AllocDevice = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
     AllocMemory = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
-    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
-    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
-    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
-    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
-    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
-    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
-    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
     GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
     GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
-    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
+    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
+    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
+    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
+    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
 
     // Event codes
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
+    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
     GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
-    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
-    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
-    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
-    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
+    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
@@ -227,34 +227,34 @@ impl fmt::Display for MsgFunction {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         match self {
             // Common function codes
-            MsgFunction::Nop => write!(f, "NOP"),
-            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
-            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
+            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
+            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
             MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
             MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
-            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
-            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
-            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
-            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
             MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
+            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
+            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
             MsgFunction::Free => write!(f, "FREE"),
-            MsgFunction::Log => write!(f, "LOG"),
             MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
-            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
-            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
+            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
             MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
             MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
-            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
+            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
+            MsgFunction::Log => write!(f, "LOG"),
+            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
+            MsgFunction::Nop => write!(f, "NOP"),
+            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
+            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
 
             // Event codes
             MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
+            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
+            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
             MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
-            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
-            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
             MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
             MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
-            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
-            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
+            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
+            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
             MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
         }
     }
@@ -265,38 +265,41 @@ impl TryFrom<u32> for MsgFunction {
 
     fn try_from(value: u32) -> Result<MsgFunction> {
         match value {
-            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
-                Ok(MsgFunction::SetGuestSystemInfo)
-            }
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            // Common function codes
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => Ok(MsgFunction::AllocDevice),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => Ok(MsgFunction::AllocMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
-            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
-            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
-            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => {
                 Ok(MsgFunction::GspInitPostObjGpu)
             }
             bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
-            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
+            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
+                Ok(MsgFunction::SetGuestSystemInfo)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
+
+            // Event codes
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
+            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
                 Ok(MsgFunction::GspRunCpuSequencer)
             }
-            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
-            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
-            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
-            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
+            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
             _ => Err(EINVAL),
         }

-- 
2.53.0

