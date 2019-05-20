Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1622B66
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7C68919F;
	Mon, 20 May 2019 05:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C888919F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:48:03 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4736.eurprd08.prod.outlook.com (10.255.112.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 20 May 2019 05:48:00 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:48:00 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Clear enable bit in CU_INPUTx_CONTROL
Thread-Topic: [PATCH] drm/komeda: Clear enable bit in CU_INPUTx_CONTROL
Thread-Index: AQHVDs+VxH/zdzE1+0KX0rb+TfXFjQ==
Date: Mon, 20 May 2019 05:48:00 +0000
Message-ID: <20190520054753.GA2220@james-ThinkStation-P300>
References: <1557889313-31326-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1557889313-31326-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0007.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27855e1e-edae-4bd6-c313-08d6dce6b792
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4736; 
x-ms-traffictypediagnostic: VE1PR08MB4736:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB47368733DE963E294CA3AE85B3060@VE1PR08MB4736.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(386003)(14454004)(4326008)(1076003)(66446008)(6506007)(2906002)(6862004)(5660300002)(25786009)(66476007)(6636002)(58126008)(52116002)(76176011)(64756008)(33656002)(26005)(6116002)(102836004)(55236004)(73956011)(66066001)(66556008)(54906003)(99286004)(66946007)(68736007)(3846002)(186003)(11346002)(6512007)(33716001)(446003)(86362001)(486006)(316002)(476003)(229853002)(6436002)(256004)(71190400001)(81156014)(8936002)(478600001)(7736002)(305945005)(9686003)(14444005)(71200400001)(6246003)(6486002)(81166006)(53936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4736;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PmkSqHqFv4TIAEWZIKqOnyB5fz/42fMP0ohW8qBGEO2lbOwNp+9WVU/+pAQ53WJpCNGRqcD/EJQZsR5kliOaY+pv2L+9sJVokdQMVI1Vz2/It0Kn7rrqfq4mhnSuDAmynrfolVjs0MVcGSUkyuzPTUDGxZEFi7bKOZZSr6QLKRMg92OMknJMarmfFu18CE93oSSUga65gov8YtLbDs/AYbRi6yPke6T0IdPbyvayFmSvALyxmgF8cEuUg63KfmCslHmtIqLwadt06c6drD/Dz0Ija5p7IDLtAgix/VfUpuIHaEGeBcI63DLKI3gHxe78N+fEICmx/hiEbBn+TJHXgu7y8sE5Nf/p4+gLUhgWlNdP0lq/G7vXUeaZ9gBX9csJNTHwjcpFw4QH02tdW2ctGUA9JQmfx/hCM6ZtQd/ni9M=
Content-ID: <60B30D87E134724B96583276AA081363@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27855e1e-edae-4bd6-c313-08d6dce6b792
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:48:00.3199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn3uPf+qsc142rTyjYhchjXWHGnjJejz2pELt7VGsK0=;
 b=dx4ZniVe0r5IZ6gPmeTwc/4LRcD/lstaPtlPjvJlXZrcsN0fUWT479p9gSm7Kz71R4sDHR27R0xU/sz/rlZ7n5ZpmKGyHWIMJGWH0gq0//0b74orllKI4X1teTQo4GFPpse+Iepiwhxv5atmbLrfPnPavYa4a3kd6OCXgWtkltg=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTE6MDI6MDVBTSArMDgwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBCZXNpZGVzIGNsZWFyaW5nIHRoZSBpbnB1dCBJRCB0
byB6ZXJvLCBENzEgY29tcGl6IGFsc28gaGFzIGlucHV0Cj4gZW5hYmxlIGJpdCBpbiBDVV9JTlBV
VHhfQ09OVFJPTCB3aGljaCBuZWVkIHRvIGJlIGNsZWFyZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5j
IHwgMTIgKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IGluZGV4IDExMzVlMzguLmY4ODQ2YzYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2NvbXBvbmVudC5jCj4gQEAgLTQzNSw4ICs0MzUsMTggQEAgc3RhdGljIHZvaWQgZDcxX2Nv
bXBvbmVudF9kaXNhYmxlKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjKQo+ICAKPiAgCW1hbGlk
cF93cml0ZTMyKHJlZywgQkxLX0NPTlRST0wsIDApOwo+ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBj
LT5tYXhfYWN0aXZlX2lucHV0czsgaSsrKQo+ICsJZm9yIChpID0gMDsgaSA8IGMtPm1heF9hY3Rp
dmVfaW5wdXRzOyBpKyspIHsKPiAgCQltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19JTlBVVF9JRDAg
KyAoaSA8PCAyKSwgMCk7Cj4gKwo+ICsJCS8qIEJlc2lkZXMgY2xlYXJpbmcgdGhlIGlucHV0IElE
IHRvIHplcm8sIEQ3MSBjb21waXogYWxzbyBoYXMKPiArCQkgKiBpbnB1dCBlbmFibGUgYml0IGlu
IENVX0lOUFVUeF9DT05UUk9MIHdoaWNoIG5lZWQgdG8gYmUKPiArCQkgKiBjbGVhcmVkLgo+ICsJ
CSAqLwo+ICsJCWlmIChoYXNfYml0KGMtPmlkLCBLT01FREFfUElQRUxJTkVfQ09NUElaUykpCj4g
KwkJCW1hbGlkcF93cml0ZTMyKHJlZywgQ1VfSU5QVVQwX0NPTlRST0wgKwo+ICsJCQkJICAgICAg
IGkgKiBDVV9QRVJfSU5QVVRfUkVHUyAqIDQsCj4gKwkJCQkgICAgICAgQ1VfSU5QVVRfQ1RSTF9B
TFBIQSgweEZGKSk7Cj4gKwl9Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGNvbXBpel9lbmFibGVf
aW5wdXQodTMyIF9faW9tZW0gKmlkX3JlZywKPiAtLSAKPiAxLjkuMQo+IAoKTG9va3MgZ29vZCB0
byBtZS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
