Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA8pM3SNqml0TQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:16:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0C21CF35
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 09:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B48410E3B1;
	Fri,  6 Mar 2026 08:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iAdwQd/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061E910E3B1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 08:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYcvfYn1qgrRh5AONgVCe/w7BesYKyREJmIKCXeV2UEg6fsL06WHR1SbcS+xxbkFBPKkfD6oN/9yJ1azc+M3UyXMRiwTJqjIkqkRn0Ed6yZV2/XYe/+NBTM3Yh9O17bNOJRufYRPuEw5T+xifnOaU2LmUnm/me9cdhCoGpr5O/91qoidwdAwy5N+KHXxq26FOI+cC+uIsG5lySdqXMdTb/LD19qxTDLx/nnsqsK2nhTg2xz8/CBvooU9sc2O9mbmt16hTefrMai54FBtSTF5eOCziq3dWCxsA+eFvgDpCP0QuvBa8U2oqTYuZ1N6G0Tg32SD0mrTbZPsaW0IYLnHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pwh0o1lL3AUtAxFQNMWY+SCvWbnn2SAiTSS6N7Kb0mQ=;
 b=Ar4L44tCWc1pNOrnOgSFrK1eWZTi7orvqtCTTlgAOeQBaNMDvnK3GjQ01dOcodh8HpE+xXt/JXf5eapKT6bMyXlvT/kaOdKJcgbuzTQDaeEca5W7lu71Z9eW6sQU0vCiH/4UAnlyRfBZaTfwP1nH8SPxCglqk6+/z5bqHaOgfM4khgN54lBGPibIuxSa5yOvVSM/B9GB653daEbMd+ljrfQopQxa5Ahmao1gLuea/jT91VDKI41ZTbhq0rQaVdEkN/nbGiy/QfmMS+OjhHEOEN+SqNX1nLnlTAKjY1FTKlPyihZPrMi5B+Jm69XIg/TDKXJh/KnEX+Cr2IExFtfisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pwh0o1lL3AUtAxFQNMWY+SCvWbnn2SAiTSS6N7Kb0mQ=;
 b=iAdwQd/rz9ZLDenoYrfvP0WTg94nm6Ljx9E3GYTB8pGAyDDcRd+Jd2MxKBpJqrvFRP9SbaKjXp3tBKENBQu2hmoSKWrwq59AhC6pJ2kr7Hw7DeYNjbwD4idS24pzdyRTl7BubpgomAVK7kLzrmycQzTgfpssRhqXi5UcL9tHb87EF4t1b0muchcNzFx17TalCYxNv2Jdk2waYkyUZWYEuPOusqJF9gQDnsNZPFgHkyh9X2SDR/TPq6KYeJml9Y+OAqx420aBsGsqH5ecTnKxV2/QOOmR2HIMR2X64UKJ2Z+v41+cJpYo+A5FUL3N+j1MeVKu7f+Nm2rQcfRBxsB3Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU6PR04MB11136.eurprd04.prod.outlook.com (2603:10a6:10:5c0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:16:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:16:41 +0000
Message-ID: <64f9ad81-9a09-4e97-a0f8-5c6dc5295b64@nxp.com>
Date: Fri, 6 Mar 2026 16:17:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb
 child node
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-6-bec5c047edd4@oss.nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304-dcif-upstreaming-v8-6-bec5c047edd4@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU6PR04MB11136:EE_
X-MS-Office365-Filtering-Correlation-Id: 842f4a6a-444f-4155-dacf-08de7b58b234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|19092799006|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: xK6zYJZwaZfhBFz0VzsaPpGSEdPFmB2o3kT7XFf5iq1Q4/eYfrqJ0qRiCiwcSguOoTvHPGuIE6ab6lvuog5WJoiU2D3n9Rz/kAZIN4Ap/uAFlrgxvgRRQtT4SepArLihRmxA9wlQ7C0imZiZ7/mEANsNHd7xn+a37Sz6cwppy/nPXfvNh1i9aAee2QvcdK/0bjxQLjTBBa+X2R8xz5Zt/WKBDYVF68Od76TQntDB3JWZIwSYmFOFWfJQX8aGbp5dhcpL151TNpS5RnFltKTkeIwwks3fe0i0xrAKH3ik79YQUEGnjGbAjjz22BNh5uY45qdssq5KyMXvjwG0ml/Yzh5s2CJt91ybkn0ycZl2Rq3oIlogzYqjbJzV14UJUFtQ2QOP6ZkQVRpfYokc9lkR8PSg7fgnTFnhs/3oRzTyElkzelElQpV4y4KXy9HRaEgd4qABfzGUwXP9GRrkqaCowUOe7LuP+o85lMUdRsVH53Xj4meCvCA5Qq6Lepn7ujXC4nGlVyK56mlPx4gbG/q9kO15kpG50yjBYU6g4KRKumUx955yNDt++0q+CDzZUHOdoEozLk9SbBlHQ7Jw0QDewWFiucIJgslndlsqFfL142xWnlASiF6GR/U4Xig+gYnkjirQTLmSoIBRh0EYkPIQ9hKJgmOMqG3nsp8bsWN1chXgGxagOXbAV/oeUuD3CSYzYTGxHo2bsIbvhe5N9obCWWLFID3kDTJh0CzEWdCQEpAQuVpnszNYNzeny9p4P5TjBowlk7Os3mJ4qACNw6GPJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U25SbkF2dGpLdWlZV2JPWHloTG1OWW1nbDdzK0dpZG41ZGN6MXdGUndDTkhS?=
 =?utf-8?B?amQ5VDVNS2J3R3VJam5kMzZWYXJoWnNPVU5nbzJBV0RFSUxLcGtTVFZjKzhC?=
 =?utf-8?B?UlhpMzNpWkx2NFoxVVF4dks1VFA0UUtPY1BBak1rQ2E1bTlCbnNwVFZEUzRq?=
 =?utf-8?B?ZnNhbmlXQlUyeHZLa2YwUmc5dDUyNHByNTZVWEpHZ3pxdkRibWpNSWdSZlBl?=
 =?utf-8?B?Kzl5THE4cDBXeGNVSGVFZS9FZUdtdVM0QVN1cmRiQTVIVzJ5RTdRbFVQblpp?=
 =?utf-8?B?eXh0dzRxVjZDeVo5M2pRWDVlM3ZKaXRxNmJza1dsejNZQ1NzSjRHekRXTjcy?=
 =?utf-8?B?VjVHREo5OXFzMlluUXVvYmNaVkpkUDhKWHFrWHZxVEdrNE13bVh6T21HczdN?=
 =?utf-8?B?ek1pcTdGQVRvUkZMTU1wdTM2bTVCb0ltOVVBdnJxUGc2NUlJQ3NodWZjRm5W?=
 =?utf-8?B?UU1aNXU5L0JTZmxicmJpdUs5V1NKRE0wV2pzM1EyODFuUlFuL2lGZEpDWC9w?=
 =?utf-8?B?WWxOYWluNUJtRzNNSGsrZTlrbERuTzRrSmhwR1gzM0tNZ0JuRzM5ZkVmazRj?=
 =?utf-8?B?b1Y5a2lybGQ2RnZET3QwUXJ4eHg1MXo4WGk0WXFpY2t2MkNCK011RnBXS0FY?=
 =?utf-8?B?VzNCWkp5QUpDdHRiT3RwbWx1NFl1M3hTcEhoMm1lc3BZUmJsSStabTZUcGlO?=
 =?utf-8?B?VjBZZDBrakhaQ0VhN0NoeS9SK3UwSjdvWjZ1eUVKYzZRUEtycHhZNS9zWXl0?=
 =?utf-8?B?azlkdVJGMVB1QmFwWEcrZWVuQzYyWjgwdG83UU9SbDh2UlZxQjEzaVFpcmxW?=
 =?utf-8?B?MkVvSUVhSjhDa1RZZ3dmeGVyOWtzVlBoUFBRRXcvVnd1eTkzQzZOK0xoR1ZZ?=
 =?utf-8?B?Zmd3NUtQV001WFhER2J1QWtzTHRyNTJWdXdiTlU3a0xiU3dTeEN2YzhCQ05B?=
 =?utf-8?B?dWNISXIzMnk4c3hRaWk1a1dZOGNrUHZ6S3o4WjJScW5SNHg1UEovNG5panlr?=
 =?utf-8?B?Um9qeUN1SzN1YWVYdUJWOEk1VytmVk9EQThDMHpSemZPNTExNjZqZmVnSlhu?=
 =?utf-8?B?S1RUV3lFMDB2OUV2bGsyaHJoMGFISStSMEVxWjdvWGpMMWlXR2FqRHhDQXlD?=
 =?utf-8?B?VW83OWIwS2F2a0pZZE1CRDhhbk96VjFLaGMyN1YvM3FlMExyVmwzREJBcDk1?=
 =?utf-8?B?dGRTRldFMWF5bTJXVWdFaEE3L09WeWIwRUNFeHk3R2VyQ1QzQkpReHpDay90?=
 =?utf-8?B?SXg2RVpmZzZzclFMQWxEa29kY2psUWwvMWVia0svOGFPWW9YQVA0OXZzOGNm?=
 =?utf-8?B?cTM1ZmMrWTV2MHVjS1U3eVJoczFjbGJhWGhjZktaUVdLYlUrN1B4aWR1ZS84?=
 =?utf-8?B?ZU5hT2dnZmVwSFlHYWVTdU1ybGZudVBkRVZUc0pQL0U0N29CL0pibzJMSVhS?=
 =?utf-8?B?Uk85NVl2ZzEwVG56VjZLR3FuSkx0cGlPbHdsMFNjdEJnZ0Q4aHpybXpxanMv?=
 =?utf-8?B?Q3lHZWhIeGl2WGYrTU5yV0U5V0pVRDdNY0U0bHJWQ2tCZnVIMWtUMWc0RjJ2?=
 =?utf-8?B?aFBwNytpOXlhK0pGT2tOVHg3TU4weUg2Wmp2QnNqcE1BUEJkVG5iODdaKysv?=
 =?utf-8?B?QVBRUHZaajZJTXF6RjloZ3pMY2dJNHZ1VjRmZk9mSWg1UU9MZ1gwU2RYMW4x?=
 =?utf-8?B?TEVrNDAwbjFGcHAxTEhhK2EzQVEyRXpZd2VsZitnYkpzaG5waEJ2MlhyREhu?=
 =?utf-8?B?dEp2Z2RTaVExUDdRZW0yZGhmSk1tR0VIK0Fib3VKNGlSU25tWWl4ZytEVXBS?=
 =?utf-8?B?U3BycTJsYnRBa2VxdHJrUHFZVC8raFZqN0FlRGltRnQ5WFRQUDZxM05IUHl5?=
 =?utf-8?B?VFhjODBmR3NaaVdzYUhEdnc0TXQ1Mk9HbW1WOXoyTGN3NUt6USt0VVRVZFgy?=
 =?utf-8?B?aFlIZXlBOFVIeE50MWdMMTE0NE1oRDE1WGVoTkJiVmtvTE1UUEI3a1d3UElM?=
 =?utf-8?B?YWUxMm1GTWtCSjBCZk9sODBqaGVxUHl3WnN5dDVENjRTQ2dRb3c2Smg5MlJt?=
 =?utf-8?B?YThZdGdpQjRyL09vb1BxYW5mbGN1aTd6RXRyYWpUR1JQUlRSWS9IbkVqalBi?=
 =?utf-8?B?ZVFvSit1R1piMXU4Wk1SdFFVT3ZVbUJNbkt0Y3F5YldNNTJxb0M2dlRrUWRB?=
 =?utf-8?B?V1QrUlA1SThsV3lhWWtrNVZRanhZUHA1T2FqdjZMcnNhTVBuVy9rSnpRT0Jn?=
 =?utf-8?B?dS9mbFIzekNYQ3VJaHZxNkhDSnJFb1hCQzR2VHZ4SGJTdmZwYkV0Vy9scXJa?=
 =?utf-8?B?d3pFNUtZR25JZ3hwUnBsWW4rZHVZWnJiMmxUc3dLcFJTV2hFeEk2Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842f4a6a-444f-4155-dacf-08de7b58b234
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:16:41.3797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n06LPdgMdePAqchsfqhSFVLQo8tWX6n6v10bN7gcSXzwJZD9ARmDshSKRQQ3Jqeg+QcBYDaPDUNOuzoOIUv1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11136
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
X-Rspamd-Queue-Id: 36C0C21CF35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurentiu.palcu@oss.nxp.com,m:imx@lists.linux.dev,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:m.felsch@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,lists.linux.dev,kernel.org,nxp.com,baylibre.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:email,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:34:15AM +0000, Laurentiu Palcu wrote:
> Since the BLK CTL registers, like the LVDS CSR, can be used to control the
> LVDS Display Bridge controllers, add 'ldb' child node to handle
> these use cases.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 27403b4c52d62..85d64c4daf4c9 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -26,6 +26,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -39,6 +45,11 @@ properties:
>        ID in its "clocks" phandle cell. See
>        include/dt-bindings/clock/nxp,imx95-clock.h
>  
> +patternProperties:
> +  "^ldb@[0-9a-f]+$":

Same to patch 1 comment, Marco said that LDB node should not have reg
property...

> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +
>  required:
>    - compatible
>    - reg
> @@ -46,6 +57,21 @@ required:
>    - power-domains
>    - clocks
>  
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: nxp,imx94-lvds-csr
> +    then:
> +      patternProperties:
> +        "^ldb@[0-9a-f]+$": false
> +    else:
> +      required:
> +        - '#address-cells'
> +        - '#size-cells'
> +
>  additionalProperties: false
>  
>  examples:
> 

-- 
Regards,
Liu Ying
