Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F393D533
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F85891AC;
	Tue, 11 Jun 2019 18:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597B891AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:10:02 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so15694589qtk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 11:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eOLu2pv3ntr03fF23gOdX13Tk7BC8vZXwUsKPiu9VxE=;
 b=Yfg5xuBvvt8ZYDqRh9kW7CzUfA5ddEJw0w02/tzmGAU1E7IKXJTSi2AmYo0rBlIOT6
 QqyMHJCofMS2ZtC0Ck5w9ktUBBfaquxTonzzPnlkmeukHzL3P2kUpr9ViMkMxbKwrZ5m
 JBl1zLnMpkUHBpIDeGtvQ43eBctm929XPbCgRScrHO+euQzCwl4Nq0Td8A6LPICwHVBf
 319zwOoPPNXEJQ9iJOi1JM/9RT4ymEj/8deM+1zJHxJenCuk33Do40364PAFbHtYPJ6W
 xv2f/LzZEk0YkGCYEPZaYISjDoRG4yUeh7GubBZmO0LObCKbUQmAyUxMnG38AfbM0KmB
 wgAQ==
X-Gm-Message-State: APjAAAXejGLdEHdd8nnmn0kIzfM12v8PUOC3HEhEYzSN4g013IoNOR/H
 5G5LyRqZ7N21krKdCK3HlCBscA==
X-Google-Smtp-Source: APXvYqyvHdYPwZQmrTxT8DJFd42e4zwEUFfGqYqxQepII7ckzuHdwqYG+6QLY0hYZ4Ekq1LfdXqfUA==
X-Received: by 2002:aed:2fe7:: with SMTP id m94mr63059235qtd.191.1560276601090; 
 Tue, 11 Jun 2019 11:10:01 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id z57sm6848564qta.62.2019.06.11.11.10.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 11:10:00 -0700 (PDT)
Date: Tue, 11 Jun 2019 14:09:59 -0400
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 06/11] drm/rockchip: Use dirtyfb helper
Message-ID: <20190611180719.GB179831@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-7-sean@poorly.run>
 <20190611173912.GL2458@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611173912.GL2458@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eOLu2pv3ntr03fF23gOdX13Tk7BC8vZXwUsKPiu9VxE=;
 b=gYk4MhssKmkwQZ19maJBR4bE6vwfma3JhBXgQSnIYj0auCMAoMj8ot7V9VWKvTZsjC
 7JelP45rZXY/mVLwsNEB1C3Vzmy/XspjXapX/oefVGwUWli2PQo651u6o0qR1PcRDcpe
 sch0Q9D/9u+y9bD3NynRW9bm/r8Adw7KDRO/lkV7bMyhG6fOC/s7DChSw0SMrK/Q2QB1
 Cq4kBIoBmG9zf1lGcVJhO/Zr+/C9UQrYRsHpyRMphNNz3+AuQqz1KWI/ZR66dS/Fzi+j
 KtLimPwVEQhLndQPxDYqpjpbuOb9fMG8uWOmevXlRztOe9uh3GylXQvV+4NLRTh+8aIL
 liNg==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDc6Mzk6MTJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAxMjowODoyMFBNIC0wNDAwLCBTZWFuIFBh
dWwgd3JvdGU6Cj4gPiBGcm9tOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KPiA+
IAo+ID4gSW5zdGVhZCBvZiBmbHVzaGluZyBhbGwgdm9wcyBldmVyeSB0aW1lIHdlIGdldCBhIGRp
cnR5ZmIgY2FsbCwgdXNlIHRoZQo+ID4gZGFtYWdlIGhlbHBlciB0byBraWNrIG9mZiBhbiBhdG9t
aWMgY29tbWl0LiBFdmVuIHRob3VnaCB3ZSBkb24ndCB1c2UKPiA+IGRhbWFnZSBjbGlwcywgdGhl
IGhlbHBlciBjb21taXQgd2lsbCBmb3JjZSB1cyB0aHJvdWdoIHRoZSBub3JtYWwKPiA+IHBzcl9p
bmhpYml0X2dldC9wdXQgc2VxdWVuY2UuCj4gPiAKPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAtIEFk
ZGVkIHRvIHRoZSBzZXQKPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIE5vbmUKPiA+IENoYW5nZXMg
aW4gdjU6Cj4gPiAtIE5vbmUKPiA+IAo+ID4gTGluayB0byB2MzogaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTAyMTk0OTU2LjIxODQ0MS03LXNlYW5A
cG9vcmx5LnJ1bgo+ID4gTGluayB0byB2NDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoL21zZ2lkLzIwMTkwNTA4MTYwOTIwLjE0NDczOS03LXNlYW5AcG9vcmx5LnJ1bgo+
ID4gCj4gPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+
IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IFJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKVGhhbmtzIQoKPiAKPiBi
dHcgc29tZXdoYXQgYmlnZ2VyIGZpc2ggdG8gZnJ5LCBidXQgaW1vIGFsc28gdmVyeSBtdWNoIHdv
cnRoIGl0Ogo+IFN3aXRjaGluZyBvdmVyIHRvIHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbi4K
CkFncmVlZCwgdGhpcyB0ZW5kcyB0byBnZXQgc3dlcHQgdW5kZXIgdGhlIHJ1ZyBvbiBDck9TIGRl
dmljZXMgc2luY2Ugd2UgZG9uJ3QgdXNlCmZiZGV2IDovCgo+IAo+IEFsc28sIHNpbmNlIGV2ZXJ5
dGhpbmcgdXAgdG8gdGhpcyBvbmUgaXMgcmV2aWV3ZWQgSSB0aGluayB3b3VsZCBiZSBnb29kIHRv
Cj4gbGFuZCB0aGF0IHBhcnQgYWxyZWFkeS4gU28gSSBjYW4gZ28gYXJvdW5kIGFuZCBoYWdnbGUg
dGhpcyB0byBvdGhlcgo+IGRyaXZlcnMgOi0pCgpTb3VuZHMgZ29vZCB0byBtZSwgaXQnbGwgYmUg
bmljZSB0byBvZmZsb2FkIHNvbWUgb2YgdGhlIHBhdGNoZXMgSSd2ZSBiZWVuCmNhcnJ5aW5nLgoK
VGhhbmtzIGFnYWluIGZvciB0aGUgcmV2aWV3cywKClNlYW4KCj4gLURhbmllbAo+IAo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jIHwgMTMgKyst
LS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3Jv
Y2tjaGlwX2RybV9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9m
Yi5jCj4gPiBpbmRleCAzMTAzMGNmODFiYzk3Li5hODg4ZTMxYWE1NDVhIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKPiA+IEBAIC0xNiw2ICsx
Niw3IEBACj4gPiAgI2luY2x1ZGUgPGRybS9kcm0uaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybVAu
aD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPiA+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9kYW1hZ2VfaGVscGVyLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+Cj4g
PiAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgo+ID4gICNpbmNs
dWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+ID4gQEAgLTI1LDIwICsyNiwxMCBAQAo+ID4g
ICNpbmNsdWRlICJyb2NrY2hpcF9kcm1fZ2VtLmgiCj4gPiAgI2luY2x1ZGUgInJvY2tjaGlwX2Ry
bV9wc3IuaCIKPiA+ICAKPiA+IC1zdGF0aWMgaW50IHJvY2tjaGlwX2RybV9mYl9kaXJ0eShzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKPiA+IC0JCQkJIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwK
PiA+IC0JCQkJIHVuc2lnbmVkIGludCBmbGFncywgdW5zaWduZWQgaW50IGNvbG9yLAo+ID4gLQkJ
CQkgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXBzLAo+ID4gLQkJCQkgdW5zaWduZWQgaW50IG51
bV9jbGlwcykKPiA+IC17Cj4gPiAtCXJvY2tjaGlwX2RybV9wc3JfZmx1c2hfYWxsKGZiLT5kZXYp
Owo+ID4gLQlyZXR1cm4gMDsKPiA+IC19Cj4gPiAtCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZnJhbWVidWZmZXJfZnVuY3Mgcm9ja2NoaXBfZHJtX2ZiX2Z1bmNzID0gewo+ID4gIAkuZGVz
dHJveSAgICAgICA9IGRybV9nZW1fZmJfZGVzdHJveSwKPiA+ICAJLmNyZWF0ZV9oYW5kbGUgPSBk
cm1fZ2VtX2ZiX2NyZWF0ZV9oYW5kbGUsCj4gPiAtCS5kaXJ0eQkgICAgICAgPSByb2NrY2hpcF9k
cm1fZmJfZGlydHksCj4gPiArCS5kaXJ0eQkgICAgICAgPSBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0
eWZiLAo+ID4gIH07Cj4gPiAgCj4gPiAgc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKgo+
ID4gLS0gCj4gPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1
bSBPUwo+ID4gCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgotLSAKU2VhbiBQYXVsLCBT
b2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
