Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7165102A42
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 17:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03426E8D0;
	Tue, 19 Nov 2019 16:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680042.outbound.protection.outlook.com [40.107.68.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1726E8B1;
 Tue, 19 Nov 2019 16:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/jxseKQz+n9CwqOgh1oTOhAgHRVSv6dB8a6+8yKsTqKan7Uo0s5C7I3sEx4HaOt7kFA9SWzT5Q6HvuKIIRmAmZxBmVIK2lT57mzxtdrE/EZZVb0cprmfJMD3iCqGNStzcuwxnrKIqVuz6k/Hs05eRYkNTI+qmOtHuD55SD7RN/KryRpteOYZPTWw7uNtrKcWXncRvZmkXxNyl9/P2CjdU80p7O6Icq79aySBIfS6TyJsxCCGJSDfRMVXUV9JL/onpkE1JJw0DEY4Efr2a0tvVOSZpWuFrEaI0RMPWTFgMDYXvrRpYrELgPYnimsjm3xb2riJ00wv6/nTQIZONoqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNnwvyOjFx1A72IBWcWOriHuXv37fZwI2bbfiATQ/58=;
 b=KNKs2sgkyeA9fsDwWNVFxEKQo5hrlE3o+MqMY8YofVwx3NFwgF7TVawbqAdI1/c62MMpgo9fNbXbYrUqqreP3VnO/s9KMpjcopfp4yNwF4nJjxPy7qn1zxyN6FpA/v+RR/ot+AXbcV9xWpJm+p2tHv4BixBpViEtlP6d2z6Ga3o1NT91aeEmO7DIl4J39TYgEzmdE/SyUPO6elJhC0Wpo5MbvMp1PU8Od1Kwdf/M+IWqCcs+z5EMFQzac2a/oD7d9ZCyfVxIEru7QBLAd8oCf5/rImmwLXaQpk0akz0qFE1JMDBz53pvkClc4QlPV14qfEfMrumG83CRhw6cDYYzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2403.namprd12.prod.outlook.com (52.132.28.140) by
 BL0PR12MB2388.namprd12.prod.outlook.com (52.132.9.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 16:59:40 +0000
Received: from BL0PR12MB2403.namprd12.prod.outlook.com
 ([fe80::2c02:870c:127d:c2d0]) by BL0PR12MB2403.namprd12.prod.outlook.com
 ([fe80::2c02:870c:127d:c2d0%6]) with mapi id 15.20.2474.015; Tue, 19 Nov 2019
 16:59:40 +0000
From: "Cornij, Nikola" <Nikola.Cornij@amd.com>
To: "Lipski, Mikita" <Mikita.Lipski@amd.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/dsc: Return unsigned long on compute offset
Thread-Topic: [PATCH] drm/dsc: Return unsigned long on compute offset
Thread-Index: AQHVnugAbzZdj62GeUa4ND6JbM3p0qeSlVOAgAADPQCAAB6lEA==
Date: Tue, 19 Nov 2019 16:59:40 +0000
Message-ID: <BL0PR12MB24039F7D8CC95CCCC10C3103EE4C0@BL0PR12MB2403.namprd12.prod.outlook.com>
References: <20191119144526.31797-1-mikita.lipski@amd.com>
 <20191119145649.GZ1208@intel.com>
 <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
In-Reply-To: <f7b705a8-9d6a-1db3-e261-a80aca57454a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b20f4743-a456-44f2-5524-08d76d11de58
x-ms-traffictypediagnostic: BL0PR12MB2388:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB23889E4630B55375BFEE1A6EEE4C0@BL0PR12MB2388.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(13464003)(189003)(199004)(6306002)(55016002)(66556008)(76176011)(9686003)(66446008)(64756008)(66946007)(6506007)(53546011)(6246003)(14444005)(256004)(478600001)(4326008)(33656002)(71190400001)(71200400001)(2906002)(66066001)(102836004)(6436002)(229853002)(3846002)(6116002)(86362001)(81156014)(81166006)(8936002)(8676002)(476003)(76116006)(305945005)(11346002)(486006)(446003)(74316002)(7736002)(7696005)(54906003)(110136005)(5660300002)(26005)(66574012)(316002)(25786009)(966005)(14454004)(52536014)(66476007)(99286004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2388;
 H:BL0PR12MB2403.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wV+0PhlgTcesw1Xpq9ey5Sn+DWb2s8JoVHZuqCqrEC9qFzjIXHE+WaBk0aaN+Te1Tf7HkT6Nz6OJ9F/DPgRrUr7wo11441vRSr4bHdYqIPLlAjPtj4kf54+1UcM3G+62Llrb6OzAEGMJPCHaHFin3fIY4ZSqS+NG6vdcvK0X510Y9Nw2DWUBGHa22+99mihzHXLXIloUOVMLM942CZZtiU7Yk1j9Kr6ludxrI5SeW7PI8i9aC3VIUXQahe8V0ZxvvzOr4OTeYsxsEPX58EnNa1RnS5R82uBnRtvpSmCvB1zLpw/giM5fPW6QzhTcyUECSPf58GHTCXTq2CkFqZNVLBiONJv4r75G6wrlpRDssUXIu8kXWWI4GWXlTAJqcZm7HKgLx27LkTT1L024I9Bm2T7q0pX8u5Jqi5L1Li+KlkiE6glXyxB0LFfDkhChtuum
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20f4743-a456-44f2-5524-08d76d11de58
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 16:59:40.7157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NH82Yk1aUlOrr75QtdK67vAj60rDhBKsOJmD64XrODAntpSrNoMK+7pp2vPU4UdMHyS9fI6IbrpC9A/KaYJKYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2388
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNnwvyOjFx1A72IBWcWOriHuXv37fZwI2bbfiATQ/58=;
 b=m/ciVC08fytrXssAzYLDzl4ZjgXN8A7IoKYcswCzhvgO2HjnIbHhLQlOUq4PGMBw9Pvp3WOWZVNt58o1jK0E2RzkrO63jSE41a1bRQMP0tK2hsakYkHJQucAYTYcf8hZEMVmTfhCDtKheHBZOQcIHoCB1fFuf/T1A4LhbW7AHo0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nikola.Cornij@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgeW91J3JlIGdvaW5nIHRvIG1ha2UgYWxsIG9mIHRoZW0gdGhlIHNhbWUsIHRoZW4gdTY0LCBw
bGVhc2UuDQoNClRoaXMgaXMgYmVjYXVzZSBJJ20gbm90IHN1cmUgaWYgY2FsY3VsYXRpb25zIHJl
cXVpcmUgNjQtYml0IGF0IHNvbWUgc3RhZ2UuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBMaXBza2ksIE1pa2l0YSA8TWlraXRhLkxpcHNraUBhbWQuY29tPiANClNlbnQ6IE5v
dmVtYmVyIDE5LCAyMDE5IDEwOjA4IEFNDQpUbzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT47IExpcHNraSwgTWlraXRhIDxNaWtpdGEuTGlwc2tpQGFtZC5j
b20+DQpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IENvcm5paiwgTmlrb2xhIDxOaWtvbGEuQ29ybmlqQGFtZC5jb20+DQpT
dWJqZWN0OiBSZTogW1BBVENIXSBkcm0vZHNjOiBSZXR1cm4gdW5zaWduZWQgbG9uZyBvbiBjb21w
dXRlIG9mZnNldA0KDQoNCg0KT24gMTkvMTEvMjAxOSAwOTo1NiwgVmlsbGUgU3lyasOkbMOkIHdy
b3RlOg0KPiBPbiBUdWUsIE5vdiAxOSwgMjAxOSBhdCAwOTo0NToyNkFNIC0wNTAwLCBtaWtpdGEu
bGlwc2tpQGFtZC5jb20gd3JvdGU6DQo+PiBGcm9tOiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlw
c2tpQGFtZC5jb20+DQo+Pg0KPj4gV2Ugc2hvdWxkbid0IGNvbXBhcmUgaW50IHdpdGggdW5zaWdu
ZWQgbG9uZyB0byBmaW5kIHRoZSBtYXggdmFsdWUgYW5kIA0KPj4gc2luY2Ugd2UgYXJlIG5vdCBl
eHBlY3RpbmcgbmVnYXRpdmUgdmFsdWUgcmV0dXJuZWQgZnJvbSANCj4+IGNvbXB1dGVfb2Zmc2V0
IHdlIHNob3VsZCBtYWtlIHRoaXMgZnVuY3Rpb24gcmV0dXJuIHVuc2lnbmVkIGxvbmcgc28gDQo+
PiB3ZSBjYW4gY29tcGFyZSB0aGUgdmFsdWVzIHdoZW4gY29tcHV0aW5nIHJjIHBhcmFtZXRlcnMu
DQo+IA0KPiBXaHkgYXJlIHRoZXJlIG90aGVyIHVuc2lnbmVkIGxvbmdzIGluIGRzYyBwYXJhbWV0
ZXIgY29tcHV0YXRpb24gaW4gdGhlIA0KPiBmaXJzdCBwbGFjZT8NCg0KSSBiZWxpZXZlIGl0IHdh
cyBpbml0aWFsbHkgc2V0IHRvIGJlIHVuc2lnbmVkIGxvbmcgZm9yIHZhcmlhYmxlIGNvbnNpc3Rl
bmN5LCB3aGVuIHdlIHBvcnRlZCBpbnRlbF9jb21wdXRlX3JjX3BhcmFtZXRlcnMgaW50byBkcm1f
ZHNjX2NvbXB1dGVfcmNfcGFyYW1ldGVycy4gQnV0IG5vdyB0aGF0IEkgbG9vayBhdCBpdCwgd2Ug
Y2FuIGFjdHVhbGx5IGp1c3Qgc2V0IHRoZW0gdG8gdTMyIG9yIHU2NCwgYXMgbm90aGluZyBzaG91
bGQgZXhjZWVkIHRoYXQuDQo+IA0KPj4NCj4+IENjOiBOaWtvbGEgQ29ybmlqIDxuaWtvbGEuY29y
bmlqQGFtZC5jb20+DQo+PiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tpQGFtZC5j
b20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYyB8IDYgKysrLS0tDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RzYy5jDQo+PiBpbmRleCA3NGYzNTI3ZjU2N2QuLmVjNDA2MDRhYjZhMiAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHNjLmMNCj4+IEBAIC0yNDUsMTEgKzI0NSwxMSBAQCB2b2lkIGRybV9kc2NfcHBz
X3BheWxvYWRfcGFjayhzdHJ1Y3QgZHJtX2RzY19waWN0dXJlX3BhcmFtZXRlcl9zZXQgKnBwc19w
YXlsb2FkLA0KPj4gICB9DQo+PiAgIEVYUE9SVF9TWU1CT0woZHJtX2RzY19wcHNfcGF5bG9hZF9w
YWNrKTsNCj4+ICAgDQo+PiAtc3RhdGljIGludCBjb21wdXRlX29mZnNldChzdHJ1Y3QgZHJtX2Rz
Y19jb25maWcgKnZkc2NfY2ZnLCBpbnQgcGl4ZWxzX3Blcl9ncm91cCwNCj4+ICtzdGF0aWMgdW5z
aWduZWQgbG9uZyBjb21wdXRlX29mZnNldChzdHJ1Y3QgZHJtX2RzY19jb25maWcgKnZkc2NfY2Zn
LCBpbnQgcGl4ZWxzX3Blcl9ncm91cCwNCj4+ICAgCQkJCWludCBncm91cHNfcGVyX2xpbmUsIGlu
dCBncnBjbnQpDQo+PiAgIHsNCj4+IC0JaW50IG9mZnNldCA9IDA7DQo+PiAtCWludCBncnBjbnRf
aWQgPSBESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxfeG1pdF9kZWxheSwgcGl4ZWxzX3Bl
cl9ncm91cCk7DQo+PiArCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gMDsNCj4+ICsJdW5zaWduZWQg
bG9uZyBncnBjbnRfaWQgPSBESVZfUk9VTkRfVVAodmRzY19jZmctPmluaXRpYWxfeG1pdF9kZWxh
eSwgcGl4ZWxzX3Blcl9ncm91cCk7DQo+PiAgIA0KPj4gICAJaWYgKGdycGNudCA8PSBncnBjbnRf
aWQpDQo+PiAgIAkJb2Zmc2V0ID0gRElWX1JPVU5EX1VQKGdycGNudCAqIHBpeGVsc19wZXJfZ3Jv
dXAgKiB2ZHNjX2NmZy0+Yml0c19wZXJfcGl4ZWwsIDE2KTsNCj4+IC0tIA0KPj4gMi4xNy4xDQo+
Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsDQo+IA0KDQotLSANClRoYW5rcywNCk1pa2l0YSBMaXBza2kNClNvZnR3YXJlIEVuZ2lu
ZWVyIDIsIEFNRA0KbWlraXRhLmxpcHNraUBhbWQuY29tDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
