Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CA4605DD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 14:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F205897FF;
	Fri,  5 Jul 2019 12:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFC5897FF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 12:24:32 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CNqYQ030318; Fri, 5 Jul 2019 14:24:15 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw4ajaab-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:24:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB07734;
 Fri,  5 Jul 2019 12:24:02 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72FD32C47;
 Fri,  5 Jul 2019 12:24:02 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jul
 2019 14:24:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 5 Jul 2019 14:24:02 +0200
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
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Thread-Topic: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Thread-Index: AQHVMO2KR4mZoMb3BkGaiUB8X+1y2qa71auA
Date: Fri, 5 Jul 2019 12:24:02 +0000
Message-ID: <39d9bf8f-a906-7f69-582d-b2996e600c0f@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <DDC1C03DC92D944FA408C2A9B6DAE01F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EFphJe1CVVP/nzRxA8x6BhXKv/0bjU3/TiVkvgOFPek=;
 b=BYLU4XNoWdTNPUWd8ceyUbCwUOTaR3Zl4KnD/DGwy4jIGIeLB91fgSU0JmDTNPxB+m8B
 snlkGg5ZlGmvMkbPmJtFJx1IBbJSAsrxEj8p2sFSRZ/55OFHIdcJn55lp4s138lzPju/
 2uKvrqJyrQP7KyltAKDUlXNckkyChpMBpj2exHAtp56yQ6Xe0YEzz3TMiVVDFV6yf+qK
 k4aCeQ/5gDkYiLxkHyPIu3B2qN1jxWF9hWyWQsPcWDqaTiLt5lzuSXvfC2uHYySkX71q
 yoaDFjY2zrcL7+8I9p+xMmvyzjquq0X4bq+uO99TSuQ+S57jzx1ZKE6MeT+G7r4ZXl4C nQ== 
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

SGkgT2xpdmllciwNCmFuZCBtYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCkkgZG8gbm90IHNl
ZSBob3cgYXVkaW8gY291bGQgd29yayB3aXRob3V0IHlvdXIgcGF0Y2gsIHNvOg0KUmV2aWV3ZWQt
Ynk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQpQaGlsaXBwZSA6LSkN
Cg0KT24gNy8yLzE5IDU6NDcgUE0sIE9saXZpZXIgTW95c2FuIHdyb3RlOg0KPiBBZGQgZGV2bV9j
bGtfZ2V0IGNhbGwgdG8gcmV0cmlldmUgcmVmZXJlbmNlIHRvIG1hc3RlciBjbG9jay4NCj4gDQo+
IEZpeGVzOiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERN
SSBhdWRpbyBzdXBwb3J0IikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxv
bGl2aWVyLm1veXNhbkBzdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTAyeC5jIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYw0KPiBpbmRleCBkZDdhYTQ2NmIyODAuLjM2YWNjMjU2
ZTY3ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMNCj4gQEAgLTc1MCw2ICs3NTAs
NyBAQCBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3Qgc2lpOTAyeCAq
c2lpOTAyeCwNCj4gICAJCXNpaTkwMngtPmF1ZGlvLmkyc19maWZvX3NlcXVlbmNlW2ldIHw9IGF1
ZGlvX2ZpZm9faWRbaV0gfA0KPiAgIAkJCWkyc19sYW5lX2lkW2xhbmVzW2ldXSB8CVNJSTkwMlhf
VFBJX0kyU19GSUZPX0VOQUJMRTsNCj4gICANCj4gKwlzaWk5MDJ4LT5hdWRpby5tY2xrID0gZGV2
bV9jbGtfZ2V0KGRldiwgIm1jbGsiKTsNCj4gICAJaWYgKElTX0VSUihzaWk5MDJ4LT5hdWRpby5t
Y2xrKSkgew0KPiAgIAkJZGV2X2VycihkZXYsICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZv
dW5kOiAlbGRcbiIsDQo+ICAgCQkJX19mdW5jX18sIFBUUl9FUlIoc2lpOTAyeC0+YXVkaW8ubWNs
aykpOw0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
