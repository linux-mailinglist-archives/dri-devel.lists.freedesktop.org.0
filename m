Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E00C9026
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 19:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758276E0E6;
	Wed,  2 Oct 2019 17:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740072.outbound.protection.outlook.com [40.107.74.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AF889B0C;
 Wed,  2 Oct 2019 17:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+QznKLNa1cOWxnkM37p9nWtGDmzm+WAuwNzzKgrtMTJpzhrzh4q2h3EuGTd/Q6xryM0IHKejbzKMAOocs7eQhuxD4S7rMuI0iJjWw4jQSRr3y/hOpc6FwQyRSlEapiUDOYetFEjukbDRncuQe24Tg0otKpPvXdR181ke+qDaTX7/pt+CFKrqhCMTxOzyL7A1kMgDNAaWWz3KVWmhaF3muIkrWgSQRlXK4szJ5gSxv5uMuKzRA8SDElg20Eli/eLzWvv2Xpn9gCYmwAhCNB+lxGBklUXQKc6kVvK58z2+Zi9JnP8ArsFLfy557hWHpkW+hnmckngCnuSRhhA6cAhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HyCpG0mUippargYUQ0zLCHLI85Z2q06X3JMzLQKNHw=;
 b=PMmNduGGOgDM9YLdJQozsAytc1puzDJAYuRvbyRqLFuYhZc5qqj66UYJGQB+ijQe6yp9b0BlyOWNTVq8cKyQ34zxnBU2nIw0ruqyzG9k1EHW8QNWvFrU3ssSGFFl/l+pXk15MSaT6xk/e5JBpdRbZD4PAJNLE9/1n3hfwU+qDMFtEbwKFqan5P/KsBp/Rp3IIH6O1+SHRcnMexRm6eRCZ6U+F6JqZ2uNTiBGZhnXgeZO3UnK0i1u5np38BvGghRryh0qayxD84QE8ZqJIBprztqhy6iqpC2APt3trRlZWMPR61AhWO3vxvMiCLogtupIRoY9okyBkK30oish2XoKZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3328.namprd12.prod.outlook.com (20.178.240.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 17:46:18 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:46:18 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/ttm: also export ttm_bo_vm_fault
Thread-Topic: [PATCH 1/2] drm/ttm: also export ttm_bo_vm_fault
Thread-Index: AQHVdS/qjrx7xt/MLU63RAUHhWfHXadHDyCAgACYlgA=
Date: Wed, 2 Oct 2019 17:46:18 +0000
Message-ID: <MN2PR12MB33095356AB2BAAB358F1255AEC9C0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190927123425.17513-1-christian.koenig@amd.com>
 <8758219e-884d-1205-f2e0-7e304049707a@gmail.com>
In-Reply-To: <8758219e-884d-1205-f2e0-7e304049707a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [201.175.203.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 234b97ae-16b1-4c63-2b12-08d747606e44
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3328:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3328DC973F9212129EFD4A77EC9C0@MN2PR12MB3328.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(13464003)(199004)(189003)(3846002)(486006)(26005)(66574012)(476003)(5660300002)(102836004)(2201001)(6116002)(11346002)(76176011)(446003)(186003)(99286004)(14444005)(256004)(76116006)(25786009)(52536014)(14454004)(7696005)(53546011)(6506007)(478600001)(966005)(66446008)(86362001)(2906002)(64756008)(66556008)(66476007)(110136005)(7736002)(74316002)(305945005)(33656002)(66946007)(9686003)(229853002)(55016002)(6306002)(316002)(6436002)(71200400001)(8936002)(71190400001)(8676002)(81156014)(6246003)(81166006)(2501003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3328;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E6SA6GTPzQZ6jL7K9Q02+te02K/2wWiDFIUnNydyMMbo9liDbYsFtuq69Txgj413Nb3fl0ziKh5HE1kM7YQGmUJ11n5opx4DXJgolQE88CHqwsSUJIa585tF0PrInugUhJKxp7hEBtnQzAdnvvrDivFQXw06Cx2GOSEMozgFQ6kJL54Yd8MprG8Kd+Qrl6CjDoIU41KqOr1PXpE0lrJH+Iv5GE7Fna0RpJxoFcwlHiizR7pPeYSysAPQ3o8sOrDhfBan/hcj931FYCXs03GwU+7NiY36yHUUOcSJgKUB0LdD8G38vdQufsvmELs0Gz96jox6qMgdv15EATVIGzn7Z67pMdD2qB1MMkCV97D6vzBSzvNNpJPUavFmiR+k7GjQcg+0csmeXzWGz4GT3df1PSeYnDTvLsIVnFY/8BMdGAz7q6CbT7E4++K70pPswHVNBk21vGbud8BkfglxK+pyjw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234b97ae-16b1-4c63-2b12-08d747606e44
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:46:18.6689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1SlIJrWymBlNhIBtnEUGkmXbRxETSA7RDMrq+5WQ1ofHthoQ2v2o1Wpt8IYbkWW6JdqJ0EAas3rQ23hZGzSf+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3328
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HyCpG0mUippargYUQ0zLCHLI85Z2q06X3JMzLQKNHw=;
 b=hjuEi8ylZ3Ie3pXOIx1uGX+7DfXKTyBuQDM5Skvb93XNSitcxnod8Q9haPJCoCXKALPtJ9QdT+Ty3srYsDyk2+bZjyvQKQ/+nHlGZgq2rOzA0w8dfBLsYdN7/+zTsxAlhbj6948df8NIyrr1MV0q5CgMSo3Kp9rw+VwTtAbZIB0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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

QWhoLiDwn5iKDQoNClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIENocmlzdGlhbiBLw7ZuaWcN
ClNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyLCAyMDE5IDQ6MzggQU0NClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3Vi
amVjdDogUmU6IFtQQVRDSCAxLzJdIGRybS90dG06IGFsc28gZXhwb3J0IHR0bV9ib192bV9mYXVs
dA0KDQpKdXN0IGEgZ2VudGxlIHBpbmcgb24gdGhpcy4gRXZlcnlib2R5IG9uIFhEQywgb3IgY2Fu
IHdlIGdldCB0aGlzIGNvbWl0dGVkPw0KDQpBbSAyNy4wOS4xOSB1bSAxNDozNCBzY2hyaWViIENo
cmlzdGlhbiBLw7ZuaWc6DQo+IFRoYXQgaXMgbmVlZGVkIGJ5IGF0IGxlYXN0IGEgY2xlYW51cCBp
biByYWRlb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYyB8IDMgKystDQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICB8IDIgKysN
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyANCj4gYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGluZGV4IGNiMzEyMGNkNWFhMS4uNTI1MDQ2YmJj
YjZiIA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jDQo+IEBAIC0zMTYsNyArMzE2
LDcgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0
ICp2bWYsDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVk
KTsNCj4gICANCj4gLXN0YXRpYyB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdChzdHJ1Y3Qgdm1f
ZmF1bHQgKnZtZikNCj4gK3ZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVs
dCAqdm1mKQ0KPiAgIHsNCj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZt
YTsNCj4gICAJcGdwcm90X3QgcHJvdDsNCj4gQEAgLTMzNiw2ICszMzYsNyBAQCBzdGF0aWMgdm1f
ZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0IA0KPiAqdm1mKQ0KPiAgIA0K
PiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gK0VYUE9SVF9TWU1CT0wodHRtX2JvX3ZtX2ZhdWx0
KTsNCj4gICANCj4gICB2b2lkIHR0bV9ib192bV9vcGVuKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKQ0KPiAgIHsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgg
DQo+IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBpbmRleCA4NTEyNjBjYmJiMmYuLmRh
ZDQxY2Y1Y2Q2NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaA0K
PiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oDQo+IEBAIC03OTYsNiArNzk2LDgg
QEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2
bWYsDQo+ICAgCQkJCSAgICBwZ3Byb3RfdCBwcm90LA0KPiAgIAkJCQkgICAgcGdvZmZfdCBudW1f
cHJlZmF1bHQpOw0KPiAgIA0KPiArdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZt
X2ZhdWx0ICp2bWYpOw0KPiArDQo+ICAgdm9pZCB0dG1fYm9fdm1fb3BlbihzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSk7DQo+ICAgDQo+ICAgdm9pZCB0dG1fYm9fdm1fY2xvc2Uoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpOw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
