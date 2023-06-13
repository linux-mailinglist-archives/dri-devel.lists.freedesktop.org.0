Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB3372D768
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 04:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6DD10E2F2;
	Tue, 13 Jun 2023 02:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF6F10E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 02:37:39 +0000 (UTC)
X-UUID: 40c29a1c099311eeb20a276fd37b9834-20230613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=5vq1YufKNGuffCPTKrY4XwFLyxMDsfSe8pM05sVkRpw=; 
 b=ehcAKiwaWCCQlBqmqEX86BQigmwFQh25Ht3iFPCnTH/GpDJQnCA/D4Dnflh9RgK8ilThwJzk1IYSTNryU5trHhigP2hivJqUnTz/RpvLktEK5EtE6kdPT7b5vYP57IWEjy9HvBrcGWymCW0N/HINv/rbqBvRRdCfRcUvGzKV9qk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.26, REQID:b4e080e0-0369-44f0-98ec-5abaa2734ddf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:45
X-CID-INFO: VERSION:1.1.26, REQID:b4e080e0-0369-44f0-98ec-5abaa2734ddf, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:45
X-CID-META: VersionHash:cb9a4e1, CLOUDID:f9c06a3e-7aa7-41f3-a6bd-0433bee822f3,
 B
 ulkID:230613095251RY68AK8N,BulkQuantity:12,Recheck:0,SF:29|28|17|19|48|38|
 102,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:41,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR, TF_CID_SPAM_SDM, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_OBB
X-UUID: 40c29a1c099311eeb20a276fd37b9834-20230613
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1930174605; Tue, 13 Jun 2023 10:37:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 13 Jun 2023 10:37:33 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 10:37:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkpip2fnOYn3Ep0qsQhDVSIyT34InoztOaCi6jeHUjOmlocGq30AbNYJ2ZubJM+ZqlGHbQq/Zbhg6X5o7lD4vIU0FFQwpZOQZXXEaObRxg5piVaeA2Mkwh/Qy0KLiPT5QBMaFizfzHUc5XCuSunO6eIxSs0R7+LkBCuQpPAq3kejSBXm0CXT5LPG5PgDBOSoBb4rmfPFG/BaQh/3TA/t+qJZk7siio9r/6lFmYH7Fvi9FTO2VICPGbsmG+PCTl+EfU4RsEQgAut/yogd4ThD6Q6uk7XBYzuWzSLtAJKfKmd6ic7xlcnAG9OkmyXLTSAZ8I50YXhiPnHZUoIZc/lNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzLXsN/TIFv5ZP1IY53HEL0eP0wknDZD7l7BRkayOhM=;
 b=Wv2VpAhcxBTc1EydLYKfAGJ5ojyX5hsCx12PzH0faQYvMBuUg/WdYyuH0G4hkMuz0qjO9EeyJYf7OP52cJ6urn80nR2EB5pguz+zurPZE9Xib3c88BEMa5ho7r1Kl0qtDL/F+GWQ1wbR3poVKb+7rRV6FRsKDz1swhLtclyx9N49x5HlcXXj6HEsm6ujP6UvgctB1Fp+zqgpOmoqXUwJCWOenuOrhBip6DdWIx+v5JvcZN5Ru1mx7CbeDwskdYEmmz2OJX91psbadknmD9AdUUTg5ynGJGQ0GBtBDCLsCf/5oNODtDKUyaI11/4WtaDEudjzraUizxyHBRCy8eDfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzLXsN/TIFv5ZP1IY53HEL0eP0wknDZD7l7BRkayOhM=;
 b=WjJVLnvDeszN7FfsPrloiiUP5PC507QVx9+sDY+LGYwLGvFxdewMdF5wshf6uvyt4RyFn2XOLqUOYOkLtOBHW3dGOPiDWhwET+njIT+yfFZfW0TvpXgQqWdMyPMhroHi8um8Ly1f13nWTWj5+4G8MgxmFWlbxeKE20ig60o4GB0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PSAPR03MB5318.apcprd03.prod.outlook.com (2603:1096:301:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 02:37:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::6fdb:ba2c:bcfc:d5ed%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 02:37:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "kishon@ti.com"
 <kishon@ti.com>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
 <Chunfeng.Yun@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "granquet@baylibre.com" <granquet@baylibre.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 3/8] drm/mediatek: extract common functions from the
 mtk hdmi driver
Thread-Topic: [PATCH v4 3/8] drm/mediatek: extract common functions from the
 mtk hdmi driver
Thread-Index: AQHZkjs2ZDPgTpEqDkWt3l1l3r/1ya+IG4kA
Date: Tue, 13 Jun 2023 02:37:31 +0000
Message-ID: <97a3b7683e665a9d44b407fe7a62f88b49ce38a8.camel@mediatek.com>
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
 <20220919-v4-3-687f09a06dd9@baylibre.com>
In-Reply-To: <20220919-v4-3-687f09a06dd9@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PSAPR03MB5318:EE_
x-ms-office365-filtering-correlation-id: da4e33dc-8669-4c9d-e5a5-08db6bb722e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8DYnD+b5EYX4JljAgTTN8P+66mmb63ZaFyM0I7E+4RQpafv7jdembFQHDvUfseTaE9Sz4sy74UllplCFD9VYXYg6lkdBzzlnOUc/jmv84v8oLXmy/CpmHnSbHyU1pbcEsoF8K89Iz6XBnQDZOz1P2lINAOOsvAUJG6expbZXOvAoNbx/wNFBbcGsfRcSbPO8PiCoSaTo4Epw0/460UfoopLsOOIYo1T4IBOLLFqRpioynEKnkdb9INaPjtmDDt77ZIZHEURjkRfnHz4ZLqw/lpwa7bN4o9CREAvftTZhdPAm4lbDl+3E3h2NM7VX0O4NQzAsaiBAKPMbDP53o6nOwwYgwn6K7suOVv3qwzlN9Sa8vxrnkjeTctKIHKjttgKl2QgqmASlRnflysqJZYM+0iVuebCLyerRMpPMbXZXA3qSZUGILVeAgajk+Xqd256anq74YvIUBN+smaiq0wUj68ZEmjoElputZtCF5FxD5DoUmApUVDVWAlclgZCv7ka98EjAhAeU9f0PR8X7EDcgFma3SNSWFYpFpfh0kaunR9cSlLOvEBW9dGKsLcPTC79qwqqU00JddPUI33rD7Ph6kQDez3Hj7xawB2/Xm5gJipgIoyvlhPre8wE2L8O4phCU0Cpvik+Lo3iSZIDQxdQQY3KP8HDlDFqo37kfOtQnbg//iGxcPywtVgeTyseBAa28
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199021)(5660300002)(7416002)(8936002)(8676002)(4744005)(2906002)(76116006)(66556008)(66946007)(64756008)(66476007)(66446008)(54906003)(110136005)(71200400001)(6486002)(4326008)(26005)(6506007)(6512007)(316002)(41300700001)(186003)(921005)(83380400001)(2616005)(478600001)(38070700005)(36756003)(38100700002)(85182001)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFQwQ1B2bjFpYmlZVTRLc0I0VkFsL1FjREhiSDlXUzh3SVBEUDBmOTBSK2ZS?=
 =?utf-8?B?OGtBbUl1THkzcFpkVkNxOFJLc2h3aU1OYkI5VjdZVkdoMXdYaXd5RlJ1MGxY?=
 =?utf-8?B?eGI3clRhK2dUYkdVbmlOUHFKbXphdjZCcytxMW1tcnhZTFpjR0Jna1BEWnlP?=
 =?utf-8?B?SjN5WDFpS1M5elFITTZvSXl6ZUdxejhVUWRiMFkvY0lFcDFLeEt2VkxBNmM5?=
 =?utf-8?B?T29nU0Z4NTJDdFRiZ25DM3ZyM05WM2tOWkQ2VFEvTnoyb2xYREFmdUZEZDhG?=
 =?utf-8?B?eEl6NUtIMUdJUFFjZjRGMHptSitndTdUdW96azZIaGVOUHBjaFEzM0dReUZ0?=
 =?utf-8?B?a3ZYMUVnWjdTNTZieFp3TE9XdHhpNzJveWJPeUQrSUpIbkNUK3VGWFhNMXlL?=
 =?utf-8?B?cmNuMEF1LzNtS0NFbDZnQkVOWEh0SnlvanVsdG96ZzlWVUxMR21ycWxtb0Vr?=
 =?utf-8?B?UEVPbUZzQkQ0V3dSQktwdGhycmRZVzN1OE11Q3VsdS9CakdjdGZBMG5sS3hV?=
 =?utf-8?B?UWVPK25GTFdoSHFoUHlEWVZVUVA0OHMxSlY0TTJVYXZjVU1ReCtSeXFYbWxi?=
 =?utf-8?B?dHJFSi9ZNUZQR2RkNTFvYzVWRldhYk55bkFVWTNSRmd1WFNVYnJ1NmZzU2Zj?=
 =?utf-8?B?L3ZwSzRKZ21jaE5ZQ1pWZk1kMHBrUVBLR2NFQjJQdHoyWDJmRFVzTGR6anpI?=
 =?utf-8?B?WVRna3pEY08rZmZDYi9QbFRFazY5MWxxSyt0cHlpYTFTT0FLYU90cjdKQTRE?=
 =?utf-8?B?Zm9JOTVoY1kvMlVBTTNlOFhDeEFzeXR6TVRBTXZmZ2Jnb1FTZ3lYUHQzMktQ?=
 =?utf-8?B?RTVSMnQrc0tJeTNRbFE5S1hPcTBDR2RCVHJMYmxMRG85bFpjaW1nQk9TV1po?=
 =?utf-8?B?Y2Fjc0lZWmFtYzZrVlVVTjR3MjF0TkpSN0hoS0txelZHRVc1TTRML0I5UWJn?=
 =?utf-8?B?Z1p1MXh4Wkx0V3QrcktlejFac0kxMTdJenlXR2hiMGJ5NkMrWldEOTBodkpJ?=
 =?utf-8?B?RDBQNnRzZ29LWDl3QWJBcVZnaXJJUHdQRlBCTFpFM1hkREdoemFHWlpSWXh2?=
 =?utf-8?B?aDYrRlhnYnlXZ0dCMDQvTWRjRlRTQVRhaW1lVk00QWxqOG9yci9USTRTVEM2?=
 =?utf-8?B?WGhZMzBDU2JJNHFiUEpyZnNHTWxmelR4UlZpVnNwenFwN0Q0dUJUL0pPZzhl?=
 =?utf-8?B?djZzMzRya3I0ZkFnZWljOElOYVVpTnVYNGpxTmhKbS9oalBLdmdLeWxQUWh4?=
 =?utf-8?B?ckg4RXBRQnV1aXVjeTU4cEdIS3N6ZUt1UFBZNFZzSTBDaDFWVWQzYVZueGZl?=
 =?utf-8?B?b0EwMENWSW85bEtOMis3dGhYdlFlSlRQZXcxUllRTUxKeDJqQU9LVlJLejFn?=
 =?utf-8?B?eXMwM0IrMHNxWjk1QTBXKzlIamtQKzN0ZkxXTTZVKzBYTWFTeFBWMmtQb1cv?=
 =?utf-8?B?WjhBdFZNSmU5QlQwcHduYnBPZzFXeGs3Q1pmMkVhemVKbVVKV1FxV0ZDMitH?=
 =?utf-8?B?WE43TEpVMU9jNmVKa21ON0JuZjJxS3VDRHhHVlpnZkloczVtY3hmenZwS01m?=
 =?utf-8?B?VTVJNTN5R1F0alA0UVZzMllYWm5MU2JxSldoSXJURE9scStySlA3cnJza05Z?=
 =?utf-8?B?SXJ5UE00aDd4aFE1TDhwRzc5V29GNGlhbUUwT1lBaFZIbElJTytlOEs0Nnk2?=
 =?utf-8?B?Z2ZTd3ZaNUJYM0MzNnJmSXF6YXBJUTlUYU1MZTlTdENoRlN4a09KeEVFTkxy?=
 =?utf-8?B?RHZ6U0lEdnhVa2JESXJnMmtSOGFmUmZMbVRYU21tcGhCSnhTbzBwVjRHb3Fu?=
 =?utf-8?B?KzU0TkRCRXl4RS9rMzRqdXg3Mlc4UkltYlUyc0lsa0Fjdy84T0l1c1ZhZHpr?=
 =?utf-8?B?L3lNQWVZcFByazVFUFRIWDg5dEFWZVZ5T3dpVmkrUU9VWXBrVnh4eGVvMXFJ?=
 =?utf-8?B?R2FTZDdNZDMxOE1XWVQrZjFET3JTTVlkS2tyOVZFbkhCSWtMQ1p4OHFRenNh?=
 =?utf-8?B?WnUxcWkyamo0QjJaWENYU1k2SWhVNVRIZGNHNWxlOEJ4ZS9hNE5NV21wWnNB?=
 =?utf-8?B?UmF0Z09ndEwydHhrUytieVZHN1pVWEF1aUZvQk9JY2huMTVXaGVHcm5Tck1V?=
 =?utf-8?Q?PVpQ8sC1HuhM20fhX0+q0yVsR?=
Content-ID: <F92959F2CC9118418B0363EC78C4D3A3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4e33dc-8669-4c9d-e5a5-08db6bb722e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 02:37:31.1486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0iPVG5oGyE1DuqRDqNfa/OSFbVCzR3YlwI9GMvD3cKbkifZaLTkC/9F4OilYaLdT7VGzaU+OKSQgGcYgXbJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5318
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1277398835.709230219"
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
 =?utf-8?B?U3R1YXJ0IExlZSAo5p2O57+wKQ==?= <Stuart.Lee@mediatek.com>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_005_1277398835.709230219
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7R3VpbGxhdW1lOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNS0yOSYj
MzI7YXQmIzMyOzE2OjMxJiMzMjsrMDIwMCwmIzMyO0d1aWxsYXVtZSYjMzI7UmFucXVldCYjMzI7
d3JvdGU6DQomZ3Q7JiMzMjsmIzMyOyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwm
IzMyOzomIzMyO1BsZWFzZSYjMzI7ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtv
ciYjMzI7b3BlbiYjMzI7YXR0YWNobWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hh
dmUmIzMyO3ZlcmlmaWVkJiMzMjt0aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29u
dGVudC4NCiZndDsmIzMyOyYjMzI7Q3JlYXRlJiMzMjthJiMzMjtjb21tb24mIzMyOyZxdW90O2Zy
YW1ld29yayZxdW90OyYjMzI7dGhhdCYjMzI7Y2FuJiMzMjtiZSYjMzI7dXNlZCYjMzI7dG8mIzMy
O2FkZCYjMzI7c3VwcG9ydCYjMzI7Zm9yDQomZ3Q7JiMzMjtkaWZmZXJlbnQmIzMyO2hkbWkmIzMy
O0lQcyYjMzI7d2l0aGluJiMzMjt0aGUmIzMyO21lZGlhdGVrJiMzMjtyYW5nZSYjMzI7b2YmIzMy
O3Byb2R1Y3RzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7R3VpbGxh
dW1lJiMzMjtSYW5xdWV0JiMzMjsmbHQ7Z3JhbnF1ZXRAYmF5bGlicmUuY29tJmd0Ow0KJmd0OyYj
MzI7LS0tDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7fCYjMzI7JiMz
MjsmIzMyOzMmIzMyOystDQomZ3Q7JiMzMjsmIzMyO2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jJiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO3wmIzMyOzU5
NiYjMzI7KystLS0tLS0tLS0tLS0tLS0tLQ0KJmd0OyYjMzI7LS0tLS0tLS0tLQ0KJmd0OyYjMzI7
JiMzMjtkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuaCYjMzI7JiMzMjsmIzMyOyYj
MzI7JiMzMjsmIzMyOyYjMzI7JiMzMjt8JiMzMjsmIzMyOzE4JiMzMjsrDQomZ3Q7JiMzMjsmIzMy
O2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaV9jb21tb24uYyYjMzI7fCYjMzI7NDA3
DQomZ3Q7JiMzMjsrKysrKysrKysrKysrKysrKysrKw0KJmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWlfY29tbW9uLmgmIzMyO3wmIzMyOzIwNyYjMzI7KysrKysr
KysrKw0KJmd0OyYjMzI7JiMzMjs1JiMzMjtmaWxlcyYjMzI7Y2hhbmdlZCwmIzMyOzY2NiYjMzI7
aW5zZXJ0aW9ucygrKSwmIzMyOzU2NSYjMzI7ZGVsZXRpb25zKC0pDQomZ3Q7JiMzMjsNCiZndDsm
IzMyOw0KDQpJJiMzMjt3b3VsZCYjMzI7bGlrZSYjMzI7dGhlJiMzMjtmaWxlJiMzMjtuYW1pbmcm
IzMyO2FzOg0KDQptdGtfaGRtaS5jJiMzMjs9Jmd0OyYjMzI7bXRrX2hkbWlfbXQ4MTczLmMNCm10
a19oZG1pLmgmIzMyOz0mZ3Q7JiMzMjttdGtfaGRtaV9tdDgxNzMuaA0KbXRrX2hkbWlfY29tbW9u
LmMmIzMyOz0mZ3Q7JiMzMjttdGtfaGRtaS5jDQptdGtfaGRtaV9jb21tb24uaCYjMzI7PSZndDsm
IzMyO210a19oZG1pLmgNCg0KYW5kJiMzMjt5b3VyJiMzMjt2MiYjMzI7ZmlsZSYjMzI7bmFtaW5n
JiMzMjthczoNCg0KbXRrX2hkbWlfbXQ4MTk1LmMNCm10a19oZG1pX210ODE5NS5oDQoNClJlZ2Fy
ZHMsDQpDSw0KDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioq
KioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioq
DQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1
ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBh
cHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0
aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlz
dHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwg
KGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUg
bm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRo
YXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBh
dHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNv
bnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9w
cmU+PCEtLX0tLT4=

--__=_Part_Boundary_005_1277398835.709230219
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEd1aWxsYXVtZToNCg0KT24gTW9uLCAyMDIzLTA1LTI5IGF0IDE2OjMxICswMjAwLCBHdWls
bGF1bWUgUmFucXVldCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBDcmVhdGUgYSBjb21tb24gImZy
YW1ld29yayIgdGhhdCBjYW4gYmUgdXNlZCB0byBhZGQgc3VwcG9ydCBmb3INCj4gZGlmZmVyZW50
IGhkbWkgSVBzIHdpdGhpbiB0aGUgbWVkaWF0ZWsgcmFuZ2Ugb2YgcHJvZHVjdHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICB8ICAg
MyArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgIHwgNTk2
ICsrLS0tLS0tLS0tLS0tLS0tLS0NCj4gLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmggICAgICAgIHwgIDE4ICsNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfaGRtaV9jb21tb24uYyB8IDQwNw0KPiArKysrKysrKysrKysrKysrKysrKw0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pX2NvbW1vbi5oIHwgMjA3ICsrKysrKysr
KysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgNjY2IGluc2VydGlvbnMoKyksIDU2NSBkZWxldGlvbnMo
LSkNCj4gDQo+IA0KDQpJIHdvdWxkIGxpa2UgdGhlIGZpbGUgbmFtaW5nIGFzOg0KDQptdGtfaGRt
aS5jID0+IG10a19oZG1pX210ODE3My5jDQptdGtfaGRtaS5oID0+IG10a19oZG1pX210ODE3My5o
DQptdGtfaGRtaV9jb21tb24uYyA9PiBtdGtfaGRtaS5jDQptdGtfaGRtaV9jb21tb24uaCA9PiBt
dGtfaGRtaS5oDQoNCmFuZCB5b3VyIHYyIGZpbGUgbmFtaW5nIGFzOg0KDQptdGtfaGRtaV9tdDgx
OTUuYw0KbXRrX2hkbWlfbXQ4MTk1LmgNCg0KUmVnYXJkcywNCkNLDQoNCg==

--__=_Part_Boundary_005_1277398835.709230219--

