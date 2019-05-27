Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709302B523
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0D289E2C;
	Mon, 27 May 2019 12:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0BD89E2C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 12:27:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCKsX7019436; Mon, 27 May 2019 14:27:45 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2spu602xsw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 14:27:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C590F38;
 Mon, 27 May 2019 12:27:44 +0000 (GMT)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5108A2A63;
 Mon, 27 May 2019 12:27:44 +0000 (GMT)
Received: from GPXDAG6NODE6.st.com (10.75.127.82) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 May
 2019 14:27:43 +0200
Received: from GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11]) by
 GPXDAG6NODE6.st.com ([fe80::57f:5f53:243f:cb11%19]) with mapi id
 15.00.1473.003; Mon, 27 May 2019 14:27:44 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Yannick FERTRE
 <yannick.fertre@st.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Alexandre TORGUE
 <alexandre.torgue@st.com>
Subject: Re: [PATCH] drm/stm: ltdc: restore calls to clk_{enable/disable}
Thread-Topic: [PATCH] drm/stm: ltdc: restore calls to clk_{enable/disable}
Thread-Index: AQHVFIODRdknuk/3QUK12OrUD+2oRaZ+xJoA
Date: Mon, 27 May 2019 12:27:43 +0000
Message-ID: <1e4c4cbf-869e-8b6a-a1d6-cc7dccb2515a@st.com>
References: <20190527115830.15836-1-benjamin.gaignard@st.com>
In-Reply-To: <20190527115830.15836-1-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <3CE08C584D2B4941A38EAA7DF3901AFF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hK01vThxixP1NwoQSa3cr+03QYzdY/PdiNnc3e3F6Mc=;
 b=da8q5f/hZrKd7eaf/m6ng7ojS7/YMNLZmJZO6NaFRVme9aLxDV6aIXRharB5WHRNMOye
 94r8RGFdV63Ant/ZkQt17zSvUn+1vdPFelhRehynqvK711DieG+8PFBsR77eMLrSXCRY
 vZ0kDVmCqS1jfoGC3ctuiMmwH9izg3tlgnQP1JvotGdx6OuUw9lY6Z1MH8KzvH4iKe5n
 PSO1pY0RQ2qLY5bS4E3uSv4YDIMR2PDl4f9sT3pmqCAK8VsN9pQT+X7cU9lKVHbIy8Zz
 ZzMEbDCeB1CiO+dMxTYoHsTGDwB891xIfBsuqK0mKbN194WtS/FR9Y2m+GPIYNin4lou 4g== 
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVuamFtaW4sDQoNCk1hbnkgdGhhbmtzIGZvciB0aGlzIGZpeCAoYW5kIG1vcmUgZ2VuZXJh
bGx5IGZvciBwdXNoaW5nIFNUTSBwYXRjaGVzIG9uIA0KbWlzYyA6LSkNCg0KQWNrZWQtYnk6IFBo
aWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+DQoNClBoaWxpcHBlIDotKQ0KDQpP
biA1LzI3LzE5IDE6NTggUE0sIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOg0KPiBGcm9tOiBCZW5q
YW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4NCj4gDQo+IFJlc3Rv
cmUgY2FsbHMgdG8gY2xrX3tlbmFibGUvZGlzYWJsZX0gZGVsZXRlZCBhZnRlciBhcHBseWluZyB0
aGUgd3JvbmcNCj4gdmVyc2lvbiBvZiB0aGUgcGF0Y2gNCj4gDQo+IEZpeGVzOiBmZDY5MDVmY2E0
ZjAgKCJkcm0vc3RtOiBsdGRjOiByZW1vdmUgY2xrX3JvdW5kX3JhdGUgY29tbWVudCIpDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAyICsrDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMNCj4g
aW5kZXggYWUyYWFmMmE2MmVlLi5hYzI5ODkwZWRlYjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zdG0vbHRkYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jDQo+
IEBAIC01MDcsMTAgKzUwNywxMiBAQCBzdGF0aWMgYm9vbCBsdGRjX2NydGNfbW9kZV9maXh1cChz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ICAgCXN0cnVjdCBsdGRjX2RldmljZSAqbGRldiA9IGNy
dGNfdG9fbHRkYyhjcnRjKTsNCj4gICAJaW50IHJhdGUgPSBtb2RlLT5jbG9jayAqIDEwMDA7DQo+
ICAgDQo+ICsJY2xrX2Rpc2FibGUobGRldi0+cGl4ZWxfY2xrKTsNCj4gICAJaWYgKGNsa19zZXRf
cmF0ZShsZGV2LT5waXhlbF9jbGssIHJhdGUpIDwgMCkgew0KPiAgIAkJRFJNX0VSUk9SKCJDYW5u
b3Qgc2V0IHJhdGUgKCVkSHopIGZvciBwaXhlbCBjbGtcbiIsIHJhdGUpOw0KPiAgIAkJcmV0dXJu
IGZhbHNlOw0KPiAgIAl9DQo+ICsJY2xrX2VuYWJsZShsZGV2LT5waXhlbF9jbGspOw0KPiAgIA0K
PiAgIAlhZGp1c3RlZF9tb2RlLT5jbG9jayA9IGNsa19nZXRfcmF0ZShsZGV2LT5waXhlbF9jbGsp
IC8gMTAwMDsNCj4gICANCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
