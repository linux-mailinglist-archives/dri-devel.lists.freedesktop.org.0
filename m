Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338BAC21544
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7453810E2A1;
	Thu, 30 Oct 2025 16:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="JDo+njpC";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="JDo+njpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021079.outbound.protection.outlook.com
 [40.107.130.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6969110E2A1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:57:20 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OC++CrsXxiZeJKcflh/luiMoYohQ3M6F47CERZM4Q5rDSDkR7eKHTgBIoH+rCvOsEme3pXHaDNDics1J7IiXjkROsc5McWOQjsuLeJMnzLI9nAmuvT/VohUBb51UvUU5IBBI/jj54PYXI1tQuEb/N3gZh29iZQ9+IPntGqWMAuj289KpIJbR5BGiaG+Dqrl5LXd5ZG8zCEFIOdoVzi8TsOgwZKAIYfVdQUrFdWooQg2olsBtURVeIdlbmDzU5Klg2mQPOfanDMtGQIb8P3zC8oBJ6756bSmxFzZuqzGNlDXEEw8Cw7yAHFHH52gBZat5thZmopzYcl6jakcf138lmA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDfP57TGfYemFEo0dwpDoWpxpFJ5gwiwZAcVMpw4wwM=;
 b=cY3Q75N4QypUNy7kfDXwwUJUTZXXgTXh/U75n9VQx80ULQs2CtLMPyHkEAR6sRdD8pXMap9pEi9psiZdOnnbbS6YNAHS/HY0jh/bliTSWFY6JFebK9rHTG4wv7N6gey8VojxHbQ5+GjmlK3RcnblLqKT8le3We5yA3xY3hoC1yS1j0zB7/FvHp2UxTjz0AKRPCa3S+BwXjV9Tn8w7pIfv4omgzv4n4+wL/ywEoI+0GmRfdKZlx7h0uU5PzpzInSMuySF3t5i+cHnLNddlhBV5OpqhFNBHacuds93h29n7HtdvS06vRPYbWsYDmqllgULcWAoCksLN+CqjZW89pNuHg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDfP57TGfYemFEo0dwpDoWpxpFJ5gwiwZAcVMpw4wwM=;
 b=JDo+njpCdiomKPY+sc8kA6G/AGxd94QDdltgIW5xHo2UC+WFEVACali74NUJYxugAozyBR97zhegSb9Rd+j6id5B01VICfXnurlrXgB4p9GQ2EFPVN/aYamFm+HjpXwR5Gq6WtHrh9CGVydgKnXhFeLHJjN8Z+asN1wDoN2k+KM=
Received: from AM8P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::24)
 by AS1PR04MB9454.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 16:57:16 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::9) by AM8P189CA0019.outlook.office365.com
 (2603:10a6:20b:218::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 16:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 16:57:16 +0000
Received: from emails-3143366-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 802FC806DE; Thu, 30 Oct 2025 16:57:16 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761843436; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=wDfP57TGfYemFEo0dwpDoWpxpFJ5gwiwZAcVMpw4wwM=;
 b=pTJsQQwvdPgBGjv8MiB73qtieAg7/6jEfCAkNZ5uOunElpOTNhK2boJ9rvP/MXZ7HpZwh
 HM24FG4GRdc3YaoG2G/WczCbmKKs9oA4nxl+ess/trSUixUitz+m0qZ67oqvpbUyhJcXN+p
 GFKmMnjAkaZahYJvbs8eD3L77v+Nfu4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761843436;
 b=S8JwiRxo3q2qHikxx3NKDBX16HoW1a99iEUEUCIpnV8ckLGP4XpEPGcyRiiEswU+LZmEh
 KVrOJ8M/79q9yXiLADrrQamIlCWYIjrTbfLiHC1tRADRbxF/2QVDpsfIKJU0Z9pwalpYIO1
 uOCqmlCQyYTOJL/kyQcRvcTsUgSsbe0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2Cip/fOi9/S4yt5mKfg4byf/GtatUepSttcnt0z+8qix0HcdwlC8pwTuvQO2A6fg4lgSMJ/q8UO+KnyC3y0xIudQkj4PlPv907C0kFFmqTFF9JyMS1dDNYSwyFEcdPaGqLm6/6k6KNtPyo12qBjGslQQ8wNHXGB3IZ70nSXnb8jh1HbqYqox7vF6sNHLMip90vaaAn3P0Jwme4ohGZyygO1NyDjgXcH4NfbgSo8TMamD5FZ5VfLLMURThoFgE07/xa3J0tlE7NFE374/NtiHVKVeTej38Hj3quxQ9XTMshB772f0TRa9eohBPkg7wFokh2CQBCgG8ldqHS8EDsvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDfP57TGfYemFEo0dwpDoWpxpFJ5gwiwZAcVMpw4wwM=;
 b=f4x4JH4mEWf/mZfcXMwt58aU2KFsWxFPW/BDd4mdKhNpsZ5QBVNmqCmHDM9H9LmLOxhVj7NTe5CaQOH35ZAkkImhxKrn3Q5GrYkPTkyCaWr+eK2q8+QQ9WcK1QcQeIgw5xEcOO2M1cDSnGpdFDmh+wCAo7snbk0UwCzRkYl5snO/dtkTFrDSZ9kgTa6jUXS//TLWBz3fPFLcWNcK4XvRQy8lK+ZtHSC/cqYZrnRG5y52M6zRlhrQGsLwi4CaQCQFvmUSpOn1SPnmswBi2MbsBb1i0JAJiw1i5LPjqcyE4Nui5XHMho0xvEjbGeTfDIbWMGG7he5EQlrn6iGB8wkW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDfP57TGfYemFEo0dwpDoWpxpFJ5gwiwZAcVMpw4wwM=;
 b=JDo+njpCdiomKPY+sc8kA6G/AGxd94QDdltgIW5xHo2UC+WFEVACali74NUJYxugAozyBR97zhegSb9Rd+j6id5B01VICfXnurlrXgB4p9GQ2EFPVN/aYamFm+HjpXwR5Gq6WtHrh9CGVydgKnXhFeLHJjN8Z+asN1wDoN2k+KM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 16:57:08 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 16:57:08 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Thread-Topic: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Thread-Index: AQHcR2nhwBxWoZYoaEycQ3WG1d/qMLTXRIAAgAAx9wCAAEkrgIADLf4A
Date: Thu, 30 Oct 2025 16:57:08 +0000
Message-ID: <00476901-df65-4f79-b0fd-3621c3f2ac97@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
 <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
 <5e055ce8-e30c-45b7-993a-3ea8f8a796d2@solid-run.com>
 <a5e9f1ec-69f0-4f91-9dd1-387b3e4ace5b@kernel.org>
In-Reply-To: <a5e9f1ec-69f0-4f91-9dd1-387b3e4ace5b@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|DB8PR04MB7178:EE_|AMS0EPF000001AA:EE_|AS1PR04MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: be294474-76da-430e-d9c0-08de17d561c0
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SmhuMnZWWXRDUU9qMFFVanJ4Zmx6Z3c4TEFWMHJhZExXZUNQaXM3djhqL255?=
 =?utf-8?B?MXJUcmU1KzdwczZ1YWxlcXpNVXNwTWdZSk5aSEhOdUNpemNNd0VlZjB5WW1L?=
 =?utf-8?B?eUdDMWRUSGdvc1VDSUduSjRYWDlDU1pBTlFKbHFLOTdsamxCQjlYUlhIZ3Vk?=
 =?utf-8?B?cUFyZis2dHFSc2JIWlREQzNtcE5ITitidDVmdDJleGpyRjAzcHpMekJPWHoz?=
 =?utf-8?B?SW50YWk1UlZKVEZLRERndnE1NTZEbTFCVTlSVkhPVFVnU1IyVndJNDVDZnZE?=
 =?utf-8?B?dk9aNjFaREVjd3lwdm9aREVDTk8rejFiUW5Fa0p1dWhxMkdlSXFJVDBHbkdj?=
 =?utf-8?B?T3hqeDFoVnV0QitjMXlyd1VFZUxKcVl6cVh6ZGcvdDBsUVpGeSs3YWViUjRv?=
 =?utf-8?B?Sk1oWW1LdmVLMzFMUWtuNU51dDdrWVNQOG92V1p3ajJxQTFUVndiY1RmQ2V5?=
 =?utf-8?B?VFpQc0RBZXBRRlZNWkFtQW8xRTBpczNCYzhWYVMrZjFlcnZhUTRod25IUTN1?=
 =?utf-8?B?cUMwSlQzalIwR2lDWXhLdjVTM21PV3BVajQ2QkU0OG4xSTJmejFFaS9HVFk3?=
 =?utf-8?B?QXhEVitHVzdYeDRFU0R2NGVIb3BYU3ZCOTBQSlJ1bi9MQUY3cDdjcXRvaGMr?=
 =?utf-8?B?VDZrZkd3SzQrOHArSnVWSUkrcTk1cU5FMkZnU1hEVjdDYlIrMHhRbDIzRGs0?=
 =?utf-8?B?RmRqOUFQTUxjajU3eFdqaFIrSWpERXJjbW9PL0UrdVMvcEVQZm9EOXdmcHJK?=
 =?utf-8?B?NVRwOEZQdlhiUnlPblduRzFqaHJmMjVFSWhTdFR2UDNaL0lsOGtlYzFzVmUz?=
 =?utf-8?B?RkpzUklOZ2swaUhRcEVKSXQwOVBFZU1QWnZJN3I4ZDlMQWxxWkIwVHdZSXFj?=
 =?utf-8?B?L3VyWE4zY0UxZWxkbndEblhkQzZyTUE5MHY0Qm1NOWFoN01YaTFGMUhtN3Z0?=
 =?utf-8?B?c0w0NlVWNU5VQjV2bWtmQTF2bGRsRDExYTNxUXJLNTFldWZ1K2dlY1F2QXRl?=
 =?utf-8?B?cTFzOUN3S2YxaFBaREhZU1p3M203NmVxOWt6dENwblZjTFZBMUdRMDZ3Q0xX?=
 =?utf-8?B?bCthNU1Fd2V1VFlpV3ZlSUpBTFRqK2svU2NWS0tWZWYvUlZQT3JkUUhQREdt?=
 =?utf-8?B?VjVhVHRzZ1lvK2VtOVFmWHlMKzQ2dGJZcFdUL3J4eENRMlBzWExUcVhBQWFQ?=
 =?utf-8?B?eVY1VjZDMS8wTHg1SGJKVmQ0bkp0TGZhZ0hvZUlsZ21pZDNPRURZZXVYcERS?=
 =?utf-8?B?T01kSW5QaW9WRng0aEcyZ1d3bzRwK0RFZjVIQTR3MzMzY0xqV29kR2VOOWxD?=
 =?utf-8?B?VTk3L01ma1FRY21xVDV3NUxsaGFLVDB3VUpKb21JM3NiUXJBMjhOWWV5aGQ5?=
 =?utf-8?B?SG1pb1ZWY3dmNjV0SEkyVzU2ZnZCWW9CWE5lM2N2aDhaR29VMXRpandMa1NI?=
 =?utf-8?B?LzB4NlIza0RUamw2M1BuRjdDUG9oVEloVjdXUE1ubzJjNTNMYkdXU1NZL3lM?=
 =?utf-8?B?UTBvZS9pKzhNTVhFSURrbnF3dTYyN05OQUg4SWFhNWJmaVdveGo2UjR3S3BU?=
 =?utf-8?B?SnJ0THlYU1NNUUVGVXJXL3lpYVRUeEFEQjA4blhuWlhaZ2RPektzcUFIdHB1?=
 =?utf-8?B?aU5KbklnSCtPVDk5dnpvTEV3eFVoZ04waGxYV1VSUnJUUENHeVVWUnpVb056?=
 =?utf-8?B?bzRnUkg5bGtVV2tXdVIrVnkreXdRNS9SdnNtVytLS0s3czc2SDhpK1BHKzh2?=
 =?utf-8?B?RU0zcTlaNU8zYnZpZmZTVDJWcWNBZzZDdjlkY2VhWXkvbmtib25idTJ1a0dD?=
 =?utf-8?B?RlVObFV3WEtlUFBwTlVDM1N2NlZ5amFoUGYrWnIzNkdYVFhoS1dENjF1TEF2?=
 =?utf-8?B?L3BVMGNOUTJ0cGJucHR4bU1IdGdBYkpmOEk5YmV4RWljM0wzT0crN28vVEow?=
 =?utf-8?B?b1BvT1lId3NjbzZIL2Y5OXNMQ3Z5MUpXUEZOT1FPU0NtblZGMTVDYzE1d2Iz?=
 =?utf-8?B?ODZiRlJvYWxYZUdvVlNYVzdIc0RLL0x6aWYrK2piNUFnUFdpRm10cDJtc21q?=
 =?utf-8?Q?5eiKTf?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7B5BD0F5BB08548AB6C2057CC0C0F9D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6b4430b6070f4afc9fcff90331ce0314:solidrun,
 office365_emails, sent, inline:76fa2e8c87864c9bea8ab77815420b07
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 66f96811-5a43-4b03-4358-08de17d55cb6
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|35042699022|36860700013|1800799024|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkRhR01YbDJlalZSQXV6SnBOa01UNTRWY3BZdlFmTHlYUzdWOW5neHBheStG?=
 =?utf-8?B?aDduaE8vSjZZQmpyZnRIQllMSitRTkpya1ZxQVEvWUJNWTNKZ0ZERkErMmp0?=
 =?utf-8?B?SGpNeFlVK0tCU2U4VHUycGpOYzJxdXpHd1QweThRY2dKOUxFVjd2YmxNMVdt?=
 =?utf-8?B?dGtDOThIVElWa1VjdzluKytPK2trMGs1NmFCdDRHV0NFQlA4YkF1b29ibGNW?=
 =?utf-8?B?NE5TV29pVFhiVDFuUGZVbnV1WFJDMDRzT1k2MTluN1lnL0VVd1pkdlViWEx0?=
 =?utf-8?B?bXozUkNZRHNKL0ZrNHJkUEdyd3I1c2N0dGVFTjl0M2V4TWtTZi9RYVk5bzU4?=
 =?utf-8?B?SjB4RHpXb05TTmNRV1laSXVwNWJBZEt2ZUV5MEdtT2ttVVZyMUNhZWJRL3Nq?=
 =?utf-8?B?ZWlqb21ZejNhMnc0NHEybDNvVGxiNzlhUkR4TlpLUXgzbE0vRVNzbmpzMS8y?=
 =?utf-8?B?aW10d2xBY0NLV2xGS2Y3THNaYjd1QmVxRVo0Y2pMK28yZGpWUWhxdUMzUFJF?=
 =?utf-8?B?dkpCa2hLTURxYUxWQkdNYWZSV29Cb042K2lwV1lsQXZQbHNYcnA4M0VtdFlp?=
 =?utf-8?B?TG9XZjZOb1J2ZDdSRzdHbEFxZ2cxeDQ5RTJrb0FzVExhUENXTmdqZEJoNVdF?=
 =?utf-8?B?ampLeXZKT0UvUFpYYjJBaVh5aDFvS2RTTjVmZ3U0R1FvZmtJL1NoM2hnK2x4?=
 =?utf-8?B?TGlZQ2tPNU95MmNMOGN3RnlkYVB3bWFTektLTFpQbmtwZHIvb0tnMytucElW?=
 =?utf-8?B?bm04QUNwSEYyc3VsY0s2YWRVOHFNMnJ6WUI5eTFmMTVqalViazBEUzVRVGNk?=
 =?utf-8?B?SklsbjhiT1hWRWoza1gzL0ZZcjBKUVpIWlRCKysxTEpuRUFWQ2h3bDFzT1VW?=
 =?utf-8?B?eWRuVVBpUE5ZL25VOWZSVEtEbW5nNDRMRWhaTW1Wd2ZOcVNwNEtlRHNna2RK?=
 =?utf-8?B?WlNPbC95am9YeW9FbDZRNSs4YlNUMWM5cFZFOU9pVkJwZ2xZVG5NTnJiaTZI?=
 =?utf-8?B?cVNadXczLzZXZ0xhWDVHcEJtRkdFTmVVcUhaU2FvM2dDUFhYVUtyTmhBVi9L?=
 =?utf-8?B?UlUraXpJdEt4bGRPZU9qUDVzMU92MHlseWx0a2tMczJmTVBQS2JWQkF5TFI2?=
 =?utf-8?B?K2FwNGNjbmh6NlZTQ3N5bFcrdC9Nemc0MGJNa2loeHNCcDF3SDlkNG1QQURP?=
 =?utf-8?B?aThZY0RHd3RWYTJaWUN5QjBOK2ViZWVUUi9rNGU2bEp2NiszTG04d21qTnY3?=
 =?utf-8?B?Sk9NSU85RUxzUXh5U1ZzMi85aXVCR3czZGZMNnROQmdyYmIvYW5vb1Rwb29I?=
 =?utf-8?B?aldadFFFdnNoQkRJdmxzcDhkYzdDT0R6UEhZM0Y4UWhBRHRVMHltSm53d0Iy?=
 =?utf-8?B?d1d1Nm1heUFWV1p1T0RzNUxnTUhPcU1mTHV0Qk1NNFpWaDkvbDMvaDJGaElR?=
 =?utf-8?B?N3NRUnZXLy9sNW15cVMzWGJsbWg2SWxYSXVtc3krV0VIL2ZFSnVDV2pDNTli?=
 =?utf-8?B?K0NFRkpwbXNMQ25Od0lvbjY2VnRJamd0eS9NL2hlTEZOVUh1c1psN2lFNk50?=
 =?utf-8?B?RTNuREdCK3RySTVVVUoxVGd0Z1lra2lISU9sU2t1djREc29hMjAvOG10ZUlH?=
 =?utf-8?B?U2c1OHVWK1RkbU5JRllHaEZNN2kvWThkcWdWK09lT0pEaC9jcjRONlFWRmFO?=
 =?utf-8?B?ZnpkNm1BWElEZTBXQURFemJoaktWR2ZkaFFnNWpKSzRZQzVFUjE1eUFkUnVi?=
 =?utf-8?B?TCt3TlgySXArMEtrRCs2cDE1OTIyRzNmQmVNVlVHYmxMcWdWY3EyZUdOTExs?=
 =?utf-8?B?eDRsY2o2UEo3eXIwTmxDN2lQclpzSUV6TUR1N1VOcUd4blUra0VCK1o5WWc3?=
 =?utf-8?B?OS9hLzJRNnMza0JYMnRmdC80M0lXZVFMYmZ5ZklCd2N3WUlPS2Rpb3hYSFJI?=
 =?utf-8?B?dHE5Zkd2cWcrLzdmMUphRm1XYUJyRVhmKzA5bzJwakdLT29MUDl1R1ZXU0Vl?=
 =?utf-8?B?Uk5OeHhJY0dONjlMakd5dXIrM3hGUUFJakR3SHBhOTFZQzh2LzhYbjEwa1ZK?=
 =?utf-8?B?K25saVJnT0NvL1MxendFdS83MmdCWENQUENJd2xteUxDSi9VaGJLSGFMRHA1?=
 =?utf-8?Q?7f/k=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(35042699022)(36860700013)(1800799024)(14060799003)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 16:57:16.7758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be294474-76da-430e-d9c0-08de17d561c0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9454
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

QW0gMjguMTAuMjUgdW0gMTc6MjMgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KDQo+IE9u
IDI4LzEwLzIwMjUgMTM6MDEsIEpvc3VhIE1heWVyIHdyb3RlOg0KPj4gQW0gMjguMTAuMjUgdW0g
MTA6MDMgc2NocmllYiBLcnp5c3p0b2YgS296bG93c2tpOg0KPj4+IE9uIE1vbiwgT2N0IDI3LCAy
MDI1IGF0IDA2OjQ4OjExUE0gKzAxMDAsIEpvc3VhIE1heWVyIHdyb3RlOg0KPj4+PiBwb3J0IHBy
b3BlcnR5IGlzIHVzZWQgZm9yIGxpbmtpbmcgZHNpIHBvcnRzIHdpdGggZHNpIHBhbmVscy4NCj4+
Pj4gQWRkIHBvcnQgcHJvcGVydHkgdG8gcm9uYm8gZHNpIHBhbmVsIGJpbmRpbmcuDQo+Pj4+DQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4+
PiAtLS0NCj4+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JvbmJvLHJiMDcwZDMwLnlhbWwgfCAxICsNCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9uYm8scmIwNzBkMzAueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvbmJvLHJiMDcwZDMwLnlh
bWwNCj4+Pj4gaW5kZXggMDRmODZlMGNiYWM5MS4uYTJkYzY3YTg3ZmEzYiAxMDA2NDQNCj4+Pj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9u
Ym8scmIwNzBkMzAueWFtbA0KPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9yb25ibyxyYjA3MGQzMC55YW1sDQo+Pj4+IEBAIC0xMyw2ICsx
Myw3IEBAIHByb3BlcnRpZXM6DQo+Pj4+ICAgIGNvbXBhdGlibGU6DQo+Pj4+ICAgICAgY29uc3Q6
IHJvbmJvLHJiMDcwZDMwDQo+Pj4+ICANCj4+Pj4gKyAgcG9ydDogdHJ1ZQ0KPj4+IFBvcnQgaXMg
bmV2ZXIgdGhlIHNlY29uZCBwcm9wZXJ0eS4gUGxlYXNlIGxvb2sgYXQgb3RoZXIgYmluZGluZ3Mu
DQo+PiBTb21lIHBsYWNlcyBkaWQgdGhhdCAuLi4uLCBlLmcuOg0KPiBZZXMsIGZpbmRpbmcgZmV3
IG91dGxpZXJzIGlzIG5vdCBhIGdvb2QgYXJndW1lbnQuIEVzcGVjaWFsbHkgYmluZGluZw0KPiBm
cm9tIDIwMjAgd2hlcmUgbWFueSBjb252ZW50aW9ucyBkaWQgbm90IGV4aXN0Lg0KPg0KPiBMb29r
IGF0IHRoZSBtb3N0IG9mIHRoZSBiaW5kaW5ncyBvciB0aGUgcmVjZW50bHkgcmV2aWV3ZWQuDQo+
DQo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9tYW50
aXgsbWxhZjA1N3dlNTEteC55YW1sLcKgIGNvbXBhdGlibGU6DQo+PiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1s
LcKgIMKgIGVudW06DQo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9wYW5lbC9tYW50aXgsbWxhZjA1N3dlNTEteC55YW1sLcKgIMKgIMKgIC0gbWFudGl4LG1sYWYw
NTd3ZTUxLXgNCj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL21hbnRpeCxtbGFmMDU3d2U1MS14LnlhbWwtwqAgwqAgwqAgLSB5cyx5czU3cHNzMzZiaDVn
cQ0KPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFu
dGl4LG1sYWYwNTd3ZTUxLXgueWFtbC0NCj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL21hbnRpeCxtbGFmMDU3d2U1MS14LnlhbWw6wqAgcG9ydDogdHJ1
ZQ0KPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbWFu
dGl4LG1sYWYwNTd3ZTUxLXgueWFtbC3CoCByZWc6DQo+Pg0KPj4+IEFsc28sIG1pc3NpbmcgYmxh
bmsgbGluZQ0KPj4gT2theQ0KPj4+ICBhbmQgbWlzc2luZyB0b3AtbGV2ZWwgcmVmIGZvciBwYW5l
bC1jb21tb24uDQo+PiBEb2VzIHRoaXMgaW1wYWN0IHdoaWNoIHByb3BlcnRpZXMgYXJlIGNvbnNp
ZGVyZWQgcmVxdWlyZWQgLyB2YWxpZD8NCj4+DQo+PiBSb25ibyBwYW5lbCBoYXMgZGlmZmVyZW50
IGdwaW9zIC8gbmFtZXMgZnJvbSBwYW5lbC1jb21tb246DQo+Pg0KPj4gcG93ZXItZ3Bpb3M6IHNp
bWlsYXIgdG8gcGFuZWwtY29tbW9uIGVuYWJsZS1ncGlvcw0KPj4gcmVzZXQtZ3Bpb3M6IGNvbW1v
biB0byBwYW5lbC1jb21tb24NCj4+IHNobHItZ3Bpb3M6IHNwZWNpYWwgdG8gcm9uYm8NCj4+IHVw
ZG4tZ3Bpb3M6IHNwZWNpYWwgdG8gcm9uYm8NCj4+IHZjYy1sY2Qtc3VwcGx5OiBzaW1pbGFyIHRv
IHBhbmVsLWNvbW1vbiBwb3dlci1zdXBwbHkNCj4+IGJhY2tsaWdodDogY29tbW9uIHRvIHBhbmVs
LWNvbW1vbg0KPj4NCj4+IFRoZXJlIGFyZSBzb21lIG90aGVyIGdwaW9zIGluIHBhbmVsLWNvbW1v
biB0aGF0IHJvbmJvIHBhbmVsIGRvZXMgbm90IHVzZS4NCj4gSnVzdCB1c2UgdGhlIHByb3BlcnRp
ZXMgZnJvbSB0aGUgY29tbW9uIHNjaGVtYSB3aGVyZSBhcHBsaWNhYmxlLg0KPg0KPj4gSXMgdGhl
IGFib3ZlIHJlbGV2YW50Pw0KPj4gV291bGQgaXQgYmUgY29ycmVjdCBhZGRpbmcgdGhlIGJlbG93
PzoNCj4+DQo+PiDCoG1haW50YWluZXJzOg0KPj4gwqAgwqAtIE1heGltZSBSaXBhcmQgPG1yaXBh
cmRAa2VybmVsLm9yZz4NCj4+IMKgDQo+PiArYWxsT2Y6DQo+PiArwqAgLSAkcmVmOiBwYW5lbC1j
b21tb24ueWFtbCMNCj4+ICsNCj4+IMKgcHJvcGVydGllczoNCj4+IMKgIMKgY29tcGF0aWJsZToN
Cj4+IMKgIMKgIMKgY29uc3Q6IHJvbmJvLHJiMDcwZDMwDQo+Pg0KPj4gQEAgLTQ4LDUgKzUwLDYg
QEAgcmVxdWlyZWQ6DQo+PiDCoCDCoC0gc2hsci1ncGlvcw0KPj4gwqAgwqAtIHVwZG4tZ3Bpb3MN
Cj4+IMKgIMKgLSB2Y2MtbGNkLXN1cHBseQ0KPj4gK8KgIC0gcG9ydA0KPj4gwqANCj4+IMKgYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IHVuZXZhbHVhdGVkUHJvcGVydGllczpmYWxzZSBu
b3cuDQpEb2VzIHRoaXMgbWVhbiB0byBoYXZlIGJvdGggYWRkaXRpb25hbFByb3BlcnRpZXMgYW5k
IHVuZXZhbHVhdGVkUHJvcGVydGllcywNCm9yIGp1c3QgdGhlIGxhdHRlcj8NCg==
