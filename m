Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5267C11AFA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3E10E568;
	Mon, 27 Oct 2025 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="T+/KRzxr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="T+/KRzxr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020130.outbound.protection.outlook.com
 [52.101.84.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0290310E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:46 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dxaMHja5VlZ5AUubtFBKDVjydK3afyIerTeOdRGHBZXYXFdYqMQVHiGiQASKCOlQQ1+BjcHleYh6+/kaj50mT3Hbh1+8fdjgO8F3i+SHehf+MwnFruDhtI6cNJKOoT2Mq/r49x2i99BiEa5OlHxagYg2XU2qQe2Q91R9qikrHmRNYKlMyFulTOADAet/50bxTmR8pwD8i6OheNMcbQrz7daw85yXPeiGyE5GJ4RnaVun1lMK5RhndUEUKidGtAZUm1m3PRCjVfTwpnwhqvjeLcFO8RvFcwsvBNugosBKdkvuPxI39VNODEjbuAzgwKAtTbOpvW3DZ143AntMw7MFxw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzMADpa9XKJ1YqJV7BAzKTtzspXlU/DK52+5Tqo+J/E=;
 b=g0m6M9f+FdJxhtb6ojSm9nshDhXyy8k/oCWOE4akAbhYRI5I4pGETuI8tKlD9CqzLtcEXerI8HIQOGAXNPXUruOGDo3jS8/gRdLs56s4RhIpNWzymIKGKribnrYoQeF45TQLmOgK0ma3YTd3jxovKUPLx6gUSi7ePe8umLGTOPnO6hOVWevcDerJtbHsgNI3wRx3bhmtJg1nirQd1oF3wU4ZlkPe0DXwkAZILNfXpQpLJcdz8vHkU4ezVOt729Up7gJ8oaF5JvnnWMGP4iV4RdFyVPobWiZa5M2qnKx7RcvNXY5hCyciXZPf2y+A5zi04oPoScIrugrJKz9kBccc1g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzMADpa9XKJ1YqJV7BAzKTtzspXlU/DK52+5Tqo+J/E=;
 b=T+/KRzxrgw0KyTGfEZAqbNEHF9d6fJGJMXwfmX6fZnYzUf8zecMQE//gkgJavaaIrsjjYVL63XXDpxKfMeRAZslJQui/yMRo3ODtaGZcD/e7eHrJLw9VHtQxoOzk89niK8ObWyKI0iGhA/cDidg468FA3TeJRBNgSR5sNyHgyas=
Received: from DU2PR04CA0258.eurprd04.prod.outlook.com (2603:10a6:10:28e::23)
 by GVXPR04MB9736.eurprd04.prod.outlook.com (2603:10a6:150:11c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:41 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::97) by DU2PR04CA0258.outlook.office365.com
 (2603:10a6:10:28e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Mon,
 27 Oct 2025 17:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:39 +0000
Received: from emails-9354467-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 70F7380350; Mon, 27 Oct 2025 17:48:39 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587319; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=MzMADpa9XKJ1YqJV7BAzKTtzspXlU/DK52+5Tqo+J/E=;
 b=kUNo2W+3eJXvFXv/KPYgAztRtD0cuLUwJjPqdLS3phCwcxF2t+UA+d+Fv2rwQibkSMBI/
 o0qzw6FS3KTjXKlEeLpykbEqb5WkcSe/mz0L2uieHLYjOevedGj9KzKVWtuFXc63JCHFCa4
 0WYGTIVKVksc7lLqsUOGHbGvBV99D4Q=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587319;
 b=oKF79oFh9H6dTXXZXe8yPorL1OW+vMNagCmkZY96Jb45gTWY03tXfiPb4r3jhp6vynIQ2
 Cx1+/xZFpUCPAA9YpFc+RHfepQiDgJVkoGNyqooVW9GIji42LwUb1Y0DjEnh/Z2dzcnqpbQ
 A9ttjlUWS8k7L3eNPVL9pGJFV4fcBl8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItC4KQILk8lMsw4GOREW9F5RsaVKMHlp616SDYPK4tYcSN7aRfF0Qifa4wa9Q9Ok0RM9NQYASLiCG4AguPaLbbKaNpErXdc3XgMaqia293wKsDMf/hxC8huG/dpHk5LsZMAtXvdsdB01RjT8DqyNQraq5aapsQGdOOdcFsLhuReSK7N3bhnB5UMVvVytKr/1QlZv4YwMkan5DfLIzq8EkmfuEPwM+HQAVK0RXihJbZzgMKbp0n1gNzMhondY9fXh53rfL1saV17ceu+whF4Vf0B1Uxrb4S4mDqIfGHIPZ6fhGMUn95Q8cNWMQXAIMkVz2xn4h0MKFKwdyguyC5kCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzMADpa9XKJ1YqJV7BAzKTtzspXlU/DK52+5Tqo+J/E=;
 b=yGYKwiuMXbjCjD+/lOUqzOK6yyc23BiTQ1yF0LnAxOD9ZImDWjzUqBY2s2h2SOOPiRwfFQugZheJxGn2jazmuE2IYUuzA5aThFdLqONCeSlTFxebthV1c2MAGIHfMDL039XYrokcY8WNvwbZRSRjqKAwkv8kJ1u7L89gs8iWbhxoXLXaNlEbY7EdKlhMrWMmc6XlGnPkJXJ6SzpqvvmVJiIIGHx4+wV4WOqWG4WBV+zvAxi7WpMo8grNhL6jlJvXDnenXSAscx1Os847lhjfPt2EjZ+MpT1rjNZX8CXFVy48DEA6B0VlpGTsulIwYNfDiVDz/YEmHm2bfNrALNNGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzMADpa9XKJ1YqJV7BAzKTtzspXlU/DK52+5Tqo+J/E=;
 b=T+/KRzxrgw0KyTGfEZAqbNEHF9d6fJGJMXwfmX6fZnYzUf8zecMQE//gkgJavaaIrsjjYVL63XXDpxKfMeRAZslJQui/yMRo3ODtaGZcD/e7eHrJLw9VHtQxoOzk89niK8ObWyKI0iGhA/cDidg468FA3TeJRBNgSR5sNyHgyas=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DUZPR04MB10038.eurprd04.prod.outlook.com (2603:10a6:10:4db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 17:48:26 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:26 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:17 +0100
Subject: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DUZPR04MB10038:EE_|DB3PEPF0000885D:EE_|GVXPR04MB9736:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d2d98e-6bcc-4de1-1b66-08de15810fff
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SWNVeWxrL2RrSDZReDlMUStkWXBKMmhXbVZ4ODB1ZjNpRVR6RS83MDZNYVk5?=
 =?utf-8?B?TzVzUGM5ZnZwUWVWMDV6OTJLcmNwODI0YXM0aTJKekZTTWtEcGRVVzRWSmZF?=
 =?utf-8?B?NDR5MUJ6bUZFcmJPMGU2SjFjcStuNGJscWlhdGp2a0poQXNhOUZzRE4waHly?=
 =?utf-8?B?ZWI3VUVsaTNPNGIrekM4UW1wK2VyMk1qTnpmOUV6YXR4UGx2aUZiQS94K28y?=
 =?utf-8?B?aDhQNUo3KzZ4RGYrZG1DalRyRG1KeDBIVi9kTlE3eGFzZW1lOFJwTGxvdXR4?=
 =?utf-8?B?TkN5UkJnQ3RJcVlKZG1qUUF3ZzFYRDN1TWRYbkxRb0dOMXJQT0NySTNMbS9K?=
 =?utf-8?B?VXdBajR2ZkxPYUt0TkRQakcreUwzb1VheS96WGxxd0gzdjVFc2RpWUxqeGpS?=
 =?utf-8?B?dmE0OTc1SThnV0hzdW5YYlFhMXVaMWZiZU5OTm4yb3BjY2dZM21USW5DTWxX?=
 =?utf-8?B?cGhmeSszeWFKY3hLb0V3cDFpSU5uN0ZlNndQaCtqN2hyMit4em84UVhBNllo?=
 =?utf-8?B?TDhSM245cGgwRzNtVVRrS0k1eHhvcUFBTWRmTFJXeExvSXBMK2tIenBMODRE?=
 =?utf-8?B?YW1vNXpkdnNpM2NQN0V2VjJRa0MvVVJyY0Frb2JIVHdVR1gvcUttMEo3UlJi?=
 =?utf-8?B?Wk8xOHVmWXl4NmZhVzkxSkhDVmxCOXRrTzhZYS8yUjE4NDdySFQ3a0hnVDJI?=
 =?utf-8?B?ZEQ1ZU1SUkV6MVBoaTBIUDM2a042TmptTTdRcXVPRUVWMmVPZjJHQmhjb3dT?=
 =?utf-8?B?cTlTSHhFbnJsUFpZOXJ4MkNieWVyYno1VTNnU0FjU3hwSG82Q2NxdnhiQXdF?=
 =?utf-8?B?T0tpNVk3NXkvQ0lTWGtHSWQzS3FadHNNVExjSVYwQzg1bTE1SkxBTHZZT0Zw?=
 =?utf-8?B?blNKbmJpZVNpS25ZUXRVN1VCeDU0OTVrWTBIQkNPV2t6ZitmZ3R4V2xtcGVE?=
 =?utf-8?B?U3hVSG9mVHpOVUhteDNtSUVTR3VmV1dnVEVzS1dYQVpYYVpad2FmUUVjSHNH?=
 =?utf-8?B?NWVhY2xRKzJBZDdnYTJjVjZBVmJWcmpPeDVpRzR4eVpZVzQ0M1U4NTFGVU0v?=
 =?utf-8?B?STBzQTBDSnl2bkpTa2h6U0pmdGVMamlHalNvakxZbWlkTW9qOGtYV1Yvc2M0?=
 =?utf-8?B?VVJxcDhQREFCUkJrMmdCTGFSMDhlZnNsSnNOU1ZYMzIzd3RucWt1c1lrdTVz?=
 =?utf-8?B?SWxlakNoSUJYYlJpcXhzcUlvWm9HbE1Mc3JJRDlsbkJoOFl3VVFjc0RVWGNY?=
 =?utf-8?B?b2RxbWtwU0lZclB1d3lLeE1PZ3hjRU9zVDBBOVJhLzVjR0JtcWFnTjdSQmNy?=
 =?utf-8?B?ZHIxVUNpRStpbkI3ZTFnYnpLQlF3KzVQODFvMXhwYjk0cmx5d3VQM1V4MmlP?=
 =?utf-8?B?RS9HTFdTUU1rQUNoSm5sbW9sS1MxMjRxd05QZGh5V3NpWFZWQ0dlUUs4Sk5x?=
 =?utf-8?B?eGJUWWRNTnl6VnZzRkxMQjhyeFhBY0MxZVJwZTgzVDBkSkxvdWpaV1NvQXpa?=
 =?utf-8?B?aVltaWhkVkQzL3NSREMvTzFHQmxzWkhnTVlMVVlockkyTWNTbDdjRndXdFI3?=
 =?utf-8?B?cFh1QmU0aG9wRjZaWlg2MlZUMmFoU2dBR3dIRTIzWDRla2dEZ2FCMlVKejhP?=
 =?utf-8?B?ODhIMFYyV0tqUE44a3REK1dmSWx2T3F0UGFUYnNHYTF6T20vYTF2dGFNZW1a?=
 =?utf-8?B?d0pSQTRNVVFmaVVOc1FaaWt3eVhzYnN0ZThyV1dldmJxR09Pa0lZMUc1RDNU?=
 =?utf-8?B?clM0d1lXSmlWa2lJNkFRQkVYSUNQZllCL1p1bEYrYzRwWHNLUVgzRC9HVWRL?=
 =?utf-8?B?WUl0MXlyYks3WTRnVXlHTThPUHhDRTBKMk02VDlWVTFQYnRlNDJGaHpsTmhx?=
 =?utf-8?B?YzV6VDViaXVvYVhzYzFFeDZoMSsreHhwUHZuUFlNWkMyMHhRczVlVHRiV2hB?=
 =?utf-8?B?b040alhFSjd1U2NJQ2x0R1J2bXludXVjcDl2NkcxRUdGOUNCK3Zkc3grOFJ5?=
 =?utf-8?B?RXpNdWZ3KzVWKzg5LzV6WmNESTJBL0FKakVKVU5CZi9hb2tuQ3ZJVWpoQk1u?=
 =?utf-8?B?MzU5VDdBYUZrYXJQR1ZCNmxkUUNiSHJyYkdjUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10038
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 159cd0626a1148e3ae9f0fb7b0762fb8:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 423a1dde-8699-4366-8a55-08de158107b5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|14060799003|7416014|376014|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtXUlJjeDhYMDNaMVluditTYUhYYnRPb0RVOVVPL0pVSmlWdjAwWmxkWVhm?=
 =?utf-8?B?ajJET1ozM05lejFsY1hNTTdiVmFnZ0xMZ09sOEFsYUxBc1UxYldFZThqc1Y2?=
 =?utf-8?B?KzBONlNxWkova0E0dkZkYjkzT1B6NDlPRVFRTW5zZ2U2T1F5RlBLSUYxSmh1?=
 =?utf-8?B?TmVDcCtrckpFaW9PbkVxZGNMenJEUGlUUWY1cW5LUWFjamxEajEwRC9IbEtS?=
 =?utf-8?B?d0toY25DL1A2QllLa1liWXdicDZVNlN0c0l6T3lIZ1hWZHV3N1hRYTQ5a0hw?=
 =?utf-8?B?MHU1ZGZhcHdKYitpZ05ZZlM3RllsK2huVWhvdERGOENUd0JBUHIzbkpscWFu?=
 =?utf-8?B?SnVOUHd2eTVESnpyQUdGbGpFdlpQeDc2S2FKUGtiRVovVEF0VFJCR3pkbmkv?=
 =?utf-8?B?RTRveGJTeVFtWG1VczF1WmZ6YVJtcFE3blFWVHN6UU9PaE1DdFV5MFRaYlBs?=
 =?utf-8?B?MEFGeHJLNitzajZLSzdLY1BHbllETjdTQUFvT0NYT0d4TlRNaDdkR3JXNlFL?=
 =?utf-8?B?R3JjeWdPcTF6bkUxZFVFNzNXVGdNeWNuMEltUHBlYzg4c21ITndhOEJjWitE?=
 =?utf-8?B?cUNBN1ZjektrcWtSbktpMHdNcTVPVEhZK05XdmNDOEVxSWJkdzVtaDBGY1JD?=
 =?utf-8?B?Tjh5Z2lpaVlmZlRYenpiOFpmenQ3OFRvbXVibnhrSGZqRTYvS3Arc1dSVnRo?=
 =?utf-8?B?Wks0RVFnNnVNWkYxMVgvV20rY1krckNrU2VjQ09Fakw2d21oaU9XNlowN3Yr?=
 =?utf-8?B?WFcxdVlxOTltaGIyRkliR0Z1cTNiS3ZUYXI2M2ZZNEpseHdSZzFMQUFsZ1NK?=
 =?utf-8?B?b0RIZFZMWGtpYUxBUTAzMU5XNEtQM3pIcWVDSFVWS0tlRHF1a1pCbVphcno5?=
 =?utf-8?B?dkFEQk84OEZMblFwQWR4aG5yQWVCV292aktmUWhZbmhRZDZxSFZBWEkxRGFz?=
 =?utf-8?B?d1E5YlVtUFhwMEc0aDRPWlFPN0JzK3JpR3M4Y0t1ekJPQnBvbCt0REtmaE8x?=
 =?utf-8?B?MFZ1bnBEN1llWlVkOENUenB1VkpEbzFZSHpxVmR3ZUpWalJ6YmpVa0xUSzQz?=
 =?utf-8?B?R29GdE0zT2JkTUswNm8vV3FIcXN6QVBkR0JGdHQyWFd3dFNqVWdpd2lEd1Rz?=
 =?utf-8?B?TzNON2FNREk5UFE1SjZjdDR2OEx6WHJQSXVCamp2Ny9RYUl3YTlWZjlVR1JS?=
 =?utf-8?B?VTk5M2JjejJuTGlzMmE1MHRIbTNiM0pDeGNmdUxWcyszVjdDZjE1TXFMaDQv?=
 =?utf-8?B?dGtsNit3djZSdWpNVWVnNVB5UGliMVVnSVdiRkFzWHhtNS85OVpzM1d4NXVw?=
 =?utf-8?B?MTZmMkZNMERIQWdpNEthSDMyWnpaek1maFp0UlkrN0xJSW41SStLam9NNVI5?=
 =?utf-8?B?RE1YazZRc2crUEtzSEVPRWtBSGRuaTk5QkdKcHp2SzRYalBtNm1NM2UwdTFF?=
 =?utf-8?B?S2FUWmVVUkxSM2NaN1MrLzZHVDhPWWd0YzZsSTRtYlhlQjV2UmVVVGFNTWth?=
 =?utf-8?B?VDMwa1lwMlphMCsxUXk3d2ZNTHVuVUFqbFhmeVVtSHJNTGtmOEVZKy9ZZUxv?=
 =?utf-8?B?VllzTWdaRlV5bFhxb0FMOUVOTzJ5bUU3SE1ocFpSS0ZrcjVaVDF4YjJRUFV3?=
 =?utf-8?B?Q0Q3SUlsaEJMcWpBTUdyOHdDYmNROXorMjJnbW11c1ZOaFJSWW14S0hSL3Rt?=
 =?utf-8?B?OG1CQnNsUzA3a3MxOFY1Nml4L2xPRVcyL1JPWDFMRVBLK1lPbTFoODdNb09q?=
 =?utf-8?B?aFZRZmw4Zm4yY3BDWVAwQkFEcmIzcmMreWw3ZzlQdVhnekVreXBBM2NObU5O?=
 =?utf-8?B?L2drZzJkcjVEbS9rV2Y4ZmhXMmFKVnNySmE0VWh2OXJBMmhubWZPSVBJelZ6?=
 =?utf-8?B?TGdIdE9JZDJNZExReVgyc2U0MXA4UkhTVEFZWGNJSm5zZ3VtSitLRU5qMUN4?=
 =?utf-8?B?ZXJCS0k2amt5aHFFbnRCUk9vYnpPVlgwR1hRWnAwMTBwM0JHUEtrdWFVWDBx?=
 =?utf-8?B?Mnp0bzF5RTBiUGhtQ1ZmcVBsQjRQVHBHOUVPNHBZMjloVnRUWlAzNHpsQkw1?=
 =?utf-8?B?V3llRnRWeGZJbVExNVZBaVkrbm13emE0K0l6d2NxQ2RZeUVvT2R5TGFXZWx5?=
 =?utf-8?Q?wZUh+iTj/ElloQjGyYOxd3FiZ?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(14060799003)(7416014)(376014)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:39.6094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d2d98e-6bcc-4de1-1b66-08de15810fff
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9736
X-Mailman-Approved-At: Mon, 27 Oct 2025 22:26:31 +0000
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

Add description for the SolidRun i.MX8MP HummingBoard IIoT.
The board is a new design around the i.MX8MP System on Module, not
sharing much with previous HummingBoards.

It comes with some common features:
- 3x USB-3.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 M-Key connector with PCI-E Gen. 3 x1
- 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
- 1x LVDS Display Connector
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

In addition there is a board-to-board expansion connector to support
custom daughter boards with access to SPI, a range of GPIOs and -
notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
to this b2b connector, or a termianl block connector on the base board.

The routing choice for UART and CAN is expressed through gpio
mux-controllers in DT and can be changed by applying dtb addons.

Four dtb addons are provided:

- dsi panel Winstar WJ70N3TYJHMNG0
- lvds panel Winstar WF70A8SYJHLNGA
- RS485 on UART port "A" (default rs232)
- RS485 on UART port "B" (default rs232)

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  70 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 710 +++++++++++++++++++++
 6 files changed, 927 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8bda6fb0ff9c1..d414d0efe5e74 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -207,6 +207,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
+DTC_FLAGS_imx8mp-hummingboard-iiot := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 0000000000000..b3cf66837c577
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_from_dsim: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&dsim_to_panel>;
+			};
+		};
+	};
+
+	port@1 {
+		dsim_to_panel: endpoint {
+			remote-endpoint = <&panel_from_dsim>;
+			attach-bridge;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 0000000000000..90674f9871020
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "panel-lvds";
+		backlight = <&lvds_backlight>;
+		power-supply = <&reg_dsi_panel>;
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		data-mapping = "vesa-24";
+		width-mm = <154>;
+		height-mm = <86>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <40>;
+			hback-porch = <144>;
+			hsync-len = <104>;
+			hsync-active = <0>;
+			vfront-porch = <3>;
+			vback-porch = <11>;
+			vsync-len = <10>;
+			vsync-active = <1>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@1 {
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_from_lvds>;
+			};
+		};
+	};
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-l/r";
+	};
+
+	lvds-ud-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-u/d";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 0000000000000..7bbf800b78fb1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 0000000000000..d4bfea886ad12
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
new file mode 100644
index 0000000000000..2e4cb676bc9da
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
@@ -0,0 +1,710 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mp-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP HummingBoard IIoT";
+	compatible = "solidrun,imx8mp-hummingboard-iiot",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos; /* J10 */
+		ethernet1 = &fec; /* J11 */
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+		gpio5 = &tca6408_u48;
+		gpio6 = &tca6408_u37;
+		gpio7 = &tca6416_u20;
+		gpio8 = &tca6416_u21;
+		i2c6 = &i2c_exp;
+		i2c7 = &i2c_csi;
+		i2c8 = &i2c_dsi;
+		i2c9 = &i2c_lvds;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi-panel";
+		regulator-min-microvolt = <11200000>;
+		regulator-max-microvolt = <11200000>;
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-b";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-m";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+		startup-delay-us = <250>;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus3";
+		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		label = "m2-b gnss";
+		radio-type = "gps";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		label = "m2-b radio";
+		radio-type = "wwan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both flexcan1 and flexcan2 tx/rx between
+		 * expansion connector (J22) and on-board transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches can bus between different SoM board-to-board
+		 * connector pins which is used to support different SoMs.
+		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
+		 */
+		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+		idle-state = <1>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_uart4_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both uart3 and uart4 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+		/* default on-board */
+		idle-state = <0>;
+	};
+
+	uart3_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	uart4_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches uart4 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+		/* default rs232 */
+		idle-state = <0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			label = "m2-m-wakeup";
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			linux,code = <KEY_WAKEUP>;
+			wakeup-source;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	num-cs = <1>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	ecspi2_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
+		spi-max-frequency = <166000000>;
+		mux-controls = <&spi_mux>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			spi-max-frequency = <43000000>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+};
+
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can2_pins>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <8000000>;
+	};
+};
+
+&i2c2 {
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		/*
+		 * This reset is open drain,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+			};
+		};
+
+		/* channel 2 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+			};
+		};
+	};
+};
+
+&i2c3 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+	clock-frequency = <400000>;
+
+	tca6416_u20: gpio@20 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpio-hog;
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "m2-b-reset";
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		/*
+		 * This is a TI TCAL6416 using same programming model as
+		 * NXP PCAL6416, not to be confused with TI TCA6416.
+		 */
+		compatible = "nxp,pcal6416";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&tca6416_u21_int_pins>;
+		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			output-low;
+			line-name = "rs232-shutdown";
+		};
+
+		lcd-i2c-reset-hog {
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			output-low;
+			line-name = "lcd-i2c-reset";
+		};
+
+		m2-m-clkreq-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			color = <LED_COLOR_ID_RGB>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <3>;
+			chan-name = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&iomuxc {
+	can1_pins: pinctrl-can1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
+		>;
+	};
+
+	can2_pins: pinctrl-can2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
+		>;
+	};
+
+	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
+		>;
+	};
+
+	/* UARTA */
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
+			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
+		>;
+	};
+
+	/* UARTB */
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_DATA00__UART4_DCE_RX		0x140
+			MX8MP_IOMUXC_NAND_DATA01__UART4_DCE_TX		0x140
+			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
+		>;
+	};
+};
+
+&pcie {
+	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* M.2 M-Key (J4) */
+&pcie_phy {
+	clocks = <&hsio_blk_ctrl>;
+	clock-names = "ref";
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* ADIN1300 LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus1>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};

-- 
2.51.0

