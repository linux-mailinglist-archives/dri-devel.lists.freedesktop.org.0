Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJO4CILWk2li9AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A731488BA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 03:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DF910E42A;
	Tue, 17 Feb 2026 02:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XA3KjVLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011036.outbound.protection.outlook.com [40.107.208.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152A410E43C;
 Tue, 17 Feb 2026 02:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYdEmr8yU9kQLrOJu/4Gyee4+VyHsGol4/0VYJSB/v+KNNx3v8VZj4dclxclvuMxHgb3QaYSDpeEOUB0FPywqXbueO0jMCShqbewk6Ng/vUIaey4WqWWF9FVIJ+/C20QL3T910EHiRyTgpK/XeNB0GyONfOKildNaMopc7xB5MnmRMV5M99a7m6lv+YuN4LIHo7DDjJ8wgB+9kiEuBO0Riu2nmUFeln6sA7dFwl9GaIvrxpwIHuY9qPEAI5M6El0pXF36B35FGP7nfwa6fE1t9DZ+NM1ifTDKbdajxsqwVtZy6q2n45EEAfUZ6m+a0UGuKW+K5tqvGJKkqBmJh/12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9Q+1yTvAo3Hkvvr8xxZUqUauSSU1hDfiYeUTNYlPFs=;
 b=iwBXYQDMRkFcVCb386D5RNb6b/CTNYmgN1J5a2aJeot5sKCQyVo5BcLCKInXA8ywQOc5PJAfuOjyDL24Hk1vEmfUq9W7u3M3swN0GaiZ2QwF/+2xbc6eAJGzJl+RQk6/ef6KHpsG+qWN0HwWLoLTSKCGKBxUaJR33/OvE1HFHuau/LJtsnCVGjWhHuGgNkX+1ytafUwPYNGetyWUst0tD0uslrun0pVOslBLY9aB0lx5fUcVw0Xk5WtYW0lC8oRyn11HbJFbnZa0hmGpbB1woP+mYvalQQhaSaVFUKChdKmif1JIfKpx3ZRu9AHpScmgPHnG6bRwC72GPsYbN8Sw8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9Q+1yTvAo3Hkvvr8xxZUqUauSSU1hDfiYeUTNYlPFs=;
 b=XA3KjVLm6RgKHJBqrB+BMvS/o30jFk50Q2ZrwwGx8cDMFORB1qAPjcoOtfVwut0cMn3s0wbD63E3vWuie8oOU2tB1hsvdulgmCJREEQDMbgSVEvCJyops3B1Fl60Osy8q1kbmH3ZQII8hc/n0cHFLCd0GXgqBNo7aGKT+mPfZaxAXEacSn47QNVVJUkxODFtUfazm86RoTVKLQ2kMCc6ZJQsVKQq3KNB5957v28DKVg0dtXmLOK5N3l2Y2CCerHepUBm+ooX4MY/+NchfSTSdVfAKEQfFqokwckgzAHgSKsL2lfcY/i5XBDMc805s4j9e8mggyN4I+ewXx/e1grbCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 02:46:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 02:46:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Feb 2026 11:45:54 +0900
Subject: [PATCH v3 6/8] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nova-misc-v3-6-b4e2d45eafbc@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 013f91ba-384c-403f-a21c-08de6dceb95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtPRW81OEo4UGV2VkZnU2o3Tk5DOEliN091aE84U2YrUDNnOGZ2anVvT0xz?=
 =?utf-8?B?ZnpmZHVkcTMrZDRDT3p1aDNkZm9LWFVHWnJmV3EvSXVsbG9VY3NrL2k4bk5q?=
 =?utf-8?B?YnhJbHZ2Tm82blhDbElNb1VLL3lsb043bXlDK2srendPTkFxTGZkbW1CcVEz?=
 =?utf-8?B?aXQ2MlRCNDNUZ2J2dGNrTWQvWUJOVktYOTlXTitqQTNjTlJGb1kvMHVxbmI1?=
 =?utf-8?B?WHZkbnJaUkU3R2ljNHA5dHNibk15cXlkRXVtZ2FsTEM0NkxGdERRbWx6UU9a?=
 =?utf-8?B?cHN4K1hwRTFnM3gyWndQWE5ON1BvL0k3anNIR1FueHdBOFJBR3grVi9vdkVE?=
 =?utf-8?B?djY5OUVBcFFabTdKZjBmK1dyay93VHBVdThrMi92QXl0R1ZMQzBRcmxxcndM?=
 =?utf-8?B?YkQ2dVJnVllXQ3VHKyt5VFU2K1NWQXdUMTRzS29zZTZ2N2hzVTF0VHB4LzNn?=
 =?utf-8?B?bE5FTXkrT2M5V1Q5Q2Q0RERza3hrS2dFa21UN2lvbWJPcEJ0Vlp0cHdNTVRJ?=
 =?utf-8?B?VHNkREpZWG4zcEJBMnBpeHowdU9FZ0hZN3NLZjVrUGVLaWdudmlsWGFINXQw?=
 =?utf-8?B?YnVETDJuMXVCSndFZFZSdDM3a3FFWFNzQ1FzZ2VJbHkxdHlrbFJONWxodU9t?=
 =?utf-8?B?RlRkT09kS0pDQXMrTy9qTFIwcFVDOGtuSWZpR1BrSjlhdnpJbUpqam0vam1h?=
 =?utf-8?B?UGhWS1pGRWVGOTkxcFdtbVg3VDJzU3FEeWdqaWgwZDRsN0F5dHlmVnE2bnI3?=
 =?utf-8?B?aktSNHdSSk84ZXdyY2Vkd0NhNlNJVEVsdzFWS2J2c0V0Z2lwRUkzQk12M21D?=
 =?utf-8?B?SkNLREMwUldidWY3TmpBc1BhSEgyT1NSYU5FWU1lb29CV1Z1MGlHU0VMdXgx?=
 =?utf-8?B?Ylp5ZVlnL0xqMHQvQ3RlR2x5ZGNXMVU5V3NVTzlFQm8ycTM5Z3FTU2I4OTc3?=
 =?utf-8?B?N0RGL1QrSWUxMkYrK1dqWm1lczRLWElDVjEwYUNEZ1NhMENmSUEweWxVZ0hF?=
 =?utf-8?B?YmcvbDJhMkpvM3F6M2xIWHJMWlBEWHJsRmdMWGpTZmIrWC8wdk94S1VRMlNj?=
 =?utf-8?B?YXNsVDE4ZGxHTi9UZkt0RDhMVUR3WnZLUkhNVzJJZ2NpdmZiQmxhc2pyTVZ5?=
 =?utf-8?B?OG5BMHE0SU9LNDBBbkdwREJtaTg2SlA0elNjOEVua2o2cHZVMXpxL2IrU3Rx?=
 =?utf-8?B?cGUybk9xZE9rb09qODRmQjREOXZSdTI3ZjRVa0xvZlhZWWVnWGhQZUNpYUth?=
 =?utf-8?B?R1d0WGRZQ1BlL29WMlhsaHg2YlhiRGs3RElzYzJ6alhXWEc3TEFMWDRHSWtm?=
 =?utf-8?B?NjFqbGR2V0I4VmxCS0FDc09naTgrNUJ4V242VlhWNkUvRGNDdnFNTG1lcitN?=
 =?utf-8?B?cnJncUoyaVdJd1ZvWGwyZFpoZFNjQlpjY1BLSExhVnJ1VU8wNitlakMwNURt?=
 =?utf-8?B?WmVaeHFhWWNUWnB1NHYzMFByZ1JMS01WcWU5dnNQUU1rNXlVZEp6d05oWlY3?=
 =?utf-8?B?T3d2MEpUS1RCNEo1RXJLQXZFTVRiVlRtVHdQdGFzRlVrZmNza2lndjNGNkdr?=
 =?utf-8?B?b3ZMazN4MElmUnNFRUNtN0FPNlpnbFdjeW5kdFhlU3dEMGY4TTZtU0NXaEUy?=
 =?utf-8?B?N296RXZtclVZRkRuSVpkbHlGTkNMdkhsUFdWd0xLQWJtUi80QWIySmxabmph?=
 =?utf-8?B?cFE3bzB0SUlIWWdHUTNOVjFrUUgxenU5blJVYnUxT1g2RnZLR2VHMFNkeGVZ?=
 =?utf-8?B?VmxubDZhVStHN2JNVzZWdUFqZGV6dmtoOXA2VFZjYk1pamQ4eDBDZkJGMzBV?=
 =?utf-8?B?ZmtuaEkxMmcvZ0FnUWJSL1V1ZFUwclFxTzhaRXhacXZXUEQrVlVWR3JtMWpG?=
 =?utf-8?B?Y2w2ajI5T3JxKzhXZVdKaXZEdmJHOE4vbll5UkJFRk5iUk1temhIWnpld20w?=
 =?utf-8?B?NHBkdHFuNm1maUNrcEM1RDAralQ2czROK3ZCZWhKOEN3OTFnZitGZjlob2VI?=
 =?utf-8?B?RWQ2d0E4WFBJRFdtYkI4R0JHUmt6ZFUxa2ZjTU5BMHdYUlJQZHdNMnZiN1Ja?=
 =?utf-8?B?VXBXSENUYkNXOUFPSXRnQStGS1gxekJraEY5VHE4QkhTWllteC9CcUo4WlBz?=
 =?utf-8?Q?LBO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1NPdkVBQ2tKajVWZlJ0NG9MQzcvZ3dSNnNNeVFuM2RURHRCS0VuaVdkVVFn?=
 =?utf-8?B?Z0tIdE9FUXpZMkhENUxPNmhnLzhWYWlNSkxWc2tkZ3N4N2txclBrTkdRVHZm?=
 =?utf-8?B?Q0x5NTVncUlvWDVaRS9rWDRMR1JEODA3UmoxMW51ZnppOHd4Q2huNDFPMWQw?=
 =?utf-8?B?MHlwMHpXbExFSm1iTFQxbjU1a2xlVVd3ak9sZ25rTUFScHZBOGxKcmJzZUdN?=
 =?utf-8?B?ajBaVUxaR3d3cEtRYU1jeXNTSGJTM1ZNdngwSmlQcW5aNko3QzNKNkNibEZr?=
 =?utf-8?B?Um5EL3l6R2dxQWRoTWxUSnVlUDU5ZU8vZWI4RW15OGlUYVp1Y3VtQUZQanBX?=
 =?utf-8?B?VUxQZWRUcVB0UzlNc0UrVHdiRjEvSWtxdUlkL3BOcEdkQTlYa2xNWDJhd28w?=
 =?utf-8?B?ZmVkOUdnTHd1OE15ZHRzZ0hJV3hrVGlpeE9vMU5UME9pczhzYnlpY1RIdk85?=
 =?utf-8?B?M09oL1AyaTFTa09xR0hMMnZJcFV0c3hzNENuc0dzQU1TY1RmQXNxMGhNYTI2?=
 =?utf-8?B?QXVrc2xuMHhLZHJ4S1g1M3FHcldmVDloNjZyL3lJVjJKR0IwZ2IxbVlkMjds?=
 =?utf-8?B?a09BKzFsTVU1dzJBZG5ZNG91T2NydTJHVzMyK0RsdjF2amhhSlJRVldxc215?=
 =?utf-8?B?MER4SXh6R2Rzb1U3TTJYRHFYaU0rYzUwRjM5NmFKQWlQdVJ1NUhEaHorMVhI?=
 =?utf-8?B?Sk5jemMwbS9TV0t2aGNuZEhRSW1sMDBua25Od0JGOGhXZHNPajBNek4rcFli?=
 =?utf-8?B?N0ltc0Z2elByWkk4ZzkxNUtYSHRGbkZZV25NMWlLczczWnhZQUN3WFhGa1JH?=
 =?utf-8?B?TGk4WFJLSUdiclFtM0QydWRXaW91allPb0s5TEJ0c3VHWCsrSVJjeE5VYjFm?=
 =?utf-8?B?NlNzSWg4QXE0akg0MVM1N0VQTU80Y1liTXBwZDA1NzYvT0hSVVVnVEU4R3FU?=
 =?utf-8?B?UnMrM1A1aVUvajNMTjR1MmFUbkVWazFEbWZZZlZ5U2ROeC9CdmUzc1BVZTFu?=
 =?utf-8?B?V3pkZmxPUGN5RWlGSjFzclk2dDlWSVBrWW95SmdEcE11bUlvK3VxbEtaMElw?=
 =?utf-8?B?dlNWVGFmOXUzVjNpblR2bFBOWkhTSmI0UVcyR1k3VkR6SnFKUzk0WXJ2UnZ3?=
 =?utf-8?B?WDFoM2doMWtlZ1UyZHpCRjA2ZURYODIxSnhjMUVJM1ptMlB6dUlFNXRqa1I2?=
 =?utf-8?B?Rzk0M1VsUkY5TnZ0T0JvaUZ5ZlJIZlVFcFltbTJ3TzZQNklsK0R1K1lQcHYv?=
 =?utf-8?B?dzlCR0F5NC9PcDZaVzkybkhoQ3Bya1ViM2ZQYTZaMElwMk1pc3dNTWpDaHVl?=
 =?utf-8?B?UlphajdPUjRhWmNQWTJ5K2lidFpNVzduWC91MkZodUFqRG8zZWlReTdFVnlM?=
 =?utf-8?B?ZkxyYkRTRXJZa2NZNE9JR1gzQ2swQURLd1J6Q1JEOThQbjBndExvREsrMHhX?=
 =?utf-8?B?dFByY1E0Z2dVRmJZYi9FRzFvWTRjaHZxVmFOaHdZMXhZZ29FcXZZdVpHR3hE?=
 =?utf-8?B?MERwajlBMlUxRzlvL3FKWWdQTmdLQ0VuanAzVDh6WXBuSWtQYTdwdDlURlE4?=
 =?utf-8?B?QVZIWUIzOURFaVcxemZLbWtjcjNZWURaUTRtVFB6eEJxN05Fb2RVcVpCZkVQ?=
 =?utf-8?B?Q09vbFFaTXg4VU51YzFUT0RZMzNkWWlUaHJFK3hWbzVmVGJaamQyQ25ORTdi?=
 =?utf-8?B?enlwaXpqbm5pclh5Qk9ndjZxTHlBSFhuNndCczMwUTNhVVpGcGk5aWRrcjRU?=
 =?utf-8?B?WHpnVTFXekRnYno5SGN6WS8rYnpXZmxYcjBxdW1QQUJDQ2lqaGY0NXFHdmtI?=
 =?utf-8?B?ZGRNSHRPejlCTmoyWGdodDNpWEdxc2NBOEwwUGtUekVoQVB0bDhQWHdDOGt4?=
 =?utf-8?B?cDdlbVZMKzRWTzQ1OTdpY1ViMUZsbXNOM1FxdllDNndUWS9ocXdCbmUyVith?=
 =?utf-8?B?TS9LYjFKc1JUSGJqRlVsbmUwRVhlaW4zSFZZdit0eXVsU2RleHd0dTdVUkYx?=
 =?utf-8?B?ZlQ4d21UUVlHamVhY3l4Yk53amFWa2l1MmY2MXpyQUJCNC92anFCY2ZMWkxU?=
 =?utf-8?B?b2s5cnFqaTV3TXhndGRMR1R2ODhEbkRBaklXVzVlWkJrUUg3bUFINUFveTFx?=
 =?utf-8?B?L2J0cjk0dTBsZDdNV3Q1Tkg1QlNjS2xkU0lzU2pBUExiWUprelFwcDd3OFVC?=
 =?utf-8?B?SkhCbE8rU3o1L0xJenBrbHpDUStUZS9ORHVyYVJiUnpuQXZTSUExaDFhMXk0?=
 =?utf-8?B?Q2pSVXd3N0hSQWJHV2t4bmQ5ZE16OUp5QnNGdk5YR2Q2WDRHeXBEYTk5WDBn?=
 =?utf-8?B?SVI4MzAyeExTeXE5VzhaUnkrVmNLN1UwZitMeld6cDR6RVFaQW9kL0tYRmtq?=
 =?utf-8?Q?alfFqlNUm19WWlAttzXs4rQBNT8qYEr345mK4m25OqoQ9?=
X-MS-Exchange-AntiSpam-MessageData-1: GCkthlPoBH+Ykg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013f91ba-384c-403f-a21c-08de6dceb95d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 02:46:17.6333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0xoKDixntlgSHpuhpCyG8G3o/2hZCQFdHLEWTLPGdJJCEKr/M/BmD9zDedS+SXyL7+gXsbxZ80ECCH8xzkLtQ==
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
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: B9A731488BA
X-Rspamd-Action: no action

We can now derive `Zeroable` on tuple structs, so do this instead of
providing our own implementation.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..67f44421fcc3 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -107,6 +107,7 @@ unsafe impl FromBytes for PackedRegistryTable {}
 
 /// Payload of the `GetGspStaticInfo` command and message.
 #[repr(transparent)]
+#[derive(Zeroable)]
 pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
 
 impl GspStaticConfigInfo {
@@ -122,7 +123,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspStaticConfigInfo {}
-
-// SAFETY: This struct only contains integer types and fixed-size arrays for which
-// all bit patterns are valid.
-unsafe impl Zeroable for GspStaticConfigInfo {}

-- 
2.53.0

