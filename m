Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E97A41E5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7356810E1B5;
	Mon, 18 Sep 2023 07:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB64210E073
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 03:04:36 +0000 (UTC)
X-UUID: 4277af0451e211ee8051498923ad61e6-20230913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=HNF63dIXSafhwTUbZ0tPtAQKT27OOcDfumIEdyCa5QM=; 
 b=hYVZ4EO7EtCJ0eOmvFkBwVDexiI7A7Y9bZ/TBhSW6641R40yoIxn6sQ0G2+gOPoC/x0CWt19P4luPDE5H1i+74l2mmau7kRaPpneDHLrnLMV5yPlFXmqo9rXBvtptpHcDVahBOGh3FM+IAula1ngLQwg6XKZeGLDtLbOLPw1QMc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:2dfaad9c-72ac-4716-ae69-31b8f7c07932, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:0ad78a4, CLOUDID:25fff5c2-1e57-4345-9d31-31ad9818b39f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 4277af0451e211ee8051498923ad61e6-20230913
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <moudy.ho@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1321258282; Wed, 13 Sep 2023 11:04:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Sep 2023 11:04:31 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Sep 2023 11:04:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX6eXRvXR7r1bMP8oytb4CWrbkTOCxFG0adwmbHsZs9r54evR/OBAEBx21S54/mQEsKXar0NaPk+HcVRNLjddBtENADC1NFJgu7nucfmUZiyATGk168PcrK3zHz+xmxpHCo/W3VC47L7hm2JC85+ZYvC7mozIisHxxIfPKdL24CB8+HXnu6jaA6OV6114Z3qcDgj8gZqnwbBu//aELQh4POJtOjDH4QCgv6pFQLOz7AmIK/tv7F+on1Yb+pnwDQ06udorXGhBHDSjwN0xJDYDS3/JwH/rdHGw7ilskC3P/hQygfeidk2BiGroSt/jF0XAbu+JS7Q8DLleWD2+5SAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNF63dIXSafhwTUbZ0tPtAQKT27OOcDfumIEdyCa5QM=;
 b=i3XYSuqfPejEwfMVS5cFly4Qo4uUj5hYwbgziYZbZCpEgicGGmCcHQA4csgt5UHRPDjKa9kZcbOE0fTKuXGMCrFquiJDk12bt/f+kctP/v2PkSlce4IxkwlMbCEmCLFNdQ5JxWKkEss1pS8fXnMMf5DU7KOCUhbhqYb4NCYNHS7n9Jkd9d3b8eqRuHK5Da26h1+BRwY9H2RIgVrfVmOQIzC0zveo1gInGg5COa9bh2mzlA1zsIIC0llRwdwGoT8+64VDikFcsX0VcJbijwVEuc7XQp6AkW8jOcAtH9wXetZ+i/4wAJMDOiEBBJB4hObFLZ3n2L1Nc+wj87EUw8PNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNF63dIXSafhwTUbZ0tPtAQKT27OOcDfumIEdyCa5QM=;
 b=J2bNl01LNDkFoY4scWq5KEhb1lR4Ddqm2jQpi+juFEacupgIuaHA8TB8Zl/fokO4/a0e99fePoXdoi3S6+qN9juRYTGEiJK8G4CqrrNP6XrIr4iNj2NMKfvgMZ7nLzB3+NCslsjCNH324LAY6aiixfzdLSz5kh2HdvvmbSyo3A4=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SI2PR03MB5642.apcprd03.prod.outlook.com (2603:1096:4:132::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 03:04:25 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::492f:b5e4:51a:5ecc%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 03:04:25 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "airlied@gmail.com"
 <airlied@gmail.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-binding: mediatek: integrate MDP RDMA to one
 binding
Thread-Topic: [PATCH v5 2/3] dt-binding: mediatek: integrate MDP RDMA to one
 binding
Thread-Index: AQHZ5U7Rf5BA35TwvU6CGHtx6fpAQrAW2C0AgAE7M4A=
Date: Wed, 13 Sep 2023 03:04:25 +0000
Message-ID: <69ce225d04b1ed3890365c6f684bdbdb5c540e16.camel@mediatek.com>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-3-moudy.ho@mediatek.com>
 <83b3f2eb-84e3-2daa-c63c-14b6792a1db5@linaro.org>
In-Reply-To: <83b3f2eb-84e3-2daa-c63c-14b6792a1db5@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SI2PR03MB5642:EE_
x-ms-office365-filtering-correlation-id: f56885d7-c5d4-4f95-ed1c-08dbb40622e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nkF9xn5zYUBauwqzKqaHVEyBPHMOuIDsZ/3+1X9UTzL+jtZsGPKKAVgPOCE3I6Rxbg+HlxWKb9otD301JncVxZ4/P5f3BCAXgBPSzfvaDurLIfiLYe6Ibqcdodld8cFxrW0X46JX8B9FMj2yhyiIusj8SOXGNjE84n9I3QcbbiLtYvB4q5ptriiR6OdZPO+nJOISf1sn5kwWawQKGJf9cD4bilUQiYYgP4pmVOtH1GBo7zkALO5y5h/SH3HA+hWmNwAuzxqov7Q6dAw+Fa9JjNO0ObXkxUdD98wnHsc8QAfoZ6hn/sJUgGqFO8SlRGey/7ONqQI5PNRQmRn+zBY4pDV5FxHeXJUOPyQ2QeQ173aPUkjHMu9n2Cw+7d3YTKuNLp33cjtc2apU0RYQLGcNrUV49JG1+JUc/9ZpBPZkHOVyw9iauJBGL03j+xTjrIBBAaT/NAa+YYMebghq6iEYHVnqFlS6L6b/JpshYSBXVEllSSjdS2U3/kst4nxQs55sS8FsFG/BX6sNEyMlyEunayx7BB08BvUofxEf4RdCwyKPB4js1t0usGPqXV5tdCyEYLEE9VVRX68a8vl52R5manAGcJwFDJXP6bXibkTZFWlM53AjnrmgvcalC8JEMBdbRexEADGF4T05IOBS2i9tQ3zy/2U2sa0mr1Hj2rvwsxZLCHniMjb0R4g754jUxqVdeAGi1z3xeX1QTmpr5KOWQQ6XfddbXzhb1fJKi4RF3xw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6356.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199024)(1800799009)(186009)(83380400001)(122000001)(921005)(53546011)(6486002)(6506007)(71200400001)(36756003)(85182001)(2906002)(38100700002)(38070700005)(86362001)(26005)(66946007)(2616005)(110136005)(4326008)(6512007)(966005)(5660300002)(7416002)(478600001)(41300700001)(316002)(8676002)(8936002)(64756008)(54906003)(76116006)(66446008)(66476007)(66556008)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVRFYkd6a0EzdkR5bHZHd0tBQ0xVaDQrVnFLZFBMUmVydEZ4VWtGMTJpNENO?=
 =?utf-8?B?YjZRQWtQeHhBRytkaEpJakQ2cmpIenVLdE41K1JPcCswSUJqMTF4aUtNRmc4?=
 =?utf-8?B?STlNeFhtTE0ydHFiYmx2MmgzRzJlcVM3TkphQ1JjUjNtYWZpTUpUMmF3RW5O?=
 =?utf-8?B?cUlCQ3k0ZjhQVjg3WFJjVU9WMndTZTZleEFuT2MzQVI3UjJaaUJhOFVMMlFs?=
 =?utf-8?B?VGxLVE1MbGUwcGgrMC8wT2t5YVU3NE1RcndxNllFdVVqVUpjUnhIMWd0ZzJZ?=
 =?utf-8?B?Z2dtMXNxWEJxV0NtdzdNY2d4NnFaU29rNG9XQ1d1VlVmdjlWRm9haW8reDk1?=
 =?utf-8?B?cmF6WldFSndhZ2pmVDJ0RWFuWTJ2SUtXNHYwcDBqempWcG8wdk1pbGdJVjJG?=
 =?utf-8?B?STBaOTJKRERqQU9HRGVlTlBuNWdNb1lWWm1memZqR2tQR0pnc0U2T09MZzJN?=
 =?utf-8?B?MVc4Z3crOS9qSFlObW1MdkN4M1YvR3BMbTRQclNLRDlrQkkzOUx1Mklib1o0?=
 =?utf-8?B?SUFEOE9QUmR5eEhGVVBqWFBnc3gvOVVtekZSeEM1WVl6Z0ZpbVNPQnIwUkpW?=
 =?utf-8?B?ODR3TzlaWnpwQzFlVzFPd3VYUzUxR2dsY3NDbkExOUwzQUVYZXhZVGtYTXBm?=
 =?utf-8?B?K3Y4YUg0RTkvVVJvK21oSzg3M0U1QWRZMzYza0tTdGJHaVEzM1h5RHo3NXRE?=
 =?utf-8?B?SGZNMzZ2ZWo3dmZlUC8wY0JvVUhYbVpLbzk1YkowWlZUSUoxUi9lYVZkdnh0?=
 =?utf-8?B?czZuUy9IdWlLTkR5RG9iVFcvRjBkR0N6bUN4Rm1QRkUzSjl3Y05XUVNBck9D?=
 =?utf-8?B?U2ZENFpPaGFuQ0pYKy9xZXNmNGMxOU92alNVSk5ZM0hac0p2MWtLZU54eWdI?=
 =?utf-8?B?empXU1hETEVWS09VSzhOeVl3a1ppc3VYSHhjRXNYU2IyQjdKODZaUDBiNUZF?=
 =?utf-8?B?WmdMS0RRZGZQK0dSK1ZlQktPV0t0c2hNN0RQcmRHTlJ3REVJOGszQTkzcmU1?=
 =?utf-8?B?azcwZjIwbFNpdUtLaXB4c2xUMzdxTHIyM0hyRVFxK2R2eXV0MlhXSVEyTGpi?=
 =?utf-8?B?bHVpZkxEV1h5ejRGWDl1QmR5Q2JGZWl5YlBSRTFGcCtBSHZFbzAyRXpJd3FR?=
 =?utf-8?B?NVJhcXhqaGpyTy82NmFRSkdhTUMrRWg2SjNBSm5DRm5hYks4UjNQVWl2RnRG?=
 =?utf-8?B?Z2lLWlFPZnQ3Wmo2Nlo4M0xjdkpEcTNCbkgrZXNZUWswMHhzaWF4RWQzazY4?=
 =?utf-8?B?d1Y1Z2JvRGtQNUVmZE0vOGJ6bFRvUEJCN1huQVJFUkg3Znl6L2hpcEkwQ2Z0?=
 =?utf-8?B?QW9yK1JSL3pkUXFBM3ZmVVNmcmpydGdUU1RKU1JJeDdFSTJ1T01kZTljN1Ev?=
 =?utf-8?B?ZGtJMHZVSGdXRlJnWlB5SEtYMkxjWFRBUEpaa2VCV2dsUnNGRXBkU09KVW41?=
 =?utf-8?B?b1hXN3crR0haVjkrSXhsd3ZkNC9PREs3SWpNMFEyaFMwMTlCRzROTStLRElw?=
 =?utf-8?B?by8vZVZqMy9leG45WjVkYzZJalJNb3ExMmR6VnlxVG9sSmRwck9qeFNQRnNx?=
 =?utf-8?B?SXlFekNxbEZGamNMd0lnMWdJdmJjM0RpRkc0MEFTVEw5TTQrM1prNmpZYThq?=
 =?utf-8?B?RDlQaUhyd005WU1jVmxXek9XZkFKbnpEaVhNSE84SmwzWXd0YVNPUEEycU5Y?=
 =?utf-8?B?U2RldkdxU2RpeGs1M2NRMkpMTlJ2Ni84TG1lVnh2RE5jT2o0dWRMaDBwZ0FM?=
 =?utf-8?B?dG9MdDJPQzVLcmtHcVdYcnVhaVFHUkY2a0RGbldVcEF2ZVBicG9VdGRUMmdQ?=
 =?utf-8?B?Q1kxUFJPLytyc3F0S3Bja1NKSitrS3U5cFBpY2JrSEZUdHJvYjhTejJmNzQ1?=
 =?utf-8?B?eXRUN1lySGl6UG9JWkJMNlIrOGxlTTVsQVpiSG81RWVlenBFRW56Uzd1Z0xW?=
 =?utf-8?B?N1h3VHRwbFRoVEJDL2hUK3JBdzVGMUdMTDBKYW1XR21DK0E2alJISk44YjNn?=
 =?utf-8?B?U2ROeW91TzM0Mkh6MjhzckFXUG5ZYXRGMXJDVXZZZlJHNnJkNUJZdUVmZFB2?=
 =?utf-8?B?OFVIU3ZwclcyVnlnT3orWnludStVNHRLaUJHdjZ1TDRCSDV6bjE3TDN4Qm9U?=
 =?utf-8?B?c3BCUDFRcEdrRXJSMzBnYnVrRmdwSmdSQXpoM2E1d2RDaDFydS9na2U4MFlD?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68D4EEBD2FE2CC4AA5066DB1C40BE28B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56885d7-c5d4-4f95-ed1c-08dbb40622e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 03:04:25.1226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11FbPtpYb3vjPkUNiZUOmCh0WsIslOY/ZNwuWxjO/4pC8Aeks2+b7044EhEaHKZLHoNIlHIaA+kyT43duKh8Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5642
X-MTK: N
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDEwOjE2ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gIE9uIDEyLzA5LzIwMjMgMDk6NTYsIE1vdWR5IEhvIHdyb3Rl
Og0KPiA+IER1ZSB0byB0aGUgc2FtZSBoYXJkd2FyZSBkZXNpZ24sIE1EUCBSRE1BIG5lZWRzIHRv
DQo+ID4gYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBzYW1lIGJpbmRpbmcuDQo+ID4gDQo+IA0KPiBQ
bGVhc2UgdXNlIHN1YmplY3QgcHJlZml4ZXMgbWF0Y2hpbmcgdGhlIHN1YnN5c3RlbS4gWW91IGNh
biBnZXQgdGhlbQ0KPiBmb3INCj4gZXhhbXBsZSB3aXRoIGBnaXQgbG9nIC0tb25lbGluZSAtLSBE
SVJFQ1RPUllfT1JfRklMRWAgb24gdGhlDQo+IGRpcmVjdG9yeQ0KPiB5b3VyIHBhdGNoIGlzIHRv
dWNoaW5nLg0KPiANCj4gVGhpcyBhcHBsaWVzIHRvIGVudGlyZSBwYXRjaHNldC4gSXQgaXMgbm90
IGR0LWJpbmRpbmcsIGJ1dCBkdC0NCj4gYmluZGluZ3MuDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kaXNw
bGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yZG1hLnlhbWwgICB8IDg4IC0tLS0tLS0tLS0tLS0N
Cj4gLS0tLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLXJkbWEueWFt
bCAgICB8ICA1ICstDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA5MCBk
ZWxldGlvbnMoLSkNCj4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0DQo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gcmRtYS55
YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4gcmRtYS55YW1sDQo+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssbWRwLQ0KPiByZG1hLnlhbWwNCj4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCBkZDEyZTJmZjY4NWMuLjAwMDAwMDAwMDAwMA0KPiA+IC0tLQ0KPiBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC0NCj4g
cmRtYS55YW1sDQo+ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDg4ICswLDAgQEANCj4gPiAt
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQo+ID4gLSVZQU1MIDEuMg0KPiA+IC0tLS0NCj4gPiAtJGlkOiANCj4gaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAtcmRtYS55YW1sIw0K
PiA+IC0kc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4gPiAtDQo+ID4gLXRpdGxlOiBNZWRpYVRlayBNRFAgUkRNQQ0KPiA+IC0NCj4gPiAtbWFp
bnRhaW5lcnM6DQo+ID4gLSAgLSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4NCj4gPiAtICAtIFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4g
LQ0KPiA+IC1kZXNjcmlwdGlvbjoNCj4gPiAtICBUaGUgTWVkaWFUZWsgTURQIFJETUEgc3RhbmRz
IGZvciBSZWFkIERpcmVjdCBNZW1vcnkgQWNjZXNzLg0KPiA+IC0gIEl0IHByb3ZpZGVzIHJlYWwg
dGltZSBkYXRhIHRvIHRoZSBiYWNrLWVuZCBwYW5lbCBkcml2ZXIsIHN1Y2ggYXMNCj4gRFNJLA0K
PiA+IC0gIERQSSBhbmQgRFBfSU5URi4NCj4gPiAtICBJdCBjb250YWlucyBvbmUgbGluZSBidWZm
ZXIgdG8gc3RvcmUgdGhlIHN1ZmZpY2llbnQgcGl4ZWwgZGF0YS4NCj4gPiAtICBSRE1BIGRldmlj
ZSBub2RlIG11c3QgYmUgc2libGluZ3MgdG8gdGhlIGNlbnRyYWwgTU1TWVNfQ09ORklHDQo+IG5v
ZGUuDQo+ID4gLSAgRm9yIGEgZGVzY3JpcHRpb24gb2YgdGhlIE1NU1lTX0NPTkZJRyBiaW5kaW5n
LCBzZWUNCj4gPg0KPiAtICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbWwNCj4gZm9yIGRldGFpbHMuDQo+ID4gLQ0KPiA+IC1w
cm9wZXJ0aWVzOg0KPiA+IC0gIGNvbXBhdGlibGU6DQo+ID4gLSAgICBjb25zdDogbWVkaWF0ZWss
bXQ4MTk1LXZkbzEtcmRtYQ0KPiA+IC0NCj4gPiAtICByZWc6DQo+ID4gLSAgICBtYXhJdGVtczog
MQ0KPiA+IC0NCj4gPiAtICBpbnRlcnJ1cHRzOg0KPiA+IC0gICAgbWF4SXRlbXM6IDENCj4gPiAt
DQo+ID4gLSAgcG93ZXItZG9tYWluczoNCj4gPiAtICAgIG1heEl0ZW1zOiAxDQo+ID4gLQ0KPiA+
IC0gIGNsb2NrczoNCj4gPiAtICAgIGl0ZW1zOg0KPiA+IC0gICAgICAtIGRlc2NyaXB0aW9uOiBS
RE1BIENsb2NrDQo+IA0KPiBUaGlzIGlzIGRpZmZlcmVudCBhbmQgeW91IGRpZCBub3QgZXhwbGFp
biBpdCBpbiBjb21taXQgbXNnLg0KPiANCj4gQW5vdGhlciBkaWZmZXJlbmNlIC0gbWJveGVzLiBM
b29rcyBsaWtlIHlvdSBkaWQgbm90IHRlc3QgeW91ciBEVFMuLi4NCj4gDQo+IEJlc3QgcmVnYXJk
cywNCj4gS3J6eXN6dG9mDQo+IA0KSGkgS3J6eXN6dG9mLA0KDQpTb3JyeSBmb3IgdGhlIGluY29u
dmVuaWVuY2UuDQpUaGUgcHJvcGVydHkgeW91IG1lbnRpb25lZCB3YXMgcmVtb3ZlZCBvbiBbMy8z
XS4gVGhpcyBpbmNvcnJlY3QNCmNvbmZpZ3VyYXRpb24gd2VudCB1bm5vdGljZWQgYmVjYXVzZSBJ
IHBhc3NlZCB0aGUgdGVzdCB3aXRoIHRoZSBlbnRpcmUNCnNlcmllcy4NCkl0IHdpbGwgYmUgcmVj
aWZpZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KU2luY2VyZWx5LA0KTW91ZHkNCg==
