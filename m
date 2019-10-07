Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E197CE964
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1B46E60A;
	Mon,  7 Oct 2019 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0231F6E3F7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:38:24 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id s7so1281521ybq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 09:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FzqVNr7tcxlwpcYADlhda0qZOie+lz7LOX/589zfMus=;
 b=kJcpF2VgkXQ97wnI88c9uhmj9hlVzbONE0uW3HgxB7QKiasAjGmcN2Ps6CXnIb6oVr
 OdKZxDhW1msgjOuzzcGksVgjnsAOCGqeCuTK23sXC6eF4BJOY6th2OhkZqNB1TimVlu5
 wXj0O4SWmtOMxIUHshQ3A7zx9JkbGe6lSMOEvoSv9YIYvy/qg5oc8PY85fB6BfVjL25h
 B6AirF7QIBe5n1b9ECsuGwIcrPNtygQ4GLWEjoZEk/zeP9PWW20GZGSgeT6l/zYhVSsW
 xEEbwmTT52vnxbyNGE9x3RFKtZMYcLtlc6onEFgkBglCqeCd2NPMNkiq7GxJ44alIgk1
 OWJQ==
X-Gm-Message-State: APjAAAXdUr208JlQingB1rI7Bx5OvIM8uxWXKXJuj6prt0Sx51MfNDM6
 FL2B4zO0vhKohLwsKyEOEkA8Ew==
X-Google-Smtp-Source: APXvYqww9OLyqPatL8zc7IngE43C3NP4GfhRl0dthKOPI8ogAAGGRmA5omVo9qg/Jiq5DILIRaCmMg==
X-Received: by 2002:a25:bfc3:: with SMTP id q3mr4652388ybm.507.1570466303991; 
 Mon, 07 Oct 2019 09:38:23 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g20sm3932702ywe.98.2019.10.07.09.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 09:38:23 -0700 (PDT)
Date: Mon, 7 Oct 2019 12:38:22 -0400
From: Sean Paul <sean@poorly.run>
To: Derek Basehore <dbasehore@chromium.org>
Subject: Re: [PATCH v8 1/4] drm/panel: Add helper for reading DT rotation
Message-ID: <20191007163822.GA126146@art_vandelay>
References: <20190925225833.7310-1-dbasehore@chromium.org>
 <20190925225833.7310-2-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925225833.7310-2-dbasehore@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FzqVNr7tcxlwpcYADlhda0qZOie+lz7LOX/589zfMus=;
 b=fxB9cPqg4HqUGdYDivJJPdLacJmb3vp4VEHC//Z5ObTlsNu+ii6NbHEEOfwrQeRYHX
 rk9Jb8c/1D5BKy/LV/oDJUA6MnC9WVmwmt3fSMpUNLRxWG7ZP3rRNW4/ClVWqlZbovZy
 As3Gj9d4k//dQ6J9KSx8hENX+9aQYBCkzmyixVJHF7sf7hj6lmE9pUqAM43YZOgedk1y
 eawFwM01quT63JTy3IF4txAahS6VVT4G3O1ZwheamhN+J4JnEqmVqpUwPmZxqwgvAOzM
 I7psY1x+jCMxZFFJuHBb0X2S9SPae9WZjlXUS1+DbdH7W4YHGmcjuUR0yuC9HHwjsVvw
 tZ8w==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDM6NTg6MzBQTSAtMDcwMCwgRGVyZWsgQmFzZWhvcmUg
d3JvdGU6Cj4gVGhpcyBhZGRzIGEgaGVscGVyIGZ1bmN0aW9uIGZvciByZWFkaW5nIHRoZSByb3Rh
dGlvbiAocGFuZWwKPiBvcmllbnRhdGlvbikgZnJvbSB0aGUgZGV2aWNlIHRyZWUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KClRoZSBwYXRjaCBMR1RN
LCBidXQgSSBkb24ndCBzZWUgaXQgdXNlZCBhbnl3aGVyZSBsYXRlciBpbiB0aGUgcGF0Y2g/IElz
IHRoZXJlIGEKcGFuZWwgZHJpdmVyIGluY29taW5nPwoKU2VhbgoKPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL2RybV9wYW5lbC5jIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAgICAgfCAgOSArKysrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wYW5lbC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gaW5kZXgg
NmIwYmY0MjAzOWNmLi4wOTA5YjUzYjc0ZTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wYW5lbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCj4gQEAgLTI2
NCw2ICsyNjQsNDkgQEAgc3RydWN0IGRybV9wYW5lbCAqb2ZfZHJtX2ZpbmRfcGFuZWwoY29uc3Qg
c3RydWN0IGRldmljZV9ub2RlICpucCkKPiAgCXJldHVybiBFUlJfUFRSKC1FUFJPQkVfREVGRVIp
Owo+ICB9Cj4gIEVYUE9SVF9TWU1CT0wob2ZfZHJtX2ZpbmRfcGFuZWwpOwo+ICsKPiArLyoqCj4g
KyAqIG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24gLSBsb29rIHVwIHRoZSBvcmllbnRhdGlv
biBvZiB0aGUgcGFuZWwgdGhyb3VnaAo+ICsgKiB0aGUgInJvdGF0aW9uIiBiaW5kaW5nIGZyb20g
YSBkZXZpY2UgdHJlZSBub2RlCj4gKyAqIEBucDogZGV2aWNlIHRyZWUgbm9kZSBvZiB0aGUgcGFu
ZWwKPiArICogQG9yaWVudGF0aW9uOiBvcmllbnRhdGlvbiBlbnVtIHRvIGJlIGZpbGxlZCBpbgo+
ICsgKgo+ICsgKiBMb29rcyB1cCB0aGUgcm90YXRpb24gb2YgYSBwYW5lbCBpbiB0aGUgZGV2aWNl
IHRyZWUuIFRoZSBvcmllbnRhdGlvbiBvZiB0aGUKPiArICogcGFuZWwgaXMgZXhwcmVzc2VkIGFz
IGEgcHJvcGVydHkgbmFtZSAicm90YXRpb24iIGluIHRoZSBkZXZpY2UgdHJlZS4gVGhlCj4gKyAq
IHJvdGF0aW9uIGluIHRoZSBkZXZpY2UgdHJlZSBpcyBjb3VudGVyIGNsb2Nrd2lzZS4KPiArICoK
PiArICogUmV0dXJuOiAwIHdoZW4gYSB2YWxpZCByb3RhdGlvbiB2YWx1ZSAoMCwgOTAsIDE4MCwg
b3IgMjcwKSBpcyByZWFkIG9yIHRoZQo+ICsgKiByb3RhdGlvbiBwcm9wZXJ0eSBkb2Vzbid0IGV4
aXN0LiAtRUVSUk9SIG90aGVyd2lzZS4KPiArICovCj4gK2ludCBvZl9kcm1fZ2V0X3BhbmVsX29y
aWVudGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gKwkJCQkgZW51bSBkcm1f
cGFuZWxfb3JpZW50YXRpb24gKm9yaWVudGF0aW9uKQo+ICt7Cj4gKwlpbnQgcm90YXRpb24sIHJl
dDsKPiArCj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInJvdGF0aW9uIiwgJnJv
dGF0aW9uKTsKPiArCWlmIChyZXQgPT0gLUVJTlZBTCkgewo+ICsJCS8qIERvbid0IHJldHVybiBh
biBlcnJvciBpZiB0aGVyZSdzIG5vIHJvdGF0aW9uIHByb3BlcnR5LiAqLwo+ICsJCSpvcmllbnRh
dGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV047Cj4gKwkJcmV0dXJuIDA7
Cj4gKwl9Cj4gKwo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlpZiAo
cm90YXRpb24gPT0gMCkKPiArCQkqb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRB
VElPTl9OT1JNQUw7Cj4gKwllbHNlIGlmIChyb3RhdGlvbiA9PSA5MCkKPiArCQkqb3JpZW50YXRp
b24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9SSUdIVF9VUDsKPiArCWVsc2UgaWYgKHJv
dGF0aW9uID09IDE4MCkKPiArCQkqb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRB
VElPTl9CT1RUT01fVVA7Cj4gKwllbHNlIGlmIChyb3RhdGlvbiA9PSAyNzApCj4gKwkJKm9yaWVu
dGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fTEVGVF9VUDsKPiArCWVsc2UKPiAr
CQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICtFWFBPUlRfU1lNQk9M
KG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24pOwo+ICAjZW5kaWYKPiAgCj4gIE1PRFVMRV9B
VVRIT1IoIlRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Iik7Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKPiBp
bmRleCA2MjRiZDE1ZWNmYWIuLmQxNjE1OGRlYWNkYyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fcGFuZWwuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gQEAgLTM0LDYg
KzM0LDggQEAgc3RydWN0IGRybV9kZXZpY2U7Cj4gIHN0cnVjdCBkcm1fcGFuZWw7Cj4gIHN0cnVj
dCBkaXNwbGF5X3RpbWluZzsKPiAgCj4gK2VudW0gZHJtX3BhbmVsX29yaWVudGF0aW9uOwo+ICsK
PiAgLyoqCj4gICAqIHN0cnVjdCBkcm1fcGFuZWxfZnVuY3MgLSBwZXJmb3JtIG9wZXJhdGlvbnMg
b24gYSBnaXZlbiBwYW5lbAo+ICAgKgo+IEBAIC0xNjUsMTEgKzE2NywxOCBAQCBpbnQgZHJtX3Bh
bmVsX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7Cj4gIAo+ICAjaWYgZGVmaW5l
ZChDT05GSUdfT0YpICYmIGRlZmluZWQoQ09ORklHX0RSTV9QQU5FTCkKPiAgc3RydWN0IGRybV9w
YW5lbCAqb2ZfZHJtX2ZpbmRfcGFuZWwoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCk7Cj4g
K2ludCBvZl9kcm1fZ2V0X3BhbmVsX29yaWVudGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnAsCj4gKwkJCQkgZW51bSBkcm1fcGFuZWxfb3JpZW50YXRpb24gKm9yaWVudGF0aW9uKTsK
PiAgI2Vsc2UKPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3BhbmVsICpvZl9kcm1fZmluZF9w
YW5lbChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICB7Cj4gIAlyZXR1cm4gRVJSX1BU
UigtRU5PREVWKTsKPiAgfQo+ICtzdGF0aWMgaW5saW5lIGludCBvZl9kcm1fZ2V0X3BhbmVsX29y
aWVudGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gKwkJZW51bSBkcm1fcGFu
ZWxfb3JpZW50YXRpb24gKm9yaWVudGF0aW9uKQo+ICt7Cj4gKwlyZXR1cm4gLUVOT0RFVjsKPiAr
fQo+ICAjZW5kaWYKPiAgCj4gICNlbmRpZgo+IC0tIAo+IDIuMjMuMC4zNTEuZ2M0MzE3MDMyZTYt
Z29vZwo+IAoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
