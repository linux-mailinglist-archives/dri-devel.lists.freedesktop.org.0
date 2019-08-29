Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA7A1329
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 10:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336889DA9;
	Thu, 29 Aug 2019 08:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140129.outbound.protection.outlook.com [40.107.14.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567F789FC5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 07:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGfwNhFcIk3qQa9AkVViXimtlsZ+hAetSmt7xRFbGpcB5Jct7QGMRUg/yugNnjyJU/Ow6JC+X7BV6c84B3NWDS1BzfmMeBFwHKISDt99afOMeTde2igF4mHEoHh3k41H/vU3CAfWeAMyA30j/uylEZzGze6rFewzSxAxlDIiVNYxJJi2IEMccPOf7TuqVXLcMJznKnHT/2pHaFuFOUpy103716g0IW723Ze/GaqV+h10m9gzCN1LrEKjc94WuA2oV0opFexwbak2Sj8avCwlxNj8SxHjqszGVJX02RRWaOcv4CpKC4xX9CilzGttcXP7ROspIW1O0RBoDROSKySOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3bZCDKJeJ+GZufTwyzF6KKK9+Ey+RD/JkmbaGPhfik=;
 b=bWl3yczjXJ2M36ulGoNWqc9N43TT7ofGbeZcOWfrC1Jf9u8tGHUlWFzM9VTbjbUFlrjqa7pm6j7ULZ50gxlW1ITeXQoY6tY0nB844viOS+jT+9d5VX5hBtUYSKauFjYOIoEPkbAuSzuZ7P9aj+ouqr4yqz2SzCpC8sX3oxvtwzRYzLKb7n2Aku4Zcjyo5ochVOqwPVhXxJfnmqRo+nluYbgrB5hJ05GuQXILDb10AWa4iTttyXuw6eYp5F/hY3G0wz+ZnILGyyfjrXIZaYpmeYoD3lD7vo4waZV5Vf/D6KjAIX4UyMIyAOGswAyajBSr2O/nigmtXV8GPqV2jE45HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3356.eurprd02.prod.outlook.com (52.134.68.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 07:08:27 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 07:08:27 +0000
From: Peter Rosin <peda@axentia.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 3/3] fbdev: fbmem: avoid exporting fb_center_logo
Thread-Topic: [PATCH v3 3/3] fbdev: fbmem: avoid exporting fb_center_logo
Thread-Index: AQHVXMfjb9HuvMXdNUO0R8iyHBP+3qcO3XKAgALaFgA=
Date: Thu, 29 Aug 2019 07:08:26 +0000
Message-ID: <6cb5ec1b-ae60-5ca4-f0d9-1414f52fed73@axentia.se>
References: <20190827110854.12574-1-peda@axentia.se>
 <20190827110854.12574-4-peda@axentia.se>
 <CAMuHMdVkqX7x_D5nf01s-kE=o+y5OLM-5fd3q=2RDKGTcpCfHg@mail.gmail.com>
In-Reply-To: <CAMuHMdVkqX7x_D5nf01s-kE=o+y5OLM-5fd3q=2RDKGTcpCfHg@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0218.eurprd05.prod.outlook.com
 (2603:10a6:3:fa::18) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42dd0384-1e27-4376-e533-08d72c4fb051
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3356; 
x-ms-traffictypediagnostic: DB3PR0202MB3356:
x-microsoft-antispam-prvs: <DB3PR0202MB3356E418B8E4FBB6D5569C2CBCA20@DB3PR0202MB3356.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(376002)(39830400003)(189003)(199004)(6916009)(305945005)(229853002)(25786009)(5660300002)(6512007)(53936002)(508600001)(6246003)(2906002)(8676002)(81156014)(14454004)(81166006)(8936002)(256004)(53546011)(6506007)(86362001)(71190400001)(7736002)(71200400001)(54906003)(58126008)(6436002)(386003)(316002)(4326008)(6486002)(66946007)(31686004)(486006)(476003)(76176011)(2616005)(52116002)(66476007)(64756008)(26005)(186003)(66446008)(3846002)(31696002)(446003)(11346002)(36756003)(102836004)(66556008)(65806001)(65956001)(6116002)(66066001)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3356;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WtRfi917UieKwBot5FgZVczZsuHriU4cMK7joE+4+OKUBX+qTQ6CfzobNpo63bCMRSNAvldGL44J04kNFtVjsGxQLC0MGxcjYBwMlp6YTNGyOjDt/n5Eat8ht4QNsv06NmaIMRaw2cVi39B0irhtyA9kuKHcijL1uTX76YbUCOqiPcjFvSvfJw4LpeeDc0oN9Hj974W3sDer+Bmh1IKtLpNrs22K+m2C2tMcdtSkIq2ZJoPtfMP1MHULrIWFN5WCANN3lbzNEAC22ExN+Dz3une1ObYgfqmMzsxxqUpe8QTN5WeEjBN2sC2Xc6IM4/bRZ2kvJUd7yONoOxBeWw4QM8/SKW4Cbs+Z9+LczIKnO9Q1o8sJYGuXOvbMPTZTA9LHsTWid9S/naNBzZWg+CA2UP4HrGwXabeDW+5wtb9F6No=
x-ms-exchange-transport-forked: True
Content-ID: <D9E405F063191F4593B2660CF485CDC6@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dd0384-1e27-4376-e533-08d72c4fb051
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 07:08:26.9959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLoA3G0rfiSllDc7YT83kGR605Yd5+UBK/Tq08HeHH64tj7Wxb53YAJgg0SalEBL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3356
X-Mailman-Approved-At: Thu, 29 Aug 2019 08:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3bZCDKJeJ+GZufTwyzF6KKK9+Ey+RD/JkmbaGPhfik=;
 b=LN8GkmPQp0yWJ2TZNhLME0caqyJPtv/niEREoQRjoWQ8vUP84kALI0ZKm4wrQY0sXNO5mG1df1MGtaDtjXMz8xsWr2AXHZ9NmH1u+uPtGq1j3cXQOf9tJwUmq/WWDg/yotRRDo8Z1OzflVbfR9e0n4OG6tR4iOWYYh1jLlNEJl4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNyAxMzozNSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiBIaSBQZXRl
ciwNCj4gDQo+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDE6MDkgUE0gUGV0ZXIgUm9zaW4gPHBl
ZGFAYXhlbnRpYS5zZT4gd3JvdGU6DQo+PiBUaGUgdmFyaWFibGUgaXMgb25seSBldmVyIHVzZWQg
ZnJvbSBmYmNvbi5jIHdoaWNoIGlzIGxpbmtlZCBpbnRvIHRoZQ0KPj4gc2FtZSBtb2R1bGUuIFRo
ZXJlZm9yZSwgdGhlIGV4cG9ydCBpcyBub3QgbmVlZGVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gDQo+IEJ1dCBub3RlIHRoYXQg
dGhlIHNhbWUgaXMgdHJ1ZSBmb3IgZmJfY2xhc3MsIHNvIHBlcmhhcHMgaXQgY2FuIGJlIGFkZGVk
DQo+IChvciBiZXR0ZXIsIHJlbW92ZWQgOy0pPw0KDQpSaWdodC4gU29tZW9uZSBwbGVhc2UgbGV0
IG1lIGtub3cgaWYgMy8zIG5lZWRzIHRvIGJlIGV4dGVuZGVkLiBJJ20gYWxzbw0KaGFwcHkgdG8g
anVzdCBkcm9wIGl0Li4uDQoNCj4gT25jZSBkcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNf
ZGNvbi5jIHN0b3BzIGFidXNpbmcgcmVnaXN0ZXJlZF9mYltdDQo+IGFuZCBudW1fcmVnaXN0ZXJl
ZF9mYiwgdGhvc2UgY2FuIGdvLCB0b28uDQo+IA0KPiBEb2VzIGFueW9uZSByZW1lbWJlIHdoeSBh
dTEyMDBmYiBjYWxscyBmYl9wcmVwYXJlX2xvZ28oKSBhbmQgZmJfc2hvd19sb2dvKCkNCj4gaXRz
ZWxmPw0KDQpNYXliZSB0aGVyZSBzaG91bGQgYmUgYSBzbWFsbCBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJtZW0uaCBmaWxlIChvcg0Kc29tZXRoaW5nKSB3aXRoIHRoZXNlICJpbnRlcm5hbCIg
ZGVjbGFyYXRpb25zLCB0byBoaWRlIHNvbWUgY2x1dHRlciBjdXJyZW50bHkNCmluIGluY2x1ZGUv
bGludXgvZmIuaD8NCg0KRmVlbHMgbGlrZSB0aGF0IGNvdWxkIGJlIGRvbmUgbGF0ZXIsIGFmdGVy
IHRoZXNlIG90aGVyIGNsZWFudXBzIHlvdSBtZW50aW9uLA0Kc28gdGhhdCB0aGUgbmV3IGZpbGUg
aGFzIGEgZmV3IG1vcmUgdGhpbmdzIHRvIGRlY2xhcmUuDQoNCkNoZWVycywNClBldGVyDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
