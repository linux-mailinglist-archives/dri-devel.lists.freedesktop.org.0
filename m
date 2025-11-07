Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F96C3FC7C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB210EA9E;
	Fri,  7 Nov 2025 11:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="ieIkmQhQ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="ieIkmQhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021089.outbound.protection.outlook.com
 [40.107.130.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3843910EA94
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:50 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yGfIVlrIYYHNdblSZRfs/Hc7yqvNugSZYSp+wYeUPtD3gxoZa/DDv/tFwKaqCq/nik5rXxl8VFImsm9FUD/njAkmlA8lNKMNND9VlqgI1cXZU/XVbCaOq2ylBZW4b+9zGDqiJB4VTQQ/ZWY/E8GYndHtL/lHMM2p/gK+q7owWzc3bFepI05ETv4wEuMVEZlFJP7Dha3rWCXjLDexnrjXFS6zVbXM1iJmQpWlI2Ggmpu5ZzPHcntj3JQrksaUo3QgKJxHvhX2WQX9/Y8ZuBq3EfNoq3Pi5gwY5w1+uVY4r0oqEk/0/a+ciNfY37C6P8Q0D57lJJDHzZ+0b2PgjaSO3w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8YhyVPqvGqN2y/OPTPKhNC/6uBT9xdTQA6+cdTCWZw=;
 b=BARwBDg2vaYAimLgS6XEc2NqADm05N+4ag/IW3IpVwKMqAWoTQ5coY5BW1tFme9me0CKBHsJSaEhork+HWkoUbMqndxa0cYhJQxDku7JIVpwWg2KcX/iivR8Iu04Br2Qy71cMq0ez2kMmW03dGll0efGSemFkXy4x1Z/NnTzvf9NSbzGu08nEhT/EB5L3Vs3kMjs7TAl6XESUtYNX0418Nz3XT/TJ5Uk4bYP4GKicLZuOCyIcr9/O3CPdaTAmTKx1UOg3KbIPD6PSTrZxt0NbL6lyr3ys6kRBPDa8+XwFZ67u5WmZzjwwyDOoWR+xFIeFTN289yTap8lwplblaJLDg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8YhyVPqvGqN2y/OPTPKhNC/6uBT9xdTQA6+cdTCWZw=;
 b=ieIkmQhQ47gDU+JyKBNOUxR0Wx6ziqhjlIBeBfAE+9k1yyrRhNUXLWgNzIjMs5fp7ktZSroWOgBqvDfR5u5NLBNZvR/5XOkMoUdWVNKzNEV8pBYV0aQVtAZnkLJ/7AV9DG0dP3v3n83dEodL2ef9VQZp3bY5kF8emiIA44SoAOE=
Received: from AM8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::7)
 by OSKPR04MB11318.eurprd04.prod.outlook.com (2603:10a6:e10:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 11:46:45 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::a1) by AM8P191CA0002.outlook.office365.com
 (2603:10a6:20b:21a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.10 via Frontend Transport; Fri,
 7 Nov 2025 11:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:44 +0000
Received: from emails-4647514-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
 by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id B8C468065E; Fri,  7 Nov 2025 11:46:44 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516004; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=+8YhyVPqvGqN2y/OPTPKhNC/6uBT9xdTQA6+cdTCWZw=;
 b=EvNEooFTA39dvg9OsioNPW+HmP0ZGIxeseBGAtotriMzEbAJ1CaEjAIA4Xg/V2sYJszc4
 X3F20Q5NUePAK8Lmu01xQaynsdw5064Pl+hWsU2dxsfirH7XIT3LiJ8erjMIccVnctq8I3/
 HbkW7DTHhm38y+tMHXv3gxYh/Ytowfc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516004;
 b=FTS8DjOD0Y0Sniuuau+wyRTb1zG4F8ppggHrYNQwQJbptW38dTOpsC6+SfAtPq8OwZu94
 8i8oRqm54varo4TU+r84xj/W0o+UQZ5YQ4iGPRXIlrn0oQa0Yr2Qf9y3kbDrwXXperq/0Hr
 +B3N35OYgvsROPEabBSXw1RXyjiMVLM=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkFYMvRfHYW+BrhZcoVjVYt2f8UOx/8wTbkOxYie/Ms6E8w6GBVSS2A/ICzuO/LaIIOxx5pElu0NLhZDm0JTT0xItOABqeTUm6HMyE3ZQQaNOaukGXhgzUJnvXiwU6Fe+dQ8C0dpGtL2xHVDprl9ZVM8XC46+hNm7bdLZFvgiJlNLhn7z+dBGPlplxqnfYwFbeRqUXJUG0kHYTStTCFnm9R5z9YyXpQhEngmyrEWwhBLHkJ6u9LHJFqO/g4V0AjjFXjnRMY6c2WrAuo5bod/leEillDNOagYvo0sqtWpgg75Y3cjFFeoLKJN3ip5TAZSCDr+dOApCXZUtbzLDjRTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8YhyVPqvGqN2y/OPTPKhNC/6uBT9xdTQA6+cdTCWZw=;
 b=AFq5PYidMWprk0mlCaP7vWSk1oOJS1AMU+KsRVIh5G/8sLGL0xZSfiB1Vz4QUG3DBR07tk9Rke9C92xU4UXoFagz2lvqzACZkIwAwSPVZXn6ADQCDuG/1YL3sRKQOCOINuwJiWDTgH9oobtKy4OoDfhsje4sR/GUDKrPniph0m7mKXf9eqYetFEc/3HhMB6nS7INpvjBIzI0IPHTjKYYVvp/uxWzvaAUio3qM2QZ/pTX/XZZ0Ym80xSlODTisIWSIaFd3/DXdJ/c2PxgJFWCAgMwbAJYxeTlCykWPRcIHxaBiDn1ymUbY0hN8l2WkrxPsjQdvvTHgDyX7No1QhIjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8YhyVPqvGqN2y/OPTPKhNC/6uBT9xdTQA6+cdTCWZw=;
 b=ieIkmQhQ47gDU+JyKBNOUxR0Wx6ziqhjlIBeBfAE+9k1yyrRhNUXLWgNzIjMs5fp7ktZSroWOgBqvDfR5u5NLBNZvR/5XOkMoUdWVNKzNEV8pBYV0aQVtAZnkLJ/7AV9DG0dP3v3n83dEodL2ef9VQZp3bY5kF8emiIA44SoAOE=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:32 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:32 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:10 +0100
Subject: [PATCH v2 03/11] dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
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
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AMS1EPF00000041:EE_|OSKPR04MB11318:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fda6c9-e2a9-4025-2c04-08de1df353a0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SUZ6anZteklKV2lWcThaMnFJZ0xBT1NOTmp0b2I3Q1ovQnNiUnVzeldxbCsx?=
 =?utf-8?B?ckRUUE1jSDNUWm9iUVNkRXJlN08yZ3N4bXVMNXRsQ2VuVmZkdWxCbFN4RklL?=
 =?utf-8?B?b200ZzM4VGlRdTZjRmpoelBCcE9WTzZGTVpSQnlBUXV0TFNTV0xRUHhad0VH?=
 =?utf-8?B?TFFvbWZ0V09udGlhT2NJRlFGa2UwSnp3N1REMU5qc1BRVExCZlFBWFBGNmZt?=
 =?utf-8?B?NmZSdjdraWN1RHpVRzFGRDlRbUZhVnlXamovQ3pVNUc0bE1JYlowdm9YV3BB?=
 =?utf-8?B?bVh0a0Z4UDdYdjhVdlZUbVRNMVVxMkFsU2xGSDVoL1BPV2hWRjJTNmo1QTZO?=
 =?utf-8?B?SmdYOTZWSGs3bGRxbGtBaVFEeWNJMVhtUXJObnpFakFBRC8vNGhJblhXSEpU?=
 =?utf-8?B?MjRQZTVCcjFTR3AyZHVJN08xT3hmeVVDNXRnZ2ZGK1RzTVRLSlFsUFBhNm8w?=
 =?utf-8?B?YVJ3UzdkMnlkV2F6QTNxVGNlWGJhVEdncllJeFh1YW5GczBRR0hyNFVPOUgy?=
 =?utf-8?B?Q2VkUXpldUZ3cHdsbllIMHBjM1FoQVB0dG1pZjlrM2FKR1ZycUJJK24zUElj?=
 =?utf-8?B?ZGFiUEZ4dCtlRXRSQWx6R2pESGgyYmlSKzNZSDVKa2c3Wk5ndlFQUVpVclVl?=
 =?utf-8?B?NlNGaXJCSFA1WGxaS01oRS9seVQxdkdNc1hwZXBwZnhpMWNMdFN6bmh4SUJ5?=
 =?utf-8?B?YzFVRmxzWVRxb1hkbEVLT0Y2amRlSzV4TGJYSjRKOUp0Nlcxd0tmVG5GYVgv?=
 =?utf-8?B?a1Uyc0s3cDNPWEtzUlFyMjJHcGxVc1RmSFRUb2RMSUpZSlFjS0JyOWc5QlVU?=
 =?utf-8?B?QU13RW1MNlozNWp3VTJHVmpGYk9VQmdvTnJmUDB4VWlPdHFja0VKR2dXWStt?=
 =?utf-8?B?aTJYZ09EQ0hCUGw4d3lXbVo0WittVDhaaWRXNDlVVHo3NG85b1c2cUp3SXgw?=
 =?utf-8?B?UERGRnlpeVd2M1RGQ1lCT1YyTmhySis2TDZrb29JQS94VEtqZmJQMDU1UlRL?=
 =?utf-8?B?a01OdXlVMllLM1NhM1cwZDBUSEJoMEs5Mll1V2lqMzlSck1Ob0hjcWppTy95?=
 =?utf-8?B?Y1NlbEpXTktYZytiNTd6NGRMSG9SVkxMQmlSSUlmTVd6TXFUMlY1WkhrMng1?=
 =?utf-8?B?RlgxU0NUM3R4RnJZcTM4YTBRdXV4enErZGcrNU04SlBCUG9FU3hadjFnMVZM?=
 =?utf-8?B?ZHdwUFNTT3lQelVldWF2WTlVTFlkWEI3ekFJZUhWWW1IVVc4NU95OUZYUG9o?=
 =?utf-8?B?TVlJaUtlUUUwQUthdXd3UXpnanZyWm9VbjloVGhDaUtUNjBsVFRrZ2N1a1N4?=
 =?utf-8?B?c3p6dUhBdVVpUU90Y3JsSy9nREVla0RqR2EzTEdFVUlKdDNlTWxBdm9pMWNH?=
 =?utf-8?B?dFdNZ0VtV00rL1prYklFR0Z4dnQvN1lyK2ViQkNRZ0hoUkxlT3F6NTNaUTRY?=
 =?utf-8?B?Tk9nN3A3eE4wOFJtZFJXNG9lZU1VaWthMDNGRzRSK1JCSGo0eWVUY0F3UG80?=
 =?utf-8?B?M2tQbmhtd1ExQzRFRWV0ZkhlWXNJcFlLSDB0RDFGbkdWejJua285cU42WHdy?=
 =?utf-8?B?Rnc2Y05PbEZJc0ZlMjdseVNuM3NEalMvZmFaUDFqOTNCRkJCOFRJSWhkRkMw?=
 =?utf-8?B?cklEMFpFZHVkenI1ZDFnSmRiYnphaEg3TWF6WjFTSmhnUGFyTzZSbytnN3R5?=
 =?utf-8?B?STEveHA2TURpSFR1eEZqeTlWTGwxa1NCN3E3YW5UQmN1TXZnYzlOQjBOekhT?=
 =?utf-8?B?VFprOW1sU1dmbnV1ejc5M3NPOStjbGE4Vlp3d3pSSmhBZ0VnYnVhK1Z4Vmlv?=
 =?utf-8?B?QndnL1YyUUhJdXkrKy84RWRVallqZ3dqU3Z4MDAwT2RsSHBScUVNN3RvamhH?=
 =?utf-8?B?OG02OE56NEUvMjNpUytsMmswOXF2MklkNUxqdGtINDZwRUFSR2hLUHoxUllX?=
 =?utf-8?B?Mlh0RytLbTNsbEFPNkhGUG1jMktyVi8xeUhnUjBqWVdnandLUmdOdTFqVzdR?=
 =?utf-8?B?MmtKcHNPUTJhNFo4d1FPOVlBK2MyMEZrNzh6U1J6cWZJdTlFZDJqTk1nd091?=
 =?utf-8?B?ZWoxY01kbEhZUmZvdlJNRnNYRVlZOTdTYUdjZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1d8f4fc546714c61a90427cb719c8d22:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b5bcae5-75d4-46d7-301e-08de1df34bd5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|1800799024|14060799003|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVp1SXM1cVg1ekE2T1lQdGhUWm52cExIMWJLTTM2ZlhDdm5VU1RVMnNSeGZH?=
 =?utf-8?B?N0R2TncvL05tL3VzY1FmT1lMZXlISHpZdHFmRWgyK2xMMSttemlobWNZS210?=
 =?utf-8?B?ZVpCbFI5UXZyZ3RDUW1Mc2p0VkZUdEdEVXpCSGVrT2ZCekJPeUptbmw1OHJZ?=
 =?utf-8?B?MExDKzVDblppS2JMWk5zUVV6ZWxyY0JRcjN3aGV5MEY4Q2Z3Z21sYjVNVUNP?=
 =?utf-8?B?aHhIcWdmcjhacHdKSGlzd3pON0ErZXRTcTlKZm1WSlJVWXlnRnIvL3Q1dmtZ?=
 =?utf-8?B?OEVFUVlSd0xVdnhHcjZqMUcwMmtJMnBFc1JUQ29rWnhDaGZPZ2VSc0RPYzdp?=
 =?utf-8?B?dGFvQlk4dmNCU09kVkVhZ2dIb2ZEVXV3ZG9uQlJyNmNveTJlUW14bS9FdE9Y?=
 =?utf-8?B?bGhvQ1JpR0YzSWdYMnJzQm5rdUd1Z0E4RmxIUnNMQ1l4bW1waDBJWHg0SXJ5?=
 =?utf-8?B?ZkxabjhvVkQ5ZWQ3RFdaQ2RoTHhTSDFZMlZRSXYyeFVFZy9aT082NmttY0d6?=
 =?utf-8?B?K1pvWVNpYld5endHTEdqM1YzeGlTY1c3bUxsOHlnOFhpS2ZyaHl3YXRCYUxM?=
 =?utf-8?B?ckF2TWVnci9IY0V2N0Yya3F0VzE1NFJyQkFBSXFseW1mbVpObFFXUkRQVndy?=
 =?utf-8?B?b2dRNnYxSEJDRkpoRnBBeDJkeFl1NW5mK1owbUhBYlpDWHBUR3pnOW1YUk1H?=
 =?utf-8?B?YzN3OEllZytyYTRvRG1Fb015OVlhckxNL3F1eC9oVDEvOXhtS3QrNE1McWUy?=
 =?utf-8?B?cW5MbWhiNEVpa0FabkR0N3VKdDVUSlAyMDhuL1FaZFA5VGtsRHNHYjgzcmpZ?=
 =?utf-8?B?ZWxUYlYxSDlIU0hQWnA0Z0pwQ08zbkRKdGlOYmgxbTVzQXMvNVVBMk9rNHY2?=
 =?utf-8?B?ODE5QUQvVldab0hyMlNxWDNhZjFCSkxvSlVxdlkvbmRmemk2YW9jc1VCZFFB?=
 =?utf-8?B?aHNEOVdLZ295SHd4amY1SmFiN1JQWFUrb1pQZ1ZuNS9LbStSYU8zR1hFOFJW?=
 =?utf-8?B?RGhET1NGZytOQTR0THZYYkdwU0EvY0RTYVdkWUQ4OE80NFI3bFcybmNJbkRs?=
 =?utf-8?B?cktmZ1hkU1dJSVFQUzNrdm51bmVSZHZZeTJXby9CQ1gzaUlIeXgzQ0YwcHJx?=
 =?utf-8?B?ME1IOEMvRjVVenJpUGtCQWJIcUZtWldnSVJReVIzY01FL2k3b0l0TTFqNzlz?=
 =?utf-8?B?aGZ5Y3FUSFRLRXdiMXAyejZsV2pZajVTd055cGx5UE13R2NYVUJCZW9VVnpi?=
 =?utf-8?B?Q2lvaWh5QktjNlJDOU9hSzFkV0MvY0tnSmlZbnREaG5HYXpnRUluR3l0QlNp?=
 =?utf-8?B?Mk1LTS9EZEVEVURHZThzOFlPcnhHZ1Vua1d0OW1rR2JvS2Q5bk5ET3dnajk4?=
 =?utf-8?B?U3hCVmx6YzA5RmxHWFVVVXRUU2orY0ErQXNQRFh0QTNoaUlnOHlCajJyejAx?=
 =?utf-8?B?SHZaK0VuMjExWUtEOUhIVXZBQ0llckFucUFjc21NWHpKaVI4aVpuOG0vUG4y?=
 =?utf-8?B?Vit4eUlTYzNOb1RUTmd2aGdkWjRUWU9sWXp1VWdSdHRTWVVwbFdiVHl2Tmdz?=
 =?utf-8?B?TXdiMW41b0o3ZEFqT0NFWjJoN294SUxZNndGOHpiemV3M0hMRGlYY2hpY3hW?=
 =?utf-8?B?dUlxOTZUWXdOSnArWnlCV3B1TW1TUWVnajdHaXdldVMxblA3a1ZkdlhoSlQ0?=
 =?utf-8?B?NWJ6bWpBbnBtZFY1UWFkOWlxWll5VkI0bVU5UzlTSnUvclhLVW1abXNiV2dv?=
 =?utf-8?B?QmxHSmNHYjM4S01XVnlzcGFoUUFPVEdhZFhoWUdGU0ZrMis0VjdXejd0U2tW?=
 =?utf-8?B?c1VSejNCZmpBamxETlFhRzdscVZOeUIza1Y1R25hREUwU3lCb0lNb3dNdStm?=
 =?utf-8?B?L0JTbnhHVEZGeU5FUk9zYWlmMGI1a0kxaUt4UnpKZ0JUVmVKd1dxQTdZRU45?=
 =?utf-8?B?N1RCNStjY2ZCdXlOcUppdld4TEpGZVp4ME15c29oa0luQlA5dnMvWUFxZU1h?=
 =?utf-8?B?TDNTeG56TVBFenBaQTBESVMra0JMUDY3R1pSb28zazVDdXZ6bHN6eHR4S2Rr?=
 =?utf-8?B?VHAvOHVjN3VKTVVzSDd4TVNNL3NxWVlRc2ZlYzVucit5SzJnbzhQV2JjQjlx?=
 =?utf-8?Q?rkW06WqjOmpVlhgTqdZT/G08T?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:44.9485 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fda6c9-e2a9-4025-2c04-08de1df353a0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11318
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

Add Winstar WF70A8SYJHLNGA 7 inch WSVGA lvds panel.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 4388d5375851a..dbc01e6408958 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -59,6 +59,8 @@ properties:
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
           - tbs,a711-panel
+          # Winstar WF70A8SYJHLNGA 7" WSVGA (1024x600) color TFT LCD LVDS panel
+          - winstar,wf70a8syjhlnga
 
       - const: panel-lvds
 

-- 
2.51.0

