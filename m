Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D93C11AF1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6217710E567;
	Mon, 27 Oct 2025 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="aLj2d6Vx";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="aLj2d6Vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022113.outbound.protection.outlook.com
 [52.101.66.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EA710E539
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:45 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=x2twOmATK8f9NkAEOdqnFG6HBz3XZy8wqUu6PxquloDbZE3HXJ1Rcuj5nr46rBUmn9Cgq+DH3rzCVkC/ji2ZrlhH0lCmDL7iiy4d04J9Ue5gmlJ7qmgBEkT42DpfPiAYD87MAZh7ukcOC20ilh+ZgvOn0vQ/JQY8yGHGFC8ftxmfQV4f6iePr8k/7DBaqM06Lror3slHe9CTQLNDtHnSgcaXDbFbCDuHtXKH3CNoYRXWOO1/qPIHiPPe/IPIgNVHBkwOVYbwVCDimtZudD70uL1KsBYNsK43Qen2mbr36/KsPWxNh6mcgOrMJiDR1dBn8tcDSxmp2sgA1vItZxmGCg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=Vk05Fgj7H0LPcy41uew9ggY0vEobexJlX5zpQPBWvQs8nX2wVyzzWexiB19FS7gpkDl7DS8OUve6opqIShcT9In2jDS+H8qDuvdvrUeV8pO1qBe8Ro734U8N1qJlfF6hM7/syJ0oUX7Q/F6OcfcvUNDzYe4JNjzzQd+yrnFun/NS3Mqutq5bqIbsG87KTS0gPGL74wpzFsGUPI2bEHJzbMGhtvaJxIJZObDFwo6vcroOa0hdHD/ER5ZQuujRpiQonl+jA7ruN7ymGdBZ+p9ksyLzueXnuu7UHFFeYqAvYEiMWjlZY9FzisRqhtB/zyBlLZPPfN8nEv2E7oJtv17D6g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=aLj2d6VxNdfE8NRJf3ZGCA/k+HLI9fFyyKfhxkFJcHBrRYN9VBCGEGMYV8xl2CD3TyoJSIL4jq5iFp31hMzXq95zAY0m0RDS+3bAv+eNbVexHAVKNXgiaFkG1mSMVIivz38U/ZNahsG7Xj7ddu9xGTu+ASe8Aj04Gmi4OHJaQD4=
Received: from AM4PR07CA0024.eurprd07.prod.outlook.com (2603:10a6:205:1::37)
 by VI2PR04MB10739.eurprd04.prod.outlook.com (2603:10a6:800:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:41 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:205:1:cafe::d1) by AM4PR07CA0024.outlook.office365.com
 (2603:10a6:205:1::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Mon,
 27 Oct 2025 17:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:40 +0000
Received: from emails-6569303-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-148.eu-west-1.compute.internal [10.20.6.148])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 9F61D802C8; Mon, 27 Oct 2025 17:48:40 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587320; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=OcG9zzZsozebMvfoTGHAwX5ycrE0HX06ZvX/gpnEHrZIL/ajAwmOSE3SPo7daqeX2udue
 BwsArzC8jGPKWVhOhS0zOFCKRfCOjDGJ9m6yst/AJSoNYI3JrL4Zc3cjiImJwTIXI6Jh/cg
 cfLWYpFQ5wxawCJ74I62YHm4dnkzpt8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587320;
 b=A1d+tfg+Ua5bO7aWBpUED9OEuLiIIrePbnxcwI1o4TlA28p1CeQ+3TBZ1IkUPA5BQt1qf
 3PVed1/NY5wSDNlcAASQpOiGw73CiwvCb/gjpJsZ/6dxLXhtoblH8ASSOdF8NsO5BtjcnbS
 CgcVfkTYzSo4X7JQvbgixAT7hFZzIjg=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpBaWXdSeS7Lf96KTgRCelF9icDmVbWNylsjZOv9JAF57ExUd68uMpmAjkl41NJJlU29eIFvcx2t3Iw71cLUutZvJ8P62QscnfQV3JAnGMwgc90eaUZDm+3wfJ4Yx9AHJTzRsQJn8XiPwGLKQLs7f7MuForVXFDaOYSXlsjQlE3C1q1EILqKCghPe5M71xPorII5Jhx4DcY1eIvN5Q/IRUragIiDNukRD/ERE9NAV2OB1a9btftlm1Bdbxyy9MsKNrsWtkJBv7g7GFOfziVK/4HaKQV47LhQsUHrow00Bxgg6xODbcQUe2LqcxQGZylZiFRXKEWa+MBi3d03xnXmQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=hjP2bA1cDabOtYnCbT8OGEl6MPpwJ77cRttlfWgSffBAAm9SouEsq3IDxYBeaVD4rgyD8k8vLZTJeLCwoCYVEqh8WAR4XqtEqWzYrk8zV9v09G/wBzc2jJkkvalY5Ytu6OefdOnopjejcPMDGR+UyimwF/aOhU1z+J4aeEW1vKbehR4QgVfzRADcLm0yocSJehZuajq4/fYSTgRo/fQ4zykmm9kYHiNIinbYYGYPEQj0fSl8UEj02oSTcO6AUaUPK01r7ZPxgxBIeXjgqdzXSl4tFELHO90ErDeDUyFK9NEntgM6Utwo3i1EooafXYIQu568lLC9qmCNrhfhWQ6lzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUK0p9RZUI5ko6JbKnb6k/RmKj7tlCeUOBT5+YYhiVA=;
 b=aLj2d6VxNdfE8NRJf3ZGCA/k+HLI9fFyyKfhxkFJcHBrRYN9VBCGEGMYV8xl2CD3TyoJSIL4jq5iFp31hMzXq95zAY0m0RDS+3bAv+eNbVexHAVKNXgiaFkG1mSMVIivz38U/ZNahsG7Xj7ddu9xGTu+ASe8Aj04Gmi4OHJaQD4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:21 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:21 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:13 +0100
Subject: [PATCH 04/10] drm/panel: ronbo-rb070d30: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-4-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|AMS0EPF000001AB:EE_|VI2PR04MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: 028d108c-f0f2-4b7f-7c74-08de158110cd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MTh6ZkFGS2hxTWtSRjFYNHFXN0lxRVllZXYwSDZYNGdXOUY4M3pUMXZod0NH?=
 =?utf-8?B?cTZ0Y1M1SWZ0SzVaUGhIRWUwMEZmOTFpWEN5ODNTMVRZYzhjV2U0NVhmb2Jh?=
 =?utf-8?B?bzJValMwT1dQSzR2eHN0YVFxTE1hYnp2UzJ4VHBKUjhqMVRJNzVKV29Cakhs?=
 =?utf-8?B?bkE5Y0I0VGNUelVDZHJlK2R2YzJsc3F1b1FRVEdDNzNaU0VxZmp3OHh3WFND?=
 =?utf-8?B?OWtUQzMzREV5NDV2UnVvU1lZNkk4YjRPMy9zaitCenY2bVg4QkhWeEVCL0ht?=
 =?utf-8?B?Ym1MdXBxUXRUR0dpQmFadEdVYlF2MlRTcGlRUHBpanRXRXNJM0ZHU0JKVFhq?=
 =?utf-8?B?WjRoTlRMbmh1WngxdVVqVlRRL3dUZnh5MWxCWWwwdkxJUEw5YSs4ZDREOHhO?=
 =?utf-8?B?NjRwajl4OGRXSUVtdjZObTZ6ajFxeUtIWGc0QkJoK0k4d0dPSHJUVFY0aCs3?=
 =?utf-8?B?MGt2S1ZGeTRqeWhMM25HVzRyeEZzbXZwVGRNMjBmWi9DejVsZDhmekNTNkxm?=
 =?utf-8?B?cFdJakVaMm1DOTZOajRKYVlSQkEreUxjcm0xOEpuNVc4U0Q5M1c5L1kyVnZ2?=
 =?utf-8?B?cTBHUFlqTzd4TmJYSlFTNGZaRmNQMTR6cE1hZ0dnaHdNNnYxSzVuTW5jU0Vw?=
 =?utf-8?B?T3NkOWk0SjFoZzJQd0JxRVMxM3J2MkE3TkdxU1dKOXJhalZQMDd3RHo4RzdI?=
 =?utf-8?B?Y2pvUGo4RVdxMFlGY3JwdGVUSnZVaGpIak9Hb0JlRU1rRlU1SGwraXQ0SDIw?=
 =?utf-8?B?WkRUUW5nYnByNDlheVVjL2hGTWR4NE0rMU16ZjFTcFh4QUxoQjBXRXdicVBl?=
 =?utf-8?B?dDhrcHlaWTFFZDlNcG9FK216djhVaHdBUWQxMGlJMHRrTGQvSTc0bURwaFNZ?=
 =?utf-8?B?dElBY1BlU0ZCS3NwNmdlaTE1Yy8wTEZISnJuNGI2RWZid3BiU29qOUZYcTQ0?=
 =?utf-8?B?YVF0NE5ZL1lJWTBrY2ZzaDcxUk1rdkJjUDVRcTZEUDhEOU1VRlZKYmY0d1Zw?=
 =?utf-8?B?Qk4zTjd5dHZyZzZFa1J3ZklSOGI1UldHSFU3WmJSZUxwZ1diY2dGWWEyTkhC?=
 =?utf-8?B?SlQ3UllaOWdNVDc1QkFPMEhYTCtMSVlMakxndlRYQTk3YVVhWXl4Q2pONUFC?=
 =?utf-8?B?YmlXWXNOU3RNcVViM2VwTHVyRmdkZER6c1ltVnZ0bHd2aVFkenljSlJZeitJ?=
 =?utf-8?B?bzZVTWVCNHFRWGJteUF3bnZjZ2N4WCtac0Q2cFpocHhkVGRnMGt3V1d4MmVt?=
 =?utf-8?B?UENZNGJkVENobHdsN0Exb2U3NkFlLzZvM2RHQzVXc2lXRlhObGdlbGdDa0t3?=
 =?utf-8?B?dUhkeVNzRkc3a0pTb3RIYnRFeDB4TEhBdUd4MHBDSVJyU2JsUjJRdWpURWt2?=
 =?utf-8?B?SFZxUlRRZE5ERTJpem5TeVV1ZDN5K0hBWTRrVzRkSFd5L1k2RlZ5dFdkL0wr?=
 =?utf-8?B?ZVZOdmdtSjE2cmR2cERIUVVCY1FzZEl3VnVBemtwQ2xWNnRWYW9JWEdzMGN6?=
 =?utf-8?B?Y1phNSsrSVNSSU5maVB0eE13RnNNS2EvbHhuNDdXeWFNWFlXZlZPTkZKWElC?=
 =?utf-8?B?Vml0bm81S2IyRm5kdU42bE1LdFZPRzI4eFRuelIrbTdJUXV3VGd4OGZ2MDQx?=
 =?utf-8?B?Q1F5aXF1bmFFZCttUytGdWdVRTNhMDJaY1FSTWNteDdEODlkUVlqZ3M0MnFT?=
 =?utf-8?B?Z1B0UDhuN2Y4YlFVZXA2QmhlWHJ1UWlsZTV5VE0xcG44QzJRamd6VDNkUFNh?=
 =?utf-8?B?elR0T3ZkV3d4R1RQaWIxamlBSERVcjRpUVdKWVFGRlN3WWt3LzEyRHNJN3NK?=
 =?utf-8?B?SGJQOW9ZMGU3blNjSVZ6MWhaZjQ3T3k0LzRtM3RZcWlpaUpmaGEwSW9SSGxF?=
 =?utf-8?B?MTVOdG10K3N0QVQ2YUdCblJkTnBhYzFUUGs5VTQ4c2pjbmwyZG1mNXlsdjg2?=
 =?utf-8?B?dWJ1RWZLWU1adHJkQld1VGZ1cGpUSFo4TElsMC9rc203b0F5TmptUjZySVMx?=
 =?utf-8?B?YzFiN1VSSlk2ZitaY3hvTnlET2drL04zV1NFdHl3cjhTUFcrdStBbWErbUxr?=
 =?utf-8?B?ZndHdWFKZ1Bob3JxNHljYS84MWlXN0NjNkxWdz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 16d26b27eb26457bb9ee109c27307635:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d7d5afd5-afda-40b0-2568-08de158104c7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjdVbmpObGo3OVFqTjB5K3R4eEZ6M0tQQjBFY0FuVjhVZ214ZTVrUHhnMDlB?=
 =?utf-8?B?NWNXOWVlNHRlUXNBZVVXVkFlSU1Zb3FLWHB2QVM1dWVRK3VKcHlEVFRteDB1?=
 =?utf-8?B?RWFlK2NuNTZUUGhEYThPNGg4QjVsMjdWcU9xL2hlV3J1NUxBK3BZMm8yZWhV?=
 =?utf-8?B?S3FxclpJcjk0TXNBSEJSOEpENmZ6Q0JnVzFpYmZ3Y1oxMGNXbGkyS05CcS9j?=
 =?utf-8?B?SXlEU1dKUjdHekVQNzlMYW1ONXd1cGpycnMyRXYrcDhybENpdTU1ZDRxNVhx?=
 =?utf-8?B?ZlI5S2lYa3hUdUZmNFY4Y1VDdkZpL1hsV1hQTUs3QnhzeFdxODAybDJvbTl6?=
 =?utf-8?B?dGxwYWNxMkowdlh5Y0F4cUk1V2RvVmY3S2x5UDhvQ2l6YUY4dDVOVWRZeU00?=
 =?utf-8?B?QnBNYXV4b3FVTEV1MlQ5WTZ1UTNoYW1kaEtVSG1KeElJdG5PMXRFL1ExVE9a?=
 =?utf-8?B?Nm1GcmplbUhwMXIvTGtrOEZWYjZNRWJLMUZhVzA0dWlBL21TQS82cW84dU5C?=
 =?utf-8?B?UlVvOXplNXBUNTR5UVZZQVp5YzJ2VHVYbXNKdlNvUVRQdEtTcXVUSmV4SkpV?=
 =?utf-8?B?RU05QzllTWVZNjZ0ZC9GdWE0R2luSFcrbFZvQmEwWklybUROS1FmUCtHT3BJ?=
 =?utf-8?B?QTlCOFhHWllkWjFHM2dnM1UzM3RicXdkZGxMcEtSamZ4NW5NTk8zWkMrWWIv?=
 =?utf-8?B?Z0U5cm5uTVkxNkFINDM5SkFaYWtRclR2Q2xmSmE3OW5pSSs4YnpOazFkaDNt?=
 =?utf-8?B?TTBrd3NraHJubDNhY01pdjU2aUdzczV0Nm9vYzVycmtHVUIzUmFTN2paeU1Z?=
 =?utf-8?B?Yk55YmRLWnREd2ZEaENodE5uVDI3cjcxMkVvdmppR0I4YmE3ZEVPaFYzRWRY?=
 =?utf-8?B?ano4T3dWeEFYVVFFc0I0bWZsVlpxL1JmWHJTaitzVURHZ0xRZkFLc29WVThk?=
 =?utf-8?B?SmFiSDB5UFhCM2FzT1lrMjQvRWNSb1BGU0llaFArU002ZlQwcVNWZi9ISXVo?=
 =?utf-8?B?K256and0M3RqYXpyVWYxQXlaVTc3bmJCWnAwcHJXZGJuaHdpN25sMEV3R25U?=
 =?utf-8?B?ZFdYdXJDM2FxSmJpQ0lFNDQ0UTF4RStBd2x2TDdQRk1CY3lKYVRkT2xmWksz?=
 =?utf-8?B?K3I5MUJKWUFtdEpTOVVCemNFR1FkWGlkc1RXNjQ5RExkVmVxYzZBNENhV2lz?=
 =?utf-8?B?Tlc3ZnpJS0ZJUGlETm1SbTRtdkxqeFF4OHBoVHJCcUVRdVYzZHcrRWlHRDNG?=
 =?utf-8?B?T0toYndlNWU0M0krd2RwWGc3c0l2dDhPMmVLYlFTY01jTEtXcG9SRFpYKzRM?=
 =?utf-8?B?S2EwTHUwN0srYmRGU29vVlVBOHpGLzZuWjFLQXU2bjk1QTIzMVJEekRxUlhs?=
 =?utf-8?B?ZzZhemVjQ1FBL2dCWEFZcGxuWHZmZE54SDduU3NDS001dnRXaVBjbmxwS2VS?=
 =?utf-8?B?VzU3VUxJb09icE54ZFQxTkRyT3FsTHZFblhUMHpIdGlSSyt2cVVvMHQ3RDAx?=
 =?utf-8?B?SFp2UzBVU0tjN0F2OHh6UEdFOWdCUjdweTZocHJRMWJVZE5qVTVmZ3gxTS83?=
 =?utf-8?B?UzhybG1WdDcrZGlCc0VldXE5c1YxK05rSjNabmZQOWM2TDFLM0pacHdzZVFW?=
 =?utf-8?B?ZDdjU2liTWVXMWh0WWE4bTZQUG1iUzhLb1R4S21yMUlSTTJKaHRGMEhlQkhJ?=
 =?utf-8?B?Wk9LM1BXdWQ1WFpFa1p3Q29uU0NtOHpCcGJablMrdmtQV21aRUlZMm1SS1VH?=
 =?utf-8?B?eHhLNVI5UkVqOXBQNTIzbmFxdDFSWnV5dzBKaERhdFcxV2JHVm5qV2lWOEV2?=
 =?utf-8?B?WHczejFJOHUrWmgwZGgzZmpqOFdtUjQ5NnNDeWZJV2JCZ3orTm04YmxxTDdv?=
 =?utf-8?B?SGFYUG5iZGh3d2JuTWVuZHBBMXh0S2pGL1phUUZQd3FQT1JPNjhqRUtsZGp0?=
 =?utf-8?B?K0xlSUxlR1IzdDlQdUJ0QzdYNVRyeTFoa2VDdkZVbDNHWlhEMGNhZ05YTUNN?=
 =?utf-8?B?UnhMQzYySGZ1UjNkZm1oaG5KaHpSeXVXdE9ZNmxVZU5wQ3FKRUJYWC9GbXY1?=
 =?utf-8?B?RmJJMWsxVlRFT3pQYTg5K0ZYazNMNEJvbUx6dGFYN2psMVdKTEdHMVZXZ1gx?=
 =?utf-8?Q?aK8av31B1FE+CaB6wNI7n6Fzp?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:40.9310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028d108c-f0f2-4b7f-7c74-08de158110cd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10739
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

The ronbo-rb070d30 controles the various gpios for reset, standby,
vertical and horizontal flip using the non-sleeping gpiod_set_value()
function.

When the connected gpio controller needs to sleep as is common for i2c
based expanders, this causes noisy complaints in kernel log.

Control of these gpios is not time-critical, switch to the
gpiod_set_value_cansleep() variant.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index ad35d0fb0a167..c3fbc459c7e0d 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -54,9 +54,9 @@ static int rb070d30_panel_prepare(struct drm_panel *panel)
 	}
 
 	msleep(20);
-	gpiod_set_value(ctx->gpios.power, 1);
+	gpiod_set_value_cansleep(ctx->gpios.power, 1);
 	msleep(20);
-	gpiod_set_value(ctx->gpios.reset, 1);
+	gpiod_set_value_cansleep(ctx->gpios.reset, 1);
 	msleep(20);
 	return 0;
 }
@@ -65,8 +65,8 @@ static int rb070d30_panel_unprepare(struct drm_panel *panel)
 {
 	struct rb070d30_panel *ctx = panel_to_rb070d30_panel(panel);
 
-	gpiod_set_value(ctx->gpios.reset, 0);
-	gpiod_set_value(ctx->gpios.power, 0);
+	gpiod_set_value_cansleep(ctx->gpios.reset, 0);
+	gpiod_set_value_cansleep(ctx->gpios.power, 0);
 	regulator_disable(ctx->supply);
 
 	return 0;

-- 
2.51.0

