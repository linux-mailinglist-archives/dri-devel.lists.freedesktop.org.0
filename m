Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7659104C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 13:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7DA6E4BE;
	Sat, 17 Aug 2019 11:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316586E49D;
 Sat, 17 Aug 2019 11:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NovVy6nLxnaZSbhMfm25hVL6FkLoRM/A5ZO9T7TFC0xT2CUaZaGeR74C0cfXarzK20f7HT5VfoHDEXep1w4VluG4mw0MMu3TUavs6i+jGG6wPMxHSg04+FCyFUzyYRJ34GHI/IBWAkv9RUve7r/JmBzqVx+h6EYXxH/G4tlqumMVMCWbYjhy97sPwju4jb3m2chc1dAqGzzgHjo24iNJ5wbMVIYxpPktBawO6PTSZSE3KLnTCMQNpca7T4t1M9FBvJuQcqjnJx0JFKnlQOP0pu5Odd0wXoNPT+Mxa7CMEzME1OjB9BzKMDkOesYYQfS4+jZ2rY04uBIwdBvEhIBmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WooSrcXmJyrffe8mNfiV7gM0bRIRapppohTrDpeVRec=;
 b=hU8NlaSWeBquJs908CFZNw8r1bPPijeDml9LGWfPm2Q8tYwF4BKZRzO11T3RnwF2tGMHVdr9oGt4r+r//Svif7CvhKIWTo5vFTiTHGKvw/cP5vAZJG/Y2IF8kJLcTxyJdWL7ZXsEVEhiXDwJxFGFio82QAxbwvlCznR/wTfAREMlyqfXxjzgzMESr5TZmNhweNjFVN8xJDD0aDEIgQDdln6q66OjyxSzhW3rZQKauznFVYO++boDwTcLaow/zRQuEWwtqfeFGExY6orErbQrgmI67JYdqmB7U7x06Rxe7nYYgoPRyYSS/yDSUuOatp0THhIxhZOp6xHJczk0tgQoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1851.namprd12.prod.outlook.com (10.175.86.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Sat, 17 Aug 2019 11:42:49 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Sat, 17 Aug 2019
 11:42:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: Shrink size of struct dma_fence
Thread-Topic: [PATCH] dma-buf: Shrink size of struct dma_fence
Thread-Index: AQHVVPB+XPqXShDk8kqzHFQle161bqb/N+KA
Date: Sat, 17 Aug 2019 11:42:48 +0000
Message-ID: <250a96e7-6cb7-6333-055a-eb30293534bf@amd.com>
References: <20190817113947.5868-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190817113947.5868-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::16)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9285ce83-5605-4a16-05a4-08d723080757
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1851; 
x-ms-traffictypediagnostic: DM5PR12MB1851:
x-microsoft-antispam-prvs: <DM5PR12MB18519103BB492ACD6B219A4783AE0@DM5PR12MB1851.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0132C558ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(199004)(189003)(66946007)(58126008)(99286004)(476003)(8676002)(2501003)(7736002)(36756003)(25786009)(66574012)(31696002)(14454004)(66556008)(229853002)(386003)(86362001)(64756008)(46003)(6246003)(6506007)(66476007)(256004)(6512007)(478600001)(6116002)(305945005)(2616005)(446003)(11346002)(186003)(66446008)(486006)(65806001)(52116002)(316002)(65956001)(53936002)(6436002)(110136005)(102836004)(31686004)(81166006)(5660300002)(4326008)(6486002)(64126003)(8936002)(2906002)(71190400001)(71200400001)(14444005)(65826007)(81156014)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1851;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +ljmzbsUlLtdVUW/IfVjRxX8OXAY9a0SXhsJkSed25uueffVibubr1AobF77Wxmm/ECKDIBg+5RoRG2FBwWNZvg3LT3G/jB7SYYrooGrLkUF5MLLvVnYG88jC40z/XOkwmIOSXLSxAbZuJacU1s4dq/6bSJS4PwnCwktAL1VtTxQNFH8fUe6kzf34T5dYag0C8WdbYccOgRvvmrZJ//GFcuXEeH13k8HcpwbcCUqDpP0L/jCXkEH9I58AMCU4miq1k18i9TD0Pq2DblnUUFPMUJvgEYjXXohqYwVMEeIPNsmgH7ZIxfYCRlmecdJrR8Lypn+723VhymBt7UqhBVSmK6n8IX1XKyNKHBVyOKKKHnMs5X8QwlvjOKy8yuPVQsMUEl864KM4HWR1FXJBlOc2qq659Rd9Z8eLJE14+qlhk0=
x-ms-exchange-transport-forked: True
Content-ID: <2733F4FE5FEB994B9EFCE5D79845850E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9285ce83-5605-4a16-05a4-08d723080757
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2019 11:42:49.0026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JM7YYd/MKmH9vuL1MMRRPUrBlvzN3uzJnwKnucv3Q/zYk0wyLiaKYJraNvTp2i65
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WooSrcXmJyrffe8mNfiV7gM0bRIRapppohTrDpeVRec=;
 b=GWu6i6rnCYS5lPrNb8bMofjqZpjAWVyxZ3MkUTVT5a/Wcbw4ROdBJSmwjTZzm+5HoYqMdApjec0C2/RRksY1IAYCM0XEN5ZPG7ASgnYGary8/i6Ay7TPebJRty+AxeQxesn0sUpjtXjMBQhI/UWgtLKxgO8++ybAFQdrDnorZpk=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDguMTkgdW0gMTM6Mzkgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFJlYXJyYW5nZSB0
aGUgY291cGxlIG9mIDMyLWJpdCBhdG9taWNzIGhpZGRlbiBhbW9uZ3N0IHRoZSBmaWVsZCBvZg0K
PiBwb2ludGVycyB0aGF0IHVubmVjZXNzYXJpbHkgY2F1c2VkIHRoZSBjb21waWxlciB0byBpbnNl
cnQgc29tZSBwYWRkaW5nLA0KPiBzaHJpbmtzIHRoZSBzaXplIG9mIHRoZSBiYXNlIHN0cnVjdCBk
bWFfZmVuY2UgZnJvbSA4MCB0byA3MiBieXRlcyBvbg0KPiB4ODYtNjQuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0KPiBDYzogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpCVFc6IFdlIGNv
dWxkIGFsc28gcHV0IHRoZSB0aW1lc3RhbXAgaW4gdGhlIHVuaW9uIGlmIHdlIHdhbnQuDQoNCkUu
Zy4gdGhlIGNiX2xpc3Qgc2hvdWxkIG9ubHkgYmUgdXNlZCB3aGlsZSB0aGUgZmVuY2UgaXMgdW5z
aWduYWxlZCwgdGhlIA0KdGltZXN0YW1wIHdoaWxlIGl0IGlzIHNpZ25hbGVkIGFuZCB0aGUgcmN1
IHdoaWxlIGl0IGlzIGZyZWVkLg0KDQpXb3VsZCBzYXZlIGFub3RoZXIgOCBieXRlcywgYnJpbmdp
bmcgdXMgZG93biB0byA2NC4NCg0KQ2hyaXN0aWFuLg0KDQo+IC0tLQ0KPiAgIGluY2x1ZGUvbGlu
dXgvZG1hLWZlbmNlLmggfCA2ICsrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rt
YS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaA0KPiBpbmRleCA0MDRhYTc0OGVk
YTYuLjJjZTRkODc3ZDMzZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2Uu
aA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oDQo+IEBAIC02Myw3ICs2Myw3IEBA
IHN0cnVjdCBkbWFfZmVuY2VfY2I7DQo+ICAgICogYmVlbiBjb21wbGV0ZWQsIG9yIG5ldmVyIGNh
bGxlZCBhdCBhbGwuDQo+ICAgICovDQo+ICAgc3RydWN0IGRtYV9mZW5jZSB7DQo+IC0Jc3RydWN0
IGtyZWYgcmVmY291bnQ7DQo+ICsJc3BpbmxvY2tfdCAqbG9jazsNCj4gICAJY29uc3Qgc3RydWN0
IGRtYV9mZW5jZV9vcHMgKm9wczsNCj4gICAJLyogV2UgY2xlYXIgdGhlIGNhbGxiYWNrIGxpc3Qg
b24ga3JlZl9wdXQgc28gdGhhdCBieSB0aGUgdGltZSB3ZQ0KPiAgIAkgKiByZWxlYXNlIHRoZSBm
ZW5jZSBpdCBpcyB1bnVzZWQuIE5vIG9uZSBzaG91bGQgYmUgYWRkaW5nIHRvIHRoZSBjYl9saXN0
DQo+IEBAIC03MywxMSArNzMsMTEgQEAgc3RydWN0IGRtYV9mZW5jZSB7DQo+ICAgCQlzdHJ1Y3Qg
cmN1X2hlYWQgcmN1Ow0KPiAgIAkJc3RydWN0IGxpc3RfaGVhZCBjYl9saXN0Ow0KPiAgIAl9Ow0K
PiAtCXNwaW5sb2NrX3QgKmxvY2s7DQo+ICAgCXU2NCBjb250ZXh0Ow0KPiAgIAl1NjQgc2Vxbm87
DQo+IC0JdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gICAJa3RpbWVfdCB0aW1lc3RhbXA7DQo+ICsJ
dW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKwlzdHJ1Y3Qga3JlZiByZWZjb3VudDsNCj4gICAJaW50
IGVycm9yOw0KPiAgIH07DQo+ICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
