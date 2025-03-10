Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78298A58C8C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B8310E18B;
	Mon, 10 Mar 2025 07:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="e58lPIXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B40210E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:12:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3MJPhJxAkLQk3qd+erCxD9WYd2CA8KwfalNvTWTUWzhp/ky3j9VrdFby5Ijzy9xbw+CcweiYjQxCMPXrCpsMPl+x+vDrHUE8208+WSzIWXNRfM7inYRo091LRq0gSFcP94nK6WlIiNJCTkOaaMVKwHIX6oK7eeBb9liydNmTyJkNSrEeCuCvPN//hcOLXQqSwfw7qBJIddUTORqj9+JYjLhsSM79Mc0RUSVux0sYeZ6M7AvwA28r1iDbeioE4XkjPM9zf0rt3d5i6TRAJ29HIQO0lJlvczJbpaY2bOAkW09AjgWF3YIX4bxGxbTQD8QcZfQZ5qbadLYGVaJw1RZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elkuPm/WKWfwIoN4pbPSdRB4YoRw0l3PKnFat3xuEfA=;
 b=GYlzy2z3L7Rn6eJrC6y0Qk2+6QTWHl6IryWnR9qjG4XxsMdKu4JzQ8d25JHITYvd2VkywmL9hSNyZSe7Lb+NeOSdjRKN7jafp7HhRrs3nbDNYMqjt7kPHwW2tn8e7NjYtyVau9p8p7xvtQQIZqZFfZqN5jYv9ZLvLIXAKhAckhEupaNXJUfs2S6eremGd5hyViNifoJFN6aiZWD6Q4KpNyJDVSyEcnWMCFhpYdz+F7GFowkbMVOX0Tvd+MrlidZhhmPgifrV1OPZxh/7E9VxcYA0o9/9l+RV93js4IP4xLJwpAw99f8V5C6xzOsiybeKi9jUBDVHMuPQpF0PtZB3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elkuPm/WKWfwIoN4pbPSdRB4YoRw0l3PKnFat3xuEfA=;
 b=e58lPIXTC0lnnKpobFzUEIDrBQZC+hlk15jMVbL64ZyolenZxRReLSgWDQ54/S6U7N6pxVoq4tRsp03s9VOanaQdwtIKs4RQPqPH7ge+fyydAXR7qtxpfvDJ0M8BU+KXLxbjl1GYEIqA+Xssd9Z3H58I9lE5hlXgb3Ai4MYiEGTKtCDaGbemuvTixnquIUrleU46FdAbCzWvGgmFn+Y9S4HsZjsBT0upSXrJqvg3BP8qMcci5XPsdrR3TIwGUZD+LxdN3nlj4kvXRwCJ54nK2nrX7EiBQm+J/15ymw2VEVeOxYTWAsrAWrhqk5OIvKRV4WyJUuoqg9+/lHMPiwBJBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10757.eurprd04.prod.outlook.com (2603:10a6:800:26a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:12:37 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:12:36 +0000
Message-ID: <47b0e1a1-1333-402e-b316-efc4dd9eee50@nxp.com>
Date: Mon, 10 Mar 2025 15:13:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: fsl-ldb: make warning message more
 informative
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
 <f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com>
 <20250307122212.18252ca6@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250307122212.18252ca6@booty>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10757:EE_
X-MS-Office365-Filtering-Correlation-Id: 700d1bd8-e2b0-4ccd-b5f6-08dd5fa2ef69
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGFwNWNKRkRVdk02bWplelNWNDlHOWpRQnVHMVBBUXo1S2dSellsVmk0MFNi?=
 =?utf-8?B?b1A3NGh6WkhXdThRREJURjIrdk1wUFFXTWo2cG8vWStCRDJBTnNUMytZSSty?=
 =?utf-8?B?SjJEMVRvUWk4V3NiVG4xUCs0ZjFyWlhYOGtVL0JqUHdEenZQZko2ZHc0eHUv?=
 =?utf-8?B?cnFpYS9heDFnSjM1R0ZOL1RJa0hKUFdxOTA2ekIvVEluYitvZURSVGN2OG9I?=
 =?utf-8?B?MCtMNEdDdlhmQUZBU3VWSjJiNjloMGYzTVlLbXpkTnluSmdKK0hBeE9DeEZm?=
 =?utf-8?B?OHRqL0xHdUgyRko0N1NGK3V0U1lZOWNWNUF0NEh3blFGa1dVY3VHSU5PdGFl?=
 =?utf-8?B?ZkVPYmJPSDA0Q3lTNlhPa3Y3RnJtTFRmekNjd0U5aEozVE5HaDN4NUR6OG9U?=
 =?utf-8?B?TDA4Z2tKcUZwU1g5cUE2SjB0SFc1aWZYNi9vSjVGMmJvUFhXZUJ4L3I1dDV5?=
 =?utf-8?B?ZldOZjB5SjZla3d0OWNyaHNXNEVnbkU4WjZOMTlMTE5paUExcm5NYmZ2OGlQ?=
 =?utf-8?B?ek1OcllXK1FQYnR3RUtScElWSlRCZ2doQWt0L3dGQThhU20xTUx4TWNINmxE?=
 =?utf-8?B?OXZwNVkwcWJCZjRnMEpodVdzZU4vZ2tMd0M5clBlbFFXUEl4aURaVjFrYU03?=
 =?utf-8?B?TXcyamgvWmNXVFFFU2F6K1I1bjNjb25tRGl6aVlOZkRnQ2FRRjVQeTNRd3lv?=
 =?utf-8?B?SFNCREwzallJajNJREFmbXRnd0VRR05xMUZCbkt5NFlFMEgzU0x1WG9YWXJh?=
 =?utf-8?B?bUhVemZZa2tSMDdIY1FpN0VuV09iQ2dqT1RhYzg0djl2VUF4L2UyejVvUTZV?=
 =?utf-8?B?dUY1VVZnK1N3RXROV1M0SVNZajVyVXordXQreXZCZHpEMVdaM01GQ3U0QlMx?=
 =?utf-8?B?Z0wrN2I5dHNUSUVjRkgzRHVKNTZyQWZtWWpmL1RJbjhZMHpPalNPNWE3Wklo?=
 =?utf-8?B?dERKSXBzNW9lc2pkaDI1QlQwNlRjMzhOQ2lmenVOYXJHZGVHN0JYdTdLWUlI?=
 =?utf-8?B?K1dBU083dmlOYzBncWZ6NTNIVkk0UHNQc2RsaGo5UHhSU0ZQblJnTkZja3hP?=
 =?utf-8?B?Mnc0cFJDdkNGYmtsNHdhTEZXN3pWd2Fyc2xvdzJnU1VEVDIxalRCSWYyVFpz?=
 =?utf-8?B?VmtaU1dpOXlWdERMMmVKN09ZRGxEOFhFaWV0QmFtMzJWa2l4OGxSK3kvVnh4?=
 =?utf-8?B?SHVESkJlOUFZbFIrTHo0UXNSZitPcW9zdmQ0cjRnSWcxaVNIbHhHdGxEMS9i?=
 =?utf-8?B?VXdua0ExeHg3QlF3YncwVXluMVQ1bDlHeG9pTDlLN2w3UHg3YzVoM1dXb2gv?=
 =?utf-8?B?dWQxMytNdWJyZHAvYXE5Y21RS1huL1VwMmxqa0xOcTE4c1hNb2orWWR5M2dU?=
 =?utf-8?B?RHNUQnY2ZDVLV05Rd3dKc3dtbkNVRFBwNjQrUmQvdkkvOTh1Y2NPcUFicjJ5?=
 =?utf-8?B?bm1SMktqeGF1L1lvWnJKQTlDM3NXWXhybW1Uc3pYOXYxbDR1WFJjRk9IR1l5?=
 =?utf-8?B?REwxK2c0emxBZmZVODc1bnRhbUcrQTZlLzcwVVNZaCtvVWpjVEhQU1lJODli?=
 =?utf-8?B?M01BVk1scHdOSHl1dGljQnk1SGQwL1JiWDJEdHdWY2dnRS9vUnZyV1haejhr?=
 =?utf-8?B?OHVZR3RmMGorMEdsaVdIQ0x1SVhhQ2V1ektLTmR0TG5pQ3lCaVdWYWNBeUFK?=
 =?utf-8?B?RVR0cTJuS2RBZTFYbGlhQmlQY1VTTEdqZ0o2WU1iR3lUWXB6bGJCcXhXak4r?=
 =?utf-8?B?MXlLMDhjZHdqMUFhMzB0TE9EOXJTWnB2SFRVSXFJRXZpcS9DWmI2LzRvODlh?=
 =?utf-8?B?Ym1RaHIvUEFBWVQva1h3dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWE3Z25uYVBwc1dDNlNIWE1MaXN2MmpGcStRcGV1bGhORU9MYVk2UDRPWlJX?=
 =?utf-8?B?TkpiVTdCLzJHZkgrN0d5dXd0aXN6bVdlOE04cmQyMk10Y1JQOGZoS1FPRk9P?=
 =?utf-8?B?dG5iWnVkUjJxNDZiMDY0b2lLWkJ1OTMyMHlMS0J4R1c1cFNVVVQ1ciswS3BO?=
 =?utf-8?B?MUltREN6QlZhUlBjNHJiRVhZQTd5RGNBRGZ6bXdtN0lFbGNxVUpQZ1FlL0lq?=
 =?utf-8?B?dXdwcFIwSCtoSHl2bW5PWU5rRTNPN0dMejFPd2dBTDhBZU9iZ2RScE9Zd2ln?=
 =?utf-8?B?S1pEMUtVL1NlWGZtT0RkUXZLc2dNWXQ2enJLbFdYOVN4bERVM0VVVVFkem5m?=
 =?utf-8?B?OVdWZEMySy8zN1Z0ajdydjRZMkhWY0w2Q0hiR2FFREgxVXIwVklUR2o2dnF6?=
 =?utf-8?B?RHFFMjBvOUtST01Cb0plNG5MeURXS3dLUCt2ZGNydXZ2RjVwWVkwRmw3T1g5?=
 =?utf-8?B?bWdtV1ZzTHlnRTcweXNTVnpkTWluSjJiU3YvT3hPR2grdU40K1VQdnJQQi9F?=
 =?utf-8?B?V2RtWlN1L0g1TGE4Zkx1RGZ2NFlwTitHdUFLaW4wZVZQTHFYYVNDaURtNm5Q?=
 =?utf-8?B?NTl6dTM5UGgzcVAzWldMQVNhR1RTeW54S2lzUitIK2lUNlpmdDZBRExuVzRZ?=
 =?utf-8?B?S3c4cDJaOHpaWWJqYjJFOEtDc0RIVE1ML2NxbXpCbllEYzJEZjFtRC9TTi9m?=
 =?utf-8?B?YzU3Vm5JRWpZRGxOMXo2a2FsMWRBcTZpZ3JaNk1hdHN6VlNGZHFGUzNmZ0JH?=
 =?utf-8?B?TmlTSW1LY3dnKzZEZ1NzU3RqSkw5NnBkYllDQlc1VDdWY2VDVnBZK1c0Q1Bn?=
 =?utf-8?B?b25Ta0xuWEsrWFl3NzNSWkhwUnREb00rQ2JFSDhDSkdzZTFHTGFBeHdGNlpJ?=
 =?utf-8?B?MEpZaVFEa2ordjBrd0hTdEIrcjhtREo5NFlhYm1EMkFpbld4M0xTTitSc2VO?=
 =?utf-8?B?empoK0JUakwwclA2UU9MZlJmNHE5dHVMYmx4M2grRHVjYTk1eVhWa1JucFR0?=
 =?utf-8?B?ZkU1SGsxaHRuaEhWRkhaaS96ek8vaW5FdjI5Yk5HTGxMa29Cc0RnTVFKWmVG?=
 =?utf-8?B?VTNSQ3MveFg1WE5DVEgxWTNqbW96QjNlLzJSalJGbzRmVFJzd1FJckVBa2Vt?=
 =?utf-8?B?UDEwYTljZkNJRmxVYlQ1Q1B6U0tIYXZ3ZzZ1RXZrTmkvYUMzazcxM2d6bG9T?=
 =?utf-8?B?NExqYWt6RWRLSWZaNFhnOXFIRVNvaGxodSt6ak9tWXQvRy9admxsVGUwbVZG?=
 =?utf-8?B?aFZUZEhtWTJyTE1sUWxobFYwSnZkMnY4dkRRbXJoVWlPNzZKSHlHWXUrU1Fp?=
 =?utf-8?B?MU1vem1CRUpkNXhBcGdiMkY2NysyMng3czg5MjZxcnJtZW85My9tSjF3Yytt?=
 =?utf-8?B?NmZxTHVNd2F3RTQ2QzhzdTFXTlBCWFVCYjVwSW1MUHNDMnRiaFhoS1dRdmlG?=
 =?utf-8?B?WHpJSGQ4WStLUmlNOFhsYUduM2prV0RqUEJnN1lCMmZQK3hSMTlEQmY3TWV5?=
 =?utf-8?B?VktYVTZhdFR2SVJhcUxPYStqVnBkWmt1aFVuYStGdVdDSUNrM0wyMlJETGRZ?=
 =?utf-8?B?UmFhRzlmcTExckJUVVlQbFlaRmZ4Sll5RjhmeFBxTy9xbnRWUDRmejZDdTl4?=
 =?utf-8?B?RWEyaEtSNWZsYzloVlZ3eHNGOHRJek5Qbml5QkorbFh5NUEvcEQ0emRjL1R1?=
 =?utf-8?B?dmhKb053SDhaZGpVQWx3VlRXL2ZxY0ZRR0xHRnVncXN6NmMxNy9xd25oZ1RI?=
 =?utf-8?B?UWNxbHlycFNnRUZrWGM2cjFZcGU4Q1NHRmR1MHJXUUF2anUrRVBzeUM0YUx6?=
 =?utf-8?B?Z2oyakUzUndObzFZRTNWMmlUczJGM1lCQU5RTFRaR1EwdzY4NnZhK0N4ZnEr?=
 =?utf-8?B?REdiMzN4K3hoTnhjbHNYaW96c3B0eXpYY2FZTUFJNldRcWlOemE1ekllYU5a?=
 =?utf-8?B?UElRUWRTQkZLRWxlUXhjWFg5N3g0UXN0MWZkcVVWR09QNFl2ZmVTS2hOWnpL?=
 =?utf-8?B?N3lhY0tIQXRSQUJ4a0p2TFZ5dSs3czd2KytKUDFUMmp4YUZSMm56WEVhd1l5?=
 =?utf-8?B?Q01acVNpaW9vQkZZN28xYVNWdzNDM0hqNGNidHhSc2JHUVA0NWhCczdHR0k5?=
 =?utf-8?Q?yd60zrdLUAY6nn1NXBWqMq5jc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700d1bd8-e2b0-4ccd-b5f6-08dd5fa2ef69
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:12:36.6021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/Rvuz1aL/ug/TCtyMf1T99A0+WiNyzqMENZMROLzOmsDjgbLNlOXGhHIG6mRZy3YlEcyWNsbXT4FQ61lej3bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10757
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

On 03/07/2025, Luca Ceresoli wrote:
> Hello Liu,

Hello Luca,

> 
> thanks for your reviews.
> 
> On Fri, 7 Mar 2025 14:33:37 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 03/07/2025, Luca Ceresoli wrote:
>>> This warning notifies a clock was set to an inaccurate value. Modify the
>>> string to also show the clock name.
>>>
>>> While doing that also rewrap the entire function call.
>>>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> ---
>>>  drivers/gpu/drm/bridge/fsl-ldb.c | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> index 0fc8a14fd80062248a43b8b93272101a7ca6158a..c7c899a9644bb827845fb3fe96a9695d79a91474 100644
>>> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>> @@ -181,9 +181,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>>>  
>>>  	configured_link_freq = clk_get_rate(fsl_ldb->clk);
>>>  	if (configured_link_freq != requested_link_freq)
>>> -		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
>>> -			 configured_link_freq,
>>> -			 requested_link_freq);
>>> +		dev_warn(fsl_ldb->dev,
>>> +			 "Configured %pC clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
>>> +			 fsl_ldb->clk, configured_link_freq, requested_link_freq);  
>>
>> Though this slightly changes the warning message userspace sees, I guess it is
>> acceptable.
>>
>> Does it make sense to s/%pC/%pCn/ so that the clock name is printed in lower
>> case instead of upper case, since it seems that all i.MX specific clock names
>> are in lower case?
> 
> %pC and %pCn print the same string, as I just discovered at
> https://elixir.bootlin.com/linux/v6.14-rc5/source/lib/vsprintf.c#L1972

Ack.

> 
> I've pondering for a moment about whether we should document %pC and
> %pCn produce the same output or rather %pCn. I decided to try the
> latter and just sent a patch to do it [0].
> 
> FYI in my case the printed value is (with both %pC and %pCn)
> "32ec0000.blk-ctrl:bridge@5c".

This is the LDB device name. The i.MX8MP LDB clock name is "media_ldb_root_clk".

Acked-by: Liu Ying <victor.liu@nxp.com>

> 
> [0] https://lore.kernel.org/20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com
> 
> Luca
> 

-- 
Regards,
Liu Ying
