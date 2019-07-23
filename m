Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02F719D5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 15:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392CF6E2AC;
	Tue, 23 Jul 2019 13:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC336E2AC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaH3zAZg4yVeHxf3CimkTRsC6d0fAADBRjN5IV9rYbVq0xy+ZyaVankx3Og2zn2MYYEylHOHa8LRihwNn/pv53wyq3mzZlxqdEHX7GX4PVQmuIBY39bYzURVWaL51LBkrstb/0NV55fPoT4rrVvsCerdhWWjr7uzlP9P81D/zImeX77fyjxNnpZEuVq6J9NA4BN/PMOUw0uDws5LEApE1Nl/6Ql1YBnoxHVaQuwxjZKDDZaV9XjMO4y6UPMUQ99t/Treyo/q1CoTofSICtRvfzlB4SobidyYMoNH1Gj7wJK0LQ4wJqBA5zuO/A4jOLGi48zIeOeMQuaTlwhiDQd/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdCCqsey1NbJLV6fpRuie9fceQppqwYTa4w9D9CKDG0=;
 b=MLQoXm7JrD3POvfngJS7HGVbC7lfjU04acqtAmA/Sk4SilAsgrgaDtUgu9w3bCaiuo0AHav69g+4hyXUFhbKoj9cH0Avx1f+2+CuBp/BZgWTqAbq07KlshPL+dEb/c0VEVTCrUp+qTfYYO1LAeQaeFzC1qDhip/b3dKD3EuPazJL4dJATXI2BEdNPwz0MKYR1m+ntodzWXUPQik3Wc6gUVp2BoslwC9rYDmC8SltwW5h8QV1iJvCaOgUwwLyXGt5k6RP0x3hcOx0Fm+jlInExxohft/R3QXKFCoKBD9kGSXhwchI/lezwa8Bogio0dWKVmcm+R++iXcKChMCSDFVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1721.namprd12.prod.outlook.com (10.175.88.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 13:58:34 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 13:58:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Topic: [PATCH] drm/syncobj: extend syncobj query ability
Thread-Index: AQHVQRbEyHnuqkVmP0qybSCa+o89TqbYOzmA
Date: Tue, 23 Jul 2019 13:58:34 +0000
Message-ID: <1946e636-7c21-7456-3824-72a98c7305a4@amd.com>
References: <20190723052257.14436-1-david1.zhou@amd.com>
In-Reply-To: <20190723052257.14436-1-david1.zhou@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR04CA0070.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::47) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88d40218-7bae-4e8f-f480-08d70f75da0a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1721; 
x-ms-traffictypediagnostic: DM5PR12MB1721:
x-microsoft-antispam-prvs: <DM5PR12MB1721C5E49778BB319414AB7683C70@DM5PR12MB1721.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(189003)(199004)(6512007)(86362001)(14454004)(31696002)(6436002)(2906002)(81156014)(81166006)(6246003)(6116002)(6486002)(31686004)(53936002)(68736007)(4326008)(36756003)(7736002)(65956001)(52116002)(229853002)(71200400001)(71190400001)(5660300002)(8936002)(65806001)(110136005)(476003)(446003)(65826007)(66476007)(66446008)(316002)(66556008)(64756008)(76176011)(256004)(478600001)(11346002)(25786009)(66946007)(58126008)(2616005)(102836004)(2501003)(64126003)(6506007)(486006)(386003)(8676002)(99286004)(305945005)(186003)(46003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1721;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SPXCPYIDuOClPg25Mble/QeN52Zs+9i0+eqzTMTZcTK1grCC64AWOzT3espNGh91ZLavgksJTxT0Y0TghuoTbeBKZdAZyznu164ILc6a8helrUcOe93qtFVWozCeek6K3Hj8cnRDG1S4FheSfRTY9iyEJj+2gqIoSO05V0IXtzSJEpaBz7O9GaE7nf5TwU5rdzNIQVFH5Y2Pwhk2to/88UBUgE3tiVZkIotiFI74bY9nulKOyZvE7CelMceCYg0ttZG4f85KZ0PmoZkkDdffRxCvn3OlTewRkZu8IrCUbADouphlBtFm54ampo+RI4SjLdUEvyuJq2TyzTBgOgW2BIQbOSWpm+63IRmDW3jzpSonryEdXasUXm33/NVMRyRlMiRaFNqNEsCecy9eOhvUkz/9bgc67kcTuLwSzuH4sTY=
Content-ID: <2440149CA963364B9CC467C36E0B9DF4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d40218-7bae-4e8f-f480-08d70f75da0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 13:58:34.2467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1721
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdCCqsey1NbJLV6fpRuie9fceQppqwYTa4w9D9CKDG0=;
 b=iRVCzQv8/5cxi1nbDGle9PTw0Pb2fMeIX+XrG+AuOF/BVBF4GveNwr360s3tZYYhfnwQNEHQAct0h1vADo9kly9YP3aEuE85UG1nz0eN+QrUGL6uIO9JxgnBzKF+kHUW2YF3usBVJ0ONGK7tFppdwaqFBXtGZP17pBEkBA3hIs8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDcuMTkgdW0gMDc6MjIgc2NocmllYiBDaHVubWluZyBaaG91Og0KPiB1c2VyIHNwYWNl
IG5lZWRzIGEgZmxleGlhYmxlIHF1ZXJ5IGFiaWxpdHkuDQo+IFNvIHRoYXQgdW1kIGNhbiBnZXQg
bGFzdCBzaWduYWxlZCBvciBzdWJtaXR0ZWQgcG9pbnQuDQo+DQo+IENoYW5nZS1JZDogSTY1MTJi
NDMwNTI0ZWJhYmU3MTVlNjAyYTJiZjVhYmIwYTdlNzgwZWENCj4gU2lnbmVkLW9mZi1ieTogQ2h1
bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4NCj4gQ2M6IExpb25lbCBMYW5kd2VybGlu
IDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCg0KSSd2ZSByZWNlbnRseSBmb3VuZCBhIGJ1ZyBp
biBkcm1fc3luY29ial9xdWVyeV9pb2N0bCgpIHdoaWNoIEknbSBnb2luZyANCnRvIGNvbW1pdCB0
b21vcnJvdy4NCg0KQXBhcnQgZnJvbSB0aGF0IGl0IGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJIHRo
aW5rIHdlIHNob3VsZCBjbGVhbnVwIGEgYml0IA0KYW5kIG1vdmUgdGhlIGRtYV9mZW5jZV9jaGFp
bl9mb3JfZWFjaCgpLi4uIGludG8gYSBoZWxwZXIgZnVuY3Rpb24gaW4gDQpkbWEtZmVuY2UtY2hh
aW4uYw0KDQpDaHJpc3RpYW4uDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMgfCAzNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGluY2x1
ZGUvdWFwaS9kcm0vZHJtLmggICAgICAgIHwgIDMgKystDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMN
Cj4gaW5kZXggM2Q0MDA5MDUxMDBiLi5mNzBkZWRmM2VmNGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jDQo+IEBAIC0xMTk3LDkgKzExOTcsNiBAQCBkcm1fc3luY29ial90aW1lbGluZV9zaWdu
YWxfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gICAJaWYgKCFk
cm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX1NZTkNPQkpfVElNRUxJTkUpKQ0KPiAg
IAkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAgIA0KPiAtCWlmIChhcmdzLT5wYWQgIT0gMCkNCj4g
LQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0NCj4gICAJaWYgKGFyZ3MtPmNvdW50X2hhbmRsZXMgPT0g
MCkNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIA0KPiBAQCAtMTI2OCw5ICsxMjY1LDYgQEAg
aW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsDQo+ICAgCWlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9TWU5D
T0JKX1RJTUVMSU5FKSkNCj4gICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gICANCj4gLQlpZiAo
YXJncy0+cGFkICE9IDApDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtDQo+ICAgCWlmIChhcmdz
LT5jb3VudF9oYW5kbGVzID09IDApDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gQEAg
LTEyOTEsMjMgKzEyODUsMjkgQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAgCQlpZiAoY2hhaW4pIHsNCj4gICAJCQlz
dHJ1Y3QgZG1hX2ZlbmNlICppdGVyLCAqbGFzdF9zaWduYWxlZCA9IE5VTEw7DQo+ICAgDQo+IC0J
CQlkbWFfZmVuY2VfY2hhaW5fZm9yX2VhY2goaXRlciwgZmVuY2UpIHsNCj4gLQkJCQlpZiAoIWl0
ZXIpDQo+IC0JCQkJCWJyZWFrOw0KPiAtCQkJCWRtYV9mZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7
DQo+IC0JCQkJbGFzdF9zaWduYWxlZCA9IGRtYV9mZW5jZV9nZXQoaXRlcik7DQo+IC0JCQkJaWYg
KCF0b19kbWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pDQo+IC0JCQkJ
CS8qIEl0IGlzIG1vc3QgbGlrZWx5IHRoYXQgdGltZWxpbmUgaGFzDQo+IC0JCQkJCSAqIHVub3Jk
ZXIgcG9pbnRzLiAqLw0KPiAtCQkJCQlicmVhazsNCj4gKwkJCWlmIChhcmdzLT5mbGFncyAmDQo+
ICsJCQkgICAgRFJNX1NZTkNPQkpfUVVFUllfRkxBR1NfTEFTVF9TVUJNSVRURUQpIHsNCj4gKwkJ
CQlwb2ludCA9IGZlbmNlLT5zZXFubzsNCj4gKwkJCX0gZWxzZSB7DQo+ICsJCQkJZG1hX2ZlbmNl
X2NoYWluX2Zvcl9lYWNoKGl0ZXIsIGZlbmNlKSB7DQo+ICsJCQkJCWlmICghaXRlcikNCj4gKwkJ
CQkJCWJyZWFrOw0KPiArCQkJCQlkbWFfZmVuY2VfcHV0KGxhc3Rfc2lnbmFsZWQpOw0KPiArCQkJ
CQlsYXN0X3NpZ25hbGVkID0gZG1hX2ZlbmNlX2dldChpdGVyKTsNCj4gKwkJCQkJaWYgKCF0b19k
bWFfZmVuY2VfY2hhaW4obGFzdF9zaWduYWxlZCktPnByZXZfc2Vxbm8pDQo+ICsJCQkJCQkvKiBJ
dCBpcyBtb3N0IGxpa2VseSB0aGF0IHRpbWVsaW5lIGhhcw0KPiArCQkJCQkJKiB1bm9yZGVyIHBv
aW50cy4gKi8NCj4gKwkJCQkJCWJyZWFrOw0KPiArCQkJCX0NCj4gKwkJCQlwb2ludCA9IGRtYV9m
ZW5jZV9pc19zaWduYWxlZChsYXN0X3NpZ25hbGVkKSA/DQo+ICsJCQkJCWxhc3Rfc2lnbmFsZWQt
PnNlcW5vIDoNCj4gKwkJCQkJdG9fZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2
X3NlcW5vOw0KPiAgIAkJCX0NCj4gLQkJCXBvaW50ID0gZG1hX2ZlbmNlX2lzX3NpZ25hbGVkKGxh
c3Rfc2lnbmFsZWQpID8NCj4gLQkJCQlsYXN0X3NpZ25hbGVkLT5zZXFubyA6DQo+IC0JCQkJdG9f
ZG1hX2ZlbmNlX2NoYWluKGxhc3Rfc2lnbmFsZWQpLT5wcmV2X3NlcW5vOw0KPiAgIAkJCWRtYV9m
ZW5jZV9wdXQobGFzdF9zaWduYWxlZCk7DQo+ICAgCQl9IGVsc2Ugew0KPiAgIAkJCXBvaW50ID0g
MDsNCj4gICAJCX0NCj4gKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+ICAgCQlyZXQgPSBjb3B5
X3RvX3VzZXIoJnBvaW50c1tpXSwgJnBvaW50LCBzaXplb2YodWludDY0X3QpKTsNCj4gICAJCXJl
dCA9IHJldCA/IC1FRkFVTFQgOiAwOw0KPiAgIAkJaWYgKHJldCkNCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+IGluZGV4IDY2
MWQ3M2Y5YTkxOS4uZmQ5ODdjZTI0ZDlmIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L2RybS5oDQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4gQEAgLTc3NywxMSArNzc3
LDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7DQo+ICAgCV9fdTMyIHBhZDsNCj4gICB9
Ow0KPiAgIA0KPiArI2RlZmluZSBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU19MQVNUX1NVQk1JVFRF
RCAoMSA8PCAwKSAvKiBsYXN0IGF2YWlsYWJsZSBwb2ludCBvbiB0aW1lbGluZSBzeW5jb2JqICov
DQo+ICAgc3RydWN0IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5IHsNCj4gICAJX191NjQgaGFu
ZGxlczsNCj4gICAJX191NjQgcG9pbnRzOw0KPiAgIAlfX3UzMiBjb3VudF9oYW5kbGVzOw0KPiAt
CV9fdTMyIHBhZDsNCj4gKwlfX3UzMiBmbGFnczsNCj4gICB9Ow0KPiAgIA0KPiAgIA0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
