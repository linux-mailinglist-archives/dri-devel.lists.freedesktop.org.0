Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793B274E29
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 14:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED8E6E73B;
	Thu, 25 Jul 2019 12:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8816E73B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 12:31:36 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so36261999qkj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 05:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3vOhJr4R9IHXs2ns1CQPNi9tups8zk+9lQf/RJAnA0w=;
 b=EPgcc0q6I+xn6cCGT6TKvIUYRgzQFQkJcuFRYIccy/vPFrm9pe7UlPwKeVF4tLgdfP
 UFO6SMwzJNivNuiwB53FUqBKBlEKxrQ3UKDkrd4NbgHpIDU2TYJZ7IqdD1T0kPgm+o9z
 hSv6D//W5K7eAzhCQX+N1bCsqVeRYPZpfMTU2KWjlHvP5++h88nAt7Gv0jsS78ic17zu
 J/2LXDfZczr9pXtZHGuHWW9cQl0PFzIz47Qz7S8svLjHZeJ1JQR3M/94QSF4+w5tWMYH
 9Ge3cGPe0eF0wPsJ0KAXKXgHEj3MX6lxC3mQkCukbNU60HZPKQp7fxkn5g0iWnEEf6ip
 07yg==
X-Gm-Message-State: APjAAAWGwN2XpK5bnzoFMc/tFV/8jYDAYosstDkMrZYR0zGmfM4TvO2R
 8JZrqkZOY9xgRAmMIXPllaXpAD8wNd7shsjEXtgqBQ==
X-Google-Smtp-Source: APXvYqzw0OOD7qxJ+qp3p00p/2GWwD3VFv4Bn031dtzHiYXsJAGBNbun3scyLD1DLCPkYYTMixPKN3qbD+BIOKe+yV4=
X-Received: by 2002:a05:620a:1286:: with SMTP id
 w6mr56787652qki.219.1564057895419; 
 Thu, 25 Jul 2019 05:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <129ffc9a-0bfc-354e-c4a1-9043260832c0@ti.com>
In-Reply-To: <129ffc9a-0bfc-354e-c4a1-9043260832c0@ti.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 14:31:24 +0200
Message-ID: <CA+M3ks6H4OC0SUUj=34OxCq-chA-W_YxO_xs_0hkJAuxQv12JQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
To: Jyri Sarha <jsarha@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3vOhJr4R9IHXs2ns1CQPNi9tups8zk+9lQf/RJAnA0w=;
 b=oyGpE2Mdzy7CUufchd8ehSD43VuTFwk8fz2D/ftoUm+otR7MhqugXIeS0KEE3Y2HvZ
 y8Ur6mOC9Ux+nbHqhK5HwulszZ7kC9jZe+6ctmJpl83GjOrr6ngsFAHfCtnmeBr30L9i
 HIbouEFLFnWjGWiYVh6RcUsSKFNhhscC1Wv2Skt+AT2xCaBZvNr2Mc4Xfl3f8FMy+axk
 Ytx39Mgh9a3bzcryxeAEPDFMahDuRnO6Q6lhJFoOVQko81LaCcchwFiwLFJ23i6LJ/7H
 yCrbyaIRSyTEFGh7IY+eROAyPHPH2hjL8Bv2PSRyfDdwYUnlUwqmBnvxtmSclgsHCCd+
 fPig==
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
Cc: jernej.skrabec@siol.net, Olivier Moysan <olivier.moysan@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgamV1LiAxMSBqdWlsLiAyMDE5IMOgIDEzOjA5LCBKeXJpIFNhcmhhIDxqc2FyaGFAdGkuY29t
PiBhIMOpY3JpdCA6Cj4KPiBPbiAwMy8wNy8yMDE5IDExOjA0LCBPbGl2aWVyIE1veXNhbiB3cm90
ZToKPiA+IEltcGxlbWVudCBnZXRfZGFpX2lkIGNhbGxiYWNrIG9mIGF1ZGlvIEhETUkgY29kZWMK
PiA+IHRvIHN1cHBvcnQgQVNvQyBhdWRpbyBncmFwaCBjYXJkLgo+ID4gSERNSSBhdWRpbyBvdXRw
dXQgaGFzIHRvIGJlIGNvbm5lY3RlZCB0byBzaWk5MDJ4IHBvcnQgMy4KPiA+IGdldF9kYWlfaWQg
Y2FsbGJhY2sgbWFwcyB0aGlzIHBvcnQgdG8gQVNvQyBEQUkgaW5kZXggMC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lzYW5Ac3QuY29tPgo+Cj4gSSBo
YXZlIG5vdCB1c2VkIGF1ZGlvIGdyYXBoIGJpbmRpbmcsIGJ1dCBjb21wYXJlZCB0byB0aGUgb3Ro
ZXIKPiBnZXRfZGFpX2lkKCkgaW1wbGVtZW50YXRpb25zLCB0aGlzIGxvb2tzIGlkZW50aWNhbC4g
U286Cj4KPiBSZXZpZXdlZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KCkFwcGxpZWQg
b24gZHJtLW1pc2MtbmV4dCwKVGhhbmtzLApCZW5qYW1pbgoKPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zaWk5MDJ4LmMKPiA+IGluZGV4IGRkN2FhNDY2YjI4MC4uZGFmOWVmM2NkODE3IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gPiBAQCAtMTU4LDYgKzE1OCw4IEBACj4gPgo+
ID4gICNkZWZpbmUgU0lJOTAyWF9JMkNfQlVTX0FDUVVJU0lUSU9OX1RJTUVPVVRfTVMgICAgICAg
NTAwCj4gPgo+ID4gKyNkZWZpbmUgU0lJOTAyWF9BVURJT19QT1JUX0lOREVYICAgICAgICAgICAg
IDMKPiA+ICsKPiA+ICBzdHJ1Y3Qgc2lpOTAyeCB7Cj4gPiAgICAgICBzdHJ1Y3QgaTJjX2NsaWVu
dCAqaTJjOwo+ID4gICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4gQEAgLTY5MCwxMSAr
NjkyLDMyIEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19nZXRfZWxkKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKPiA+ICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiArc3Rh
dGljIGludCBzaWk5MDJ4X2F1ZGlvX2dldF9kYWlfaWQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
ICpjb21wb25lbnQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRldmljZV9ub2RlICplbmRwb2ludCkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qgb2ZfZW5kcG9p
bnQgb2ZfZXA7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0ID0gb2ZfZ3Jh
cGhfcGFyc2VfZW5kcG9pbnQoZW5kcG9pbnQsICZvZl9lcCk7Cj4gPiArICAgICBpZiAocmV0IDwg
MCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiAr
ICAgICAgKiBIRE1JIHNvdW5kIHNob3VsZCBiZSBsb2NhdGVkIGF0IHJlZyA9IDwzPgo+ID4gKyAg
ICAgICogUmV0dXJuIGV4cGVjdGVkIERBSSBpbmRleCAwLgo+ID4gKyAgICAgICovCj4gPiArICAg
ICBpZiAob2ZfZXAucG9ydCA9PSBTSUk5MDJYX0FVRElPX1BPUlRfSU5ERVgpCj4gPiArICAgICAg
ICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArfQo+
ID4gKwo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgc2lpOTAyeF9hdWRp
b19jb2RlY19vcHMgPSB7Cj4gPiAgICAgICAuaHdfcGFyYW1zID0gc2lpOTAyeF9hdWRpb19od19w
YXJhbXMsCj4gPiAgICAgICAuYXVkaW9fc2h1dGRvd24gPSBzaWk5MDJ4X2F1ZGlvX3NodXRkb3du
LAo+ID4gICAgICAgLmRpZ2l0YWxfbXV0ZSA9IHNpaTkwMnhfYXVkaW9fZGlnaXRhbF9tdXRlLAo+
ID4gICAgICAgLmdldF9lbGQgPSBzaWk5MDJ4X2F1ZGlvX2dldF9lbGQsCj4gPiArICAgICAuZ2V0
X2RhaV9pZCA9IHNpaTkwMnhfYXVkaW9fZ2V0X2RhaV9pZCwKPiA+ICB9Owo+ID4KPiA+ICBzdGF0
aWMgaW50IHNpaTkwMnhfYXVkaW9fY29kZWNfaW5pdChzdHJ1Y3Qgc2lpOTAyeCAqc2lpOTAyeCwK
PiA+Cj4KPgo+IC0tCj4gVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0
dSAyMiwgMDAxODAgSGVsc2lua2kuCj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4g
S290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
