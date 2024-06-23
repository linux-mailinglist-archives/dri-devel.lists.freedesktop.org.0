Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D18D9138AA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56C310E17F;
	Sun, 23 Jun 2024 07:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2127.outbound.protection.partner.outlook.cn
 [139.219.146.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2101110E169
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP+ah/HjGveN+KaoO5fvFHXSpOUapQJBwha9U1XR3c/Ji5mHBWzQVmPleaTa9DNIsDtr5pSyqyhpjjdBdcl9zLHQLpuombXVkTHtZVR4mC7n/aLJ7G5dLoQO7CEoGMebbJCA4ZXKZbd08yBxwgcim9mw1XI+QNvtvCsKohAInzkwBm+pTVyU6TnhUR/EvxxlczXExFA1LIC0vAkkxqN/ADxn5P8UXupEnQdRza/eBStcVK9tqNQV2cY99uSMlM8VFll7ht8ExuDfmH93t1KtF6FeOfw9crWNSABLJvpB6jBIpd7ijkhy3i2yrjltRF7UB6mvQabMera3EmWV+JoDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUqMJbqqdLlYTTyuxey0mXyHj28ziWkDNUt05K9ernY=;
 b=XKp4sPMN7o8SJyO0e9oP3rUerBVTH+gHQjeDeu0MGlUTQgId8WduDxok4A69XHO3Od+GtMUywg3fJTSnpH14l2jNF9+U4ak7BWjD4freF60+ZYnWgXOnemylZbNg/JjfPGhNCsRg1oJ6obtyKaP2goPedxrrAs5eBbTVd2v9btl7eNeWe65nFmwgsFuXfi9v8DUr4kfLUcz2VZqE1PDQ79Dk7+mHyOlJkt17aSe6GNcTARkGlRSH0XitIc3sDcp9Z60aWSnWTIfMMAzWHEghm8SCuPBy6K5NazF9zzw2anYyIa/cHt9hsf2tGpqe2PlcgJe9Lu91Cv1kHOCtIzUXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:1::6) by NTZPR01MB1097.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.33; Sun, 23 Jun
 2024 07:17:01 +0000
Received: from NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
 ([fe80::6f7e:8193:c2f7:74be]) by
 NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn ([fe80::6f7e:8193:c2f7:74be%7])
 with mapi id 15.20.7677.036; Sun, 23 Jun 2024 07:17:01 +0000
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "hjc@rock-chips.com" <hjc@rock-chips.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "andy.yan@rock-chips.com"
 <andy.yan@rock-chips.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 05/10] drm/vs: add vs mode config init
Thread-Topic: [PATCH v4 05/10] drm/vs: add vs mode config init
Thread-Index: AQHaqyrDzR+sSVAYiUm2Nb2HYht3L7GiK1iAgDK6fRA=
Date: Sun, 23 Jun 2024 07:17:01 +0000
Message-ID: <NTZPR01MB1050281A0007497AF8606662EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-6-keith.zhao@starfivetech.com>
 <ttjuehs6ui4dsnexhhodfd22okujx55mof5svxuk47gizhkv52@kdbdvwsamz6i>
In-Reply-To: <ttjuehs6ui4dsnexhhodfd22okujx55mof5svxuk47gizhkv52@kdbdvwsamz6i>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB1050:EE_|NTZPR01MB1097:EE_
x-ms-office365-filtering-correlation-id: bf861c1e-a9bc-492c-3738-08dc935479f9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|366013|7416011|1800799021|38070700015; 
x-microsoft-antispam-message-info: S2uuG+c3zjOOdmYXUIucu5uvRwYd5aqx2Vm7+AY0+YsbeqfHWqP/cm72PjsTPW7IJvpqhj2p1AuEwA2E/CikkIbcNTKHxvUrPVPxdXBxkO+fyYV5pKLUZ45Bf8JEjqiRjXQHgLBwb+KBKfJWTutiijKKDG/2H1WNaMRuI0j07wu/omaFuYepDF9NkeXrAfnQ5k/4AAaicudQsNAB/tkO0Sz5JD/NUQogCHJO6AWBTj2sv86gdNiFIH7BNsmUtTN2Ff/PkFOUb97Ytv1fBrXS6BeMNFP778Rsn5y7izlbNjc50dbC0Fg69MR9KPb0IZxeHEpuuH/YGNnNTgMG2xyFrOJ8hzJ9nC6fzS9QYhf4Hxrm/fn8uQwaZptO6NzmEj5xDKLjG3M7RM5n2HR2BkOIzagA9ZosX/ClGHYJkDnkMU6THn0x9nOH6JKHKniOEwwG7UznPCApHqrH7qWH7tKZnAiFO8+KS0X8myhHJW5oQGqf/dz4sj254XrKBtu6LOzLiDm6v8i1vKKAAbUHazkLKGifYO4txVTxPnwyiOuk6ROa0BmkwUCLFaM78s7UE4rOJWLUej+lX1PLn76064eafvU5UtCEXxej3VZJDUFwk28st+hEwCND3ALx5+vQzNwD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230037)(41320700010)(366013)(7416011)(1800799021)(38070700015); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RDA3WVZYdWROY1RZcmtCR00rL1FvZU5scWFlRkZIRnNRYUlBenkraFZBVkN6?=
 =?gb2312?B?UllNQjhDNERGUHhBYmFqRmJpOEJSMC8xU1pubDJTdUpjL1VPZXBNZzVFNHl1?=
 =?gb2312?B?UnVzR05IQzI4amRjZTRTa2ZseDROaS9yS2ExNmJDTlNVeDFqOEZubkNJd3Vi?=
 =?gb2312?B?dWVreEhzOFJwcnZ2YTAybWU4a3pyNndpckQ0am5aL0VJZmlJMStsNG9LOXpV?=
 =?gb2312?B?dlFCdk0rT3dCQkN1WHhLS1NMSG5HMlhhbHAzRG1vVE1FbXArcTV0YlViR0ts?=
 =?gb2312?B?Nmx4VEdrdVhRY3BldmVEVHlWVGNVWjZObG41b2NCYzh1MlFHQmtxOXBaWEgz?=
 =?gb2312?B?VkRVUFF1eXpLK2czRTJQeVp1c2dRd2NVeU8yazB6WHU3WjRJd3gvZFVDNlY2?=
 =?gb2312?B?b2Y1NUx0MGFZakZwNndMQ0ZZQzZRRUo2ZWpMYVFiQlRkWXpoYWpGVlBhVnFN?=
 =?gb2312?B?dGNHM1J0aHBiOUNpNXRWOVpSUS9DNXZQeDc1dHZ3bWlZWUpaaEN0YUN4ZU4r?=
 =?gb2312?B?cUlsVHBVK3BHMDIwZFlpUEFYNU9wRndDT1psK3Y4ZHBuM2d0bVhtYUgxYkw2?=
 =?gb2312?B?am9qbGpGNHpIbkpjd0d1OHozc3UyT21SLy8xK01ydytSd2M0SklEb1J1cDhI?=
 =?gb2312?B?b1c4T3h2cEVsYXY4ZGp0eWwrYnd5MGlWVFBuSGJzUUYvcUNTUTB4UFBmeGp1?=
 =?gb2312?B?WHJXbnR2WndjS1pYcHN0b1dLZG9HaUZmSG5wWDhMTDF1UGJ1NTcxN2lnNkpI?=
 =?gb2312?B?amozc0lmUXRiYWdLcGl2blEvZTVvUUxiMGdMNnNuZlpZUGtoUVNCS0xLYmFG?=
 =?gb2312?B?b3RWSnFPYW5YQUpBTTQ2VGNGQ05IOXB6VUd5ZHcwbHlxMW14QUY4SHdzMkZu?=
 =?gb2312?B?R2pXYys5TkRxMm1zT0VhdHVhNDdkejBOQldHblpXRFlJbGhvakNBS3JLVkhD?=
 =?gb2312?B?ZU0vTGVJRkFyTVo2Tk1yamtlbk1OeWlMNS9SR1ZtUXFyM1dobkJYN1Jsd0JY?=
 =?gb2312?B?YXowTExuMG5ZSUxLSGJUb056T2VtSlhWbms1ZEhHV3czY1ErQ0MyclRZQ0Y0?=
 =?gb2312?B?RnErc0tVNjVvb2YxSHMzQ2dyWC9oSmN6aWI2NkFnRUloTk5NMXFVWTdkakUv?=
 =?gb2312?B?OHRwZm5HV3UyWHFFMXFaeXdCMnUwQTQvd2VUN2Z6Zm1MbmZvektEMXFNYUM1?=
 =?gb2312?B?WXQzN3Z6VmhwbXNCajVkUnNWb3RiVzdmdWx0YjFVVXY2SWhNcGZQRDE1NlZt?=
 =?gb2312?B?bE95NjdIUjBNNHEwVDIrbU5aaUh5TC94K1ZsVUdxVWQ0dmFZdTRXUFkwVUcy?=
 =?gb2312?B?dUxiNC9DM2RKS2hRaDdWUU5uKzh3SnIrNVFTNTJJRkZWQitYUDlPR2d6UG0y?=
 =?gb2312?B?b3BienpzNmFCMzlkWUxMbHRIbDZPSXlIMCtNT0lLVy9XY0RsRGlvYWZWSDgr?=
 =?gb2312?B?Sy9ZWVFFdVhrVHl6UStYYjdVSEs5NGI4eEVtNzhWZDl6dkNHZVYraUtoLzhC?=
 =?gb2312?B?VGV3cnpoczNoMU41R1Zmd29LRTBnR1ZZR2JUQnUvbm9Dbk1zMUtpNXR2QXhF?=
 =?gb2312?B?MTRYZE9keTB0ZEdlOXBhUDh1ck5yMDlUWVcrRUlhdFB5RlFsTkhkcUhWelVv?=
 =?gb2312?B?YlYxNWF1WnJhRjRFMEUxSU1nc1VWcVpraHhpYjZ1UTRJZU1DcFF2UndBM0J6?=
 =?gb2312?B?VVo2SFlpMXhPRGU2UFM4bU9ndTdMZjNFdklZQ21XbVpjQ3g3bWk2TkJYempt?=
 =?gb2312?B?QUFJZkp3OHJXV0VqOXFqUW44TngyalJPNmNqVXRXQndmdWZvR1VZV1h6WDJv?=
 =?gb2312?B?SUh2S2JManB6enZhSVZ0T2VTMmRKV0JSRUR5Sk55RFhDdXB3MVdKMmx5aWJx?=
 =?gb2312?B?bVBYWWQyTmFPMmUyUktzVjhGZGNkdHY2bk1KYU9kNFZqT2JHRU1hSHhGOGNJ?=
 =?gb2312?B?Rjl6cW9TZm9JemtXYWlZSnBtNktTeW1tR2FOVGRPTExYNW1lRDQ0blhWMTh2?=
 =?gb2312?B?dWJWNVFDVTUxOG45QndGUVZpclJ1RHpMTi82OEZoZGN2ZkludStiQWQ0UDll?=
 =?gb2312?B?cVhtbGp2Yll1bE1USkROdDhSdTZDRUVDTll6MkFCZUdVR1V4d1BwNjVZK3RG?=
 =?gb2312?B?SnJRSG5VU1FIOXRtaExVbnhSU3lzOTg1ZDN0L21QdWVwQ0pTMFNUd3BpeUFL?=
 =?gb2312?B?ekE9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: bf861c1e-a9bc-492c-3738-08dc935479f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2024 07:17:01.2259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bY2E76kC0V0f076SraidejfZOwsCWqxDmjgmx7jOxxW1VA+FzsYJXmTFrNTUqJlbVH1rwjLCsqqDyXXrn1FKOJXT81uGs8w6AcRZM27T+yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1097
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

SGkgRG1pdHJ5Og0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gU2VudDogMjAyNMTq
NdTCMjLI1SA0OjUzDQo+IFRvOiBLZWl0aCBaaGFvIDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5j
b20+DQo+IENjOiBhbmRyemVqLmhhamRhQGludGVsLmNvbTsgbmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZzsgcmZvc3NAa2VybmVsLm9yZzsNCj4gTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tOyBqb25hc0Brd2lib28uc2U7DQo+IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgbWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOw0KPiBtcmlwYXJkQGtlcm5lbC5vcmc7IHR6aW1t
ZXJtYW5uQHN1c2UuZGU7IGFpcmxpZWRAZ21haWwuY29tOw0KPiBkYW5pZWxAZmZ3bGwuY2g7IHJv
YmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0K
PiBoamNAcm9jay1jaGlwcy5jb207IGhlaWtvQHNudGVjaC5kZTsgYW5keS55YW5Acm9jay1jaGlw
cy5jb207IFhpbmd5dSBXdQ0KPiA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+OyBwLnphYmVs
QHBlbmd1dHJvbml4LmRlOyBKYWNrIFpodQ0KPiA8amFjay56aHVAc3RhcmZpdmV0ZWNoLmNvbT47
IFNoZW5neWFuZyBDaGVuDQo+IDxzaGVuZ3lhbmcuY2hlbkBzdGFyZml2ZXRlY2guY29tPjsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA1LzEwXSBkcm0vdnM6
IGFkZCB2cyBtb2RlIGNvbmZpZyBpbml0DQo+IA0KPiBPbiBUdWUsIE1heSAyMSwgMjAyNCBhdCAw
Njo1ODoxMlBNICswODAwLCBrZWl0aCB3cm90ZToNCj4gPiBhZGQgdnMgbW9kZSBjb25maWcgYmFz
ZSBhcGkNCj4gDQo+IENvbW1pdCBtZXNzYWdlPyBQbGVhc2UgZGVzY3JpYmUgZS5nLiB3aHkgYXJl
IHlvdSB1c2luZw0KPiBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0oKSBpbnN0ZWFk
IG9mDQo+IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKCkuDQo+IA0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieToga2VpdGggPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4gDQo+IE5h
bWUNClRoaXMgY2FuIGJlIG1vZGlmaWVkLg0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3ZlcmlzaWxpY29uL01ha2VmaWxlICAgICB8ICAzICstDQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS92ZXJpc2lsaWNvbi92c19tb2Rlc2V0LmMgfCAzNg0KPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKyAgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX21vZGVzZXQuaCB8DQo+ID4gMTAg
KysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNv
bi92c19tb2Rlc2V0LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS92
ZXJpc2lsaWNvbi92c19tb2Rlc2V0LmgNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmVyaXNpbGljb24vTWFrZWZpbGUNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2ls
aWNvbi9NYWtlZmlsZQ0KPiA+IGluZGV4IDdkYTU0YjI1OTk0MC4uNTM2MDkxZjM3Mzc4IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQ0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9NYWtlZmlsZQ0KPiA+IEBAIC0xLDUgKzEs
NiBAQA0KPiA+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4NCj4gPiAt
dnNfZHJtLW9ianMgOj0gdnNfZGNfaHcubw0KPiA+ICt2c19kcm0tb2JqcyA6PSB2c19kY19ody5v
IFwNCj4gPiArCQl2c19tb2Rlc2V0Lm8NCj4gPg0KPiA+ICBvYmotJChDT05GSUdfRFJNX1ZFUklT
SUxJQ09OX0RDODIwMCkgKz0gdnNfZHJtLm8gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUv
ZHJtL3ZlcmlzaWxpY29uL3ZzX21vZGVzZXQuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3Zlcmlz
aWxpY29uL3ZzX21vZGVzZXQuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5jNzFmZTBkMzI1MDQNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX21vZGVzZXQuYw0KPiA+IEBAIC0wLDAgKzEs
MzYgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoN
Cj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFZlcmlTaWxpY29uIEhvbGRpbmdzIENvLiwgTHRk
Lg0KPiA+ICsgKi8NCj4gPiArI2luY2x1ZGUgPGRybS9kcm1fZGFtYWdlX2hlbHBlci5oPg0KPiAN
Cj4gSSBkb24ndCBzZWUgYW55dGhpbmcgY29uY2VybmluZyBkYW1hZ2UgaGVscGVycyBiZWluZyB1
c2VkIGhlcmUuDQo+IA0KWWVzICwgaXQgc2hvdWxkIHVzZSBkcm1fYXRvbWljX2hlbHBlci5oIGlu
c3RlYWQgb2YgZHJtX2RhbWFnZV9oZWxwZXIuaA0KDQo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2Zi
X2hlbHBlci5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVy
Lmg+DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAidnNfbW9kZXNldC5oIg0KPiA+ICsNCj4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgdnNfbW9kZV9jb25maWdfZnVu
Y3MgPSB7DQo+ID4gKwkuZmJfY3JlYXRlCQkJID0gZHJtX2dlbV9mYl9jcmVhdGUsDQo+ID4gKwku
YXRvbWljX2NoZWNrCQkgPSBkcm1fYXRvbWljX2hlbHBlcl9jaGVjaywNCj4gPiArCS5hdG9taWNf
Y29tbWl0CQkgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICtzdGF0aWMgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfZnVuY3MgdnNfbW9kZV9jb25m
aWdfaGVscGVycyA9IHsNCj4gPiArCS5hdG9taWNfY29tbWl0X3RhaWwgPSBkcm1fYXRvbWljX2hl
bHBlcl9jb21taXRfdGFpbF9ycG0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICt2b2lkIHZzX21vZGVf
Y29uZmlnX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikgew0KPiA+ICsJaW50IHJldDsNCj4g
PiArDQo+ID4gKwlyZXQgPSBkcm1tX21vZGVfY29uZmlnX2luaXQoZGV2KTsNCj4gPiArCWlmIChy
ZXQpDQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsNCj4gPiArCWRldi0+bW9kZV9jb25maWcubWluX3dp
ZHRoICA9IDA7DQo+ID4gKwlkZXYtPm1vZGVfY29uZmlnLm1pbl9oZWlnaHQgPSAwOw0KPiA+ICsJ
ZGV2LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggID0gNDA5NjsNCj4gPiArCWRldi0+bW9kZV9jb25m
aWcubWF4X2hlaWdodCA9IDQwOTY7DQo+ID4gKw0KPiA+ICsJZGV2LT5tb2RlX2NvbmZpZy5mdW5j
cyA9ICZ2c19tb2RlX2NvbmZpZ19mdW5jczsNCj4gPiArCWRldi0+bW9kZV9jb25maWcuaGVscGVy
X3ByaXZhdGUgPSAmdnNfbW9kZV9jb25maWdfaGVscGVyczsgfQ0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfbW9kZXNldC5oDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vdmVyaXNpbGljb24vdnNfbW9kZXNldC5oDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJkMDRmODFkMmFkMg0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfbW9kZXNldC5oDQo+ID4g
QEAgLTAsMCArMSwxMCBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCAqLw0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjAgVmVyaVNpbGljb24gSG9s
ZGluZ3MgQ28uLCBMdGQuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2lmbmRlZiBfX1ZTX01PREVT
RVRfSF9fDQo+ID4gKyNkZWZpbmUgX19WU19NT0RFU0VUX0hfXw0KPiA+ICsNCj4gPiArdm9pZCB2
c19tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOyAjZW5kaWYgLyoNCj4g
PiArX19WU19GQl9IX18gKi8NCj4gPiAtLQ0KPiA+IDIuMjcuMA0KPiA+DQo+IA0KPiAtLQ0KPiBX
aXRoIGJlc3Qgd2lzaGVzDQo+IERtaXRyeQ0K
