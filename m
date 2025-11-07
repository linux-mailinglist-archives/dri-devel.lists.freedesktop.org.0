Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55722C3FC82
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1310EA9F;
	Fri,  7 Nov 2025 11:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="e+hpkgyi";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="e+hpkgyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020114.outbound.protection.outlook.com [52.101.69.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B5510EA94
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:48 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Or9SBTGQeRbuY8SYM0/yCykrAsj1DXCfFNyGNAMIXTQOjLHjj9bZy1Uq4sPrKARdjTrPJ+zmtzhZmkf+2vuqAMQdEiebLOoZya7fpRM2moRw/HmwPTs2Qixvq2zd79BmLYCA4FInowLvOcbl1+3cbaDUte0hmLv1CdfvL0/yLeL4AMIYk1QBiGPrFqGgPfar2WV828wQAUxv35DsATQnhqGJVcy1cobMSEIHgBspsiAd5nYGQNhF0geA0+PVtAO+8Ml/8sIwGHo/cAWhHbHkU5WSTHVnDNWMEqpBqQlbBKzPq/rbofA3LKoU2H9yVLhUbt1UrKvNdU8lcxoppYLVmA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=rc0Js3GYM3JKTj65TBoqEC9ZtZif3rsAHit2jcGS20dboWcVITc7nP587Ex148z2Ivc9xI7mZVpeEdiIIHZXb6qhdU1QihakMZ2nWgJsW9/U77kerNhtc1G2VCvfs5ooEPEgc9nl0YlxN4m9kf7rGKUprzPZ0fSPs+XKLZJJn4IqnG8GgbroUhjB7EMi5gL7n+Ahn8VSAWcepvWlr0nmb3/GssISp7BY+p9yduuSEWntUAp8pEZ3C66lwPnQFNNSWdIzlZ+649Y0kwvtiGuWrMGueJKEGDpwqMeRQs6DzT/3u6NIBKE7CpsH3RUkq9DhhzyCFncO9dqArwaF0IxOzg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=e+hpkgyiwvuwWAV3Lkmhp7mel1SVYE16Q4l6WHif5LifU+s/MwckYByjX3lllyXuV7q2OCw5i4hqs2b9JveRocISnnCSBvcQnHP7DAGpNvgMfa9Gx6qyk4s213TGkQ1hOD+TZwZJ4/+Rn7T0KY/vyz9vwkDw5gvSMDm3EeaMODA=
Received: from AM5PR1001CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::21)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:45 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::51) by AM5PR1001CA0008.outlook.office365.com
 (2603:10a6:206:2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:45 +0000
Received: from emails-5359322-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-176.eu-west-1.compute.internal [10.20.6.176])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id C32007FEFC; Fri,  7 Nov 2025 11:46:44 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516004; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=dcVOwf/EPOwXTBWDsTab+VBpNw99D9zx9uFgFmmPDantPnO89VmD5zbSl62OjuhJNbfEg
 qmClny1RAeJM+aTyHcVRx58OSlbxPTWqIej6A6Rl/uAULh3cRayOilH0xjdx+R2feHGQ+Kn
 vxaDHTgmFX90s1bUaOUEoPkI2Wl4aCw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516004;
 b=pWqPbk7kHNL9XZyx8ho0EZwB36wkNFhJ6VjLivK9PL7JPOdVtcE6gnZLtPsdbuOhH0xH6
 PHUak1SUPDbHIqf7UaSFX/gC7893wZ0nio2RQ94nvzeBTAvi45gdJ/h5J6NpWYx4OTPpDTv
 gg11BhZtlsrew3kFqjZuGd4OLqBNSwA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhAc32hJifqR4MfxVrOGn3FK9BCPkOWA+TV+Od5LlZMKPYJ9sLRhm7ENGkODMlFU4skwGHs4v08rBemD+gWWVkKJu9YDjknKBKwrpzVxDh5fvC1L1YdoxlNGwujUcSGdJN/DxnNoLToPZuKw15qt7AUUR74VkxpiNRmWLMXbRl9vWDBgIVATbIe5MA4BBIlj3/7EelpSg9atmKxDjXOiUW4+iR9X/KGhLkWK1h2xlG6QCiBwnmqEdht3wLZfUK9cL/dkc/GFBxsGgFOQumr2xNIomQCce3RaEVNlzNbEbTiwSYKYPGwSvgLVY0khErmmr2AHq8K0WxZGSp3mB7634Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=VAS9K3ZyND4emQ8fcIJtpikViH791FPk0j6v5dvh4UPcf79g8kc/JFtSZ/qIRO5Z82puZAeF8au1bj5x3GK7xJLO9pR42QwruJCKksjWNpKM99HPl9TYIaP/5eRAYylguE8r1z8N7/Z3dZjdgj9kuSXBXlM+eX5ABZ64SzNKbgXTc29JNQYKkSF4yEV+h/A6sSkZ3IrlOWLXCVXlhJTKtkkt/9Jd8XYa0JUS6BL03j8hwEZ3YrUyAgXrpmSlxSwj+IEHxyMPt1YYI84m2dP4XqzgUbjS6HH2cS7swcg5VXtjmniYRQ/t2JEJLr9O+X0qc8Nd3JXD7OKFpfaO0hagJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=e+hpkgyiwvuwWAV3Lkmhp7mel1SVYE16Q4l6WHif5LifU+s/MwckYByjX3lllyXuV7q2OCw5i4hqs2b9JveRocISnnCSBvcQnHP7DAGpNvgMfa9Gx6qyk4s213TGkQ1hOD+TZwZJ4/+Rn7T0KY/vyz9vwkDw5gvSMDm3EeaMODA=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:36 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:36 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:14 +0100
Subject: [PATCH v2 07/11] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-7-d8233ded999e@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AMS0EPF000001AE:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 590b9648-5562-41dd-6675-08de1df353b3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OGh0YkpLU21LekoyTTFodVh5ckhETm9oaGdFYURaWEMzWDZINlVFKytBdzJz?=
 =?utf-8?B?N3ZienMyWnhlSGFhRW5CNzI2VWpna2hIbUFRMDBBRG1HSFJ2ZVE1a0VUTUJS?=
 =?utf-8?B?NG92TGp6N1VPcms3M1NkM0FPM1NDRzNQSzlGazNQWlk3VHFsRXgvTTZpSjNW?=
 =?utf-8?B?L0ZOaVlXTFlTSFhBcTJHTStkQzVBZThBTWhSRlk4UEFlYnRKU1hXeUtjcnFF?=
 =?utf-8?B?RTFUWXlTTDZDMWRsV3NJMGI0bTFYNXZ0Zy9qT1lsTGF4bEdZSG5sUit6bkE0?=
 =?utf-8?B?eTd5Q2cxL0JvR0hDTzJvQ1lQMGdWVktaMVpVVXhKbEtydU10eVJsanpiK1Er?=
 =?utf-8?B?LzNkVXdWRTFRK3ZENnBzK25zMVlpT0ZxSk1QZ2p0cEFoSXdVMXVGVzdDMFBP?=
 =?utf-8?B?em5lbVRSeFpmQUg3RFdzaWwxNVF1TTBBbDZOeUQwSjdBbjlnM2wrVXJjdEUz?=
 =?utf-8?B?VGdiMVRMUUhLL2RPLy80dHlYSkt4YnZ6S2dGTCtyNk5YTkxZK25wQitxMm5i?=
 =?utf-8?B?QnBwTlc5MVZpaEx4aTJuQ3ZWMWRjRGpkdW1tbWVYUC9MSWZHazVKTHhQb2RW?=
 =?utf-8?B?dFJVM1dhZmhHZE53cjlMTkZNVG02VDdvK211TitOWnp4MjdxeStjaE9iWk1T?=
 =?utf-8?B?ZFhmNWxtVmRIbUpydno2c3JueHV1MjJsemxtcmpiMi82bXk0VnFPZHd2RjNR?=
 =?utf-8?B?R3hQVGNKbUt2eHUvZlFKRXNXRlRhcTlIRmVSdjJQbnEzbVprWGFvWnJJNUxo?=
 =?utf-8?B?dEY2Y2lEM080M1BmTEY1dFpjSGNhMGxwc0hHTmg3dWtwN1Jwd0o4eUNDYTJa?=
 =?utf-8?B?aEZFR0xRQ21uUExyTkd6OExRMmNSbzJxY2Fhc1NxTmpORW93NnlNeUdReXMw?=
 =?utf-8?B?dzc4SlpBRGpSRmE5eFZISC9yWVc2dHE2eHlkbWFObUpvOUxqa21NNFZGZ2ly?=
 =?utf-8?B?amRMRmh6YmRyTElrNW1JUlhBYmlCV244RlN6KzZFc2JmMXpwd21NeTNTSGMv?=
 =?utf-8?B?V1J3bUJweGlVcDZ1TWpvM2YzeUt3SWlJdzlEWTRxakJRL1haRTJ6bzVGRmxr?=
 =?utf-8?B?bzlhRWx4VGdJUWpXbDgzVG5aZ1dhZ0l1bC9FcS9jUWFkMmdIKzFLN0gzOFVQ?=
 =?utf-8?B?Kzg1WUdpSzVma3h0c0IwN0hGclFldDF4RVRYVDR4cW10QU5pOVFqVnczbjRR?=
 =?utf-8?B?YmlzOFhQdEpWT2hNYVkyK3liYTVkY09VbGpxcjhUZTNqYW8wc2NiQXNKdThH?=
 =?utf-8?B?TXN5QkplNDJTOUdvNGMrbnFYcTlNNzRKeXlvSzJqNVVtemUxOWJMOUhUSi9M?=
 =?utf-8?B?NEVPOG0rTUxZWnd6ZDJWRFk0YTlHWlRDQ3EwZWtYL3QvY1J4YUFCdGNiWlRo?=
 =?utf-8?B?U2I1SzZIUWNLZSt4cGwvSUdobEJqYUVYUDV0SFhvdXNJT0EvSzdxNkhkWFJq?=
 =?utf-8?B?a3RCN3Bhd2l0cCt5K2hPVnVlalpSQlpEZXE3SnNpZEpJa0cybFZhbHpaY1dG?=
 =?utf-8?B?YWdGSWdvZ1Y5dWVPaXJkSkgvL2REZjRZdEd0S0QyRkFIWFArZkpxWFpzeCt6?=
 =?utf-8?B?S3dZdmxOSVhyYkpUMStwUmVudGJDNkdRZ0RMK0tXR3hZRFNMdXczVWFmNFpz?=
 =?utf-8?B?Yi84RHprZGIybktwc2lWQS84TkxOMmJZT3RFdzhRaGduLzhBL2NtYlpLeXht?=
 =?utf-8?B?UUJxeVQ0a2dRR245S2E2TFU1MXNsSTJtV1hiYTRBR3NENS9TT0hKdjFjWStt?=
 =?utf-8?B?cnJBM0xpUWtmTzQxdlFVVVNnbU03Ujdhd3RkTVRYdkJmV1FLN3hMcU1KV1hI?=
 =?utf-8?B?RG5EOTEwQk55UWJZeS9JaUFqSUUxdTlhajJvOXh3ZTJWWTh0dE1yMm5WMFJp?=
 =?utf-8?B?UHAzeTVtcGwzdDBFUllEQ08vNjh3MkJNWHY0MUVxWTdDa2duNnJDeDFXQ0Vq?=
 =?utf-8?B?cERJazdhN2F6OVpBUTdvYnVyRVFMSmdzdnFYdFkwNW1zbmxZVEpiVlhGbk1F?=
 =?utf-8?B?dXZ6UFRlYnp0NXpaZjc1THdVakg2NWxiOG9YMThNWjZvdThIN2w5RkRiQXJu?=
 =?utf-8?B?R1BNQ1RwOWlRZnJKOURaZDNaTjU4UjdvV3V1UT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 866e4a7975d241559561e67dff11c5b5:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c8277b20-59f4-4495-559e-08de1df34e5f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|1800799024|14060799003|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUlOb25URjI0WVdWbG9YbENXbTRhejVOa25mTG9peVl1WDdudUlSNVNjdW14?=
 =?utf-8?B?VHV0cUZ5cU5sdmkvRDBoWHhQRHBIMWhseDNWQ3JMS2xvOGQvKzhwYkQxWGZ2?=
 =?utf-8?B?SkFSSWxScXliemtKa3NJbE1pcm5ndlY2R3prSEZabDRwVVRFZ281YjV0SzAv?=
 =?utf-8?B?TjZmR2xJazFPVDFmVGtsNVlRSStDMTR3UkFVcENPYmxiTXg5VkFOL1pTbjRJ?=
 =?utf-8?B?eHRULzFSV0J0TGcrbGdDWHFvSU1NNUozUkxmS1pqOHNla2dmZkFiVTJQbkUx?=
 =?utf-8?B?U2ZBcFhwdWhiNERVYXZZY2Z2WmdrLzRGVTJOb0puZ2pCVjQ5Q2lPSW4wZG1p?=
 =?utf-8?B?L2FDOUVmenNwWGhVK3RrY21qMU9lZy9EU25lVGI1c1VLZ0JkQVh0MHA1Umlp?=
 =?utf-8?B?SSs1K1k3Skt5TmJLS01EUWlCTVZ5NTM2VHhRVEJnSWpBcll2blI3VHZhYnJ1?=
 =?utf-8?B?U0thWG5DT0pXaVE0d2NuSVpFckNWb2QrLzhvRFlOd2U4eHNoMFIrMldSeVJx?=
 =?utf-8?B?Q29ORUNWUHBFM3BQRzcrSFd1TklkNE1jYUNnV0g5MlI2QTZKZDZXdmZaT3BG?=
 =?utf-8?B?aUFWVDZuRTl4SE9kSmRuK3orWGdrZS9JclpoUnNQMGVvbW8zV2p1Z3FLWjBa?=
 =?utf-8?B?RDlxNXJIS2JqTzcvVXNhQS9nbVRqdy9ucldWZVg2M3NFUmYvbjVURXlJeXJF?=
 =?utf-8?B?emU5bTh6MU5RMmJseWhnamNac1RXaUpSUkk5ZERUYk82MGcwSUR1S1FDMDBn?=
 =?utf-8?B?Snc2THQrSi9pUGRBZ0pHeVBaTEFwK2JjQnd6MWhlN2ZwTEEwYWV1UXI4MHk3?=
 =?utf-8?B?UTVrT0wrODQ0MlZEUitTVlBySjJuaE91VmtBdHRLZnRXTlp6RSsyWW02MGps?=
 =?utf-8?B?UzJFR2h4TDdGS1lObGNxSXNuRmtzRWlPVE5HZG1YVlFLNGRIVjlNWmtnOUJo?=
 =?utf-8?B?UDI1M05XYkltODdwRVlJVDFjYVJJSkpCR3FYcmN6SWV0V2hZeFpFUEtCN0cz?=
 =?utf-8?B?ZkFYZHhGSFBvbUtkRm5oQ2RUV203Z2R2NzZ4cFV5d2pyNDE0eWtZZ2tJTmR6?=
 =?utf-8?B?dW5IZUU2OS9Gb1o3RDJhMDNWQ1M5aThsaU5NQUV1bmtIOUxwZDFRbUs4bzA2?=
 =?utf-8?B?TnlCeG41Nkc5MzQwa0RtYVZ5SndVSi9nTGhrdkVyT0VMblI2V2IxNHJ0WU5n?=
 =?utf-8?B?SzRKanpIUmwxNmNiMEc1N0NKUnVUaDlzODF4OTl6WElSd0lEZ1F0NUQ0TU00?=
 =?utf-8?B?Nk1Xek1VWm9USFVORE01YnJiSjVKOUJqSjNnTW4vQzJRbERGL2tFT0lvc3Np?=
 =?utf-8?B?aThHNUl0TzFJaEZWUjhrbnNKMWZrdEJadU1DdHVDQkVOelpSNUVHcnZ0aWNa?=
 =?utf-8?B?aC8zcVFmNFJPMHE4cE9EM1Zza1FnUExNQzg4ejFSU0g0T0lpNzJ5NnNBZGUr?=
 =?utf-8?B?SHl2SVIxYmZpQm5DZitXdFFLSlJqTEI3K2hOWWRVYW9PRnVMbW5jQzB2TVdF?=
 =?utf-8?B?NVVWWEVyVlpEOEFGUzJWOHF4UnpnWlhoM200emRISmkxdjZRakhKc3BjcGhS?=
 =?utf-8?B?bm5rVHFGaTZZSWpQUWpxallOU2JROUJoSDZHZmhCMjZ5Tkd6a0QvY25RdDdZ?=
 =?utf-8?B?WG9NSDl4ZnBnN2JCUU9PVkh4L0tkMHFlTFB4RTM0SWJWd1NucWJHci9JRU4z?=
 =?utf-8?B?ZUNQYmFQdUpuRXE5WGN3RlU4V0ZWTG1LQU1Rampud2R2NU52UzVBODB0N2RS?=
 =?utf-8?B?YmFjeUFlZW5GaURHRDBRMjI5SjVjaXk5VnlvTHdNN3lnazZIS1gybnNaMmRv?=
 =?utf-8?B?L3ZRa2tZVVNhaGRBRkFqOE9iWWpsbXVnbldKS2FRc3d6U1RiQ1Y0eDNWbUlt?=
 =?utf-8?B?VEV1b0M1UmlRQU45eExIazRMNER5Ym1mYlREUE1rNFgrMExaeWxVdFVCNTY0?=
 =?utf-8?B?Rm9HMWZrOFJaa25vb2JDMU1HeUpWSkFiTjJIbkRsUXcvUlJLOWNpYWhBcFZV?=
 =?utf-8?B?WndxU3NhZHBEUUtPUlN3dFQ4QmlhM0xJRVJEZHpHZVhCMDhQbCtlTzhkQmpK?=
 =?utf-8?B?bFIyZjhWNTBCeGdOTUIzVmxmR2tzZ2krV0RJMThhWTQwVWZqTGtZZzdGakcz?=
 =?utf-8?Q?BF50rHy8IA0SqmyKvr/Ra0Xs4?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(1800799024)(14060799003)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:45.0819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 590b9648-5562-41dd-6675-08de1df353b3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159
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

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc05335..0e5f4607c7c1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.51.0

