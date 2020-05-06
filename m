Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54DB1C8309
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712676E928;
	Thu,  7 May 2020 07:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97CF6E866;
 Wed,  6 May 2020 11:59:32 +0000 (UTC)
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 by skedge04.snt-world.com (Postfix) with ESMTP id 283B267A887;
 Wed,  6 May 2020 13:59:27 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 6 May 2020
 13:59:26 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.007; Wed, 6 May 2020 13:59:26 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [RFC PATCH 4/4] arm64: dts: imx8mm: Add GPU nodes for 2D and 3D
 core using Etnaviv
Thread-Topic: [RFC PATCH 4/4] arm64: dts: imx8mm: Add GPU nodes for 2D and 3D
 core using Etnaviv
Thread-Index: AQHWHu1XU8cnqZiR7kmt3VxL/7fb7aiWVM8AgASDlACAAAPOgA==
Date: Wed, 6 May 2020 11:59:26 +0000
Message-ID: <c9379cdb-cd53-804b-a214-bfee3022a859@kontron.de>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-5-frieder.schrempf@kontron.de>
 <CAHCN7xJ=srZxygtG6hW_+us=qH1heY-k=EosavYH9tDk-KG0Bw@mail.gmail.com>
 <0df68f7c-13d2-5bd6-e27a-4bf8534f88fb@kontron.de>
In-Reply-To: <0df68f7c-13d2-5bd6-e27a-4bf8534f88fb@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <44F5D1A06A190C449A968796CBDACFE2@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 283B267A887.AF18A
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: aford173@gmail.com, anson.huang@nxp.com,
 christian.gmeiner@gmail.com, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, festevam@gmail.com, jun.li@nxp.com,
 kernel@pengutronix.de, l.stach@pengutronix.de,
 leonard.crestez@nxp.com, linux+etnaviv@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, shengjiu.wang@nxp.com
X-Spam-Status: No
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYuMDUuMjAgMTM6NDUsIEZyaWVkZXIgU2NocmVtcGYgd3JvdGU6DQo+IE9uIDAzLjA1LjIw
IDE2OjQ5LCBBZGFtIEZvcmQgd3JvdGU6DQo+PiBPbiBUaHUsIEFwciAzMCwgMjAyMCBhdCA3OjQ2
IEFNIFNjaHJlbXBmIEZyaWVkZXINCj4+IDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdy
b3RlOg0KPj4+DQo+Pj4gRnJvbTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBr
b250cm9uLmRlPg0KPj4+DQo+Pj4gQWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudHMsIHRoZSBpLk1Y
OE0tTWluaSBmZWF0dXJlcyBhIEdDMzIwIGFuZCBhDQo+Pj4gR0NOYW5vVWx0cmEgR1BVIGNvcmUu
IEV0bmF2aXYgZGV0ZWN0cyB0aGVtIGFzOg0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBldG5h
dml2LWdwdSAzODAwMDAwMC5ncHU6IG1vZGVsOiBHQzYwMCwgcmV2aXNpb246IDQ2NTMNCj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGV0bmF2aXYtZ3B1IDM4MDA4MDAwLmdwdTogbW9kZWw6IEdDNTIwLCBy
ZXZpc2lvbjogNTM0MQ0KPj4+DQo+Pj4gVGhpcyBzZWVtcyB0byB3b3JrIGZpbmUgbW9yZSBvciBs
ZXNzIHdpdGhvdXQgYW55IGNoYW5nZXMgdG8gdGhlIEhXREIsDQo+Pj4gd2hpY2ggc3RpbGwgbWln
aHQgYmUgbmVlZGVkIGluIHRoZSBmdXR1cmUgdG8gY29ycmVjdCBzb21lIGZlYXR1cmVzLA0KPj4+
IGV0Yy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIu
c2NocmVtcGZAa29udHJvbi5kZT4NCj4+PiAtLS0NCj4+IFNpbmNlIG5vdCBldmVyeW9uZSB1c2Vz
IHRoZSAzRCBvciAyRCwgd291bGQgaXQgbWFrZSBzZW5zZSB0byBtYXJrIHRoZW0NCj4+IGFzIGRp
c2FibGVkIGJ5IGRlZmF1bHQgYW5kIGxldCBwZW9wbGUgd2hvIG5lZWQgdGhlIDNEIGFuZCAyRCBl
bmFibGUNCj4+IHRoZW0gYXQgdGhlaXIgcmVzcGVjdGl2ZSBib2FyZCBmaWxlcz8NCj4gDQo+IEkg
d291bGQgcmF0aGVyIGtlZXAgaXQgdGhlIHdheSBpdCBoYXMgYmVlbiBkb25lIGZvciBvdGhlciBT
b0NzLiBMb29raW5nIA0KPiBhdCB0aGUgaS5NWDYgZGV2aWNldHJlZXMsIHRoZXkgYWxsIHNlZW0g
dG8gaGF2ZSB0aGUgR1BVcyBlbmFibGVkIGJ5IA0KPiBkZWZhdWx0Lg0KDQpBaCwgSSBoYWQgbWlz
c2VkIEx1Y2FzIHJlcGx5LiBIZSBhbHJlYWR5IHByb3ZpZGVkIG11Y2ggYmV0dGVyIGFyZ3VtZW50
cyANCmZvciBrZWVwaW5nIHRoZSBHUFVzIGVuYWJsZWQgYnkgZGVmYXVsdC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
