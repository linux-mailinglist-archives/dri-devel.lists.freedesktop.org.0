Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AYSMdyKpmnMRAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:16:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3431EA072
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 08:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCC010E121;
	Tue,  3 Mar 2026 07:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="drV2byCC";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UkzkdDxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D7E10E121
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 07:16:40 +0000 (UTC)
X-UUID: e403363a16d011f1b7fc4fdb8733b2bc-20260303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=uDVROynQBpzvVTq9kpLsl33pVD1uMo4RN/+mNSxu+t4=; 
 b=drV2byCC+Zx4/Kf3i9X8WoFMg8ykY72kkUtqG9Pp+DXIFAbgLa5ARcY9t1q/peJcDvr7ZytdUZa12XsXJhH2DT/bhm/slEkVeUh7xQto9DDQaea0gL1dKWnV6+jaRGH4USj40Voijosg4keMxf+Z5aQuJrK5jqcsjtMYdC04D/o=;
X-CID-CACHE: Type:Local,Time:202603031516+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:ad23cc00-6558-43a9-be32-a48de5689b11, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:5efa32f1-16bd-4243-b4ca-b08ca08ab1d8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e403363a16d011f1b7fc4fdb8733b2bc-20260303
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 537728781; Tue, 03 Mar 2026 15:16:25 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 15:16:24 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 15:16:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olGpSHTNa7sbXQQu7W8J+8S3FGno9YCoLFnFa+KZKz0IByC9+aNG9LMOzYvJpnoAx4VHBTb7UMRklgyn+GRZWDwPMpeUtJUibOFvy2pfXCMQcvugRK0civMzUHYD//+VTKTHRbjxr70ROwT0dYbveJ69IdfrsX2eafzxiG+gw+d0u1m3IzmsKG9dTF9X/TCx/YKOx29lHRvGsKgu9U0o3gn1dlJ8+hYW8JBzJdFFCfnK9mlwf8Yv8T3DO/YGyRKhPd+2F0hXlhen7nZHELn7BksEGgsuTCqkQxei/tqTWZ47cob5OOGCwyGF5Ti8J6YOAOyzRzQ5xEsBHZikHTN1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDVROynQBpzvVTq9kpLsl33pVD1uMo4RN/+mNSxu+t4=;
 b=mBIfzs7wEeRv/+jiwP/dk05jg8mw2C4rRPn0hoIpsbpnMfNsJfihOhUCh8NBaE5UhODTuPOzxtD1oMxDEnRq41QRFgyGoeYPr5HM9q+NNc5/9qkkWJ7y+NtoGQ3mQCH4pg+hZUb92Zsm5nVtU+2/+Ip/tCBHUTEPKEmSSfrGu8gGlW/ZLZAAQEY7OZrvwO0aySaOvP5s0CcUVTtiC3trFsBL5KxVmkOZhMD1/d+XZRQ5ak8T+ntDJve7pBRseCpvTAgVZwlpdPdKoG3QSTbwJT9W0m6CE5CEX39KC86+4NMtDKyhXGRlZazPf/zjSjCPQtSAKoIZ9sSiFK0gh5Q9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDVROynQBpzvVTq9kpLsl33pVD1uMo4RN/+mNSxu+t4=;
 b=UkzkdDxVRosoY6wmg6sVli1cNJ40/CAJmcZGHUoc/+G0gLj35H/IzFpP85a1hoWvmEJfLPMwSX+3KWwBwei+JuIUMoAkKAEBZr//btsXYt3BtMn97iwM0Q7mbsJZt/CEBVwk1OFuqUUzuOjAw8h+xzg3wahRiyiwQMXJs7F2cPk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PS1PPF948F3CF10.apcprd03.prod.outlook.com (2603:1096:308::2e1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 07:16:20 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 07:16:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Ariel D'Alessandro
 <ariel.dalessandro@collabora.com>, "kernel@collabora.com"
 <kernel@collabora.com>
Subject: Re: [PATCH 10/11] drm/mediatek: ovl: Enable support for R2R Color
 Space Conversion
Thread-Topic: [PATCH 10/11] drm/mediatek: ovl: Enable support for R2R Color
 Space Conversion
Thread-Index: AQHcdEULGlBcpyJac0qQe5Kej5M8b7Wc0rmA
Date: Tue, 3 Mar 2026 07:16:19 +0000
Message-ID: <2ce1ed408fd87366d3abc1e79bc3d1dc055af91b.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <20251223-mtk-ovl-pre-blend-colorops-v1-10-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-10-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PS1PPF948F3CF10:EE_
x-ms-office365-filtering-correlation-id: 338a6eb0-18de-4c9e-c6de-08de78f4c4b3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: xnqkMzla9i19STZBFoIgoB0EEfAwpZS5nzywNJsRZ28bNcyFpeifI6IUq8kiZBqmCVeXjmuyKN41DZ1RL3yQGtQB8nbDuTPdFBprjpgeZhV/A8rwKaAvRBzOCw7pQg80BT1bhRiY0P8qlrWkrYi40Wl2ORl46IYAnbE61+HbgfcuTwCGn/4zHyhySCNGTQLWJZC3WpF4jaR9NMaW5nzF4noHp5ULSZSlLC50O12aGQ2mjw2ruYkKlXYwR/JW8CDR7zsVPvFyq69E98tFSNJCHydyzMQDgUj7TzWQ71K7HO9gPw9DeCxXgcxP5UTcQsfWHjNBDwdVl2UUML22biWzkXG2DpLvgb/7p7ubesQP9WE1wXGz3P2AJhIKtW16IeupJdNUgNZkG1rkyEhn3OXXJG3Whv9U7zRXM9Qvwrvr/zibd7gQ2/xOsKgoMrO13DLIVdF241fZ5KDAIjJbT9hDsJSEUW1pSt9UTPlSfLTwIH2T4V4Enc4lWQajwmjhgcUiZE7dNnguTRMC5kRSPwRqQu8J7TPfJcc2mg3Lyc4p5zJA3yA+OLgsF/7c29ar/AwjG9WPPM5QN8gX9AhX/lf6f/qw5Lh0+V+n9MOBaWSy6fKefP6aZAr54mLvSUGc2tlQqZHHcmluKEvSjLls7ZXjzWhdkXzwfCI7wm1iuIPc6N3dQotRTdyB0fLV3zMy/MlBXRnEWBp7vyXNo5nTCpUtEfLc+cQUulr0P+A0PSN0PBKj0FkHUDsZwEg9NfAooMqBdTKjjlkL92nyCy2bep+rZd52cOux8s7Vtue0OyhGGKNQAnt/BfPrRoQoodfBKY8d
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFBYZHNGY09aR2FRcnIzR2s0R282MXI2bG41Vi9neHdORnlNZE1TVFEzK25C?=
 =?utf-8?B?ZzhFcW9tQ1pGUjFQbkpEZW9YQUtaSmUwM3pQNm1BbVRXTFdqdFhHZ284N1Jk?=
 =?utf-8?B?a2xGSGtDbkNSajhWSFIyR2ViemFGMHVYSWFNc0RPVmdGQ3VsUElieXFXZ3BR?=
 =?utf-8?B?MS9EdGIwR1U0RjFvbDJWbjhjSlFVcXVwOG5YMnFOM2VHYnZLNVZjSEVJbXBp?=
 =?utf-8?B?aGRNV09LdkJ3OXN3U2JxTnlSUEZVdVUyczAxeElVMGsvSnFkeUp5RllWWGVK?=
 =?utf-8?B?TGhmOWpQdUtYZ0kzbURLdXYvd29RaWtGNWdkOHhQYVQ0V1NTWFUvbWlEVVpC?=
 =?utf-8?B?b1QrWXE4NHFwNGhOU2lSc29IVXdtdXRXYndKemk2MGxFZVhnbXNXWC9RWDh1?=
 =?utf-8?B?ZiswQndGclBUMytJYzExN2h3Y1ZUVmlkL2N4b1dXSVdjVFFpUWRRWHNLejVP?=
 =?utf-8?B?OVVzNGV0ZTZSc016Q1ZwZjdBd2JhbmI5cVVRUWtiZWZ1OGRjMDFKekxCbEtq?=
 =?utf-8?B?S3hxUStsa0pZNWZIT0RWOXNmODVDUmNqd3hGZ3hGTlU3bndSdnVjQ3Y0M1dY?=
 =?utf-8?B?NXdIY3dnYmxkOEY4Tm5uZmtOS2JmSXIvY3E0UWFSc2lya0t4dW0wYTNqTWhY?=
 =?utf-8?B?TUF2N0d3djVMMGZqamdscTdzNHZPd21CdG84OUdqSDlLWHdtbzkxNVNpZDNT?=
 =?utf-8?B?bDFIdkQ1bHNWb2g0UzV1Q20yRDV3UE1SOEJJSUN1UTRqbHpTZ21Qb1d5TWtN?=
 =?utf-8?B?bmpGTmRCcFV5MnVobjlsOVBRbHdSdUxlOW1WZ2FkUlJ0c2JEKzhOTGdRekhU?=
 =?utf-8?B?SXg3ajVSelFGTGxuYWMwTzJaamVwSmJtOS9FanVwSlNkaHhoaWJ4Yk5jVmJ6?=
 =?utf-8?B?ZmNrV0lKMHduN1ZjVWt6ZDBJcVMrWUVUSEtvR0NNVWtrY3lvVW1hS1k3WFJX?=
 =?utf-8?B?UytmY1IzcnF4em1RYUNxS0haUlR2K1c3MmtqTWg2TXdjVVJxUlBUQVdUNENa?=
 =?utf-8?B?WXZNQUt4ZDY3THZyUGs3SHZBQVZjYzdBSnkwUnAzVFlGYTJkVENUR2t3YVBY?=
 =?utf-8?B?SXJnODIzUEY5REp2N0d0RHkrWkpKSjdhUlE4Y2VNOExqMHhFMGU0cmtJZkxj?=
 =?utf-8?B?V0lGRVhzZmF2R3d0cWV4TDFtRjBsMkxOUU5MeENndFdEdXZwTFdvZ1FvY01R?=
 =?utf-8?B?YUxOYUlzU3Z3SnRLOVdFQUNGbVkzNTRBeEY3TVhJNmNqSlFERGUvSmJ6elQ0?=
 =?utf-8?B?bVZndEgxc0RGRDJ6NWxPVmlLVUNacEE4bTFxZm91ZnEwb203OXcvWDZQWEs2?=
 =?utf-8?B?VjIrWElXazVGMmdnMEVxV1RtbmkxZmpQdWduUVdpTStaMWk2dzRrTzRTT0k0?=
 =?utf-8?B?WkMrTWp0cys5cndxM1RUZ3FEcWJPUi8yTitaRlQwR1NpMm91aWtYRWY5VWNm?=
 =?utf-8?B?c2hWRzE1WXp3Z0Jnc2ZkcnNGWFFWbVJCOGE0NTBSdXh0cjN6ak1yYk5XTUtW?=
 =?utf-8?B?QTdhMXJET3pRc3hoOENRTlZVbTM5TmlIWjlZM1ZFZzBiMzdETzRjdS96Zi9W?=
 =?utf-8?B?aERFMUUrOGVNUk9wbjVRMGgxNkdYb2tBS0dpT1IvM09lVG0xUVpqWURUS3Ax?=
 =?utf-8?B?REZvWXNteEFxL2x4elZieWZ0bUZzZUg0MC9HVGFjMStxQVJHcXRPM3p2Zkdn?=
 =?utf-8?B?dXdTSWhHS25lbUZrcDBBeGZwQUFWWHFiamFqL1BNV2Fyc3JrSWp6ZEh0dUN4?=
 =?utf-8?B?MjNRWVpxQjIzQi8ybXpUYjF3SThlNjRSV3luam9QdWZ0dXlYWjhZYmZMcmox?=
 =?utf-8?B?Zm9kNXNWVEt0TEZmVmZqZzFlWEdVbkg3Y1Bwenk0M0YxN1hXb1lCQkFYTEJn?=
 =?utf-8?B?WWpxRjBDSkVCUTZUVUxOUjFwS21FV3lXQVI1ZnJBc0JSeEFWNlM2RnUyWUYw?=
 =?utf-8?B?b1NxcU1IbzZqN0xYdjh6RzBHalIrcEpZOUNaTzV2UGtsNG05WFF0NWVheExM?=
 =?utf-8?B?ODUvaktBWWZQcmtqTXRLTkllYkN0YU1iTzh0b2JQdFNNZTJNeXMvWGxWVEF0?=
 =?utf-8?B?KzNiMkc3RDRaaFo1S0VRME1QTDlXZTNKM09kOWJVdDNTWWlWNnhhekR5OTZ0?=
 =?utf-8?B?ME9MMkZOdm9jaFFTZlErdGVacTUvYU81Q3RvWTZwQU82RDRNWjBMcXhaUTRu?=
 =?utf-8?B?anNjVGxTc3BlSW1LNU9hWmw3YlJvUkpZOWdaR1poWFB5aGhsUXZGT3NyVC9K?=
 =?utf-8?B?aGEzenFxSU9HbTBvcXdyVitySFhiZDZMVGhjSHdPTVQxL0tBSGpucXVBUW1o?=
 =?utf-8?B?YXB1NFh2U1NuY0o5cVBPcUNQVGpZRWFXd29pVTIwQzBNOEk3YWczQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <208DD5CC7A87D941A0EA60A080667E24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wNqCf5sbz7rpkwJuVGjOAW2jrn6fVW8+oU6o6LcTyy86/L0KfcC0U5CBsTkayeYiMafgQX0zhsc9TDknAiMsRgE4KDp0lBmC0dJ5M0+nNIFgvGz8Tnle+F7IZzIODqMf4Gmn+DYd/z5awxtMiOfC0+CcnWSaGUYMccxkdOiEPC39TH+vbvOOAlZc2XhAvsYTt1/TpP5yY8lN3WytLmwtvFglAppYoaX4H4Rd368YK0zL7LtdQIPeSmUR+S28VsWgLFvbkR/ZCS5JiT+z68SkWcfKlk/x73uk/W6CTQLi2PoHgFWBGSG541NWwi8PVSM7oMSbwbprCidfYKd18KhWgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338a6eb0-18de-4c9e-c6de-08de78f4c4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 07:16:20.0082 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TwG2AaoDIiwe5UGA+1e2/TefSB4zo67V0TbLElwUimHkqsPfbNNiyNs8IDqnwp3fdDbJz9NqjWTS0LEad6W8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF948F3CF10
X-MTK: N
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
X-Rspamd-Queue-Id: AD3431EA072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:chunkuang.hu@kernel.org,m:simona@ffwll.ch,m:angelogioacchino.delregno@collabora.com,m:airlied@gmail.com,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:nfraprado@collabora.com,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:daniels@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,kernel.org,ffwll.ch,collabora.com,gmail.com,pengutronix.de,linux.intel.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mediatek.com:dkim,mediatek.com:mid,mediateko365.onmicrosoft.com:dkim,collabora.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ck.hu@mediatek.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gDQo+IA0KPiBUaGUgT1ZMIGhhcmR3YXJlIGFsbG93cyBhcHBseWluZyBh
IDN4MyBtYXRyaXggdHJhbnNmb3JtYXRpb24gZm9yIGVhY2gNCj4gbGF5ZXIgdGhyb3VnaCB0aGUg
J1JHQiB0byBSR0IgQ29sb3IgU3BhY2UgQ29udmVyc2lvbicgKFIyUiBDU0MpIHNldHRpbmcuDQo+
IEltcGxlbWVudCBzdXBwb3J0IGZvciBpdCBhbmQgZXhwb3NlIGl0IGFzIGEgY29sb3JvcCB0aHJv
dWdoIHRoZSBEUk0NCj4gcGxhbmUgY29sb3IgcGlwZWxpbmUgdUFQSS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA1NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jDQo+IGluZGV4IGE3MDA5MmM3OTJhOS4uYzhhMmIxYjEzMDM1IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IEBAIC00LDYgKzQs
NyBAQA0KPiAgICovDQo+IA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fYmxlbmQuaD4NCj4gKyNpbmNs
dWRlIDxkcm0vZHJtX2NvbG9yX21nbXQuaD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9yb3Au
aD4NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1f
ZnJhbWVidWZmZXIuaD4NCj4gQEAgLTUyLDYgKzUzLDcgQEANCj4gICNkZWZpbmUgT1ZMX0NPTl9D
TFJGTVRfMTBfQklUICAgICAgICAgICAgICAgICAgICAgICAgICAoMSkNCj4gICNkZWZpbmUgRElT
UF9SRUdfT1ZMX1dDR19DRkcxICAgICAgICAgICAgICAgICAgMHgyZDgNCj4gICNkZWZpbmUgSUdB
TU1BX0VOKGxheWVyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCArIDQgKiAo
bGF5ZXIpKQ0KPiArI2RlZmluZSBDU0NfRU4obGF5ZXIpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVCgxICsgNCAqIChsYXllcikpDQo+ICAjZGVmaW5lIEdBTU1BX0VOKGxheWVy
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMiArIDQgKiAobGF5
ZXIpKQ0KPiAgI2RlZmluZSBESVNQX1JFR19PVkxfV0NHX0NGRzIgICAgICAgICAgICAgICAgICAw
eDJkYw0KPiAgI2RlZmluZSBJR0FNTUFfTUFTSyhsYXllcikgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEdFTk1BU0soKGxheWVyKSAqIDQgKyAxLCAobGF5ZXIpICogNCkNCj4gQEAgLTYyLDYg
KzY0LDcgQEANCj4gICNkZWZpbmUgR0FNTUFfQlQ3MDkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAxDQo+ICAjZGVmaW5lIEdBTU1BX0JUMjAyMCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMg0KPiAgI2RlZmluZSBHQU1NQV9ITEcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDMNCj4gKyNkZWZpbmUgRElTUF9SRUdfT1ZMX1IyUl9QQVJBKGxh
eWVyKSAgICAgICAgICAgKDB4NTAwICsgKGxheWVyKSAqIDB4NDApDQo+ICAjZGVmaW5lIERJU1Bf
UkVHX09WTF9BRERSX01UODE3MyAgICAgICAgICAgICAgIDB4MGY0MA0KPiAgI2RlZmluZSBESVNQ
X1JFR19PVkxfQUREUihvdmwsIG4pICAgICAgICAgICAgICAoKG92bCktPmRhdGEtPmFkZHIgKyAw
eDIwICogKG4pKQ0KPiAgI2RlZmluZSBESVNQX1JFR19PVkxfSERSX0FERFIob3ZsLCBuKSAgICAg
ICAgICAoKG92bCktPmRhdGEtPmFkZHIgKyAweDIwICogKG4pICsgMHgwNCkNCj4gQEAgLTU3OSwx
MSArNTgyLDQ0IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfYXBwbHlfaWdhbW1hKHN0cnVjdCBtdGtf
ZGlzcF9vdmwgKm92bCwgdW5zaWduZWQgaW50IGlkeCwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgSUdBTU1BX0VOKGlkeCkpOw0KPiAgfQ0KPiANCj4gK3N0YXRpYyB2b2lkIG10a19vdmxf
d3JpdGVfcjJyX3BhcmEoc3RydWN0IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25lZCBpbnQgaWR4
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY29sb3Jf
Y3RtICpjdG0sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNt
ZHFfcGt0ICpjbWRxX3BrdCkNCj4gK3sNCj4gKyAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4gKyAg
ICAgICB1NjQgdmFsOw0KPiArDQo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
Y3RtLT5tYXRyaXgpOyBpKyspIHsNCj4gKyAgICAgICAgICAgICAgIHZhbCA9IGRybV9jb2xvcl9j
dG1fczMxXzMyX3RvX3FtX24oY3RtLT5tYXRyaXhbaV0sIDUsIDE4KTsNCj4gKyAgICAgICAgICAg
ICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHZhbCwgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVn
cywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRElTUF9SRUdfT1ZMX1IyUl9QQVJB
KGlkeCkgKyBpICogNCk7DQo+ICsgICAgICAgfQ0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBt
dGtfb3ZsX2FwcGx5X3Iycl9jc2Moc3RydWN0IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25lZCBp
bnQgaWR4LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9j
b2xvcm9wICpjb2xvcm9wLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkNCj4gK3sNCj4gKyAgICAgICBzdHJ1Y3QgZHJtX2NvbG9y
X2N0bSAqY3RtOw0KPiArDQo+ICsgICAgICAgaWYgKGNvbG9yb3AtPnN0YXRlLT5kYXRhICYmIGNv
bG9yb3AtPnN0YXRlLT5kYXRhLT5kYXRhKSB7DQo+ICsgICAgICAgICAgICAgICBjdG0gPSAoc3Ry
dWN0IGRybV9jb2xvcl9jdG0gKiljb2xvcm9wLT5zdGF0ZS0+ZGF0YS0+ZGF0YTsNCj4gKyAgICAg
ICAgICAgICAgIG10a19vdmxfd3JpdGVfcjJyX3BhcmEob3ZsLCBpZHgsIGN0bSwgY21kcV9wa3Qp
Ow0KPiArICAgICAgIH0NCj4gKw0KDQpJZiBieXBhc3MgaW1wbHkgY29sb3JvcC0+c3RhdGUtPmRh
dGEtPmRhdGEgaXMgTlVMTCwgbm90aGluZyBuZWVkIHRvIGNoYW5nZS4NCklmIGJ5cGFzcyBkb2Vz
IG5vdCBpbXBseSBjb2xvcm9wLT5zdGF0ZS0+ZGF0YS0+ZGF0YSBpcyBOVUxMLCBJIHdvdWxkIGxp
a2UgdG8gZGlzYWJsZSBDU0MgZmlyc3QgdGhlbiBjbGVhciByMnIgcGFyYW1ldGVyLg0KDQpSZWdh
cmRzLA0KQ0sNCg0KPiArICAgICAgIG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgY29sb3Jv
cC0+c3RhdGUtPmJ5cGFzcyA/IDAgOiBDU0NfRU4oaWR4KSwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywgRElTUF9SRUdfT1ZMX1dDR19DRkcx
LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBDU0NfRU4oaWR4KSk7DQo+ICt9DQo+ICsN
Cj4gIHN0YXRpYyB2b2lkIG10a19vdmxfYXBwbHlfY29sb3JvcChzdHJ1Y3QgbXRrX2Rpc3Bfb3Zs
ICpvdmwsIHVuc2lnbmVkIGludCBpZHgsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZHJtX2NvbG9yb3AgKmNvbG9yb3AsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQ0KPiAgew0KPiAgICAgICAg
IHN3aXRjaCAoY29sb3JvcC0+dHlwZSkgew0KPiArICAgICAgIGNhc2UgRFJNX0NPTE9ST1BfQ1RN
XzNYMzoNCj4gKyAgICAgICAgICAgICAgIG10a19vdmxfYXBwbHlfcjJyX2NzYyhvdmwsIGlkeCwg
Y29sb3JvcCwgY21kcV9wa3QpOw0KPiArICAgICAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgICAg
Y2FzZSBEUk1fQ09MT1JPUF8xRF9DVVJWRToNCj4gICAgICAgICAgICAgICAgIC8qIGdhbW1hIGlz
IHRoZSBsYXN0IGNvbG9yb3AgaW4gcGlwZWxpbmUgKi8NCj4gICAgICAgICAgICAgICAgIGlmICgh
Y29sb3JvcC0+bmV4dCkNCj4gQEAgLTYwMiw3ICs2MzgsNyBAQCBzdGF0aWMgdm9pZCBtdGtfb3Zs
X2Rpc2FibGVfY29sb3JvcHMoc3RydWN0IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25lZCBpbnQg
aWR4LA0KPiAgew0KPiAgICAgICAgIG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgMCwgJm92
bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRElT
UF9SRUdfT1ZMX1dDR19DRkcxLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICBJR0FNTUFf
RU4oaWR4KSB8IEdBTU1BX0VOKGlkeCkpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICBJ
R0FNTUFfRU4oaWR4KSB8IENTQ19FTihpZHgpIHwgR0FNTUFfRU4oaWR4KSk7DQo+IA0KPiAgICAg
ICAgIC8qIGlnYW1tYSBjdXJ2ZSBuZWVkcyB0byBiZSBzZXQgdG8gZGVmYXVsdCB3aGVuIGlnYW1t
YSBpcyBkaXNhYmxlZCAqLw0KPiAgICAgICAgIG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwg
SUdBTU1BX1NDUkdCLCAmb3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLA0KPiBAQCAtNzcxLDYgKzgw
NywyMyBAQCBtdGtfb3ZsX2luaXRpYWxpemVfcGxhbmVfY29sb3JfcGlwZWxpbmUoc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUsDQo+IA0KPiAgICAgICAgIGkrKzsNCj4gDQo+ICsgICAgICAgLyogMm5k
IG9wOiBPVkwncyBSMlIgQ29sb3IgU3BhY2UgQ29udmVyc2lvbiAqLw0KPiArICAgICAgIG9wc1tp
XSA9IGt6YWxsb2Moc2l6ZW9mKCpvcHNbaV0pLCBHRlBfS0VSTkVMKTsNCj4gKyAgICAgICBpZiAo
IW9wc1tpXSkgew0KPiArICAgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsNCj4gKyAgICAgICAg
ICAgICAgIGdvdG8gZXJyX2FsbG9jOw0KPiArICAgICAgIH0NCj4gKw0KPiArICAgICAgIHJldCA9
IGRybV9wbGFuZV9jb2xvcm9wX2N0bV8zeDNfaW5pdChkZXYsIG9wc1tpXSwgcGxhbmUsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtdGtfb3ZsX2NvbG9y
b3BfZnVuY3MsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IERSTV9DT0xPUk9QX0ZMQUdfQUxMT1dfQllQQVNTKTsNCj4gKyAgICAgICBpZiAocmV0KQ0KPiAr
ICAgICAgICAgICAgICAgZ290byBlcnJfY29sb3JvcF9pbml0Ow0KPiArDQo+ICsgICAgICAgZHJt
X2NvbG9yb3Bfc2V0X25leHRfcHJvcGVydHkob3BzW2kgLSAxXSwgb3BzW2ldKTsNCj4gKw0KPiAr
ICAgICAgIGkrKzsNCj4gKw0KPiAgICAgICAgIC8qIDNyZCBvcDogT1ZMJ3MgR2FtbWEgKi8NCj4g
ICAgICAgICBvcHNbaV0gPSBremFsbG9jKHNpemVvZigqb3BzW2ldKSwgR0ZQX0tFUk5FTCk7DQo+
ICAgICAgICAgaWYgKCFvcHNbaV0pIHsNCj4gDQo+IC0tDQo+IDIuNTEuMA0KPiANCg0K
