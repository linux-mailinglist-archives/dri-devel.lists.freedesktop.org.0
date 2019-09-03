Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CCA62FF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 09:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789DB896FA;
	Tue,  3 Sep 2019 07:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C92896C4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 07:46:48 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f22so17599872edt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 00:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xnOx+dsaGM4fCqh/Xc62siyqAuERwcJMr5nzYkdNOJo=;
 b=Pb8gP1/6ZWi1EyrQnkRU/N9YmIWb1t9/3/C8Gf/7xC7kWJFgkxGW+aH23JNqTDmBCQ
 NHUKPwN8huYcU7b7IS4k5nIFkoSO1xx4TZhlSumDy3FStnebx260C02cDyR+y0Hs4ar2
 JEfSIN6o2shrroxWUlyOjaxZM5GVL6goEyaxLpc1Nb157QCTbS22ympgxx7vcfD/gZsa
 69aGHdmOazbHBeol3YfQWQk22d5t0dEZnscLejTcZ9Em9jG7na9xs1drHNRLx4GIDIFX
 t0thvOzh7cHki9LMaUpUY0Z7w0MYCgO9FFSPaZwhEyR5bzSmcjDYHFZSdZWjlBP9fZgE
 k66g==
X-Gm-Message-State: APjAAAWqhq9ZnsW1hJBQ0RKqcRj4v8NCqDSL5zG+VDMt0NkDxjWjUcvI
 MpQScCksMrwYucx1Nmg+okcN9Q==
X-Google-Smtp-Source: APXvYqyJUmBwQMGhGuAqXR+sud+y8Zc5U0DbOT2PiHVZo2nhN7Okv5sC4vNeiZMVucK7YpwsTpfq4Q==
X-Received: by 2002:a05:6402:785:: with SMTP id
 d5mr34036233edy.210.1567496806981; 
 Tue, 03 Sep 2019 00:46:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id t30sm887305edt.91.2019.09.03.00.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 00:46:46 -0700 (PDT)
Date: Tue, 3 Sep 2019 09:46:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Heinrich Fink <heinrich.fink@daqri.com>
Subject: Re: [PATCH v2] drm: Add high-precision time to vblank trace event
Message-ID: <20190903074644.GI2112@phenom.ffwll.local>
References: <20190814171518.GL7444@phenom.ffwll.local>
 <20190902142412.27846-1-heinrich.fink@daqri.com>
 <20190902142412.27846-2-heinrich.fink@daqri.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902142412.27846-2-heinrich.fink@daqri.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xnOx+dsaGM4fCqh/Xc62siyqAuERwcJMr5nzYkdNOJo=;
 b=S0U56GLjeD36tx9utQQstOuM0LyGJjjnAxCZIT0vJIpCTTBppideSVGTzmdc++0AGn
 PO/eF7HSadjAdV30MGKh1Je3KhD14ibGPgzHojn0htt6r3oCoDuZfQwlqDncX1yt9JlD
 yTVcxfc4DKC2J3LBkm2PoEh1ayH+wcnYonMzg=
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org, keithp@keithp.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMDIsIDIwMTkgYXQgMDQ6MjQ6MTJQTSArMDIwMCwgSGVpbnJpY2ggRmluayB3
cm90ZToKPiBTdG9yZSB0aGUgdGltZXN0YW1wIG9mIHRoZSBjdXJyZW50IHZibGFuayBpbiB0aGUg
bmV3IGZpZWxkICd0aW1lJyBvZiB0aGUKPiB2YmxhbmsgdHJhY2UgZXZlbnQuIElmIHRoZSB0aW1l
c3RhbXAgaXMgY2FsY3VsYXRlZCBieSBhIGRyaXZlciB0aGF0Cj4gc3VwcG9ydHMgaGlnaC1wcmVj
aXNpb24gdmJsYW5rIHRpbWluZywgc2V0IHRoZSBmaWVsZCAnaGlnaC1wcmVjJyB0bwo+ICd0cnVl
Jy4KPiAKPiBVc2VyIHNwYWNlIGNhbiBub3cgYWNjZXNzIGFjdHVhbCBoYXJkd2FyZSB2Ymxhbmsg
dGltZXMgdmlhIHRoZSB0cmFjaW5nCj4gaW5mcmFzdHJ1Y3R1cmUuIFRyYWNpbmcgYXBwbGljYXRp
b25zIChzdWNoIGFzIEdQVVZpcywgc2VlIFswXSBmb3IKPiByZWxhdGVkIGRpc2N1c3Npb24pLCBj
YW4gdXNlIHRoZSBuZXdseSBhZGRlZCBpbmZvcm1hdGlvbiB0byBjb25kdWN0IGEKPiBtb3JlIGFj
Y3VyYXRlIGFuYWx5c2lzIG9mIGRpc3BsYXkgdGltaW5nLgo+IAo+IHYyIEZpeCBhdXRob3IgbmFt
ZSAobWlzc2luZyBsYXN0IG5hbWUpCj4gCj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9taWtlc2Fy
dC9ncHV2aXMvaXNzdWVzLzMwCj4gCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggRmluayA8aGVpbnJp
Y2guZmlua0BkYXFyaS5jb20+CgpBcHBsaWVkLCB0aGFua3MuCi1EYW5pZWwKCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fdHJhY2UuaCAgfCAxNCArKysrKysrKysrLS0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgIDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oCj4gaW5kZXggNDcx
ZWI5Mjc0NzRiLi4xMWM2ZGQ1NzdlOGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV90cmFjZS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oCj4gQEAgLTEzLDE3
ICsxMywyMyBAQCBzdHJ1Y3QgZHJtX2ZpbGU7Cj4gICNkZWZpbmUgVFJBQ0VfSU5DTFVERV9GSUxF
IGRybV90cmFjZQo+ICAKPiAgVFJBQ0VfRVZFTlQoZHJtX3ZibGFua19ldmVudCwKPiAtCSAgICBU
UF9QUk9UTyhpbnQgY3J0YywgdW5zaWduZWQgaW50IHNlcSksCj4gLQkgICAgVFBfQVJHUyhjcnRj
LCBzZXEpLAo+ICsJICAgIFRQX1BST1RPKGludCBjcnRjLCB1bnNpZ25lZCBpbnQgc2VxLCBrdGlt
ZV90IHRpbWUsIGJvb2wgaGlnaF9wcmVjKSwKPiArCSAgICBUUF9BUkdTKGNydGMsIHNlcSwgdGlt
ZSwgaGlnaF9wcmVjKSwKPiAgCSAgICBUUF9TVFJVQ1RfX2VudHJ5KAo+ICAJCSAgICBfX2ZpZWxk
KGludCwgY3J0YykKPiAgCQkgICAgX19maWVsZCh1bnNpZ25lZCBpbnQsIHNlcSkKPiArCQkgICAg
X19maWVsZChrdGltZV90LCB0aW1lKQo+ICsJCSAgICBfX2ZpZWxkKGJvb2wsIGhpZ2hfcHJlYykK
PiAgCQkgICAgKSwKPiAgCSAgICBUUF9mYXN0X2Fzc2lnbigKPiAgCQkgICAgX19lbnRyeS0+Y3J0
YyA9IGNydGM7Cj4gIAkJICAgIF9fZW50cnktPnNlcSA9IHNlcTsKPiAtCQkgICAgKSwKPiAtCSAg
ICBUUF9wcmludGsoImNydGM9JWQsIHNlcT0ldSIsIF9fZW50cnktPmNydGMsIF9fZW50cnktPnNl
cSkKPiArCQkgICAgX19lbnRyeS0+dGltZSA9IHRpbWU7Cj4gKwkJICAgIF9fZW50cnktPmhpZ2hf
cHJlYyA9IGhpZ2hfcHJlYzsKPiArCQkJKSwKPiArCSAgICBUUF9wcmludGsoImNydGM9JWQsIHNl
cT0ldSwgdGltZT0lbGxkLCBoaWdoLXByZWM9JXMiLAo+ICsJCQlfX2VudHJ5LT5jcnRjLCBfX2Vu
dHJ5LT5zZXEsIF9fZW50cnktPnRpbWUsCj4gKwkJCV9fZW50cnktPmhpZ2hfcHJlYyA/ICJ0cnVl
IiA6ICJmYWxzZSIpCj4gICk7Cj4gIAo+ICBUUkFDRV9FVkVOVChkcm1fdmJsYW5rX2V2ZW50X3F1
ZXVlZCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBpbmRleCBmZDFmYmM3Nzg3MWYuLmM5OWZlZGEyNWRl
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IEBAIC0xNzMxLDcgKzE3MzEsOCBAQCBzdGF0aWMg
dm9pZCBkcm1faGFuZGxlX3ZibGFua19ldmVudHMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5z
aWduZWQgaW50IHBpcGUpCj4gIAkJc2VuZF92YmxhbmtfZXZlbnQoZGV2LCBlLCBzZXEsIG5vdyk7
Cj4gIAl9Cj4gIAo+IC0JdHJhY2VfZHJtX3ZibGFua19ldmVudChwaXBlLCBzZXEpOwo+ICsJdHJh
Y2VfZHJtX3ZibGFua19ldmVudChwaXBlLCBzZXEsIG5vdywKPiArCQkJZGV2LT5kcml2ZXItPmdl
dF92YmxhbmtfdGltZXN0YW1wICE9IE5VTEwpOwo+ICB9Cj4gIAo+ICAvKioKPiAtLSAKPiAyLjIz
LjAucmMxCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
