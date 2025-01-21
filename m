Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EAEA1828A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 18:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3749710E608;
	Tue, 21 Jan 2025 17:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="B+NoYikm";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mD8cxfra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B36B10E608
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 17:07:24 +0000 (UTC)
X-UUID: 2ae1d74cd81a11ef99858b75a2457dd9-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=pj9ieAeyAKAAJBhVnDhK2j7yk4vaylil0Z5cVVZsH4c=; 
 b=B+NoYikm0EmTXgfvKdXDI3QyfN6M+FFQrNGvJ4K4WqnIcX6yaV9BQZ+5j7DLRc/RcoX4aEuBR1ITXsra2PRzM16f4f76B374xJoGTI2HqLttwZbHLzcIng8yPT8VOs6FZdVOAe08JHU9aQoFLQahu0ShQMGxT0uBZjFXZSkVcJg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:9fab62a7-af18-49d5-b8f0-be9b1a6b58be, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:60aa074, CLOUDID:99653d38-e11c-4c1a-89f7-e7a032832c40,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
 EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2ae1d74cd81a11ef99858b75a2457dd9-20250122
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 449572847; Wed, 22 Jan 2025 01:07:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 22 Jan 2025 01:07:15 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 22 Jan 2025 01:07:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUj2PxIcDCas3UdMdWp2C7Fofquu3UXAuj8zPY6X06S4gy+jk4Inun8Q02xxq94Q7YEyuOvpBnQd9yxKE5SkecZ8ymkJFc3VhjHAkZIKAPEBVCfum5fj9B5f5d9bTOnCFfHjskk2IyYOQxP0jQx2TrpkdMjH1ZRtzUB1ZmZW5JyvhTcqZZtUcOI0sfCIfQYRFXH5E4dIGkWFxWthU5vjOjbbM8ohNAi9WKdZHdGnIlVwC5ZBBlRw1ltC6y5+pxdYkrB5rGveMI87DgTtdrtQWDj2dBJwIO6nY6IPaKtls951AvtuojIOCZMqmI7QKIbc/UNL/C+J8k3XO6/HU6KzHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV9QgzRFHqyStXbAnIlnPr1NlDmEDP9fmt4RD9o/uI8=;
 b=cXpHLJJEcMSWyL+Bn60kXS12Lzn870TFirp0woYG69rFZybLy1VBP3Zh4NAvzxGvgq8lWIcNaetojGEi/neg8+4OlkBxcWqMg9bJerfcNM2eEOQIEl/PSi0m6eJ1JWRKqtvXzp0yHzQvUQqXEJ+/NzSeYMQkm1wITN1gbUyiANSj2ODAPdnrFClEgab6VS97lhCZu9fx3DRjqtoYFTybWYv6v/IiRRZDVs7+OVOe6X7+nzVDKFmRRK47Q98KhG9uQfK1s94RE4hzZXYN+Fvhv1tMq75l2HpwwZ3VVLJIDhWMvsg4XbB9HtVg19gfwNyfSDxltIreTEbkAuIma4yLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV9QgzRFHqyStXbAnIlnPr1NlDmEDP9fmt4RD9o/uI8=;
 b=mD8cxfral1SHuciY4a/4eYkui+WAcR5kBBHiMW38DkAiSPvQQg75feNDGNoZXBVy9l8Io1ObRlEofgHktjVO9f5YtrwPQll786mfEW9REz4rBfFRT1d14pZ+T1AKF70grbqZ1E2+4ivGpbH5e8mIB0zPAa0gfYwI8+rVTRxeCRQ=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 SEYPR03MB8792.apcprd03.prod.outlook.com (2603:1096:101:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 17:07:08 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 17:07:08 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
 <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrF5tAYKZENUWonbDbyeckJbMP+LiAgArXxYCAAXEmgIAFRXCA
Date: Tue, 21 Jan 2025 17:07:08 +0000
Message-ID: <6265ffc5f94b03fbd45985d867e38c9e308074a4.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-4-paul-pl.chen@mediatek.com>
 <abadfae8-56f7-499c-83ff-7d79e3fe1f52@kernel.org>
 <c1440608060e4b2fabf07ff5ac0a7fe49201ba9d.camel@mediatek.com>
 <cc043dcd-b46e-4b4b-9b80-0450efde86eb@kernel.org>
In-Reply-To: <cc043dcd-b46e-4b4b-9b80-0450efde86eb@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|SEYPR03MB8792:EE_
x-ms-office365-filtering-correlation-id: 04275c67-469c-4c2a-e3ba-08dd3a3e09b2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YU8xOUxzVWtDZWIwMzNrUFhkcTlhMzFiZUN0SmV4UlRBRjFQYmVYM3JJZGEz?=
 =?utf-8?B?MWg0cTdSdEQxelpzUVlKSkV0bW1Ya1ZOZ0s1QUozMFdnd0ZzNVV4blRvOE15?=
 =?utf-8?B?dEFnSWlQL1NPVU9GUzNHRjdnWW81elplNEw5OW1jbS8wWGNTb3NUMERLQ3RN?=
 =?utf-8?B?Wk05QkFlNFJYV21TQ1J4WDNjTXJ1clZqcm9FYkYydERaVWx3dVZvTW5Wa2cv?=
 =?utf-8?B?MytXS0dYRXV5Ym9vajBxclZWV2hZNlpFOWdkenkwdmRsOFVIQURzbi9uVCtZ?=
 =?utf-8?B?Wk9jN1E5cVQ2NzZaaXJyVnNwTE02aCtLNzE4Y1RhZzJURUNZRUhReUh1d0Js?=
 =?utf-8?B?Nk01QkJpSzFjN0djWWxHUU9MaFY5WUlzLzhURmk0ektkTXRROWxTMXB2em9M?=
 =?utf-8?B?OXhpRzZiL2lOakpENVZYNXdZeXA5ZTZtcEQ0bEhWbkJWUU5TeWZpOVh0K1ND?=
 =?utf-8?B?OElBeDFuaTJsRWhzTHlIRGFqdDNZNWhPVHkrUlRCVXBLclo1QVk5U3grTXVU?=
 =?utf-8?B?VTRmaHJ2YkJvRDh0cVd1V1N3WndXNE5ibElWMklxUFB0UjkrdWMzSnA2L09l?=
 =?utf-8?B?amh3NmFlbDU4RDd4Y0FaSUI0WFJ5RkNBenZaOVVKRDQyWi9zQ2djYUVjMmtl?=
 =?utf-8?B?cUdHK3dMaVdDYTZZdzRUL2h2aUZkUG9uakVLVUZvRTQ1MnlZc21XMERUbU81?=
 =?utf-8?B?R0dZTjhLaTJZcU9Wc0hPTTMwdmpUMFU1TklMandsNW1PcldONWxObDdRTGwz?=
 =?utf-8?B?ZkZadk0vYk5XQTU3L0wyN1pWNGtEK1VkQ2lvV3l5WUtqcjlIemlOaGVRazRz?=
 =?utf-8?B?a1lpcWxVVng1Y0hOK2FJd2ZxSUd1bEQyVndja2p1SFFVcnB6Q29VdysyTkg5?=
 =?utf-8?B?bFhZZHd5YzNrS1dlYUhtU2lOVjdBQ0gzMzVFSXp5L0wwcytvVnQyV2hQRVdV?=
 =?utf-8?B?VWF1VmJOc1VtL1lSaURKdVgrZ3ZRYWMxVW9uUzA2MU1FYjFCZ2daT1VKSzZE?=
 =?utf-8?B?d0srclpSY042d3AvdWhaYVVQOTlJYjlBWUtWbzc3eGRuQTNCR1JkSkwrYUl2?=
 =?utf-8?B?M0JmVGNCNVU2ZFRjT2p3WDE0U1pYakI2bzI5VXlQL2hZcmd0dVpxd2dCQXpH?=
 =?utf-8?B?RnpaY3g5b2JhV1U2ZDhJcm1RK2g4ejhjMHlFdFR4N2RZWEtQZDVvKzFEV0Ra?=
 =?utf-8?B?c0gxaFlxMSsrbWtvUkxhRlNPQXR3Tmw4ODk2TlNQUFdSNWd6S1AzelVGY1Fs?=
 =?utf-8?B?WWVSUFlEdkIzaWxtc2YxbExNOXh5ZWJnQ3Z4NFNYYnRDVXpxMkUvNE1leGcv?=
 =?utf-8?B?dEkvOWtSVnExQVJTWmlFWlZnL2llTnh5YmoySjhMTnpNdTlzRzZwVE1EVnZU?=
 =?utf-8?B?dXNJMjNZUFR2djVPT29yQmFWQm1sY2crbytXdlE2L3VGdjlEOEI4OWFlZFBw?=
 =?utf-8?B?ZXovSjZhZUJvOU5SS2E4NVdYS2p5c0JjbldLa2RFTmVkaVpLdy9CQmtsMzk1?=
 =?utf-8?B?OHhWSnRIYUxRbGxzM0lmQnF4WU91Y1BCRUhjZ044bENxUXQ2QzQxSlhseXhH?=
 =?utf-8?B?Y1pzOW5xNkM5bW9DeWZmamdpeFBzYWFwSnhNWklQdE5Kb2drQ1hLSi9saGhh?=
 =?utf-8?B?L09IM25NRmxDQitxbytFSHJwRVRUS3V4elRjWVVJeTR3d0ZQbHVmcEw3d2dM?=
 =?utf-8?B?VjhJc2QrdWRnRGJIMTlsREFxSFc1KytwOGxzaFR1dGVzL0xTNXEyL05GSVBh?=
 =?utf-8?B?VmJEOTgyQUwrTEN2aHJXNnhNVGFrT21ISmpPdHdySnJMZHJLdjl4Umdqbytx?=
 =?utf-8?B?NWovcWtDMTRodUh1dXkzZ3BEazZHK3JUNGorSXBCeExGR0w2ZCtwRU16dkJK?=
 =?utf-8?B?a3dHUFdjWWQ5cllxTFdFKzdQY3RzOVBZR1VjWU1jMEZ4cUgzY2RQY1pUOWlh?=
 =?utf-8?Q?JWjeLBG4UTK4qQtM4ZjTX3LJKfK54W9Y?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB6636.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djRjMVBCY09NT3VDVk13ZVd3S1BLazVKUE91d29NaHgvTGg5QXlTdnp4V0M3?=
 =?utf-8?B?RkNabFlwanpodDNSYWt4dWVmK0FkZmNhaWRCMHE4WGZqSGtaZVZrSnJkblZs?=
 =?utf-8?B?S1I3TmxwRnFBQS9vdHNwSkxuT1Y2V2s1cjdKdm9Mb2RzTzhCQmpIU21idjZx?=
 =?utf-8?B?RVlTWHNWb3pWZHdkREd2eEtzSEdNVlI5RmV0U2thQjNsRlF1MXFlczQ3Tk5U?=
 =?utf-8?B?eUtYSmdycTBjcFhmUEE4ZkxyQm5WSmVIUGZzL3FaL0hiRm43Nld6aEVISWdV?=
 =?utf-8?B?NDZLb0pXVy9Jd0lYcEFoWmViM2tVTm4zbEIxa0xvVVdOOTQxNkk0elN4L2Rl?=
 =?utf-8?B?cDFjZFRobitSc09iRTg5VlJJVEdUV2xEdEhzNTNTSjIyTlJ0dDgwU28xRTVk?=
 =?utf-8?B?UUcvTzFOWmZsUFVoZEcxMjNYMGxBUjRpVUZvY2xVTFpmTTJOdlpTbFg2MWEx?=
 =?utf-8?B?L25zQlp1cFc5NEROeHQyZXZSM3NKOTlpZUZrNjllOWE0SW51cm8xZnRzc2N5?=
 =?utf-8?B?bm5hdVJGamhqeFVUTVZ4dlRwOU8vWWNPYkVvQ1Q2QUd1a09YRkFpdXNEQkhH?=
 =?utf-8?B?eWdEQmE4dEJONW1uM3ZJWjV6V3E2RXAwRFo4MGNPRzYrVElxTFpaRzNMYlZH?=
 =?utf-8?B?a0ZjaDZUREFnZEx6REh1Nkw2dkFDOUVwMXlYWDI4dVh2VHhmWE5tYm1XcSt1?=
 =?utf-8?B?SWlKN3pBR2NtMGJOREhMT01qYWtqVFBJTU50QnF6eGFxRHB3VE1sUlV5S0JP?=
 =?utf-8?B?ZnJKazBEV0ZZeXB2TXVac3VWbTBwc3JYa25GR2RxcWNVUlEwcFBXWGxGY21y?=
 =?utf-8?B?ZzVORGpvTVJZYkpDVWlZWWIvRVB0bUZGWnRqTlpVbmlpTWVYNGtPS2dicEhP?=
 =?utf-8?B?TjJkQzZNNDdmYW9rZUpUa2YrV2t2Nm4zTDB1TUpIK2xEUUZlNTRQQkJ4NGdm?=
 =?utf-8?B?MElvN21GQ2o0SFN2cEJ1TUVzSUZNekp4T2RQSVc5QXNBMks1Z3lMZmdCVUl4?=
 =?utf-8?B?UXRFMXQveERQT1lzRXpYKzVZcVhXdGtUYWhxdVRieUJZU3g1K2FrZms1UEtX?=
 =?utf-8?B?MFlUcnJlMDVjSGVpRjYvWkxCRUtyeWkzb0RQeE00elNDVlNTN0U0eThRMDly?=
 =?utf-8?B?MVk5L0ZvTFpybGNTcWMvUXNLVjdOMDZxNXFCejFVQnY3L3dhUzNZbDM2aS91?=
 =?utf-8?B?SnExSWQ5NlY5N05zZXprNVRocDlTUWt5bUlPdXBkU1J6blBsOU12K1pEbFk0?=
 =?utf-8?B?MGs0YXFUQXpvbjBXdm9ZSzNpYkNIRStTODNCUzh6ZVBxN3hxUnB6WWJ3ODhi?=
 =?utf-8?B?TzMzZzB4b2lWSFhrcWRiT1RUL0w0YVpDcGxtUWU1ZTR2SjhEVlNsUUFaR2ZF?=
 =?utf-8?B?cCtEb0NQWjQ0M0dpd2sybUpDblFqY0N2WlFqZ25SWDlnNFp1b0ZXUzVoaTlj?=
 =?utf-8?B?WHdOeGQyWHlmTEhHeklDaENPcHNPczNPTDh3Vm51c3RVZUt3ZkEwbnluY3RP?=
 =?utf-8?B?REhkZkxlQk1PTi9seVV5aUI3NnVNRWZKUEZrbGtiUW52aTdkUWx0SmEveFBV?=
 =?utf-8?B?Z0YvcU84V2RnM1ZrNEpoei9OYVIrSWFOVkk3MGVNR0RTVnVpMlBtdXNRTWYr?=
 =?utf-8?B?bTFSQTJlL2VmUFJoQ3hRdjM5UTE5dUpsMTE2YVFsZHNCSHR6dzZSWTQyM08w?=
 =?utf-8?B?NTdyYyt1Tko1eUtxOEhkUGNBVFR0NzVoeWJEVWVGTU1OZTZBQnZUMkc2dkZk?=
 =?utf-8?B?VWpUdDNKL0RYbG9Nemh3NUkxVkFhSy9xOVdlS2o3cFlBUTN1TjgwQno5M2Jz?=
 =?utf-8?B?ZElDMnVZYXAwNk9xWmtFREVHVTUxTUc0SFp6aTFpZ3RMVmdEZ1NRQ0o4em43?=
 =?utf-8?B?ZDJsQ1RSSTRQaXZORmtJSXBtKzBrc2lndWdXSU55dUw0VWJpMjQ5S3YwK0RH?=
 =?utf-8?B?OUU2bWt5UVNVZVNVTU1xZXg4c28zU25nTmlzZFAyNmZ1QStRTWEyZ05NNlBr?=
 =?utf-8?B?TFQ3UmdTTmNlbWdyOGNPdklMWitFNDNmbXYrNGdhR0RtSEJkMnJ4N0xjWG5o?=
 =?utf-8?B?eXhnbUNDdHliU0Z5Kzk3ZGlCbXpaaTY1ekpwTEJ2cVZnWFpzdS9nRlpyYnll?=
 =?utf-8?B?dUk3WDUycGdCRXAwV2hkSUcvKytSV2NOdURjQmh3ZmRCQ2VGWmVxM0k4RUlI?=
 =?utf-8?B?UVE9PQ==?=
Content-ID: <00EB71C59F4CFB44AAE2C8695AA7E7B7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04275c67-469c-4c2a-e3ba-08dd3a3e09b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 17:07:08.0938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j42nxGIR7SrkwDZznUHE2j+R3jdXSz7BY9H99m7tBeUfQw4ntsqnazgNVIJwdHeqpSy/D37YAjU5NMwwQOJwRDGGxKWhH1N7uq6vYjG9FCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8792
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_002_1885791422.1182620259"
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

--__=_Part_Boundary_002_1885791422.1182620259
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDI1LTAxLTE4IGF0IDA5OjM3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAvL3NuaXANCg0KPiBJIGRpZCBub3QgdGFsayBhYm91dCBkcml2ZXIuIEkgdGFsa2Vk
IGFib3V0IHRoaXMgcGF0Y2guIExvb2sgYXQgcGF0Y2gNCj4gdGl0bGUgLSBpdCBzdGFydHMgd2l0
aCBkdC1iaW5kaW5ncy4gSXMgaGVyZSBhbnl0aGluZyBhYm91dCBkcml2ZXI/DQo+IE5vLg0KPiBX
aHkgZG8gd2UgdGFsayBhYm91dCBkcml2ZXI/DQo+IA0KPiA+IGRpZmZlcmVudGx5IGZyb20gdHlw
aWNhbCBETUEgZHJpdmVycywgYW5kIHRoZXJlZm9yZSB3ZSBiZWxpZXZlIHRoYXQNCj4gPiB0aGUN
Cj4gPiBFWERNQSBkcml2ZXIgbWF5IG5vdCBiZSBzdWl0YWJsZSB0byBiZSBwbGFjZWQgdW5kZXIg
dGhlDQo+ID4gZHJpdmVyL21lZGlhdGVrL2RybSBkaXJlY3RvcnkuIFRoZSBtYWluIHJlYXNvbnMg
YXJlIGFzIGZvbGxvd3M6DQo+ID4gDQo+ID4gKDEpTm8gTWVtb3J5IEFsbG9jYXRpb24gd2l0aGlu
IEVYRE1BIEVuZ2luZToNCj4gPiBUaGUgRVhETUEgZW5naW5lIGRvZXMgbm90IHBlcmZvcm0gbWVt
b3J5IGFsbG9jYXRpb24gb3BlcmF0aW9ucw0KPiA+IGl0c2VsZi4NCj4gPiBJbnN0ZWFkLCBpdCBy
ZWxpZXMgb24gR0VNIChHcmFwaGljcyBFeGVjdXRpb24gTWFuYWdlcikgdG8gYWxsb2NhdGUNCj4g
PiBtZW1vcnkuVHJhZGl0aW9uYWwgRE1BIGRyaXZlcnMgb2Z0ZW4gaGFuZGxlIHRoZWlyIG93biBt
ZW1vcnkNCj4gPiBhbGxvY2F0aW9ucywgYnV0IGluIHRoZSBjYXNlIG9mIEVYRE1BLCBtZW1vcnkg
bWFuYWdlbWVudCBpcw0KPiA+IGRlbGVnYXRlZA0KPiA+IHRvIEdFTS4NCj4gPiANCj4gPiAoMilQ
cmltYXJ5IFRhc2sgb2YgRVhETUE6DQo+ID4gVGhlIG1haW4gZnVuY3Rpb24gb2YgRVhETUEgaXMg
dG8gdHJhbnNmZXIgYnVmZmVycyBhbGxvY2F0ZWQgYnkgR0VNDQo+ID4gdG8NCj4gPiB0aGUgc3Vi
c2VxdWVudCBkaXNwbGF5IHBpcGVsaW5lLg0KPiA+IEVYRE1BIHNlcnZlcyBhcyBhIGJyaWRnZSBi
ZXR3ZWVuIG1lbW9yeSBhbGxvY2F0ZWQgYnkgR0VNIGFuZCB0aGUNCj4gPiBkaXNwbGF5IGNvbXBv
bmVudHMsIHJhdGhlciB0aGFuIGFjdGluZyBhcyBhIGdlbmVyYWwtcHVycG9zZSBETUENCj4gPiBl
bmdpbmUuDQo+ID4gQmFzZWQgb24gdGhlIHBvaW50cyBhYm92ZSwgd2UgaGF2ZSBkZWNpZGVkIHRv
IHBsYWNlIHRoZSBFWERNQQ0KPiA+IGRyaXZlcg0KPiA+IHVuZGVyIHRoZSBEUk0gZGlzcGxheSBz
dWJzeXN0ZW0gcmF0aGVyIHRoYW4gdW5kZXIgdGhlIERNQQ0KPiA+IHN1YnN5c3RlbS4NCj4gDQo+
IA0KPiBJIGRvbid0IGNhcmUgaWYgaXQgdXNlcyBHRU0gb3Iga2VybmVsIGFsbG9jYXRvciBvciBl
dmVuIDNyZCBwYXJ0eQ0KPiBhbGxvY2F0b3IuIFRoZSBxdWVzdGlvbiBpczogd2hhdCBpcyB0aGlz
IGRldmljZT8gSWYgaXQgaXMgcGVyZm9ybWluZw0KPiBETUEsIHRoZW4gaXQgc2hvdWxkIGJlIHBs
YWNlZCBpbiAiZG1hIiBkaXJlY3RvcnkuIFRoZSByZG1hIHdhcyBwbGFjZWQNCj4gZGlmZmVyZW50
bHkgYnV0IGFzIHlvdSBjYW4gZWFzaWx5IGNoZWNrOiBpdCB3YXMgbmV2ZXIgYWNrZWQvcmV2aWV3
ZWQsDQo+IHNvDQo+IGRvbid0IHVzZSBpdCBhcyBhbiBleGFtcGxlLg0KPiANCj4gT2YgY291cnNl
IGlmIGl0IGRvZXMgbm90IHBlcmZvcm0gRE1BLCB0aGVuIGl0IHNob3VsZCBub3QgYmUgaW4gZG1h
LA0KPiBidXQNCj4gdGhlbiBJIGRvbid0IGFncmVlIG9uIHVzaW5nIGRtYS1jZWxscyBoZXJlIGFu
ZCBhbnl0aGluZyBsaWtlIHRoYXQgaW4NCj4gdGhlDQo+IGRyaXZlci4NCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQoNCkhpIEtyenlzenRvZiwNCg0KDQpUaGUgY3VycmVu
dCBwbGFjZW1lbnQgb2YgRVhETUEgdW5kZXIgdGhlIGRpc3BsYXkgc3Vic3lzdGVtIGluDQpNZWRp
YXRlaydzIGFyY2hpdGVjdHVyZSBpcyBwcmltYXJpbHkgZHVlIHRvIGl0cyBmdW5jdGlvbmFsIHJv
bGUgYXMgYQ0Kc3ViLWRldmljZSB3aXRoaW4gdGhlIGRpc3BsYXkgcGlwZWxpbmUuDQogDQpJbiBN
VDgxOTYgaGFyZHdhcmUgZGVzaWduLCB0aGUgc3ViLWRldmljZXMgaW4gZGlzcGxheSBwaXBlbGlu
ZSBmb2xsb3cgYQ0Kc2VxdWVuY2Ugb2Y6IEVYRE1BIC0+IEJMRU5ERVIgLT4gT1VUUFJPQyAtPiBQ
USAtPiBEVk8uDQogDQpJbiBNVDgxOTUgaGFyZHdhcmUgZGVzaWduLCB0aGUgc3ViLWRldmljZXMg
aW4gZGlzcGxheSBwaXBlbGluZSBmb2xsb3cgYQ0Kc2VxdWVuY2Ugb2Y6IE9WTCAtPiBQUSAtPkRT
SS4NCiANCkFzIHdlIHNlZSwgT1ZMIGhhcyBiZWVuIGRpdmlkZWQgaW50byB0aHJlZSBuZXcgaGFy
ZHdhcmUgSVBzIGluIE1UODE5Ni4NCk9WTCBhbmQgRVhETUEgYm90aCBoYXZlIHRoZSBhYmlsaXR5
IHRvIGZldGNoIGRhdGEgZGlyZWN0bHkgZnJvbSBEUkFNDQphbmQgY2FuIGJlIHJlZ2FyZGVkIGFz
IERNQSBjb250cm9sbGVyLg0KIA0KSSBhbHNvIGhhdmUgY29uZmlybWVkIHdpdGggdGhlIGhhcmR3
YXJlIGRlc2lnbmVyIHRoYXQgRVhETUEgaXMgYSBraW5kDQpvZiBETUEsIGJ1dCBpdCBpcyBzcGVj
aWFsbHkgZGVzaWduZWQgdG8gaGFuZGxlIHRoZSBncmFwaGljYWwgbGF5ZXIsIGFuZA0KaGFzIGJl
dHRlciBwZXJmb3JtYW5jZSB0aGFuIG9yZGluYXJ5IERNQS4NCiANClRoZXJlZm9yZSwgSSB0aGlu
ayB0aGF0IG1vdmluZyBFWERNQSBhbmQgT1ZMIGZyb20gdGhlIGRpc3BsYXkgZm9sZGVyIHRvDQp0
aGUgRE1BIGZvbGRlciwgb3Igb25seSBrZXBwaW5nIHRoZW0gaW4gdGhlIGRpc3BsYXkgZm9sZGVy
IGlzIGRlY2lkZWQNCmJ5IHRoZSB0d28gZGlmZmVyZW50IHZpZXdzIG9mIERNQSBhYmlsaXR5IG9y
IGRpc3BsYXkgc3ViLWRldmljZS4NCiANCldlIHdpbGwgZm9sbG93IHlvdXIgaW5zdHJ1Y3Rpb25z
IHRvIHB1dCBFWERNQSBvbiB0aGUgcGxhY2UgeW91IGRlY2lkZWQuDQoNCkJlc3QgcmVnYXJkcywN
ClBhdWwgQ2hlbg0K

--__=_Part_Boundary_002_1885791422.1182620259
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1NhdCwmIzMyOzIwMjUtMDEtMTgmIzMyO2F0
JiMzMjswOTozNyYjMzI7KzAxMDAsJiMzMjtLcnp5c3p0b2YmIzMyO0tvemxvd3NraSYjMzI7d3Jv
dGU6DQomZ3Q7JiMzMjsvL3NuaXANCg0KJmd0OyYjMzI7SSYjMzI7ZGlkJiMzMjtub3QmIzMyO3Rh
bGsmIzMyO2Fib3V0JiMzMjtkcml2ZXIuJiMzMjtJJiMzMjt0YWxrZWQmIzMyO2Fib3V0JiMzMjt0
aGlzJiMzMjtwYXRjaC4mIzMyO0xvb2smIzMyO2F0JiMzMjtwYXRjaA0KJmd0OyYjMzI7dGl0bGUm
IzMyOy0mIzMyO2l0JiMzMjtzdGFydHMmIzMyO3dpdGgmIzMyO2R0LWJpbmRpbmdzLiYjMzI7SXMm
IzMyO2hlcmUmIzMyO2FueXRoaW5nJiMzMjthYm91dCYjMzI7ZHJpdmVyJiM2MzsNCiZndDsmIzMy
O05vLg0KJmd0OyYjMzI7V2h5JiMzMjtkbyYjMzI7d2UmIzMyO3RhbGsmIzMyO2Fib3V0JiMzMjtk
cml2ZXImIzYzOw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmZXJlbnRseSYjMzI7
ZnJvbSYjMzI7dHlwaWNhbCYjMzI7RE1BJiMzMjtkcml2ZXJzLCYjMzI7YW5kJiMzMjt0aGVyZWZv
cmUmIzMyO3dlJiMzMjtiZWxpZXZlJiMzMjt0aGF0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUNCiZn
dDsmIzMyOyZndDsmIzMyO0VYRE1BJiMzMjtkcml2ZXImIzMyO21heSYjMzI7bm90JiMzMjtiZSYj
MzI7c3VpdGFibGUmIzMyO3RvJiMzMjtiZSYjMzI7cGxhY2VkJiMzMjt1bmRlciYjMzI7dGhlDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtkcml2ZXIvbWVkaWF0ZWsvZHJtJiMzMjtkaXJlY3RvcnkuJiMzMjtU
aGUmIzMyO21haW4mIzMyO3JlYXNvbnMmIzMyO2FyZSYjMzI7YXMmIzMyO2ZvbGxvd3M6DQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOygxKU5vJiMzMjtNZW1vcnkmIzMyO0Fs
bG9jYXRpb24mIzMyO3dpdGhpbiYjMzI7RVhETUEmIzMyO0VuZ2luZToNCiZndDsmIzMyOyZndDsm
IzMyO1RoZSYjMzI7RVhETUEmIzMyO2VuZ2luZSYjMzI7ZG9lcyYjMzI7bm90JiMzMjtwZXJmb3Jt
JiMzMjttZW1vcnkmIzMyO2FsbG9jYXRpb24mIzMyO29wZXJhdGlvbnMNCiZndDsmIzMyOyZndDsm
IzMyO2l0c2VsZi4NCiZndDsmIzMyOyZndDsmIzMyO0luc3RlYWQsJiMzMjtpdCYjMzI7cmVsaWVz
JiMzMjtvbiYjMzI7R0VNJiMzMjsoR3JhcGhpY3MmIzMyO0V4ZWN1dGlvbiYjMzI7TWFuYWdlcikm
IzMyO3RvJiMzMjthbGxvY2F0ZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bWVtb3J5LlRyYWRpdGlvbmFs
JiMzMjtETUEmIzMyO2RyaXZlcnMmIzMyO29mdGVuJiMzMjtoYW5kbGUmIzMyO3RoZWlyJiMzMjtv
d24mIzMyO21lbW9yeQ0KJmd0OyYjMzI7Jmd0OyYjMzI7YWxsb2NhdGlvbnMsJiMzMjtidXQmIzMy
O2luJiMzMjt0aGUmIzMyO2Nhc2UmIzMyO29mJiMzMjtFWERNQSwmIzMyO21lbW9yeSYjMzI7bWFu
YWdlbWVudCYjMzI7aXMNCiZndDsmIzMyOyZndDsmIzMyO2RlbGVnYXRlZA0KJmd0OyYjMzI7Jmd0
OyYjMzI7dG8mIzMyO0dFTS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
KDIpUHJpbWFyeSYjMzI7VGFzayYjMzI7b2YmIzMyO0VYRE1BOg0KJmd0OyYjMzI7Jmd0OyYjMzI7
VGhlJiMzMjttYWluJiMzMjtmdW5jdGlvbiYjMzI7b2YmIzMyO0VYRE1BJiMzMjtpcyYjMzI7dG8m
IzMyO3RyYW5zZmVyJiMzMjtidWZmZXJzJiMzMjthbGxvY2F0ZWQmIzMyO2J5JiMzMjtHRU0NCiZn
dDsmIzMyOyZndDsmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGUmIzMyO3N1YnNlcXVlbnQm
IzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5lLg0KJmd0OyYjMzI7Jmd0OyYjMzI7RVhETUEmIzMyO3Nl
cnZlcyYjMzI7YXMmIzMyO2EmIzMyO2JyaWRnZSYjMzI7YmV0d2VlbiYjMzI7bWVtb3J5JiMzMjth
bGxvY2F0ZWQmIzMyO2J5JiMzMjtHRU0mIzMyO2FuZCYjMzI7dGhlDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtkaXNwbGF5JiMzMjtjb21wb25lbnRzLCYjMzI7cmF0aGVyJiMzMjt0aGFuJiMzMjthY3Rpbmcm
IzMyO2FzJiMzMjthJiMzMjtnZW5lcmFsLXB1cnBvc2UmIzMyO0RNQQ0KJmd0OyYjMzI7Jmd0OyYj
MzI7ZW5naW5lLg0KJmd0OyYjMzI7Jmd0OyYjMzI7QmFzZWQmIzMyO29uJiMzMjt0aGUmIzMyO3Bv
aW50cyYjMzI7YWJvdmUsJiMzMjt3ZSYjMzI7aGF2ZSYjMzI7ZGVjaWRlZCYjMzI7dG8mIzMyO3Bs
YWNlJiMzMjt0aGUmIzMyO0VYRE1BDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkcml2ZXINCiZndDsmIzMy
OyZndDsmIzMyO3VuZGVyJiMzMjt0aGUmIzMyO0RSTSYjMzI7ZGlzcGxheSYjMzI7c3Vic3lzdGVt
JiMzMjtyYXRoZXImIzMyO3RoYW4mIzMyO3VuZGVyJiMzMjt0aGUmIzMyO0RNQQ0KJmd0OyYjMzI7
Jmd0OyYjMzI7c3Vic3lzdGVtLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsNCiZndDsmIzMyO0kmIzMy
O2RvbiYjMzk7dCYjMzI7Y2FyZSYjMzI7aWYmIzMyO2l0JiMzMjt1c2VzJiMzMjtHRU0mIzMyO29y
JiMzMjtrZXJuZWwmIzMyO2FsbG9jYXRvciYjMzI7b3ImIzMyO2V2ZW4mIzMyOzNyZCYjMzI7cGFy
dHkNCiZndDsmIzMyO2FsbG9jYXRvci4mIzMyO1RoZSYjMzI7cXVlc3Rpb24mIzMyO2lzOiYjMzI7
d2hhdCYjMzI7aXMmIzMyO3RoaXMmIzMyO2RldmljZSYjNjM7JiMzMjtJZiYjMzI7aXQmIzMyO2lz
JiMzMjtwZXJmb3JtaW5nDQomZ3Q7JiMzMjtETUEsJiMzMjt0aGVuJiMzMjtpdCYjMzI7c2hvdWxk
JiMzMjtiZSYjMzI7cGxhY2VkJiMzMjtpbiYjMzI7JnF1b3Q7ZG1hJnF1b3Q7JiMzMjtkaXJlY3Rv
cnkuJiMzMjtUaGUmIzMyO3JkbWEmIzMyO3dhcyYjMzI7cGxhY2VkDQomZ3Q7JiMzMjtkaWZmZXJl
bnRseSYjMzI7YnV0JiMzMjthcyYjMzI7eW91JiMzMjtjYW4mIzMyO2Vhc2lseSYjMzI7Y2hlY2s6
JiMzMjtpdCYjMzI7d2FzJiMzMjtuZXZlciYjMzI7YWNrZWQvcmV2aWV3ZWQsDQomZ3Q7JiMzMjtz
bw0KJmd0OyYjMzI7ZG9uJiMzOTt0JiMzMjt1c2UmIzMyO2l0JiMzMjthcyYjMzI7YW4mIzMyO2V4
YW1wbGUuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO09mJiMzMjtjb3Vyc2UmIzMyO2lmJiMzMjtpdCYj
MzI7ZG9lcyYjMzI7bm90JiMzMjtwZXJmb3JtJiMzMjtETUEsJiMzMjt0aGVuJiMzMjtpdCYjMzI7
c2hvdWxkJiMzMjtub3QmIzMyO2JlJiMzMjtpbiYjMzI7ZG1hLA0KJmd0OyYjMzI7YnV0DQomZ3Q7
JiMzMjt0aGVuJiMzMjtJJiMzMjtkb24mIzM5O3QmIzMyO2FncmVlJiMzMjtvbiYjMzI7dXNpbmcm
IzMyO2RtYS1jZWxscyYjMzI7aGVyZSYjMzI7YW5kJiMzMjthbnl0aGluZyYjMzI7bGlrZSYjMzI7
dGhhdCYjMzI7aW4NCiZndDsmIzMyO3RoZQ0KJmd0OyYjMzI7ZHJpdmVyLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtCZXN0JiMzMjtyZWdhcmRzLA0KJmd0OyYjMzI7S3J6eXN6dG9mDQomZ3Q7JiMzMjsN
Cg0KDQpIaSYjMzI7S3J6eXN6dG9mLA0KDQoNClRoZSYjMzI7Y3VycmVudCYjMzI7cGxhY2VtZW50
JiMzMjtvZiYjMzI7RVhETUEmIzMyO3VuZGVyJiMzMjt0aGUmIzMyO2Rpc3BsYXkmIzMyO3N1YnN5
c3RlbSYjMzI7aW4NCk1lZGlhdGVrJiMzOTtzJiMzMjthcmNoaXRlY3R1cmUmIzMyO2lzJiMzMjtw
cmltYXJpbHkmIzMyO2R1ZSYjMzI7dG8mIzMyO2l0cyYjMzI7ZnVuY3Rpb25hbCYjMzI7cm9sZSYj
MzI7YXMmIzMyO2ENCnN1Yi1kZXZpY2UmIzMyO3dpdGhpbiYjMzI7dGhlJiMzMjtkaXNwbGF5JiMz
MjtwaXBlbGluZS4NCiYjMzI7DQpJbiYjMzI7TVQ4MTk2JiMzMjtoYXJkd2FyZSYjMzI7ZGVzaWdu
LCYjMzI7dGhlJiMzMjtzdWItZGV2aWNlcyYjMzI7aW4mIzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5l
JiMzMjtmb2xsb3cmIzMyO2ENCnNlcXVlbmNlJiMzMjtvZjomIzMyO0VYRE1BJiMzMjstJmd0OyYj
MzI7QkxFTkRFUiYjMzI7LSZndDsmIzMyO09VVFBST0MmIzMyOy0mZ3Q7JiMzMjtQUSYjMzI7LSZn
dDsmIzMyO0RWTy4NCiYjMzI7DQpJbiYjMzI7TVQ4MTk1JiMzMjtoYXJkd2FyZSYjMzI7ZGVzaWdu
LCYjMzI7dGhlJiMzMjtzdWItZGV2aWNlcyYjMzI7aW4mIzMyO2Rpc3BsYXkmIzMyO3BpcGVsaW5l
JiMzMjtmb2xsb3cmIzMyO2ENCnNlcXVlbmNlJiMzMjtvZjomIzMyO09WTCYjMzI7LSZndDsmIzMy
O1BRJiMzMjstJmd0O0RTSS4NCiYjMzI7DQpBcyYjMzI7d2UmIzMyO3NlZSwmIzMyO09WTCYjMzI7
aGFzJiMzMjtiZWVuJiMzMjtkaXZpZGVkJiMzMjtpbnRvJiMzMjt0aHJlZSYjMzI7bmV3JiMzMjto
YXJkd2FyZSYjMzI7SVBzJiMzMjtpbiYjMzI7TVQ4MTk2Lg0KT1ZMJiMzMjthbmQmIzMyO0VYRE1B
JiMzMjtib3RoJiMzMjtoYXZlJiMzMjt0aGUmIzMyO2FiaWxpdHkmIzMyO3RvJiMzMjtmZXRjaCYj
MzI7ZGF0YSYjMzI7ZGlyZWN0bHkmIzMyO2Zyb20mIzMyO0RSQU0NCmFuZCYjMzI7Y2FuJiMzMjti
ZSYjMzI7cmVnYXJkZWQmIzMyO2FzJiMzMjtETUEmIzMyO2NvbnRyb2xsZXIuDQomIzMyOw0KSSYj
MzI7YWxzbyYjMzI7aGF2ZSYjMzI7Y29uZmlybWVkJiMzMjt3aXRoJiMzMjt0aGUmIzMyO2hhcmR3
YXJlJiMzMjtkZXNpZ25lciYjMzI7dGhhdCYjMzI7RVhETUEmIzMyO2lzJiMzMjthJiMzMjtraW5k
DQpvZiYjMzI7RE1BLCYjMzI7YnV0JiMzMjtpdCYjMzI7aXMmIzMyO3NwZWNpYWxseSYjMzI7ZGVz
aWduZWQmIzMyO3RvJiMzMjtoYW5kbGUmIzMyO3RoZSYjMzI7Z3JhcGhpY2FsJiMzMjtsYXllciwm
IzMyO2FuZA0KaGFzJiMzMjtiZXR0ZXImIzMyO3BlcmZvcm1hbmNlJiMzMjt0aGFuJiMzMjtvcmRp
bmFyeSYjMzI7RE1BLg0KJiMzMjsNClRoZXJlZm9yZSwmIzMyO0kmIzMyO3RoaW5rJiMzMjt0aGF0
JiMzMjttb3ZpbmcmIzMyO0VYRE1BJiMzMjthbmQmIzMyO09WTCYjMzI7ZnJvbSYjMzI7dGhlJiMz
MjtkaXNwbGF5JiMzMjtmb2xkZXImIzMyO3RvDQp0aGUmIzMyO0RNQSYjMzI7Zm9sZGVyLCYjMzI7
b3ImIzMyO29ubHkmIzMyO2tlcHBpbmcmIzMyO3RoZW0mIzMyO2luJiMzMjt0aGUmIzMyO2Rpc3Bs
YXkmIzMyO2ZvbGRlciYjMzI7aXMmIzMyO2RlY2lkZWQNCmJ5JiMzMjt0aGUmIzMyO3R3byYjMzI7
ZGlmZmVyZW50JiMzMjt2aWV3cyYjMzI7b2YmIzMyO0RNQSYjMzI7YWJpbGl0eSYjMzI7b3ImIzMy
O2Rpc3BsYXkmIzMyO3N1Yi1kZXZpY2UuDQomIzMyOw0KV2UmIzMyO3dpbGwmIzMyO2ZvbGxvdyYj
MzI7eW91ciYjMzI7aW5zdHJ1Y3Rpb25zJiMzMjt0byYjMzI7cHV0JiMzMjtFWERNQSYjMzI7b24m
IzMyO3RoZSYjMzI7cGxhY2UmIzMyO3lvdSYjMzI7ZGVjaWRlZC4NCg0KQmVzdCYjMzI7cmVnYXJk
cywNClBhdWwmIzMyO0NoZW4NCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0
ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBp
biB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBi
ZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4
ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRl
ZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBB
bnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmlu
ZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMp
IGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1h
eSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2Yg
dGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1lZGlhdGVseSAoYnkg
cmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mIA0K
dGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0s
IGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBv
dGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_002_1885791422.1182620259--

