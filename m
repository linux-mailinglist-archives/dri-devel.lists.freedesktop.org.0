Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CFF49744
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 04:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3FE6E0BD;
	Tue, 18 Jun 2019 02:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA06E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 02:04:28 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4688.eurprd08.prod.outlook.com (10.255.115.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 02:04:25 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 02:04:25 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/komeda: fix size_t format string
Thread-Topic: [PATCH] drm/komeda: fix size_t format string
Thread-Index: AQHVJXojg0qTn3QqBEKaMAcl4INAHA==
Date: Tue, 18 Jun 2019 02:04:25 +0000
Message-ID: <20190618020419.GA32081@james-ThinkStation-P300>
References: <20190617125002.1312331-1-arnd@arndb.de>
In-Reply-To: <20190617125002.1312331-1-arnd@arndb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0037.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1ab9b1a-21f3-443d-914e-08d6f391499a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4688; 
x-ms-traffictypediagnostic: VE1PR08MB4688:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4688D013A228CCC1665BE020B3EA0@VE1PR08MB4688.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(76176011)(25786009)(33716001)(478600001)(6246003)(99286004)(52116002)(256004)(58126008)(476003)(316002)(54906003)(229853002)(6486002)(11346002)(486006)(33656002)(1076003)(6436002)(14444005)(446003)(4326008)(6506007)(26005)(5660300002)(66066001)(6512007)(9686003)(66476007)(66446008)(66556008)(64756008)(81166006)(53936002)(71200400001)(71190400001)(8936002)(81156014)(3846002)(6116002)(386003)(86362001)(55236004)(186003)(8676002)(102836004)(66946007)(68736007)(14454004)(6916009)(2906002)(305945005)(73956011)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4688;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 362ea+5iBYmi2FARug+F/Kfuc+PjmZjN2uxZjoe/U5gBT0Ca7PsMc8A0QCwBnFmKn+Tyk/IyBo5LfTpTybq66Udgteq9STH17XlU96YMIBk/SdfyGL3LhJLyySCvzCK1mVLIUVQ9qpVPLe1w0QEWmXQQPKjKe910wVnWmq4Kl8MT+z5LV53WtdO+vSJT2ehQ49MGm7n32nuE2pkgPRAPa4ibnsuEmDjejQ3K2FoyCDLC2+rdd4VTT6QEitQhtUXvo/k8Et2BX2Zvt2aJbv4+ucUJnSBkUbC3GEtw/a71gmjkHFK/wXQ2JyOmfIZVQLMHftiKluCLtZuF136WPPDbAnquP+v3KLuvu9UCsWWox/vQ0nGylmH5+O8DQBCtk9W2KejA6qxabMvo9T4U/cNjAyT4Hsivw85+zSPWIxsrHBg=
Content-ID: <E0DC416FE603794797027DA83D782A1C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ab9b1a-21f3-443d-914e-08d6f391499a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 02:04:25.6264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1gPkWf2OhZMHMJItTPjZUV5e5pbdgyMURS4PMZLy8Q=;
 b=Poso5qek5EBM1UgnJ7sFj6HQha370kKF+kRChK89cioEjZaiLGbZN8TfUqxQeQ41OKRtwzmEPifgV9dq6Whng0JM3Pg5PnGC3jyu+63DB995z8U/Mf8s6g+g6daVq0DZf6D4J6FgAJ0RjyUNBu99YJB0nlRbB1x0MyRgJjBZpE0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lowry Li
 \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDI6NDk6MThQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBUaGUgZGVidWcgb3V0cHV0IHVzZXMgdGhlIHdyb25nIGZvcm1hdCBzdHJpbmcgZm9y
IHByaW50aW5nIGEgc2l6ZV90Ogo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2Ry
bS9kcm1fbW0uaDo0OSwKPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9kcm0vZHJtX3Zt
YV9tYW5hZ2VyLmg6MjYsCj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvZHJtL2RybV9n
ZW0uaDo0MCwKPiAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYzo5Ogo+IGRyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmM6IEluIGZ1bmN0aW9uICdrb21lZGFf
ZmJfYWZiY19zaXplX2NoZWNrJzoKPiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9mcmFtZWJ1ZmZlci5jOjk2OjE3OiBlcnJvcjogZm9ybWF0ICclbHgnIGV4cGVjdHMg
YXJndW1lbnQgb2YgdHlwZSAnbG9uZyB1bnNpZ25lZCBpbnQnLCBidXQgYXJndW1lbnQgMyBoYXMg
dHlwZSAnc2l6ZV90JyB7YWthICd1bnNpZ25lZCBpbnQnfSBbLVdlcnJvcj1mb3JtYXQ9XQo+ICAg
IERSTV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCVseC4g
bWluX3NpemUgMHgleC5cbiIsCj4gCj4gVGhpcyBpcyBoYXJtbGVzcyBpbiB0aGUga2VybmVsIGFz
IHNpemVfdCBhbmQgbG9uZyBhcmUgYWx3YXlzIHRoZSBzYW1lCj4gd2lkdGgsIGJ1dCBpdCdzIGFs
d2F5cyBiZXR0ZXIgdG8gdXNlIHRoZSBjb3JyZWN0IGZvcm1hdCBzdHJpbmcKPiB0byBzaHV0IHVw
IHRoZSB3YXJuaW5nLgo+IAo+IEZpeGVzOiA5Y2NmNTM2ZTUzY2IgKCJkcm0va29tZWRhOiBBZGRl
ZCBBRkJDIHN1cHBvcnQgZm9yIGtvbWVkYSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiBp
bmRleCBhYmM4YzBjY2MwNTMuLjU4ZmYzNGU3MThkMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+IEBA
IC05Myw3ICs5Myw3IEBAIGtvbWVkYV9mYl9hZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9m
YiAqa2ZiLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gIAkJCSAgICAgICBBRkJDX1NVUEVSQkxL
X0FMSUdOTUVOVCk7Cj4gIAltaW5fc2l6ZSA9IGtmYi0+YWZiY19zaXplICsgZmItPm9mZnNldHNb
MF07Cj4gIAlpZiAobWluX3NpemUgPiBvYmotPnNpemUpIHsKPiAtCQlEUk1fREVCVUdfS01TKCJh
ZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpfc2l6ZTogMHglbHguIG1pbl9zaXplIDB4JXguXG4i
LAo+ICsJCURSTV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAw
eCV6eC4gbWluX3NpemUgMHgleC5cbiIsCj4gIAkJCSAgICAgIG9iai0+c2l6ZSwgbWluX3NpemUp
Owo+ICAJCWdvdG8gY2hlY2tfZmFpbGVkOwo+ICAJfQo+IEBAIC0xMzcsNyArMTM3LDcgQEAga29t
ZWRhX2ZiX25vbmVfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1
Y3Qga29tZWRhX2ZiICprZmIsCj4gIAkJbWluX3NpemUgPSBrb21lZGFfZmJfZ2V0X3BpeGVsX2Fk
ZHIoa2ZiLCAwLCBmYi0+aGVpZ2h0LCBpKQo+ICAJCQkgLSB0b19kcm1fZ2VtX2NtYV9vYmoob2Jq
KS0+cGFkZHI7Cj4gIAkJaWYgKG9iai0+c2l6ZSA8IG1pbl9zaXplKSB7Cj4gLQkJCURSTV9ERUJV
R19LTVMoIlRoZSBmYi0+b2JqWyVkXSBzaXplOiAlbGQgbG93ZXIgdGhhbiB0aGUgbWluaW11bSBy
ZXF1aXJlbWVudDogJWQuXG4iLAo+ICsJCQlEUk1fREVCVUdfS01TKCJUaGUgZmItPm9ialslZF0g
c2l6ZTogJXpkIGxvd2VyIHRoYW4gdGhlIG1pbmltdW0gcmVxdWlyZW1lbnQ6ICVkLlxuIiwKPiAg
CQkJCSAgICAgIGksIG9iai0+c2l6ZSwgbWluX3NpemUpOwo+ICAJCQlyZXR1cm4gLUVJTlZBTDsK
PiAgCQl9Cj4gLS0gCj4gMi4yMC4wCgoKSGkgQXJuZDoKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNo
LgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxq
YW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
