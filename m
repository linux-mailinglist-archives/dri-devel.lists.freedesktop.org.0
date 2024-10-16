Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498299FE5A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 03:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFAE10E27A;
	Wed, 16 Oct 2024 01:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="CoFIuu3l";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="DBK85WQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266910E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 01:35:14 +0000 (UTC)
X-UUID: dff1aa768b5e11ef88ecadb115cee93b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=NHYcsVcyzRRSfnXfgp3I9iou54RWFJsWZFnYSCcvd7c=; 
 b=CoFIuu3lAcBeW/s2w9ZWnE0HOTMVMo7Yeon4qSN/WR3N4dB7krn/l3wOK+YSXhbWzxY/DXqPsr5QoSCEsoju4sCG7pikVm719qSg/8UU6eYaOKJhN5EggbY/PIv503GZbpHYCRwq/1Vzay1JuQVor0rZSYrMUOLN2xjhwBjvkNA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:62520fe8-61b9-4bff-b7c9-e598266e84fe, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:45035141-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
 l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dff1aa768b5e11ef88ecadb115cee93b-20241016
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1274772953; Wed, 16 Oct 2024 09:35:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 09:35:06 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 09:35:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxJfXKA2iKC2FI2xBQuGhIFJ7/kybIvzO/hZjfIS0HAIkmOZOphB8O6NvrYvacw6zR83pRfiReC+BxyPUok95JVFjDLna+ZIm9ScGsgz0jf+7p3ZT6Hdt55QSU/TuRLlJKxmx/R4uU66EgeyTh9/rRbYZf0n4GqHRFK/zddxcJvEa69DWRi3244nzEjYKfBFE0Z/bN8zEKYcBo5Nd/yqLMUbMIE8POJHDFSTwbODWT4nMNKRMYXo2syh2GPjZgmyBRTOc4MnWrYd8EI3KzknLHpEdbr1y/ZDYMFWMzSBgxMy1qUfiXAQAb/qT2h12sHEimh4Nlk74JXjbosltvhkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIeTxSHVQZ8IZ9UpHMRakq9p8sr43+L2PojQx/40w7Y=;
 b=mfILP1mQssu2OAC6YEyOP0bmIZ4lxfRbq80zu7tPpU4xdQ8C1FD/GqPBucuI1DDm/YEN3N3z3GXrrYkxjAOJpLWg/fTH8Q57rKspFdhYy/LA95Hf2TUt/UgmvMC5DP91NX/1rnckCkuyJO68T/2o1cBA62AN6im4U3PNsMgC9Ebys/hl7Fc3XEMrgs8Qr5Lb8XWk36ybI/F/byT25ZrCYVxTlnVykUHV/3jce2xS3Vsw78/Jiy5sV4bzArarygxU8z9UZCcIqyr8nqkVzyCcUR0ZPwN4wLxO9JHb9y9lMmg/IgtSm1g2VPkCPfcpmfREnh1PXNKPXS+baUywt+fuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIeTxSHVQZ8IZ9UpHMRakq9p8sr43+L2PojQx/40w7Y=;
 b=DBK85WQDV+6cs+979rw8nwZruexEaZVhZvU2Vv1iJIISYklSg9k6yE0KdFzg5V1GaeMNJ829VrYjGgXuUpv7RUcWy9ja/O2sFPwCHnGstH1OhL+6KWvdiNdUfAr3SivHtsZdGrMnSZmxFHO9d4oXwiBi/3TMh4hPV3xNF+JlIOw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7734.apcprd03.prod.outlook.com (2603:1096:101:124::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 01:35:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 01:35:02 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
 <Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
 <Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
 <hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
 <Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Thread-Topic: [PATCH v1 08/10] media: platform: mediatek: add isp_7x state ctrl
Thread-Index: AQHbGj2y1UKRq3h+wU6S0U6tpTQ9lbKIosEA
Date: Wed, 16 Oct 2024 01:35:02 +0000
Message-ID: <632e61f1fbcfc92f3358ca2165dd0f39fb91d60a.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-9-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7734:EE_
x-ms-office365-filtering-correlation-id: f5896e5a-faf2-4991-a330-08dced82c196
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MGxwSXZadzdoazk1b0t5b1dIYzdzejhtTjBIeHFqaGRtVUI3ZWZKT1lXTHFD?=
 =?utf-8?B?cTNJcTlYYWFFcDRHcC8wMFlVR1RHeEZEcHdjaGp6VVA1SzE2ZENla2E1elRM?=
 =?utf-8?B?eTllWFoxUHZmSHR5YzFpTzlDaXVXcWJ3WTZnOUZCQVBrcGZVSXdySDZKSmFR?=
 =?utf-8?B?SGxSRnJJNUZlcVFJYzVTa2x4U1Y3SUtrRHcvdm9lOWV0eXNuNXQzODNrWFdT?=
 =?utf-8?B?cXNycmVtbXhrZDBJQWpzOTZqWitEdldNVUorRGM2Q2NLdUxwRlFzaElYY1V2?=
 =?utf-8?B?by80SmVpRjBobFltOE9QayszblJ5WlFidWE3MzJqS1U1WU5TM2ZyUnk0K0pH?=
 =?utf-8?B?Q0dQWTVCSlFCM2QwMGkwRXFIcjVBaUl6TW00VkM1MC9XR3NCUDREbi9IUEtw?=
 =?utf-8?B?TjR1Qm43Q0FrU0hMaFl0V2trRGNDODV5NS9RSUFtZFhkTkRvMUZwMHZmd0xp?=
 =?utf-8?B?a1NBUzhONmRoUmk5c0x4L0M0SWpoTEt4dThDMXVJa0JKM0lTKzZicjdiZ3F4?=
 =?utf-8?B?RnlHSmRuNFNZV2R0eEJEUlYrSHZvRkk4UDU0azIzQVJpMXg2czBuQ0dUb0wy?=
 =?utf-8?B?d3UvbzF4VDA2TlN5NGYyQUhYRm5GdjZtMUpScjlVanhIdWNuUlluTkZ0UC91?=
 =?utf-8?B?N1JRMVlsNXM5ME41U1J1Y3JDYWt5ZFhqRHdvTndEUnpuQXdjT1ByM0YxK01x?=
 =?utf-8?B?eHdSQURtUjRZajBjeldpZDlNTCtXMnplL3cwajBmUEQwdHFBSm0xUmRES0l0?=
 =?utf-8?B?WWl3aHZKR2FoRzU4VmdqRTZpaithenpBVUVCYktSU0UyR3VNYUZROXVjTmdR?=
 =?utf-8?B?ZTRPL2RqRkUzM1I0NS9VZW5wZGNxRHBOMU9pTlNZVmJTWm5rZTZJZVdmbkh4?=
 =?utf-8?B?cUJwZkM4TXZBSG54TThYdnBRWmVkZ0Vid0o0S1dZYVhoSlNOMU5DMjY2My9O?=
 =?utf-8?B?dzdLK3JUM3hsZ0t0N25LYnJTTVZ1MThTS1pTM1NOaEU5bVBJQXBuWkViKzdv?=
 =?utf-8?B?YnZKd3dpeTd6eEtWcUczM3pRSGR1NGVIRzdTRTlwZHZMYVFCbTRqb1d6ZkRp?=
 =?utf-8?B?Q1h5aE5hU1ZWMmdrUjJCUUYzWVB0YXBjNjUwY1NhRzhCRC9maVA4QWVtYVVt?=
 =?utf-8?B?NEVrU25VUFZYMWMwWURxS0FnNVNzRlFHclFDckFrVHphR2pQSDVqVFBlQmxT?=
 =?utf-8?B?clAvTFZWMzhLa1dnc21VQ3FhR09rSm9SUFZSUkRTckxhVzErVGc2ZkpwdjAr?=
 =?utf-8?B?WXJqUm5WbUFkMFFYcmZLZjJHc1NxVmxnV1lCV29yNFlpOHNwd3BvZW1rRnBn?=
 =?utf-8?B?TmxCaDNSQ2FsNmxPYXU0MVU2M1JLekpVNis3T2g2eXpJR0VpREV6NURsOXlH?=
 =?utf-8?B?ZmJBcU1RV01udnNXVkxQV2hqeU9HcEFocXJ4M01kclZSRWRlRWg4dm9sRG1L?=
 =?utf-8?B?dlJLWVE4QUg4WDRRQjM1VmVhZ3RlRDdCSWFLc2dhS2Vla05UT0dMZnFJWjMv?=
 =?utf-8?B?UFQ3Ly9sem81NkM0OEFHMHZBcGVrWnNMYnpxTCtjK3lKcGt4Q0U3UEJjYzdo?=
 =?utf-8?B?eWY3MVRCMVlDQkxQR1RVbk95TmZrbFR3VE44UVdRay9tUm5RTkVDVEtHVk9H?=
 =?utf-8?B?WFFRUnl4cEFEQS9ZS1VTaEVrOWlRekhlRVBVa1VqM3lwL2R3Y3FUbVRvbmpn?=
 =?utf-8?B?TkRBaDVCRm8zWFR6UFJTR0ErNC9DRUpyeXRQMC9WRERQaGQzc1hhUHpib1Nw?=
 =?utf-8?B?LzY1Sy9mbUJrZkNUblBUS3VXOXNPWC96MmpzYzRtT05HaDM4amxzQ0Y5d2dE?=
 =?utf-8?B?MG9adU0zQ1pnU2NpclpPUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2VyUHdwTEFmaU95eDVwczZZYWZURDZLRVNvcUVFYlVyUVp0Q211YW9Ga1lv?=
 =?utf-8?B?UmlzVUQ1OS9nWjlvZkducjFSM0QvOWpPdFU5RHp3TnltTmpWNXhMYlkrVEp0?=
 =?utf-8?B?aXovWDVIdEYyM2E5aHJkaGpQR1hBWjg0YklLQkhkS0Qvekl3MGZWMHRRbHZL?=
 =?utf-8?B?elpMV1JOKy9iREpDMU1Sc0tQN0x6WDlWMHBZL3c1bGlReGh4YW1zN0Y0VGJs?=
 =?utf-8?B?UFN0Q0R0dnAvN2hEaXVWRlFRL2hGUVVoeGJ3YUxiVG5Zck05SmROdE5uY0pT?=
 =?utf-8?B?MUlDYzJkVGtVMGN5VmZYdERZcEkzS281azlLb2tKSmpNNWkvL3hXWUVvNHdC?=
 =?utf-8?B?VTlTN0M4clp6K25IU0xsNllab0d1aWpkTW5aQlAvcUZweHdhUUFFU0NmTUNI?=
 =?utf-8?B?cGVDZkoyall5MzloSUh0V25Bd0Z0V3k3alhPTFNFTzNuSHJSNE9MSnVwS3Jm?=
 =?utf-8?B?WS9nWEc0Vm1lbHAyMjl5VmlSajhBRHl1TWRLeCt6WkpZQ2NRQkFWdFYwdzRV?=
 =?utf-8?B?N21xUFlRNU5scHJmZlRaaEd0YlNQbXBLQmZkaCtLQVlSMEVnd0F1N2pTOUUx?=
 =?utf-8?B?MENBaW5JVVFCbytmU2hxZmx3ekcvR1l2eFBSR2RXSHFHbnMvVGNUUW93SFpJ?=
 =?utf-8?B?S2RNUGtjYUhjK0JPRXNMQUlLQy81OFRxMDRuekVyYmh5TE1JM3hHTFNKZlRQ?=
 =?utf-8?B?NWtJTFVpWHhQMUFwRlRKQlVrbmlySGUyVmFWTEdmSU8zVUF0a1pOMHplNUJJ?=
 =?utf-8?B?Sm1RazM4Sm81OHdqTVMxRUh3aGgvVkY4UnNvMkR6eHZjWFBGc3pjL0h2Y3pT?=
 =?utf-8?B?U09wTUdjd1kvQmpPMWovS1BWbHhkWi85OUVZVzVLR29PaittdEFuckZyUE9U?=
 =?utf-8?B?QTVlUGRsNERPZUI0ODMzZHBkUjNDa0dzY1I5T3ZVcmUxTTdWeXFnRDJEZW5p?=
 =?utf-8?B?bE1LVHFBMEhYa3hOY3pUMDlqa0xkMUwvbUpudVRXQjNQSlU2alRpSHdWTkFv?=
 =?utf-8?B?aVhMaEErNDZHVEk4WXpZUEZUemVqaHd6alprdzA0Y3JOeUdSNXdWMVBnR3FC?=
 =?utf-8?B?bzhKdVhGU0pPakM5Um9mQXBYSXorU0FzL2luQ0F2ZjlZbmE3MFVGLzlGRCtN?=
 =?utf-8?B?bnM1ODQ0Vk1WNVVkUHFuK05nWGhPZGhGYXNlNE40OSszeW1BZXBrdWJneVRa?=
 =?utf-8?B?YWRwcFlOKzFsSzFKc1YweDBpQ1RlVzUzVjFPL0hBYWdCLzVFY2lDQjQ4TFZQ?=
 =?utf-8?B?M0pOZGFoem1peXBocHlDNVBtMS94OUVwYkVTbkEwQ3AvNk03bWJPMnptUHVs?=
 =?utf-8?B?TzdQTmtUb3ZUZzlPaEROUk5sM2VHVXQzNFM3Q3hDZDVNUmpiUTlMNFB1M0F2?=
 =?utf-8?B?K2tJYk5wdDVzeVV5eTl0NzUyVU1KcDBpUmVnVVo3T29VdFRCTnhmUVFzMnRP?=
 =?utf-8?B?a0Z2c1p0ZFp2UkF1andqWG5HdWFkb2M1aWg2aHVsVm1lT2thMXE3S1lUNnJI?=
 =?utf-8?B?dzFqMmdZNVpvZGgrNjQ2LzN6QXh1OUpRUU1DVVFrNnFuWHQveThFUmxvVFNo?=
 =?utf-8?B?TGxZWlY1L3lEV1hoYkh4R1NWR0RDS3FURDJvMGh3RkRQVDU4NG1mRUlQYU5G?=
 =?utf-8?B?R1o4VWJQVUZ1R1NhZnBsbW9mcDRjMXFxSVlHVUdlM25KYnV0SlRHMkpkQ0sy?=
 =?utf-8?B?T2VOMmJrUGpOY1l6anlPS2pWdHVQQmFucko3M2ptK2NOR1VnNW5tcksvS0hU?=
 =?utf-8?B?eGN1UFBNc3BrU1NrRzliYklybUlRemxrdm9rU0c3SVVaS2R5L2VaWGpEMUhz?=
 =?utf-8?B?dFBLMzJQRVZuZVNWUzBSWXhOZWtHZ3IzUk1xT21nVXptKzVKeWZROWJROHJ4?=
 =?utf-8?B?U0RwaGFMbmZ5eGRWdmIvcmxLSlMveHNxWWlVYzBmVFVXWjlweHVQM0w2enR4?=
 =?utf-8?B?UGFLUmZ0TFVwU3FVd3UvSTljTXhsQXFSL1hQNkFwdG9HVElsTWgra0JGVkFP?=
 =?utf-8?B?Rmk3NTVjSnV5YlRzSG1rVWU5V2RBQU5tOFVDbFRVdVNEbkFLaE5CamlsVndS?=
 =?utf-8?B?dWI0SVhKNXphcm9yWnpxQ0NyQXd1cm84MFpDdE1jWFNTcWlKakU0QkpxeU1t?=
 =?utf-8?Q?LwazCZrQeR2+C5x3O+tp1Etz3?=
Content-ID: <4BF373D4C4878C4DA5D7A0A348966130@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5896e5a-faf2-4991-a330-08dced82c196
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 01:35:02.8679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9FumaiGZDcJkHgsraswzbL9yBH8dC9rzDIOJ0TK+s4AuW/pEF9rpwZlSx25oMpWSAhf2mmMG7dkZ30L9BGp+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7734
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_2058715888.898643869"
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

--__=_Part_Boundary_003_2058715888.898643869
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHN0YXRlIG1hbmFnZW1lbnQgYW5kIGRl
YnVnZ2luZyBtZWNoYW5pc21zIGZvciB0aGUgTWVkaWFUZWsNCj4gSVNQNy54IGNhbXN5cyBwbGF0
Zm9ybS4gU3RhdGUgbWFuYWdlbWVudCBlc3RhYmxpc2hlcyBjb250cm9sIG92ZXIgSVNQDQo+IG9w
ZXJhdGlvbnMgYW5kIGV2ZW50cywgZGVmaW5pbmcgZGlzdGluY3Qgc3RhdGVzIGZvciByZXF1ZXN0
IGhhbmRsaW5nLA0KPiBzZW5zb3IgY29udHJvbCwgYW5kIGZyYW1lIHN5bmNocm9uaXphdGlvbiwg
ZW5zdXJpbmcgZXZlbnQgcHJvY2Vzc2luZy4NCj4gVGhlIGRlYnVnZ2luZyBtZWNoYW5pc20gZW5z
dXJlcyBzdGFibGUgb3BlcmF0aW9uIGFuZCB0aW1lbHkgZGF0YQ0KPiBjb2xsZWN0aW9uIGR1cmlu
ZyBhbm9tYWxpZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1o
c2lhbmcuWWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGJv
b2wgbXRrX2NhbV9yZXFfZnJhbWVfc3luY19zdGFydChzdHJ1Y3QgbXRrX2NhbV9yZXF1ZXN0ICpy
ZXEpDQo+ICt7DQo+ICsJLyogQWxsIGN0eCB3aXRoIHNlbnNvciBpcyBpbiByZWFkeSBzdGF0ZSAq
Lw0KPiArCXN0cnVjdCBtdGtfY2FtX2RldmljZSAqY2FtID0NCj4gKwkJY29udGFpbmVyX29mKHJl
cS0+cmVxLm1kZXYsIHN0cnVjdCBtdGtfY2FtX2RldmljZSwgbWVkaWFfZGV2KTsNCj4gKwlzdHJ1
Y3QgbXRrX2NhbV9jdHggKmN0eDsNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9jdHggKnN5bmNfY3R4W01U
S0NBTV9TVUJERVZfTUFYXTsNCj4gKwlpbnQgaTsNCj4gKwl1MzIgY3R4X2NudCA9IDAsIHN5bmNl
ZF9jbnQgPSAwOw0KPiArCWJvb2wgcmV0ID0gZmFsc2U7DQo+ICsNCj4gKwkvKiBwaWNrIG91dCB0
aGUgdXNlZCBjdHhzICovDQo+ICsJZm9yIChpID0gMDsgaSA8IGNhbS0+bWF4X3N0cmVhbV9udW07
IGkrKykgew0KPiArCQlpZiAoISgxIDw8IGkgJiByZXEtPmN0eF91c2VkKSkNCj4gKwkJCWNvbnRp
bnVlOw0KPiArDQo+ICsJCXN5bmNfY3R4W2N0eF9jbnRdID0gJmNhbS0+Y3R4c1tpXTsNCj4gKwkJ
Y3R4X2NudCsrOw0KPiArCX0NCj4gKw0KPiArCW11dGV4X2xvY2soJnJlcS0+ZnMub3BfbG9jayk7
DQo+ICsJaWYgKGN0eF9jbnQgPiAxKSB7DQo+ICsJCS8qIG11bHRpIHNlbnNvciBjYXNlICovDQoN
Cm11bHRpIHNlbnNvciBpcyBhZHZhbmNlZCBmdW5jdGlvbiwgc28gc2VwYXJhdGUgbXVsdGkgc2Vu
c29yIHJlbGF0ZWQgY29kZSB0byBhIG11bHRpIHNlbnNvciBwYXRjaC4NCg0KUmVnYXJkcywNCkNL
DQoNCj4gKwkJcmVxLT5mcy5vbl9jbnQrKzsNCj4gKwkJLyogbm90IGZpcnN0IHRpbWUgKi8NCj4g
KwkJaWYgKHJlcS0+ZnMub25fY250ICE9IDEpDQo+ICsJCQlnb3RvIEVYSVQ7DQo+ICsNCj4gKwkJ
Zm9yIChpID0gMDsgaSA8IGN0eF9jbnQ7IGkrKykgew0KPiArCQkJY3R4ID0gc3luY19jdHhbaV07
DQo+ICsJCQlzcGluX2xvY2soJmN0eC0+c3RyZWFtaW5nX2xvY2spOw0KPiArCQkJaWYgKCFjdHgt
PnN0cmVhbWluZykgew0KPiArCQkJCXNwaW5fdW5sb2NrKCZjdHgtPnN0cmVhbWluZ19sb2NrKTsN
Cj4gKwkJCQlkZXZfaW5mbyhjYW0tPmRldiwNCj4gKwkJCQkJICIlczogY3R4KCVkKTogaXMgc3Ry
ZWFtZWQgb2ZmXG4iLA0KPiArCQkJCQkgX19mdW5jX18sIGN0eC0+c3RyZWFtX2lkKTsNCj4gKwkJ
CQljb250aW51ZTsNCj4gKwkJCX0NCj4gKwkJCXNwaW5fdW5sb2NrKCZjdHgtPnN0cmVhbWluZ19s
b2NrKTsNCj4gKw0KPiArCQkJLyogdXBkYXRlIHNlbnNvciBmcmFtZSBzeW5jICovDQo+ICsJCQlp
ZiAoY3R4LT5zeW5jZWQpDQo+ICsJCQkJc3luY2VkX2NudCsrOw0KPiArCQl9DQo+ICsNCj4gKwkJ
LyoNCj4gKwkJICogdGhlIHByZXBhcmVkIHNlbnNvciBpcyBubyBlbm91Z2gsIHNraXANCj4gKwkJ
ICogZnJhbWUgc3luYyBzZXQgZmFpbGVkIG9yIHN0cmVhbSBvZmYNCj4gKwkJICovDQo+ICsJCWlm
IChzeW5jZWRfY250IDwgMikgew0KPiArCQkJbXRrX2NhbV9mc19yZXNldCgmcmVxLT5mcyk7DQo+
ICsJCQlkZXZfaW5mbyhjYW0tPmRldiwgIiVzOiVzOiBzZW5zb3IgaXMgbm90IHJlYWR5XG4iLA0K
PiArCQkJCSBfX2Z1bmNfXywgcmVxLT5yZXEuZGVidWdfc3RyKTsNCj4gKwkJCWdvdG8gRVhJVDsN
Cj4gKwkJfQ0KPiArDQo+ICsJCWRldl9kYmcoY2FtLT5kZXYsICIlczolczpmc19zeW5jX2ZyYW1l
KDEpOiBjdHhzOiAweCV4XG4iLA0KPiArCQkJX19mdW5jX18sIHJlcS0+cmVxLmRlYnVnX3N0ciwg
cmVxLT5jdHhfdXNlZCk7DQo+ICsNCj4gKwkJcmV0ID0gdHJ1ZTsNCj4gKwkJZ290byBFWElUOw0K
PiArCX0NCj4gKwkvKiBzaW5nbGUgc2Vuc29yIGNhc2U6IHVuc3VwcG9ydGVkIHNlbnNvciBoYXJk
d2FyZSBzeW5jICovDQo+ICsNCj4gK0VYSVQ6DQo+ICsJZGV2X2RiZyhjYW0tPmRldiwgIiVzOiVz
OnRhcmdldC9vbi9vZmYoJWQvJWQvJWQpXG4iLCBfX2Z1bmNfXywNCj4gKwkJcmVxLT5yZXEuZGVi
dWdfc3RyLCByZXEtPmZzLnRhcmdldCwgcmVxLT5mcy5vbl9jbnQsDQo+ICsJCXJlcS0+ZnMub2Zm
X2NudCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZyZXEtPmZzLm9wX2xvY2spOw0KPiArCXJldHVybiBy
ZXQ7DQo+ICt9DQo+ICsNCg==

--__=_Part_Boundary_003_2058715888.898643869
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGksJiMzMjtTaHUtaHNpYW5nOg0KDQpPbiYjMzI7V2Vk
LCYjMzI7MjAyNC0xMC0wOSYjMzI7YXQmIzMyOzE5OjE1JiMzMjsrMDgwMCwmIzMyO1NodS1oc2lh
bmcmIzMyO1lhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7SW50cm9kdWNlcyYjMzI7c3RhdGUmIzMy
O21hbmFnZW1lbnQmIzMyO2FuZCYjMzI7ZGVidWdnaW5nJiMzMjttZWNoYW5pc21zJiMzMjtmb3Im
IzMyO3RoZSYjMzI7TWVkaWFUZWsNCiZndDsmIzMyO0lTUDcueCYjMzI7Y2Ftc3lzJiMzMjtwbGF0
Zm9ybS4mIzMyO1N0YXRlJiMzMjttYW5hZ2VtZW50JiMzMjtlc3RhYmxpc2hlcyYjMzI7Y29udHJv
bCYjMzI7b3ZlciYjMzI7SVNQDQomZ3Q7JiMzMjtvcGVyYXRpb25zJiMzMjthbmQmIzMyO2V2ZW50
cywmIzMyO2RlZmluaW5nJiMzMjtkaXN0aW5jdCYjMzI7c3RhdGVzJiMzMjtmb3ImIzMyO3JlcXVl
c3QmIzMyO2hhbmRsaW5nLA0KJmd0OyYjMzI7c2Vuc29yJiMzMjtjb250cm9sLCYjMzI7YW5kJiMz
MjtmcmFtZSYjMzI7c3luY2hyb25pemF0aW9uLCYjMzI7ZW5zdXJpbmcmIzMyO2V2ZW50JiMzMjtw
cm9jZXNzaW5nLg0KJmd0OyYjMzI7VGhlJiMzMjtkZWJ1Z2dpbmcmIzMyO21lY2hhbmlzbSYjMzI7
ZW5zdXJlcyYjMzI7c3RhYmxlJiMzMjtvcGVyYXRpb24mIzMyO2FuZCYjMzI7dGltZWx5JiMzMjtk
YXRhDQomZ3Q7JiMzMjtjb2xsZWN0aW9uJiMzMjtkdXJpbmcmIzMyO2Fub21hbGllcy4NCiZndDsm
IzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1NodS1oc2lhbmcmIzMyO1lhbmcmIzMy
OyZsdDtTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7LS0tDQoNCltz
bmlwXQ0KDQomZ3Q7JiMzMjsrc3RhdGljJiMzMjtib29sJiMzMjttdGtfY2FtX3JlcV9mcmFtZV9z
eW5jX3N0YXJ0KHN0cnVjdCYjMzI7bXRrX2NhbV9yZXF1ZXN0JiMzMjsqcmVxKQ0KJmd0OyYjMzI7
K3sNCiZndDsmIzMyOysvKiYjMzI7QWxsJiMzMjtjdHgmIzMyO3dpdGgmIzMyO3NlbnNvciYjMzI7
aXMmIzMyO2luJiMzMjtyZWFkeSYjMzI7c3RhdGUmIzMyOyovDQomZ3Q7JiMzMjsrc3RydWN0JiMz
MjttdGtfY2FtX2RldmljZSYjMzI7KmNhbSYjMzI7PQ0KJmd0OyYjMzI7K2NvbnRhaW5lcl9vZihy
ZXEtJmd0O3JlcS5tZGV2LCYjMzI7c3RydWN0JiMzMjttdGtfY2FtX2RldmljZSwmIzMyO21lZGlh
X2Rldik7DQomZ3Q7JiMzMjsrc3RydWN0JiMzMjttdGtfY2FtX2N0eCYjMzI7KmN0eDsNCiZndDsm
IzMyOytzdHJ1Y3QmIzMyO210a19jYW1fY3R4JiMzMjsqc3luY19jdHhbTVRLQ0FNX1NVQkRFVl9N
QVhdOw0KJmd0OyYjMzI7K2ludCYjMzI7aTsNCiZndDsmIzMyOyt1MzImIzMyO2N0eF9jbnQmIzMy
Oz0mIzMyOzAsJiMzMjtzeW5jZWRfY250JiMzMjs9JiMzMjswOw0KJmd0OyYjMzI7K2Jvb2wmIzMy
O3JldCYjMzI7PSYjMzI7ZmFsc2U7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO3BpY2sm
IzMyO291dCYjMzI7dGhlJiMzMjt1c2VkJiMzMjtjdHhzJiMzMjsqLw0KJmd0OyYjMzI7K2ZvciYj
MzI7KGkmIzMyOz0mIzMyOzA7JiMzMjtpJiMzMjsmbHQ7JiMzMjtjYW0tJmd0O21heF9zdHJlYW1f
bnVtOyYjMzI7aSsrKSYjMzI7ew0KJmd0OyYjMzI7K2lmJiMzMjsoISgxJiMzMjsmbHQ7Jmx0OyYj
MzI7aSYjMzI7JmFtcDsmIzMyO3JlcS0mZ3Q7Y3R4X3VzZWQpKQ0KJmd0OyYjMzI7K2NvbnRpbnVl
Ow0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7K3N5bmNfY3R4W2N0eF9jbnRdJiMzMjs9JiMzMjsmYW1w
O2NhbS0mZ3Q7Y3R4c1tpXTsNCiZndDsmIzMyOytjdHhfY250Kys7DQomZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7Kw0KJmd0OyYjMzI7K211dGV4X2xvY2soJmFtcDtyZXEtJmd0O2ZzLm9wX2xvY2spOw0K
Jmd0OyYjMzI7K2lmJiMzMjsoY3R4X2NudCYjMzI7Jmd0OyYjMzI7MSkmIzMyO3sNCiZndDsmIzMy
OysvKiYjMzI7bXVsdGkmIzMyO3NlbnNvciYjMzI7Y2FzZSYjMzI7Ki8NCg0KbXVsdGkmIzMyO3Nl
bnNvciYjMzI7aXMmIzMyO2FkdmFuY2VkJiMzMjtmdW5jdGlvbiwmIzMyO3NvJiMzMjtzZXBhcmF0
ZSYjMzI7bXVsdGkmIzMyO3NlbnNvciYjMzI7cmVsYXRlZCYjMzI7Y29kZSYjMzI7dG8mIzMyO2Em
IzMyO211bHRpJiMzMjtzZW5zb3ImIzMyO3BhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KJmd0OyYj
MzI7K3JlcS0mZ3Q7ZnMub25fY250Kys7DQomZ3Q7JiMzMjsrLyomIzMyO25vdCYjMzI7Zmlyc3Qm
IzMyO3RpbWUmIzMyOyovDQomZ3Q7JiMzMjsraWYmIzMyOyhyZXEtJmd0O2ZzLm9uX2NudCYjMzI7
IT0mIzMyOzEpDQomZ3Q7JiMzMjsrZ290byYjMzI7RVhJVDsNCiZndDsmIzMyOysNCiZndDsmIzMy
Oytmb3ImIzMyOyhpJiMzMjs9JiMzMjswOyYjMzI7aSYjMzI7Jmx0OyYjMzI7Y3R4X2NudDsmIzMy
O2krKykmIzMyO3sNCiZndDsmIzMyOytjdHgmIzMyOz0mIzMyO3N5bmNfY3R4W2ldOw0KJmd0OyYj
MzI7K3NwaW5fbG9jaygmYW1wO2N0eC0mZ3Q7c3RyZWFtaW5nX2xvY2spOw0KJmd0OyYjMzI7K2lm
JiMzMjsoIWN0eC0mZ3Q7c3RyZWFtaW5nKSYjMzI7ew0KJmd0OyYjMzI7K3NwaW5fdW5sb2NrKCZh
bXA7Y3R4LSZndDtzdHJlYW1pbmdfbG9jayk7DQomZ3Q7JiMzMjsrZGV2X2luZm8oY2FtLSZndDtk
ZXYsDQomZ3Q7JiMzMjsrJiMzMjsmcXVvdDslczomIzMyO2N0eCglZCk6JiMzMjtpcyYjMzI7c3Ry
ZWFtZWQmIzMyO29mZiYjOTI7biZxdW90OywNCiZndDsmIzMyOysmIzMyO19fZnVuY19fLCYjMzI7
Y3R4LSZndDtzdHJlYW1faWQpOw0KJmd0OyYjMzI7K2NvbnRpbnVlOw0KJmd0OyYjMzI7K30NCiZn
dDsmIzMyOytzcGluX3VubG9jaygmYW1wO2N0eC0mZ3Q7c3RyZWFtaW5nX2xvY2spOw0KJmd0OyYj
MzI7Kw0KJmd0OyYjMzI7Ky8qJiMzMjt1cGRhdGUmIzMyO3NlbnNvciYjMzI7ZnJhbWUmIzMyO3N5
bmMmIzMyOyovDQomZ3Q7JiMzMjsraWYmIzMyOyhjdHgtJmd0O3N5bmNlZCkNCiZndDsmIzMyOytz
eW5jZWRfY250Kys7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KJmd0OyYjMzI7Ky8qDQomZ3Q7
JiMzMjsrJiMzMjsqJiMzMjt0aGUmIzMyO3ByZXBhcmVkJiMzMjtzZW5zb3ImIzMyO2lzJiMzMjtu
byYjMzI7ZW5vdWdoLCYjMzI7c2tpcA0KJmd0OyYjMzI7KyYjMzI7KiYjMzI7ZnJhbWUmIzMyO3N5
bmMmIzMyO3NldCYjMzI7ZmFpbGVkJiMzMjtvciYjMzI7c3RyZWFtJiMzMjtvZmYNCiZndDsmIzMy
OysmIzMyOyovDQomZ3Q7JiMzMjsraWYmIzMyOyhzeW5jZWRfY250JiMzMjsmbHQ7JiMzMjsyKSYj
MzI7ew0KJmd0OyYjMzI7K210a19jYW1fZnNfcmVzZXQoJmFtcDtyZXEtJmd0O2ZzKTsNCiZndDsm
IzMyOytkZXZfaW5mbyhjYW0tJmd0O2RldiwmIzMyOyZxdW90OyVzOiVzOiYjMzI7c2Vuc29yJiMz
MjtpcyYjMzI7bm90JiMzMjtyZWFkeSYjOTI7biZxdW90OywNCiZndDsmIzMyOysmIzMyO19fZnVu
Y19fLCYjMzI7cmVxLSZndDtyZXEuZGVidWdfc3RyKTsNCiZndDsmIzMyOytnb3RvJiMzMjtFWElU
Ow0KJmd0OyYjMzI7K30NCiZndDsmIzMyOysNCiZndDsmIzMyOytkZXZfZGJnKGNhbS0mZ3Q7ZGV2
LCYjMzI7JnF1b3Q7JXM6JXM6ZnNfc3luY19mcmFtZSgxKTomIzMyO2N0eHM6JiMzMjsweCV4JiM5
MjtuJnF1b3Q7LA0KJmd0OyYjMzI7K19fZnVuY19fLCYjMzI7cmVxLSZndDtyZXEuZGVidWdfc3Ry
LCYjMzI7cmVxLSZndDtjdHhfdXNlZCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrcmV0JiMzMjs9
JiMzMjt0cnVlOw0KJmd0OyYjMzI7K2dvdG8mIzMyO0VYSVQ7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYj
MzI7Ky8qJiMzMjtzaW5nbGUmIzMyO3NlbnNvciYjMzI7Y2FzZTomIzMyO3Vuc3VwcG9ydGVkJiMz
MjtzZW5zb3ImIzMyO2hhcmR3YXJlJiMzMjtzeW5jJiMzMjsqLw0KJmd0OyYjMzI7Kw0KJmd0OyYj
MzI7K0VYSVQ6DQomZ3Q7JiMzMjsrZGV2X2RiZyhjYW0tJmd0O2RldiwmIzMyOyZxdW90OyVzOiVz
OnRhcmdldC9vbi9vZmYoJWQvJWQvJWQpJiM5MjtuJnF1b3Q7LCYjMzI7X19mdW5jX18sDQomZ3Q7
JiMzMjsrcmVxLSZndDtyZXEuZGVidWdfc3RyLCYjMzI7cmVxLSZndDtmcy50YXJnZXQsJiMzMjty
ZXEtJmd0O2ZzLm9uX2NudCwNCiZndDsmIzMyOytyZXEtJmd0O2ZzLm9mZl9jbnQpOw0KJmd0OyYj
MzI7K211dGV4X3VubG9jaygmYW1wO3JlcS0mZ3Q7ZnMub3BfbG9jayk7DQomZ3Q7JiMzMjsrcmV0
dXJuJiMzMjtyZXQ7DQomZ3Q7JiMzMjsrfQ0KJmd0OyYjMzI7Kw0KDQo8L3ByZT4NCjwvcD48L2Jv
ZHk+PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJ
QVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5m
b3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkg
DQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVn
ZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxl
IGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWdu
YXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9u
LCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGlu
ZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGlu
dGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhh
dmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRl
ciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkg
YW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50
cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0t
LT4=

--__=_Part_Boundary_003_2058715888.898643869--

