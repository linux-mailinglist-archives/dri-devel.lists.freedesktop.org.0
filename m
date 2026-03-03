Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIixAZJPpmmxNwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:03:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6926C1E84BB
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DA710E049;
	Tue,  3 Mar 2026 03:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OBvJ6whM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013028.outbound.protection.outlook.com
 [52.101.83.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBB910E049
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 03:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bu+hkyP8NpVPj0eTJ7n/qgLUFSzzjyJfI7Rk70nERD/3vrGgz9hCGrm3x8ofGkuTEZ7Cwyp4WOqCpm5nKM/ObaTqksx0eI4wT8KIKhp7Kg/U0kYpwbgT7d3DWY6Oj43L99LmV3IK7/pnQUd4lQPbmsk3hxMn1Sm+pqIKBjbhzHQBNcQZo25fULsSdIMGDKdfLGAAuwWip2BCF11onFUKyGLipqk5baJmyOxfW+3aANZRtz58esRwYot/4m3ZSC6AFmNUE4LKMkeFxN94wyEwYja07sfND/ddir5ApI/z39nEnKPPWTL115nG5EMXaHzGNOJty0wi6YvpLsAw0i12zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fffFgRZRyntqg1vkQDhzr9SUQndcMf0ptNqz8p2/GMM=;
 b=wau1g2yrwXEAjxHbN18OfoSH+9aOrhFI5SlWx45BvdJDViti7KAaUDtCjnelW4SJsIkSRVsCIDZOxUQqPZT/+ME/yeXZGzbc1ONh+IRD4zTYoFGdUZrTLk/GHd6yJ9K/ycgWuZC/zbCWYqSyp6V4kCcjKWTKJlHPIRmdinqxDe5kJOvy8A1gOjUZCYFEDHp5AYPUa81KSuFRuGA2fPVSxlGYWCeKWJ/mbfci7KSWsSb154jh5DZHUyqJbh/akClRlbqlf1flYMF2zNIWMcqJVUgszWSHRB8OvzSFiLonvLYnb4YiD3lw5Q8IjLHYyWHdtmKGKTwKxvqh8R3Z0PidPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fffFgRZRyntqg1vkQDhzr9SUQndcMf0ptNqz8p2/GMM=;
 b=OBvJ6whMOoVHdMFUOZSISsFTk+N9CzGlVouDeETck09LNVXvXd0h0L9ccCG3RsfCzSZaACI6s35BFZ/aSHueiMsQae9zhDovozyveS7DZHcFbv2yh4jK6Z6TOqjJnneqoqF2om2KtEwtOoFf1mr1iLelKSjuF23xzOrGah0rnvXHz9/GM8/Tm12fAZsajnz+Tbba/bMUYcgV3wzil93O++c42FTyxpmp6MsEfXQrkhZVDHWZ3s8IhrAy0pm0xtjdL6q3+bLKS3UCE6fZd0//cpYwoucgoUofbP5856glaRg8Z2H4dBFZh1UvX1Rvn5WysN3ADTYsIvyvW5wiNZfjJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB9018.eurprd04.prod.outlook.com (2603:10a6:10:2d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 03:03:34 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 03:03:34 +0000
Message-ID: <522ab537-1460-4eea-b992-e27df85805bd@nxp.com>
Date: Tue, 3 Mar 2026 11:04:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add i.MX91/93 parallel display support
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, frank.li@nxp.com
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: b171fea7-0a9a-434d-a07b-08de78d17543
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|19092799006|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: gJqGoD8WCJo10JKaTR6SZ266s+iiw5nUW1SkDW5SR4XHk7fM5gNDM0vAoRctw4DHnyuS7JwvNkRIgt/rBqGllnFSxgH0RDoiO4kD5loaYKKVrkgGMpT++Vd5Z656UQzhN4IqTPJXE0+984a2MWouOhe8NKg0cXinTDwlSxBD3Mcyjh/gnPWwzG8suqxJQRQoqg8A7/IDSnM4zUE+/QeVCoxKuy+MOJT56YkGiec+GfLXpR195+GY9ZHKa9riRHljtn/RGrPW+36QkzNtj6PB6BlD7i7doWTqQekeUHwa+Nb8CitgEE/clLYa3tWfDUsGNEUycWy8p/3n6I7X1N2/5zEhENVGgwdhiueFqbgNMn2l7BXIpAejHW2vw2gKJDJz2qGKqaQcMICMRrnfNrei45YoTT1l0/XqC+tNDMI1nS/dChll3Xmrx9Sw2fxmOi5cheDMX1AKPEDrqjE/7/UULP6wZsooe3nQBDhzWqbK6g2THl4lx3koneK/zFpZyHG3REGbWPz30+uuEXKdW6j+/EcAlfX4QkQbTqF4JqugSli3aJRGZLKwV68LwlCjFuOOPf6y8epaUvrCRecrOBTMPB+WJ5DJ2osTQZQ8HJxlRyu6xcRPwBy5F7lPO5rJ9rLlyMxe138K2xxiU5HSDRtFfEPbCD4bG9wNIMNquGGNNnuyQ+T9pDTBHtQaXK3Byy5YNpfyOCqV4nQDcw4upokx/ELKW1IA2VyUF3h114q7rKP3rPs/vKcUym003LA4D5i7b6iW+Ie7ELiq4JlScAc43A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3U1L1NYZU9nMUl0V0lMSzRRTXVEckx3b1dDeVBGWElqdmxVb05BK3Nxb05m?=
 =?utf-8?B?amFUUmxmZVlXREVFaEw5NzRGa1pXN0Z0SVRKSFpHTjlRTnhnNFVDV2c4Mm03?=
 =?utf-8?B?NjVaT1UrVXlFanQ5SkhPV0JMZ3pTMyt0UzFYY05rTnRKYWlTb3RyRUUzYWtI?=
 =?utf-8?B?dVBCNFRYRzVHVXRJVFVwT1lVeThRSTZYTlpqZm5GMTREelkvZFJzMmF1c1ZU?=
 =?utf-8?B?QTRQVFNsZExsS09ITzdaeVZDTmpaaE5ieXk3WXc1ZlRhSFhhQ0xvcWRlOHhp?=
 =?utf-8?B?UXZ1SFlqNTBRWjRuL213K1ZOMGVBOExjTW1WSEN0dFVKMzRTbCs5bDFqbGl1?=
 =?utf-8?B?TVVQNVVHcnYvbjlDQktxYzFTaW1iaUtrYXVDSmlGY3owalBINDFveitRaVQ1?=
 =?utf-8?B?cGtkbWJvQ1pING40QmNkaWF0M0NhZFlCckpUYjdMSVI4Y0t1QTh1a3NWZnVj?=
 =?utf-8?B?SEkxTGpwSzdpbUViYTNjTlpwY3QwZkJqVVQ1TElyQkd3d2trb3pqK1RzSWZX?=
 =?utf-8?B?cWFDbmVqYmxGT0l4U2hWMFNPMVBiUm5QNG8rWGNZUmgxcjZjOGZpb3Q3Mm9P?=
 =?utf-8?B?QXR2SFJIYVFJOUlUQ3M0eWRmNDhJbDRMTDJXVHY2NlF5Y1Nsbi9ocCsydXEx?=
 =?utf-8?B?YVc0VXZyaUpFY3kwSno1WERaU0tvVXpjSjFHNlpaa1UrbWFFdnc3M3lIa2M1?=
 =?utf-8?B?K3BoTVdOazR0SXFSU3MzYUI0VytHcmthemd2OW5jR3pMTjJzbTg0UDc5YXph?=
 =?utf-8?B?cXdxUVZQbW9XMkZ3L3AvVHBCbWpjbmVxSGwzWDZXY3hXcE4vak9nRWtxYUhX?=
 =?utf-8?B?MHpsbFhqSU91aFIwd21qNGZpa0E3WUJJclRWd2N4N3MxdExvZlhtODhpUDJ6?=
 =?utf-8?B?U29lSGZVMWlLakk3TzE3MTJST2l5N2lqR2VrTW5ONnF0VGRjREdmRTA5cmtr?=
 =?utf-8?B?aHFNTVZsN2M5cGJzRlBEN2cxM3lnaGlJZCtvMXZMNG5ISE16cHZQZ3pEcE0r?=
 =?utf-8?B?TUFHc1NPcUowSzRKcXNobjNYdlVsT3pvamJoOTRNSXV5Q3BreTlCSklNeE00?=
 =?utf-8?B?cjJhU1dSbHY4L0ZxdjQ1TC9Wd0xZV1pxYzR2MWdsZklLb081MlZuZVdhaWhq?=
 =?utf-8?B?bWtlTk5QcWFaRjdVZzVkVUE5MHV0c2w4WkhRZjJoVTRqdGJ4eXMxNnc2aVNN?=
 =?utf-8?B?VW5rbnRlVUhIWFM4RExhbERUc3hVR0kvLzlCbnc1MDF3RnE2ZHIwTldBVzNV?=
 =?utf-8?B?SWdyblE1YlhScGhXZmc2T0JXQUs4TjFKM2RkTU14S1lZMjY0S0xRREhQb01t?=
 =?utf-8?B?Qm5DckNLbkNXT1lyRVhXQXU2MXN5UGxrVFI0N25rd1pRZmJ5RWduZE9PVnZV?=
 =?utf-8?B?SDlrcXowd0IyYTZGQzc3dlhkVEc3TkhBWHROclNJaTd0Sm5xTEtvUDBUWldD?=
 =?utf-8?B?L0IvMG5CbktJalNHM0dDK0tVWjIwK3pPM0ZFTGZOZWVjaW41Y1dtY0s4bWVy?=
 =?utf-8?B?OXRBbytPWU4vMkdDUVZvR3lXYmxHWkI4REl2QUowTFMvUzVPc2xVUWJQeC9B?=
 =?utf-8?B?bTVROTJZWEEwaE1hNHJ4dE4vUXVXYzhaSDZFRkZOWmVJSEVTbXlpK3ZJczdv?=
 =?utf-8?B?VWl0aUxnOE1GTHUrV2ZBZUNkR0x6MHlTY2dldFhtTEEvZFZkaDRQYTRNbTQx?=
 =?utf-8?B?UmdNRDdlTXVQRnB1NE1laDVyQU4zcmNzcy9yS0c4VkdPc3IzZVZBcEZ2Mm5w?=
 =?utf-8?B?OFJ3RXBLQTYzbDVQSzNsRUw0TXd2WjNoOXAvT0tzYUVyNzVLeFdtREJaVWRU?=
 =?utf-8?B?YjU0MGhnSlZOZWRnR0VwUEFsdDIva05xZGhZcDVTYVRlem43QUM5R0NkZXha?=
 =?utf-8?B?M2JpTGdCQld3NGdsQVFUUGZnSVl4eGUwdlpwZnl4ZFU2LzcwSEJBRlA1VzRs?=
 =?utf-8?B?OVA0V1JZdTM2bU8rM0hFNkM1S0xkSllwRldkL3ppTXVWSCswbXVscy8zemtv?=
 =?utf-8?B?UkJpVVRZS09UQitJZTNRT1FQU0pkeXJ5YlNDenVIWnI4Q3FwQTI3dDI3eXhX?=
 =?utf-8?B?SWhBcmQxU2J1M1NnamxTa2p2L2trSFdhS1c2ZGJLZEJkTVh5Q0o3OEtpa2R4?=
 =?utf-8?B?L0owM0pZZnQ2VE8wSjIzMlM4RWFsTHZrVmlaV2Y2bExzMVRQOTZkWEQ3QzNV?=
 =?utf-8?B?bnBHYXNIMlJzcVAybmNhb3dZRkFvR3o3dUlOTWtrdno0bURRWVRIOGJhUGI3?=
 =?utf-8?B?eEZpZFdzWW51dFBGNFBsTm5zVFlac3pJRU5HOE1YQk9ZaXJtNFkxaldCeEJC?=
 =?utf-8?B?WTlpZTQyNWZNckZJTGJoM1o1SC9zdUdOOG9nUTFBQ0lvalFlSnZqQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b171fea7-0a9a-434d-a07b-08de78d17543
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:03:34.7620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZkXWEKqYRuq8qjWcNf4+ZnPk58723tw8gnD5GMIH6OSt8dfamPW56s35M+ENga3ijsEn0FPVRjgmjJybmrdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9018
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
X-Rspamd-Queue-Id: 6926C1E84BB
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
	FORGED_RECIPIENTS(0.00)[m:m.felsch@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:frank.li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:mid,pengutronix.de:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:10:39PM +0100, Marco Felsch wrote:
> Hi,

Hi Marco,

Since Frank Li is a new "ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" maintainer,
you should copy him.  I'm Cc'ing him here.

> 
> this patchset adds the driver, dt-bindings and dt integration required
> to drive a parallel display on the i.MX93.
> 
> Since the i.MX91 register layout equals the one from the i.MX93, I added
> the support for both but tested only the i.MX93 case.
> 
> This patchset depends on:
>  - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/
> 
> @Conor Dooley
> I dropped your r-b tag since I added the 'bus-width' property.
> 
> Regards,
>   Marco
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changes in v10:
> - Link to v9: https://lore.kernel.org/r/20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de
> - Add MEDIA_BUS_FMT_FIXED (Liu)
> - Drop next_bridge from driver struct and use bridge.next_bridge (Liu)
> - Drop linux/of_address.h include (Liu)
> - imx93-pdfc: drop bridge.driver_private usage++ (Liu)
> - Make use of kmalloc_obj() (Liu)
> 
> Changes in v9:
> - Link to v8: https://lore.kernel.org/r/20260113-v6-18-topic-imx93-parallel-display-v8-0-4abccdc473a5@pengutronix.de
> - dt-bindings: drop unncessary changes (Frank)
> - imx93-pdfc: drop bridge.driver_private usage (Luca)
> - Kconfig: Adapt Kconfig symbol and prompt (Luca)
> 
> Changes in v8:
> - Link to v7: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de
> - dt-bindings: add nxp,imx91-pdfc compatible (Liu)
> - dt-bindings: use video-interfaces.yaml# (Liu)
> - dt-bindings: s/data lanes/data lines/ (Liu)
> - dt-bindings: drop 'reg' poperty
> - dt-bindings: drop #address-cells, #size-cells
> - imx93-pdfc: drop drm/drm_print.h include (Liu)
> - imx93-pdfc: s/exist/exists/ (Liu)
> - imx93-pdfc: drop MEDIA_BUS_FMT_FIXED from imx93_pdfc_bus_output_fmts
> - imx93-pdfc: imx93_pdfc_bus_output_fmt_supported: make fmt const
> - imx93-pdfc: Rework input-fmt selection to always fallback to a sane
>               default.
> - imx93-pdfc: imx93_pdfc_bridge_atomic_check: make use of
> 	      imx93_pdfc_bus_output_fmt_supported() 
> - imx93-pdfc: drop 'reg' dt-property usage
> - imx93-pdfc: imx93_pdfc_bridge_probe: pass -1 for endpoint reg value (Liu)
> 
> Changes in v7:
> - Link to v6: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-0-7b056e1e5b1e@pengutronix.de
> - Add missing bits.h and bitfield.h headers (lkp)
> 
> Changes in v6:
> - Link to v5: https://lore.kernel.org/all/20250304082434.834031-1-victor.liu@nxp.com/
> - Add bus-width support
> - rebase onto v6.18-rc1
> - add review feedback (Alexander)
> - driver license "GPL v2" -> "GPL" (checkpatch)
> - make use of reg of-property
> - fix to short Kconfig description (checkpath)
> - add OF integration
> 
> ---
> Liu Ying (2):
>       dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example

This one and ...

>       drm/bridge: imx: Add i.MX93 parallel display format configuration support
> 
> Marco Felsch (1):
>       arm64: dts: imx93: Add parallel display output nodes

... this one in v9 were applied by Frank, so you should no longer send them.

> 
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  78 +++++++
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  54 +++++
>  arch/arm64/boot/dts/freescale/imx93.dtsi           |  12 ++
>  drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
>  drivers/gpu/drm/bridge/imx/Makefile                |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c            | 225 +++++++++++++++++++++
>  6 files changed, 381 insertions(+)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc
> 
> Best regards,

-- 
Regards,
Liu Ying
