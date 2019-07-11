Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F7654F7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 13:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0566E180;
	Thu, 11 Jul 2019 11:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81FA6E180
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 11:09:32 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6BB9MDe053453;
 Thu, 11 Jul 2019 06:09:22 -0500
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6BB9MJc085551
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 11 Jul 2019 06:09:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 11
 Jul 2019 06:09:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 11 Jul 2019 06:09:21 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6BB9Ie6040787;
 Thu, 11 Jul 2019 06:09:19 -0500
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
To: Olivier Moysan <olivier.moysan@st.com>, <a.hajda@samsung.com>,
 <narmstrong@baylibre.com>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@siol.net>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <benjamin.gaignard@st.com>,
 <alexandre.torgue@st.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <129ffc9a-0bfc-354e-c4a1-9043260832c0@ti.com>
Date: Thu, 11 Jul 2019 14:09:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562843362;
 bh=IoJeqBXj9O3mqMI6W2UF1gfj+W7lgmJc4UiGpPN5+u4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=nOgoKvrSe+uHjxrCkk95CFF2l6/dhuMPR3CsO4o6Zme7QJ31G5mV10Vin12IL3hee
 a5SQ0qzQVah6xiHP7wtImKfwB3DSO8l7Dn28PkzjtXG0u6IGOqiByosd1OT0XX2qCd
 HFBLVPPytS13qAcJJagDF0E3x2uAthYbr/uvuhIE=
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

T24gMDMvMDcvMjAxOSAxMTowNCwgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4gSW1wbGVtZW50IGdl
dF9kYWlfaWQgY2FsbGJhY2sgb2YgYXVkaW8gSERNSSBjb2RlYwo+IHRvIHN1cHBvcnQgQVNvQyBh
dWRpbyBncmFwaCBjYXJkLgo+IEhETUkgYXVkaW8gb3V0cHV0IGhhcyB0byBiZSBjb25uZWN0ZWQg
dG8gc2lpOTAyeCBwb3J0IDMuCj4gZ2V0X2RhaV9pZCBjYWxsYmFjayBtYXBzIHRoaXMgcG9ydCB0
byBBU29DIERBSSBpbmRleCAwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxv
bGl2aWVyLm1veXNhbkBzdC5jb20+CgpJIGhhdmUgbm90IHVzZWQgYXVkaW8gZ3JhcGggYmluZGlu
ZywgYnV0IGNvbXBhcmVkIHRvIHRoZSBvdGhlcgpnZXRfZGFpX2lkKCkgaW1wbGVtZW50YXRpb25z
LCB0aGlzIGxvb2tzIGlkZW50aWNhbC4gU286CgpSZXZpZXdlZC1ieTogSnlyaSBTYXJoYSA8anNh
cmhhQHRpLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIHwg
MjMgKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+IGluZGV4IGRkN2FhNDY2YjI4MC4u
ZGFmOWVmM2NkODE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAy
eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtMTU4LDYg
KzE1OCw4IEBACj4gIAo+ICAjZGVmaW5lIFNJSTkwMlhfSTJDX0JVU19BQ1FVSVNJVElPTl9USU1F
T1VUX01TCTUwMAo+ICAKPiArI2RlZmluZSBTSUk5MDJYX0FVRElPX1BPUlRfSU5ERVgJCTMKPiAr
Cj4gIHN0cnVjdCBzaWk5MDJ4IHsKPiAgCXN0cnVjdCBpMmNfY2xpZW50ICppMmM7Cj4gIAlzdHJ1
Y3QgcmVnbWFwICpyZWdtYXA7Cj4gQEAgLTY5MCwxMSArNjkyLDMyIEBAIHN0YXRpYyBpbnQgc2lp
OTAyeF9hdWRpb19nZXRfZWxkKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgCXJl
dHVybiAwOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fZ2V0X2RhaV9pZChz
dHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiArCQkJCSAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKmVuZHBvaW50KQo+ICt7Cj4gKwlzdHJ1Y3Qgb2ZfZW5kcG9pbnQgb2ZfZXA7Cj4g
KwlpbnQgcmV0Owo+ICsKPiArCXJldCA9IG9mX2dyYXBoX3BhcnNlX2VuZHBvaW50KGVuZHBvaW50
LCAmb2ZfZXApOwo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwkvKgo+
ICsJICogSERNSSBzb3VuZCBzaG91bGQgYmUgbG9jYXRlZCBhdCByZWcgPSA8Mz4KPiArCSAqIFJl
dHVybiBleHBlY3RlZCBEQUkgaW5kZXggMC4KPiArCSAqLwo+ICsJaWYgKG9mX2VwLnBvcnQgPT0g
U0lJOTAyWF9BVURJT19QT1JUX0lOREVYKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCXJldHVybiAt
RUlOVkFMOwo+ICt9Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGhkbWlfY29kZWNfb3BzIHNp
aTkwMnhfYXVkaW9fY29kZWNfb3BzID0gewo+ICAJLmh3X3BhcmFtcyA9IHNpaTkwMnhfYXVkaW9f
aHdfcGFyYW1zLAo+ICAJLmF1ZGlvX3NodXRkb3duID0gc2lpOTAyeF9hdWRpb19zaHV0ZG93biwK
PiAgCS5kaWdpdGFsX211dGUgPSBzaWk5MDJ4X2F1ZGlvX2RpZ2l0YWxfbXV0ZSwKPiAgCS5nZXRf
ZWxkID0gc2lpOTAyeF9hdWRpb19nZXRfZWxkLAo+ICsJLmdldF9kYWlfaWQgPSBzaWk5MDJ4X2F1
ZGlvX2dldF9kYWlfaWQsCj4gIH07Cj4gIAo+ICBzdGF0aWMgaW50IHNpaTkwMnhfYXVkaW9fY29k
ZWNfaW5pdChzdHJ1Y3Qgc2lpOTAyeCAqc2lpOTAyeCwKPiAKCgotLSAKVGV4YXMgSW5zdHJ1bWVu
dHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVz
L0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
