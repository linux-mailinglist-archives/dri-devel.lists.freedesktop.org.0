Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC86E681
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 15:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92786E82E;
	Fri, 19 Jul 2019 13:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA496E82E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 13:35:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JDVrML011178; Fri, 19 Jul 2019 15:35:28 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepvbms-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 15:35:28 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A77531;
 Fri, 19 Jul 2019 13:35:27 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F804E55;
 Fri, 19 Jul 2019 13:35:27 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jul
 2019 15:35:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 19 Jul 2019 15:35:26 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Lucas Stach <l.stach@pengutronix.de>, Yannick FERTRE
 <yannick.fertre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>
Subject: Re: [PATCH] drm/stm: attach gem fence to atomic state
Thread-Topic: [PATCH] drm/stm: attach gem fence to atomic state
Thread-Index: AQHVOI3ASHSsIYCD/EuUftaWd6iZ/abR2wIA
Date: Fri, 19 Jul 2019 13:35:26 +0000
Message-ID: <e09dc82c-51dc-830c-a297-fe951faeb306@st.com>
References: <20190712084228.8338-1-l.stach@pengutronix.de>
In-Reply-To: <20190712084228.8338-1-l.stach@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <2065445B1EE07F418B0B850C3B36F774@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=P+Z7j9vnVuz/DhCxwePxEEht6nCZA5Qchi3RlGXirhg=;
 b=XtiHolhQ/rLbjlYVhA3qtAQxHSWRs/qNT7386NAS3s4jmWT+kMbk9R1ToTwDs/kVBPX7
 g8JI67duulhNMbe1YxKxPCotHshZ1iWCdLQs4Bdb7Un4zq2/zZSX4u59ensLENtuTYrW
 liwdwmdxKhLaYPaVnxh9YdUAVeQ8UwBgcQc11TBFuU2UKPuZSEDgmGksHq1K0T/qCTKn
 QMXcUIilUM++l0eZSr5y8QbbLPUUiqw0A1KhfQIQ7AimAilKTlG5ueFjHGFfZZkT3SHu
 IeIzJzEJ9fitgpMkO56SrF9bXjLe3O3UiNYpIdcahRWKeTsr8ZH9M6WUfk8YYDzqJfwh ug== 
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
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMgJiBBaG1hZCwNCg0KTWFueSB0aGFua3MgZm9yIHlvdXIgcGF0Y2gsDQoNClRlc3Rl
ZCBzdWNjZXNzZnVsbHkgb24gc3RtMzJtcDE1Ny1kazIgKHdlc3RvbiAmIGRybSkuDQoNCkFja2Vk
LWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KVGVzdGVkLWJ5OiBQ
aGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQaGlsaXBwZSA6LSkNCg0K
T24gNy8xMi8xOSAxMDo0MiBBTSwgTHVjYXMgU3RhY2ggd3JvdGU6DQo+IEZyb206IEFobWFkIEZh
dG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+DQo+IA0KPiBUbyBwcm9wZXJseSBzeW5jaHJv
bml6ZSB3aXRoIG90aGVyIGRldmljZXMgdGhlIGZlbmNlIGZyb20gdGhlIEdFTQ0KPiBvYmplY3Qg
YmFja2luZyB0aGUgZnJhbWVidWZmZXIgbmVlZHMgdG8gYmUgYXR0YWNoZWQgdG8gdGhlIGF0b21p
Yw0KPiBzdGF0ZSwgc28gdGhlIGNvbW1pdCB3b3JrIGNhbiB3YWl0IG9uIGZlbmNlIHNpZ25hbGlu
Zy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9u
aXguZGU+DQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4
LmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDIgKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYw0KPiBpbmRl
eCAyZmU2YzRhOGQ5MTUuLjNhYjRmYmY4ZWIwZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4gQEAg
LTI2LDYgKzI2LDcgQEANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+DQo+
ICAgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2NtYV9oZWxwZXIuaD4NCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxw
ZXIuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJt
X3BsYW5lX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPg0K
PiBAQCAtOTIyLDYgKzkyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNz
IGx0ZGNfcGxhbmVfZnVuY3MgPSB7DQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgbHRkY19wbGFuZV9oZWxwZXJfZnVuY3MgPSB7DQo+
ICsJLnByZXBhcmVfZmIgPSBkcm1fZ2VtX2ZiX3ByZXBhcmVfZmIsDQo+ICAgCS5hdG9taWNfY2hl
Y2sgPSBsdGRjX3BsYW5lX2F0b21pY19jaGVjaywNCj4gICAJLmF0b21pY191cGRhdGUgPSBsdGRj
X3BsYW5lX2F0b21pY191cGRhdGUsDQo+ICAgCS5hdG9taWNfZGlzYWJsZSA9IGx0ZGNfcGxhbmVf
YXRvbWljX2Rpc2FibGUsDQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
