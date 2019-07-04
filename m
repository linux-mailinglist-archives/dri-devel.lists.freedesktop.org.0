Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034AF5F492
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017E86E2F8;
	Thu,  4 Jul 2019 08:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84916E2F8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:29:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x648TWe8122314;
 Thu, 4 Jul 2019 03:29:32 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x648TWg2016906
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Jul 2019 03:29:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Jul
 2019 03:29:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Jul 2019 03:29:30 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x648TQhG094955;
 Thu, 4 Jul 2019 03:29:27 -0500
Subject: Re: [PATCH 3/3] drm/bridge: sii902x: make audio mclk optional
To: Olivier Moysan <olivier.moysan@st.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <benjamin.gaignard@st.com>,
 <alexandre.torgue@st.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ac3cee7b-900a-45f6-b722-062e1d8b39d0@ti.com>
Date: Thu, 4 Jul 2019 11:29:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562228972;
 bh=3egXhDb+0BEGsc9z+jUYoOJnG4f+8TqOeWKQ9O3F6XQ=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=rKllUdZGg7Y450IMxaVlJuNDJ41h3AOnnoxU+sk8hJhLSXRwRB2pmJSUkDomzG1hB
 /TUcbmAjmpwgOvF+LRgkqD74YnTmjSrIIOEi4O0kPF7YLvXk/vxIpNy5qjnWydybAa
 xsqYnWV2yrAOVdZPsOjL7iEYFjtZ16SKcfXiNpgM=
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

T24gMDIvMDcvMjAxOSAxODo0NywgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gVGhlIG1hc3RlciBj
bG9jayBvbiBpMnMgYnVzIGlzIG5vdCBtYW5kYXRvcnksCj4gYXMgc2lpOTAyWCBpbnRlcm5hbCBQ
TEwgY2FuIGJlIHVzZWQgaW5zdGVhZC4KPiBNYWtlIHVzZSBvZiBtY2xrIG9wdGlvbmFsLgo+IAo+
IEZpeGVzOiBmZjU3ODE2MzRjNDEgKCJkcm0vYnJpZGdlOiBzaWk5MDJ4OiBJbXBsZW1lbnQgSERN
SSBhdWRpbyBzdXBwb3J0IikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xp
dmllci5tb3lzYW5Ac3QuY29tPgoKUmV2aWV3ZWQtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5j
b20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDM5ICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjMg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4
LmMKPiBpbmRleCAzNmFjYzI1NmU2N2UuLmEwOGJkOWZkYzA0NiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jCj4gQEAgLTU2MiwxOSArNTYyLDIxIEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9h
dWRpb19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJCX0KPiAg
CX0KPiAgCj4gLQlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoc2lpOTAyeC0+YXVkaW8ubWNsayk7
Cj4gLQlpZiAocmV0KSB7Cj4gLQkJZGV2X2VycihkZXYsICJFbmFibGluZyBtY2xrIGZhaWxlZDog
JWRcbiIsIHJldCk7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiArCWlmIChzaWk5MDJ4LT5hdWRp
by5tY2xrKSB7Cj4gKwkJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHNpaTkwMngtPmF1ZGlvLm1j
bGspOwo+ICsJCWlmIChyZXQpIHsKPiArCQkJZGV2X2VycihkZXYsICJFbmFibGluZyBtY2xrIGZh
aWxlZDogJWRcbiIsIHJldCk7Cj4gKwkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICAKPiAtCW1jbGtf
cmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiArCQltY2xrX3JhdGUg
PSBjbGtfZ2V0X3JhdGUoc2lpOTAyeC0+YXVkaW8ubWNsayk7Cj4gIAo+IC0JcmV0ID0gc2lpOTAy
eF9zZWxlY3RfbWNsa19kaXYoJmkyc19jb25maWdfcmVnLCBwYXJhbXMtPnNhbXBsZV9yYXRlLAo+
IC0JCQkJICAgICAgbWNsa19yYXRlKTsKPiAtCWlmIChtY2xrX3JhdGUgIT0gcmV0ICogcGFyYW1z
LT5zYW1wbGVfcmF0ZSkKPiAtCQlkZXZfZGJnKGRldiwgIkluYWNjdXJhdGUgcmVmZXJlbmNlIGNs
b2NrICglbGQvJWQgIT0gJXUpXG4iLAo+IC0JCQltY2xrX3JhdGUsIHJldCwgcGFyYW1zLT5zYW1w
bGVfcmF0ZSk7Cj4gKwkJcmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNsa19kaXYoJmkyc19jb25maWdf
cmVnLAo+ICsJCQkJCSAgICAgIHBhcmFtcy0+c2FtcGxlX3JhdGUsIG1jbGtfcmF0ZSk7Cj4gKwkJ
aWYgKG1jbGtfcmF0ZSAhPSByZXQgKiBwYXJhbXMtPnNhbXBsZV9yYXRlKQo+ICsJCQlkZXZfZGJn
KGRldiwgIkluYWNjdXJhdGUgcmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0gJXUpXG4iLAo+ICsJ
CQkJbWNsa19yYXRlLCByZXQsIHBhcmFtcy0+c2FtcGxlX3JhdGUpOwo+ICsJfQo+ICAKPiAgCW11
dGV4X2xvY2soJnNpaTkwMngtPm11dGV4KTsKPiAgCj4gQEAgLTY0MCw3ICs2NDIsOCBAQCBzdGF0
aWMgaW50IHNpaTkwMnhfYXVkaW9faHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKPiAgCW11dGV4X3VubG9jaygmc2lpOTAyeC0+bXV0ZXgpOwo+ICAKPiAgCWlmIChyZXQp
IHsKPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUoc2lpOTAyeC0+YXVkaW8ubWNsayk7Cj4gKwkJ
aWYgKHNpaTkwMngtPmF1ZGlvLm1jbGspCj4gKwkJCWNsa19kaXNhYmxlX3VucHJlcGFyZShzaWk5
MDJ4LT5hdWRpby5tY2xrKTsKPiAgCQlkZXZfZXJyKGRldiwgIiVzOiBoZG1pIGF1ZGlvIGVuYWJs
ZSBmYWlsZWQ6ICVkXG4iLCBfX2Z1bmNfXywKPiAgCQkJcmV0KTsKPiAgCX0KPiBAQCAtNjU5LDcg
KzY2Miw4IEBAIHN0YXRpYyB2b2lkIHNpaTkwMnhfYXVkaW9fc2h1dGRvd24oc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkICpkYXRhKQo+ICAKPiAgCW11dGV4X3VubG9jaygmc2lpOTAyeC0+bXV0ZXgp
Owo+ICAKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiAr
CWlmIChzaWk5MDJ4LT5hdWRpby5tY2xrKQo+ICsJCWNsa19kaXNhYmxlX3VucHJlcGFyZShzaWk5
MDJ4LT5hdWRpby5tY2xrKTsKPiAgfQo+ICAKPiAgaW50IHNpaTkwMnhfYXVkaW9fZGlnaXRhbF9t
dXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgYm9vbCBlbmFibGUpCj4gQEAgLTc1
Miw5ICs3NTYsMTIgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc3RydWN0
IHNpaTkwMnggKnNpaTkwMngsCj4gIAo+ICAJc2lpOTAyeC0+YXVkaW8ubWNsayA9IGRldm1fY2xr
X2dldChkZXYsICJtY2xrIik7Cj4gIAlpZiAoSVNfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKSB7
Cj4gLQkJZGV2X2VycihkZXYsICIlczogTm8gY2xvY2sgKGF1ZGlvIG1jbGspIGZvdW5kOiAlbGRc
biIsCj4gLQkJCV9fZnVuY19fLCBQVFJfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKTsKPiAtCQly
ZXR1cm4gMDsKPiArCQlpZiAoUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKSAhPSAtRU5PRU5U
KSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiJXM6IE5vIGNsb2NrIChhdWRpbyBtY2xrKSBmb3VuZDog
JWxkXG4iLAo+ICsJCQkJX19mdW5jX18sIFBUUl9FUlIoc2lpOTAyeC0+YXVkaW8ubWNsaykpOwo+
ICsJCQlyZXR1cm4gUFRSX0VSUihzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiArCQl9Cj4gKwkJc2lp
OTAyeC0+YXVkaW8ubWNsayA9IE5VTEw7Cj4gIAl9Cj4gIAo+ICAJc2lpOTAyeC0+YXVkaW8ucGRl
diA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKAo+IAoKCi0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
