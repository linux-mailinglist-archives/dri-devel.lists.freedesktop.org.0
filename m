Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC2B947C3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4A410E568;
	Tue, 23 Sep 2025 06:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LSgwhpgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010024.outbound.protection.outlook.com [52.101.84.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23F10E565
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 06:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsRaeSQ4A3k/f2Pt5W8pMaPsx6GyPa8pcp7Mstq/sSfKMJn/N/5yVeQyUGrfZvDOcPMzscag6GrK7fPSUBQ4JHFjGea3ukURO2v/9gSalewajWiAC06TichpmYd9ynnj/frbhoR+RriIJRPaYtzMP2dVOb809EdVDrFfk/CSpRc8KxJhUnxJs+tm2KAJ9nSd2WAvXUWCy2v4fPuIrbvyl8co8T0TYOE8bq4OA4GC9SoEx0JVpz9aKE1Elrbt+1TEIG/112jGrr1cu3cO+ukVl8SjsyEm2jmFy3DDgk2xE8knEZ8qntMG3Fwj0cBBrGjwcYh2Z0ylTQQ9q68lfIzOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIiFKLyHa/CftUHjEk06VPKBwFSd7oClJgPH7SdLhns=;
 b=prp/ekf2UirXck3vI4iI26iRw3sP7RqOsR68TyGIuvFZ/Agir5lclEH4NIqg0ziYQN6R9I5Tcr4G8xZnx6uYtN+hfSEUQVB/LtvvYaAP55KCvC1Ehxurc/K/lLPmHCpU9HtMu/li2/moYQWrFH7yX0yYFrw9fUqLluejYgT+tM7LdPQGQCO12T1aNw1GT9kacbPXRIoD1a8pEw1YgvTh3xgAZwzggMk0FFJDAX5ABWR1L4Iw2DXhXgdGFfOoLgfhxneKrlKdBC5m8jeU8tyiuLj2w6BXWd52cT6XZ56+DbDYw7JC/PhpN8h8dSY+JolAd+WXNOQMUiere0g2kAPS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIiFKLyHa/CftUHjEk06VPKBwFSd7oClJgPH7SdLhns=;
 b=LSgwhpgcUytrrBMiVRAsgr3N3cTRIWgqiTOGZh3hGKvTlRG+FV3RVYRzZax+RHQTo/1JEGqoTU/zl3jHyz/PHPWKcMEaGuCMxIepr65+vwyjum15d7uIxTs01x6uEIueuggdXjwaTrlbuwKLbZnTscLe9UAoirE+hy/yVOWyhwN3LoJODID9PJOuNt5EHRD+gSlXG3qpLFx+druP4jCjHAJtVLf7Xeo+KGnYGczzrR5hKHbX6Fuh0rHGrg07aHksh0Gg9BEWqZH1obd6sa2brf1dxjHYs+Cjs+fr0ayX/QoG4bn+c1ow+A0SHagK7ygz9FA29mMfczhelM5U2apJQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:59:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:59:58 +0000
Message-ID: <b411c188-b564-4ae8-9186-d0877880fa99@nxp.com>
Date: Tue, 23 Sep 2025 14:01:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9688:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c319527-0982-441c-9859-08ddfa666d4b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THhURWErTnR1ZTJ6NDN0RnMzZ0EycExFMFErYWlKMU9hQ0tHZ2JaaFJnbUhL?=
 =?utf-8?B?L1hvY082ZURlZGpDZi91NEYyT0poOHFJQnZadEQycmNuRjVUbHFreXJEL0pF?=
 =?utf-8?B?Nk92QnpnNVZGTEFvM0gycTJhZWtnUDlETVNCU0l6dmkvVTFIWVYyeHFkSjFM?=
 =?utf-8?B?aHlsZkVhS2tIWUhkeitQb2tRblFNTFhwaWUyeFV2L0Q4Q3daMlhlUlVUSTlk?=
 =?utf-8?B?aHJoSGhXN2hPY3lFMTJYMnBLakdyS0JSc1hqK2s4OSt4M2hHb1hKcWM4V1I1?=
 =?utf-8?B?YjdnVThkellNTGxoTkFuZVFHLytNZlRQMFBPL2Z3NE95Tk5sbHVsazBYUFpL?=
 =?utf-8?B?UkY0Z0NOd0pNSExqb3hxWU52T3V4cVU3UFZ4RnpGZ0M5bmhVQjUwM3NHQUJp?=
 =?utf-8?B?Vlh2Nm4ybm9RZkdmR1BLdWErOCtlV0hHQXJQOGdOSjN4RDJ3K1lWZDdwc3g0?=
 =?utf-8?B?cDFXMVpVd0J0WEhITnp3L2o5S2t6N2F6R1loaHVXZzI3SXJxdVNkMGZZK1A4?=
 =?utf-8?B?YThJcWNHMlZNYW9idkdFNjY1VllldGhUZ08xekdvSlZmRCs3ZzZDN1hvd1lP?=
 =?utf-8?B?b0NudDhiS0FNbllBdnB2NU5IU01TQ2pGcEM2T0liOVl0V0ZIbUFwTVk2RGFB?=
 =?utf-8?B?dmdEOVBaaXREeWxaTHJZYm1HcUh5Y2hMUlZ1Y2todUNwUGRGdEFDb1BYdTVn?=
 =?utf-8?B?S2xRNnhJKzR3dVVnaHVWVU9rMEJ6bUk1clprUHVFK1NXeExuRlN0N1VqUTY1?=
 =?utf-8?B?MGIrY1AxMjJyK3JtazNoa0pxTDZGTkJEZzVrT1RaY2RoUHA2aHltTUJBSU9R?=
 =?utf-8?B?OGNjc2swZ2g2bngrTGhIaXNJWVg4RmFGUkV0YzJYNXdydUR3VTc2ZFNpeFJH?=
 =?utf-8?B?WWM0SnhSSUlFdGxjcDZvZUZIdXJqd0MvV1JYWmh4VWhIWG5yK3U5clJlMkxH?=
 =?utf-8?B?MkRHeWp5MEFqYzNQZ1B4cUNieVNTaW5XN29aalBTalR6ZFVxd2s4QVBsWkZF?=
 =?utf-8?B?dHFTSXVmK0FORlNnVGFrNGx5dHBmY2RENDM3ZXJ3VmpLaUlNUTlaL0JzbC9r?=
 =?utf-8?B?Z3hjWThkWU4wVjNxRllDRE4wZWNPZk5vNUx1UWYwRmJJTHE5SHNXdXd5SnhK?=
 =?utf-8?B?cklnRlpPUys0aGZJOUZBV2Mxc1o2Ni9XQXJXaVNBNnd1QURCdmxtbFUrM3hq?=
 =?utf-8?B?MW1ycmxScDd4S0N4c0U0ZkF3TG0ybE9CNXpJR3g0RFlselFTODBpQm9GbXhZ?=
 =?utf-8?B?MGtBTTJRUGxlZmNpRERpN1dReTk4ZXlTQmVIaUYyOUNlTTgzNG9hclB0YXlZ?=
 =?utf-8?B?WW1vaUgyWVRQWW1IYnJWaWNMZlliM0tBczRxZ3dqNnl3KzhmZGo3ckZPaGxF?=
 =?utf-8?B?OTVwb1FERXk3a0dRcitMeUpKMlg0MmRNLzc1eW9tZlBYeW9Ia21STVpqblVm?=
 =?utf-8?B?NytTazJVQ0tqZGZxcmhXZ2k2dk50dzlXRUpXQmZCUi9FWFh6VWtBb3lncHhO?=
 =?utf-8?B?b3Z6eGVKMUFuS2R1Vi96ZW13T1d5b1U1WTUvZmlWb1VEMmk0MkhyTFY4aDhn?=
 =?utf-8?B?Q211UDBqM3ErK1E0MWhhbHo1cWNiZVRQTHJkSi82TFRoMFVJVWV1bC84WHdF?=
 =?utf-8?B?bmFzSlkvNlRoSzhkMEdEd2pBdjdER0toSDRkK3BNSHNtZzRCa3lodXpBSEov?=
 =?utf-8?B?OERmNHhYNUtkK1ZXc0lpOGhtSzFaWDR1ZlJ0eVJtQm0wNzdaSnFCUndBNjlZ?=
 =?utf-8?B?dkZoZTZIY2xpMHNZQjJxYnZoOFJUTUcvbTArTXpoN2Q2Wkp4SnpDMmNsTVZY?=
 =?utf-8?B?UmVEWHhiOHJzSWQyN2RTVGp4Y05OaG1pUzNKU2FlZjR0eUVPcmJtRjNvQklz?=
 =?utf-8?B?L0sxQjdpOEU3QVIrL1hPMTZCZEovUHA1UWpvaDNVeWJMYk5acDZhaTVXcDVJ?=
 =?utf-8?B?OXZ5RkEvK0tVemo3QmpDRi9ONHFURVE3RWZtSjNPSWl5NGxJclU2WmxQOSs5?=
 =?utf-8?B?dCt2bEtpT2dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0wxb0g4UTV1dGVCTnZsYXYvMXdLSnFJY0hTTjZFNG94ZUlKQlc2NytTeWpG?=
 =?utf-8?B?V25aMkpDQjRTME9kcmsyUW9zdTk2bFp4UjczL1FqWEczSHAzL2RyZmdVSnBs?=
 =?utf-8?B?OGhZdzNWTmVUdWFsbkJqcFB4V05uTlZyNnpzSm5DcXk4TU5JWCtBSk9VcWNO?=
 =?utf-8?B?OVNYWDN3UkJGZE15bVFhM1MrZ3BuTjNoODIxNGhZUGNHZnVCSklDeUpYZTBM?=
 =?utf-8?B?Ykl1bldkc3lqdFJWeTNrTXYxOG9teXdHaTM2U0FwT2E5MmZhTzFTUlpjVkdW?=
 =?utf-8?B?ZzRrbWltU2dnbHZaTExwTFN6emxKWjFMdDAyYkRCRjdhbHBPcVFxb3cwSlNW?=
 =?utf-8?B?L1QrTVVmVXoveXlSb09BeHVtdHNqZWVTMEtQdVBMSXp0aThNVDVUYzJja1hr?=
 =?utf-8?B?R1QxN0lTTHd3dkdTejByVUM1WkIrTzVDNXhKNklRUXg1V2FFeWVIdEpMbjFG?=
 =?utf-8?B?ZmVtWnBKSktPa2JXYjBsZ2k0Y0FtYjFNcTdraUFkUUZIYUhkdXRKMFVUSFZQ?=
 =?utf-8?B?Q1lUc1dVM1JHTW5lUFhqWkU5UFlSWHdvQTdseXlPeGdxN0hFTnh2RUdNQnYy?=
 =?utf-8?B?WVR0NkN6c0hGWlRLa2pLcjREMnZMaGRIZDBLcTN4MzdQejdVbVFaRDFLeVA3?=
 =?utf-8?B?bGtWay9rQm1aL0MwemRCNXFSZmI3d0xlbHc1TVhEL0IwNWFSbmZYTGMxR0xX?=
 =?utf-8?B?akZYaFlJanREQ3Y3ZVUyN0tPTmN5V29FU3JIR0RBR3VCYzRmMGJDRE1BdXVV?=
 =?utf-8?B?aFV1R1c5SVlVb1BJU3Q0dU55dzFyT0dCS3hGT0o1RmF0dWZFZXoxK2FoYUh3?=
 =?utf-8?B?T0ZtL0NEOGVZd25GTno2c29maWdCTC96bDFwc2NHeVpzRWZEL0o5L2JQeG5Q?=
 =?utf-8?B?bjg3Q01UQnZjSkdGRGRjTUMrU0dmRTR3bXJ6emlYV1NMQlhpN1ZYbHErWFJW?=
 =?utf-8?B?amJQU2t0V0hISWtNVmpqTmdyQzRYRG9kTk1zSHVQdUVrSUhXNDQ2RXFmVWJE?=
 =?utf-8?B?V2pvd1lNN0I4bkpyQ3Bxa01sQ1pCeVdJQVVzbEFtWnNJTTM3cCt6WDFWTHU5?=
 =?utf-8?B?MDJJeUZjQUh6RmhXenZnZzV2WEUwK3c4QUVacEt3cHU0eVVXTlRjakdCVWto?=
 =?utf-8?B?TjFjbTc0TE4zT0JqTmU2WVYvenhDS3o5a1B3MldnTlAxU0JyaW1TVktkVWNy?=
 =?utf-8?B?OE01N205SE41aDdHcFlkK3VRb2xBNUNHQjczRVRoTy9XaG1QYnFpVGkwbkl2?=
 =?utf-8?B?MGY3L0REL2JnYWQ4a3lIZWF4ZDVvMFFWMmgrMDdBNEdaTnRNNGRFbzNlUVVS?=
 =?utf-8?B?R0hTUnJrdzc4blJxOGRLODJLZW1xUUdzSUlpZ0k3cHRCaTNta3JjSDZ3S1Bt?=
 =?utf-8?B?VTlteVBTdHVobFNLY081UTk3SnVjQzJjc1k3T25vNWJKUTBCQWg3UEE2amZD?=
 =?utf-8?B?S3FkLzVPaWVkZGhnamZlWVVTS21WK2oyMnhHMzNPMFFoc0J2RnBJNkdGL0do?=
 =?utf-8?B?bnFQNWZMeHhnc0VjaE5pbStCNzJKc29zNXRmTDRMbllmOFpOampPSU12TEVn?=
 =?utf-8?B?N2p2b2JrMjlxYzVPQ2xPOXpVendjdnlQMXV4VkdTYUtKMEJMU0c3dVhXb3FD?=
 =?utf-8?B?NitBVHdVWVA5bURUNk9GYmdOZGZTRXJURnVxb0psaTd3TGgwZWZNSjNLMHdU?=
 =?utf-8?B?M2kybGk1akJMeGF2OTJQaGJHUnJ1Y1hkbWZhbytWcDhPYndPVHRxYVJDVTAz?=
 =?utf-8?B?QUtQbTdDZWNkUDJ3RndqODRtZURiOWVwczNaTUZBMkx1UHlacDk3eUQ4WjNy?=
 =?utf-8?B?ZTdkNndVMDhOVkpYRjJVYUd3Y3FuK2Z6MC82TWllNkhSSnZLUGU1SU1BemV5?=
 =?utf-8?B?MkcxdEhxNllBeU1ST285amVhSG40R3dhNkYzaEFuenVwS0FXbUNheEROMEFP?=
 =?utf-8?B?MGhlQUU0aGRRLytzVUlOKzJvQnJ3aUM3NURRcXJlWTlIUzdaNk1zaTRoZmNL?=
 =?utf-8?B?WVhPVUEvc2wvdjFZWkhSaW00L1JYcHhhZEZTWFEvNW4xN1lJdHpKUVBMcXEy?=
 =?utf-8?B?aDlyWElrcVczSElVOUdoZ3owKzY4TUVtWmZFdGd3ZlFwdGxoU1RqRmFJRWsy?=
 =?utf-8?Q?nz6glRXQobgMFevUEXgTtflCj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c319527-0982-441c-9859-08ddfa666d4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:59:58.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5g6DqkLSKupflbCVg9L/FR4cI2CRxEZWHxksBwnsbiuYEZNncBihvGe+5sh7Pvy2BPeo9JfDrqQzo/rd+3yHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
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

On 09/23/2025, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> 
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.
> 
> changes in v7:
> - add back the mutex which removed in v6
> - add Tested-by tag from Alexander.
> 
> changes in v6:
> - remove mutex in dw_hdmi_set_sample_iec958()
> 
> changes in v5:
> - add empty line commit message for patch 7
> - remove blank line in dts node
> - add component_unbind_all when dw_hdmi_probe return error
> 
> changes in v4:
> - separate dts for soc and board
> - bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
> - add "select DRM_DW_HDMI" to fix build error reported by test robot
> - remove unnecessary code/definition in pai driver
> 
> changes in v3:
> - add space and 'U' in asoundef.h
> - add more commit message for binding doc commit
> - add bitfield.h header for fixing build error
> 
> changes in v2:
> - address some comments on commit messages
> - add two more commits:
>   add definitions for the bits in IEC958 subframe
>   add API dw_hdmi_set_sample_iec958() for iec958 format
> - use component helper in hdmi_pai and hdmi_tx driver
> - use regmap in hdmi_pai driver.
> - add clocks in binding doc
> 
> Shengjiu Wang (7):
>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>   ALSA: Add definitions for the bits in IEC958 subframe
>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
>     format
>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
>   arm64: dts: imx8mp-evk: enable hdmi_pai device

Jaroslav, Takashi, do you think it's ok to land patch 2 through drm-misc,
as that patch touches include/sound/asoundef.h?

DRM maintainers, if you think only my A-b tags on patch 3&4 is not sufficient,
please comment.

If no objections, I'm going to push patch 1-5 to drm-misc-next early next
week.

> 
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  include/sound/asoundef.h                      |   9 +
>  12 files changed, 382 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> 


-- 
Regards,
Liu Ying
