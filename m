Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 041A482EC7A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 11:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B610910E452;
	Tue, 16 Jan 2024 10:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2079.outbound.protection.partner.outlook.cn [139.219.17.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E1110E452
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 10:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emciOGYlWpqmXY6AyfDcKSb9rwVU02N5s1wqIsX6ThXNk4/+o8py+2bS9nyJyBf0lkYTs9pwFDpyWUsWEbP1CUXYNWyyKOmtFeovmAXowQ/zb1RyH1CsNgW2n0IaNtqEm6OfbojK+EuetP3iHyP46YBjTR9x1aU4utzbYbVpAsnNCy0i6sVRkwS/fxrb5BombG7DjPDXPqpKhytope9RV8FmuY5RIZ1U4CwVa+oE4EwOeHi07YylhmPijdA3z6whnvJgd3xosDo+NfZYy75zzxMloC8/VWszytEfob/fMa50HeNRLxvIV7izlo0ANy13Av77pV/IlbFjvMOqAJ+IQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txletkj2I3x1X9EkfMOhkmkOZ6KnYFSVPYuwfyqSsUE=;
 b=g5LSlCLd7XuYllaLBCd4Ib1mJ4kZ8PnMvN8Aj4Jomo1X3FUgcUNkSj25B/hFOF05TA1k6yHIDTcUozlJipu66uNLxaJBGL40IgybrlcJyZbNabL7ghznzwWv6PZfb3civg9999zyeKyikVU/hqIBetyiQe87tQ7iwCM/ZCMrQUQTlhIg3D+UIQmlCecVrkyKOoZThcTq+YuhaKtboq0MdKioZzVrQfu2tCaFg3noVlsHJn73s/t9IkFxEXfrGxhT+uiJhyvSlezuk9c87iQ1bTk++A7tkIGznc1Fm3ee7Zmz0iun9GX4MNRbc00D6/9BGNxskkVisuPj03r7rJFY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB1157.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 10:02:16 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 10:02:15 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Topic: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Index: AQHaQsrahW9RVOc2vE6qAfS6BeiBCbDRVbeAgArV/mCAAA0NAIAABf3w
Date: Tue, 16 Jan 2024 10:02:15 +0000
Message-ID: <ZQ0PR01MB106282EDF7299C4571ED2DFEEF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
 <ZQ0PR01MB10626BCA7ACA6CB9754BB70BEF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
 <4ce0ce11-771d-48b5-8ef1-e7671d7c9615@linaro.org>
In-Reply-To: <4ce0ce11-771d-48b5-8ef1-e7671d7c9615@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB1157:EE_
x-ms-office365-filtering-correlation-id: e9b10655-612e-4796-88aa-08dc167a37e5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AHUbCXBjNQHDQA7ghnIW9VbUGoMQS7C2ZWEdDUHFpLYkhhKY85j+ggAnNeaLFEeNB0EghtM73Ac28uXp2M7okesJIaK97yu+V/luJl7i3mQmx+gyyRvJoRADemejhu2Nq9lg0HzcxL5YGc2U+OGCntYUIPPp1wzhxdpFIBal9eBSXnYE8mCx5BWJtSXTooCFpH7qlcpszbf+zXM3Hpu4Vnz1RpHCDyZLFedbHj6AGLvyQUL1tqRJBTUhVD4XwnbBjnf33pG83PJxIBKXQYzMWrwtsJXcAByhF6fl7KcVizygMOVhQ6fp7h4UIsnu1G3RfGYlcxgLLwxlAKaKCXWN6gz4eFQGWCmkHXUxBp+n3egAbCnILTAq29HCtnUVqrUr2hFN7ldvaatL+G5jn+Zyic396v7AUEb3FEwA77f+ZfBgheO+8TyMZbtWs2PvDQogDWhDqasMbjLLjQV7WAs6Ilv08T+2IMlhQY5serRGb40XYk4xMgRPlHo+eUNbP9flEffnzUknaf4dW5G1ukJqM2huzBWmg08OHMuKxO/VQ4ZSZyvDi7dt+Y0GBWSqVf7b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(366004)(39830400003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(41320700001)(33656002)(2906002)(5660300002)(7416002)(122000001)(40180700001)(8936002)(8676002)(86362001)(44832011)(4326008)(54906003)(41300700001)(38070700009)(64756008)(66446008)(83380400001)(26005)(40160700002)(966005)(508600001)(66476007)(110136005)(76116006)(66946007)(66556008)(9686003)(71200400001)(53546011)(7696005)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME1RanJFS0JWNHUwMUgxT3VYVi9tSFJHalhCdCtpWUUzNUNxd0J0aC84V253?=
 =?utf-8?B?cE54QVhBeUhRWE8rR3lzY1FWRjY3WUFRaWhwZkhTYm1LYVQ1Ry9xQ0ZCWVZx?=
 =?utf-8?B?RDNiM1ZrcTh1ZEtHaVpvL1NQVzdKUkNyblM1RGxFOE9HbHZ5QVJIZElHc0JT?=
 =?utf-8?B?c012TC93bjNQdmtQZFFWTENMczhCb0V5MXNHOXZScEswMGVZL28ySkgwczVh?=
 =?utf-8?B?OFl3NVdHa1M2NmRsektxZi8vQlNBNGNDTmY3Sk1rWGZEQ0c1K1pnNVJKZ1Rn?=
 =?utf-8?B?L0dDaTRmZU9uWlRsamhtQXg4dGxqMzYyUndYaVFJMnYvbEduRy9zSnozSzU4?=
 =?utf-8?B?bU1YQUZIblAyWEJnandja0daKzRrNys1S2JhTlJSbXJyVklIZnpzalVSa3d1?=
 =?utf-8?B?VHFPWlpUOFhIQU9wV2UrL2wvdkRhdWNKbklBVUhGNlJkd0graVNTL2M2Rldx?=
 =?utf-8?B?VVJRVXBiYVprK0tnMnlLWmtNVXg5SzgrakhCQmRNLytKblY5RXd1eFhwYThW?=
 =?utf-8?B?QThTYXRodVNVdUpEUDZkRHVrb2hMZUsyR0tGVjBtZTFuWmZuVGtZNU1tRzBT?=
 =?utf-8?B?ZnNGUDZnUVM3Vld0MDJ6ekdkYTJUOHVGNWJZbExjcEdWTXJPS3NGbzVwVExl?=
 =?utf-8?B?M1c1NW9oRytRWkdEa1N1WVRBTmZBcktOdEJvSTNwMTJQUVJGdUV0YklLTHVL?=
 =?utf-8?B?L0pIU2hSbUpHMWhqZ0pNbm9qSElCZWpFd2MyQWttZ3A3eXNZNUlqL1RBZlZB?=
 =?utf-8?B?ckJTNTNaQjNPcGU3UjdwQytVUjA5eVBndDhmay9td1FZZEN3amNQZ012cCs2?=
 =?utf-8?B?RG91ZnlsdG1MZG0zdk8vSnhRYVl0bEJHQkF0SHFBMFBscUFZU3RQVHF5TGZP?=
 =?utf-8?B?Sk4xL0w2S3pnMGhURHJnSEZqbVYxNjVYUWI5N0xnbjhRSmQxZXBjOU9UM1lM?=
 =?utf-8?B?K2laR1BnaTlKSVNVcWdxQk1IT1NGejQ5WE5zVVZVZG51U3NNd0VqYlpEZFlw?=
 =?utf-8?B?S2dUeDBlaVJiKzhkamZIVTBpYlZMdnJRbXlMNkM4c3pqZXpYRTRsd0hLaUNT?=
 =?utf-8?B?VnZrRWNtVDl1K3Y0RCtHOHgwZGxIZXZlVGZhZVl0NER1UXZWOExqVmJ2WUFt?=
 =?utf-8?B?UXlIRGRVSjBjVk9VTHVMWGNRN2ErenJFRlRCbXlNZGREWlNSWkhnYnN5SDU2?=
 =?utf-8?B?WTFUQVNqRGlrUEF5U1NCVlUvbGpBaU9RcjloajNsVUhTMm5CTm9XMmRoN29j?=
 =?utf-8?B?WitYc2ZrS1RjOTFON0pjUHB2RzIzMVlCU1VtTVVjVmJ2a2RJNWRTYWpXbjlP?=
 =?utf-8?B?OFhmdVZneEptTE0zN08vclRFbFAwR2Q4OFBsaUQvZlJqUzd1VjVWYXRkUWZP?=
 =?utf-8?B?Ukh5U2JpSlR4UGRPeDlJdVdLNlczT2diRnZ3T3VkZ2tuSkdiNktYa3Myek9I?=
 =?utf-8?B?Y0dEcXNkTGZXR21MeGFHY2crVGlEd1RzTWQyTjNwMnVDdkJueHcrUzBRWGsx?=
 =?utf-8?B?bDAxZlVhV3B5TEFGaVRZTDdJZm9QajczbFlTQzRZODRSRlBZQ3J5TC9rUERF?=
 =?utf-8?B?VGxIMDl0VzBIVTlWWUlvNG41UFdqS3hRUkJ0RGVGSUJkb2E3UDhhUENIemlR?=
 =?utf-8?B?SFMxM3lGQ0E1eGNBWlQ2WnBXaTMwRHZHY0hYOS9MMmMzM0E5VjdiQWNXNy9o?=
 =?utf-8?B?ZmF4T0lyS0gvNXBHejhlTW9XY1YxSVdqQlRmNnhuWjlWNmJDRXU4aWE0WnVB?=
 =?utf-8?B?MWNtTWd0MXNKYVovVVp3ZW9Pdy9WSHJuRmFmV2JRbDcvMkR3NWRIcVhLV29l?=
 =?utf-8?B?QU5Wd3d2YUJVMmVyclhCMDBWOWpRVGQ2S29lL25zQWJTc3Q2bG42dXdFMVdF?=
 =?utf-8?B?S1B2ZlRNRjErZlczeC80YjQzY3BSVFV4aW5HUFQ0TUZEMmdCbkxWV2lpSHAv?=
 =?utf-8?B?S0g2RHFhYTVWdVJuejk0cVIyQ0pqY2tCMTg3aTRDOHdXRVA5RHJRTjJxSmpM?=
 =?utf-8?B?SStsRkk5K3hVVzNRbU1nTWpGamtVYy9nOFlocVplRFdGV1BIdmNWSTN3akVO?=
 =?utf-8?B?eXppK3F3NmJFNDNWaE5TcDFoNWFIdG1kcEwrbW03RldLKy9MK3Q5TVd2L2pa?=
 =?utf-8?B?RmY3ejlLZDZabUVDWFgxQ1FZREduUkRKRWlEUzhuUEo2eTcwVldXY0k3SHVh?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b10655-612e-4796-88aa-08dc167a37e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 10:02:15.8780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: buuXRztIa6XSBO+Hxn4yxBNms/f7bMqFs2fJahOlu3UzmfMF5QXxuPSXfQtN3IyQV4gSyckmxg51HUYa0RUJRYT3NDWzRn1JH0EtnomdIrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1157
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
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
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
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIE5laWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPg0KPiBTZW50OiAy
MDI05bm0MeaciDE25pelIDE3OjM0DQo+IFRvOiBTaGVuZ3lhbmcgQ2hlbiA8c2hlbmd5YW5nLmNo
ZW5Ac3RhcmZpdmV0ZWNoLmNvbT47DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBxdWljX2plc3N6aGFuQHF1aWNpbmMu
Y29tOyBzYW1AcmF2bmJvcmcub3JnOyBhaXJsaWVkQGdtYWlsLmNvbTsNCj4gZGFuaWVsQGZmd2xs
LmNoOyBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb207IG1yaXBhcmRAa2VybmVsLm9y
ZzsNCj4gdHppbW1lcm1hbm5Ac3VzZS5kZTsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBrcnp5c3p0
b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHdhaHJlbnN0
QGdteC5uZXQ7DQo+IGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNvbTsgdGhpZXJyeS5yZWRp
bmdAZ21haWwuY29tOyBDaGFuZ2h1YW5nDQo+IExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJm
aXZldGVjaC5jb20+OyBLZWl0aCBaaGFvDQo+IDxrZWl0aC56aGFvQHN0YXJmaXZldGVjaC5jb20+
OyBKYWNrIFpodSA8amFjay56aHVAc3RhcmZpdmV0ZWNoLmNvbT47DQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwLzJdIEFkZCB3YXZlc2hh
cmUgN2luY2ggdG91Y2hzY3JlZW4gcGFuZWwgc3VwcG9ydA0KPiANCj4gT24gMTYvMDEvMjAyNCAx
MDozMiwgU2hlbmd5YW5nIENoZW4gd3JvdGU6DQo+ID4gSGksIE5laWwNCj4gPg0KPiA+IFRoYW5r
cyBmb3IgeW91ciBjb21tZW50Lg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+IEZyb206IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgPG5laWwuYXJtc3Ryb25nQGxp
bmFyby5vcmc+DQo+ID4+IFNlbnQ6IDIwMjTlubQx5pyIOeaXpSAxOToxOQ0KPiA+PiBUbzogU2hl
bmd5YW5nIENoZW4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+Ow0KPiA+PiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiA+PiBDYzogcXVpY19qZXNzemhhbkBxdWljaW5jLmNvbTsgc2FtQHJhdm5ib3JnLm9yZzsgYWly
bGllZEBnbWFpbC5jb207DQo+ID4+IGRhbmllbEBmZndsbC5jaDsgbWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tOw0KPiA+PiBtcmlwYXJkQGtlcm5lbC5vcmc7IHR6aW1tZXJtYW5uQHN1
c2UuZGU7IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gPj4ga3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiA+PiB3YWhyZW5zdEBnbXgubmV0OyBk
YXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb207DQo+ID4+IHRoaWVycnkucmVkaW5nQGdtYWls
LmNvbTsgQ2hhbmdodWFuZyBMaWFuZw0KPiA+PiA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRl
Y2guY29tPjsgS2VpdGggWmhhbw0KPiA+PiA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPjsg
SmFjayBaaHUgPGphY2suemh1QHN0YXJmaXZldGVjaC5jb20+Ow0KPiA+PiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSBBZGQgd2F2
ZXNoYXJlIDdpbmNoIHRvdWNoc2NyZWVuIHBhbmVsDQo+ID4+IHN1cHBvcnQNCj4gPj4NCj4gPj4g
SGksDQo+ID4+DQo+ID4+IE9uIDA5LzAxLzIwMjQgMDg6MDksIFNoZW5neWFuZyBDaGVuIHdyb3Rl
Og0KPiA+Pj4gVGhpcyBwYXRjaHNldCBhZGRzIHdhdmVzaGFyZSA3aW5jaCB0b3VjaHNjcmVlbiBw
YW5lbCBzdXBwb3J0IGZvciB0aGUNCj4gPj4+IFN0YXJGaXZlIEpINzExMCBTb0MuDQo+ID4+DQo+
ID4+IENvdWxkIHlvdSBwcmVjaXNlIHdoaWNoIFNLVSB5b3UncmUgcmVmZXJyaW5nIHRvID8gaXMg
aXQgMTk4ODUgPT4NCj4gPj4gaHR0cHM6Ly93d3cud2F2ZXNoYXJlLmNvbS83aW5jaC1kc2ktbGNk
Lmh0bSA/DQo+ID4+DQo+ID4NCj4gPiB5ZXMsIGl0IGlzDQo+ID4gc29ycnkgZm9yIGNvbmZ1c2lu
ZyB5b3UuDQo+ID4NCj4gPj4gQXJlIHlvdSBzdXJlIGl0IHJlcXVpcmVzIGRpZmZlcmVudCB0aW1p
bmdzIGZyb20gdGhlIFJQaSBvbmUgPyBJbiB0aGUNCj4gPj4gV2F2ZXNoYXJlIHdpa2kgaXQgZXhw
bGljaXRseSB1c2VzIHRoZSBycGkgc2V0dXAgKHZjNC1rbXMtZHNpLTdpbmNoKSB0byBkcml2ZSBp
dDoNCj4gPj4gaHR0cHM6Ly93d3cud2F2ZXNoYXJlLmNvbS93aWtpLzdpbmNoX0RTSV9MQ0QNCj4g
Pj4NCj4gPg0KPiA+IFJlZmVycmluZyB0byBLZWl0aCdzIGFuc3dlcg0KPiA+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIzLURlY2VtYmVyLzQzNDIw
MC4NCj4gPiBodG1sIHRoZSBwYW5lbCB0aW1pbmcgdmFsdWUgaXMgZ2VuZXJhdGVkIHRvIGZpdCBw
aHkncyBiaXRyYXRlIGFuZA0KPiA+IHByZXZlbnQgb3ZlcmZsb3cgYW5kIHVuZGVyZmxvdy4NCj4g
Pg0KPiA+IFJlZmVycmluZyB0byB0aGUgc3VnZ2VzdGlvbiwgd2UgbWF5IHRyeSBvdGhlciB0aW1p
bmcgZnJvbSBwYW5lbC1zaW1wbGUgdG8NCj4gZHJpdmUgdGhlIHBhbmVsLg0KPiANCj4gUGxlYXNl
IGltcGxlbWVudCBhIG1vZGVfZml4dXAgaW4geW91ciBEU0kgaG9zdCBkcml2ZXIgaW5zdGVhZC4N
Cj4gDQoNClRoZSBtb2RlIGZpeHVwIG1ldGhvZCBpcyBhbHJlYWR5IHVzZWQuIEFzIHJlZmVyZW5j
ZToNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvcGF0Y2gv
MjAyNDAxMDkwNzI1MTYuMjQzMjgtMy1zaGVuZ3lhbmcuY2hlbkBzdGFyZml2ZXRlY2guY29tLw0K
eW91IGNhbiBjaGVjayBpdCBpbiBjZG5zX2RzaV9qaDcxMTBfdXBkYXRlKCkuIA0KVGhpcyBjb2Rl
IGlzIGJlaW5nIHJldmlld2VkIGFuZCBtYXkgbmVlZCB0byBiZSBvcHRpbWl6ZWQgbGF0ZXIuDQoN
Cj4gTmVpbA0KPiANCj4gPg0KPiA+PiBOZWlsDQo+ID4+DQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IGNo
YW5nZXMgc2luY2UgdjE6DQo+ID4+PiAtIFJlYmFzZWQgb24gdGFnIHY2LjcuDQo+ID4+Pg0KPiA+
Pj4gcGF0Y2ggMToNCj4gPj4+IC0gR2F2ZSB1cCBvcmlnaW5hbCBjaGFuZ2luZy4NCj4gPj4+IC0g
Q2hhbmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+ID4+PiAtIEFkZCBjb21wYXRpYmxlIGluIHBh
bmVsLXNpbXBsZS55YW1sDQo+ID4+Pg0KPiA+Pj4gcGF0Y2ggMjoNCj4gPj4+IC0gR2F2ZSB1cCBv
cmlnaW5hbCBjaGFuZ2luZy4NCj4gPj4+IC0gQ2hhbmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+
ID4+PiAtIEFkZCBuZXcgbW9kZSBmb3IgdGhlIHBhbmVsIGluIHBhbmVsLXNpbXBsZS5jDQo+ID4+
Pg0KPiA+Pj4gdjE6DQo+ID4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
ZHJpLWRldmVsL2NvdmVyLzIwMjMxMTI0MTA0NDUxLg0KPiA+Pj4gNDQgMjcxLTEtc2hlbmd5YW5n
LmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbS8NCj4gPj4+DQo+ID4+PiBTaGVuZ3lhbmcgQ2hlbiAoMik6
DQo+ID4+PiAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsOiBwYW5lbC1zaW1wbGU6IEFk
ZCBjb21wYXRpYmxlIHByb3BlcnR5IGZvcg0KPiA+Pj4gICAgICAgd2F2ZXNoYXJlIDdpbmNoIHRv
dWNoc2NyZWVuIHBhbmVsDQo+ID4+PiAgICAgZ3B1OiBkcm06IHBhbmVsOiBwYW5lbC1zaW1wbGU6
IGFkZCBuZXcgZGlzcGxheSBtb2RlIGZvciB3YXZlc2hhcmUNCj4gPj4+ICAgICAgIDdpbmNoIHRv
dWNoc2NyZWVuIHBhbmVsDQo+ID4+Pg0KPiA+Pj4gICAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvcGFuZWwtc2ltcGxlLnlhbWwgIHwgIDIgKysNCj4gPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8IDI4DQo+ID4+ICsrKysrKysrKysrKysrKysr
KysNCj4gPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4g
Pg0KPiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IFNoZW5neWFuZw0KDQpCZXN0IFJlZ2FyZHMs
DQpTaGVuZ3lhbmcNCg==
