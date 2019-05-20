Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D022B69
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 07:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116C8919F;
	Mon, 20 May 2019 05:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7A98919F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 05:49:49 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4736.eurprd08.prod.outlook.com (10.255.112.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 20 May 2019 05:49:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 05:49:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 1/2] drm/komeda: Update HW up-sampling on D71
Thread-Topic: [PATCH v1 1/2] drm/komeda: Update HW up-sampling on D71
Thread-Index: AQHVDs/U4h0vo+oh40m7tROen1856A==
Date: Mon, 20 May 2019 05:49:46 +0000
Message-ID: <20190520054940.GA2308@james-ThinkStation-P300>
References: <1557987170-24032-1-git-send-email-lowry.li@arm.com>
 <1557987170-24032-2-git-send-email-lowry.li@arm.com>
In-Reply-To: <1557987170-24032-2-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0044.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 151c42a4-741d-4642-111e-08d6dce6f6c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4736; 
x-ms-traffictypediagnostic: VE1PR08MB4736:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4736C1A9B5E9E58A9B2930CCB3060@VE1PR08MB4736.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(376002)(396003)(39860400002)(346002)(136003)(366004)(189003)(199004)(386003)(14454004)(4326008)(1076003)(66446008)(6506007)(2906002)(6862004)(5660300002)(25786009)(66476007)(6636002)(58126008)(52116002)(76176011)(15650500001)(64756008)(33656002)(26005)(6116002)(102836004)(55236004)(73956011)(66066001)(66556008)(54906003)(99286004)(66946007)(68736007)(3846002)(186003)(11346002)(6512007)(33716001)(446003)(86362001)(486006)(316002)(476003)(229853002)(6436002)(256004)(71190400001)(81156014)(8936002)(478600001)(7736002)(305945005)(9686003)(14444005)(71200400001)(6246003)(6486002)(81166006)(53936002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4736;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VBmiEO3iLCWqwfy7z4vR8CDK1SKqmK5O+24BktXr7Vb1y3tXnKTAIUnhnW8hZlERmdFhDZAEDzp6e7BllSuheFg1vMKbdjLr3qBQ2k+mZ4lKma+OPVMcKaT51vgk3xmX54Nera7J5X7mm9Zf2wlJHRNGiKyZmEUQxH6vBBop6ivLLHrOsypE2y0xVF6sSkQQt9NngiHDGNQDrq5aft0dOG3Xsn6v4URqjoVsa8VcnpDNg4wfSJcB1v08Pc8JXmOLP91YifMv/cUkczNBKxn3hnqkSDZC5cYxEomWhEqo4NdjADtd+TdRUfyoHqvSHaMtMH3VlHqE4tgbRBjMTbdR1pK+VOdX7wTLXvmawxny8lgYhdy2CfdlOARfp6B1oP/LfKAHMVx1Zdftc3mVuIi+Twd5NPch75UMgHCwSsX6ncE=
Content-ID: <3AB093332EF3A14790F8A6FBC982D88C@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151c42a4-741d-4642-111e-08d6dce6f6c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 05:49:46.3163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b9NKP3c8ONCNOt4K+K4sntV2sS4sDajcCt5sSyFWO8=;
 b=d5kMuFawAfrpvWd43KPWcl4fvvGJPu6+NyokKEf+hPcfuDHZ/Md5KcdwDeoJ1T9kWVBVVZWw+AqTbwsXClJmjxYGaOjKX/hRF89jeeR84aUmTC70Txt6YriuEVXXHrI4a0pJTFyLxmEwevjVRoxuLrpkuX1vZIH6Y688kyyQLuE=
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

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MTM6MDlQTSArMDgwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBVcGRhdGVzIEhXIHVwLXNhbXBsaW5nIG1ldGhvZCBh
Y2NvcmRpbmcgdG8gdGhlIGZvcm1hdCB0eXBlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExp
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5jb20+Cj4gLS0tCj4gIC4uLi9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIHwgMjkgKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
Y29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
Y29tcG9uZW50LmMKPiBpbmRleCBmODg0NmM2Li5kZmM3MGY1IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+
IEBAIC0yMTIsNiArMjEyLDM1IEBAIHN0YXRpYyB2b2lkIGQ3MV9sYXllcl91cGRhdGUoc3RydWN0
IGtvbWVkYV9jb21wb25lbnQgKmMsCj4gIAkJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfUDFfUFRS
X0hJR0gsIHVwcGVyXzMyX2JpdHMoYWRkcikpOwo+ICAJfQo+ICAKPiArCWlmIChmYi0+Zm9ybWF0
LT5pc195dXYpIHsKPiArCQl1MzIgdXBzYW1wbGluZyA9IDA7Cj4gKwo+ICsJCXN3aXRjaCAoa2Zi
LT5mb3JtYXRfY2Fwcy0+Zm91cmNjKSB7Cj4gKwkJY2FzZSBEUk1fRk9STUFUX1lVWVY6Cj4gKwkJ
CXVwc2FtcGxpbmcgPSBmYi0+bW9kaWZpZXIgPyBMUl9DSEk0MjJfQklMSU5FQVIgOgo+ICsJCQkJ
ICAgICBMUl9DSEk0MjJfUkVQTElDQVRJT047Cj4gKwkJCWJyZWFrOwo+ICsJCWNhc2UgRFJNX0ZP
Uk1BVF9VWVZZOgo+ICsJCQl1cHNhbXBsaW5nID0gTFJfQ0hJNDIyX1JFUExJQ0FUSU9OOwo+ICsJ
CQlicmVhazsKPiArCQljYXNlIERSTV9GT1JNQVRfTlYxMjoKPiArCQljYXNlIERSTV9GT1JNQVRf
WVVWNDIwXzhCSVQ6Cj4gKwkJY2FzZSBEUk1fRk9STUFUX1lVVjQyMF8xMEJJVDoKPiArCQljYXNl
IERSTV9GT1JNQVRfWVVWNDIwOgo+ICsJCWNhc2UgRFJNX0ZPUk1BVF9QMDEwOgo+ICsJCS8qIHRo
ZXNlIGZtdCBzdXBwb3J0IE1QR0UvSlBFRyBib3RoLCBoZXJlIHBlcmZlciBKUEVHKi8KPiArCQkJ
dXBzYW1wbGluZyA9IExSX0NISTQyMF9KUEVHOwo+ICsJCQlicmVhazsKPiArCQljYXNlIERSTV9G
T1JNQVRfWDBMMjoKPiArCQkJdXBzYW1wbGluZyA9IExSX0NISTQyMF9KUEVHOwo+ICsJCQlicmVh
azsKPiArCQlkZWZhdWx0Ogo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwo+ICsJCW1hbGlkcF93cml0
ZTMyKHJlZywgTEFZRVJfUl9DT05UUk9MLCB1cHNhbXBsaW5nKTsKPiArCX0KPiArCj4gIAltYWxp
ZHBfd3JpdGUzMihyZWcsIExBWUVSX0ZNVCwga2ZiLT5mb3JtYXRfY2Fwcy0+aHdfaWQpOwo+ICAJ
bWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfSU5fU0laRSwgSFZfU0laRShzdC0+aHNpemUsIHN0LT52
c2l6ZSkpOwo+ICAKPiAtLSAKPiAxLjkuMQo+IAogClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpMb29r
cyBnb29kIHRvIG1lLgoKVGhhbmsgeW91Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
