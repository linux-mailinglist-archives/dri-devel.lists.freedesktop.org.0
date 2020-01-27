Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E737A14B0E8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2E6ED04;
	Tue, 28 Jan 2020 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130071.outbound.protection.outlook.com [40.107.13.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C446EB3F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 12:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSQV/wf3ou9OLosSaqmY6fnkDK8sqnaku1NR5s4hba+d/phxlgcgrnA/mG9H6FVV0Or+UwhPeKACLmVNVevorpGLVid1ckTBuITSeInit01Rep1ecRLHH5hfXAgvex3I3xUiiKFyF9IBmSAFoJ+LPiG4rAnsp2BM/1HrR0WDujFkikDN8GU/eq9bybxCzTnEUjLdwRmZn6QaLEjsZJK53E+ALC0XsoskY/nhnjmTYE2CdZwI1CTh7dwh6unzFHSaGtIPZaqdPRyMYOvzubS8jr21aCpq7zNUKgj1DH9XUDYRkgQkYk4zE3C34Aqo5iuYD49d5xAl469/sFAKpcGv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PBREeWnhMANSblFxN6x/xKGTIEWmLi1PRBmXTwiPzY=;
 b=QC4mSlM6fk51QGVonUtkqGWPpE0xeyyGMwRRczJ3XrfExytS9FeeVCMf/YUYWHJ0EJvy67YoB7KtmsgkB7QItvX0cJljR8rbq4RfTMXIGUvvWTJnjxaUTryEadrCe3GDZgnzRpxHBsBB48ZLOzCkpxLytCvvIg6WkYdKjp/zr93WqygpM/1cdosZFAjfOJqJ8s1jp+moDGWDFvFmLaSWoO92t9E9nHcOwE2P2UAxZbpyI/JlowRHJJTUvr5fSiKPnOCwWDLpT2mrBMV9yoYJh6nsuW+1RiHblyeNSelqkTlVNEh2iTY1DVmRNMoC2HBhsWw1AHoDL3xp+MxXJqDFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PBREeWnhMANSblFxN6x/xKGTIEWmLi1PRBmXTwiPzY=;
 b=KXScCZ+UQamA2u00g+quSyQpO8t5GlLXjKmqzlWYVdis713HHEIuI2OaNTkfjvsFnLYxOj6bB0RCQwiUTGo10RR3IlEzETlVu45F0w59d+1BBbA+Rute3E1vzRL6eYIMzFG3kt42NS+iGpX+P3TWAyk7zPaISJYskIIQ+A4ld9U=
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com (20.177.41.82) by
 AM0PR03MB6339.eurprd03.prod.outlook.com (20.179.254.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Mon, 27 Jan 2020 12:10:21 +0000
Received: from AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59]) by AM0PR03MB4516.eurprd03.prod.outlook.com
 ([fe80::a489:598f:51af:6d59%4]) with mapi id 15.20.2665.017; Mon, 27 Jan 2020
 12:10:21 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "david@lechnology.com" <david@lechnology.com>, "noralf@tronnes.org"
 <noralf@tronnes.org>, "sean@poorly.run" <sean@poorly.run>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "laurent.pinchart@ideasonboard.com"
 <laurent.pinchart@ideasonboard.com>, "emil.velikov@collabora.com"
 <emil.velikov@collabora.com>
Subject: Re: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending of
 vblank event
Thread-Topic: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending
 of vblank event
Thread-Index: AQHV0c6CEXRqkijnAkKuyerYilRMX6f+S7MAgAAjBACAAAMpAA==
Date: Mon, 27 Jan 2020 12:10:21 +0000
Message-ID: <2be16266-e9fe-e0f0-d704-59bcf34b85c5@epam.com>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
 <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>
 <514e72de-76d2-ae36-506b-57e5ba035926@suse.de>
In-Reply-To: <514e72de-76d2-ae36-506b-57e5ba035926@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53cfe16e-b843-4fdb-a012-08d7a321e1bb
x-ms-traffictypediagnostic: AM0PR03MB6339:
x-microsoft-antispam-prvs: <AM0PR03MB6339AFED9F27E7751105BED7E70B0@AM0PR03MB6339.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(189003)(199004)(316002)(53546011)(6506007)(2906002)(81156014)(81166006)(55236004)(6486002)(31686004)(6512007)(86362001)(31696002)(36756003)(8676002)(71200400001)(478600001)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(7416002)(4326008)(5660300002)(54906003)(2616005)(110136005)(8936002)(186003)(26005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6339;
 H:AM0PR03MB4516.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PsY6Z6S198SwwJM5RphHxmPcLw/q1FUvQ6z4my0bYPS6Tj6r2zA1GqhtKGW2QG+Loe0iAP8eQ8br/OMmZWfbILCG5KcMRZHpG4oWnzkI4GCRjxCkGisKSqRms94ke5wVfuKq82ZM27XrBuW/gUe+LpEGW0sRoiT+acXRlnyPwSWbAXKuGZzS8AvrJ55iG76r370KgBLxioFFNMsrbbGZCMs1DRxbL0Y81uuLtNGiHYAaroqdjlXMDGirlbp41C+bAeugsZNj4PBytp5bMgc3+GEiG9nsjPOodGHnyrQmBoyNUXAWrrY82w3nD3BUg4ZylVoBptf2AxgoUnsto0qBqa0dqzk25ySMKhWcS9AD8q2oV+Q8o88B5QlwJ5b9GJB3dmXfUAtWWDxZ0JOwYWFX5+GZXT64MhzpYpiSV4DhuECU5DcPxIF7MzYlH8PRAFHSR0WAPGP0wgLOJsNcwqGL4PT9x6038ascl4Wo2YcEhul65xZGxwAg9GioR6ojKsEA
x-ms-exchange-antispam-messagedata: bMXjYmEVpPa8e8hc51hLB97B2I2O8TYViXKlZY/rnijF2QK0VqMMtefrz/hSu/301ivNUXZ3RkisuysXVj4meSUmLUEANpk5mXa3mjklpkRCoN90ElSXgCUWN6TCTBBmp5Zmxm+iADnMYzP6nKvDpA==
x-ms-exchange-transport-forked: True
Content-ID: <EF1B8595ACADED4BBB582EB0411FCA9A@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cfe16e-b843-4fdb-a012-08d7a321e1bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 12:10:21.1613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VM3Lx+P74IxNPZ9eNR4b0gTqKNte0LFItcOEXG3tKMvutpYnJnF3wt6sP6eeAWrs2yp4hj1ebQkBAdtX9Uvxnr7xKh6Lb6k0NGbeinKyyhkbAZn56HnRCdWdZZAnVqP/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6339
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDEvMjcvMjAgMTo1OSBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+IEhpDQo+
DQo+IEFtIDI3LjAxLjIwIHVtIDEwOjUzIHNjaHJpZWIgT2xla3NhbmRyIEFuZHJ1c2hjaGVua286
DQo+PiBTb3JyeSBmb3IganVtcGluZyBpbiBsYXRlDQo+Pg0KPj4gT24gMS8yMy8yMCAxMToyMSBB
TSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gVGhlIGF0b21pYyBoZWxwZXJzIGF1dG9t
YXRpY2FsbHkgc2VuZCBvdXQgZmFrZSBWQkxBTksgZXZlbnRzIGlmIG5vDQo+Pj4gdmJsYW5raW5n
IGhhcyBiZWVuIGluaXRpYWxpemVkLiBUaGlzIHdvdWxkIGFwcGx5IHRvIHhlbiwgYnV0IHhlbiBo
YXMNCj4+PiBpdHMgb3duIHZibGFuayBsb2dpYy4gVG8gYXZvaWQgaW50ZXJmZXJpbmcgd2l0aCB0
aGUgYXRvbWljIGhlbHBlcnMsDQo+Pj4gZGlzYWJsZSBhdXRvbWF0aWMgdmJsYW5rIGV2ZW50cyBl
eHBsaWN0bHkuDQo+Pj4NCj4+PiB2NDoNCj4+PiAJKiBzZXBhcmF0ZSBjb21taXQgZnJvbSBjb3Jl
IHZibGFuayBjaGFuZ2VzDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+PiBBY2tlZC1ieTogR2VyZCBIb2ZmbWFubiA8a3Jh
eGVsQHJlZGhhdC5jb20+DQo+PiBSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+PiAtLS0NCj4+PiAgICBk
cml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgfCAxMyArKysrKysrKysrKysr
DQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgYi9kcml2ZXJz
L2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMNCj4+PiBpbmRleCA0ZjM0YzUyMDgxODAu
LmVmZGU0NTYxODM2ZiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnRfa21zLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnRfa21zLmMNCj4+PiBAQCAtMjIwLDYgKzIyMCwxOCBAQCBzdGF0aWMgYm9vbCBkaXNwbGF5X3Nl
bmRfcGFnZV9mbGlwKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4+PiAg
ICAJcmV0dXJuIGZhbHNlOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiArc3RhdGljIGludCBkaXNw
bGF5X2NoZWNrKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4+PiArCQkJ
IHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlLA0KPj4+ICsJCQkgc3RydWN0IGRy
bV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPj4+ICt7DQo+Pj4gKwkvKiBNYWtlIHN1cmUgdGhh
dCBEUk0gaGVscGVycyBkb24ndCBzZW5kIFZCTEFOSyBldmVudHMNCj4+IENvdWxkIHlvdSBwbGVh
c2UgcHV0IHRoZSBjb21tZW50IG9uIGEgc2VwYXJhdGUgbGluZT8NCj4gWW91IG1lYW4gdG8gYWRk
IGFuIGVtcHR5IGxpbmUgYmV0d2VlbiBjb21tZW50IGFuZCBjb2RlPw0KPg0KSnVzdCBsaWtlDQov
Kg0KIMKgKiBNYWtlIHN1cmUuLi4NCj4+PiArCSAqIGF1dG9tYXRpY2FsbHkuIFhlbiBoYXMgaXQn
cyBvd24gbG9naWMgdG8gZG8gc28uDQo+Pj4gKwkgKi8NCj4+PiArCWNydGNfc3RhdGUtPm5vX3Zi
bGFuayA9IGZhbHNlOw0KPj4gQW5kIGl0IGlzIHN0aWxsIGNvbmZ1c2luZywgZS5nLiBjb21tZW50
IHNheXMNCj4+ICJNYWtlIHN1cmUgdGhhdCBEUk0gaGVscGVycyBkb24ndCBzZW5kIFZCTEFOSyIN
Cj4+IGFuZCB3ZSBzZXQgIm5vX3ZibGFuayIgZmxhZyB0byBmYWxzZS4uLg0KPiBJJ2xsIHJlcGhy
YXNlIGFuZCBhZGQgc29tZSBtb3JlIGNvbnRleHQuDQpUaGFuayB5b3UNCj4NCj4gQmVzdCByZWdh
cmRzDQo+IFRob21hcw0KPg0KPj4+ICsNCj4+PiArCXJldHVybiAwOw0KPj4+ICt9DQo+Pj4gKw0K
Pj4+ICAgIHN0YXRpYyB2b2lkIGRpc3BsYXlfdXBkYXRlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3Bs
YXlfcGlwZSAqcGlwZSwNCj4+PiAgICAJCQkgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpvbGRf
cGxhbmVfc3RhdGUpDQo+Pj4gICAgew0KPj4+IEBAIC0yODQsNiArMjk2LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyBkaXNwbGF5X2Z1bmNzID0g
ew0KPj4+ICAgIAkuZW5hYmxlID0gZGlzcGxheV9lbmFibGUsDQo+Pj4gICAgCS5kaXNhYmxlID0g
ZGlzcGxheV9kaXNhYmxlLA0KPj4+ICAgIAkucHJlcGFyZV9mYiA9IGRybV9nZW1fZmJfc2ltcGxl
X2Rpc3BsYXlfcGlwZV9wcmVwYXJlX2ZiLA0KPj4+ICsJLmNoZWNrID0gZGlzcGxheV9jaGVjaywN
Cj4+PiAgICAJLnVwZGF0ZSA9IGRpc3BsYXlfdXBkYXRlLA0KPj4+ICAgIH07DQo+Pj4gICAgDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
