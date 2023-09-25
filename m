Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FC7AD5CA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 12:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8157E10E22F;
	Mon, 25 Sep 2023 10:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A1110E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:24:13 +0000 (UTC)
X-UUID: aa5f12ba5b8d11ee8051498923ad61e6-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=yO9tM5PH+XsBiraPofr7mAsdKlN1NJCkkufj6xRUY48=; 
 b=i9pJ+tTCfMiqPblM6Xbxn5xSHWr2HnWfHN5F3+UcgrNzMtoA+RswtLznvp2/759vUu9dSDEa7KHuoktCxRapTnYGTUkRARtdHGj83VMFAnDGOcAhq/0LrD3/okIIYj5ptT4GiEpq2Io7QDafr+wxLNy6J8UkXqyNgQDj3p5691M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:0abb0a31-b3c2-4559-9f27-14729c9ec9d9, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5f78ec9, CLOUDID:eb756fc3-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aa5f12ba5b8d11ee8051498923ad61e6-20230925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 853942153; Mon, 25 Sep 2023 18:24:10 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 18:24:09 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 18:24:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5RM4z3INahKxaadm5Otob6ri9b09q3k7uTQt76xaIeScE5RtMrwKAxTEMULq5FzVw4lAO0b5fGt5G5i+pDjR5SJHzJHncv3SVFgfDqyn+gq2VuVB+LHvgr+WgVJQs9WuFPRYGXeiIC00e1fnXQrGKTdDJzgxEsn+UvmuIiMfhG8OdjnO+wJaIgQ/+vJeFaKkvz2dKhhlUbTeR8rYy9nHG2SutYWpqkFzzV2n+LpW/XCYXVXN0TGRwYEiU1uhbHx2YEofwQENDjuerZ76V9qNkQaCMsOXVgy4ZWqqWwOo3baGvuWnFO6IZaSkNJliRJ4ugLqIkiz5e+0EIUvynwvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnzUaiHuSn14dmbvIULAQmN4lGYeFod7+T+M8dhkHrU=;
 b=ncquu2MWlpwhNTSa0HGpiNrkEcgesaGaYN2U5Js1uGLL5QYE2iQJO5AMNS3vOuWaCxp4QgQChYB7CGrLChnrFGd7WRqz9k3HES8NJK7RCduQRA3wOiZzkIkxbGLJyMf2wZQRzuY8NN963WLPPRbkvov8zmS27EaWL/0tCDYfpcYXolKAr1xXIkozvprgSn9YXTW9I5xezWnOKYvRbvaec8S0mHIFOJom+XNN7Kd5gl3A1nsfcMiC5MlsQqubG+Oh0BculnK2YasWSTP8Oc2Iro2MyHPFNMObrkpy0ngs80QcHV1OBxMw+cwmBHhG2fmGNXfJNWlqjEIVD4JPteWevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnzUaiHuSn14dmbvIULAQmN4lGYeFod7+T+M8dhkHrU=;
 b=qu9JxXinvZ3bm2+bV24fiw5n3FjupQVgHt5bIDQHf7nc/SSFjE6NE2L7hHcxjCtOOMseMEWO1V1n9PuhofArf+sqk2KLm6f6hDaY0+mDNH4qkk0C23wIQtA6Qxld5mrGLSbZE3H6BkfhjGvZNnHcis2Y6sTueROwkPzZHCTYOb4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6340.apcprd03.prod.outlook.com (2603:1096:400:149::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 10:24:05 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1b82:a45d:e171:62e8%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 10:24:05 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Thread-Topic: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Thread-Index: AQHZ6mV+OMIN5fPo3EKCCvwEF6sInLAou1wAgAJMXQCAABp4AIAAPdQA
Date: Mon, 25 Sep 2023 10:24:05 +0000
Message-ID: <32a6b54a4ba2be7ff2762c3e0f2e4b83affd3881.camel@mediatek.com>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-4-jason-jh.lin@mediatek.com>
 <797fc698-54d2-4848-3a4d-43ca631eb96d@linaro.org>
 <d2fee308c86c23e98e99497d2de138e31ad72537.camel@mediatek.com>
 <c6983f0e-9a62-4fe8-bb1a-01c44ec43985@linaro.org>
In-Reply-To: <c6983f0e-9a62-4fe8-bb1a-01c44ec43985@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6340:EE_
x-ms-office365-filtering-correlation-id: ce341545-52b5-468e-097c-08dbbdb18bc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b1g/DNEp5RaR2ijf9b/puaO3iSzhnY9cXSr+aNAbh/rfrnqL2VwnCJuOwhXJ+xHOgAmCbiD4xQZrCHUrScs5VnzgHwXhRe1hq8KGEh8+2VDonIBkRbUxf13NV33XaV1XXPAZq//LI6SwjuBqaHtlDPvJ6cuN8PQukvqk0f7W0ob2eFXM+ASp+gv7WotxYZthP2A81dJUXJ7WfjzuCIGpHqeZz+QXbf7OVNssIWrPVGLQwJrG3wWVb6SnNkg93OG5M/zNM87WzdThteGDDfh5RI3RyfhNcXIPQ1t7OqUAtlUQr0fPG6Cd5QwdTuarlQS0d3QPHvkPdLY45dBq4uMHz8LH3AYwjtCl9KDL+AHdS5LtzpwaEAZHqpJG501NzIDmSSeDYVnlorDB7tf4+hp8CDRgDNLBiCXQB16EakgMmQy7lMDGnU+jKCK4fwveXEgFy04lPq/BdoV5pIdR8zIOp7G5E6onHGA1fnZ1ighXUie41KUGBtEtuIwe5u76WJG33iE24+Hjn1RceOeJTkLIFD2GlTfFbirom31LCo+bhuXe78bMwuifeM1w4hubL0iUBfWbZUJbaeHHea7QNmD8RgpiLJVI5OjQOgsfqfVzYY4vJmrD7aGLc7zb4z2iLJaI1J/DB6WtDddkkat3Vl/wCTShLXUu0ma4BfqQ2RKyZ8w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(107886003)(26005)(8936002)(8676002)(4326008)(41300700001)(478600001)(66476007)(316002)(66446008)(64756008)(54906003)(66946007)(110136005)(91956017)(76116006)(66556008)(15650500001)(6512007)(5660300002)(53546011)(2616005)(2906002)(7416002)(6486002)(6506007)(71200400001)(86362001)(85182001)(36756003)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWlROEpJditUNC9qUWxTQXRnSFZpRElXcDRCWTZOYXpYQ3JRWXVxaTJGQVJY?=
 =?utf-8?B?eU02MGkxSEk2NHk5V3JxMnZLdnJTbjIzOUtqTHYvaExZY3BMZVZ6emVNOWlB?=
 =?utf-8?B?MWN6TmJES0g3MGdLQXBGVnpnWGloNlhDeDZaVU1SdldRTEZIcDA3dkJ6L096?=
 =?utf-8?B?N09XcG5rZlJuazNLc0cwODEzOFBnL0dlKytvZzlONVREbnloQy8rWktvSWJH?=
 =?utf-8?B?S1FHUmZYNzlxbUZNOFh6cXdoNHlkamxIb2dsVWFSdThNSndCbHZLT1gyaVNR?=
 =?utf-8?B?dFdhWGtuV0xWSVAxTE1tSTVoMVpKRmtPN2xRUExXaDVacXZNelNnbVA2TVdR?=
 =?utf-8?B?QVVsa1pBdC9xb29QQVNnaHpTbUdaVmtyQUR4ODFzNmE5Z25tbithYVRMVURm?=
 =?utf-8?B?cUVjSXJCaHRtRFRPdm5NZGNEUlk1OE9VRzh3b2ZHTVhMbE1LeDFEbnBpdHBI?=
 =?utf-8?B?TmhqQ3VISEpXRXQ5T1Nxa2lxV2VxZjJkRFcvR3lqaXJWaVhmTlNacHFtaEZQ?=
 =?utf-8?B?U1RYMG5xbmZqWEM0RFp3eFRxOXdOQzNxUUFxOXIvRUVYY1VGNjlaVEhHelJV?=
 =?utf-8?B?OWxaMWZua3lMdDFtekp6cmJNQlZEUE1jUGpncWNaa2R3aFZwTjNTSHhNdlA1?=
 =?utf-8?B?eC9lVFpNWEw1VW5xVC9Lamh2Mjcwcy9IVkp3MXNMK3ExYm9IOTEwMDZ6NU1o?=
 =?utf-8?B?a2tieWFxVmRuK2lkZHlUbSs5bU9pZG5yc3dXL2xSV0RYMkxmY1FUT3l4ZFdU?=
 =?utf-8?B?WkdwY2FmL0FVTm00SmhRcVJwT0xHeUJyT2lXTHo2OERNem9XUG9Hb01zZGF4?=
 =?utf-8?B?YjVXMUpoSmtOU1JmdnJMRWlXWllyTXYvNDBSamkyWnhJRm5xd3RDZnhBWWhD?=
 =?utf-8?B?NXNMK2xoL0NUcE0vc2VXWC9JaUtGaU05NEdPUkR1dzRLSXJ6WFZhZHFOSGZu?=
 =?utf-8?B?U0FsTTU2WGNLK0lrc1FEclUzRDJjWVJGS1NJWWtOV2c3VlMzNnE2NTFzUGZM?=
 =?utf-8?B?R3ZiVmJXRVV2czdHRmlqVDMxMnFMb29WcWNuUklrQVFLTy9aZmlZaXdTZkRC?=
 =?utf-8?B?ZHFZQyt1QWdtTndXSlBQZlM4Y0s1ZVVqc3BabWNzdmIrRHFabUJHcXhZU3JO?=
 =?utf-8?B?aFc3dEhXTVVqVFlaUVdTbGlveHFTT3BTb3A2VXVUakt0bDU3KzZXT0JaZndv?=
 =?utf-8?B?ZTBaZUlmWTFNcDdNUXBwZFFqUndYWVZ2cWowU2JiRjRYRGRGL2p5eC9FRHNC?=
 =?utf-8?B?Ylh3bkpKRzM1VkNoYzVpTEZZcWZsNVN3K2t1clBJdWEyYWtiOVNLa1lPTm1o?=
 =?utf-8?B?Ymh5dkI4bVRjdVdGbFloNzNXcTBBMHZ3Mm9JSXhheWpYRXQ5cWZlZGVobVA5?=
 =?utf-8?B?WmVQTjNXQTVjalpjaHAyaFh0cDRXU2J6N3NHbWJ6Z0ZhOVNIZXZ5YU82anhh?=
 =?utf-8?B?S3R0ZTRXQWFucW42OGRFSEJZa21FTFRnMW8xZDNjMWc4YXZzRW93TkVmN0dl?=
 =?utf-8?B?c0RGUXRRNHFUYVJpT1ord3VsYmZuZy9GR2l4YzAxSUNYNWtzVmhoM0ZlMzVI?=
 =?utf-8?B?cmtkVFZoT2pDSERxTWVxem8xak81Zm5VOGxkZlZsR3hJUm83UU13b0R6clF5?=
 =?utf-8?B?NlRmUHdRbFpDSkVSRU4zZFc2SXRRRnpXZFJiRUlrays1Wk1NNnE1WU5VTHdG?=
 =?utf-8?B?dUhzV3ZxQVFFdHVaMUxMazJ6enNxZkFMQ1NpOU9CY1RTT3FCVGs2NXNuVXRZ?=
 =?utf-8?B?SEswMXdkQkFYU0hlNUFsSmF1UE40S3lEVWh2NHpDVnNQNDNFSzgxZlVubVVD?=
 =?utf-8?B?ZDI5Y255Ui9vdDREU05ZQWY3YUpQSm93dWxBcDFJM1FrWnpBKzBXWlVLUTlp?=
 =?utf-8?B?aWFtamVEbHZ2MndsbVllV1lBbzRweEJBN0MyNVdvenZHdFhuQjNtby8zL3V1?=
 =?utf-8?B?SEpiMGNWYThDVUpkL2NmQWxwK2xqMWpzU1NPNWNITmJDYkJ6M04rSWt5cExM?=
 =?utf-8?B?OEtQSzFjZU03NE1BQmVxamZXK1IySEQxSUtTMWFldVdmVG4zQjI5bjdCbkhU?=
 =?utf-8?B?MkpIUTEzZTZmdndtYjNmLzdUd2FxNTEwV1R2UjhZaWdVN3NkclFUY1RqcmVN?=
 =?utf-8?B?NWdCR3dSMDVKV1VBa05ML1lmSlp3bmdYcFRjWi9wWTNaMHVGVGRGdUpNVlVz?=
 =?utf-8?B?Qmc9PQ==?=
Content-ID: <F8551921C8ACCA4D859B8E620B652D05@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce341545-52b5-468e-097c-08dbbdb18bc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 10:24:05.4386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSIIteU5KeTmh2yrvJWsTY45qu0L/3lhjRcClIGdYR5Dm9AemOcn1XccXdxoErP9LuM6JaT7KmDIDfFHdYa3V4Cl0grsal33SwQDGxzpwrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6340
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_949121021.1632322895"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?B?RWx2aXMgV2FuZyAo546L5YabKQ==?= <Elvis.Wang@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_009_949121021.1632322895
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtNb24sJiMzMjsyMDIzLTA5LTI1JiMzMjthdCYjMzI7MDg6NDImIzMyOysw
MjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMz
MjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwmIzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMy
O2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjtsaW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFj
aG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7
dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMy
O09uJiMzMjsyNS8wOS8yMDIzJiMzMjswNzowOCwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygm
IzI2NTE5OyYjMzA1OTE7JiMzMTA3NzspJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0hp
JiMzMjtLcnp5c3p0b2YsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1Ro
YW5rcyYjMzI7Zm9yJiMzMjt0aGUmIzMyO3Jldmlld3MuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZn
dDsmIzMyOyZndDsmIzMyO09uJiMzMjtTYXQsJiMzMjsyMDIzLTA5LTIzJiMzMjthdCYjMzI7MjA6
MDImIzMyOyswMjAwLCYjMzI7S3J6eXN6dG9mJiMzMjtLb3psb3dza2kmIzMyO3dyb3RlOg0KJmd0
OyYjMzI7Jmd0OyZndDsmIzMyOyYjMzI7JiMzMjsNCiZndDsmIzMyOyZndDsmZ3Q7JiMzMjtFeHRl
cm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2sm
IzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMNCiZndDsmIzMyO3VudGls
DQomZ3Q7JiMzMjsmZ3Q7Jmd0OyYjMzI7eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhl
JiMzMjtzZW5kZXImIzMyO29yJiMzMjt0aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmZ3Q7Jmd0
OyYjMzI7JiMzMjtPbiYjMzI7MTgvMDkvMjAyMyYjMzI7MjE6MjEsJiMzMjtKYXNvbi1KSC5MaW4m
IzMyO3dyb3RlOg0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtHQ0UmIzMyO2hhcyYjMzI7c3Bl
Y2lmaWMmIzMyO3B1cnBvc2UmIzMyO3JlZ2lzdGVycywmIzMyO2FiYnJldmlhdGVkJiMzMjthcyYj
MzI7U1BSLg0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtDbGllbnQmIzMyO2NhbiYjMzI7dXMm
IzMyO1NQUiYjMzI7dG8mIzMyO3N0b3JlJiMzMjtkYXRhJiMzMjtvciYjMzI7cHJvZ3JhbXMuDQom
Z3Q7JiMzMjsmZ3Q7Jmd0OyZndDsNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyYjMzI7SW4mIzMyO0NN
RFEmIzMyO2RyaXZlciwmIzMyO2l0JiMzMjthbGxvd3MmIzMyO2NsaWVudCYjMzI7dG8mIzMyO1NU
T1JFJiMzMjtvciYjMzI7TE9BRCYjMzI7ZGF0YSYjMzI7aW50byYjMzI7U1BSLg0KJmd0OyYjMzI7
Jmd0OyZndDsmZ3Q7JiMzMjtUaGUmIzMyO3ZhbHVlJiMzMjtzdG9yZWQmIzMyO2luJiMzMjtTUFIm
IzMyO3dpbGwmIzMyO2JlJiMzMjtjbGVhcmVkJiMzMjthZnRlciYjMzI7cmVzZXQmIzMyO0dDRSYj
MzI7SFcNCiZndDsmIzMyO3RocmVhZC4NCiZndDsmIzMyOyZndDsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7
Jmd0OyZndDsmZ3Q7JiMzMjtUaGVyZSYjMzI7YXJlJiMzMjs0JiMzMjtTUFImIzMyOyhyZWdpc3Rl
ciYjMzI7aW5kZXgmIzMyOzAmIzMyOy0mIzMyOzMpJiMzMjtpbiYjMzI7ZXZlcnkmIzMyO0dDRSYj
MzI7SFcmIzMyO3RocmVhZC4NCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyYjMzI7U1BSJiMzMjtpcyYj
MzI7dGhyZWFkLWluZGVwZW5kZW50JiMzMjthbmQmIzMyO0hXJiMzMjtzZWN1cmUmIzMyO3Byb3Rl
Y3RlZC4NCiZndDsmIzMyOyZndDsmZ3Q7Jmd0Ow0KJmd0OyYjMzI7Jmd0OyZndDsmZ3Q7JiMzMjtT
aWduZWQtb2ZmLWJ5OiYjMzI7SmFzb24tSkguTGluJiMzMjsmbHQ7amFzb24tamgubGluQG1lZGlh
dGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmZ3Q7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7
Jmd0OyZndDsmIzMyOyYjMzI7aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaCYj
MzI7fCYjMzI7NSYjMzI7KysrKysNCiZndDsmIzMyOyZndDsmZ3Q7DQomZ3Q7JiMzMjsmZ3Q7Jmd0
OyYjMzI7VGhlcmUmIzMyO2lzJiMzMjtubyYjMzI7dXNlciYjMzI7b2YmIzMyO3RoaXMuLi4mIzMy
O1doeSYjMzI7ZG8mIzMyO3lvdSYjMzI7YWRkJiMzMjt1bnVzZWQmIzMyO2RlZmluZXMmIzYzOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJdCYjMzk7bGwmIzMyO2JlJiMz
Mjt1c2VkJiMzMjtpbiYjMzI7Y21kcV9zZWNfaW5zZXJ0X2JhY2t1cF9jb29raWUoKSYjMzI7YXQm
IzMyO1tQQVRDSCYjMzI7MTAvMTVdLg0KJmd0OyYjMzI7Jmd0OyYjMzI7U2hvdWxkJiMzMjtJJiMz
MjttZXJnZSYjMzI7dGhpcyYjMzI7cGF0Y2gmIzMyO2ludG8mIzMyO1tQQVRDSCYjMzI7MTAvMTVd
JiM2MzsNCiZndDsmIzMyOw0KJmd0OyYjMzI7WWVzLCYjMzI7YmVjYXVzZSYjMzI7d2hhdCYjMzI7
aXMmIzMyO3RoZSYjMzI7cHVycG9zZSYjMzI7b2YmIzMyO2FkZGluZyYjMzI7dW51c2VkJiMzMjtk
ZWZpbmVzJiM2MzsmIzMyO0kmIzMyO2Fza2VkDQomZ3Q7JiMzMjtiZWZvcmUmIzMyO2FuZCYjMzI7
ZGlkJiMzMjtub3QmIzMyO2dldCYjMzI7YW5zd2VyLi4uDQomZ3Q7JiMzMjsNCg0KSSYjMzk7bSYj
MzI7dG90YWxseSYjMzI7YWdyZWUmIzMyO3dpdGgmIzMyO21lcmdpbmcmIzMyO3RoaXMmIzMyO3Bh
dGNoJiMzMjt0byYjMzI7dGhlJiMzMjt1c2FnZSYjMzI7cGFydHMmIzMyO29mJiMzMjttdGstDQpj
bWRxLXNlYy1tYWlsYm94LmMuDQoNCkJ1dCYjMzI7SSYjMzI7aGF2ZSYjMzI7bm8mIzMyO2lkZWEm
IzMyO3doeSYjMzI7bXRrLWNtZHEtc2VjLW1haWxib3guYyYjMzI7YW5kJiMzMjttdGstY21kcS1t
YWlsYm94LmMNCmFyZSYjMzI7bm90JiMzMjtwbGFjZWQmIzMyO2luJiMzMjt0aGUmIzMyO3NhbWUm
IzMyO21haW50YWluZXImIzM5O3MmIzMyO3RyZWUmIzMyO2FzJiMzMjttdGstY21kcS5oJiMzMjth
bmQmIzMyO210ay0NCmNtZHEtaGVscGVyLmMsJiMzMjtzbyYjMzI7SSYjMzI7anVzdCYjMzI7c2Vw
YXJhdGUmIzMyO3RoZW0mIzMyO3RvJiMzMjtkaWZmZXJlbnQmIzMyO3BhdGNoJiMzMjtieSYjMzI7
dHJlZSYjMzI7bGlrZQ0KdGhlJiMzMjtyZXF1aXJlbWVudCYjMzI7ZnJvbSYjMzI7cHJldmlvdXMm
IzMyO3NlbnQmIzMyO3Nlcmllcy4NCg0KSSYjMzI7d2lsbCYjMzI7cmUtb3JnYW5pemVkJiMzMjt0
aGlzJiMzMjtzZXJpZXMmIzMyO3RvJiMzMjttYWtlJiMzMjt0aGUmIzMyO2RlZmluaXRpb24mIzMy
O2FuZCYjMzI7dGhlJiMzMjt1c2FnZSYjMzI7b2YNCnRoZSYjMzI7Y29kZSYjMzI7aW4mIzMyO3Ro
ZSYjMzI7c2FtZSYjMzI7cGF0Y2guDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KJmd0OyYj
MzI7QmVzdCYjMzI7cmVnYXJkcywNCiZndDsmIzMyO0tyenlzenRvZg0KJmd0OyYjMzI7DQomZ3Q7
JiMzMjsNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4qKioqKioqKioqKioq
IE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNClRo
ZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5n
IGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJp
dmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxp
Y2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBk
ZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmli
dXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5j
bHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlIA0KdGhhdCB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRl
IGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFj
aG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9zZSB0aGUgY29udGVu
dCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo8L3ByZT48
IS0tfS0tPg==

--__=_Part_Boundary_009_949121021.1632322895
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIzLTA5LTI1IGF0IDA4OjQyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDI1LzA5LzIwMjMgMDc6MDgsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBTYXQsIDIwMjMtMDktMjMgYXQgMjA6MDIgKzAy
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4+ICAgDQo+ID4+IEV4dGVybmFsIGVt
YWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+IHVu
dGlsDQo+ID4+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
ID4+ICBPbiAxOC8wOS8yMDIzIDIxOjIxLCBKYXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4+PiBHQ0Ug
aGFzIHNwZWNpZmljIHB1cnBvc2UgcmVnaXN0ZXJzLCBhYmJyZXZpYXRlZCBhcyBTUFIuDQo+ID4+
PiBDbGllbnQgY2FuIHVzIFNQUiB0byBzdG9yZSBkYXRhIG9yIHByb2dyYW1zLg0KPiA+Pj4NCj4g
Pj4+IEluIENNRFEgZHJpdmVyLCBpdCBhbGxvd3MgY2xpZW50IHRvIFNUT1JFIG9yIExPQUQgZGF0
YSBpbnRvIFNQUi4NCj4gPj4+IFRoZSB2YWx1ZSBzdG9yZWQgaW4gU1BSIHdpbGwgYmUgY2xlYXJl
ZCBhZnRlciByZXNldCBHQ0UgSFcNCj4gdGhyZWFkLg0KPiA+Pj4NCj4gPj4+IFRoZXJlIGFyZSA0
IFNQUiAocmVnaXN0ZXIgaW5kZXggMCAtIDMpIGluIGV2ZXJ5IEdDRSBIVyB0aHJlYWQuDQo+ID4+
PiBTUFIgaXMgdGhyZWFkLWluZGVwZW5kZW50IGFuZCBIVyBzZWN1cmUgcHJvdGVjdGVkLg0KPiA+
Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlh
dGVrLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1jbWRxLmggfCA1ICsrKysrDQo+ID4+DQo+ID4+IFRoZXJlIGlzIG5vIHVzZXIgb2YgdGhpcy4u
LiBXaHkgZG8geW91IGFkZCB1bnVzZWQgZGVmaW5lcz8NCj4gPiANCj4gPiBJdCdsbCBiZSB1c2Vk
IGluIGNtZHFfc2VjX2luc2VydF9iYWNrdXBfY29va2llKCkgYXQgW1BBVENIIDEwLzE1XS4NCj4g
PiBTaG91bGQgSSBtZXJnZSB0aGlzIHBhdGNoIGludG8gW1BBVENIIDEwLzE1XT8NCj4gDQo+IFll
cywgYmVjYXVzZSB3aGF0IGlzIHRoZSBwdXJwb3NlIG9mIGFkZGluZyB1bnVzZWQgZGVmaW5lcz8g
SSBhc2tlZA0KPiBiZWZvcmUgYW5kIGRpZCBub3QgZ2V0IGFuc3dlci4uLg0KPiANCg0KSSdtIHRv
dGFsbHkgYWdyZWUgd2l0aCBtZXJnaW5nIHRoaXMgcGF0Y2ggdG8gdGhlIHVzYWdlIHBhcnRzIG9m
IG10ay0NCmNtZHEtc2VjLW1haWxib3guYy4NCg0KQnV0IEkgaGF2ZSBubyBpZGVhIHdoeSBtdGst
Y21kcS1zZWMtbWFpbGJveC5jIGFuZCBtdGstY21kcS1tYWlsYm94LmMNCmFyZSBub3QgcGxhY2Vk
IGluIHRoZSBzYW1lIG1haW50YWluZXIncyB0cmVlIGFzIG10ay1jbWRxLmggYW5kIG10ay0NCmNt
ZHEtaGVscGVyLmMsIHNvIEkganVzdCBzZXBhcmF0ZSB0aGVtIHRvIGRpZmZlcmVudCBwYXRjaCBi
eSB0cmVlIGxpa2UNCnRoZSByZXF1aXJlbWVudCBmcm9tIHByZXZpb3VzIHNlbnQgc2VyaWVzLg0K
DQpJIHdpbGwgcmUtb3JnYW5pemVkIHRoaXMgc2VyaWVzIHRvIG1ha2UgdGhlIGRlZmluaXRpb24g
YW5kIHRoZSB1c2FnZSBvZg0KdGhlIGNvZGUgaW4gdGhlIHNhbWUgcGF0Y2guDQoNClJlZ2FyZHMs
DQpKYXNvbi1KSC5MaW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCj4gDQo=

--__=_Part_Boundary_009_949121021.1632322895--

