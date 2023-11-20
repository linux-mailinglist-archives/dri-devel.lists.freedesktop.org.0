Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724267F0BB8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 06:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63D310E0D2;
	Mon, 20 Nov 2023 05:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D4810E0D2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 05:54:50 +0000 (UTC)
X-UUID: 4db8bff4876911eea33bb35ae8d461a2-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=0RqYbIDJvnBmX6fpsKN+RtcMt6aAp2FFjcauYoAC/+w=; 
 b=PwqA5C3UtkWtFM9WKMJTqjrMZ1B+GaLlFIURkZPvC9y+55Ixbb35bJfd1dIVbzXDp/b2RAqgRLsaK3BTZJuOowFq+Ht3D3VZGCnhuhxp103unCpsFUaYWPzsEU+hQ/OW70TnZBRicAl0wdR9ilK2ew0HOSe3kHP0msgqbn4qFJw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:9775e47a-166e-421e-a034-90a9f7a626ef, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:364b77b, CLOUDID:99d9d772-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4db8bff4876911eea33bb35ae8d461a2-20231120
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 801306905; Mon, 20 Nov 2023 13:54:44 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 13:54:43 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 13:54:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWY0n6UR2pl7UvRIW62w4fuMnt9jH3BOD2SfxtN9w8rfnEyosD31Dieqht51i7QCCMTlljH5SWTobT3/EnqssVkA3oo/+l0+C2/gH9WdplCzgApWJlGbnQyQJvzAKjgsjBHPf1YE/U78FVzrZFHd+QyL48E3qOKrAanGIak6lJ6q+tuO4+4jfRW4gKQDuzeJiWrgzAjvwzkRWUyW1MWp8PMZR2jzHlGpZ+aeUCNieGdN4e7mqem9A3BnLsVcaCVxTLplRyRoDFcQrSRFNv4+xheQsGGTNoEjI9RU8nZKDvzO+T1DRnqyzhs46sADgsAKbyVFFvw/b7FCtaqGo+tGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0XYjLLRJ0HJn0Q+WV1XCG42T72NtrKv8OwWJrrKuAw=;
 b=ceRvU1CPd9f52eP8CByXH0Bt/uwM9NeOpFU1ws9oieCioB9OGi0OtBBlqToKKeNX+jnHLRSz7SfTStJQWj9KkYmYkKcBftJm5fISERDA2e9cEfOhgiT12FA79KZuArpzPHnqmEWxhlJwf3COQsxyt1ZSM1scF0tW95N+23ms+y1/om81wOMuU1R5NU0xEGTrI+HUVjAhA8ZW0/MZ1Hd5tnugOr1T2gTUchId0M8KcT4+1Xecxn1T4z3lsGgUCF7Oh6EJchiO6jRxEtiQZstqC9vjwoouNM78xfmWZG66dcKOrPZqf6TsXbUeUFZGCW2sAESrgCkxEh2Ubbi7eU9VQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0XYjLLRJ0HJn0Q+WV1XCG42T72NtrKv8OwWJrrKuAw=;
 b=rm6S9sdUnC9WRxc4Hogh8U4DyJ34udnM/aasjo7SA/ZsKvue5A6EoIib/okFnxdoloE4EcIfSB+vO2uga6uqJzS9FEL8fWhgkNh6O1pWN4vftMxK72HD8BNPM1XnkDQS46ZGLG8t4UhODj/CAx1edwNUCemL8G5X3FozdDIhT1E=
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com (2603:1096:400:1f5::13)
 by TYZPR03MB5247.apcprd03.prod.outlook.com (2603:1096:400:35::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 05:54:41 +0000
Received: from TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::7a6f:69a8:742c:af8f]) by TYZPR03MB6623.apcprd03.prod.outlook.com
 ([fe80::7a6f:69a8:742c:af8f%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 05:54:40 +0000
From: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix errors when reporting rotation
 capability
Thread-Topic: [PATCH v2 1/1] drm/mediatek: Fix errors when reporting rotation
 capability
Thread-Index: AQHaCxACOCOGLMbHOkeXdljk6ddPUbBs1XAAgBYAigA=
Date: Mon, 20 Nov 2023 05:54:40 +0000
Message-ID: <7d42e3c576181ce0d47cefeab845c3d80a3967b9.camel@mediatek.com>
References: <20231030090312.7758-1-shawn.sung@mediatek.com>
 <20231030090312.7758-2-shawn.sung@mediatek.com>
 <b84d3f321bd329dc862cb03cb35a922dbc4793a3.camel@mediatek.com>
In-Reply-To: <b84d3f321bd329dc862cb03cb35a922dbc4793a3.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6623:EE_|TYZPR03MB5247:EE_
x-ms-office365-filtering-correlation-id: 413727ba-abd1-4ea6-9cd0-08dbe98d300b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fQZU0RQkOBGWwXWBnedNSzon4Q/0Nrt2hQf7UDR0pG1/JVp7ues/OZmzktMW68sCujQR9oR37/LHyPP6Cb2b9QUPbXtPqFszvc5HaKOdK26bnyx9RnI4Z4+Ot8SLSZv1XVV2Ki/APGfA9cGybu9l+752mYmaQaBIyf3mfaiVGjhAoZWrhmYyAJTp+fmOiV0BQlnNlvWmSNmf5P7H2E5ZQOmPzlJdteLC5i1lD09UualZgccqG4T0n3OMeSs2829l0/oY2ZU5CtBpZIc89uC4usUBecyi/7d0w6bDcs9f7oBpX9ee79vPXICG5Yx+uxb8wSb0hbE0Td8OYXzG03HBsYTIXT/14SAHfnfSjOKqKkDJkSO4r7O3vEdFKEbKhWOExeOclmwrf5JQpSELL2QUBJducdqAlEQ0oVAm4wXTrGBOFINFAEgPJx5HxEMYk1Vwp88ullnxCqzSqGTgqpAp81I/jmCh0CkZ7l/6W35Q9rsTRCfmeyChQS1boIs9tNr+wWj82cLqiZjYrBTMeHqO2hj2Kf1FC0qR093qBuy+zDbNT7COgqwSBQc7IEf654H9kpsgzIYcIn/L3Q+OZX0/hYSE/o/65Y/8rmIgtSFuCRErt9VxkBQWQk0oEBXpkQXdWmcgCvEzlmbZNYz4m8I/BZY5hwYKpGq3Zg3Zvto8t68=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6623.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(36756003)(85182001)(5660300002)(86362001)(7416002)(4744005)(4001150100001)(2906002)(38070700009)(6512007)(122000001)(6506007)(26005)(2616005)(83380400001)(6486002)(478600001)(71200400001)(4326008)(8936002)(8676002)(38100700002)(76116006)(110136005)(66446008)(66476007)(66556008)(64756008)(316002)(54906003)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFU3dy9zengwdWxFUGxtRnVDTUlIRWp2dEw5WTVwYVJwOG1MOEdzdkVPdzF4?=
 =?utf-8?B?N1AzUmc1NDRGcW4vdlpjK05DMDc0d3U5VEhzYjFCTFhYSW1GUmxTNFJpOFZK?=
 =?utf-8?B?WlZzT0ZobCt0aWFyeHJLOE9TeFo1UjNkWE5IS2hhZlhvNkhFeDFuZGhGRUR6?=
 =?utf-8?B?bmxFWlVyMVdaY3B6Sk1VbzUyYTlSbm9Qa0F4M0M1UG1Ldkhub25vUEFJMmlI?=
 =?utf-8?B?b2l0YlBSTlcyd1YwNGp4V00wQW40WDRicjBNbkF0WlZLUUtyZ0xJMEZnbTFl?=
 =?utf-8?B?Ty9PQUNTSFE0ZFdUdFlHSFZGVW1Pck5mQ3NmdmxsQ0xPNVBvbVZqZzVtajFD?=
 =?utf-8?B?UXAwOGpWRG5sR09sbStWK053NnJqZlBUK3hiQUJFNmhqRi9FQ1NCWVZJbldm?=
 =?utf-8?B?dXFydGw4OThXU2N0Y0FDeDBxYUV0dTR4WTRabVU5djdXaU5NL0pEMDFVTDdW?=
 =?utf-8?B?UEZYV1RJZGhhcWR6dE9QdEV3MG5KQUdYczR5YkpWQmtwa0xHb2JSUUY0ZXJj?=
 =?utf-8?B?VkVkQXZUZ1ZMdGp4TDBmODJPb2FDNDA0Z0R2Tk1IcGpGMW94S2NReGo1c2pt?=
 =?utf-8?B?cUZmSXA5Q081TVFPTFhGYXd5ZGN2V1dGWG9CTXNmTm8yanhUb2ZuVnNOVHIy?=
 =?utf-8?B?UitBOEFRdklHY1hoUFZ2eXpwcDJzZnJXdGxtNDdoUk1OcGdWeFJySTNRcGpk?=
 =?utf-8?B?WEpQOXFoaTFMNTFuSS82bFBGQ2ZJamRDZm9YcjFYNDBrcXlPOFQ0NEtRc09N?=
 =?utf-8?B?NHNSUmxobUVqOEJsMUpTcnp3NWpYa05UaklnbC9lZ2duUDdGUnozbE9tb0VL?=
 =?utf-8?B?MnpRNU41QkRnYlRQVlU5UzAzS3ZkSVp4ZHYxYy9CUjJvZS82a0pZNjlpek1S?=
 =?utf-8?B?NnpDVHM0WngxOWpjWUo3dHZ1NWxhVENwOHI0TFMzUmN1UXJ4RnlOaTU0RndF?=
 =?utf-8?B?eGViWlhyYlE5RFg3cXhmdklZcWx5bUxid0t3S2d4WGxuczhtajltUy9pTGEx?=
 =?utf-8?B?MFpseStSUVUyYWxoYU13MXVoTEJxOGVvUW1tWVEveTI4UU9OTHRwQzNaeEJj?=
 =?utf-8?B?a0ttaUpjQjhKL3pMaGpDS0JWYWNNdXpiU3FWUWRqbU5ISDVkNitwTmh2dnVj?=
 =?utf-8?B?UGdhbmY5L2hVLzlnUG1kb2lSWHM4dUx3MEFFUUFINGVuc2owL0lOa2dBYnZI?=
 =?utf-8?B?R1VhRWNDeEtBaWJsWmRlbXlzQkFtYUpRS2FrdWNjMnBXZWdzWXA2eVR5OWJy?=
 =?utf-8?B?ZGhERXc4UklTY0hhRXI4Qmd6cGw0eFgwNWd3QkJPY0t5SjdJU2pabVVuc3pa?=
 =?utf-8?B?alVES25CSkROMVBtVVlyaUM5NGVXL2Jpd3V4emdxNVA0cDZNN0d4RkhUcUdr?=
 =?utf-8?B?R1BiNDFEb1FxWHZ6MFBnSExqRm9vNHI0SlBvNmxza2phQzU3VnpCZmFtMUJE?=
 =?utf-8?B?emNETm1NRGtZKzRHVm9xSDQ4Nngrb01GdWJVb3hLbHgxeEpudUd5ekFUMU5C?=
 =?utf-8?B?UEZCdGFTVGkyMEk5TUpibDJmVlRmVkttMkZpdDgwTjNoVTRrRFMzenIzM1Ez?=
 =?utf-8?B?Z1NSN1BuYXEzZzVFQWZPRnhYdnJxR1pUMUNrZ3U3Z1RvSUl2MkIwYWZzQnM5?=
 =?utf-8?B?dVdOZC9XRlk4N1g2c3pMTkt3NFVMNC9XYUNDWHBQT00zMXNFT1VjOXRSc0My?=
 =?utf-8?B?azV4Sjg5OVhobWFLQkl0NXc0UEI0dTFiWlgzeFdtOCtxUHZvdW9ZQ2t3dklw?=
 =?utf-8?B?a3RFV1YrcDhYM2s4blV6WFQ2L1BGa1gwZVp4c3A1SDlpMDN2UHgwNm9sR1A4?=
 =?utf-8?B?RUZHOXZsSXZYNlhUaUhacndJL2NldGtpMG5CVFloNXBMYkZUWDZ2ZVE0cnNp?=
 =?utf-8?B?RmFsTmd0TVpDb3JtWkEwbUpack92WmFRb3pXZ21QYURpS2dVQ3EyQU5TTE5x?=
 =?utf-8?B?YXhlSUJaY09qVXo1TkJuaWZrdXQrRkU0L1p6UkpKbS9NSGI0MGFZOGRxamV5?=
 =?utf-8?B?ZG1YTkVqQWJMYTl0OGhta3VwaHYrWU9zWm5SY0ZTcmRxaURBU3F5WFdTSVFD?=
 =?utf-8?B?TTFUa09GQXBlK0E5cEdsaDRkM28zR1YwTFZqb0l6RnlQdW9CTEFNV0xtMmtX?=
 =?utf-8?B?Z1FhSmFQcGdINVdkTGZxeEJNUkdYdDNqTktxVEJJNFJJclVFY1R0c1ZGWUYw?=
 =?utf-8?B?SlE9PQ==?=
Content-ID: <57F21C10E6AD4E47B6237B6EEE7D5F32@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6623.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413727ba-abd1-4ea6-9cd0-08dbe98d300b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 05:54:40.8742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hLpKd4kzIF2G1IEMOc6g3wSHrE37WflKw3STXUohxZIZyaHNSFOQLZpjSf26hBlYHZZRk2EZeacOihKKhEjPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5247
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_1659254530.956682859"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_008_1659254530.956682859
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpJiMzMjtDSywNCg0KWWVzLCYjMzI7YXRvbWljJiMzMjtjb21taXQmIzMyO2NhbiYj
MzI7c3RpbGwmIzMyO3dvcmsmIzMyO3dpdGhvdXQmIzMyO3JvdGF0aW9uJiMzMjtwcm9wZXJ0eSYj
MzI7aW4mIzMyO3BsYW5lcywNCml0JiMzMjtvbmx5JiMzMjthZmZlY3RzJiMzMjtJR1QmIzM5O3Mm
IzMyO2JlaGF2aW9yJiMzMjsod2lsbCYjMzI7ZmFpbCkuJiMzMjtTaW5jZSYjMzI7Y3VycmVudGx5
JiMzMjt3ZSYjMzI7ZGlkbiYjMzk7dA0KcmVjZWl2ZSYjMzI7SUdUJiMzMjtyZXF1ZXN0cyYjMzI7
b24mIzMyO3BsYXRmb3JtcyYjMzI7b3RoZXImIzMyO3RoYW4mIzMyO01UODE4OCwmIzMyO3dpbGwm
IzMyO3JldHVybiYjMzI7MA0KZGlyZWN0bHkmIzMyO2lmJiMzMjt0aGUmIzMyO3Byb3BlcnR5JiMz
MjtpcyYjMzI7bm90JiMzMjtkZWZpbmVkLiYjMzI7VGhhbmtzLg0KDQpSZWdhcmRzLA0KU2hhd24N
Cg0KT24mIzMyO01vbiwmIzMyOzIwMjMtMTEtMDYmIzMyO2F0JiMzMjswNTo1NSYjMzI7KzAwMDAs
JiMzMjtDSyYjMzI7SHUmIzMyOygmIzMyOTkzOyYjMjA0MjY7JiMyMDgwOTspJiMzMjt3cm90ZToN
CiZndDsmIzMyO0hpLCYjMzI7SHNpYW8tY2hpZW46DQomZ3Q7JiMzMjsNCiZndDsmIzMyO09uJiMz
MjtNb24sJiMzMjsyMDIzLTEwLTMwJiMzMjthdCYjMzI7MTc6MDMmIzMyOyswODAwLCYjMzI7SHNp
YW8mIzMyO0NoaWVuJiMzMjtTdW5nJiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyO0ZvciYj
MzI7Q1JUQ3MmIzMyO3RoYXQmIzMyO2RvZXNuJiMzOTt0JiMzMjtzdXBwb3J0JiMzMjtyb3RhdGlv
biYjMzI7c2hvdWxkJiMzMjtzdGlsbCYjMzI7cmV0dXJuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtEUk1f
TU9ERV9ST1RBVEVfMC4mIzMyO1JldHVybnMmIzMyO2hhcmR3YXJlJiMzMjtjYXBhYmlsaXRpZXMm
IzMyO2FjY29yZGluZ2x5Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtUaGUmIzMyO29yaWdpbmFsJiMz
Mjtjb2RlJiMzMjt3b3VsZCYjMzI7bm90JiMzMjtjYWxsJiMzMjtkcm1fcGxhbmVfY3JlYXRlX3Jv
dGF0aW9uX3Byb3BlcnR5KCkNCiZndDsmIzMyO3RvJiMzMjtjcmVhdGUmIzMyO3JvdGF0aW9uJiMz
Mjtwcm9wZXJ0eSYjMzI7aWYmIzMyO0NSVEMmIzMyO2RvZXMmIzMyO25vdCYjMzI7c3VwcG9ydCYj
MzI7cm90YXRpb24uJiMzMjtJDQomZ3Q7JiMzMjt0aGluaw0KJmd0OyYjMzI7dGhpcyYjMzI7YmVo
YXZpb3ImIzMyO2lzJiMzMjtPSyYjMzI7YmVjYXVzZSYjMzI7bm90JiMzMjthbGwmIzMyO2RybSYj
MzI7ZHJpdmVyJiMzMjtjYWxsDQomZ3Q7JiMzMjtkcm1fcGxhbmVfY3JlYXRlX3JvdGF0aW9uX3By
b3BlcnR5KCkmIzMyO2FuZCYjMzI7aXQmIzMyO3dvcmtzLiYjMzI7U28mIzMyO292bCYjMzI7YWRh
cHRvciYjMzI7aXMNCiZndDsmIzMyO25vdCYjMzI7bmVjZXNzYXJ5JiMzMjt0byYjMzI7aW1wbGVt
ZW50JiMzMjtzdXBwb3J0ZWRfcm90YXRpb25zKCkmIzMyO2NhbGxiYWNrJiMzMjtmdW5jdGlvbi4N
CiZndDsmIzMyO0lmDQomZ3Q7JiMzMjtzb21lJiMzMjtPVkwmIzMyO2RvZXMmIzMyO25vdCYjMzI7
c3VwcG9ydCYjMzI7cm90YXRpb24sJiMzMjt5b3UmIzMyO2NvdWxkJiMzMjtyZXR1cm4mIzMyOzAm
IzMyO2RpcmVjdGx5Lg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRzLA0KJmd0OyYjMzI7Q0sN
CiZndDsmIzMyOw0KDQoNCjwvcHJlPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioq
KioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioq
KioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGlu
Y2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRh
cnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRl
ciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0
byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0K
ZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1h
aWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQo
cykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBh
cmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSAN
CnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCks
IGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFu
eSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhl
IGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K
PC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_008_1659254530.956682859
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQ0ssDQoNClllcywgYXRvbWljIGNvbW1pdCBjYW4gc3RpbGwgd29yayB3aXRob3V0IHJvdGF0
aW9uIHByb3BlcnR5IGluIHBsYW5lcywNCml0IG9ubHkgYWZmZWN0cyBJR1QncyBiZWhhdmlvciAo
d2lsbCBmYWlsKS4gU2luY2UgY3VycmVudGx5IHdlIGRpZG4ndA0KcmVjZWl2ZSBJR1QgcmVxdWVz
dHMgb24gcGxhdGZvcm1zIG90aGVyIHRoYW4gTVQ4MTg4LCB3aWxsIHJldHVybiAwDQpkaXJlY3Rs
eSBpZiB0aGUgcHJvcGVydHkgaXMgbm90IGRlZmluZWQuIFRoYW5rcy4NCg0KUmVnYXJkcywNClNo
YXduDQoNCk9uIE1vbiwgMjAyMy0xMS0wNiBhdCAwNTo1NSArMDAwMCwgQ0sgSHUgKOiDoeS/iuWF
iSkgd3JvdGU6DQo+IEhpLCBIc2lhby1jaGllbjoNCj4gDQo+IE9uIE1vbiwgMjAyMy0xMC0zMCBh
dCAxNzowMyArMDgwMCwgSHNpYW8gQ2hpZW4gU3VuZyB3cm90ZToNCj4gPiBGb3IgQ1JUQ3MgdGhh
dCBkb2Vzbid0IHN1cHBvcnQgcm90YXRpb24gc2hvdWxkIHN0aWxsIHJldHVybg0KPiA+IERSTV9N
T0RFX1JPVEFURV8wLiBSZXR1cm5zIGhhcmR3YXJlIGNhcGFiaWxpdGllcyBhY2NvcmRpbmdseS4N
Cj4gDQo+IFRoZSBvcmlnaW5hbCBjb2RlIHdvdWxkIG5vdCBjYWxsIGRybV9wbGFuZV9jcmVhdGVf
cm90YXRpb25fcHJvcGVydHkoKQ0KPiB0byBjcmVhdGUgcm90YXRpb24gcHJvcGVydHkgaWYgQ1JU
QyBkb2VzIG5vdCBzdXBwb3J0IHJvdGF0aW9uLiBJDQo+IHRoaW5rDQo+IHRoaXMgYmVoYXZpb3Ig
aXMgT0sgYmVjYXVzZSBub3QgYWxsIGRybSBkcml2ZXIgY2FsbA0KPiBkcm1fcGxhbmVfY3JlYXRl
X3JvdGF0aW9uX3Byb3BlcnR5KCkgYW5kIGl0IHdvcmtzLiBTbyBvdmwgYWRhcHRvciBpcw0KPiBu
b3QgbmVjZXNzYXJ5IHRvIGltcGxlbWVudCBzdXBwb3J0ZWRfcm90YXRpb25zKCkgY2FsbGJhY2sg
ZnVuY3Rpb24uDQo+IElmDQo+IHNvbWUgT1ZMIGRvZXMgbm90IHN1cHBvcnQgcm90YXRpb24sIHlv
dSBjb3VsZCByZXR1cm4gMCBkaXJlY3RseS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0KDQo=

--__=_Part_Boundary_008_1659254530.956682859--

