Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD0F25A2B1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 03:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305136E12F;
	Wed,  2 Sep 2020 01:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DA36E081;
 Wed,  2 Sep 2020 01:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVro9XN24LdkcXBTIuRhSJZ+2fueKPterZ0p9GaAcrf8+j5NowIyH9pd17k/dpsdOQNAYU68B9Jwa6XJWUvtUJro8X3UZM9+nQcXRutgTrQ8V8LDrdoSREQVzIoVT3RbDoD4doYYAH+YL05J+b7DcXQ4oml2LhP9u0o9UkDkWZJ+GZOSJ2zKPtCnIpkSsTNmTEYaiDokuGGaaLMFQX9NmU6BkaaX+LrKtx5lSzY3j+S9wn+bKfz37Af5b7AatkQMwqsNhPGEMTNaelzBXy0t8trQ1o6IkpGqIa7STciYf5FXSiNGE6yccn+PF/oY3OLb1lnZfhjMyrjXIZeBLAsTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhJGUrhRokK6q2bVZoSIFchjjt5qY2uvTodz/E82ftI=;
 b=izMtzS+J8W5Kvu/hxOhGfrGe4blyYDNgmHiDuonWw+iDehC3qoHZjlH4rAYuCbW1lUkA5Q5ukPFUeoAohv/RPgBW1HT9obhcDc/gzzpIggtVOnjdEHur2UhCL21BVd6xgHfRxTccDrYv3Iv1mdUp7glaucfRJM/JdR/Mnu7QtQfVDqCtKewNofzWmgvdiYCX9n4m/H56ZYHqEe75WxX3Co67xi0YFY5qRf6dz8DdM1vzNXP/WSKABC+wY00W1Rm0l/KPn7jlY29PldnzqzwZNfttYUirmXNKO1w7W2wG20z5upl9qeZ1e4HTlVCPWSvKln3MfUM3jA7loIxOuoUBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhJGUrhRokK6q2bVZoSIFchjjt5qY2uvTodz/E82ftI=;
 b=b/2f1AgcubhbkNbsUgpgLj/KNj+hIWyTDkMoCZZjjhdsRFYgfLVc7exPeKnVI6Jp8mZu4pCa1++n2zSDaeqbSOPzBhcOxDyOle5GC/HjfS7948QjrQxLogVvhqabkzdH3I6PoRW8PWAlJk153YRmtp36kQx+kRBjGm0jNMPQHYQ=
Received: from SN1PR12MB2558.namprd12.prod.outlook.com (2603:10b6:802:2b::18)
 by SN1PR12MB2526.namprd12.prod.outlook.com (2603:10b6:802:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.25; Wed, 2 Sep
 2020 01:42:02 +0000
Received: from SN1PR12MB2558.namprd12.prod.outlook.com
 ([fe80::c8c0:9bc9:57ed:cb03]) by SN1PR12MB2558.namprd12.prod.outlook.com
 ([fe80::c8c0:9bc9:57ed:cb03%3]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:42:02 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] Use implicit kref infra
Thread-Topic: [PATCH 0/3] Use implicit kref infra
Thread-Index: AQHWgMVm4VmjNCzrokOopbrU1yOKNqlVGRKA
Date: Wed, 2 Sep 2020 01:42:02 +0000
Message-ID: <BDD53312-3A34-4761-A7C3-6FDFE66A6C1F@amd.com>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
In-Reply-To: <20200902010645.26943-1-luben.tuikov@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3fe8ce5d-02fa-471f-57e6-08d84ee1643d
x-ms-traffictypediagnostic: SN1PR12MB2526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB25268D0F6F9DCE7925A7F5F5872F0@SN1PR12MB2526.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 96L4U7M/jMr5OnT1CyTirq56c/XRfmg8zZYA1GH2/iAdD9MFlq+lvIaKuUmbkb9AgpdeGiohyYaf7kcwwBOKbjQZU2WUddbqvJLbX2/KlE7jz5ABCOxj5X+waQaYtxm/dvrPeNHvcScTpSBH2YWPh53WfFnc6BlcqAz5aJGRNQzjrizBJx0OgLfWQ4/P17o6p7UmEWUSs7P+JnwsEhHH93rR/pYrUzzFRCU0EYmX0mjynCiSHGvsQ36X9UsMWwns/iTJMP5hXz/6m6VF2HvBIl1DEcYReitxwdPF8er+536DiqVH79GJz5cM4JIoYUxSmf09y7n9/kN1Ngh43tekWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2558.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(2906002)(6486002)(71200400001)(316002)(83380400001)(33656002)(478600001)(54906003)(186003)(26005)(2616005)(66446008)(36756003)(86362001)(8676002)(6506007)(4326008)(5660300002)(6512007)(66946007)(91956017)(110136005)(64756008)(66556008)(8936002)(76116006)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4uycLIQy+l/llrjav3N7RDz0tdWTLFPw9XZTaakN3FGhbfyiVMJxdCadov+bClkM4XKCgmb4wi4Iqtk0A+GDLk2PQt0xCwQdb7Py1ll/uc8/qXW09Sl2VtJeFGjsFidz6hWqT2m6cMMCodVh8VGnnIRZSVEja1vRNGrvWAyvgXcKXBempn96icm19PHD9amray7gVp7Wb2OStmUWiDuj/NgDQYvk8I/GpdIjmhSko0yxkU8i3EfA0zNTsIZLiZTcDe5SxO1O4VSGVFEEjCElO7+CAlhyKOCYJkCtXOHM1+i6vtVVLL37Mzlkawj0dNMbyaC+RVKl7ASfDeP+FZ8SOshze5JwHW/WL+X6yq83IP58BRjzaWx8kEDYgbXljYsasoEtwBYFYaJ1gL5oLWETEd6DpMTL0Yw99nIaqzC/pTnl9jd+XjHoGVfUojx2hrZNDLj3XZrR708zAiXhuAdgymggiuAESfqyzzILKoD19l+kTskbn3snWIN4Bys6DMv4GsABsc8YliCkBJ3bpZLyrad0DuucrIJnaoNyi6krNBSz8YPo8+zqjZgiAIwwuXh0K3B6lNQJ6w6PfzQfjhLZBn9wmnN7QlBaPsd5wast5/Ff/Pw9efmfzhdj80SxeARpeqniOPBbdSdPs1WkG0bRvA==
Content-ID: <C64563929AB37C49BB9CB2D52C63DBE4@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2558.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe8ce5d-02fa-471f-57e6-08d84ee1643d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 01:42:02.7566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQSnxzVNvDXMswfVxf2NE191gH9av5fA7KEC2RfwCQ3UKi72fVg0i94c5ReF0l3W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2526
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgeW91IHRha2UgYSBsb29rIGF0IHRoZSBiZWxvdyBmdW5jdGlvbiwgeW91IHNob3VsZCBub3Qg
dXNlIGRyaXZlcidzIHJlbGVhc2UgdG8gZnJlZSBhZGV2LiBBcyBkZXYgaXMgZW1iZWRkZWQgaW4g
YWRldi4NCg0KIDgwOSBzdGF0aWMgdm9pZCBkcm1fZGV2X3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJl
ZikNCiA4MTAgew0KIDgxMSAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjb250YWlu
ZXJfb2YocmVmLCBzdHJ1Y3QgZHJtX2RldmljZSwgcmVmKTsNCiA4MTIgICAgICAgIA0KIDgxMyAg
ICAgICAgIGlmIChkZXYtPmRyaXZlci0+cmVsZWFzZSkNCiA4MTQgICAgICAgICAgICAgICAgIGRl
di0+ZHJpdmVyLT5yZWxlYXNlKGRldik7DQogODE1IA0KIDgxNiAgICAgICAgIGRybV9tYW5hZ2Vk
X3JlbGVhc2UoZGV2KTsNCiA4MTcgDQogODE4ICAgICAgICAga2ZyZWUoZGV2LT5tYW5hZ2VkLmZp
bmFsX2tmcmVlKTsNCiA4MTkgfQ0KDQpZb3UgaGF2ZSB0byBtYWtlIGFub3RoZXIgY2hhbmdlIHNv
bWV0aGluZyBsaWtlDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMNCmluZGV4IDEzMDY4ZmRmNDMzMS4uMmFhYmQyYjRjNjNi
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kcnYuYw0KQEAgLTgxNSw3ICs4MTUsOCBAQCBzdGF0aWMgdm9pZCBkcm1fZGV2
X3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJlZikNCiANCiAgICAgICAgZHJtX21hbmFnZWRfcmVsZWFz
ZShkZXYpOw0KIA0KLSAgICAgICBrZnJlZShkZXYtPm1hbmFnZWQuZmluYWxfa2ZyZWUpOw0KKyAg
ICAgICBpZiAoZGV2LT5kcml2ZXItPmZpbmFsX3JlbGVhc2UpDQorICAgICAgICAgICAgICAgZGV2
LT5kcml2ZXItPmZpbmFsX3JlbGVhc2UoZGV2KTsNCiB9DQoNCkFuZCBpbiB0aGUgZmluYWxfcmVs
ZWFzZSBjYWxsYmFjayB3ZSBmcmVlIHRoZSBkZXYuIEJ1dCB0aGF0IGlzIGEgbGl0dGxlIGNvbXBs
ZXggbm93LiBzbyBJIHByZWZlciBzdGlsbCB1c2luZyBmaW5hbF9rZnJlZS4NCk9mIGNvdXJzZSB3
ZSBjYW4gZG8gc29tZSBjbGVhbnVwIHdvcmsgaW4gdGhlIGRyaXZlcidzIHJlbGVhc2UgY2FsbGJh
Y2suIEJVVCBubyBrZnJlZS4NCg0K77u/LS0tLS3ljp/lp4vpgq7ku7YtLS0tLQ0K5Y+R5Lu25Lq6
OiAiVHVpa292LCBMdWJlbiIgPEx1YmVuLlR1aWtvdkBhbWQuY29tPg0K5pel5pyfOiAyMDIw5bm0
OeaciDLml6Ug5pif5pyf5LiJIDA5OjA3DQrmlLbku7bkuro6ICJhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZyIgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiwgImRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmciIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPg0K
5oqE6YCBOiAiRGV1Y2hlciwgQWxleGFuZGVyIiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4s
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4sICJQYW4sIFhpbmh1aSIgPFhpbmh1aS5Q
YW5AYW1kLmNvbT4sICJUdWlrb3YsIEx1YmVuIiA8THViZW4uVHVpa292QGFtZC5jb20+DQrkuLvp
opg6IFtQQVRDSCAwLzNdIFVzZSBpbXBsaWNpdCBrcmVmIGluZnJhDQoNCiAgICBVc2UgdGhlIGlt
cGxpY2l0IGtyZWYgaW5mcmFzdHJ1Y3R1cmUgdG8gZnJlZSB0aGUgY29udGFpbmVyDQogICAgc3Ry
dWN0IGFtZGdwdV9kZXZpY2UsIGNvbnRhaW5lciBvZiBzdHJ1Y3QgZHJtX2RldmljZS4NCiAgICAN
CiAgICBGaXJzdCwgaW4gZHJtX2Rldl9yZWdpc3RlcigpLCBkbyBub3QgaW5kaXNjcmltaW5hdGVs
eSB3YXJuDQogICAgd2hlbiBhIERSTSBkcml2ZXIgaGFzbid0IG9wdGVkIGZvciBtYW5hZ2VkLmZp
bmFsX2tmcmVlLA0KICAgIGJ1dCBpbnN0ZWFkIGNoZWNrIGlmIHRoZSBkcml2ZXIgaGFzIHByb3Zp
ZGVkIGl0cyBvd24NCiAgICAicmVsZWFzZSIgZnVuY3Rpb24gY2FsbGJhY2sgaW4gdGhlIERSTSBk
cml2ZXIgc3RydWN0dXJlLg0KICAgIElmIHRoYXQgaXMgdGhlIGNhc2UsIG5vIHdhcm5pbmcuDQog
ICAgDQogICAgUmVtb3ZlIGRybW1fYWRkX2ZpbmFsX2tmcmVlKCkuIFdlIHRha2UgY2FyZSBvZiB0
aGF0LCBpbiB0aGUNCiAgICBrcmVmICJyZWxlYXNlIiBjYWxsYmFjayB3aGVuIGFsbCByZWZzIGFy
ZSBkb3duIHRvIDAsIHZpYQ0KICAgIGRybV9kZXZfcHV0KCksIGkuZS4gdGhlIGZyZWUgaXMgaW1w
bGljaXQuDQogICAgDQogICAgUmVtb3ZlIHN1cGVyZmx1b3VzIE5VTEwgY2hlY2ssIHNpbmNlIHRo
ZSBEUk0gZGV2aWNlIHRvIGJlDQogICAgc3VzcGVuZGVkIGFsd2F5cyBleGlzdHMsIHNvIGxvbmcg
YXMgdGhlIHVuZGVybHlpbmcgUENJIGFuZA0KICAgIERSTSBkZXZpY2VzIGV4aXN0Lg0KICAgIA0K
ICAgIEx1YmVuIFR1aWtvdiAoMyk6DQogICAgICBkcm06IE5vIHdhcm4gZm9yIGRyaXZlcnMgd2hv
IHByb3ZpZGUgcmVsZWFzZQ0KICAgICAgZHJtL2FtZGdwdTogUmVtb3ZlIGRybW0gZmluYWwgZnJl
ZQ0KICAgICAgZHJtL2FtZGdwdTogUmVtb3ZlIHN1cGVyZmx1b3VzIE5VTEwgY2hlY2sNCiAgICAN
CiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMyAtLS0N
CiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgMiAtLQ0K
ICAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgICAgICAgICAgICAgICAgfCAzICsrLQ0K
ICAgICAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCiAg
ICANCiAgICAtLSANCiAgICAyLjI4LjAuMzk0LmdlMTk3MTM2Mzg5DQogICAgDQogICAgDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
