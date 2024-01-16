Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C280B82EC41
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CB010E1F2;
	Tue, 16 Jan 2024 09:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2084.outbound.protection.partner.outlook.cn [139.219.146.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF72410E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:55:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY6RD9aOqk/YwANLlfVndBKAax9Sl/VYenflit5zDkZmQTFuSkS1EJNVRoxPIO2OQfiI793mDNmvvPq9gpyIFyR0jJEg6U7W5zauBBk+eQn97I7z2UBdnY5QVJzZ0CXBtZHZH3/F+nZkcT2o+sKIA25FQWlYkn3V8iXF9PRL8UllknUMoS+luyMwNtV+xvAqm173ZBWwz3z4OWW2Xm9vHU2y0/YzCn/TGPP08Q4Y/O/QOGz9lGUuQPhG2eGCbbWrNh6qmDiMec/qTM9TxZLRR4lg52a5/eUhkCh2uisBKPkyXhjFTLQcZW3pG43WZquumLkLfPlsoy5KiutD6K8n9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUc5ti/djX+QeYo/GvzhAKgiE3z6K9ylwQCJSaQRPmU=;
 b=XwzSJEGytjFeZRSxxCj33xgaSSCRsYg+IzTQ17vL2fZ2vgsQFq0a5P9VnEx7QDE5NTOEZ7PxB4rOazFxZDQ20vvbPY5qrkYNd+O+pNa5xHcIzdOea/k2adaf/8OmvfSZ2pasmK2L3f+pZGueIIp4i7E1WSsctftyouyTVKpmu7auMkufnHPHZa8otaJx+uWD7i1uniawlgar8LgupkTJEplwBsMWKTa3B3QBddwSY8c2QbgaWYttZ6d3ptyBoy+U72p89Q7EkC3dl0rir6RuduUDbnlFCOkttiaot7B5051H3Wunv4UDGRod16fJ54MxAsA+fZOTHlgGwMSbLhuUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB0998.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 09:54:58 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 09:54:58 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: RE: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Topic: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Index: AQHaQsrahW9RVOc2vE6qAfS6BeiBCbDRVbeAgABnSgCACn3kMA==
Date: Tue, 16 Jan 2024 09:54:58 +0000
Message-ID: <ZQ0PR01MB1062C80C521A41CC9C7A3298EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
 <CAPY8ntBcXEyg5tXHGwAdbVody7ihHo3gb1C4vE+6PY2biDhN4g@mail.gmail.com>
In-Reply-To: <CAPY8ntBcXEyg5tXHGwAdbVody7ihHo3gb1C4vE+6PY2biDhN4g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB0998:EE_
x-ms-office365-filtering-correlation-id: 45444650-8ab0-49f1-aee9-08dc16793319
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IyVdqaRm4y7rHm8kkLDOcTDyLyHvnYyAR4e+ZplGmjLVMV30GFe49Ne10FhERK25yHGD4E/tFtrYeHVBCShd7dFb9c78mFL5yxyYUBvIeZufCK9qP/4brwoH+KMYb8X+kwX8ywie9PTVhUG5RH4xxYpUMpPSfkM4FfKwNmcvA0IZhu8tZvAWqP/5UN4WT9ZIannqhbUsw1df83Ut9/dvyLUcA36n53MwKlIbOMUFI8HED0CGoeqduXHm30kldxy2jPHTFRfFO5ixEUn+Pxz17RmeEvO6Xw/p6dHXXnRCmWraYnafo1md4lzgu0rfHFHH5Bp+HeS47EuCbp2RrHpN84fBISsyfYV1WTwM/NYirgx0Zylzo1BcLrzm885JR+OIit9r3QI7ADc7UJGgRgdhqLDxJRn+yD1hF0A4yaj6J5wdL5z0CsSuLaaxScZvnmH7nT0UOt5MaxBh3VbQho/E565xvP7BWrASICxMHObaE8USj75VSRLaAAsB1hHc10ukdkHITOfiBoM5CDNlt8PbnuHzqxFOqajzxvfN2x/5ObbCKhoWevcn31z2gusUMPA+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39830400003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(26005)(9686003)(122000001)(40160700002)(7696005)(53546011)(38100700002)(83380400001)(55016003)(71200400001)(66476007)(66556008)(66946007)(76116006)(966005)(66446008)(508600001)(86362001)(54906003)(64756008)(8936002)(4326008)(8676002)(38070700009)(44832011)(40180700001)(41300700001)(33656002)(110136005)(41320700001)(5660300002)(7416002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1JuQ0FuN3gwOVFjb1dRMlNCd08vbks3dnJxSXUxWlNkK0MyOEkvRGVLRlUy?=
 =?utf-8?B?T1lBeVJHc1U4L3RwTkFhTFBJUnZZdnVQWWtxY0xLang2N3dycGRDaTBOdW02?=
 =?utf-8?B?UUh5VjA1cjllY0ROcTZyVzBHbXFtTFNrSmpXN2hoR1lvQlBCSEttSUd3VzJa?=
 =?utf-8?B?QUljNi9OT3BNbTFES2RLbVIwQ3g0YUlCaUJ2NE9UMkFxbXVRalQwRFlLTjZt?=
 =?utf-8?B?MkdzVEVCWDFFZzFuMjRlcTBZNE1jUitWaXQvd1FxS1RsN2dQcFpEWXlLcGxa?=
 =?utf-8?B?dVpYdFMyMzJDTkJiQlBXZWkydWl3bW9HWWR4L1BHQTE3QU9rTHVXSkFyRHVQ?=
 =?utf-8?B?cHlWclY5UXlCalVkdWdGTXd2UExMVnpUMWV0cldKVm80RmpwQzdYdHNYdWtv?=
 =?utf-8?B?blczMHdrVnBFUWdPTlVwVDFrc2FqYjVmcjlvWXdtVmYwamNDdDl4MllWd3pY?=
 =?utf-8?B?V0ZtY2JaTGtncjBmcHZkVWhCcEtmVklGeXgwZDBXdWxjR2tDSDRoM1p5bVlK?=
 =?utf-8?B?VmFQWWZnZGFOZytueE0rY0VGZ05wZmpSRWhjekhkUXlLanI0Tk9nZWFkckhY?=
 =?utf-8?B?YU4zcWxwQW9PRzBsWU83elM4cThOR3F5b0txbCtUdmNFc2d0VXpSSlk5QWVs?=
 =?utf-8?B?QUNoM2Z6WGk0NnRVcG55LytDL0RueU51dGx4TTRrV1R0aUJlUHR5bGUxTlJv?=
 =?utf-8?B?UXJmQkdjdDNiZndld3lwa3ozVDdibzVmazZQM2lNRERtN2dnTEF0bTJFM1E5?=
 =?utf-8?B?T3VXVmJ5QnNWdHFGdnIxbDFCY1ZqNjAycXI0YlhHaXVybkNvdy8wd3hHU1Rz?=
 =?utf-8?B?ZWFjQnpsSlNUYk9nSDQ4dUQ0UWdCOTZlbVpqZ2o0ZWdPK3RBYjBNaDFqSkU1?=
 =?utf-8?B?cXVUSy9UbE0zK3JOSGFIN1FZaGFHb3pDNnVZNmFYa01qK2RQcHNWNDRQM0FM?=
 =?utf-8?B?Q3FwSDV5bHgyRW5BTHpVL0N1TGM4bjhOeFoybEsrejJsWW9EdSsxU1NXVDlJ?=
 =?utf-8?B?YTNqYi9CQ0xTa2ZMdk5ldUpHSjMzR0hiSXdNMWVSNGtTK25aNzBObWhidStC?=
 =?utf-8?B?ZXlBM1F2UzF2TmxqbTZFUXJVcXI3R1B3cTUwaWVlaERhaWluMmZ3TUd6VDJF?=
 =?utf-8?B?RzdIYnlrcStaQndkT210ak1MRERSaHZsaWlLMTJNSmtpVnNpTDFVOWwvNWFv?=
 =?utf-8?B?RmFnNFNKTE4ySkV0Ly8yVFZzSTBrTXRnWEwxOVlzZEFhOEE4bkZpb291eE1z?=
 =?utf-8?B?T1djNzhXZUdxUUlGdWFPQnlXbUNncjFRNVllQ3oxazZWMXpDNXFSRmw1OWpw?=
 =?utf-8?B?QXRyQzZpbzN2cDlPRUFDU3o5KzBEb0dHWUIzcVJzWTJpZjVTc3FuUjNsYldW?=
 =?utf-8?B?UElnQ2RoTmd1K3A0clozajkvR2d5TDBkaThQNkNHU0w3aHkrYWNES2grZmxU?=
 =?utf-8?B?OFJ3dGdkLzE1aitsWkpCUW1ZZ2RsQ1RES1pWZWp0djVwRms3RVhWZ2VFTjYv?=
 =?utf-8?B?dURTSWdUTkZabmlrZy9wWm9kT1Y1SmZqbnB1S1cvU2JxSTQybFZOTCtwVjlT?=
 =?utf-8?B?a0pFeUZRbm8vSWNtemhoVlZKVkdLdC91OHBGek51MVl3Ty9TTVJsVTlTRHpt?=
 =?utf-8?B?Mlh1Um45OTUyMmRjWEVJSEFVb005ZHczcVZ5K1JvQ0FZdkhSeEJaYzd2VmE1?=
 =?utf-8?B?b2cyeWErbGNKYnFWRXpUdEZDM2IrL2ttcWxKYW9yc1hoOVZqUURaVmdyNlpr?=
 =?utf-8?B?Tlh3TXdBeENvOFcwWVh0ZDBwcVBjMzZ2RDVyN3lMV1F6eWZHaDBKMzFsWDcw?=
 =?utf-8?B?dzFlVGU5OCtlUXM1WWVVSkREU3BYSjh6Q1Q2aDBpUWQyeEx2bG5EMFhtQVli?=
 =?utf-8?B?MEE0VWV5RXlWWTdMUjQvcFYvQmdLdGlPM3d6aWppaWVJdXRYT1cxelpheWVn?=
 =?utf-8?B?T3psa0JrV2ZTdFNaNnFDV2ppYlJ4RW1OaTdPelpOS04yYys2TXNmZjlyS1la?=
 =?utf-8?B?NFIrUnhnYUhzYlIxWDNqWlR3bmkwaElRM1lWeEcwdUtBbzJKNnloL1NxVHUy?=
 =?utf-8?B?M1BmbEpLYk9UWDVsRUMzV2YxWXd3aW9aMnhiYXlKdElxd2lzdFk0OVExZ213?=
 =?utf-8?B?OTgvbGdUVkpoM0xVZlhYcUtheFdGMXFERFF2amdWcVhoajdBbkswTU9Db3c1?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 45444650-8ab0-49f1-aee9-08dc16793319
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:54:58.3720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emHPCY2s21crKd92cbnbO0MdUY/CG391oWX45HZYEralUvrlcOVDmeCCt4IuUECs8wgh12Kz3HDFu4BN5VPQfqNv0zc2EZbpcI4O/QQ/bvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0998
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
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhdmUNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJl
cnJ5cGkuY29tPg0KPiBTZW50OiAyMDI05bm0MeaciDEw5pelIDE6MjkNCj4gVG86IG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmcNCj4gQ2M6IFNoZW5neWFuZyBDaGVuIDxzaGVuZ3lhbmcuY2hlbkBz
dGFyZml2ZXRlY2guY29tPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IHF1aWNfamVzc3poYW5AcXVpY2luYy5jb207IHNh
bUByYXZuYm9yZy5vcmc7IGFpcmxpZWRAZ21haWwuY29tOw0KPiBkYW5pZWxAZmZ3bGwuY2g7IG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3JnOw0KPiB0
emltbWVybWFubkBzdXNlLmRlOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IGtyenlzenRvZi5rb3ps
b3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgd2FocmVuc3RAZ214Lm5l
dDsNCj4gdGhpZXJyeS5yZWRpbmdAZ21haWwuY29tOyBDaGFuZ2h1YW5nIExpYW5nDQo+IDxjaGFu
Z2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+OyBLZWl0aCBaaGFvDQo+IDxrZWl0aC56aGFv
QHN0YXJmaXZldGVjaC5jb20+OyBKYWNrIFpodSA8amFjay56aHVAc3RhcmZpdmV0ZWNoLmNvbT47
DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAwLzJdIEFkZCB3YXZlc2hhcmUgN2luY2ggdG91Y2hzY3JlZW4gcGFuZWwgc3VwcG9ydA0KPiAN
Cj4gSGkNCj4gDQo+IE9uIFR1ZSwgOSBKYW4gMjAyNCBhdCAxMToxOSwgPG5laWwuYXJtc3Ryb25n
QGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPiBPbiAwOS8wMS8yMDI0
IDA4OjA5LCBTaGVuZ3lhbmcgQ2hlbiB3cm90ZToNCj4gPiA+IFRoaXMgcGF0Y2hzZXQgYWRkcyB3
YXZlc2hhcmUgN2luY2ggdG91Y2hzY3JlZW4gcGFuZWwgc3VwcG9ydCBmb3IgdGhlDQo+ID4gPiBT
dGFyRml2ZSBKSDcxMTAgU29DLg0KPiA+DQo+ID4gQ291bGQgeW91IHByZWNpc2Ugd2hpY2ggU0tV
IHlvdSdyZSByZWZlcnJpbmcgdG8gPyBpcyBpdCAxOTg4NSA9Pg0KPiBodHRwczovL3d3dy53YXZl
c2hhcmUuY29tLzdpbmNoLWRzaS1sY2QuaHRtID8NCj4gPg0KPiA+IEFyZSB5b3Ugc3VyZSBpdCBy
ZXF1aXJlcyBkaWZmZXJlbnQgdGltaW5ncyBmcm9tIHRoZSBSUGkgb25lID8gSW4gdGhlDQo+ID4g
V2F2ZXNoYXJlIHdpa2kgaXQgZXhwbGljaXRseSB1c2VzIHRoZSBycGkgc2V0dXAgKHZjNC1rbXMt
ZHNpLTdpbmNoKSB0bw0KPiA+IGRyaXZlIGl0OiBodHRwczovL3d3dy53YXZlc2hhcmUuY29tL3dp
a2kvN2luY2hfRFNJX0xDRA0KPiANCj4gSSByYWlzZSB0aGUgc2FtZSBxdWVzdGlvbi4NCj4gDQo+
IEtlaXRoIFpoYW8gZWFybGllciBzdWJtaXR0ZWQgZWZmZWN0aXZlbHkgdGhlIHNhbWUgc2V0IG9m
IHBhdGNoZXMgWzFdIGFuZCB0aGUNCj4gcmVzcG9uc2UgZm9yIHRoZSB1cGRhdGVkIHRpbWluZyB3
YXM6DQo+IDxxdW90ZT4NCj4gTXkgcGxhdGZvcm0gZHBoeSB0eCBoYXJkd2FyZSBoYXMgY2VydGFp
biBsaW1pdGF0aW9ucy4NCj4gT25seSBzdXBwb3J0cyBpbnRlZ2VyIG11bHRpcGxlcyBvZiAxME0g
Yml0cmF0ZToNCj4gc3VjaCBhcyAxNjBNICwxNzBNLCAxODBNLDE5ME0sLi4uMUcobWF4KQ0KPiAN
Cj4gYXMgY29tbW9uIGRwaHkgYml0cmF0ZSA9IHBpeGNsb2NrKmJwcC9sYW5lcy4NCj4gVGhpcyB2
YWx1ZSBjYW5ub3QgbWF0Y2ggc3VjY2Vzc2Z1bGx5IGluIG1vc3QgY2FzZXMuDQo+IA0KPiBzbyBp
biBvcmRlciB0byBtYXRjaCBiaXRyYXRlICwgSSBjaG9vc2UgYSBiaXRyYXRlIHZhbHVlIGFyb3Vu
ZCBwaXhjbG9jaypicHAvbGFuZXMsDQo+IFByZXZlbnQgb3ZlcmZsb3cgYW5kIHVuZGVyZmxvdyBi
eSBmaW5lLXR1bmluZyB0aGUgdGltaW5nIHBhcmFtZXRlcnM6LSggdGhhdA0KPiB3aWxsIG1ha2Ug
dGhlIG5ldyB0aW1taW5nIHZhbHVlLg0KPiA8L3F1b3RlPg0KPiANCj4gSSB0aGVuIHN1Z2dlc3Rl
ZCBtb2RlX2ZpeHVwIHNob3VsZCBiZSB1c2VkIGluIHRoZSBEU0kgaG9zdCBkcml2ZXIsIGFuZCBL
ZWl0aA0KPiBhY2tub3dsZWRnZWQgdGhhdC4NCj4gDQo+IElzIHRoaXMgbmV3IHRpbWluZyBzdGls
bCBiZWNhdXNlIG9mIHRoZSBEU0kgaG9zdCByZXF1aXJlbWVudD8NCj4gDQoNCkFjdHVhbGx5LCB0
aGUgbW9kZSBmaXh1cCBtZXRob2QgaXMgcmVmZXJyZWQgYW5kIHVzZWQgaW4gRFNJJ3MgbmV3IHBh
dGNoDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZHJpLWRldmVsL3BhdGNo
LzIwMjQwMTA5MDcyNTE2LjI0MzI4LTMtc2hlbmd5YW5nLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbS8N
CnlvdSBjYW4gY2hlY2sgaXQgaW4gY2Ruc19kc2lfamg3MTEwX3VwZGF0ZSgpDQpUaGlzIGNvZGUg
aXMgYmVpbmcgcmV2aWV3ZWQgYW5kIG1heSBuZWVkIHRvIGJlIG9wdGltaXplZCBsYXRlci4NCg0K
QW5kIHRoZSB0aW1pbmcgaW4gdGhpcyBwYW5lbCBwYXRjaCBpcyB0ZXN0ZWQgYW5kIHZlcmlmaWVk
IGJ1dCB3ZSBkaWQgbm90IHRyeSBvdGhlciB0aW1pbmcuIFNvcnJ5IGFib3V0IHRoYXQuDQpBcyBT
dGVmYW4gc3VnZ2VzdGVkLCB3ZSBzaG91bGQgdHJ5IG90aGVyIHRpbWluZyBmcm9tIHBhbmVsLXNp
bXBsZSBmb3IgZXhhbXBsZSAicG93ZXJ0aXAscGg4MDA0ODB0MDEzLWlkZjAyIi4NCg0KSWYgdGhl
IG90aGVyIHRpbWluZyBmcm9tIHBhbmVsLXNpbXBsZSBjYW4gYmUgdXNlZCwgbWF5YmUgaXQgaXMg
bm90IG5lY2Vzc2FyeSBmb3IgdXMgdG8gc3VibWl0IHBhbmVsIHRpbWluZyBwYXRjaC4NCg0KPiAg
IERhdmUNCj4gDQo+IFsxXQ0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9kcmktZGV2ZWwvMjAyMy1EZWNlbWJlci80MzQxNTAuaHRtbA0KPiANCj4gPiBOZWlsDQo+ID4N
Cj4gPiA+DQo+ID4gPg0KPiA+ID4gY2hhbmdlcyBzaW5jZSB2MToNCj4gPiA+IC0gUmViYXNlZCBv
biB0YWcgdjYuNy4NCj4gPiA+DQo+ID4gPiBwYXRjaCAxOg0KPiA+ID4gLSBHYXZlIHVwIG9yaWdp
bmFsIGNoYW5naW5nLg0KPiA+ID4gLSBDaGFuZ2VkIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPiA+
IC0gQWRkIGNvbXBhdGlibGUgaW4gcGFuZWwtc2ltcGxlLnlhbWwNCj4gPiA+DQo+ID4gPiBwYXRj
aCAyOg0KPiA+ID4gLSBHYXZlIHVwIG9yaWdpbmFsIGNoYW5naW5nLg0KPiA+ID4gLSBDaGFuZ2Vk
IHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPiA+IC0gQWRkIG5ldyBtb2RlIGZvciB0aGUgcGFuZWwg
aW4gcGFuZWwtc2ltcGxlLmMNCj4gPiA+DQo+ID4gPiB2MToNCj4gPiA+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvY292ZXIvMjAyMzExMjQxMDQ0NTEuDQo+
ID4gPiA0NDI3MS0xLXNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20vDQo+ID4gPg0KPiA+
ID4gU2hlbmd5YW5nIENoZW4gKDIpOg0KPiA+ID4gICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBh
bmVsOiBwYW5lbC1zaW1wbGU6IEFkZCBjb21wYXRpYmxlIHByb3BlcnR5IGZvcg0KPiA+ID4gICAg
ICB3YXZlc2hhcmUgN2luY2ggdG91Y2hzY3JlZW4gcGFuZWwNCj4gPiA+ICAgIGdwdTogZHJtOiBw
YW5lbDogcGFuZWwtc2ltcGxlOiBhZGQgbmV3IGRpc3BsYXkgbW9kZSBmb3Igd2F2ZXNoYXJlDQo+
ID4gPiAgICAgIDdpbmNoIHRvdWNoc2NyZWVuIHBhbmVsDQo+ID4gPg0KPiA+ID4gICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1zaW1wbGUueWFtbCAgfCAgMiArKw0KPiA+ID4gICBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgICAgICAgICAgfCAyOA0KPiArKysr
KysrKysrKysrKysrKysrDQo+ID4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KQ0KPiA+ID4NCj4gPg0KDQpCZXN0IFJlZ2FyZHMsDQpTaGVuZ3lhbmcNCg==
