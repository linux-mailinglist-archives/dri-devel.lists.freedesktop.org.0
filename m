Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C4D2AEED
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 08:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E908966C;
	Mon, 27 May 2019 06:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481CD8966C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 06:51:21 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5024.eurprd08.prod.outlook.com (10.255.159.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Mon, 27 May 2019 06:51:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 06:51:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/komeda: Added AFBC support for komeda driver
Thread-Topic: [PATCH] drm/komeda: Added AFBC support for komeda driver
Thread-Index: AQHU6tZrSfGY2oLen0KpP248EWVF9Q==
Date: Mon, 27 May 2019 06:51:18 +0000
Message-ID: <20190527065110.GA29041@james-ThinkStation-P300>
References: <20190404110552.15778-1-james.qian.wang@arm.com>
 <20190516135748.GC1372@arm.com>
 <20190521084552.GA20625@james-ThinkStation-P300>
 <20190524111009.beddu67vvx66wvmk@DESKTOP-E1NTVVP.localdomain>
 <20190524121226.GD5942@intel.com>
In-Reply-To: <20190524121226.GD5942@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0061.apcprd03.prod.outlook.com
 (2603:1096:203:52::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52d9a7f6-b3cd-4487-f53e-08d6e26fb792
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB5024; 
x-ms-traffictypediagnostic: VE1PR08MB5024:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB502421FB0715ADCBA8A93A46B31D0@VE1PR08MB5024.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(366004)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(6116002)(3846002)(81166006)(53936002)(8676002)(2906002)(256004)(81156014)(8936002)(6486002)(14454004)(9686003)(6916009)(6436002)(7736002)(6306002)(66066001)(71200400001)(71190400001)(6512007)(86362001)(4326008)(478600001)(305945005)(58126008)(6246003)(54906003)(966005)(68736007)(446003)(11346002)(476003)(316002)(186003)(33716001)(33656002)(14444005)(66446008)(64756008)(66556008)(66476007)(5660300002)(486006)(73956011)(229853002)(66946007)(66574012)(1076003)(52116002)(25786009)(99286004)(6506007)(386003)(76176011)(26005)(55236004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5024;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F5km2PMt0UDlBTSblck5e5RWcRwEjLRBcalFyzh0LFuq4fLWZ8fEF4XnrCq7i4996wMH9yfue7erfP0gs4/72iYyOfjb19ahmQA0DCVOKJQIJXBKW0Y7JfBF6JCvvnQQVVoLuNF2iqhF0vKO+2nPfOJZh+vCqj0hu5FF1Yjx3FAASrf+Kt4LvRlKkt3bbEO+9SqCqbUK0by/lDo899JIULc8wYPaBdmRUVIGRqI6CqdrTGcwgwZuBOl1Wq3kO3JeJr5woPxQjz5c8V6Djxut18lth5+2dXB/6ggCjQeQP8BvbH1PxcxuwWhSiJorMYTW7t9Pv6q6lHHpm+bBYYIyF85IMb1TPqJ1E8NmK/uj0RDbKiFLOEEawjx9Ns6YPiaCE/gmEo24Kh5TgrTDbDvtzEY33s9pJj+gyqkzZp5P6WU=
Content-ID: <C24BF3C00204B949903C6211330B1116@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d9a7f6-b3cd-4487-f53e-08d6e26fb792
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 06:51:18.4143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdwnLJHAbS7rzk7YzRpuDpYzUw6eA1nfcGZlpicj1qA=;
 b=cKsWPnZLnRkhUe2JJ41QpAcL5YiNx3v7ByjfE395nzJoAVom7cgGSFZmY2iKzJBRdLDt7zlXcXszgzntRqvI49JX2nRHOfgVsmZHoBQm7SatciVABi8pUH0O90GZlH3lixL95q7l6BNScQcKAso2ZsAy8CUXXxaXgXVWWP/+ug4=
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
Cc: nd <nd@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDM6MTI6MjZQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDExOjEwOjA5QU0gKzAwMDAsIEJyaWFu
IFN0YXJrZXkgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQg
MDk6NDU6NThBTSArMDEwMCwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkg
d3JvdGU6Cj4gPiA+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDA5OjU3OjQ5UE0gKzA4MDAsIEF5
YW4gSGFsZGVyIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgQXByIDA0LCAyMDE5IGF0IDEyOjA2OjE0
UE0gKzAxMDAsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+
ID4gPiA+ID4gIAo+ID4gPiA+ID4gK3N0YXRpYyBpbnQKPiA+ID4gPiA+ICtrb21lZGFfZmJfYWZi
Y19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxl
LAo+ID4gPiA+ID4gKwkJCSAgY29uc3Qgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21k
KQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSAm
a2ZiLT5iYXNlOwo+ID4gPiA+ID4gKwljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZv
ID0gZmItPmZvcm1hdDsKPiA+ID4gPiA+ICsJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7Cj4g
PiA+ID4gPiArCXUzMiBhbGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50
X2hlYWRlcjsKPiA+ID4gPiA+ICsJdTMyIG5fYmxvY2tzID0gMCwgbWluX3NpemUgPSAwOwo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gKwlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgbW9k
ZV9jbWQtPmhhbmRsZXNbMF0pOwo+ID4gPiA+ID4gKwlpZiAoIW9iaikgewo+ID4gPiA+ID4gKwkJ
RFJNX0RFQlVHX0tNUygiRmFpbGVkIHRvIGxvb2t1cCBHRU0gb2JqZWN0XG4iKTsKPiA+ID4gPiA+
ICsJCXJldHVybiAtRU5PRU5UOwo+ID4gPiA+ID4gKwl9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
CXN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSykg
ewo+ID4gPiA+ID4gKwljYXNlIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDg6Cj4gPiA+
ID4gPiArCQlhbGlnbm1lbnRfdyA9IDMyOwo+ID4gPiA+ID4gKwkJYWxpZ25tZW50X2ggPSA4Owo+
ID4gPiA+ID4gKwkJYnJlYWs7Cj4gPiA+ID4gPiArCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NL
X1NJWkVfMTZ4MTY6Cj4gPiA+ID4gPiArCQlhbGlnbm1lbnRfdyA9IDE2Owo+ID4gPiA+ID4gKwkJ
YWxpZ25tZW50X2ggPSAxNjsKPiA+ID4gPiA+ICsJCWJyZWFrOwo+ID4gPiA+ID4gKwlkZWZhdWx0
Ogo+ID4gPiA+IENhbiB3ZSBoYXZlIHNvbWV0aGluZyBsaWtlIGEgd2FybiBoZXJlID8KPiA+ID4g
Cj4gPiA+IHdpbGwgYWRkIGEgV0FSTiBoZXJlLgo+ID4gPiAKPiA+IAo+ID4gSSB0aGluayBpdCdz
IGJldHRlciBub3QgdG8uIGZiLT5tb2RpZmllciBjb21lcyBmcm9tCj4gPiB1c2Vyc3BhY2UsIHNv
IGEgbWFsaWNpb3VzIGFwcCBjb3VsZCBzcGFtIHVzIHdpdGggV0FSTnMsIGVmZmVjdGl2ZWx5Cj4g
PiBkb3MtaW5nIHRoZSBzeXN0ZW0uIC1FSU5WQUwgc2hvdWxkIGJlIHN1ZmZpY2llbnQuCj4gCj4g
U2hvdWxkIHByb2JhYmx5IGNoZWNrIHRoYXQgdGhlIGVudGlyZSBtb2RpZmllcitmb3JtYXQgaXMK
PiBhY3R1YWxseSB2YWxpZC4gT3RoZXJ3aXNlIHlvdSByaXNrIHBhc3Npbmcgb24gYSBib2d1cwo+
IG1vZGlmaWVyIGRlZXBlciBpbnRvIHRoZSBkcml2ZXIgd2hpY2ggbWF5IHRyaWdnZXIKPiBpbnRl
cmVzdGluZyBidWdzLgo+IAo+IEFsc28gdGhlb3JldGljYWxseSAoaG93ZXZlciB1bmxpa2VseSkg
c29tZSBicm9rZW4gdXNlcnNwYWNlCj4gbWlnaHQgc3RhcnQgdG8gZGVwZW5kIG9uIHRoZSBhYmls
aXR5IHRvIGNyZWF0ZSBmcmFtZWJ1ZmZlcnMKPiB3aXRoIGNyYXAgbW9kaWZpZXJzLCB3aGljaCBj
b3VsZCBsYXRlciBicmVhayBpZiB5b3UgY2hhbmdlCj4gdGhlIHdheSB5b3UgaGFuZGxlIHRoZSBt
b2RpZmllcnMuIFRoZW4geW91J3JlIHN0dWNrIGJldHdlZW4KPiB0aGUgcm9jayBhbmQgaGFyZCBw
bGFjZSBiZWNhdXNlIHlvdSBjYW4ndCBicmVhayBleGlzdGluZwo+IHVzZXJzcGFjZSBidXQgeW91
IHN0aWxsIHdhbnQgdG8gY2hhbmdlIHRoZSB3YXkgbW9kaWZpZXJzCj4gYXJlIGhhbmRsZWQgaW4g
dGhlIGtlcm5lbC4KPiAKPiBCZXN0IG5vdCBnaXZlIHVzZXJzcGFjZSB0b28gbXVjaCByb3BlIElN
Ty4gVHdvIHdheXMgdG8gZ28gYWJvdXQKPiB0aGF0Ogo+IDEpIGRybV9hbnlfcGxhbmVfaGFzX2Zv
cm1hdCgpIChhc3N1bWVzIHlvdXIgLmZvcm1hdF9tb2Rfc3VwcG9ydGVkKCkKPiAgICBkb2VzIGl0
cyBqb2IgcHJvcGVybHkpCj4gMikgcm9sbCB5b3VyIG93biAKPiAKPiAtLSAKPiBWaWxsZSBTeXJq
w6Rsw6QKPiBJbnRlbAoKSGkgQnJpYW4gJiBWaWxsZToKCmtvbWVkIGhhcyBhIGZvcm1hdCttb2Rp
ZmllciBjaGVjayBiZWZvcmUgdGhlIGZiIHNpemUgY2hlY2suCmFuZCBmb3Iga29tZWRhX2ZiX2Ny
ZWF0ZSwgdGhlIGZpcnN0IHN0ZXAgaXMgZG8gdGhlIGZvcm1hdCttb2RpZmllcgpjaGVjaywgdGhl
IHNpemUgY2hlY2sgaXMgdGhlIGZ1cnRodXIgY2hlY2sgYWZ0ZXIgdGhlIHN1Y2ggZm9ybWF0CnZh
bGlkIGNoZWNrLiBhbmQgdGhlIGRldGFpbGVkIGZiX2NyZWF0ZSBpcyBsaWtlOgoKc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciAqCmtvbWVkYV9mYl9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
c3RydWN0IGRybV9maWxlICpmaWxlLAoJCSBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAq
bW9kZV9jbWQpCnsKICAgICAgICAuLi4KICAgICAgICAvKiBTdGVwIDE6IGZvcm1hdCttb2RpZmll
ciB2YWxpZCBjaGVjaywgaWYgaXQgY2FuIG5vdCBiZSBzdXBwb3J0LAogICAgICAgICAqIGdldF9m
b3JtYXRfY2FwcyB3aWxsIHJldHVybiBhIE5VTEwgcHRyLgogICAgICAgICAqLwoJa2ZiLT5mb3Jt
YXRfY2FwcyA9IGtvbWVkYV9nZXRfZm9ybWF0X2NhcHMoJm1kZXYtPmZtdF90YmwsCgkJCQkJCSAg
bW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCwKCQkJCQkJICBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pOwoJ
aWYgKCFrZmItPmZvcm1hdF9jYXBzKSB7CgkJRFJNX0RFQlVHX0tNUygiRk1UICV4IGlzIG5vdCBz
dXBwb3J0ZWQuXG4iLAoJCQkgICAgICBtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0KTsKCQlrZnJlZShr
ZmIpOwoJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwoJfQoKCWRybV9oZWxwZXJfbW9kZV9maWxs
X2ZiX3N0cnVjdChkZXYsICZrZmItPmJhc2UsIG1vZGVfY21kKTsKCiAgICAgICAgLyogc3RlcCAy
LCBkbyB0aGUgc2l6ZSBjaGVjayAqLwoJaWYgKGtmYi0+YmFzZS5tb2RpZmllcikKCQlyZXQgPSBr
b21lZGFfZmJfYWZiY19zaXplX2NoZWNrKGtmYiwgZmlsZSwgbW9kZV9jbWQpOwoJZWxzZQoJCXJl
dCA9IGtvbWVkYV9mYl9ub25lX2FmYmNfc2l6ZV9jaGVjayhtZGV2LCBrZmIsIGZpbGUsIG1vZGVf
Y21kKTsKCWlmIChyZXQgPCAwKQoJCWdvdG8gZXJyX2NsZWFudXA7CgogICAgICAgIC4uLgp9CgpT
byB0aGVvcmV0aWNhbGx5LCB0aGUgV0FSTiBpbiBzdGVwMiBpcyByZWR1bmRhbnQgaWYgZ2V0X2Zv
cm1hdF9jYXBzCmZ1bmN0aW9uIGhhcyBubyBwcm9ibGVtLiA6KS4gdGhlIFdBUk4gaGVyZSBpcyBv
bmx5IGZvciByZXBvcnRpbmcKdGhlIGtlcm5lbCBCVUcgb3IgY29kZSBpbmNvbnNpdGVudCB3aXRo
IGZvcm1hdCBjYXBzIGNoZWNrIGFuZCB0aGUKZmIgc2l6ZSBjaGVjay4gQW5kIEkgYWdyZWUsIGJh
c2ljYWxseSBpdCB3aWxsIG5vdCBoYXBwZW5lLgpAQnJpYW4sIEknbSBPayB0byByZW1vdmUgaXQu
IDopCgpAVmlsbGU6CkJhc2ljYWxseSBrb21lZGEgZm9sbG93IHRoZSB3YXktMSwgYnV0IGEgbGl0
dGxlIGltcHJvdmVtZW50IGZvcgptYXRjaGluZyBrb21lZGEncyByZXF1aXJlbWVudC4gZm9yIGtv
bWVkYSB3aGljaCB3aWxsIGRvIHR3byBsZXZlbCdzCmZvcm1hdCttb2RpZmllciBjaGVjay4KMSku
IEluIGZiX2NyZWF0ZSwgQSByb3VnaGx5IGNoZWNrIHRvIHNlZSBpZiB0aGUgZm9ybWF0K21vZGlm
aWVyIGNhbiBiZQogICAgc3VwcG9ydGVkIGJ5IGN1cnJlbnQgSFcuCjIpLiBJbiBwbGFuZV9hdG9t
aWNfY2hlY2s6IHRvIHNlZSBpZiB0aGUgZm9ybWF0K21vZGlmaWVyIGNhbiBiZQogICAgc3VwcG9y
dGVkIGZvciBhIHNwZWNpZmljIGxheWVyIGFuZCB3aXRoIGEgc3BlY2lmaWMgY29uZmlndXJhdGlv
biAoUk9UKQoKVGhpcyBpcyBhIGZvcm1hdCB2YWxpZCBjaGVjayBleGFtcGxlIGZvciBwbGFuZV9j
aGVjay4KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMwMTE0MC8/c2Vy
aWVzPTU5NzQ3JnJldj0yCgpKYW1lcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
