Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9075A437
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 04:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07C010E4BC;
	Thu, 20 Jul 2023 02:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0A010E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 02:03:07 +0000 (UTC)
X-UUID: 8ee9036826a111ee9cb5633481061a41-20230720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=g7QtyeitpBJA2Uhu3NDrSJRhuxq3WbiQ2cjk5LSzTKQ=; 
 b=FQJvzsfDx9XrjMTIlJkSFsLFylJYbeNLHLGA7e9NouW6aBMgJJuWRMpHlLozS8eWoGYHy2rvdDjL3jJ/h9PnHnkGT7jf8YS/0L1z2r1xa+A50VDkJi1t/18OLAJdzEeX865CSxbzxiZiubGHN+KBOsHU6HpT+n+sga+QJHzKZeM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:0cc66022-3c84-46bb-80e2-9d9688daa01c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:176cd25, CLOUDID:fefacbdc-dc79-4898-9235-1134b97257a8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8ee9036826a111ee9cb5633481061a41-20230720
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1214499958; Thu, 20 Jul 2023 10:03:02 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 20 Jul 2023 10:03:01 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.1118.26 via Frontend Transport; Thu, 20 Jul 2023 10:03:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iV60dn02I6z6DY2nj1ruc7dOqS7lYvIVPxLfAKm3Ccf2piBfby8PanwMkl7NDJsj53CZkN1bkT1Nx+O782Kw0pdS5Hke9WhGw2Cr+FPWY3/eiX5B9ih4FM7zkLLBFP6ab+lw7voYkef5fPPVWJ3wsuJAK3DgZpIS79Di0qO8vQDAL/ItZ8haQ2w+nYGcKLSEH9T1SRqv2y838zCFMDNJApDGyxnPrRHsQDngOZvS/HiBBAH0/haboWhhJbx2tdcIyORSznkoOK0f2q5MNZPf/ZoKZi1cXh/GS32Vbg5oBuKIX7clUSBIlPe7S9zyC2yR4Gkda04MFCgAyTEG1yPzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdCZujr12m7d1xUguomD6VRq8bNA1a62gldgK1bg82c=;
 b=Y475W1hQBS9wwPdCnhRj+MSCA41Ke63OU1cyCgXmRWkayqhbot2n/9AlmWSxkl8eHCI/eVoA/9yyqQUYsa0bJz5LXLqfR2Q6dj3XuxDlFO5xqfMpS4S4e4of4ce7G2k4Lvpi+SXaG93Aks+34P30gcHKSuKxflZ4QKBDFcm9d7J0k/Sd9a9mtrd1GlySR8zFZPpE5g5D/wlCXnQNtXydcE77ektHNz8f+wDMiWFsqPeiPUpp+wDYa3bnfc316ZHypPiKu4PAkFZFg9ROZQx5WzdcZpLZN2RWEVH3I+cmE/0tmeasSzz3D7AA6KcMptTf9+BGQuq56g3/eqzA0x9TdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdCZujr12m7d1xUguomD6VRq8bNA1a62gldgK1bg82c=;
 b=EgcgF5ajIx8XreOPT2g+cLdGGuFhYpsQky+DW00INixbPZhvdJfl0Lh9RJD7aRRnKDTonM0pcE6lInCJ9LygCQanIkwg0X9aldEurAmcT8Wvou1W2ZYAcl/iQ2WOTs3y9uRkKo1z6o3b2Ih3tQrsKkVZ4yozdBkqyPeyo1UXr7I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7222.apcprd03.prod.outlook.com (2603:1096:820:d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 02:01:08 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 02:01:08 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v6 05/11] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Thread-Topic: [PATCH v6 05/11] drm/mediatek: dp: Move AUX_P0 setting to
 mtk_dp_initialize_aux_settings()
Thread-Index: AQHZuLk1rSe8BulPKU+754Aotujrfa/B6qWA
Date: Thu, 20 Jul 2023 02:01:08 +0000
Message-ID: <2859212f7ed4c3014bc5ebe2a2097755190979bc.camel@mediatek.com>
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230717141438.274419-6-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7222:EE_
x-ms-office365-filtering-correlation-id: 7756b54c-7b21-4b38-d28f-08db88c52f19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V6XNesrWvX5oXuI4tmozhEHHP6rzlMRf4Dr8UD4WPcI95+P8EqxOA8ySOJEnxBhdPWhwkEA5hQ6VS+IbZWJVBYMJii7XJpgF67cOTbJ5Im488Luv5eZXgIc3OYwpSmrb/ZvfTbyCCtbBPQvEjrYGJkqMt9atm/b6JTPLM/9Wd4nALvc+w6ZbzbqMTN5vBZUesjnMgQjTXKTsYBeqyMihd7ITXLUEo7HN91Su5sLhODvffNT0tWRvecnOk+mNaz9RtMHDlo+fNr7r2Y3nFU9xSMqjOI2G05/g47eHBhUwSBpk4TCiWfydvERVcKtS7t8HPml9vkmG1djF+OrK3JWBKH8dUUIPk+EH9hWW7yKXaWmvNN85lEX7ijMLiQLHkNz+p68vDhvOKsgD0HHwtW9faD7dkofQY4BujFEKA7fSFAi7+ThJ2pqNQrSXhS1B4S4qXVFb0hx9LSK7SkTa0FHYuRmEXlDF9EpIXw11QmvJeGNaVSRrCFH5UWTH29cfd6z0udvXotE9djlbv95bMKmmxrC/uq+IPcciARVGah01msmEw7DNwI4caeDjen7hGRKfEedESUXJkzZP50vEwdIGFPug1lcdkWa3LMvqQKaVPEEQ12ouf71db2bOGK+QVANAB1bGpjvvny5gl6l35Y97PAgbr6CAEdB/jG6YotWu/Hg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR03MB6624.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199021)(54906003)(71200400001)(478600001)(6486002)(110136005)(6506007)(186003)(26005)(6512007)(2906002)(5660300002)(76116006)(41300700001)(316002)(7416002)(66946007)(66476007)(8936002)(8676002)(66446008)(4326008)(64756008)(122000001)(38100700002)(66556008)(38070700005)(85182001)(36756003)(83380400001)(2616005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVhLNlZTT3doa0tQNmlucEc5Z3FZOVNFaitORFBESVlIcVU2elA0aEFTVFhq?=
 =?utf-8?B?WnlEU3Z1dHBReGpHK2FBSCs3YTAyTTVSZzEzc0tvejdybjJZTktEZjhxdnBO?=
 =?utf-8?B?QnVxakVkaXhnd21NMmpQK3JndWt5bzErNENwRmVHVnNieEl0NWRQcmxkeXhB?=
 =?utf-8?B?Wm5VVDRSVnYyUkJxbEVzcFowaWVkblNqZFpKT3dBb0xIeHVScjBPQ1AyRjRI?=
 =?utf-8?B?TlA3bjRla0FkdFNocGk2N3EzWkJDUWpOUEgvMzJtTDc5T1RaM0o5ekxocjVv?=
 =?utf-8?B?YzNXbU5HeUhFTURZVkVPOE5rZmRiZEF2M1kvbUVRclhObWVrYzVMWGFMZTZN?=
 =?utf-8?B?S3ZBNjM0dTRwY0IzbWZ6V2VhbEZYYjVucWlwazNjVDY3WTJ3WFR2aTRPM2tl?=
 =?utf-8?B?eGt4WUtBb1hNdW1VamV5WkVkWCtOUlN1dmlmcUs5V1NwNThCT21VbUd0Vm0w?=
 =?utf-8?B?dzBzdWxuZ2JBVmEyYmRJYXZSdnBGYUplMFYwUnNDUGdkaG1PK0F2T3Fhend5?=
 =?utf-8?B?VkQ0TzgyK0pMRW90a1J6bGJYc29PUEQzTld5TXZKeWRNeG4xL092Mlh3ZUJO?=
 =?utf-8?B?QVpDc1BHREk3SlhuWFlEcGFXaG1hL1lUR05nVVA3b2wzTXF1cU1tNVBmcm9F?=
 =?utf-8?B?RjhoNTlNRnpsZ3RnSDBJbGZLdDNrRm8zdXVBVE83R2laV29INDJUSUU5U3Zq?=
 =?utf-8?B?OUNBQ2NuQzhuaTRaSWlCZkdCTGpmdFNXemdJNGN5Mmdmc1FkYTZtMW9QQXht?=
 =?utf-8?B?TStkeVJHZHUyaVJxTmlqU2JFZGV2djdtZVA5cVgwU3dCbHUzVUVNc0VGOS8x?=
 =?utf-8?B?ZWF3TkN0cFZFQXNGWFFVcENPQzlpT0lYcnlZNUFsaUh6cXBUS2Q1dmQwSE1v?=
 =?utf-8?B?TDZDMEcvU1J0VjlxbVF0V1hYRHBMU3pqbmtGZUdFZFQ5QU41ZWRyNzhNNU45?=
 =?utf-8?B?YlMvcG0yVkJtaHBRTTYvR2RmdDZCbVpCVVBNbXBHUEUxVEw3MlBFT3lWemNI?=
 =?utf-8?B?UUtwQk51VjB4TzlKT2QzNkROcERlTzhyeU93WVVoOEU5L21VVi85ckRPcTRU?=
 =?utf-8?B?eFhNSVF1KzNLNUdZb0o0Vjg3RkE5a2Y0NG02d3NqMkN2NUxwc3VNOS9Xb2po?=
 =?utf-8?B?c21xQ3VDR3RLTzdYSzB0L2M2NG9Vc3pNd0xVRFg3N2tWV2N5OGg1VnM2ek9x?=
 =?utf-8?B?dEEza3FhZUpZUEtwNlNYYjF3K08yNVR0VjFyOWtmVklReno4QVBaWjNjOXFj?=
 =?utf-8?B?S01wa2w0dHpQSEp3bEVRN1cwaVRkT1E0RElKNE5kQTdDazR3dVAyU001Y0NB?=
 =?utf-8?B?TTQ2VmlIcUdudW8wcGUybWdCeWlnMVl0cjBvTEh4RlJlbVlkeVBrRmtxZ29l?=
 =?utf-8?B?YkFvS3J5K2VYc1l4cjRkakE1WSt6d2RWZG8zWkNUbml1OEloMUpabGl4R0JW?=
 =?utf-8?B?MExGZEx1Z09Nbk9hSFVMbVJuTzFmMnowY3NPOGthWDVWZDlWa1duU1IrdE5u?=
 =?utf-8?B?OGpXRDBzaThOd0hjOWxySDI5bGQ0dFZYT2hkVThYL2QrQVI4ZjU4NC9xUExH?=
 =?utf-8?B?L2tpQXAzVFlPSE9oTGZDZUVhelJEYkpLSE9QcnRwdFNISm1vaTdsTDQ2RkU1?=
 =?utf-8?B?MlRRdzdnQzRVQ3Y4OFB1VXZPTXJJSVRweGNPay9YY2dpS3lqR3g0L2ZITDJw?=
 =?utf-8?B?Q1BRUWdhMFVqQ29ZbnZ0WjlDNng0Y1dHeGVoY3BaSXcxRXdWc1pLcmJQUVY0?=
 =?utf-8?B?YnZJVUFaWFBZMEZJY1o2cVZYVGRuNG83QllBZlZmWTZKNDVhUlBLc24yKzR1?=
 =?utf-8?B?c1lsQ2loQ3k5NEdNajJLcWE2azhNZlBlWHEzajJZc0dlSlgzTzlmOUVOS2sy?=
 =?utf-8?B?MVA5RjVQRDdaQTNzdHU0VzBUZ2hnOEhYd3A0Y1h5ZEp1aFMyVGxtbjhEOTQ1?=
 =?utf-8?B?UUVoZHdqMTIxc1VONUZlWVc2QkZYb1FKMkwzM0RaYUhBQlJsVSt3bmMzWlpr?=
 =?utf-8?B?TnJXaUUvYm5RRjFRVFhKZmNuQ003TjN6aWJJSjNhSjk3N2hMV3dkUEE3akdr?=
 =?utf-8?B?akxleU15bDNkZERBY2RMUm9VVjVtRXdMWUNMR1VQTEl5K3FRRzdoNVJ2NUlG?=
 =?utf-8?Q?ivR7LI0e9uktXLD9FeGoOMwQx?=
Content-ID: <4CF7F6ACEF8C44448D2316D96E003D23@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7756b54c-7b21-4b38-d28f-08db88c52f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 02:01:08.3131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hPkvwvfIw0cgFSAH5BigL7phnbrqzN0Uymd4ou7oK/T438tbxX2tBQF6m1g5BWJq8PCbSTAKsXHMAVgGNmGBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7222
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_007_387542915.1379339927"
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
Cc: "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_007_387542915.1379339927
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCkhpLCYjMzI7QW5nZWxvOg0KDQpPbiYjMzI7TW9uLCYjMzI7MjAyMy0wNy0xNyYjMzI7
YXQmIzMyOzE2OjE0JiMzMjsrMDIwMCwmIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYjMzI7
UmVnbm8mIzMyO3dyb3RlOg0KJmd0OyYjMzI7JiMzMjsmIzMyOw0KJmd0OyYjMzI7RXh0ZXJuYWwm
IzMyO2VtYWlsJiMzMjs6JiMzMjtQbGVhc2UmIzMyO2RvJiMzMjtub3QmIzMyO2NsaWNrJiMzMjts
aW5rcyYjMzI7b3ImIzMyO29wZW4mIzMyO2F0dGFjaG1lbnRzJiMzMjt1bnRpbA0KJmd0OyYjMzI7
eW91JiMzMjtoYXZlJiMzMjt2ZXJpZmllZCYjMzI7dGhlJiMzMjtzZW5kZXImIzMyO29yJiMzMjt0
aGUmIzMyO2NvbnRlbnQuDQomZ3Q7JiMzMjsmIzMyO01vdmUmIzMyO3RoZSYjMzI7cmVnaXN0ZXIm
IzMyO3dyaXRlJiMzMjt0byYjMzI7TVRLX0RQX0FVWF9QMF8zNjkwJiMzMjt0byYjMzI7c2V0JiMz
Mjt0aGUmIzMyO0FVWCYjMzI7cmVwbHkNCiZndDsmIzMyO21vZGUNCiZndDsmIzMyO3RvJiMzMjtm
dW5jdGlvbiYjMzI7bXRrX2RwX2luaXRpYWxpemVfYXV4X3NldHRpbmdzKCksJiMzMjthcyYjMzI7
dGhpcyYjMzI7aXMmIzMyO2VmZmVjdGl2ZWx5DQomZ3Q7JiMzMjtwYXJ0JiMzMjtvZiYjMzI7dGhl
JiMzMjtEUFRYJiMzMjtBVVgmIzMyO3NldHVwJiMzMjtzZXF1ZW5jZS4NCg0KUmV2aWV3ZWQtYnk6
JiMzMjtDSyYjMzI7SHUmIzMyOyZsdDtjay5odUBtZWRpYXRlay5jb20mZ3Q7DQoNCiZndDsmIzMy
Ow0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0FuZ2Vsb0dpb2FjY2hpbm8mIzMyO0RlbCYj
MzI7UmVnbm8mIzMyOyZsdDsNCiZndDsmIzMyO2FuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbSZndDsNCiZndDsmIzMyO1Rlc3RlZC1ieTomIzMyO0NoZW4tWXUmIzMyO1RzYWkm
IzMyOyZsdDt3ZW5zdEBjaHJvbWl1bS5vcmcmZ3Q7DQomZ3Q7JiMzMjstLS0NCiZndDsmIzMyOyYj
MzI7ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jJiMzMjt8JiMzMjs5JiMzMjsrKysr
Ky0tLS0NCiZndDsmIzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzUmIzMyO2lu
c2VydGlvbnMoKyksJiMzMjs0JiMzMjtkZWxldGlvbnMoLSkNCiZndDsmIzMyOw0KJmd0OyYjMzI7
ZGlmZiYjMzI7LS1naXQmIzMyO2EvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQom
Z3Q7JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KJmd0OyYjMzI7aW5k
ZXgmIzMyO2ZjNmNhYmY1MzcwYi4uZThkM2JmMzEwNjA4JiMzMjsxMDA2NDQNCiZndDsmIzMyOy0t
LSYjMzI7YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyOysrKyYj
MzI7Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCiZndDsmIzMyO0BAJiMzMjst
MTAwOSw2JiMzMjsrMTAwOSwxMSYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7dm9pZA0KJmd0OyYjMzI7
bXRrX2RwX2luaXRpYWxpemVfYXV4X3NldHRpbmdzKHN0cnVjdCYjMzI7bXRrX2RwJiMzMjsqbXRr
X2RwKQ0KJmd0OyYjMzI7JiMzMjttdGtfZHBfdXBkYXRlX2JpdHMobXRrX2RwLCYjMzI7TVRLX0RQ
X0FVWF9QMF8zN0M4LA0KJmd0OyYjMzI7JiMzMjsmIzMyOyYjMzI7JiMzMjtNVEtfQVRPUF9FTl9B
VVhfVFhfUDAsDQomZ3Q7JiMzMjsmIzMyOyYjMzI7JiMzMjsmIzMyO01US19BVE9QX0VOX0FVWF9U
WF9QMCk7DQomZ3Q7JiMzMjsrDQomZ3Q7JiMzMjsrLyomIzMyO1NldCYjMzI7Y29tcGxldGUmIzMy
O3JlcGx5JiMzMjttb2RlJiMzMjtmb3ImIzMyO0FVWCYjMzI7Ki8NCiZndDsmIzMyOyttdGtfZHBf
dXBkYXRlX2JpdHMobXRrX2RwLCYjMzI7TVRLX0RQX0FVWF9QMF8zNjkwLA0KJmd0OyYjMzI7KyYj
MzI7JiMzMjsmIzMyO1JYX1JFUExZX0NPTVBMRVRFX01PREVfQVVYX1RYX1AwLA0KJmd0OyYjMzI7
KyYjMzI7JiMzMjsmIzMyO1JYX1JFUExZX0NPTVBMRVRFX01PREVfQVVYX1RYX1AwKTsNCiZndDsm
IzMyOyYjMzI7fQ0KJmd0OyYjMzI7JiMzMjsNCiZndDsmIzMyOyYjMzI7c3RhdGljJiMzMjt2b2lk
JiMzMjttdGtfZHBfaW5pdGlhbGl6ZV9kaWdpdGFsX3NldHRpbmdzKHN0cnVjdCYjMzI7bXRrX2Rw
DQomZ3Q7JiMzMjsqbXRrX2RwKQ0KJmd0OyYjMzI7QEAmIzMyOy0xODI2LDEwJiMzMjsrMTgzMSw2
JiMzMjtAQCYjMzI7c3RhdGljJiMzMjt2b2lkJiMzMjttdGtfZHBfaW5pdF9wb3J0KHN0cnVjdCYj
MzI7bXRrX2RwDQomZ3Q7JiMzMjsqbXRrX2RwKQ0KJmd0OyYjMzI7JiMzMjttdGtfZHBfaW5pdGlh
bGl6ZV9zZXR0aW5ncyhtdGtfZHApOw0KJmd0OyYjMzI7JiMzMjttdGtfZHBfaW5pdGlhbGl6ZV9h
dXhfc2V0dGluZ3MobXRrX2RwKTsNCiZndDsmIzMyOyYjMzI7bXRrX2RwX2luaXRpYWxpemVfZGln
aXRhbF9zZXR0aW5ncyhtdGtfZHApOw0KJmd0OyYjMzI7LQ0KJmd0OyYjMzI7LW10a19kcF91cGRh
dGVfYml0cyhtdGtfZHAsJiMzMjtNVEtfRFBfQVVYX1AwXzM2OTAsDQomZ3Q7JiMzMjstJiMzMjsm
IzMyOyYjMzI7UlhfUkVQTFlfQ09NUExFVEVfTU9ERV9BVVhfVFhfUDAsDQomZ3Q7JiMzMjstJiMz
MjsmIzMyOyYjMzI7UlhfUkVQTFlfQ09NUExFVEVfTU9ERV9BVVhfVFhfUDApOw0KJmd0OyYjMzI7
JiMzMjttdGtfZHBfaW5pdGlhbGl6ZV9ocGRfZGV0ZWN0X3NldHRpbmdzKG10a19kcCk7DQomZ3Q7
JiMzMjsmIzMyOw0KJmd0OyYjMzI7JiMzMjttdGtfZHBfZGlnaXRhbF9zd19yZXNldChtdGtfZHAp
Ow0KJmd0OyYjMzI7LS0mIzMyOw0KJmd0OyYjMzI7Mi40MC4xDQoNCjwvcHJlPjwhLS10eXBlOnRl
eHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkg
Tm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJl
IGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhl
bXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVk
IHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFu
eSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5n
IG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykg
YnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5
IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_007_387542915.1379339927
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEFuZ2VsbzoNCg0KT24gTW9uLCAyMDIzLTA3LTE3IGF0IDE2OjE0ICswMjAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxl
YXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBo
YXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBNb3ZlIHRoZSByZWdp
c3RlciB3cml0ZSB0byBNVEtfRFBfQVVYX1AwXzM2OTAgdG8gc2V0IHRoZSBBVVggcmVwbHkNCj4g
bW9kZQ0KPiB0byBmdW5jdGlvbiBtdGtfZHBfaW5pdGlhbGl6ZV9hdXhfc2V0dGluZ3MoKSwgYXMg
dGhpcyBpcyBlZmZlY3RpdmVseQ0KPiBwYXJ0IG9mIHRoZSBEUFRYIEFVWCBzZXR1cCBzZXF1ZW5j
ZS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwNCj4gYW5nZWxvZ2lvYWNj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBUZXN0ZWQtYnk6IENoZW4tWXUgVHNhaSA8
d2Vuc3RAY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHAuYyB8IDkgKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiBp
bmRleCBmYzZjYWJmNTM3MGIuLmU4ZDNiZjMxMDYwOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHAuYw0KPiBAQCAtMTAwOSw2ICsxMDA5LDExIEBAIHN0YXRpYyB2b2lkDQo+IG10a19k
cF9pbml0aWFsaXplX2F1eF9zZXR0aW5ncyhzdHJ1Y3QgbXRrX2RwICptdGtfZHApDQo+ICAJbXRr
X2RwX3VwZGF0ZV9iaXRzKG10a19kcCwgTVRLX0RQX0FVWF9QMF8zN0M4LA0KPiAgCQkJICAgTVRL
X0FUT1BfRU5fQVVYX1RYX1AwLA0KPiAgCQkJICAgTVRLX0FUT1BfRU5fQVVYX1RYX1AwKTsNCj4g
Kw0KPiArCS8qIFNldCBjb21wbGV0ZSByZXBseSBtb2RlIGZvciBBVVggKi8NCj4gKwltdGtfZHBf
dXBkYXRlX2JpdHMobXRrX2RwLCBNVEtfRFBfQVVYX1AwXzM2OTAsDQo+ICsJCQkgICBSWF9SRVBM
WV9DT01QTEVURV9NT0RFX0FVWF9UWF9QMCwNCj4gKwkJCSAgIFJYX1JFUExZX0NPTVBMRVRFX01P
REVfQVVYX1RYX1AwKTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgbXRrX2RwX2luaXRpYWxp
emVfZGlnaXRhbF9zZXR0aW5ncyhzdHJ1Y3QgbXRrX2RwDQo+ICptdGtfZHApDQo+IEBAIC0xODI2
LDEwICsxODMxLDYgQEAgc3RhdGljIHZvaWQgbXRrX2RwX2luaXRfcG9ydChzdHJ1Y3QgbXRrX2Rw
DQo+ICptdGtfZHApDQo+ICAJbXRrX2RwX2luaXRpYWxpemVfc2V0dGluZ3MobXRrX2RwKTsNCj4g
IAltdGtfZHBfaW5pdGlhbGl6ZV9hdXhfc2V0dGluZ3MobXRrX2RwKTsNCj4gIAltdGtfZHBfaW5p
dGlhbGl6ZV9kaWdpdGFsX3NldHRpbmdzKG10a19kcCk7DQo+IC0NCj4gLQltdGtfZHBfdXBkYXRl
X2JpdHMobXRrX2RwLCBNVEtfRFBfQVVYX1AwXzM2OTAsDQo+IC0JCQkgICBSWF9SRVBMWV9DT01Q
TEVURV9NT0RFX0FVWF9UWF9QMCwNCj4gLQkJCSAgIFJYX1JFUExZX0NPTVBMRVRFX01PREVfQVVY
X1RYX1AwKTsNCj4gIAltdGtfZHBfaW5pdGlhbGl6ZV9ocGRfZGV0ZWN0X3NldHRpbmdzKG10a19k
cCk7DQo+ICANCj4gIAltdGtfZHBfZGlnaXRhbF9zd19yZXNldChtdGtfZHApOw0KPiAtLSANCj4g
Mi40MC4xDQo=

--__=_Part_Boundary_007_387542915.1379339927--

