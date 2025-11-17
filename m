Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DEC6408B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727810E36D;
	Mon, 17 Nov 2025 12:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="QLs3PWJp";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="QLs3PWJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020077.outbound.protection.outlook.com [52.101.84.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B5D10E093
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:36 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RQh9GqtvnsiWVsUc2LHf7dKvXGxYlDCEilai18cVrq9/B/OXkdYL+5Yoj7lHlw7DhNvIccfwjVCnPE33M/Y0QFxO3bFiCRPgXE5Gd/tfEr8b+sYEbwBVsdKRx8QpIV135Uexzzr7Z1k/Ygn+j4wFqK3NAWqml2xZ+CvfffVDYoI8Q/Me7t0atvsql3mjoEdErx0lUzFw2i4tz3RYvPEWveHGabHiEgfNGFIOwVPYa36GoebGLlYAHxRCEDDPRf5a2/GR1M1dJ41BB9QZLWqnVFGZvIbZhC9eRCH29J82+J8tHBv5JlU6E+gOkdWVIpQe4yN/FdSbemyNPWknuXHbNA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=gcbrLMDGstIOMEcJyn7tJ/rB0fQE0sT7xyCdVFEWXdZRSJ72dn16Oc+KajtHeMBixJVSIsCn/MkULIdDKjkcJxMq5g/GVF0GK82chSfnrzCWmTwVeXCLmlmbkEy1xXvJcPqrSdwrqh1RyfVxmGFrmOWJMGj/f2MF3wNjyi/CxGmg8892PmQxy+sSpWeYEU7gnIQfZC8c+SBpRPY2tZRsnXuop0hKpSPE/LgQ1rHkGvPJxjnSA7TBPy71ykfjIbCjAEuaL7PXYdtKTe49CnqshhUo2GjXGRxNgEd3PFTuzc7Vu61d6+FWGfYLEgdF28AIs4RDsKVvXDyWSX4FkfYmQA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=QLs3PWJpKaW7ArRDM65RJaq+Id4JDLsIeHspigMET+2Gd+cztrOn6GVs14kAkOoM0g7knae/4v57BpEihaUcYsNYcyf3ROiwtwTtyVw8CnYe5N0nkKP74MrQwgR/9M+ojsBOXwQr1LH2/DuKChs0nzLmS3592mvbthl1Epwiqnc=
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by AS8PR04MB8055.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:31 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::ff) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:29:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:31 +0000
Received: from emails-6478555-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-219.eu-west-1.compute.internal [10.20.5.219])
 by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 093D8800EB; Mon, 17 Nov 2025 12:29:31 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382571; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=gkv+p3WoEIIea8FweBgbHERp+M2Spz37trOuroLVdPL0xAgwUyF9ToZYLyDnjwXWVzrAc
 iIY8UFJEPirACqI1eDtIuto9GSLg16i1O+BPY3Jel4TFf2a1BvtWuGvBjfLW2UCj5ZrEqxp
 2y3yKb5sYrMnS/PdZK4JxZ1w6/0p2KI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382571;
 b=m8FTFPXc4kIx8LkYKKAkdhmAbWRn/XrV//DFd8q5YTZ46duY/3r0IoG4y8FExrQOE9juz
 NT+4wiuG0z9E9zf0Vy4JkUI2+RXsSPi7qKJyJAIwjvX1g/woGdvxfcJM5EF476e1aLU1iEj
 wcDnh+jvAs78eLdknWLgZGcYtYU2yfA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYj8cmCZoOQF5d/HmB+Td1uwf+0u4LI3/URz1VAvfpxFtyWjodELJa7fLu3b0mbTswGQNbRVIu2N7cPHm2/YqecDzuU9IdH7rnZuB/+uA2qg3fPwfo/bzhzhZMI+XLBqozgEtdn233ZNvR/FLTSvrPmFCuI7IjmOCRzIVHtTxsdXcIK+QC95qJAo6eXGMstFpOwGFw34zw+eaxIGts9zIJMJ8vH5gjvZgPerXDgSiJrY1bqmy3BIhEwcLDxpEbqAlA1NBqPRiRZNXjIrEUY0P+iW6hejrj24/ks8Z37MZMbO9yQj2RQOXAWKU761sKY+YPLv1OGMObnH/d0sP4Mu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=TwbLELNc+secUWZad77U6dP96wGxKpCVC02oyvV8jl4SsIXi3rsINX3KZywRnAgNyypZq06m5HWyPOgj/BRQUhLp8nYSDi5PqWPQiPLhFvbuKIi6yorTgUGWGZy9brAiqHWqVUAVEUUnfDbbhUx6HSooS7eaKlEPgO3hOkf2HW7C+UAyv1CzB1AWIDIjQLNUN2vQiNmEktRS1P5k4o+UWe7q6RgrVIpfxloWu+oxT+H7bezzEuXE1b4MEt6A3mHzk1JXJWJylRHUmeJYSCKIxSnAbkteQvuFuU1zT4DH/T7cotWRKLhJMJtB+fN/vplbNbgufSWzVnIOftEHFi9rcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIjZDux1Xx02WLznYWrzLxZmx5Bs488C9xIr3arEYdE=;
 b=QLs3PWJpKaW7ArRDM65RJaq+Id4JDLsIeHspigMET+2Gd+cztrOn6GVs14kAkOoM0g7knae/4v57BpEihaUcYsNYcyf3ROiwtwTtyVw8CnYe5N0nkKP74MrQwgR/9M+ojsBOXwQr1LH2/DuKChs0nzLmS3592mvbthl1Epwiqnc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:20 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:20 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:43 +0100
Subject: [PATCH v3 01/11] dt-bindings: arm: fsl: Add various solidrun
 i.mx8m boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-1-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
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
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8440:EE_|DB5PEPF00014B8B:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f8e9ec-5ba5-45e6-9f8c-08de25d4f548
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZmNzNllKM21PaEtCVmxYVjRXOEVDYjAxZHl5amVMNW50R29OVk80YUFMcWR4?=
 =?utf-8?B?d20vWXNNYU5FMHpPNFZkaWVKRnA1cHMyT2RjT041ZzlBSUd0MXBlTjg0MjRs?=
 =?utf-8?B?QWE0ZTBPa0cxczhpZ0pGRWpRM2g5Zkhha1hITys1ZGNVUm9LekNyN080dkIv?=
 =?utf-8?B?Nkhqa29qMWRKR0J4SEdKalVOSWdHNTVKdzhIdWZzczRCZnQvR1k2emJ4UlVo?=
 =?utf-8?B?ZjhnYUordFNyNTBmUlRLWnUwSzRlQUR5b1pHamIrOEFTdmxJR04yaEJhNVNx?=
 =?utf-8?B?WExxRllaVGFOWHlJWmMxMjhmTDFKbTFUdlFHTWo3b1MrSVVadlhVV3VoNFZa?=
 =?utf-8?B?aFViT1EyUGpQZjFZTUx5MWRPRUU1T1ZNNVZRaDR2eVlHakY5RVBhOXZqbFBR?=
 =?utf-8?B?WlNwcjVUWkczMW1KbURBbjZUZ3Z2RG5MaHN3a1Nha1JCMHEyYXdzazVaMDJZ?=
 =?utf-8?B?UnA3U0lkKzVhOEtjNEZHUEhNSXpndlJ4V3NCTTh5VWVTaE9UTmIycHpCdTBa?=
 =?utf-8?B?Yk1KK0lSNVpDZ0dla3o1c1VhYUNBNm5iNklCUWJGVUZYa0JZbTF4LzF0WGt1?=
 =?utf-8?B?cnBvMjd3U1FIR1FvcFRMeXFsVC8zNnFkcHFrTy9SemRDaWJlaHdaSkJycGNV?=
 =?utf-8?B?anljdlZjN240cFV3dDZITWx3Y2ozZklTM0cxSnc0dU0xZVhmNkJoeG1ZUWZF?=
 =?utf-8?B?WmpPVVhWT25hZ0hpODhpZ0JrcndpOWVWUzQxOE1oeU1jWjNiaVpzcmQxNTZn?=
 =?utf-8?B?VDhpKzdpQ2VHbThTQldoa3Mrd3VWQW9PcWRWSXNQdlNLN29SNTFTbEE1Sllq?=
 =?utf-8?B?Qjk4VytrWmRNYSt0VWpOcDFtVUVEa005UDRoNWVtTXhYekowdDZVQzNZYlBt?=
 =?utf-8?B?TUJySlB0cXFjaVNnM3RMZ0lVTXJwU2VEMFNicEt5MXlIOXlHVlAxMXVqcWRG?=
 =?utf-8?B?eUJZNVJtaDVvYnI4N0Q0VDYyeGJ5alZFa01tSzhOcjFvMDVOUS8vVmZISVlB?=
 =?utf-8?B?UmlrVDFSaGRROEVUS1VTS05LVnV5WmJaU05TVWp5OEdsU1llazBuRWM5bFZY?=
 =?utf-8?B?UEgwbW9RSy9oQjljZlUyV2tJUWhoRXFVMG9sS1Rob3lnTGV3R0UzNlRVcXh6?=
 =?utf-8?B?eG10blZ0cTVSMXUrMkJSNVVaSEtieFduR0pLNEtVZHkyQ3I3aUdXdTE3YjZT?=
 =?utf-8?B?N3QzaWQzUmxQWURnSi9VeU4rcjhERndpRG4yTHJnaHF6YzdodGRXVVFTaUcz?=
 =?utf-8?B?cC95Y2tUYVZsQW1xeHRMdmxIWURtV2VPVHJraDZSYkowT29Zc1F3QWF2TEhr?=
 =?utf-8?B?ZktJMEttNmdBNzV1RW5tbDZReC9TaDc1blFVTFNKRHJ5V2lrM1ZFbCt4UmFW?=
 =?utf-8?B?Z3psczIvTGI3dm53dFdxUFlZWkVSOXFlVGJlbTRvb01NWmMvcE9PYUdreHNE?=
 =?utf-8?B?RnZMWk1RR0hxUjhSRVRFK1F6THJ4N1JuMVF4ekI0UFI2THF1bkdEb3R1WkN0?=
 =?utf-8?B?bXZiWUZWSmxwTFEzOWlrUldMQkZuWHdJUmwzN1BvNllEcEhiMzdLcE1OZ0FD?=
 =?utf-8?B?RkNBcFhmdVJacG40K2FXSUdpRi9zRmlsY0x2QVhmMkhnQmowUi9ieitNd0Zz?=
 =?utf-8?B?UzRmRzB2WVVjQ1htQlJiOHUxVmhhRTluRzZOYURweVhkalIwOFpvYTNoRzRT?=
 =?utf-8?B?aXhmTHBFKzF5L3NiRGx2SmhvRmdlWGpOc3VycTFxTDFmNXVndW1sYUQzNy9X?=
 =?utf-8?B?dms4TmcyN0N3b3NTKzVXaVBtSDcxVEJCN1pneW9yNXVIZ09UWGlxTmhFZG9y?=
 =?utf-8?B?TU9UcGZlYVc4WXRTWGtzaFpCQWNOQjc3V2luOXVhSWtIb3VxUjdzaDNCTFQx?=
 =?utf-8?B?d3hIbGdNR092WXJZdnUzU09tTDM3QjFaRlYycUhkWkM2SjZoZzIyN0tnRWU2?=
 =?utf-8?B?NGhHZCtvdjRpVDBFQ21DRHRaeXllZjZBaXRTQ3E4b0JQeStBU1FjNFM2L1FD?=
 =?utf-8?B?Wm1DakJISncrR0JsNkVCR0RpelpsOXpLRU9TamtTRGZEbThqbzFOUmtKZy9G?=
 =?utf-8?B?dTFZME5URXE4ektSUzVjTEVGRW1Oc2IwR2RPZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 09697e6ec7d04a95a6b26791ee2ac03e:solidrun,
 office365_emails, sent, inline:09fca8e80c423bdb7ae27f22f6ff2121
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 22be7fd7-b6e1-4a81-01e2-08de25d4eef1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|35042699022|14060799003|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm1UTElqcGJkQlY1MUk0dzErK3N5T2Z2dUo4bXVaU0dreDU2Z3h6SlBYeDJi?=
 =?utf-8?B?bnRwVVFtUUFITmZDQTlsbEZsZDBTN3hIb1R6bFBDZDBUaXV4WjRLWmovQlBH?=
 =?utf-8?B?ZXJxd0R6cXJQa2ZDOW85ZnlTV2FwbUgrclJwaDc3VlpnQTZnZEhGMUxEeXBn?=
 =?utf-8?B?RHBrbmMrWGR0ZVRpKzVnRW5MQndQR0EwSTJrbTZhZTYvekYzT3d3SHU3VUJj?=
 =?utf-8?B?eElHWFRlV0gzUTBGK3VycUpPMDFSTmVNTEN1UWwxSm9VVjJwY0ZTV2Y4YWow?=
 =?utf-8?B?cWllaWFRem85MGZEUCtnbU0wWUlhcnJoc1VNK0x6QTFpMlpnQ2RCU3F3OTNY?=
 =?utf-8?B?YjBaYklBckFiNlJtTVNXQzVxNVFKQjJSTTAydHFCWnZHZ1BUZ2VNajdqaG5x?=
 =?utf-8?B?cGU1UWVqenBFT1BmTGxlUmo2NEdQTmdESzZMN0FDTXp6UVdZS1pMR0VFVFlX?=
 =?utf-8?B?b1RGM0g4b0hXMjBMY3A1aW9HOEE5NW9NaGRGMkdIdDQyT2s0SnBqRktIcTd5?=
 =?utf-8?B?QXdsYW1YR25xQ0VkTkJ6Mm9qckIzQWRPL3c2ZG9kSVJKWSs0cnMvQzEwOEtW?=
 =?utf-8?B?aHZCNnBFbFh4OVBwTXNjdWxwaXhKUXJFL0t4YW13SUt2MlJad3kwZkJUcGtl?=
 =?utf-8?B?THZ5RnVBclZtckY2dE8xUUpWcDVqSCtIb2RWcHlMVWVCWGNiOTl1Sk5oNU1V?=
 =?utf-8?B?eFVxc3FDVFhzS3E3M1VjZHFQNGpEVmloK1FaSXF3OTViRzZzblZveXZXeGUv?=
 =?utf-8?B?YWhBV3VuZzI4czFRN0xxdjhGb0ZYQXVYVlJjT0JGRHA5NmhEN1pUeHRRT2Ra?=
 =?utf-8?B?T1RBSTFucG1meDBBOTVIbWFIVlJqZEd6ZHFuT2c2K29YZ21SMjJGcENKZ2lj?=
 =?utf-8?B?V1ZmZWJVbnY1c2FhK1Rod1ZtM2kreElJL3V5WG9KSzFXYWNZN0NwdXpQOTJL?=
 =?utf-8?B?cHRUZnV6cGwra01Fb0hmYTlCVk8wNmw3UDBUazZFcCtKOHBnL1RabjRvVmJk?=
 =?utf-8?B?Nmp6RUZ3TzVtdVVMSTJqc3B2NVNhd0JXRE1mVjVBeCswV0xoVFAyUG1YbytE?=
 =?utf-8?B?Yk8yZ1NjTjhyZ3RYWjg3VVpESzh6d3lIV3EzYUxnUy9IV0p0YmZ4M0o1SlJR?=
 =?utf-8?B?cGVVcVN1SXhhREdnM3pFSHRlTitDekhQSUtHdlV5TWh0K3JQNTl0WWV6OTds?=
 =?utf-8?B?bHlFQXlUaUNMSXJBaHgzdkJTNWx0MExLS2lhNHRFYjdNS1lEQ3gxNGFYZVVN?=
 =?utf-8?B?d0p5cUR0R1FiSk1Eck5kUVJMVGlldUEreXE3NDBzNFI0Yy84UzBtUThqSU5u?=
 =?utf-8?B?VXUzUG5ZOGJ2QkVRYUYrM0N6QWJpU3plOHBvUW5ZQVdhZ2RKZ1dkSXRsZTJT?=
 =?utf-8?B?V0o1akE0TCt4SmdZa2lLT2xHR25qTWNaSHJObXFrS0ZLcTVQbVNJZjkxTjNj?=
 =?utf-8?B?aVljeG90L2hIRExiRHhwTm5jMDN6U1dKUFJIMnZxMC8ybnJYcHRQcWJHbjdS?=
 =?utf-8?B?eFRRTnhza2I2cXprWnJ0WnJMRG9ueFMvWmI2S0lGUjIranZhVm5TRVMvV0RF?=
 =?utf-8?B?TVY5aWlLditscDVaVmVIMXFKSlN6bUgxdndRMWlmQ0c2ZGV2Tm5ONmNheWow?=
 =?utf-8?B?eTl3dCt2T3FoeHlVUU5MSDkvRHowTTZTS2M1bzJYMXBFR2M0K0dmR09wQzF5?=
 =?utf-8?B?ZEVMZlE3TmQ4RElkK0pSTUlUb2ltMDltWDR6cHdYWnZsc1lFZ3pRd1JjUnd1?=
 =?utf-8?B?ai9Jbi9pbUhFUytnU3RHY2FDeFcreUc0MDY1ZFJsVTRiWFdtWS9pZGRZdzFi?=
 =?utf-8?B?RnhSd2d4QlR0ZkhlR1RRR1pCSWhqOUh0VFljc0tuVUlZalprUVJRS21PMjRr?=
 =?utf-8?B?MkZCalo0RURuWndOZzl1RG8yTCt2RWE5bGJLTWk0QzEzUWQ1bzdDOUsyK1g4?=
 =?utf-8?B?N2M2TEJpUUZkYVVzWUxjM1lEOHRTTkxQNFZ3bEkvYTl5Rlk4MDRUVmdneW9i?=
 =?utf-8?B?WHZNVHlTRVdyaGNuVUlHS0Q1MnVTM3NCejM1ZzlhRnBVelhNZDcyS3M2dGNx?=
 =?utf-8?B?eDU4QTA5eWJOQWxuYVpZUGN6citMTUxjYkRocFNDOUhXVmFWY2Fjb1pWUDIz?=
 =?utf-8?Q?ZZvQ=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(35042699022)(14060799003)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:31.1231 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f8e9ec-5ba5-45e6-9f8c-08de25d4f548
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055
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

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..f70b933ce3746 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1205,6 +1213,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.51.0

