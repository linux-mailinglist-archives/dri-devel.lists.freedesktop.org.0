Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5842396D0BB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44A10E739;
	Thu,  5 Sep 2024 07:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="nSiDksCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2103.outbound.protection.outlook.com [40.107.105.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089F510E739
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k76T1B1m38lHU+TwD5FMAWXywkHA52joY3GYhgQcwlmzk+pmHVCbdClki7X+sb5pxb5L2/SKzsxmgHJN2vxnc4Y0EKHXkozi9eeyTMSQdZF9zuMBFLr6AvyVrpcxiOJ8mn8Cjgqxo77v7wEomYo8xTj5ByO3mhQafBSttukeHKdP3jl+/Evtluiv4J6f4IdFzTt7Fq+xzGKdH3lwL8vtTZIgCLAGyCSDLmMTpX+vhi5Avzh5yfUKiGTe/rnYFSZO6fNEfz3kjzBgu5pPt5SctMN6oxrPlXjULqKBTnDy7ZFOJ9OSh9UTEpMUntHR6dC1VH/zSb2NWB+k0XC+eNKmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp5CLmJt2DD78ZhTxMknelJl6lCuVRveNLYV8/hLra0=;
 b=n6xuJD/iwMoV+xJpKQnDZ6lNLZbi0RX3dPB/0V18hnU0+XUWwBO3oKVZkt3wFT3Gx4L91oaP6am+3LjIwGotCz02o9cjvGbRM5Iy41zajcsfz8hz2SiuT3GORgQhR6FKoyxL5rMQYA1mHxM3Yq+aaIbtgv1cGjzsjF5Jfas8h3qMcpT6cgwp+J6zCDvqZDTQ3ZWZEsOd3X2lZxijMZikIwpsQKZTx0/lNz0fGAq09XxmQHOw0E653WXHsrUklCoukcc7NKAwfl1gQPiwqYaio8mXDf9+4XH7Uw8DVqrqNx3dvXyAshf3Wy6o/R5VteIK3H1rChA51UupIO3GeTMhBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp5CLmJt2DD78ZhTxMknelJl6lCuVRveNLYV8/hLra0=;
 b=nSiDksCoJlNN8rYTPb+ud0k9vzOMEpV8R55yawlRBVAnsykS1AYe6pq/tUXUxI3XZbtf8Z9n/37ufFOPIHLm456+x4wRZT13Wz+Glo0ixAq5VAN54IrgfHV/vN//1iEsTuT9Y3BwRdPBVXaQSgsVabDUy74ANuXrYoRElWQgwJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS4PR10MB5720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 07:49:27 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 07:49:27 +0000
Message-ID: <0a8f6921-5b46-4edb-ba96-dee61f4969a6@kontron.de>
Date: Thu, 5 Sep 2024 09:49:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
To: Dominique Martinet <dominique.martinet@atmark-techno.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0416.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS4PR10MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b48a24f-8a0f-4aa5-d2ff-08dccd7f4436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clpWRmxhR3RrenpkU0k4QXBEbFlXOXJzQWpXZ20zek9HUzZiNjcyYzl1T0xa?=
 =?utf-8?B?ano4TjRKcmJzWVJZTjRtOUpPQ3AvcXJRWmtNWnFQMC9MaGdXOG9UR05HMjdM?=
 =?utf-8?B?ektkMTZJUTV5eTROb1docHpyTTJITmMrVkRwb3lSOUhqQUFCT0o5aEJDWmVD?=
 =?utf-8?B?aG9qUnhhTWZmckI4eGp2aXhqVTJFVEVqU0tNd3RFL3E1aTNwVUFkUFp1aXdO?=
 =?utf-8?B?M3o2QWhkWmZ1OHhCWDZFQlBXK2h5ZUp2OHFiVk9jL09ITVRBbWpVSmF5azBB?=
 =?utf-8?B?THl0czB2WW9uSnl2MTJ4RFk4QjR2TkhaZ0VMNW9xeC9hREpUeUNFZk9kRWZK?=
 =?utf-8?B?L0dmZm52aFBYNWtBd0RNcWNkMDk2YjdCdUtGTlYxMVJUcHNpZzN6MW1wRUpy?=
 =?utf-8?B?TGE0WE5mUVNmYmFRQ0JIT1VsTTZpb1F3akE1ZndZbEIwMjE3SFVBdytaSFRH?=
 =?utf-8?B?OW9MUTlYa3JWdzN3WlhRQ0c0L0VpQjFtUGM5N2NZb1BBMkQyRXJ3dXYxdStD?=
 =?utf-8?B?MTR4TmdzYXhERFZIaUFGT1ZpQkVWVGN5RjZDdU1LYktMTFZuNzZvbmJXU1Ft?=
 =?utf-8?B?YUdxZVlvNlo3cjZjTTNQQWtwV2ZYL0IrUllLdmZpcmxrcnBFNWFmZHkxaElh?=
 =?utf-8?B?MU1ma1NidTdkSzJWcFpNZ2JEbEZpSUlQKzNOQ3d0VzduQTBSOUJ0WEsrV1NT?=
 =?utf-8?B?TzJ2UTF1b2F6a3hnbVZMQmMzVXYvbHlZYjBybkNQQjhWSFB3UUNXeFkveVpP?=
 =?utf-8?B?R0hreW1XTjdPWC9FTUkrTkljMmVoNGs3RXFUVnJsU1dVT1FLUzhEVUlmamVa?=
 =?utf-8?B?aDlKZFhkZmhvMVVEN0locCtxL25hbUNmbDBnZVVxZXkrTjdXejJnMW1mZCtP?=
 =?utf-8?B?dFEzZEFQaUVpWm5vdlJNNi9LdzFvcW1Va3E4b1laR1lmZ0RoNGtqaXJUa3N2?=
 =?utf-8?B?MTNCSzhZWVpMZVZUUE8xU1kwbExvTkEzTW5pdGQwYTlaOVhjbmd5R0cyTk5X?=
 =?utf-8?B?M2J2L3cyZHlFUFRPZ3oxTWlNaEdSckNObW02UzlwY1YxODVXK0U1RnVlb2xo?=
 =?utf-8?B?MzBHRXlSeStrU0JXVy9GWkxTVzI2dExtc3dqUXE1blZveFFxS2RzZG0rVUFa?=
 =?utf-8?B?SmhWa3lIQ2hHK003bnhiWmZaeC9vSTljNjJHYjFXdUhhdnB4cTRqaDBCTmUr?=
 =?utf-8?B?Uy95bTgzVDYrMXRCclFSdDJyTXowSkMyWjdEN004TEdJR2FyaWNGZDBQaHhl?=
 =?utf-8?B?UHZISmRXVGJYanFmZ2tGWUZaZWU4L0dIKzhzcjNDVkt4NnpYZ1NDdVVHcTA1?=
 =?utf-8?B?WHFRU3RhRVFkalQ4ZWtnVmVmNU1UTGphOEpXRlpnUjQ1bUNWK3pHd1UxSHVZ?=
 =?utf-8?B?K05IU1k5RC9SQm4wMTZaY1hmd211R0xGZEw2QmNORXNiaUsrS2R3c1lsUVp0?=
 =?utf-8?B?V293SlNmZHorY2xyN3ZiZ2s4SWJlQ0Zib3ZtSnpTanVDSWpaQUxoOHllTHNa?=
 =?utf-8?B?NXVxMVlyUmszam96TTRreStadWcySG1aMGhGUnVuSlNxWFlQOHBGd0ZHTlNE?=
 =?utf-8?B?VHBRMzFScFRyWk01QjU5c2V6M212U0FkL3VtK3lENlZHSjA2NWo1OWZhZS9j?=
 =?utf-8?B?dTI1WDhIcXh2MEZnN1pXNkRqVEJwSDBSMDRQbEV5OEE5dEV5OUNkbFFKVjVV?=
 =?utf-8?B?TGVaaElFR3huM29MK2xqdUlsSWFYc1p5YktYRFROVVp3aUZqMG5rNk9UYUEy?=
 =?utf-8?B?NERmSVNIdzhRcGlYS1VWOUM3MVAybEhmY1NjZHY4bUJ3cUl3VlB4aGZpeWEw?=
 =?utf-8?B?eXJJQmg1aWdZL3N5cTNmaFdkOHdhU3A1THR4R1FQTWNvQjBvM01OaDFzU3ZK?=
 =?utf-8?B?ZzlmQVlVOVpWM1FQY3Q3K0thVXBJaG8vOEUyQ2dBODFLRnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWJqTjhGckhhNkVaWjR0R2lmbmgvUVlOZm4wTFRrNHpKZEZ3Z0ZIZUt0a3k5?=
 =?utf-8?B?MGV2eURkbUYvaHlXWWdVbDJuNEJjUTNSWko4dUVrQ0NaVkpTa0IxUDd4SkNC?=
 =?utf-8?B?MTFYU09hTnhYWnQrTFVSelA1bUh3dU5sdkZSeVliamNEbWp4ZkVSSUQ0VjlK?=
 =?utf-8?B?UDZUVkdQaHRyYXNXd2ZWT1o4SmlPQW5Xai9qdHZIR1JyZHJJNXErRUdubFhi?=
 =?utf-8?B?Q1FtcURUTEVwU29jVTZSc3A4aXRYTkovT1I3NkxJeUsyVGF6MDc2c2cwbUE4?=
 =?utf-8?B?QXlLejJEQ0VxNGpmNWhTazh1QTVFaXpkSFJVRWlGL1RKaUVacmI2NXhpOVE4?=
 =?utf-8?B?RTNGVUlkUHZ1WldDRlFMM1NaMDY3YmNoekp0anJaUERlSENYKzFrditscGpK?=
 =?utf-8?B?NkdTRUpBOTVpUU5vVEhtT2FGazFOZlN5UXI1TGtZbHI2bVVyamZ3M0I5VitG?=
 =?utf-8?B?ZjQ5NlQzeUZYRHZ0N3lhcnlLR2x6UUh6MCtNQ083ZCtlZkRJNXQzc2tMSE1x?=
 =?utf-8?B?b0VYWE5DRlpJMkZvZW95eGxBait3ZXRaSUZkWk1McDVCQy9xYWlEV2daT0R0?=
 =?utf-8?B?MFdpRDkvRUxFaFRwbTV6K0lMQkNtUHBCZnJnUEFLbmc3aWVjd1dadFZZS0FC?=
 =?utf-8?B?VjV0QXRvMFJMRHlPRjNkYTNhcTFFbHBGb1pRUnFqVXNDN1NkN28zVENMVnRO?=
 =?utf-8?B?RHo4MEd0Vi84blB6U08rSGgvVWhqZlNVM3JnUEY2N0M4SWU2NGlZQWl4Wnli?=
 =?utf-8?B?NE1GS1dHT01LcHE2Vk9rcFJoN2FQOW1YU0Y4N3hDRjVkcjBxV2VFbU1JWGtV?=
 =?utf-8?B?VFdBUnZKOExLYk1NS1JXeFM1b0UxS0Z5UnBxRXNYaC9yNnhSWkZwaU5JS2pz?=
 =?utf-8?B?ZnhKNzZIWkZUbDI0YnRieWYrc2VvaENQWGZLdTBLeHE5d3VWMnRsbkVXd1RH?=
 =?utf-8?B?WVF0VXlOeUROcGFGdUhGbHZVSE9zWWpjdTJHRTliMzhwT0oxcHd4OFM4bjc0?=
 =?utf-8?B?a0dXbWd0WHBwdHZaWk1sdU84RzJXN3IycEw4a1hrd0xVWkhsaXdPdXJ2eTJN?=
 =?utf-8?B?dnU4L3pHdlcwc3J1VWltM0pKZkgraTVJQ0JZa2dINUFzUE9XMGRtR0VDSUJW?=
 =?utf-8?B?b0Y1aUkweFZWZEF6YURxcjA4UkZ0cFdybG9CbmNxcjBuWmFKcjlKUlhTcWF2?=
 =?utf-8?B?aDAxQjJYK25pd05vWnVQTG93SEtkeDB1bmVsTDJsUEJqd2tlZmJjc2hhYzRh?=
 =?utf-8?B?S3V5aTN1WFF4RUpLU010ZE1CRWF2Y08rK0dmK2RyZEFkbm1uekdDRE1CRkZM?=
 =?utf-8?B?dXN4QisveFJIZzhrNnVMTXZ1cnduelQzSzNwTWlDWkV0d2RhV2FlODM4azRh?=
 =?utf-8?B?TS9zQVR4Tk9PcEZFVnNzQU9WVGg0UlhQbEtyek1wTytqd3ltL2NvcmgybGYx?=
 =?utf-8?B?UUZHdklJTllFU0hORkhvbG9nbHlpR2dlNFRrZnNqcjV5ZkQ2QW1OclF0aDJl?=
 =?utf-8?B?d1ZmNlNGbUIwelNBeFhLUWkwWTB2bEoySUduUGF0Wk9TOURaK2FBRUErSndQ?=
 =?utf-8?B?NXRwdXVZZEZNQTRibC9vMis1YUZMTlZ1Sit2eGZzUEd0KzlSMWh0bXZhcVNq?=
 =?utf-8?B?T09UZWtJTkt2dmpZMWxYRWJEL1g3d20raDNBdVUxVHVWUkc5OW1MRUt0L2pC?=
 =?utf-8?B?U1NYM2ZMTWljMFJ6SWVvczFKNnNyOEllY0lzOWlWRDIyTHdqSTZKZ1Q4Kys2?=
 =?utf-8?B?TUtQWGd5WC81dzJ6ZUc1c0cxZmFnSzZNZFhxZ0oxOG9jZmpBOTNkdjhRcVRO?=
 =?utf-8?B?dzBISElrQ09SMUtta1k3QnJKR2FkOVJNdUxNOG90RDhCZ3ArTjZoN0hKdUs2?=
 =?utf-8?B?WkZqUmxjS0Y5cmdPUUdwNS9zUE5rU3lwK2dvcXJIdXkvWjY5VHVmUGFMd0lD?=
 =?utf-8?B?YzRRNk9ubmJjWUxFS1luSmhpSGF2cWh3blJEK3p1WVJMaTFXQVNGdG5ZZm5W?=
 =?utf-8?B?dUZMYWVRcG1HZU8wbFpMaVN2TEJ4TDc3L3hxazFCQmFEKzh0VEk5aEdLekdB?=
 =?utf-8?B?TzkrK3lOVlpFUW5nd0Y1NjNKekorZjFCcVRqeUlrYmhueTI4a1dxNjI4KzQx?=
 =?utf-8?B?RmFvbmMzWUd6Z2lGWXlBaU5JQ3hCcVBWYm9CUndDMXdhTDhqOTR0MDdCUnln?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b48a24f-8a0f-4aa5-d2ff-08dccd7f4436
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 07:49:27.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHHS8V0d56B/Cb2E5HSHjSnIsUM3vosaGyHX4btFIZvZFzXcDBT3PSmyoT+RvDI5np2Lkex7Wm/fQAOiO4uN+5uRJ2q52ScjRdYv9/6sI6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5720
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

On 04.09.24 10:31 AM, Dominique Martinet wrote:
> This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
> cannot output the exact frequency, enabling the imx8mp HDMI output to
> support more modes
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
> This completes the patch series sent by Adam Ford here:
> https://lkml.kernel.org/r/20240904023310.163371-1-aford173@gmail.com
> 
> and makes the cheap screens we recommend work with our imx8mp board
> without further kludging.
> 
> 
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 13bc570c5473..9431cd5e06c3 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
>  		       const struct drm_display_mode *mode)
>  {
>  	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
> +	long round_rate;
>  
>  	if (mode->clock < 13500)
>  		return MODE_CLOCK_LOW;
> @@ -30,8 +31,9 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
>  	if (mode->clock > 297000)
>  		return MODE_CLOCK_HIGH;
>  
> -	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
> -	    mode->clock * 1000)
> +	round_rate = clk_round_rate(hdmi->pixclk, mode->clock * 1000);
> +	/* accept 0.5% = 1/200 = 5/1000 tolerance */
> +	if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
>  		return MODE_CLOCK_RANGE;
>  
>  	/* We don't support double-clocked and Interlaced modes */
