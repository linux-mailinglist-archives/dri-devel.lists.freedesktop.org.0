Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6BE2073C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 14:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7E1894FE;
	Thu, 16 May 2019 12:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20070.outbound.protection.outlook.com [40.107.2.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94830894FE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 12:48:43 +0000 (UTC)
Received: from AM0PR08MB3891.eurprd08.prod.outlook.com (20.178.82.147) by
 AM0PR08MB3875.eurprd08.prod.outlook.com (20.178.23.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 12:48:41 +0000
Received: from AM0PR08MB3891.eurprd08.prod.outlook.com
 ([fe80::edcb:1ae:f84c:422a]) by AM0PR08MB3891.eurprd08.prod.outlook.com
 ([fe80::edcb:1ae:f84c:422a%2]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 12:48:40 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [RFC PATCH v2] drm/komeda: fixing of DMA mapping sg segment
 warning
Thread-Topic: [RFC PATCH v2] drm/komeda: fixing of DMA mapping sg segment
 warning
Thread-Index: AQHU6s5KQMOVm+DvoUynXnNB4vwxrKZt9cIA
Date: Thu, 16 May 2019 12:48:40 +0000
Message-ID: <20190516124840.GB1372@arm.com>
References: <1554372474-3594-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1554372474-3594-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::14) To AM0PR08MB3891.eurprd08.prod.outlook.com
 (2603:10a6:208:109::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 865b16bc-2545-41c5-4403-08d6d9fcd27e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3875; 
x-ms-traffictypediagnostic: AM0PR08MB3875:
x-ms-exchange-purlcount: 4
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3875AC1DC0C04B798C2C72CDE40A0@AM0PR08MB3875.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(376002)(366004)(136003)(189003)(199004)(6246003)(6486002)(229853002)(36756003)(6862004)(53936002)(1076003)(2906002)(305945005)(8936002)(6306002)(6512007)(4326008)(6436002)(3846002)(81156014)(6636002)(86362001)(25786009)(71200400001)(71190400001)(68736007)(81166006)(8676002)(66946007)(66556008)(66476007)(73956011)(66446008)(64756008)(5660300002)(76176011)(44832011)(486006)(478600001)(316002)(99286004)(37006003)(2616005)(26005)(386003)(72206003)(6506007)(14454004)(54906003)(7736002)(11346002)(102836004)(14444005)(256004)(446003)(966005)(66066001)(6116002)(476003)(33656002)(52116002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3875;
 H:AM0PR08MB3891.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xBgPsWbqzODh/pz67yTc3sboZ9bAUn1sbvz2iLjcbWqsqj5BcBIuz3JVVhXqOFfUya0leF/g50tyI+iyHCV1onCvPrsUwbPjTFxklQ7dN5sVUoEgC9MlWtiDWMNMf9oZJ+C4vDDQ3i3TVkEgad1CTR+eCp/V/CqRZmDTkMO3V5mwvihuCf8Jh4c1rSO3xEES5eu6NtYbA4Z7l8mq3lLFfV/JNHnZRdXWW0diPw+rkjD8LLJOk6ybO9APfSemwyEzaNZDLhtsEq5Br+ZLcOUVmEjc12RIbOYzhyqIJRTy9upguYH2O/5WOuaqtoVnoCmxMBvHCGdj9Ovmcej3utYCsCBOHxcIA74vUTs1xV0aHMKTG85BuQm5kKt0Ry4u7kPmAvABvrL1EfMIeyklh1hN1IPTrI4RLf9ZeFOZs1Idnsk=
Content-ID: <866B84B82452A74C8215892894D68D1B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865b16bc-2545-41c5-4403-08d6d9fcd27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 12:48:40.8698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mh+pJchuWpD0gBWCZ3eBM52avQiZjs5b28rDJxWEtU=;
 b=9L5nYSOPBHXgvvyGuTayiqnj5P9AsN9kwM5rzvwCANj/Zehl5fuJXUHIft9xXKDOgz/blP1aptY5muj+Q5hUvdunDuK7I8ZlsDVAr6sGdFexAFZ1aHVldY9JSE29bUUOUo3tWyDDkLdVOxDthAbzEYTyOGIa3PL6HzAMJC+/N28=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMTE6MDg6MDRBTSArMDEwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGaXhpbmcgdGhlIERNQSBtYXBwaW5nIHNnIHNlZ21l
bnQgd2FybmluZywgd2hpY2ggc2hvd3MgIkRNQS1BUEk6IG1hcHBpbmcKPiBzZyBzZWdtZW50IGxv
bmdlciB0aGFuIGRldmljZSBjbGFpbXMgdG8gc3VwcG9ydCBbbGVuPTkyMTYwMF0gW21heD02NTUz
Nl0iLgo+IEZpeGVkIGJ5IHNldHRpbmcgdGhlIG1heCBzZWdtZW50IHNpemUgYXQgS29tZWRhIGRy
aXZlci4KPiAKPiBUaGlzIHBhdGNoIGRlcGVuZHMgb246Cj4gLSBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzU0NDQ4Lwo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3Nlcmllcy81NDQ0OS8KPiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvNTQ0NTAvCj4gLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzU4OTc2Lwo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBBZGRzIG1lbWJlciBkZXNj
cmlwdGlvbgo+IC0gQWRkcyBwYXRjaCBkZW5wZW5kZW5jeSBpbiB0aGUgY29tbWVudAo+IAo+IFNp
Z25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFy
bS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5jIHwgNCArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4g
aW5kZXggN2YyNWU2YS4uYjQ5MDJhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gQEAgLTgsNiArOCw3IEBACj4gICNpbmNsdWRl
IDxsaW51eC9vZl9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1p
b21tdS5oPgo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gICNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgo+IEBAIC0yNDUsNiArMjQ2LDkg
QEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiAgCQlnb3RvIGVycl9jbGVhbnVwOwo+ICAJfQo+ICAKPiArCWRldi0+ZG1hX3Bhcm1zID0g
Jm1kZXYtPmRtYV9wYXJtczsKPiArCWRtYV9zZXRfbWF4X3NlZ19zaXplKGRldiwgRE1BX0JJVF9N
QVNLKDMyKSk7Cj4gKwo+ICAJZXJyID0gc3lzZnNfY3JlYXRlX2dyb3VwKCZkZXYtPmtvYmosICZr
b21lZGFfc3lzZnNfYXR0cl9ncm91cCk7Cj4gIAlpZiAoZXJyKSB7Cj4gIAkJRFJNX0VSUk9SKCJj
cmVhdGUgc3lzZnMgZ3JvdXAgZmFpbGVkLlxuIik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBpbmRleCAyOWUwM2M0Li44M2FjZTcxIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmgKPiBAQCAtMTQ5LDYgKzE0OSw4IEBAIHN0cnVjdCBrb21lZGFfZGV2IHsKPiAgCXN0cnVjdCBk
ZXZpY2UgKmRldjsKPiAgCS8qKiBAcmVnX2Jhc2U6IHRoZSBiYXNlIGFkZHJlc3Mgb2Yga29tZWRh
IGlvIHNwYWNlICovCj4gIAl1MzIgX19pb21lbSAgICpyZWdfYmFzZTsKPiArCS8qKiBAZG1hX3Bh
cm1zOiB0aGUgZG1hIHBhcmFtZXRlcnMgb2Yga29tZWRhICovCj4gKwlzdHJ1Y3QgZGV2aWNlX2Rt
YV9wYXJhbWV0ZXJzIGRtYV9wYXJtczsKPiAgCj4gIAkvKiogQGNoaXA6IHRoZSBiYXNpYyBjaGlw
IGluZm9ybWF0aW9uICovCj4gIAlzdHJ1Y3Qga29tZWRhX2NoaXBfaW5mbyBjaGlwOwo+IC0tIAo+
IDEuOS4xCgpsZ3RtClJldmlld2VkLWJ5OiBBeWFuIEt1bWFyIEhhbGRlciA8YXlhbi5oYWxkZXJA
YXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
