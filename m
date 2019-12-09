Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1E116EA0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E016E455;
	Mon,  9 Dec 2019 14:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DFB6E455
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0e3LocM4MjI7K8qEZ2YFz6HjWlCLdU/frJJlb27vL6baebrlSaPBmXsCbXIQ/cMS2MI0TAAPTFzl8RbHkjPrxM7p5bWMTVigK8v0QIdA+3Jo76BvXI8CYD2/pgYLC3gqpIIwoSXn77H3l5Ky/HYcUA6TJ9MUE1Rv0OyqnfGJdzf3dxQoub0kLCXR1oqaZo2SmA8PZlrQc4e2k/W9iu/bevWKKbtKSqPkLqRypwGyGBOzcnK1ciui7UoIKvsl3XNo3L3jjBUwSXE6wxKHF36g4sWX2RXzf064yGYkfBMl3mY1ZCav7JEDjepuxMVg5tpT/gjsDr6BvZXXjKCOdydJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8Pv9rEt//5mY7VBQ1ZEyoBqXBI6f8DLtt39ZBXFzOU=;
 b=oe3BGnBouFIx5W3OZBBcMiJepwslj2tcW66hKXFZXGnbKk1cKYynn4ba6uU3A0gkH32Z7apA/gyArSAccD3CS+6krdxBIquNjU/Mwj7HHcdTgtJc9s95CHFEuAkeVtSSc62iLN1PRbYjMtkhAHJ45Rzjsv/w43+Pf+HJnetH4H0UafBS1gevgd/xVhbMDbea8IdzXZvlXb0AUKiabeDr2iZStx5RlQrJSnd0VaQOi3th1v9Vhaq0jV9sMeTUg2kXG0gGRyLbm3lOaXUoPB6rAB7uEK7MwmIbR6oehOLACdyyz4uTZdGq4Gj80L9KqZGWuxbQeOZ5VtZT5yFj64xvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6016.namprd05.prod.outlook.com (20.178.244.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Mon, 9 Dec 2019 14:08:47 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::611e:6a6b:9109:5aa8%7]) with mapi id 15.20.2538.012; Mon, 9 Dec 2019
 14:08:46 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
Thread-Topic: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
Thread-Index: AQHVrbXG/SePYza1EU2s4p6Lh/VQDqex2OqA
Date: Mon, 9 Dec 2019 14:08:46 +0000
Message-ID: <96100f36c6fccb63afb55f6e9284c4f66282ecec.camel@vmware.com>
References: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6344f45-e4fd-47db-9819-08d77cb14ebc
x-ms-traffictypediagnostic: MN2PR05MB6016:|MN2PR05MB6016:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6016282A21BC27E5F427B512A1580@MN2PR05MB6016.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(54906003)(8936002)(6512007)(2616005)(26005)(478600001)(76116006)(6486002)(186003)(229853002)(110136005)(118296001)(4326008)(305945005)(2906002)(36756003)(71190400001)(316002)(5660300002)(71200400001)(66446008)(64756008)(81166006)(66476007)(86362001)(91956017)(66946007)(6506007)(66556008)(8676002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6016;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yW6RXWhv9pML2NC1QlCwpBiM4kD8npyQsvJsd9SAV/8fcCSCHQxN2iMz6HVChgdsx508801tQBvbLo+gBjLKuIQBebWWj/Bc2+yOnD2REIaEd2rVbaCHWe9id7ji8Gku4jHoJ5MVJP6Mw9pqQ2illT+fBpHDecqiDZggBJ6hQ839xt0uT4bHhzm9jA+nq7zvMQ0vawbA2FSTzbmwH56P/FLvUtR1xudhUYQ93Ph32gb9djD3WjT15e479FitW3cDyphXXvF0a81kmVb6Sc7vtXVQCKnlmGj/GDjp9BrTnUD8ulchZcXfI2uRkbtSJQBzwbel23YnKVfrFoLlU3PwT0NuVbt3MzQQ7i88vTsOIn5mztwXTx9CVZ74rjV0qC/dHc9WnHuyxLIgmjI2McXvi46nONswv4Z4M2BXtfPHd/OI1Shnf+3tKqUFnpDF9z0f
Content-ID: <9233E6366B6C7B44B2FA1EA18E680838@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6344f45-e4fd-47db-9819-08d77cb14ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 14:08:46.6503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYADh6kp3laKm2nZQRSaJbFDHYOrWvZvjTN0EcR22KuAj494WTbegaokaXsnr/ezwV1w5hztSG/kV6uTQJM1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8Pv9rEt//5mY7VBQ1ZEyoBqXBI6f8DLtt39ZBXFzOU=;
 b=ctG/EtmIhaOFguUMt6vzEYA5n5DHnU4KYnS4hw/5rh+3kq63mF/u2ZDWJpiOnS+61Lbv1pCPIozvePYxRShotxCiksABT3QVwfwgNaYpv30PWg/krN8hP03/1X5PJrdQ6+d9bZEhkF8mAnk/Ku9mD6gM6NhbkGvP8NumdhpfYQ8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: "syeh@vmware.com" <syeh@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyMDE5LTEyLTA4IGF0IDExOjUzICswMTAwLCBMdWthcyBCdWx3YWhuIHdyb3RlOg0K
PiBDb21taXQgNTA4MTA4ZWEyNzQ3ICgiZHJtL3Ztd2dmeDogRG9uJ3QgcmVmY291bnQgY29tbWFu
ZC1idWZmZXINCj4gbWFuYWdlZA0KPiByZXNvdXJjZSBsb29rdXBzIGR1cmluZyBjb21tYW5kIGJ1
ZmZlciB2YWxpZGF0aW9uIikgc2xpcHMgaW4gdXNlIG9mDQo+IGRlcHJlY2F0ZWQgUFRSX1JFVC4g
VXNlIFBUUl9FUlJfT1JfWkVSTyBpbnN0ZWFkLg0KPiANCj4gQXMgdGhlIFBUUl9FUlJfT1JfWkVS
TyBpcyBhIGJpdCBsb25nZXIgdGhhbiBQVFJfUkVULCB3ZSBpbnRyb2R1Y2UNCj4gbG9jYWwgdmFy
aWFibGUgcmV0IGZvciBwcm9wZXIgaW5kZW50YXRpb24gYW5kIGxpbmUtbGVuZ3RoIGxpbWl0cy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwu
Y29tPg0KPiAtLS0NCj4gYXBwbGllcyBjbGVhbmx5IG9uIGN1cnJlbnQgbWFzdGVyICg5NDU1ZDI1
ZjRlM2IpIGFuZCBuZXh0LTIwMTkxMjA3DQo+IGNvbXBpbGUtdGVzdGVkIG9uIHg4Nl82NF9kZWZj
b25maWcgKyBEUk1fVk1XR0ZYPXkNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9leGVjYnVmLmMgfCAyMSArKysrKysrKysrKysrKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYw0KPiBpbmRleCA5MzRhZDdjMGMzNDIuLjczNDg5YTQ1
ZGVjYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1
Zi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYw0KPiBA
QCAtMjM3Nyw5ICsyMzc3LDEyIEBAIHN0YXRpYyBpbnQNCj4gdm13X2NtZF9keF9jbGVhcl9yZW5k
ZXJ0YXJnZXRfdmlldyhzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2LA0KPiAgew0KPiAgCVZN
V19ERUNMQVJFX0NNRF9WQVIoKmNtZCwgU1ZHQTNkQ21kRFhDbGVhclJlbmRlclRhcmdldFZpZXcp
ID0NCj4gIAkJY29udGFpbmVyX29mKGhlYWRlciwgdHlwZW9mKCpjbWQpLCBoZWFkZXIpOw0KPiAr
CXN0cnVjdCB2bXdfcmVzb3VyY2UgKnJldDsNCj4gIA0KPiAtCXJldHVybiBQVFJfUkVUKHZtd192
aWV3X2lkX3ZhbF9hZGQoc3dfY29udGV4dCwgdm13X3ZpZXdfcnQsDQo+IC0JCQkJCSAgIGNtZC0N
Cj4gPmJvZHkucmVuZGVyVGFyZ2V0Vmlld0lkKSk7DQo+ICsJcmV0ID0gdm13X3ZpZXdfaWRfdmFs
X2FkZChzd19jb250ZXh0LCB2bXdfdmlld19ydCwNCj4gKwkJCQkgIGNtZC0+Ym9keS5yZW5kZXJU
YXJnZXRWaWV3SWQpOw0KPiArDQo+ICsJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhyZXQpOw0KPiAg
fQ0KPiAgDQo+ICAvKioNCj4gQEAgLTIzOTYsOSArMjM5OSwxMiBAQCBzdGF0aWMgaW50DQo+IHZt
d19jbWRfZHhfY2xlYXJfZGVwdGhzdGVuY2lsX3ZpZXcoc3RydWN0IHZtd19wcml2YXRlICpkZXZf
cHJpdiwNCj4gIHsNCj4gIAlWTVdfREVDTEFSRV9DTURfVkFSKCpjbWQsIFNWR0EzZENtZERYQ2xl
YXJEZXB0aFN0ZW5jaWxWaWV3KSA9DQo+ICAJCWNvbnRhaW5lcl9vZihoZWFkZXIsIHR5cGVvZigq
Y21kKSwgaGVhZGVyKTsNCj4gKwlzdHJ1Y3Qgdm13X3Jlc291cmNlICpyZXQ7DQo+ICsNCj4gKwly
ZXQgPSB2bXdfdmlld19pZF92YWxfYWRkKHN3X2NvbnRleHQsIHZtd192aWV3X2RzLA0KPiArCQkJ
CSAgY21kLT5ib2R5LmRlcHRoU3RlbmNpbFZpZXdJZCk7DQo+ICANCj4gLQlyZXR1cm4gUFRSX1JF
VCh2bXdfdmlld19pZF92YWxfYWRkKHN3X2NvbnRleHQsIHZtd192aWV3X2RzLA0KPiAtCQkJCQkg
ICBjbWQtDQo+ID5ib2R5LmRlcHRoU3RlbmNpbFZpZXdJZCkpOw0KPiArCXJldHVybiBQVFJfRVJS
X09SX1pFUk8ocmV0KTsNCj4gIH0NCj4gIA0KPiAgc3RhdGljIGludCB2bXdfY21kX2R4X3ZpZXdf
ZGVmaW5lKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsDQo+IEBAIC0yNzQxLDkgKzI3NDcs
MTIgQEAgc3RhdGljIGludCB2bXdfY21kX2R4X2dlbm1pcHMoc3RydWN0DQo+IHZtd19wcml2YXRl
ICpkZXZfcHJpdiwNCj4gIHsNCj4gIAlWTVdfREVDTEFSRV9DTURfVkFSKCpjbWQsIFNWR0EzZENt
ZERYR2VuTWlwcykgPQ0KPiAgCQljb250YWluZXJfb2YoaGVhZGVyLCB0eXBlb2YoKmNtZCksIGhl
YWRlcik7DQo+ICsJc3RydWN0IHZtd19yZXNvdXJjZSAqcmV0Ow0KPiArDQo+ICsJcmV0ID0gdm13
X3ZpZXdfaWRfdmFsX2FkZChzd19jb250ZXh0LCB2bXdfdmlld19zciwNCj4gKwkJCQkgIGNtZC0+
Ym9keS5zaGFkZXJSZXNvdXJjZVZpZXdJZCk7DQo+ICANCj4gLQlyZXR1cm4gUFRSX1JFVCh2bXdf
dmlld19pZF92YWxfYWRkKHN3X2NvbnRleHQsIHZtd192aWV3X3NyLA0KPiAtCQkJCQkgICBjbWQt
DQo+ID5ib2R5LnNoYWRlclJlc291cmNlVmlld0lkKSk7DQo+ICsJcmV0dXJuIFBUUl9FUlJfT1Jf
WkVSTyhyZXQpOw0KPiAgfQ0KPiAgDQo+ICAvKioNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxs
c3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4NCg0KSSB3aWxsIGluY2x1ZGUgdGhpcyBpbiB2
bXdnZngtbmV4dC4NClRoYW5rcywNClRob21hcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
