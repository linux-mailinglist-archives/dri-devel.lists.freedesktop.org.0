Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHY3Jo/SnWk0SQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:32:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E6189D00
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 17:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373110E5DE;
	Tue, 24 Feb 2026 16:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KvcvuKXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011060.outbound.protection.outlook.com
 [40.107.130.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9D10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 16:32:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIZxtBMNlspWuasvW/jPQFBkRzUqgCchYICEb+jpczSt8U98ZC3tutFiI5BGTH+qsw4dr2w6aeklA2gW+Ul2wb33yzoqKU384umvDsRA13QG3Jr3Qbx3xgtaruRoafvlUZ+Y57J1wj58wquOcbtUuUnlvYyUgGq6W5X2jqMWT474lGy0oU0djQeTAId5Y11BQIlATn6TWFXqQeLHFckqT9RzAa7wazawTNs3whO7jMKHpzGNpLf6+4XWRI0NrkhWenRsL2gTMDLb2UYaP7fQuQsbWGWiJm+KfKdMi5fwijma/B81/ymKfPxPIv5TV2epM2XLy3A25JgoduZAEsbyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=breo8LKmEzzZtLcPrQ7e/ByTIQaejQotCXQdo/e7pzs=;
 b=NGTmDn/Thgrep2ZtlEuIRTLQdttt9fyJ6Z/l9aUb5n3LJbAT96AkDogjUjBxYc1CLK/8oF53xQzw/C3t/EyDcDZn7pBuVCpKLJD/FiKHhzFI/+24+sLlU4TlAoAtzaJ7xOyJJdH8/oWQqWYr/BOxVAw8ezo3rbnK7Uk4TBSi0yetLR/MNRSg4MYv+cvBTVepp3I7POs68QkH+4ADgFpHHpHsNL6mgwOq90Jw8TPzvNxycI1K6+7KzfTfCxOHaRNQEm087uzYD/Zp0A99y72O17LUNQvrTMlwO/R2pa61EeOPmgae6Zn8RU7hxKFvVv2bB+zR1mp2N3S9cJG5wXnAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=breo8LKmEzzZtLcPrQ7e/ByTIQaejQotCXQdo/e7pzs=;
 b=KvcvuKXYTmugdpQp66bsAm3Gkw31f4lbarklXVrqJEMja0iHosLdNGMJCnj8uwiWRgVPPUJCOvOfPY2A8ArU1KcvHTxsL+6jtMcUI8bd/qlpw4ig86sh3vkBUQ6//FZ3rpwgf50a69hqVGgGwhDZTh/FykzMBLGGppbP8Dhl8gI2Ofh7zzLrpVeZtzpqAO0+d9KNh6RnGPE8RkQbH9+jrfIQCqijnzvkaGoF18xcVx2Std0nzv846SLa60V864TwPn8rgVrTZdH++l6XZRbXl35GAxebQtDOciD5uKpWjtf2M2ZO+MT0LyWswBBF1Z7zNZyepj19+q8WQz5KErl5Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:32:07 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:32:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com,
 Marco Felsch <m.felsch@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v9 0/3] Add i.MX91/93 parallel display support
Date: Tue, 24 Feb 2026 11:31:37 -0500
Message-ID: <177195063136.2864171.9650626474266719679.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To AS1PR04MB9382.eurprd04.prod.outlook.com
 (2603:10a6:20b:4da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc32639-0c82-4365-aade-08de73c23f7a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXVydGo0MEswZUFNQTdlZDhERmVSMUdJVzZXWWxLbGEvdE42aW5CclZvdFM1?=
 =?utf-8?B?a2VjVDhwZzRHK1dUNG5uUGNZZGhURUprNEMwM2FraFd5YlNsTXdQS3U2Wmhn?=
 =?utf-8?B?VE05LzZWSmFuZFB6VlBzUjU0UVJxeSttQzV0c1BGdXorYitseWhaeEpOR0xw?=
 =?utf-8?B?Q0I2Z0s5WTN3bHI0UlljMDBFcW5USFgzTzFtdE94R3Q1TG9QK1pPY3o2eDAv?=
 =?utf-8?B?WWdaYi9JSUJWa0V5RTgxS2s4dmFaQ3k3SDl3SFZ1RFpEQjFkZm9jclE2UGxO?=
 =?utf-8?B?WWFvOHdwdTkvZElkQXdZOVFaMGpJc3UvRUdGMGZ4bUh0NWdyUy9rSkVjbmhD?=
 =?utf-8?B?c0ltU0w4VFdBOHh5d2RCWWRLRlJrZmFBRVVKOGZ1R05HclM0NzA4MUIrdWRK?=
 =?utf-8?B?NGxhYzlzL3hZazZYQVNEM2pYSkd6eHJrQ2pjVGNSR3l6bXZpQzZGRnBQSEZ0?=
 =?utf-8?B?UzRRMUZTV3Eyc1I3R0doLzVWanQ5eHlxY0ttbHFvdmJpOHVJVnVPbHhOTmxx?=
 =?utf-8?B?Y0hteVBES00weHBSeWRscERSWDdhdVVCdzdnK3BBT1hUOURPbE9MUTdRMWNh?=
 =?utf-8?B?ZXc3RFFHclFTRGwrVk9JeWIxSW11ak4wbXFpMWRwV1FuUTZwdWZXNFFwV1FI?=
 =?utf-8?B?N1VOZEw5ek44Z1hNc2NDb01ITlRUM0FjeFlPZW5sc081VnNYYmZEQmlaM21h?=
 =?utf-8?B?SUpzNjcwK3pGWFEwY21tKzZONXpRSlhjejNiaDdYbEl5V0oxUWxITVluQS8v?=
 =?utf-8?B?RVVjUTZFYmUwODhrK0Q4NFA1SEg3bjlTUllJc3o4NnlISWpDaUhCTUFKb3JZ?=
 =?utf-8?B?Y2FBVDJPZWRwOHJpTDROZGxpaVBaMVhhZy92Z0o4Q0tEcnFRYkR0ODk0VUda?=
 =?utf-8?B?Y2pFYnFsa2pwMlE1OFNXUnEySDVMY2EvM1JSOU1hT2I3bkhCQWgyRXR1c0FD?=
 =?utf-8?B?cE5OWnY1MUk2QlR0ejdVQXMwNjNuWGFqN2xsOHdHdi9aYit6UjBxWDFhSDJV?=
 =?utf-8?B?clNSYTJKSThLYW5BekVXQjFBM1ZUbU42MEFhWkI3RWpmTkUzbHZLRU9SNkJN?=
 =?utf-8?B?S1JQdXBHSzkyUW41aWVrbjdMVkFSZzNRbEJWQ1Zzb2pPb1lkVGZyb2ZQOHdy?=
 =?utf-8?B?OVZ6ZE41T29ITXY2cnFzRXpoK1BaSFBORGxNRVEzY3JPRFZRZFVKcWtOUEU2?=
 =?utf-8?B?SlVFYUQwS29jS1VxTzJ5VVFvbGU4MzFnNU1KTlBlSXdSVXdqQjJLa0cvaDlD?=
 =?utf-8?B?OE1JbkZSbmNuVisxUkpqcW04dGRzTFI2L0haL29wVUFMMUNPbnFibXlLbHc5?=
 =?utf-8?B?eTNJSjRmd1pyTGJzb2NscFBCY2FubGZlRlM2VG50Q1VLcmxqc0ZRaW9FK0NZ?=
 =?utf-8?B?K2xSSVlBMjQxRXZiUERjVy8wQ21sYWx0QWt1RFNwWGxhUkxtVFRuMTlhclZF?=
 =?utf-8?B?eVFKVmxUcTZiVC81L1B4REEyQnk5RnNMTlgvSTFyaEUrQmQvNnhTNjk5Z1V5?=
 =?utf-8?B?SHp0Z3Noenlma3NPM2RZWHpRSHZXRFZhd0dGZG5jNDZGUWYyVXNCc2Jmbjc2?=
 =?utf-8?B?Nkp0d01XQStSL2QyWUw5MnVzUWc4ZzNGLzdHcWRtOFVBbUYzc2FHeVlyM3Uz?=
 =?utf-8?B?SnYvY3Bkbi9aRitOZ0NRUFdVeDJ0VW5ia2FRZ21wbGlvMjhoRVk4ZENLcis5?=
 =?utf-8?B?ZisyK2NxOVFNQVVHSjRUSzdJSkZRbXVERkQ3a0x5T3UyRXl0QlVDSjBQN3M2?=
 =?utf-8?B?eCt5TC9BWEhzK1JhV3FGcnNEOE9SVXhCZXRvRzJiM1QxejFCWU1mRmN0dklw?=
 =?utf-8?B?SGc3b1Q3VUo0MWNNZVNjc0U1TEtnczBVaEg2clhBYzgyUTBvNnd4cGExUnIy?=
 =?utf-8?B?QUdKTzE5UkdlTTg5NGltOGorNFBINDhtM1VxNkJpbmExNWN6RGsybTlKK01L?=
 =?utf-8?B?eWJ5NjVwTUlNb2NsMFRhMG02TjVKRCtacnAwSll5YjYxWXdkUSt6am5vSlhM?=
 =?utf-8?B?aXhaSUx5SUEzYjBTYzl6eTloV0FTWFBycEl1akV3Z3pJTk5qMUJaTGtjbmVp?=
 =?utf-8?B?Qkl6dncxaTI4QTM5QWNZTzFnOGhOM1VMVkI2cU8zcmFOWW1ieGxDUEhqbmZ5?=
 =?utf-8?B?RFRTd0RwOWdna3B1WXVyb3ovS2JHNWxNRStXU1l5UFpoMmNVbDEwR0xCZGJY?=
 =?utf-8?Q?pDKiFi9eo6lBXx4BJm1U4Io3VAJl783Cx5UMFCss+LzB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9372.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHpxUEtPZmg4WjV6aHZML0ZQMDBzRFRPbzlvUlVHK0dZdTVPSHB0ZDV1d1d5?=
 =?utf-8?B?SzREUk55TkVxSlJ2NEVDMEpkZFFYN2IwUmRSWEdmbWc0akdibUhtdi9vR0pM?=
 =?utf-8?B?SmJ3dUVkd0VmQm5WWWhac2p0TktWS0hEK3hVOWYxdkhVa0Z5SGI5K1NHbFJW?=
 =?utf-8?B?dVFkdzJJRWx3T1YvbVgwVURxV2ltdnhDN2J6MG91OGRxMmxGSXlRaW5QdjFy?=
 =?utf-8?B?dmhaOFlvb2xucm1uamVvSEkycWZLb1pqMEwvTGtRbmtmR2ZvWWpWUzZSd0x3?=
 =?utf-8?B?aEdmc1hsUDBkdmg0VmI0ajhWakhPRVZZVUpaOWZIWDRrNDdDY0JUakc3TjI4?=
 =?utf-8?B?aktZbUJZaXpjdkkvanBjeWlOSU5DRm02RVF1TUJCWEpSWVNjWklaeGFhcUtz?=
 =?utf-8?B?blJscDkrWUdTd2JMSCthdktsUWVuUjlKUEZuYXoycjFCUU1oRW5RY1hZWHdE?=
 =?utf-8?B?cVh2NC9xUG9vWUNPMkxyTmUwQlJqVzZldXVsRVMzS0V4VDVwSldxVFZOdmNC?=
 =?utf-8?B?WlJhQW4xck9BL3I3SFk2WFRRdHpvWEhhRmlEbzZ4V09OV3FIaVRLdGxPV1V6?=
 =?utf-8?B?aCtoNStvUWE3MG1SMGhscmVVZDZEWGdDZE9uZ3lIeEYyZzBKa242ZFh2UWVC?=
 =?utf-8?B?d29UT3U2NG4xZXRDcWZ1L3ZpUmRBWUZ1MGRlN0s3YnJJN3p5NU9admJxeDl1?=
 =?utf-8?B?ZjU2OTlFWlMyS0ZwOE9WWkhsYm9mSEhURURjVndXTVYvazNTQWhvUkNGVm9Y?=
 =?utf-8?B?QnNDdjl0cUNZMmJMRFJ0aWhsSDkxUXBzdlRjdVpzaHhIMFYyait4b05QV0Vx?=
 =?utf-8?B?RXFjOTVvUkZqcnFTby9ObnlyUmh1YXZhWDFiS0xBTUE1cHd5QTd4QkxrYWFo?=
 =?utf-8?B?UlJ5NWwvVmFMK3g4MzlRQjRBelpGem9nb0VwNW5IMzFNT0VFUkJ2cjBQa0RE?=
 =?utf-8?B?ZWxLUDJVVjlyTEtIc21XZ3hYa2NDS1NUSW1oOUtoVVdYQTZzSEsxOWh4RnAz?=
 =?utf-8?B?NnQvUUt1WVJ4dXk3azJ5b2RPQmt1QnhoWkxFOGZkbVJyV3lwdXp4RXRoem1P?=
 =?utf-8?B?RTNNWXd2MXR3aWpPNmxTSkdhZUdpQ3VBR2IwVWVTVDVaeUNVTEFMTzVVamtv?=
 =?utf-8?B?SFBjUjdYd210am5mK0RaZ1E5TXJUdFE5akV4MmlXUC9jZGpwQzdDSklBYVl0?=
 =?utf-8?B?U3lDL2F4ZjJ2ekdVajZxSVNSWEdZMTJUUFM4QnZETGoya1F5eGxHbnRvdHE2?=
 =?utf-8?B?M0pGV1J5UG95bUZwcFl3cnZKTWNkaExkeE14VUYxNXJ4VjIzSzBFK3hRMC9H?=
 =?utf-8?B?TlM1K09GVUlBcVV0Y29sWU1NR25vc3lGQnZkWHMwdkJBR2N1ckUwbWpoWHk5?=
 =?utf-8?B?aklXUnFqWkw4WUdOQWZQLzRoRUVHRitlZ2xVWGxnYlFxWU8zdG9nRkZ1TU1v?=
 =?utf-8?B?YnQwK3JWRC9CTUhmQzJnU1pTUXcrZUpUUDhIa0xuRGI2Si9UbWN1Uk5OVUZY?=
 =?utf-8?B?VndmU3I0MVRvUEoya2F5QU9tME52VlVwMklybHcybjBpWEhDNlNuZko0d1RD?=
 =?utf-8?B?dGwzNkZoQTRzK0RZSGxieDkxQ1NFQXNGeTlteGd0YnQ2dU1DTUNOcVZhVTJw?=
 =?utf-8?B?VDQ1allja3FDU0V2Uzl1eU1Ub0FLWWUyS2VwQW4zUEFHdFBUa3p1TVBQV3JS?=
 =?utf-8?B?eW1Md1c5QnB1Q3dCVnBTdmk5WUVOWVRFcm8xb2VUSVUzeG9RQzZxSXFPNHBC?=
 =?utf-8?B?VWIvTWJ5Rk9qU3BKU1hyQU14UkwwZHp1bVpqV2dBVm9rSmJLWGVwb3IxdU84?=
 =?utf-8?B?RktZRVlpR0g3d2dnUGV4ektpTmJuK2U5TnVuQXRDK1hzVWY2bFFNM0E2c0JY?=
 =?utf-8?B?MldJUW1SaGRzY1RFT3NSak4weWZGOXdidnBPZUNKZXVrQ0RhbVFUSkhNaWsw?=
 =?utf-8?B?UVVwbkhNUU9KUCtyb3c4d3lBaWlpZnRzdVdCTXljaTQyNUhOTEdWelJ4L1ZI?=
 =?utf-8?B?NEVBUzJ1WFdEWGxpcEczTzFPcGpqMXNzNmZGTy9sTGJpSGYxMVRYcEVYaGZs?=
 =?utf-8?B?Vy94Rk1IczB1TEYxZkJ5SkhFWlY2azBuQWFQUUlsbWtsM2M0clk3UUtZTENi?=
 =?utf-8?B?akl4L1l5MElFMnNIb3VkY0dDU3JHbE5QUi82bFg3bUhoMnFqMXNDWGR5YWtr?=
 =?utf-8?B?Z0RrWTRVRmttTlE1MHR2Rjh6cHN6ZXFnbngrcTBVR05nUlJvZFFXc3pjSnNO?=
 =?utf-8?B?WUcrVlJxMThzMGVadjBUWDlOV2srcTBFellKQldGWW05Wjk5M0Z2eXMvRFdD?=
 =?utf-8?B?SVJ6UXZaTm1qRjdnbUxWbmd4cEZtMlBwdnJEbXlySGROQUlycW8zdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc32639-0c82-4365-aade-08de73c23f7a
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:32:06.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM3cCoPMw0lfAZvZ93hLIdU+P/owZU/gu2eFd2TjxVRCpyDjXubCy8k17yZMW7cAY4q44hhgonXIYKTE6nP+XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504
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
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:peng.fan@nxp.com,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:luca.ceresoli@bootlin.com,m:m.felsch@pengutronix.de,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,nxp.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EB2E6189D00
X-Rspamd-Action: no action


On Thu, 15 Jan 2026 16:24:50 +0100, Marco Felsch wrote:
> this patchset adds the driver, dt-bindings and dt integration required
> to drive a parallel display on the i.MX93.
>
> Since the i.MX91 register layout equals the one from the i.MX93, I added
> the support for both but tested only the i.MX93 case.
>
> This patchset depends on:
>  - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/
>
> [...]

Applied, thanks!

[3/3] arm64: dts: imx93: Add parallel display output nodes
      (no commit info) (b4 issue, ignore it)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
