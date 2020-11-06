Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A72A8B66
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 01:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C89B6E87D;
	Fri,  6 Nov 2020 00:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310099.outbound.protection.outlook.com [40.107.131.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F420B6E87D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 00:32:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmdplqIXZK6RL6NkvpqJlJ3oWJFQtuua4AU15JBIGZBl3pMawcjNY0yyDf7DJvOy1xCKdTdkaVzYUUdz/u6h3XGh7gbU+zbT+NmjeOuum0NYvg4F4GLcbrLw7EsEqv14vk6QRATAWmVkg9zPABFJYd2G75nSNezLmF5YHJks6BbAlsZqOoy4h4gROHV/vwHZRwuGZSvIv69GughPA16v0TJ6SaBiXckPQmFk8DdBr5Xj1F9EraPeuRCzLpmoEC1oFh43Hvt1uGEUIcZ1Hcsy+ZmEjDK0JCJZ7R5qBsJcXpvxbr1hWLJXvFq+v8ooglT7lkAhJN3UzkvC85jN5yzKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqXwUnE8w6Vm9Oy+r2ZwyB33iLKzvCyR4HkepPZUHVo=;
 b=QH79xCUN9QQCn/1eG/XWS7c9FEh0iff1gmz1tpKyenipjDdU+0Lbqvgv+aZYOC0fyDtoUR1ppyaQWjJqGnfUVAL0std9HjEwGVvd961cgZgH+OfolvUpGm3b1EqdID58ibsgjG1xtnezWX0T82PATjwwyWiJTxjTXY+7t061Gbrw/d1kEdZU7qNIbN7CSwVyRtiMFPTE7rRiwZ7r3E3IBxF/QHBFZF85yk76+WB/oMj42bsQQTFxB3Gb77azTO8lGqY84ZNjaCGNolcByluxKo6oLWh8sCofqgtv+88+MoOygWtQu+OhOEjUSkOBeBEUsHKmReKX6fpKiUjg3Ldmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2322.apcprd06.prod.outlook.com (2603:1096:203:41::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.30; Fri, 6 Nov
 2020 00:31:55 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1%5]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 00:31:54 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
Thread-Topic: [PATCH] drm/ast: Fixed 1920x1080 sync. polarity issue
Thread-Index: AQHWs1i6fwVI+JUlRUKdRVm+sK7sm6m5chAAgADJY5A=
Date: Fri, 6 Nov 2020 00:31:54 +0000
Message-ID: <HK2PR06MB330086E2626FA8AD22FCC3CF8CED0@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20201105094729.106059-1-kuohsiang_chou@aspeedtech.com>
 <f9b658a6-8a4d-d512-de90-897af7a6d90d@suse.de>
In-Reply-To: <f9b658a6-8a4d-d512-de90-897af7a6d90d@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26197d6f-4311-4d6c-c190-08d881eb5ce5
x-ms-traffictypediagnostic: HK0PR06MB2322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB232276DEAB4F5A43E276E47A8CED0@HK0PR06MB2322.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3pMLbpibpUC7NLgoWm4r6nOrrOm7PvWgBS0p1V0LSuBftSVJ9AcesloYczW3wNnfZFEg5vW27BPK801usO3Jj4uzxyHqmmpHybOT7XMt1IY+G7biYWAiV4LtwVDGmXCNrmRfs9HFN1JYfcBv8Amp++vGisgmAVCKI0ycVaqTKI6cuaupXAG22Gjynp8hC8WyDC8ZGdKUkqPAd/AKJvm+BQL9uHZiKlFxDLWb9/e2CiGuMQXNBIBNCnd77Xr2khCSK1Vzxg7dgaVs6OIXSxleKNKl2+imEwjpv98DWZbqyJXGzLqcanCuoFbwns4Fgrd0ZEwzqHLA+9cjgs+sQXNAQ2r7CP2nLxmMdbK1TQUnYD4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(39830400003)(346002)(376002)(396003)(2906002)(33656002)(5660300002)(8936002)(66446008)(7696005)(52536014)(64756008)(71200400001)(66946007)(66476007)(66556008)(478600001)(76116006)(966005)(55016002)(54906003)(110136005)(316002)(107886003)(186003)(9686003)(55236004)(53546011)(6506007)(83380400001)(26005)(86362001)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: V84F4JMvtUnNotTtJGswuKTLV/F+/2exGzd6wyMAXDFrecXD5dEgLlEWQFaGSzQor/0V8W1yWK5taJOk5Xva2G0/z8IbuFWtQv97iYTMo1L+5UwLX0rgpf9amL0WLkCPVrFNQcm9Os0gzhyVOAbEEc8/bbDLEZHOZEyamRq1oVIRnI2rpVgohwrNa1JWoIy7ZdbI9dGUABfcuR1Hfxq4HcdUJ/+JtbBre6sd7Dd/MN7GWiTI3Xwzlit0CFVkEv2eaJXiQfHAAI4P28QyrDUJRQs86HaovSMe8oYXVzRk9RJeLonn43as1HcmHx2gMZsiVYjGBrIFCfbpzk8BG6I8WrMvoyJE4sdRZrt45CALWm9I6ZB2P/RvXGX+rLT87dmWavk3fbtrQrxmc3evWpiNehG8/JVHLAox2iM3rPanI1l/7q9hnYFuVROoNaj+DjkPCqgikqt7vlHUcj8vAfqYAgdyAYak0IR8BB6oqnnHQ4ej35Y7JnwcBvR+VY6bX05m81HAF79aScDzPuQ87lqlczd5ADVaXC8iQ6rWAoQN+w24XjG6m2L+cpERT5I6bfvg72zeJrEq8It5KY386c9lTcIbwMNWK1tDKZYS7FMq9jumwQ9jcBiUQIE+dTwgXP+FrLpPyg4pSxOlE6eGa2KkLQ==
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26197d6f-4311-4d6c-c190-08d881eb5ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 00:31:54.6545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8k4kX5fzTad7rBYFY1lfUkJBhIs7Lx3T9Ngk8U9SwdS8FGSMCQj/ZNd9sHIztMKDBLC9HJ3F1VOwj/L8Hy2N2j6OS9MsMllAOw66dO8mqrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2322
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
Cc: Jenmin Yuan <jenmin_yuan@aspeedtech.com>, "eich@suse.com" <eich@suse.com>,
 Tommy Huang <tommy_huang@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gU2lyDQoNClllcywgSSByYW4gc2NyaXB0cy9jaGVja3BhdGNoLnBsIGFuZCBjbGVhcmVkIDMg
ZXJyb3JzIGFib3V0IHRhaWxpbmcgc3BhY2VzLg0KDQpPSywgd291bGQgeW91IHBsZWFzZSBnaXZl
IG1lIHRoZSBtYWlsLWFkZHJlc3Mgb2YgRGFuaWVsPyBBbmQgPGVpY2hAc3VzZS5kZT4gd2lsbCBi
ZSByZW1vdmVkIGZyb20gQ0MuIA0KQmVjYXVzZSBJIHJhbiBnZXRfbWFpbnRhaW5lcnMucGwgYW5k
IGdvdCB0aGUgcmVzdWx0IG9mICIgVGhlIGN1cnJlbnQgZGlyZWN0b3J5IGRvZXMgbm90IGFwcGVh
ciB0byBiZSBhIGxpbnV4IGtlcm5lbCBzb3VyY2UgdHJlZS4gIg0KU28sIEkgZ290IHRoZSBpbmZv
cm1hdGlvbiBmcm9tIE1BSU5UQUlORVJTIGJ5IGtleXdvcmQgb2YgIi9kcm0vYXN0IiwgbGlrZXMg
YXM6DQpEUk0gRFJJVkVSIEZPUiBBU1QgU0VSVkVSIEdSQVBISUNTIENISVBTDQpNOglEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPg0KUjoJVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQpMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTOglTdXBw
b3J0ZWQNClQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MN
CkY6CWRyaXZlcnMvZ3B1L2RybS9hc3QvDQoNClRoYW5rcyBhbmQgSGF2ZSBhIGdvb2QgZGF5LA0K
CUt1by1Ic2lhbmcgQ2hvdQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVGhv
bWFzIFppbW1lcm1hbm4gW21haWx0bzp0emltbWVybWFubkBzdXNlLmRlXSANClNlbnQ6IFRodXJz
ZGF5LCBOb3ZlbWJlciAwNSwgMjAyMCA4OjA5IFBNDQpUbzogS3VvLUhzaWFuZyBDaG91IDxrdW9o
c2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCkNjOiBlaWNoQHN1c2UuY29tOyBUb21teSBIdWFuZyA8dG9tbXlfaHVhbmdAYXNwZWVkdGVj
aC5jb20+OyBKZW5taW4gWXVhbiA8amVubWluX3l1YW5AYXNwZWVkdGVjaC5jb20+OyBhaXJsaWVk
QHJlZGhhdC5jb207IEFyYyBTdW5nIDxhcmNfc3VuZ0Bhc3BlZWR0ZWNoLmNvbT4NClN1YmplY3Q6
IFJlOiBbUEFUQ0hdIGRybS9hc3Q6IEZpeGVkIDE5MjB4MTA4MCBzeW5jLiBwb2xhcml0eSBpc3N1
ZQ0KDQpIaSwNCg0KcGxlYXNlIGZvbGxvdyB0aGUgYWR2aXNlIHdlJ3JlIGdpdmluZyB5b3UuIEhh
ZCB5b3UgcnVuIHNjcmlwdHMvY2hlY2twYXRjaC5wbCBvbiB0aGUgcGF0Y2ggZmlsZSBpdCB3b3Vs
ZCBoYXZlIHRvbGQgeW91DQoNCjw8PA0KRVJST1I6IHBhdGNoIHNlZW1zIHRvIGJlIGNvcnJ1cHQg
KGxpbmUgd3JhcHBlZD8pDQojMTAyOiBGSUxFOiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF90YWJs
ZXMuaDoyOTQ6DQoNCg0KRVJST1I6IERPUyBsaW5lIGVuZGluZ3MNCiMxMDY6IEZJTEU6IGRyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X3RhYmxlcy5oOjI5NzoNCiteSSAoU3luY1BQIHwgQ2hhcng4RG90
IHwgTGluZUNvbXBhcmVPZmYgfCBXaWRlU2NyZWVuTW9kZSB8IE5ld01vZGVJbmZvIA0KK3xeTSQN
Cg0KRVJST1I6IERPUyBsaW5lIGVuZGluZ3MNCiMxMTA6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X3RhYmxlcy5oOjMwMDoNCiteSSAoU3luY1BQIHwgQ2hhcng4RG90IHwgTGluZUNvbXBh
cmVPZmYgfCBXaWRlU2NyZWVuTW9kZSB8IE5ld01vZGVJbmZvIA0KK3xeTSQNCg0KdG90YWw6IDMg
ZXJyb3JzLCAwIHdhcm5pbmdzLCAxOSBsaW5lcyBjaGVja2VkDQo+Pj4NCg0KQXMgc2FpZCBiZWZv
cmUsIHRoZSBtYWlsIGVpY2hAc3VzZS5kZSBpcyBzdGlsbCBub3QgcmVsZXZhbnQgYW55IGxvbmdl
ci4NCkJ1dCB5b3UgZGlkIG5vdCBhZGQgRGFuaWVsIGludG8gQ0MuIERpZCB5b3UgcnVuIHNjcmlw
dHMvZ2V0X21haW50YWluZXJzLnBsPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpBbSAwNS4x
MS4yMCB1bSAxMDo0NyBzY2hyaWViIEt1b0hzaWFuZyBDaG91Og0KPiBbQnVnXSBDaGFuZ2UgdGhl
IHZlcnRpY2FsIHN5bmNocm9vdXMgcG9sYXJ5IG9mIDE5MjB4MTA4MCBANjBIeg0KPiAgICAgICBm
cm9tICBOZWd0aXZlIHRvIFBvc2l0aXZlDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLdW9Ic2lhbmcg
Q2hvdSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVjaC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfdGFibGVzLmggfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfdGFibGVzLmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfdGFi
bGVzLmgNCj4gaW5kZXggODQxNGU1NDNmMjYwLi41MWVmYzViNGE1NWMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3RhYmxlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X3RhYmxlcy5oDQo+IEBAIC0yOTUsMTAgKzI5NSwxMCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGFzdF92Ymlvc19lbmh0YWJsZSANCj4gcmVzXzE2MDB4OTAwW10gPSB7DQo+IA0KPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhc3RfdmJpb3NfZW5odGFibGUgcmVzXzE5MjB4MTA4MFtdID0g
ew0KPiAgCXsyMjAwLCAxOTIwLCA4OCwgNDQsIDExMjUsIDEwODAsIDQsIDUsIFZDTEsxNDhfNSwJ
LyogNjBIeiAqLw0KPiAtCSAoU3luY05QIHwgQ2hhcng4RG90IHwgTGluZUNvbXBhcmVPZmYgfCBX
aWRlU2NyZWVuTW9kZSB8IE5ld01vZGVJbmZvIHwNCj4gKwkgKFN5bmNQUCB8IENoYXJ4OERvdCB8
IExpbmVDb21wYXJlT2ZmIHwgV2lkZVNjcmVlbk1vZGUgfCBOZXdNb2RlSW5mbyANCj4gK3wNCj4g
IAkgIEFTVDI1MDBQcmVDYXRjaENSVCksIDYwLCAxLCAweDM4IH0sDQo+ICAJezIyMDAsIDE5MjAs
IDg4LCA0NCwgMTEyNSwgMTA4MCwgNCwgNSwgVkNMSzE0OF81LAkvKiA2MEh6ICovDQo+IC0JIChT
eW5jTlAgfCBDaGFyeDhEb3QgfCBMaW5lQ29tcGFyZU9mZiB8IFdpZGVTY3JlZW5Nb2RlIHwgTmV3
TW9kZUluZm8gfA0KPiArCSAoU3luY1BQIHwgQ2hhcng4RG90IHwgTGluZUNvbXBhcmVPZmYgfCBX
aWRlU2NyZWVuTW9kZSB8IE5ld01vZGVJbmZvIA0KPiArfA0KPiAgCSAgQVNUMjUwMFByZUNhdGNo
Q1JUKSwgMHhGRiwgMSwgMHgzOCB9LCAgfTsNCj4gDQo+IC0tDQo+IDIuMTguNA0KPiANCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdA0KPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IA0K
DQotLQ0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
