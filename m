Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4FB114F06
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 11:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710B6F9AF;
	Fri,  6 Dec 2019 10:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6A6F9AF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 10:29:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6AM7u0010137; Fri, 6 Dec 2019 11:29:05 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkes3817u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 11:29:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 885C110002A;
 Fri,  6 Dec 2019 11:29:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 562252AE75F;
 Fri,  6 Dec 2019 11:29:03 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 11:29:03 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 6 Dec 2019 11:29:02 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 0/4] Genericize DW MIPI DSI bridge and
 add i.MX 6 driver
Thread-Topic: [Linux-stm32] [PATCH v4 0/4] Genericize DW MIPI DSI bridge and
 add i.MX 6 driver
Thread-Index: AQHVrB/6dEkIz1e2jUeb7WXRJ/4vMA==
Date: Fri, 6 Dec 2019 10:29:02 +0000
Message-ID: <a356df00-e321-ab8c-61e9-f179cb1f8e12@st.com>
References: <20191202193359.703709-1-adrian.ratiu@collabora.com>
In-Reply-To: <20191202193359.703709-1-adrian.ratiu@collabora.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <2AFA399042EFAD419166C5E33226D3E5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_02:2019-12-05,2019-12-06 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ho/sbuk46SVZEILtxoh1iWZ9PESL2p1iRVEuMafk6NI=;
 b=MCJ6e8Wk7J6ysXSdJgo6QfQY0bCfzfPUq8JNcGrn9a1fyOgjFOwGp3/X7PaunmJIlwdL
 TDM0ecGlMLDP/G8v8V6E9NFqiWSPYZdF5gq62dsUex4EI0wEhtiy0WhkQI3R0DW8tpUz
 KQvfMgjsvzIeiVh/IuzFw757ZrSNjWmQIlsjVxH2UMaDb2+C8xkxu1EynJL4AlMDGYH2
 R8kJyazXc4H4EoXIzT+0AviFcXLyA8NP9yMPVWwSaJlHuDmI3ZJ7nO/k0ZhiWVIV4e5F
 IA2cqhIEhglAQHcYbT1CPgw2TsBRUspmbAv0iScqNkimmgrYxA37gJwHYRIqZIDI8mJ/ gQ== 
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
Cc: "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWFuLA0KDQpBbmQgc29ycnkgZm9yIHRoaXMgbGF0ZSByZXBseS4NCllvdXIgcGF0Y2hl
cyBsb29rIGdvb2QgYW5kIHdlICgic3RtIGd1eXMiKSB1bmRlcnN0YW5kIHRoYXQgdjEuMDEgaXMg
dmVyeSANCmRpZmZlcmVudCB0byB2MS4zMC8zMS4NCg0KV2UgYXJlIGRvaW5nIG91ciBiZXN0IHRv
IHJldmlldyAmIHRlc3QgeW91ciBwYXRjaGVzIGFuZCB3ZSB3aWxsIGdvIGJhY2sgDQp0byB5b3Ug
YXNhcC4NCk1hbnkgdGhhbmtzLA0KUGhpbGlwcGUgOi0pDQoNCg0KT24gMTIvMi8xOSA4OjMzIFBN
LCBBZHJpYW4gUmF0aXUgd3JvdGU6DQo+IEhhdmluZyBhIGdlbmVyaWMgU3lub3BzaXMgRGVzaWdu
V2FyZSBNSVBJLURTSSBob3N0IGNvbnRyb2xsZXIgYnJpZGdlDQo+IGRyaXZlciBpcyBhIHZlcnkg
Z29vZCBpZGVhLCBob3dldmVyIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIGhhcw0KPiBoYXJk
Y29kZWQgcXVpdGUgYSBsb3Qgb2YgdGhlIHJlZ2lzdGVyIGxheW91dHMgdXNlZCBieSB0aGUgdHdv
IHN1cHBvcnRlZA0KPiBTb0MgdmVuZG9ycywgU1RNIGFuZCBSb2NrY2hpcCwgd2hpY2ggdXNlIElQ
IGNvcmVzIHYxLjMwIGFuZCB2MS4zMS4NCj4gDQo+IFRoaXMgbWFrZXMgaXQgaGFyZCB0byBzdXBw
b3J0IG90aGVyIFNvQyB2ZW5kb3JzIGxpa2UgdGhlIEZTTC9OWFAgaS5NWCA2DQo+IHdoaWNoIHVz
ZSBvbGRlciB2MS4wMSBjb3JlcyBvciBmdXR1cmUgdmVyc2lvbnMgYmVjYXVzZSwgYmFzZWQgb24g
aGlzdG9yeSwNCj4gbGF5b3V0IGNoYW5nZXMgc2hvdWxkIGFsc28gYmUgZXhwZWN0ZWQgaW4gbmV3
IERTSSB2ZXJzaW9ucyAvIFNvQ3MuDQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBjb252ZXJ0cyB0
aGUgYnJpZGdlIGFuZCBwbGF0Zm9ybSBkcml2ZXJzIHRvIGFjY2Vzcw0KPiByZWdpc3RlcnMgdmlh
IGdlbmVyaWMgcmVnbWFwIEFQSXMgYW5kIGFsbG93cyBlYWNoIHBsYXRmb3JtIGRyaXZlciB0bw0K
PiBjb25maWd1cmUgaXRzIHJlZ2lzdGVyIGxheW91dCB2aWEgc3RydWN0IHJlZ19maWVsZHMsIHRo
ZW4gYWRkcyBzdXBwb3J0DQo+IGZvciB0aGUgaG9zdCBjb250cm9sbGVyIGZvdW5kIG9uIGkuTVgg
Ni4NCj4gDQo+IEkgb25seSBoYXZlIGkuTVggaGFyZHdhcmUgd2l0aCBNSVBJLURTSSBwYW5lbCBh
bmQgcmVsZXZhbnQgZG9jdW1lbnRhdGlvbg0KPiBhdmFpbGFibGUgZm9yIHRlc3Rpbmcgc28gSSds
bCByZWFsbHkgYXBwcmVjaWF0ZSBpdCBpZiBzb21lb25lIGNvdWxkIHRlc3QNCj4gdGhlIHNlcmll
cyBvbiBSb2NrY2hpcCBhbmQgU1RNLi4uIGV5ZWJhbGxpbmcgcmVnaXN0ZXIgZmllbGRzIGNvdWxk
IG9ubHkNCj4gZ2V0IG1lIHNvIGZhciwgc28gc29ycnkgaW4gYWR2YW5jZSBmb3IgYW55IGJyZWFr
YWdlIQ0KPiANCj4gTWFueSB0aGFua3MgdG8gQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT4gZm9yDQo+IHN1Z2dlc3RpbmcgdGhlIHJlZ21hcCBzb2x1dGlvbiBh
bmQgdG8gTGl1IFlpbmcgPFlpbmcuTGl1QGZyZWVzY2FsZS5jb20+DQo+IGZvciBkb2luZyB0aGUg
aW5pdGlhbCBpLk1YIHBsYXRmb3JtIGRyaXZlciBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IFRoaXMg
c2VyaWVzIGFwcGxpZXMgb24gdG9wIG9mIGxhdGVzdCBsaW51eC1uZXh0IHRyZWUsIG5leHQtMjAx
OTEyMDIuDQo+IA0KPiB2MyAtPiB2NDoNCj4gICAgKiBBZGRlZCBjb21tbWl0IG1lc3NhZ2UgdG8g
ZHQtYmluZGluZyBwYXRjaCAoTmVpbCkNCj4gICAgKiBDb252ZXJ0ZWQgdGhlIGR0LWJpbmRpbmcg
dG8geWFtbCBkdC1zY2hlbWEgZm9ybWF0IChOZWlsKQ0KPiAgICAqIFNtYWxsIERUIG5vZGUgKyBk
cml2ZXIgZml4ZXMgKFJvYikNCj4gICAgKiBSZW5hbWVkIHBsYXRmb3JtIGRyaXZlciB0byByZWZs
ZWN0IGl0J3Mgb25seSBmb3IgaS5NWCB2NiAoRmFiaW8pDQo+ICAgICogQWRkZWQgc21hbGwgcGFu
ZWwgZXhhbXBsZSB0byB0aGUgaG9zdCBjb250cm9sbGVyIERUIGJpbmRpbmcNCj4gDQo+IHYyIC0+
IHYzOg0KPiAgICAqIEFkZGVkIGNvbnN0IGRlY2xhcmF0aW9ucyB0byBkdy1taXBpLWRzaS5jIHN0
cnVjdHMgKEVtaWwpDQo+ICAgICogRml4ZWQgUmV2aWV3ZWQtYnkgdGFncyBhbmQgY2MnZCBzb21l
IG1vcmUgcmVsZXZhbnQgTUwgKEVtaWwpDQo+IA0KPiB2MSAtPiB2MjoNCj4gICAgKiBNb3ZlZCBy
ZWdpc3RlciBkZWZpbml0aW9ucyAmIHJlZ21hcCBpbml0aWFsaXphdGlvbiBpbnRvIGJyaWRnZQ0K
PiAgICBtb2R1bGUuIFBsYXRmb3JtIGRyaXZlcnMgZ2V0IHRoZSByZWdtYXAgdmlhIHBsYXRfZGF0
YSBhZnRlciBjYWxsaW5nDQo+ICAgIHRoZSBicmlkZ2UgcHJvYmUgKEVtaWwpLg0KPiANCj4gQWRy
aWFuIFJhdGl1ICg0KToNCj4gICAgZHJtOiBicmlkZ2U6IGR3X21pcGlfZHNpOiBhY2Nlc3MgcmVn
aXN0ZXJzIHZpYSBhIHJlZ21hcA0KPiAgICBkcm06IGJyaWRnZTogZHdfbWlwaV9kc2k6IGFic3Ry
YWN0IHJlZ2lzdGVyIGFjY2VzcyB1c2luZyByZWdfZmllbGRzDQo+ICAgIGRybTogaW14OiBBZGQg
aS5NWCA2IE1JUEkgRFNJIGhvc3QgZHJpdmVyDQo+ICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBh
ZGQgaS5NWDYgTUlQSSBEU0kgaG9zdCBjb250cm9sbGVyIGRvYw0KPiANCj4gICAuLi4vZGlzcGxh
eS9pbXgvZnNsLG1pcGktZHNpLWlteDYueWFtbCAgICAgICAgfCAxMzYgKysrKw0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDY5OSArKysrKysrKysr
KysrLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaW14L0tjb25maWcgICAgICAgICAgICAgICAg
ICAgfCAgIDcgKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pbXgvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL2lteC9kd19taXBpX2RzaS1pbXg2LmMg
ICAgICAgIHwgMzc4ICsrKysrKysrKysNCj4gICAuLi4vZ3B1L2RybS9yb2NrY2hpcC9kdy1taXBp
LWRzaS1yb2NrY2hpcC5jICAgfCAgMTcgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21p
cGlfZHNpLXN0bS5jICAgICAgICAgfCAgMzQgKy0NCj4gICBpbmNsdWRlL2RybS9icmlkZ2UvZHdf
bWlwaV9kc2kuaCAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gICA4IGZpbGVzIGNoYW5nZWQsIDEw
NjcgaW5zZXJ0aW9ucygrKSwgMjA3IGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9pbXgvZnNsLG1pcGkt
ZHNpLWlteDYueWFtbA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaW14
L2R3X21pcGlfZHNpLWlteDYuYw0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
