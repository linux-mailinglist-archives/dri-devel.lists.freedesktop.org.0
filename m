Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7437B64987
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FACC6E100;
	Wed, 10 Jul 2019 15:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB396E100
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:27:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id m10so2578540edv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=SgkufzQSTv6apsZUdNJaHjQjszSiq6lRFJLPOSo/AdU=;
 b=Q9Y2IfsZrP/qVAb/VEpp5C4DpU4/4BnH1NOSgXjbfrh2afl+3EsF9Z3tih4eKhvZsJ
 S6phVWLNT9aGVzXS5KTrGnFj1UrZ5ZrKnGgVcAU1CPjvVCzcq/rSIr1rwJl2/F9Lm3Hj
 E/YrOCr3oSmZNJiatLJxI4iqmzWhfmPp3iUGOqQXOdo4IjroowzFPtaP5Ol3hckcaAor
 Dma29Dz9MzcxIzVyBZeV+kA7FIt20b349DbwSfHUFvAHAQv4d1E2YoBf7GNZvOHAz+c/
 BFz7u4uF7Qw75sfBjKO6L86tZhDQICo3fQzprRoYopmVzISxCQO/iTObBJAxVyZjP8J/
 WfuA==
X-Gm-Message-State: APjAAAU0YE+Ix4hv/diWQ0GW3FOITeTndeqJ7raymWvgHcDLtOZaecKT
 gcd4fPJzqBdeXEGT0uoqU9hXJw==
X-Google-Smtp-Source: APXvYqxigJ129/HrafCJTtiUL+NQg3j1KH4mPx69jB2LtBZDhrvgMPNuqQpiv9e5nrCEaY/ZCC3gxA==
X-Received: by 2002:a17:906:12d7:: with SMTP id
 l23mr26929442ejb.282.1562772443347; 
 Wed, 10 Jul 2019 08:27:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q50sm811398edd.91.2019.07.10.08.27.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:27:22 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:27:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add audio graph card support
Message-ID: <20190710152720.GR15868@phenom.ffwll.local>
Mail-Followup-To: Philippe CORNU <philippe.cornu@st.com>,
 Olivier MOYSAN <olivier.moysan@st.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "jsarha@ti.com" <jsarha@ti.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=SgkufzQSTv6apsZUdNJaHjQjszSiq6lRFJLPOSo/AdU=;
 b=MPgH/N4l+levG/VhKT8jjXObPZPdcPsPGW9l4OkxWmh5Mga2fY36xiK9/aWYGSDWoA
 bZRJFhK/XNZzPxm2cB6rV9EN2rfyFht230HqwAoiyw113/16g8xpwbQ4NmZqP/eQrGRT
 eHf2BSBk83dh088+VhXnml/jxzrTjM1zMyJMY=
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
Cc: "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 Olivier MOYSAN <olivier.moysan@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "airlied@linux.ie" <airlied@linux.ie>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "jsarha@ti.com" <jsarha@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTI6NDE6MDNQTSArMDAwMCwgUGhpbGlwcGUgQ09STlUg
d3JvdGU6Cj4gSGkgT2xpdmllciwKPiBhbmQgbWFueSB0aGFua3MgZm9yIHlvdXIgcGF0Y2guCj4g
R29vZCB0byBoYXZlIHRoZSBhdWRpbyBncmFwaCBjYXJkIHN1cHBvcnQsIGxvb2tzIG9rLgo+IFJl
dmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPgoKU2luY2Ug
eW91IGhhdmUgZHJtLW1pc2MgY29tbWl0IHJpZ2h0cyBJJ20gYXNzdW1pbmcgeW91J3JlIGdvaW5n
IHRvIHB1c2gKdGhpcyB0b28uIENvcnJlY3Q/Ci1EYW5pZWwKCj4gUGhpbGlwcGUgOi0pCj4gCj4g
T24gNy8zLzE5IDEwOjA0IEFNLCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPiA+IEltcGxlbWVudCBn
ZXRfZGFpX2lkIGNhbGxiYWNrIG9mIGF1ZGlvIEhETUkgY29kZWMKPiA+IHRvIHN1cHBvcnQgQVNv
QyBhdWRpbyBncmFwaCBjYXJkLgo+ID4gSERNSSBhdWRpbyBvdXRwdXQgaGFzIHRvIGJlIGNvbm5l
Y3RlZCB0byBzaWk5MDJ4IHBvcnQgMy4KPiA+IGdldF9kYWlfaWQgY2FsbGJhY2sgbWFwcyB0aGlz
IHBvcnQgdG8gQVNvQyBEQUkgaW5kZXggMC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogT2xpdmll
ciBNb3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c2lpOTAyeC5jCj4gPiBpbmRleCBkZDdhYTQ2NmIyODAuLmRhZjllZjNjZDgxNyAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+ID4gQEAgLTE1OCw2ICsxNTgsOCBAQAo+ID4gICAK
PiA+ICAgI2RlZmluZSBTSUk5MDJYX0kyQ19CVVNfQUNRVUlTSVRJT05fVElNRU9VVF9NUwk1MDAK
PiA+ICAgCj4gPiArI2RlZmluZSBTSUk5MDJYX0FVRElPX1BPUlRfSU5ERVgJCTMKPiA+ICsKPiA+
ICAgc3RydWN0IHNpaTkwMnggewo+ID4gICAJc3RydWN0IGkyY19jbGllbnQgKmkyYzsKPiA+ICAg
CXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiA+IEBAIC02OTAsMTEgKzY5MiwzMiBAQCBzdGF0aWMg
aW50IHNpaTkwMnhfYXVkaW9fZ2V0X2VsZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEs
Cj4gPiAgIAlyZXR1cm4gMDsKPiA+ICAgfQo+ID4gICAKPiA+ICtzdGF0aWMgaW50IHNpaTkwMnhf
YXVkaW9fZ2V0X2RhaV9pZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKPiA+
ICsJCQkJICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqZW5kcG9pbnQpCj4gPiArewo+ID4gKwlzdHJ1
Y3Qgb2ZfZW5kcG9pbnQgb2ZfZXA7Cj4gPiArCWludCByZXQ7Cj4gPiArCj4gPiArCXJldCA9IG9m
X2dyYXBoX3BhcnNlX2VuZHBvaW50KGVuZHBvaW50LCAmb2ZfZXApOwo+ID4gKwlpZiAocmV0IDwg
MCkKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIEhETUkgc291bmQg
c2hvdWxkIGJlIGxvY2F0ZWQgYXQgcmVnID0gPDM+Cj4gPiArCSAqIFJldHVybiBleHBlY3RlZCBE
QUkgaW5kZXggMC4KPiA+ICsJICovCj4gPiArCWlmIChvZl9lcC5wb3J0ID09IFNJSTkwMlhfQVVE
SU9fUE9SVF9JTkRFWCkKPiA+ICsJCXJldHVybiAwOwo+ID4gKwo+ID4gKwlyZXR1cm4gLUVJTlZB
TDsKPiA+ICt9Cj4gPiArCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMg
c2lpOTAyeF9hdWRpb19jb2RlY19vcHMgPSB7Cj4gPiAgIAkuaHdfcGFyYW1zID0gc2lpOTAyeF9h
dWRpb19od19wYXJhbXMsCj4gPiAgIAkuYXVkaW9fc2h1dGRvd24gPSBzaWk5MDJ4X2F1ZGlvX3No
dXRkb3duLAo+ID4gICAJLmRpZ2l0YWxfbXV0ZSA9IHNpaTkwMnhfYXVkaW9fZGlnaXRhbF9tdXRl
LAo+ID4gICAJLmdldF9lbGQgPSBzaWk5MDJ4X2F1ZGlvX2dldF9lbGQsCj4gPiArCS5nZXRfZGFp
X2lkID0gc2lpOTAyeF9hdWRpb19nZXRfZGFpX2lkLAo+ID4gICB9Owo+ID4gICAKPiA+ICAgc3Rh
dGljIGludCBzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc3RydWN0IHNpaTkwMnggKnNpaTkwMngs
Cj4gPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
