Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2F560613
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126DA6E103;
	Fri,  5 Jul 2019 12:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7655D6E103
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:41:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CbDxP001281; Fri, 5 Jul 2019 14:41:05 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf1jjjq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:41:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB5F731;
 Fri,  5 Jul 2019 12:41:03 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F3182CC3;
 Fri,  5 Jul 2019 12:41:03 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jul
 2019 14:41:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 5 Jul 2019 14:41:03 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "jsarha@ti.com" <jsarha@ti.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
Thread-Topic: [PATCH] drm/bridge: sii902x: add audio graph card support
Thread-Index: AQHVMXX5EUvh0puEZ0ygMEtXg5C9Kaa72VsA
Date: Fri, 5 Jul 2019 12:41:03 +0000
Message-ID: <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <019DC7758BBDE148B1C01A127A8F5761@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qh28dI5DvFVPJdueAPSh1Hk6ECUAJ6MLaEbc5I2IPDs=;
 b=WcHpYZjYL64+yCVvOf1KAWbOCHMXUugif32Iyp6Dx0GO5T1alRnS5102dKuCLa/vY/Jh
 4RtA46QSdUmF/7miKyJ6CZ3zS4d/0yxAh9bjUblx02BIlT02CJ5lt6uOoXrcQhQBUYoM
 u/yKBA9ZzVk3JTl74xYHJdt3omDCYcdgth0PR4OhZ4AUtyPnvPEQ4F4OW3LB7fz47VWt
 GF6SAF7vPuWYMVIK9K3HTUM76veghmNsD+WqswgJZDnannj90aPPvBr4bSb+SLxOe6/g
 0bYsT8Fv+gEgQypIcr5PaI0SVufEOw3Ou8CeiltVAMGvlVCMkw5kMFUha6xppJWLW+FT pA== 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2xpdmllciwNCmFuZCBtYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCkdvb2QgdG8gaGF2
ZSB0aGUgYXVkaW8gZ3JhcGggY2FyZCBzdXBwb3J0LCBsb29rcyBvay4NClJldmlld2VkLWJ5OiBQ
aGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KUGhpbGlwcGUgOi0pDQoNCk9u
IDcvMy8xOSAxMDowNCBBTSwgT2xpdmllciBNb3lzYW4gd3JvdGU6DQo+IEltcGxlbWVudCBnZXRf
ZGFpX2lkIGNhbGxiYWNrIG9mIGF1ZGlvIEhETUkgY29kZWMNCj4gdG8gc3VwcG9ydCBBU29DIGF1
ZGlvIGdyYXBoIGNhcmQuDQo+IEhETUkgYXVkaW8gb3V0cHV0IGhhcyB0byBiZSBjb25uZWN0ZWQg
dG8gc2lpOTAyeCBwb3J0IDMuDQo+IGdldF9kYWlfaWQgY2FsbGJhY2sgbWFwcyB0aGlzIHBvcnQg
dG8gQVNvQyBEQUkgaW5kZXggMC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2Fu
IDxvbGl2aWVyLm1veXNhbkBzdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMNCj4g
aW5kZXggZGQ3YWE0NjZiMjgwLi5kYWY5ZWYzY2Q4MTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTAyeC5jDQo+IEBAIC0xNTgsNiArMTU4LDggQEANCj4gICANCj4gICAjZGVmaW5lIFNJSTkw
MlhfSTJDX0JVU19BQ1FVSVNJVElPTl9USU1FT1VUX01TCTUwMA0KPiAgIA0KPiArI2RlZmluZSBT
SUk5MDJYX0FVRElPX1BPUlRfSU5ERVgJCTMNCj4gKw0KPiAgIHN0cnVjdCBzaWk5MDJ4IHsNCj4g
ICAJc3RydWN0IGkyY19jbGllbnQgKmkyYzsNCj4gICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0K
PiBAQCAtNjkwLDExICs2OTIsMzIgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2dldF9lbGQo
c3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLA0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+
ICAgDQo+ICtzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3Nv
Y19jb21wb25lbnQgKmNvbXBvbmVudCwNCj4gKwkJCQkgICAgc3RydWN0IGRldmljZV9ub2RlICpl
bmRwb2ludCkNCj4gK3sNCj4gKwlzdHJ1Y3Qgb2ZfZW5kcG9pbnQgb2ZfZXA7DQo+ICsJaW50IHJl
dDsNCj4gKw0KPiArCXJldCA9IG9mX2dyYXBoX3BhcnNlX2VuZHBvaW50KGVuZHBvaW50LCAmb2Zf
ZXApOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJLyoNCj4g
KwkgKiBIRE1JIHNvdW5kIHNob3VsZCBiZSBsb2NhdGVkIGF0IHJlZyA9IDwzPg0KPiArCSAqIFJl
dHVybiBleHBlY3RlZCBEQUkgaW5kZXggMC4NCj4gKwkgKi8NCj4gKwlpZiAob2ZfZXAucG9ydCA9
PSBTSUk5MDJYX0FVRElPX1BPUlRfSU5ERVgpDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJcmV0
dXJuIC1FSU5WQUw7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGhkbWlfY29k
ZWNfb3BzIHNpaTkwMnhfYXVkaW9fY29kZWNfb3BzID0gew0KPiAgIAkuaHdfcGFyYW1zID0gc2lp
OTAyeF9hdWRpb19od19wYXJhbXMsDQo+ICAgCS5hdWRpb19zaHV0ZG93biA9IHNpaTkwMnhfYXVk
aW9fc2h1dGRvd24sDQo+ICAgCS5kaWdpdGFsX211dGUgPSBzaWk5MDJ4X2F1ZGlvX2RpZ2l0YWxf
bXV0ZSwNCj4gICAJLmdldF9lbGQgPSBzaWk5MDJ4X2F1ZGlvX2dldF9lbGQsDQo+ICsJLmdldF9k
YWlfaWQgPSBzaWk5MDJ4X2F1ZGlvX2dldF9kYWlfaWQsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0
aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3Qgc2lpOTAyeCAqc2lpOTAyeCwN
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
