Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B04E83A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2670D6E8B9;
	Fri, 21 Jun 2019 12:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80077.outbound.protection.outlook.com [40.107.8.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510296E8B4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:45:02 +0000 (UTC)
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.13.156) by
 VI1PR08MB3757.eurprd08.prod.outlook.com (20.178.14.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 21 Jun 2019 12:44:59 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::b07f:c7e4:d946:91d8]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::b07f:c7e4:d946:91d8%7]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 12:44:59 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Raymond Smith <Raymond.Smith@arm.com>
Subject: Re: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVKBsKBvRwqAaS30eXmbt21cTJQqamDg4A
Date: Fri, 21 Jun 2019 12:44:59 +0000
Message-ID: <20190621124458.rxa5djcmzd6lwkmy@DESKTOP-E1NTVVP.localdomain>
References: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
In-Reply-To: <1561112433-5308-1-git-send-email-raymond.smith@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LNXP265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::35) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:b6::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 663320df-d085-4513-ff96-08d6f6464578
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3757; 
x-ms-traffictypediagnostic: VI1PR08MB3757:
nodisclaimer: True
x-microsoft-antispam-prvs: <VI1PR08MB3757CBC745C13AE292477A65F0E70@VI1PR08MB3757.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(136003)(346002)(376002)(199004)(189003)(305945005)(86362001)(6506007)(53936002)(26005)(81166006)(52116002)(6862004)(476003)(6636002)(72206003)(486006)(102836004)(256004)(64756008)(386003)(8676002)(58126008)(81156014)(186003)(478600001)(446003)(8936002)(66446008)(68736007)(71200400001)(76176011)(73956011)(25786009)(54906003)(71190400001)(5660300002)(14444005)(66946007)(66476007)(11346002)(6436002)(316002)(4326008)(7736002)(6116002)(3846002)(66066001)(6486002)(6246003)(66556008)(229853002)(6512007)(1076003)(99286004)(9686003)(44832011)(14454004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3757;
 H:VI1PR08MB3696.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qunpvre3yVTzezVVxbsB7MiFy5bkCwUb8dks9bsV404VAQtDlmIhHSHbkfmtj2kxFu6Mo09knNLwSq1tHR4Mejaz6Jqjhh8NdfGyZXUc1tNHP++zsWpoe+GEMLQ4Vr8qbDt7VFI+MlpTZoSg1oVKUOu+BdIgnylv77QzrFbcb01zzRCrn+bLjpD3aY9SGVYd/fJiNUqsUsBsjL2g6VDQ7Cg9jg54z1c7oOlZZ8LJgAAaga5OHZUZGjg12L0RSLeQ9S58Uz54AfwM2ZHJisY15pTPbTmGh7Xx6tU1KFvwKmDxcXcWkOIOQLp3ZjWYlp4rqdcSHara4mzigxJMJPCcvz5ofrWvvPXSL4btvqXyRTK/gsbofFwh1jOe1L22txtrGlZrYA4D6sb/+sGlcLuLKr9pqx2f2Wk2u5P99lMD34k=
Content-ID: <32A47F10489B0D4EBAD32964611BBA40@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663320df-d085-4513-ff96-08d6f6464578
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 12:44:59.7102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Brian.Starkey@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3757
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ktalAvf5nEozTCvceC401Q2GBLMEpa2yHcUth6+dPM=;
 b=2doe82wU1UiRADhIYNt70+EHe4jKy1je3FB05eJUJFeGTMEILDkRgp3nvRagd/eOE5oTsJtymvzAKljPET3yo3xMSziHYucNl1gjXJ/BjLk705ucNXk+aJHUf9qvl5aNd/Cha48v38tKIcttQhhNdUabfStAeHZqV/I8BWcOdOA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
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
Cc: nd <nd@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>,
 "yuq825@gmail.com" <yuq825@gmail.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTE6MjE6MDhBTSArMDEwMCwgUmF5bW9uZCBTbWl0aCB3
cm90ZToKPiBBZGQgdGhlIERSTV9GT1JNQVRfTU9EX0FSTV8xNlgxNl9CTE9DS19VX0lOVEVSTEVB
VkVEIG1vZGlmaWVyIHRvCj4gZGVub3RlIHRoZSAxNngxNiBibG9jayB1LWludGVybGVhdmVkIGZv
cm1hdCB1c2VkIGluIEFybSBVdGdhcmQgYW5kCj4gTWlkZ2FyZCBHUFVzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJheW1vbmQgU21pdGggPHJheW1vbmQuc21pdGhAYXJtLmNvbT4KClJldmlld2VkLWJ5
OiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFya2V5QGFybS5jb20+CgpUaGFua3MgZm9yIGNoYXNp
bmcgdGhpcyBkb3duIQoKPiAtLS0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAx
MCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fZm91cmNjLmgKPiBpbmRleCAzZmVlYWEzLi44ZWQ3ZWNmIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1f
Zm91cmNjLmgKPiBAQCAtNzQzLDYgKzc0MywxNiBAQCBleHRlcm4gIkMiIHsKPiAgI2RlZmluZSBB
RkJDX0ZPUk1BVF9NT0RfQkNIICAgICAoMVVMTCA8PCAxMSkKPiAgCj4gIC8qCj4gKyAqIEFybSAx
NngxNiBCbG9jayBVLUludGVybGVhdmVkIG1vZGlmaWVyCj4gKyAqCj4gKyAqIFRoaXMgaXMgdXNl
ZCBieSBBcm0gTWFsaSBVdGdhcmQgYW5kIE1pZGdhcmQgR1BVcy4gSXQgZGl2aWRlcyB0aGUgaW1h
Z2UKPiArICogaW50byAxNngxNiBwaXhlbCBibG9ja3MuIEJsb2NrcyBhcmUgc3RvcmVkIGxpbmVh
cmx5IGluIG9yZGVyLCBidXQgcGl4ZWxzCj4gKyAqIGluIHRoZSBibG9jayBhcmUgcmVvcmRlcmVk
Lgo+ICsgKi8KPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fMTZYMTZfQkxPQ0tfVV9JTlRF
UkxFQVZFRCBcCj4gKwlmb3VyY2NfbW9kX2NvZGUoQVJNLCAoKDFVTEwgPDwgNTUpIHwgMSkpCj4g
Kwo+ICsvKgo+ICAgKiBBbGx3aW5uZXIgdGlsZWQgbW9kaWZpZXIKPiAgICoKPiAgICogVGhpcyB0
aWxpbmcgbW9kZSBpcyBpbXBsZW1lbnRlZCBieSB0aGUgVlBVIGZvdW5kIG9uIGFsbCBBbGx3aW5u
ZXIgcGxhdGZvcm1zLAo+IC0tIAo+IDIuNy40Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
