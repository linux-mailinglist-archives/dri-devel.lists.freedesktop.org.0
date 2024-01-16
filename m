Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB8882EC5E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C7510E461;
	Tue, 16 Jan 2024 09:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2058.outbound.protection.partner.outlook.cn [139.219.146.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0E310E461
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BarTuDebGbb9vVp2lLQdXCHTKFPu5rRcny0ZAr/eBbn3//nuXV4X4snR/QcU6sPaxsu5Ru43tmpYmVqCxPVAVijhQ6KQ5xiXUiMqJAc13tmGanZ9YexpDpTLcyZwuHbffHFRlGL8s0qWAum6/qQdervNxBtK0afSvrijuBzLqmBZPabWZPS8k4CmQi3plcMRIIT97BdJ5E8CYmRKwz7SEtry5kgK8ob8JhmUHF3iLPCzwU0JV/5mpIPKdYBv49CbwTnizB9tDHs0SpkbMxExulHHsnRx6IRJddJskie/qOOrKbB6bwsTEMIgWgabcD0BOqE1hW57QxakB+VHVsd42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIUyNREHAqs5RFBV8mOZ/gLpW7UFcHJC67kV3o6iTBQ=;
 b=V1hZ+75rEs5pp/8utN4BWRjtPx6lAK68dSNWyvW2S789G32yC1OaOxsdVPEpxcMrOwOKP8qzHQbEFkMokNJq2OIWETuMllsiTcclPEWIjeQ1DEhn/mVzUysSUxpZkKSgx5dh6rSyaJSyUNzpN1dNJsvc3QUrkXlp2Q2pXIUUTgQx0dSPRGvYoAnMGtgM6mw4bZYmPIxa7H4PoTSby04rQapzej+ehz7IyK/yTGpFWvZWuLFefpM2TOE44xmL91daGKn/3QQ7W4FjrhyRtojA94Ejy1elQqUDldT7S5GBUbNcY+fqM79PuFw0aBcQjydNJS/NFpUnpWZFYNNGsU+8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB0984.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Tue, 16 Jan
 2024 09:58:34 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 09:58:34 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] gpu: drm: panel: panel-simple: add new display
 mode for waveshare 7inch touchscreen panel
Thread-Topic: [PATCH v2 2/2] gpu: drm: panel: panel-simple: add new display
 mode for waveshare 7inch touchscreen panel
Thread-Index: AQHaQsrbhSl8C5gy0kqZu6fYUPhn4LDRzRCAgApwsyA=
Date: Tue, 16 Jan 2024 09:58:34 +0000
Message-ID: <ZQ0PR01MB1062FAA37C08F215A3745072EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <20240109070949.23957-3-shengyang.chen@starfivetech.com>
 <9a2b1929-bd01-4d40-89ca-6785d1b9367a@quicinc.com>
In-Reply-To: <9a2b1929-bd01-4d40-89ca-6785d1b9367a@quicinc.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB0984:EE_
x-ms-office365-filtering-correlation-id: 58b6b3f2-a4e7-4f9e-3b11-08dc1679b3ea
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RFt329j7anfyJRDjy8ST7Zo6aKIetWhnSS+u+Tu2y8htEnN5BlABBu9bDdFo4kCvaNu29oWZKoHo50mCYwQKrOLkzuKGNEpHIJ59vTvBP7y8T/8giED4nBvaYQCuiv5eMxGuDrmtuqOU6nQswEeDEkim0ReyuMG4v6dP06ryzr5zd1MNUabc6jXyKmfn3Mot81/Zk45PO8o7v4NyTBCTTcTfT3ZkXDx+ERLN53fkm2sZ6GVL1RxfQcX9kYvVGJtu3V54ED5NHoR8aGPrqbaNKoCNaFkB7szjtXb+pzG+AYe0o8Lol0YtaSv+WbkNxcM8Z+9CLG9WUSzOYrgFDvzhaa3KMr7bV1NWqyU89CGcXRYt4o7vr7jtx+1fXCLlLZHc1fXm2Z7bqlC+pqlvLizUTcK9UutDGzQdcbOIw45pGqhZwubXR1y7MoxRfkq2j0A/6L7wHmQq4lEt8zKymQNI8lPOabTzBP5dQSjISff8dqXm+ftyfzGJDBcmVHWYAIFN8ZFtNQ/WWwpydhWBM97dx/f8Oaz89AZEM1A7sfuHfk79Zb/iD4PYI7mR10PDjTrC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39830400003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(83380400001)(41320700001)(64756008)(40180700001)(7696005)(2906002)(26005)(54906003)(4326008)(53546011)(9686003)(44832011)(66476007)(5660300002)(508600001)(8936002)(71200400001)(8676002)(66446008)(110136005)(38100700002)(7416002)(66556008)(40160700002)(38070700009)(41300700001)(76116006)(33656002)(66946007)(86362001)(122000001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUpSRUphc3RTQVd0UEVrNGJ3bXphLzNuQ0d0S0haeDk5NWVwTnN2QS8xYmNY?=
 =?utf-8?B?ZlNOREZnMU1HdXNCMUhndjlTTDlYMGZ2S1I4SkUxN28yVUpnQm5CeFVJN2tq?=
 =?utf-8?B?Y2xXeTE3SGsyeWlMRjB5Y0ZjdDYxOEFvOGdQa3lqMlJlUGYrWlcvR3k2OHh3?=
 =?utf-8?B?b0gzNDJRUElEenMwQVZuN3hOZHVZcjRhcFlaejAvc3hxVEYycDlJMWVUY24w?=
 =?utf-8?B?aXQ1YkNEckYzdnpUUGRXc2hpcmhJUGxNL0hvRUR1VUJ4M1hnNHUxM2JjTmd1?=
 =?utf-8?B?bFR0TEhISS9YK01EamgzeFRlb011MTZlMWlURkVtRFJ2dDNnQjN2OHNVYkZo?=
 =?utf-8?B?TFdRN3NqMnlMM2kzdmxJcWY5dFR3aHhRQkhPVjhLcEJBckNqeGFFUkg3ZUpa?=
 =?utf-8?B?TCtaaVdSenJiM2dBc3RqQm1lcTJlaXYwS3lyWEZCNy9aMUUyUnVJWWRveld1?=
 =?utf-8?B?OGJwdDNaclBzZlBuR1pWZUFSdEdJaUxxLzVCczI5cjBRUHNFbFFjaDFLMjF6?=
 =?utf-8?B?UkljdGhkc1Bwa3RpakRNVGsrVFB0bGc0MlA4Tk4xb2p3bTBqU2NmTFdpbGl3?=
 =?utf-8?B?Myt2Z2hIdERLbnhKdnRKdzRQRFIxTTM1QzR3bHJ2UWVLenk0VEJRL3hUN3gz?=
 =?utf-8?B?dHJxSy82R2JnSVRBQlZEWTRYQXpQY1hPYmxYODJmb1pOaW02V2NMbGtlZ2xG?=
 =?utf-8?B?ZEhpaG9sT3pSUmNJem8vLzlOdjdNZkEzMVJvY09WMGZ1QXpGVnNLSHBIS2I0?=
 =?utf-8?B?VjBpdWswOEJULytNUjBSaHBsRllHa21UN1FTbXBRaWdueXJ4ZXNNa285WW9P?=
 =?utf-8?B?R09Ia0JNQnorS1o5UnpreVpSN0JFVzFwS052WFM5cFE4N2FYSGlPdGdaOXI2?=
 =?utf-8?B?TjZCK1RqbHBialh4ZzJZVkV1bXg3Y1JzRDNOK3NHMEFrMTVkYkNoTWtrTVJF?=
 =?utf-8?B?MGpwZzJSZGZwU1ZnUlJoSGY5WVRVV1M3aWVwb1pBQjZaaEQ0QVYydTgwNmFo?=
 =?utf-8?B?NlpncURhRm10aGNGcmxYWmpMbksvRkROZytqQzBaRjZtbU11b0xpZFQ4bE1q?=
 =?utf-8?B?OGhVOVkvNjQrR3d6Q3YzM1NZdzNyMnc5MkphYWF6M2JQWlowK1NVejBpN0Js?=
 =?utf-8?B?eVVvYms3SElIVFhZRXVVMng3NkpTT3B1ZVVSVnJwZFFaK2kvajZObkxQMHdK?=
 =?utf-8?B?TWVEWGo2TWF6ZU9RdVJIUFNiczNMN2haQklDMmwvK0h1UXAzT0xjeWFPdFVj?=
 =?utf-8?B?ZEpkL0FoNmh0bGE5d2RwOWJNWjVqZUlFM1MzNTJKYjZQSUozVC9YSlFQekVk?=
 =?utf-8?B?Skh0aWtvb1BRdDN0MitEMlNuSk5odk5GaUdIUUpISUROT21XQjd6VUNJTitj?=
 =?utf-8?B?bGlFdldQaXduYlgxNlU4MVhrTUVCM05paGFPeGxsVHJ4YXB4Q0oyN3JMNXpN?=
 =?utf-8?B?K3ZOTXdVRFZReXY4TnhmSm1zUCtzbGRGZGtsVGdGSEZnYUhPMkN5OS82RGk5?=
 =?utf-8?B?T1N5U0dWOEJ5OXl1SnJzUE1JSlJlZE1aU2xmZDB3QzExZnh1UGVJa0JVZi9E?=
 =?utf-8?B?SE4vdllCSkpVajhvcWhLT1JONzY5N3dwMDZxWEx1S0lnTEVYVzB3aXNZZnRw?=
 =?utf-8?B?WTlGb09RTHdSUEF3am4yNXpwOG1vM3FOWElubTJyUVFqcS9KMTAzL29EMnpr?=
 =?utf-8?B?YXdFSkpZc0RsNWY2TmZGTEJUdkF4U2tkMHNGYkhXaXI5LzBxY202YTNKZ1Zp?=
 =?utf-8?B?ejN4OGNKSDcxV25JQkZneVFNYVgxM0k3bVNsKzI1ZkJGWFNnNnluU3dlZjcr?=
 =?utf-8?B?MnJXSmc0eFJ4TjBOQ0hnSmh4K29PdEtWU2hheXRyNDQ3VW5NUWhJZHNkVUlL?=
 =?utf-8?B?Ty83WHd2cm5zZkJySU1mU1hYbVdQVUllK0N6ZXRTekhGMXNaTWw4ZjhoVXNT?=
 =?utf-8?B?M1hxcjlwNTRrRkk4ODl6ajZwTjlHK3JDS0FSSldFUWlXL0xHbElQTjd0bm5Y?=
 =?utf-8?B?UTF6RVpjUHp1R2tRUG8vbnBEV09FelZOTXdKN3JSMFFZY1BkMGRDcHdCZENn?=
 =?utf-8?B?eWtLRUZwQ3pyTjAzZHEwWTRneEg0N0tZemx0RWFsRFdsVWlnSnU4bWlxT0Zj?=
 =?utf-8?B?QTF0Sko4UVk5VHZWYlgrajNzZXlrZGU3bE5wck9YeVl0SmUrMFByNFY2bTNW?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b6b3f2-a4e7-4f9e-3b11-08dc1679b3ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:58:34.4763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtzCzOZwZRSseLtCb7gSGTTYLtiLmgIhiWzNE4FxeOgRG3UotW7fF4x2uX4RiYesj7TobgGbDKOHCSmgGuJCw6W6mFaH46Y1UMZT5ey65I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0984
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEplc3NpY2ENCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQgYW5kIHJldmlldw0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEplc3NpY2EgWmhhbmcgPHF1aWNfamVz
c3poYW5AcXVpY2luYy5jb20+DQo+IFNlbnQ6IDIwMjTlubQx5pyIMTDml6UgMjoyNg0KPiBUbzog
U2hlbmd5YW5nIENoZW4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+Ow0KPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgc2FtQHJhdm5ib3JnLm9yZzsgYWlybGll
ZEBnbWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgbWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tOyBtcmlwYXJkQGtlcm5lbC5vcmc7DQo+IHR6aW1tZXJtYW5uQHN1c2UuZGU7IHJv
YmgrZHRAa2VybmVsLm9yZzsNCj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBj
b25vcitkdEBrZXJuZWwub3JnOyB3YWhyZW5zdEBnbXgubmV0Ow0KPiBkYXZlLnN0ZXZlbnNvbkBy
YXNwYmVycnlwaS5jb207IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsgQ2hhbmdodWFuZw0KPiBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPjsgS2VpdGggWmhhbw0KPiA8
a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsgSmFjayBaaHUgPGphY2suemh1QHN0YXJmaXZl
dGVjaC5jb20+Ow0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMi8yXSBncHU6IGRybTogcGFuZWw6IHBhbmVsLXNpbXBsZTogYWRkIG5ldyBk
aXNwbGF5DQo+IG1vZGUgZm9yIHdhdmVzaGFyZSA3aW5jaCB0b3VjaHNjcmVlbiBwYW5lbA0KPiAN
Cj4gDQo+IA0KPiBPbiAxLzgvMjAyNCAxMTowOSBQTSwgU2hlbmd5YW5nIENoZW4gd3JvdGU6DQo+
ID4gVGhlIHdhdmVzaGFyZSA3IiA4MDB4NDgwIHBhbmVsIGlzIGEgY2xvbmUgb2YgUmFzcGJlcnJ5
IFBpIDciIDgwMHg0ODANCj4gPiBwYW5lbCBJdCBhbHNvIHVzZXMgYSBUb3NoaWJhIFRDMzU4NzYy
IERTSSB0byBEUEkgYnJpZGdlIGNoaXAgYnV0IGl0DQo+ID4gbmVlZHMgZGlmZmVyZW50IHRpbWlu
ZyBmcm9tIFJhc3BiZXJyeSBQaSBwYW5lbC4gQWRkIG5ldyB0aW1pbmcgZm9yIGl0Lg0KPiANCj4g
SGkgU2hlbmd5YW5nLA0KPiANCj4gVGhlIHBhdGNoIGl0c2VsZiBMR1RNLCBidXQgaW4gY2FzZSB5
b3UgaGF2ZSB0byBwdXQgb3V0IGEgbmV3IHJldmlzaW9uLCBjYW4geW91DQo+IHBsZWFzZSB1c2Ug
dGhlICJkcm0vcGFuZWw6IDxkcml2ZXIgbmFtZT46IiBwcmVmaXggZm9ybWF0IHRoYXQgb3RoZXIg
ZHJtL3BhbmVsDQo+IGNvbW1pdHMgdXNlPw0KPiANCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rp
b24uIFRoZSBwcmVmaXggZm9ybWF0IHdpbGwgYmUgdXNlZCBpZiB3ZSBoYXZlIG5leHQgdmVyc2lv
bi4NCmJ0dywgcmVmZXJyaW5nIHRvIHRoZSBzdWdnZXN0aW9ucywgd2UgYXJlIGdvaW5nIHRvIHRy
eSBvdGhlciB0aW1pbmcgZnJvbSBwYW5lbC1zaW1wbGUNCmluIG91ciBwbGF0Zm9ybS4gTWF5YmUg
d2UgYXJlIG5vdCBuZWNlc3NhcnkgdG8gc3VibWl0IG5ldyB2ZXJzaW9uLg0KVGhhbmtzIGEgbG90
DQoNCj4gUmV2aWV3ZWQtYnk6IEplc3NpY2EgWmhhbmcgPHF1aWNfamVzc3poYW5AcXVpY2luYy5j
b20+DQo+IA0KPiBUaGFua3MsDQo+IA0KPiBKZXNzaWNhIFpoYW5nDQo+IA0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogS2VpdGggWmhhbyA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFNoZW5neWFuZyBDaGVuIDxzaGVuZ3lhbmcuY2hlbkBzdGFyZml2ZXRl
Y2guY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBs
ZS5jIHwgMjgNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYw0KPiA+IGluZGV4IDkzNjdhNDU3MmRjZi4uZTA4OTY4NzNlYTMzIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYw0KPiA+IEBAIC00MTEwLDYg
KzQxMTAsMzEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHZsMDUwXzgwNDhudF9j
MDENCj4gPSB7DQo+ID4gICAJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwNCj4g
RFJNX0JVU19GTEFHX1BJWERBVEFfU0FNUExFX05FR0VER0UsDQo+ID4gICB9Ow0KPiA+DQo+ID4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSB3YXZlc2hhcmVfN2luY2hfbW9k
ZSA9IHsNCj4gPiArCS5jbG9jayA9IDI5NzAwMDAwIC8gMTAwMCwNCj4gPiArCS5oZGlzcGxheSA9
IDgwMCwNCj4gPiArCS5oc3luY19zdGFydCA9IDgwMCArIDkwLA0KPiA+ICsJLmhzeW5jX2VuZCA9
IDgwMCArIDkwICsgNSwNCj4gPiArCS5odG90YWwgPSA4MDAgKyA5MCArIDUgKyA1LA0KPiA+ICsJ
LnZkaXNwbGF5ID0gNDgwLA0KPiA+ICsJLnZzeW5jX3N0YXJ0ID0gNDgwICsgNjAsDQo+ID4gKwku
dnN5bmNfZW5kID0gNDgwICsgNjAgKyA1LA0KPiA+ICsJLnZ0b3RhbCA9IDQ4MCArIDYwICsgNSAr
IDUsDQo+ID4gKwkuZmxhZ3MgPSBEUk1fTU9ERV9GTEFHX05WU1lOQyB8IERSTV9NT0RFX0ZMQUdf
TkhTWU5DLCB9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHdh
dmVzaGFyZV83aW5jaCA9IHsNCj4gPiArCS5tb2RlcyA9ICZ3YXZlc2hhcmVfN2luY2hfbW9kZSwN
Cj4gPiArCS5udW1fbW9kZXMgPSAxLA0KPiA+ICsJLmJwYyA9IDgsDQo+ID4gKwkuc2l6ZSA9IHsN
Cj4gPiArCQkud2lkdGggPSAxNTQsDQo+ID4gKwkJLmhlaWdodCA9IDg2LA0KPiA+ICsJfSwNCj4g
PiArCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNCwNCj4gPiArCS5jb25u
ZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EU0ksIH07DQo+ID4gKw0KPiA+ICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHdpbnN0YXJfd2YzNWx0aWFjZF9tb2Rl
ID0gew0KPiA+ICAgCS5jbG9jayA9IDY0MTAsDQo+ID4gICAJLmhkaXNwbGF5ID0gMzIwLA0KPiA+
IEBAIC00NTkyLDYgKzQ2MTcsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0K
PiBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gew0KPiA+ICAgCX0sIHsNCj4gPiAgIAkJLmNvbXBhdGli
bGUgPSAidnh0LHZsMDUwLTgwNDhudC1jMDEiLA0KPiA+ICAgCQkuZGF0YSA9ICZ2bDA1MF84MDQ4
bnRfYzAxLA0KPiA+ICsJfSwgew0KPiA+ICsJCS5jb21wYXRpYmxlID0gIndhdmVzaGFyZSw3aW5j
aC10b3VjaHNjcmVlbiIsDQo+ID4gKwkJLmRhdGEgPSAmd2F2ZXNoYXJlXzdpbmNoLA0KPiA+ICAg
CX0sIHsNCj4gPiAgIAkJLmNvbXBhdGlibGUgPSAid2luc3Rhcix3ZjM1bHRpYWNkIiwNCj4gPiAg
IAkJLmRhdGEgPSAmd2luc3Rhcl93ZjM1bHRpYWNkLA0KPiA+IC0tDQo+ID4gMi4xNy4xDQo+ID4N
Cg0KdGhhbmtzDQoNCkJlc3QgUmVnYXJkcywNClNoZW5neWFuZw0K
