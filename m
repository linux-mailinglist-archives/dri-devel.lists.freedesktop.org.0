Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK8/D4lZnmkjUwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 03:08:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD94190949
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 03:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F3710E345;
	Wed, 25 Feb 2026 02:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Xt+Yyv+u";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Pno6ipar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7088B10E345
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 02:08:03 +0000 (UTC)
X-UUID: cd1a288411ee11f1bcd7499a721e883d-20260225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=xnXvWmpesgGm+on5d8CIX4GKbG37skSz5wzQ9B7Iz6c=; 
 b=Xt+Yyv+uvlMiDeCSFtipYwyQmEWG0BhWbNS5lbsap/tMZCw06xLzVgSH3PILMwWAN/2j9MCYt4Lpq+uR6E4zMtVIFsSZF0ZjMP45MlljTDfn3vj6UIf6vHq9HFkNTaKoUp8UAl0N2Q+XudVqn/jYdAxZrI9UmWWVOkWurYVvKhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:39b3428a-298e-47fd-8cb4-527237a54a3e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:fcf03b7b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cd1a288411ee11f1bcd7499a721e883d-20260225
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1010337990; Wed, 25 Feb 2026 10:07:56 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 10:07:55 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 10:07:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xADgvXJylbZC7YVUJQYr2C8ru/UAJ1u4M3o54h2NKwQdWzK29cs10GxWT6qKV79S2Ks9xvbHku6UcsyYmwgVNMvdtgibARzoGM5GZ5OPKmCOb+SckWF1AvtjbuzAj/wC4QX2GJgTgUTlxYEF7+HxTvSNyifmCo3Xo4LMtPgeX0SWIDQyg1IA30Gc2bi5VivX9YT1H+D8twbrjy0OFLcZATutKHF4b7kMvSMmXQ3gwSNNdrXGi8oyGkHB/51Hmd3kYijMx1jnjZng5PxfcIb0z3sbhWKAqy3kDkZyH1HHW7FMYDvOhW9O4Q1dgQShjwSV7UiSINJmF7QiN+I47rXs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X2uvNhViOF6tNh5OSO8sNzTKOWTzaYUVNYdScIkM10=;
 b=CJhHSrZ75XXkw6HcsmoWYkPCXjOpUsggIEA5DCIoxG7tFA2ilaao94Vz1EdFUfcEkIdQi5SN1zCLskwRmkBVlQKCp2SRxCtHdezRI44oSvj1NUfwlyxOhYqogsgG318IB56ZFHJ9jBWd7iPQ22FIbXvvxZpxTWtAVrkuUgH6LbuIem7qW5jHM8JwjrECnMcdEe8l1yGexw+6r8rZ6tfxjr4Bq5KqPnZjeeKHJSfHsj+0nrqrK5lgmyCLnDtTMBhTtjsSN5MS+zdDkCg3ReI9mFJrCqhGkSnCvwWrTrE7hlfTLLvXLSAQisStfIeAgzyhbQN9/aYSjmSpdLL1pAI5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X2uvNhViOF6tNh5OSO8sNzTKOWTzaYUVNYdScIkM10=;
 b=Pno6iparmwyanPf7s9SgmmeqA+XY+E5rUywMcX8hFiLmGugRD5OLBDWMZLulpQqpz6UQawcI+LFA+MgshR822oHAYcB5IjExnjbzvJFGs+twKTJASisnk73Gmpy3q0f90IixGzsRETWxQJn5BixfhYhTYllxKQ/vjvay0xUq3kI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7449.apcprd03.prod.outlook.com (2603:1096:400:415::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:07:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 02:07:52 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
 <airlied@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Thread-Topic: [PATCH v2] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Thread-Index: AQHcpM8cFDTxnhuf40+7MXqsusTnQbWSrXiA
Date: Wed, 25 Feb 2026 02:07:52 +0000
Message-ID: <5fe2bc547550c3451108e3e326d55c71ad9b267e.camel@mediatek.com>
References: <20260223141638.2022490-1-l.scorcia@gmail.com>
In-Reply-To: <20260223141638.2022490-1-l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7449:EE_
x-ms-office365-filtering-correlation-id: 33c446e3-f6ba-4eda-399b-08de7412aebc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|1800799024|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VzNhVTV6Y1dBNkpvdWtTWFlUTXczaTNSMGt2UTRNRHFRUkFTd3RQQmhNTjg4?=
 =?utf-8?B?TERuKzMxMFhiMGZDa2xOYUZCT0djczBSYjE1ODFCVnFGZEpBQ3VhUEMvV3pi?=
 =?utf-8?B?VWZTaENxSVJlbDM3a2Zub05ZMWpubS9TdkhwOFZhQ0owckZsNmpkR0c2VlhT?=
 =?utf-8?B?c0dZNW9VdGE4S3JnRHZRcEx3ZUtWbHV0cHlpTTFtNEJVNmZOOUJtT093V0c3?=
 =?utf-8?B?d25BUkFaRmszelVpVi9uclJBT3RVTkZKWjZuSjgrdWlsdFp6Q1pzTVhNNXNE?=
 =?utf-8?B?K2EzdUdObVQ1R0pHUWNGL0Y5UUc2VVBkcUVyelBiV2JUOGVQSlNyWEE1MHVT?=
 =?utf-8?B?blZiRmM5NmlHcEhiWDNMUCtJQlIxQTdSS2xTSm5ZTCtmaWprV25kU2x3N0h4?=
 =?utf-8?B?VjNxQ00vZzQwU1paVDVHN0EwUTFoSFEyaTRxUXAxN1d1YjgyVHM4QUpVRDA3?=
 =?utf-8?B?YU10WXZsMi9DUzJGZEZ2MklRNXBpcktnb1ZIR1lIb3V1RGx3Y2gwcWp0d2Ez?=
 =?utf-8?B?OVNCdUNOdmw4WGNYZ1N0QUxpWjQwL1g3bXc0Q2l5THEwS3R5UmhzRW1xSVp4?=
 =?utf-8?B?dDBxZldzWElJQVZDNktNTFdxeGM1UFBqaVZsQ09Lb01BSWFLVXNFQ2dJUHdk?=
 =?utf-8?B?VlYzREdZcVlPR0pMYW5ZNW1WUnZ3Rk9YVThnd0g4OXBtTXRQM1g5SldVTkNQ?=
 =?utf-8?B?N1JEVUlUK1VITWx6YUlGc0RXbGVtY2JZc3NpK0U0N2k4Y20yeFpCVkZONkpW?=
 =?utf-8?B?WnN2SXJtTjZnazNGZlExb21mR1hkYVBDZnBjelR2aWl2L0xyOUlSRGNRc2hx?=
 =?utf-8?B?YkFndHBhYURldS9OcjU1blcrbHNsTWcwS21FT1orYVhoRUVJbmRzQ1V2cEI0?=
 =?utf-8?B?emQyL0pPdE9OSVpadHNkaDViYmNHUWVRa3hpUngwT0taM3ZpNFltaThldUNB?=
 =?utf-8?B?WXRvYi9yc2pRcHUrbzUwTCt6KytxaE9YN1A2bVIrZjhYeFpXMmx5RlhpVmdP?=
 =?utf-8?B?dVVUTHJMcXoycE4wR29HVXp5OVNpOTZEYkg4eWt1d2R5Ylk2OHVzVFdBeElv?=
 =?utf-8?B?L24xUHUxaTFRYStvSjhUc2RLTmppMm5XYXJURFgyQ2tyaWl3T0dDMWNWWEZh?=
 =?utf-8?B?RkNjK3Bab3BibFB1VTh0REVZRHozRzU0ak9iRlFpaUxDc0UyS0RwckR4Lzhv?=
 =?utf-8?B?bzVvRndzaVpheDExNDhuOUs0Y3B6bkFhaE8vWmZrVEt5K08yYTlPTFdWUDdn?=
 =?utf-8?B?Mm4ySEJGM1BvTmxTOWFtS0dPUi92bDdjOVdBcjJsWGN6OXAzS0x2SmkvZzM0?=
 =?utf-8?B?OU9qdElGb2gxUEtCdis0Y3BNTitGRVVRNGxES3RaV1NjUG5BVGk5bFhYN2JL?=
 =?utf-8?B?WWU2ai9NQ3d1bFVEcEpIalJWaElNRWJqNnVoK0l0Q203aHhqbXVQc0NsL1dS?=
 =?utf-8?B?WklKeU9MZ3VYU3JkcDlkTDR2T09TUWdpUWRrdkRUWnhtYUVJRDlKT2lqL2dr?=
 =?utf-8?B?WFkvWXYvaVRsOU5URjBTZFNSeU1wcnVUNDQ4YnduM0kzSVdzUHVYSjB1VDY0?=
 =?utf-8?B?TXhRcDJDL3hxNURNTmpKU2hNUVlOMEMxaDZhWDVWYnJPQjg1d2laRnhCT25q?=
 =?utf-8?B?NlJsK2RHRzBhWmptalVmZzViRTNkRE1DaWZEOVZTSkNJV3FndjJlMVl2eGQ1?=
 =?utf-8?B?a1AzUytwcmFwVnRGYnhCeEFlcjNON1V1cDRPT3RMeEgzTTJiaWI2SnJLUjQr?=
 =?utf-8?B?TXZuRWdZZXN1VjRCTldUcHh5alVUcldnbXdnUFo3MjlYTFpOT01kRXQ3NHBN?=
 =?utf-8?B?eldKZU56R2V3cmVWdkV3dFNXVjN6bkZ0U0YrNS9NdG92YkoyRzRsS1Z1TjNT?=
 =?utf-8?B?WXBhM3FQQm9nQ1dCTFNlV0l1VjRyb2hKRTVTMXArUE0xbTg5eHBsN0VpaHdQ?=
 =?utf-8?B?Q2tXZUpJN2hBbUhUUkhiVXBBaFUwV1JsUVgvdXBBTEROcHQraGR5OW1ZYkNi?=
 =?utf-8?B?NWZtcmtHWFQyMDh2NjhRaG9oVUZMNXhaV3dEOXl1Y2o4RkMwT3o5QjB2Qytp?=
 =?utf-8?B?UllxbDBOa1orSDJ6TWpiQjVpdHNvWmtQMVV6MWRCMVlBTWQvTTl0NHJKeDBo?=
 =?utf-8?B?NTd4c2Vrbnd3eUVxWUVpa2w0SmtSMDg4L0R3ZnZkWmN5QWNtQm5MTnlkR1Vv?=
 =?utf-8?Q?z0DqDvMOD8kfKMFrOivNq0w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(1800799024)(7416014)(376014)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVplRjVtbUk2SnY3NzhaWWpMQlAyaHVPb0ZFZVRjekZLeFBrNDNwUVA1djRj?=
 =?utf-8?B?MmJzM1JoeTJxOFU0YUFNUGxEZ0N4bDdtV2drK25yOHVVTkF1NmQzajNFOEVl?=
 =?utf-8?B?RmsyNFluRVdyS0xteW9uS3RkV3B5MldUTzJZY2c0VjVhcU5yZEdwNFRjS0J0?=
 =?utf-8?B?bExPWTc2ZVNJY0tnL1dXU05pOWl3dWVGU1JiNkROb1VWVGFSakE0TFBKaVVy?=
 =?utf-8?B?U1F5ZTltUFpDRmMzVGZvWEoxZTFhci9xeGx3OWprNDRnTi9lRG9aQkRmblRU?=
 =?utf-8?B?SXRmTnRWZ20wSy9BTUNUTDF6MjBUeFNDd0dTMjlOdHdUcVFESVNveDZmc29l?=
 =?utf-8?B?TEthaFZUZzFGNWN5Vk04dEVlTFJyWEl2eDR4TzBKakM5SUh3amxFMGVmY1d6?=
 =?utf-8?B?UGlNQ3AwSkI3NFJEc3NGVWZiVm1qbnpYUjhQR2M3ZVlLSG5zaUtFc2tGSFZa?=
 =?utf-8?B?eHlubjRIaFJ4R2haSEVSNitLQ0lrWFlqaTQvM0k5OVB4ZlNCbFFmOVpWNnhB?=
 =?utf-8?B?VEpyQTRrMXdIWEpoS29GL2J6RlFsMjRyVlNQUERjemFzMkJSN2N1UUtCaTdx?=
 =?utf-8?B?dTAzaFRRUlhIU3hva1ZZOFhYM2UycGVFRklyMUR6TUFZcE50OWY4RVc3WW15?=
 =?utf-8?B?V2F4TkJKclprcGdkTzJpalh3ZEtmNWRyb21xQytaMlFQK0xHaFZMQnVLUStK?=
 =?utf-8?B?d3FWa1daQjllR2xiKzU5WlZrVzFnalNUbXFpaUdzczliMG4yS3hEL1hRUmFl?=
 =?utf-8?B?K3V3VGpRc1VaUTFTZytWazIvNVRjM1ppRm9ES01KNHdlYTlMa3U1eFlESURn?=
 =?utf-8?B?WFJFTlFQaU5xYkhaRzVSanJnaGw2VzN0bXlLekpDWHNGRHhZWmxTZjZ6SkJz?=
 =?utf-8?B?Mk5vZWJsRXpFSjJibVlIcXBSb0xrS3Z2R21TRmNYdjV5MGkyc09HeW02ZGY2?=
 =?utf-8?B?TmhucFFzald4SlZ3NVpROFE3M0hKbm5POGpxeXp1a2FtSHduckJsTWFRNmZK?=
 =?utf-8?B?emhkdTZXRDU2RkJURlRLMFI0d2NMOGNNZzJoZEsyK2l6QXVmL3hzaDF3bkZn?=
 =?utf-8?B?MEVSY2RyRm1tN0t0UWtTMXdlV3hXdW5DK1VQaVgyYXViZnhmSytDMlRWV3R6?=
 =?utf-8?B?dFJMeW1PMFRpNU1xdk1ZWCtRTHlRM0NSNk1JdjFTSWY5MWl0dXNwVjJXOWVt?=
 =?utf-8?B?bVR5QllQWGxqYWxEbzhqVjRtRmNFM0ZheWg5WlNoWHNURHpEZkl0WkQ0QVNC?=
 =?utf-8?B?MU5oaThhRXZjeGtDcjhTOVAwNlRuSlVET2NyRzh5WHc5Um5BN0lod3R0UWl0?=
 =?utf-8?B?dGI5V0k5TTU4NFBZK1BpSDNiMzloWDlvdHljL2pWaXM4eUZzQTlqYXZTRGZM?=
 =?utf-8?B?VTM4elZpVGlJU1RTRnByVmYwNHFmbVBYeFJFTzRCMlFaOTdrSVQ0aVBjZWJy?=
 =?utf-8?B?eFVHZkNnUWF2S1g3ZXZaQXJWRDJGaWpVeGZ4ZWx4ZnJxbXZUZlVIajJ4ZFk1?=
 =?utf-8?B?RTJRZEw4S3BJVjNvdFJtMWpoaXpHbmwzdjBvN2NocERtMUJFdUNjMlBjczYr?=
 =?utf-8?B?NWdpb0tDMjAxSUdITlhXNy9EbEhDNkp2Lzdsb0IycnlrKzhJR1ZybmVBd2wz?=
 =?utf-8?B?UzRBT0dGejlHM1JMTU10YlBPZS9TTHBXS2g0aTFKamRNU3ZuSWNGc3FJYWNO?=
 =?utf-8?B?a3NuUDBteWdJODhvYXhteTF0Y0tFcjVJWUh1ZWRGNUVUTFg0S2QxcE90Z2cz?=
 =?utf-8?B?UmtPcmpUMWxHN2ViSU8yb3hsNW05UnRNRFB1cFFCUVRWejhDZlVWU1pzcEdh?=
 =?utf-8?B?cEVpbFhIQk5zOERxUFM3Zm1HSGg3dW5ncmtDekpaanYwbUtEb3cvM3ozRHY0?=
 =?utf-8?B?VzJScndaUUFjNzRwRmZmbFMzakVNVk03N1VkTTQxZVZWdkVQejZTU0hmQi9S?=
 =?utf-8?B?aTlpa3pxcW5wVkxvYmwzRTFkQkFrcGtUa0ovZ2tOYkt3bUhIeVNmaG4yU01S?=
 =?utf-8?B?c3VUbXdDVDR0U1dJSGxvcGFZK3ZlRjRVK0VwY29kZm96TUFlV2QxZGRIbHc2?=
 =?utf-8?B?bWJWYTRoTGFubTl5YU50cnZQazJ4bm9UWVFIUFpFbm1scURWYlM5ZHNoeFQv?=
 =?utf-8?B?Mmp2dU5WVXNHK2x5UCs0ZFFzNnVYeGZxUTFSbjVvUXhZTmI1aTZaenpNNkN3?=
 =?utf-8?B?eW5OakhhOURNbm5MVFJ6OWZSUklNZm1jNkx5RWtPS3gwVFZRWnJXeWRhMnIy?=
 =?utf-8?B?L1RpNWxJZm45YTMvZ2pueTVYcWdrOE1Qd0hickVRVHFjeDhBUWU4VkU4QVg0?=
 =?utf-8?B?SmtidDBCTHlLaXJHMU8zM2JnT1BIcWc4cFVSd29qOGVkRGJkUXFpQT09?=
Content-ID: <51A449136351DB4AB5F1BD0CA8A31933@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: E+zuXsLkG3YQKqxcDbYViziPqwqXTMCoEPTqOkPxBJyHn7qcNSCbYiy8diLD+X4RTMyxnt/Psve2vFPEqYeMD2I6TxnVHhzJyDTNk+nJwM/JXd3zuPjB+xojDbBQVNzn2cinqsmTt24OHod2HhGB2X+dHcEoAzKhBY+B4xsnIONP8eTU8xabBvgZj2FXjAo8qsGLbRFN1Bkqq8QdPuBl4/FASEhl1wACYiBJWjqeNmRuT7V3brf754IpZMPj9wNgOp3L18PR3gV8bD8CpPMvPg4Adp+xnTbeY/tulRP9eVbNwAHmTJArBIXvrR+0WLdn+dnvxHQBRti4Fm8jpBBOWA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c446e3-f6ba-4eda-399b-08de7412aebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:07:52.2444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+o36KMnwpRLSrucBQR8FLjwlwZNGpNwXmwFnHEprA8NSE4izhPd3slVbZakgvi5IXgS7feTyw6MrcSbbYR1KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7449
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_901286447.666698473"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:amergnat@baylibre.com,m:linux-arm-kernel@lists.infradead.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim];
	DMARC_POLICY_ALLOW(0.00)[mediatek.com,quarantine];
	FREEMAIL_CC(0.00)[ffwll.ch,kernel.org,lists.freedesktop.org,collabora.com,gmail.com,baylibre.com,lists.infradead.org,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	R_DKIM_REJECT(0.00)[mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CD94190949
X-Rspamd-Action: no action

--__=_Part_Boundary_009_901286447.666698473
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE0OjE2ICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gVGhlIGNhbGwgdG8gbWlwaV9kc2lfaG9zdF9yZWdpc3RlciB0
cmlnZ2VycyBhIGNhbGxiYWNrIHRvIG10a19kc2lfYmluZCwNCj4gd2hpY2ggdXNlcyBkZXZfZ2V0
X2RydmRhdGEgdG8gcmV0cmlldmUgdGhlIG10a19kc2kgc3RydWN0LCBzbyB0aGlzDQo+IHN0cnVj
dHVyZSBuZWVkcyB0byBiZSBzdG9yZWQgaW5zaWRlIHRoZSBkcml2ZXIgZGF0YSBiZWZvcmUgaW52
b2tpbmcgaXQuDQo+IA0KPiBBcyBkcnZkYXRhIGlzIGN1cnJlbnRseSB1bmluaXRpYWxpemVkIGl0
IGxlYWRzIHRvIGEgY3Jhc2ggd2hlbg0KPiByZWdpc3RlcmluZyB0aGUgRFNJIERSTSBlbmNvZGVy
IHJpZ2h0IGFmdGVyIGFjcXVpcmluZw0KPiB0aGUgbW9kZV9jb25maWcuaWRyX211dGV4LCBibG9j
a2luZyBhbGwgc3Vic2VxdWVudCBEUk0gb3BlcmF0aW9ucy4NCj4gDQoNCltzbmlwXQ0KDQo+IA0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDQgKystLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYw0KPiBpbmRleCBkNzcyNjA5MTgxOWMuLmFmNDg3MWRlOWU0YyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IEBAIC0xMjMyLDYgKzEyMzIs
OCBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gDQo+ICAgICAgICAgZHNpLT5ob3N0Lm9wcyA9ICZtdGtfZHNpX29wczsNCj4gICAgICAg
ICBkc2ktPmhvc3QuZGV2ID0gZGV2Ow0KPiArICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBk
ZXYsIGRzaSk7DQo+ICsNCj4gICAgICAgICByZXQgPSBtaXBpX2RzaV9ob3N0X3JlZ2lzdGVyKCZk
c2ktPmhvc3QpOw0KPiAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAgICAgICAgICAgICAgcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gcmVnaXN0ZXIgRFNJIGhvc3Rc
biIpOw0KPiBAQCAtMTI0NSw4ICsxMjQ3LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgICAgICAgIGluaXRfd2FpdHF1ZXVl
X2hlYWQoJmRzaS0+aXJxX3dhaXRfcXVldWUpOw0KDQpJIHdvdWxkIGxpa2UgYWxsIHN0cnVjdCBk
c2kgc2V0dGluZyBkb25lIGJlZm9yZSBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YSgpLg0KU28gbW92ZSBp
bml0X3dhaXRxdWV1ZV9oZWFkKCkgYmVmb3JlIHBsYXRmb3JtX3NldF9kcnZkYXRhKCkuDQoNClJl
Z2FyZHMsDQpDSw0KDQo+IA0KPiAtICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRz
aSk7DQo+IC0NCj4gICAgICAgICBkc2ktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOw0K
PiAgICAgICAgIGRzaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNUT1JfRFNJOw0KPiAN
Cj4gLS0NCj4gMi40My4wDQo+IA0KDQo=

--__=_Part_Boundary_009_901286447.666698473
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO01vbiwmIzMyOzIwMjYtMDItMjMmIzMyO2F0
JiMzMjsxNDoxNiYjMzI7KzAwMDAsJiMzMjtMdWNhJiMzMjtMZW9uYXJkbyYjMzI7U2NvcmNpYSYj
MzI7d3JvdGU6DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYj
MzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0
YWNobWVudHMmIzMyO3VudGlsJiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUm
IzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtUaGUmIzMyO2NhbGwmIzMyO3RvJiMzMjttaXBpX2RzaV9ob3N0X3JlZ2lz
dGVyJiMzMjt0cmlnZ2VycyYjMzI7YSYjMzI7Y2FsbGJhY2smIzMyO3RvJiMzMjttdGtfZHNpX2Jp
bmQsDQomZ3Q7JiMzMjt3aGljaCYjMzI7dXNlcyYjMzI7ZGV2X2dldF9kcnZkYXRhJiMzMjt0byYj
MzI7cmV0cmlldmUmIzMyO3RoZSYjMzI7bXRrX2RzaSYjMzI7c3RydWN0LCYjMzI7c28mIzMyO3Ro
aXMNCiZndDsmIzMyO3N0cnVjdHVyZSYjMzI7bmVlZHMmIzMyO3RvJiMzMjtiZSYjMzI7c3RvcmVk
JiMzMjtpbnNpZGUmIzMyO3RoZSYjMzI7ZHJpdmVyJiMzMjtkYXRhJiMzMjtiZWZvcmUmIzMyO2lu
dm9raW5nJiMzMjtpdC4NCiZndDsmIzMyOw0KJmd0OyYjMzI7QXMmIzMyO2RydmRhdGEmIzMyO2lz
JiMzMjtjdXJyZW50bHkmIzMyO3VuaW5pdGlhbGl6ZWQmIzMyO2l0JiMzMjtsZWFkcyYjMzI7dG8m
IzMyO2EmIzMyO2NyYXNoJiMzMjt3aGVuDQomZ3Q7JiMzMjtyZWdpc3RlcmluZyYjMzI7dGhlJiMz
MjtEU0kmIzMyO0RSTSYjMzI7ZW5jb2RlciYjMzI7cmlnaHQmIzMyO2FmdGVyJiMzMjthY3F1aXJp
bmcNCiZndDsmIzMyO3RoZSYjMzI7bW9kZV9jb25maWcuaWRyX211dGV4LCYjMzI7YmxvY2tpbmcm
IzMyO2FsbCYjMzI7c3Vic2VxdWVudCYjMzI7RFJNJiMzMjtvcGVyYXRpb25zLg0KJmd0OyYjMzI7
DQoNCltzbmlwXQ0KDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyYjMzI7ZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyYjMzI7fCYjMzI7NCYjMzI7KystLQ0KJmd0OyYjMzI7JiMzMjsxJiMz
MjtmaWxlJiMzMjtjaGFuZ2VkLCYjMzI7MiYjMzI7aW5zZXJ0aW9ucygrKSwmIzMyOzImIzMyO2Rl
bGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMNCiZndDsmIzMyO2luZGV4JiMzMjtkNzcyNjA5MTgxOWMuLmFmNDg3MWRl
OWU0YyYjMzI7MTAwNjQ0DQomZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYw0KJmd0OyYjMzI7KysrJiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMNCiZndDsmIzMyO0BAJiMzMjstMTIzMiw2JiMzMjsrMTIzMiw4JiMzMjtAQCYj
MzI7c3RhdGljJiMzMjtpbnQmIzMyO210a19kc2lfcHJvYmUoc3RydWN0JiMzMjtwbGF0Zm9ybV9k
ZXZpY2UmIzMyOypwZGV2KQ0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7ZHNpLSZndDtob3N0Lm9wcyYjMzI7PSYjMzI7JmFtcDttdGtf
ZHNpX29wczsNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
Mjtkc2ktJmd0O2hvc3QuZGV2JiMzMjs9JiMzMjtkZXY7DQomZ3Q7JiMzMjsrJiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCYjMzI7ZHNp
KTsNCiZndDsmIzMyOysNCiZndDsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjtyZXQmIzMyOz0mIzMyO21pcGlfZHNpX2hvc3RfcmVnaXN0ZXIoJmFtcDtkc2ktJmd0
O2hvc3QpOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
O2lmJiMzMjsocmV0JiMzMjsmbHQ7JiMzMjswKQ0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7
JiMzMjtyZXR1cm4mIzMyO2Rldl9lcnJfcHJvYmUoZGV2LCYjMzI7cmV0LCYjMzI7JnF1b3Q7RmFp
bGVkJiMzMjt0byYjMzI7cmVnaXN0ZXImIzMyO0RTSSYjMzI7aG9zdCYjOTI7biZxdW90Oyk7DQom
Z3Q7JiMzMjtAQCYjMzI7LTEyNDUsOCYjMzI7KzEyNDcsNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7
aW50JiMzMjttdGtfZHNpX3Byb2JlKHN0cnVjdCYjMzI7cGxhdGZvcm1fZGV2aWNlJiMzMjsqcGRl
dikNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO2luaXRfd2FpdHF1ZXVlX2hlYWQoJmFtcDtkc2ktJmd0O2lycV93YWl0X3F1ZXVlKTsN
Cg0KSSYjMzI7d291bGQmIzMyO2xpa2UmIzMyO2FsbCYjMzI7c3RydWN0JiMzMjtkc2kmIzMyO3Nl
dHRpbmcmIzMyO2RvbmUmIzMyO2JlZm9yZSYjMzI7cGxhdGZvcm1fc2V0X2RydmRhdGEoKS4NClNv
JiMzMjttb3ZlJiMzMjtpbml0X3dhaXRxdWV1ZV9oZWFkKCkmIzMyO2JlZm9yZSYjMzI7cGxhdGZv
cm1fc2V0X2RydmRhdGEoKS4NCg0KUmVnYXJkcywNCkNLDQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7
LSYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7cGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwmIzMyO2RzaSk7DQomZ3Q7JiMzMjstDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMy
OyYjMzI7JiMzMjsmIzMyOyYjMzI7ZHNpLSZndDticmlkZ2Uub2Zfbm9kZSYjMzI7PSYjMzI7ZGV2
LSZndDtvZl9ub2RlOw0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMz
MjsmIzMyO2RzaS0mZ3Q7YnJpZGdlLnR5cGUmIzMyOz0mIzMyO0RSTV9NT0RFX0NPTk5FQ1RPUl9E
U0k7DQomZ3Q7JiMzMjsNCiZndDsmIzMyOy0tDQomZ3Q7JiMzMjsyLjQzLjANCiZndDsmIzMyOw0K
DQoNCjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHBy
ZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UNCiAqKioqKioq
KioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBt
ZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWws
IHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Ns
b3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZl
eWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1p
bmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9m
IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVs
LiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9y
IGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0
aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAo
aW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0K
ZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4g
VGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_901286447.666698473--

