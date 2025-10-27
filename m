Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90963C11B00
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5845A10E56D;
	Mon, 27 Oct 2025 22:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Pda+DONV";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Pda+DONV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023103.outbound.protection.outlook.com
 [40.107.162.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAC810E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:48:34 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t0jcfc0Zpm1VnICrKdCJAhODvQ7RTRTWA5KxURPKYUisDsyDhQN9+mDA+DLA88lPPOfWYju59z4PvM+Adhjao8wCQuwQBs9buZsr62ozfuNSh4UhLNCHHATrWorvkrMtzoRmYYQFCYJ60pDwZLXFtB+X2Sl5MKRcX5HfPiYtmxb3CZuGAFUuxn7A8bTriHo8EI+/qhaO8KV7s30xYgTwf4SiXO6h8DEadiiMyKH7dU2agyE5ZeNbjIrcoOkakkQ+xZUdiiEs54XciFJ4c+4uybNwueB9QUihRZE0q4gaN9jmaJxkQLTLRCdh9YUlsAaq+vj2GdvS5WUxovv64jHhww==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCHhyXamMluM4GbjQqwzRQ1/BAZgnHQPaqzrFFb0KcQ=;
 b=RglYnx7+x4fJEbRz+Ze9xunIIbCEGODw1ZWiDtqOUvyDRH3kaJGaLjyJpr1kIokGJwjg1rBwAcVBftjsDDcwqnJVGPbuo9GWWGKgBfUw2S6GhHY4XRRRc9w7PDn3U9DqKQLZaFPAfKLWykfS+7+q9SNrUfcQvj3hOEQZADkSGwklvPhVeDlLBM1SsNfAIEfH8q0m0RWZazv4+z59EGcHGOTDxWWLWo048N5A+UMZPp16ctMtSrvf0AwEmgZShqwdbfXNriZLaO9ntRxU0z+/mDZNjL44am7HFDXynwwE5OrFmZ7VFt+vylqGMB5fXXcpVdAiYXpy5YnUlhnQuKCjpw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCHhyXamMluM4GbjQqwzRQ1/BAZgnHQPaqzrFFb0KcQ=;
 b=Pda+DONVxs57Y57u74Sbzh36D04orYu8app/kddEG86MKKuR/b21qejoMzTlifgYwC9c+OEkzbxVyGIm9cWcY8g9ExOPwB5P1FbLDNO0MbAHPfiCM9xz7O/4nFRInWvLOXm2ZGFXNdIgrdeuEiCcToDMKea5ZwAOOUZGqRe+lFk=
Received: from CWLP265CA0522.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::7)
 by VI2PR04MB10956.eurprd04.prod.outlook.com (2603:10a6:800:276::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:48:30 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::d) by CWLP265CA0522.outlook.office365.com
 (2603:10a6:400:18c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:48:30 +0000
Received: from emails-9354467-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 4608180352; Mon, 27 Oct 2025 17:48:30 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761587310; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=VCHhyXamMluM4GbjQqwzRQ1/BAZgnHQPaqzrFFb0KcQ=;
 b=EZM0NGzFMT1JLwuWfOTGszINmMe1z0+834INQ9yfzS4wAOfcuOpwORC+p8K2rxNoG3cmj
 03jvJ8ZKNkN188Zb7L7IOWazS42Yn6EzaZg6Uo/J21pjaW+udu7j7r+aavugLGxeVd8spnz
 aYA7G22uGAwn+0MAbuA4I+aJkSC7fdw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761587310;
 b=WoBnScUtp/J0kwZAw0dbcBQ33s1Bp3OiiprT+zdsbZK8pozYdCK7M/UgEnrDRKGFGHKVk
 UgHQAgNDlD01N+LxNXTqwltlHlRXcdhLUTfJYi64y6TX0anstiyFe7pOs357BQYGSgos3Od
 w3SGRXA5w6/GFOnzX4gnyD5xLXdUfJQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLVzpt2cffalksAc0+h8v+DTzkhaTA8o47FqEmrAT6FLsO8KCOJGYkGLchW3QilRKh/jH9Fym4doHtqy+c9234YgR3dwFLcsIyHLTAx/A6V/OExvKpMX2QfaEhZkry1nTAFDomVXnPGkdVqgvrpsxnpDgil6GmrpQ0YSpSkZnqvpwiuHFUUGYSJ/hPkZ/owwqDN2+wSzHH7zG6zIOFUAytprARqSc2an6Tvv+X12DpLYqQ5hjVZR23HqFZbsFU50Cu2TYS9seDTNEvmU8qiIJBZW0MO6RtuBIoMhhldoDDvSD9KDsUPnzX828YK5Fk0W1bcBYCle2CFh16aIcwfrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCHhyXamMluM4GbjQqwzRQ1/BAZgnHQPaqzrFFb0KcQ=;
 b=sga2MHm+cP/DhiQeuOyMUhDEmlSP95dtrs87L8CZYCEPfGVFewdvpzdB8IWHChuCucFnWuxv1E8zTRnMN6U7ZvHksmscfGBOtGSb9RsMLyhGthLEYEss85K+fOQU6tOSsUzHyouWMPaoIsyoXrK8+5WnuxLgDD2N+eH+rM0nhlOOfDttc17fqEnXurUK7QDzrdGOWXp3tSArvZhRxyHvwA5kLNXTodpnaNvlpj49X1xUE2hFWVYRfXF7M6F9EbPZtux3vcSR8jXalNCuoUjLTLlNfq0qz1PXb2jBbMipLGqfUTBHhWmdt196DwyVudocKxUEhrA+jvVu2c+ybnFBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCHhyXamMluM4GbjQqwzRQ1/BAZgnHQPaqzrFFb0KcQ=;
 b=Pda+DONVxs57Y57u74Sbzh36D04orYu8app/kddEG86MKKuR/b21qejoMzTlifgYwC9c+OEkzbxVyGIm9cWcY8g9ExOPwB5P1FbLDNO0MbAHPfiCM9xz7O/4nFRInWvLOXm2ZGFXNdIgrdeuEiCcToDMKea5ZwAOOUZGqRe+lFk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBAPR04MB7365.eurprd04.prod.outlook.com (2603:10a6:10:1a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 27 Oct
 2025 17:48:18 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:48:18 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 27 Oct 2025 18:48:11 +0100
Subject: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|DBAPR04MB7365:EE_|AMS0EPF000001B6:EE_|VI2PR04MB10956:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0a88cc-2652-4ac3-653b-08de15810aa5
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?cFdKQkxDMXdmQk5WeXRRVkx4SllLS0I4K1plOG1tejNDYkd3TVk3UTlQL1hW?=
 =?utf-8?B?cXY0MGxRVE1DeWMxNWFBVWNYd1BZMVdOeFFCeThVUmRZUjhncy9RT2x4c1FG?=
 =?utf-8?B?U2g2SnkrV2g2bGpYNDhIdy9yQk95R2M4WGxFQnJ1cWdOWHkrclhQUEtNOUNY?=
 =?utf-8?B?TDJiS1gveWdueTZkUldtbnhwcENrNmt3YytiemM4b1kraSs0bEtNbUwwVFM1?=
 =?utf-8?B?NTNBY2JJNm0wRVhEelZQQVRpR0RwR3NtK2pRR2ZhYnpmUDJSY3RjSkZ0ZU53?=
 =?utf-8?B?dDNUZVkvRDBWYlhXcnRZNE9tS3Zsb3pKTWRCaTJYNUxoMlNMYWQ0QmRNVHBD?=
 =?utf-8?B?VlJLeXJ6dkt2aEMrN3lkQkFUSkxlMUpzOHNUOUhIdVphMGZyeVZPbGhsdnBz?=
 =?utf-8?B?bTdocWVNb2FuWUxzckZBcUM4dVRuZHVwKzVPTXBhTGx3bHhNVllkSC84cEdx?=
 =?utf-8?B?TUlJZkxQZ3NtNjQxaXBwcWhXcndCcmpjdVJMNDdyUXg0a0RJYnBQQ01IOXVP?=
 =?utf-8?B?VHVyRkg1N09GTnE2WGRBUXMzenF5aEp0ZzRkazE4OTJmdWp3RjI1TXI2aEhD?=
 =?utf-8?B?cnZMOHU3VFR4MzRGY2F6a1FsM1B4UkVTZmRzdUdBYVZVWHpRR3AvTWlscGxm?=
 =?utf-8?B?NU42ckNXN1l5a3RqTEpaZGNUUFY3SFdsUlJscmRNU2ZjZW90dlE2Ylh4M3pL?=
 =?utf-8?B?SjkvVEFaL2JkMWlCbFlJczJiVEozNEtBcGdnb0JBb00yamVLeE1UU3l4eVVk?=
 =?utf-8?B?UzZlL3ArNjJUeGVhaHdGaVZhMDI0enR3WW80dUY2MCsrZHpBelZ0VGdzdmE5?=
 =?utf-8?B?aUJMTWR2Y2FLNVB0aHpxSE1PN3FTdFYvMm4yc3FhWnFTRmtZTzBvbmxaWkZR?=
 =?utf-8?B?N01vUHFBZHJSb0pyVU03dHdWRFZMWk1KYmZMcmJZNVE2VEVrRFo5UWQ4YllO?=
 =?utf-8?B?VXgwOEZGUFYraHdYSUYzbE1RSzYyM3RVR2hLa0xaZ2ZkaVc3R0xFMlkrYnY0?=
 =?utf-8?B?T2VOOG4rZGRsaHUxZzdSR1BiNWxwV01zUXUvNTlNZWtpWWZ4ZWxGempVOXJY?=
 =?utf-8?B?UHcwRzZYREpBMXhZYVEvUFFmS1owRjRIS1dLand0dFJNVlRFQ1l6MWpXZkMz?=
 =?utf-8?B?MHFHeUR3MTVTMXVXSTJDVWlxb2hnTXgrcUlDMzI5MkVGbGNscDBmVVpoUjR6?=
 =?utf-8?B?S2c5bEFCYzlJbjhNM3paQlUxS2xweXNZOThjOHVmNXdKcmtKNWJ2eXUzNDky?=
 =?utf-8?B?c0RaUmx3SGxBT3lPNjljaUhCNHhEaTJueGRTWW1CZldOd1lwTkw1eDhpVENi?=
 =?utf-8?B?RmVkY1FVMGhVdjBkNEhLS24rd3lJMFltR0ZCQWplaWZ0ZkRGQzhkRTlqVklv?=
 =?utf-8?B?bW1vQXE5LzBYY09lL0FDZTRwZmZ0ZVZMWkJ4RTRzdlR6ZXBRT1ZxV1VCZXhK?=
 =?utf-8?B?bTZGUkxFNVNkdHB2VUV6T3kwU3VnT1pPejB4Y3VpV3VJaGQxK0NXNld4eUNi?=
 =?utf-8?B?SEVPSGkwdldVOVpYM1lWZUJxYU92UzNKOUZKSFNkTHNGNTdUQjY0MDFIMUpv?=
 =?utf-8?B?aGs5bFFPeHVJa0xDWXU3OFVxTVNqQXF4ZGRzNDhOdW1adEE1aWYzTWplY0RN?=
 =?utf-8?B?ZUlxTjcvTjZuNFgwQXRHSTgxc1ljZ1RObEM3ZEhFQ0RpcGJzUEpoMnhEZWsw?=
 =?utf-8?B?Q1l2YXUzOXU4bUhPTjM4ZklkN25iTjZWTkxYaHVkYkxIMG9RRU94TjNYdnpW?=
 =?utf-8?B?S0l5SndoUzlNM2lLaXFQYzY2aW56elUyUVpha1o4REgva1hVZWJibWJaMFFn?=
 =?utf-8?B?K0Vlci85YkZOMHVFaXlJM1dKR1hZcUt5TFdvcHNJZVRFTmtDVCtHQ1JscWNR?=
 =?utf-8?B?aHNoQXU0OTN2ZUNjUnFSa21JMmZ2YUxLOFFZbkdLV1ZhWGVUaVpFbCtKUDFD?=
 =?utf-8?B?aXlPSWFoRzB3RHJiU2dTdGRpNmlmVVNlbmtwc2ZEWlBnMTBjeXdNSXptMk9N?=
 =?utf-8?B?Zm1OTkhLU0trWHM4ZnoxT2p6WHFqMzYwNFYxcUYycWowUTVlcElmQmFta21Y?=
 =?utf-8?B?R0RnNUNsd3JFS0FuemNlalNtQW1BZUZnc05iUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7365
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 779f3f94c26e4c058d047e7dc40645be:solidrun,
 office365_emails, sent, inline:debd18510902b80412e2749450943e78
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 62f9d6f0-cb9e-4279-a6e9-08de15810372
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|35042699022|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWxmcm1YNlc1TGJEN0xSOVBJdnU5VUR6WVR5dFBzaTdxS2ozUVpCdDRybFNM?=
 =?utf-8?B?Q3ROb2QwMEtpenB6YUlQNVlDZjN2YnZDT0JvZGtIY3lRME0vNm9nVDBRYjFj?=
 =?utf-8?B?REducFl6UWRDclZXdC90Wkk3NVA5Wk50dUR2aHVLRk5IUi9ldzNzYU50RmZq?=
 =?utf-8?B?aFVUNk5JL1JGL0s3Uk1rc3RVeFZxdlA2Znk2UnFmUGxWYm1rcEdxZHAvdWFD?=
 =?utf-8?B?YkhJTnQvM0pabFBqMkFKTEdTZEswVWYxT09HL2hxYUtKN2V4QkNKUEVBc1NR?=
 =?utf-8?B?T3ZwZDNRWGRuSzNjU05JVTJjWE1MU2xFcDNmelp0Tit0WFJuK08xWmcxYlF5?=
 =?utf-8?B?cU5hcW9NZkwxaldpZGFBMXU5TGxRYnlHc2YwbHBJK1IwM01rQ0pyMmNHcTFn?=
 =?utf-8?B?RkM4VnpNZUxubkw4S0wxcktKS1YwQlNtMDhGRUtPd2tlT0R5V3JuSWoxN1Nt?=
 =?utf-8?B?REZOSFROZGcreXpaRUxMdXVpbGNtWEE3TThHMWNLRmxESHB6NlhuTXVEK3Nh?=
 =?utf-8?B?anN1R21CYVBGdjBMZ2ppNmdNeTFuUnZBSW10dDJXd2UxMHZjMjJXb0FBNVJX?=
 =?utf-8?B?YzlLaXVSaFViTW1QR0JnNGw4ajQ5TGNkWkFLbEJmeHBQbW5BdldXZERqTGlX?=
 =?utf-8?B?S1ZSVHRjcVl3eXViaE10bEZVWk0yK3diWkpQVlJRbWdlNmlPcEs0RVRJbDA4?=
 =?utf-8?B?Z1c4SkFIUDZ5ZVZ3Nnc0RjVqb0s3bUc3Z3d1RmpuRzdKK2MvMmpuSFFuOWti?=
 =?utf-8?B?MjRlVGt3VVFPTDh5bHVpWjBZRDFrdC9vKzFmL0RTUWlHQVkvVUtsSUkxSVBq?=
 =?utf-8?B?SnVqS294RERLc2d6aXV2TGpmTTMxT3YxeEx5Rk14elFKMEppR0lwY1ZyYmc5?=
 =?utf-8?B?YWFsMHFQa3h5bGRWbGl1OFlIa2MySWZxWGdIRkdaV21XWlJHditaamFqdENk?=
 =?utf-8?B?ZVhNZjlwUmgwUG04VGhCazNMWGo4K2VPMWlkcFFpWHo5UzJ6Q2JOVnozMUh6?=
 =?utf-8?B?ZXdEVnlKVzMrSkE3MUdzOUpMZExiYTB4YUJ1aE1hZlVYek45YkVra1JkVUJ6?=
 =?utf-8?B?TkVMNG84RlNIVEhtYitPL2dVZ1UrL09KUUtaU1FaZENjdVlNUUlhKzNpNm5p?=
 =?utf-8?B?L05pYllJVzJhelE4YVpodFBoeGNXallCVzZnT25TUlM5Z1lydkpxZ09rT3VQ?=
 =?utf-8?B?bkl3VUJDOVk3dUJ4Y0I3YjVIOHNPWjMzejMyMjU4VThDbVNUdjhIcGZNdzlL?=
 =?utf-8?B?eTU2RGUrVnpTajU5NWE5T0pONTl0RE80bzNUU2VQL2g4MHNyZWxOZWkrcVpl?=
 =?utf-8?B?b0pGd3NKdnFsbi9VUVdTRVdUOTJtQWQvRHBidmZtcWFoNFhBWkpVOXNqdEow?=
 =?utf-8?B?YnRhYXdkYkpEb085QWprajNmUW43d2x5czBqY0lyM041VEVzWjFrSUpZbUxO?=
 =?utf-8?B?WUxsbnFXeXBMRDUvY2JNZVJSKytHbmJWSXJzS0xxeGQzYWttWklaV1hodWVC?=
 =?utf-8?B?VnIxbnR0SHdTeWRvYjV0WDNPV2J1eStTd0F6VkRzVytnSkNzSmdlOU5OK2Vk?=
 =?utf-8?B?MDdmc1J0SUN2YkJVM3NHdVo2ejlyMWdqSE5oOEN4TXVFWCtGQ3BNRDJjeG5I?=
 =?utf-8?B?ZVZadklmYmJYT2N2T2dkSERseW5xY1JsS2pFWThZaFgyTmowOVhJaGlkOVRi?=
 =?utf-8?B?WnpQeWlOOXNNT0MxRzB5NGlPaUc0RVM0THVwemVwNlNTME1SaGUvQXVoK28w?=
 =?utf-8?B?cXFCK3llSW03UHBnTWoxeVdjTmhQOTdkVXZmK20xSU12YUlJN05STmZFWnpF?=
 =?utf-8?B?dDdlQW5yWlU0SXhqem9yUkxsNHYwYzYyTHFCQW00L085R01DbDEwUnM5VzJr?=
 =?utf-8?B?U2Q2VEtkUFhtWGFLNWNqdkZVWXVwN0xaUmQ4cTF5T2NjcE1heC9waHVncUVr?=
 =?utf-8?B?b3lhRGpNeklWeDFUUHIyOEE3Y3puQkNxSTBWNGpuVWtQM3dVMDVJelZPWm5y?=
 =?utf-8?B?bm5JZWdMZTlrNjBmTitLMXVZcWRhWXRZT1NENFN3V0hBUDYvb3JNVGo4N3l5?=
 =?utf-8?B?MjdiVzFWM2hFRjVNNG4rSUQrVzFLQVRGK2hoNEpSRGlNNkttSEJOQkkxQ3hs?=
 =?utf-8?Q?2kZ/CanuNaPu8bVjMxOUsQNvy?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(35042699022)(82310400026)(14060799003)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:48:30.6007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0a88cc-2652-4ac3-653b-08de15810aa5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10956
X-Mailman-Approved-At: Mon, 27 Oct 2025 22:26:30 +0000
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

port property is used for linking dsi ports with dsi panels.
Add port property to ronbo dsi panel binding.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
index 04f86e0cbac91..a2dc67a87fa3b 100644
--- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     const: ronbo,rb070d30
 
+  port: true
   reg:
     maxItems: 1
 

-- 
2.51.0

