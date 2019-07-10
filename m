Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BE964998
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2E589798;
	Wed, 10 Jul 2019 15:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A4F89798
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:29:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so2597755eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 08:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=y/90uKinCTD/EcZPFy/7H91bu/g6iDI8p/8nRQf+Ozo=;
 b=ug7uco+Sklvhh4jc6BUq7tT6GoEUXLJ77nAaKKJc38gReVu3G+xJ+LkoC5XArf6nzJ
 rC4+hg9WeNjxyLf+m4Z0l7y4mmZmp4onaAKHuxzN7nmqEDwja+z2mFmYKto2iz/cZmV2
 QVD31bXcSJxDnxsbryq7kjE2uhoYwu+7At0xbU8j2uQT3YJQXnVP6ZnOUJdwxqQGoCmE
 6sD2TZljIJltJN6w4jPzsCr2LL6t1EogNUqqm+hM8FmnwRNJg+76A2LQNyb7JdM16wKN
 sU6j5o8d7Ur2mGasVzF7L4ZFqxVejk3bpznl8jbXdHnEfJbx5l4t1hDp5YBg/gB/JTw9
 7itg==
X-Gm-Message-State: APjAAAVPI3mnAaNDj9s0+pBOrH0TXo7RGxvAQbzr6xIoGCk70f1o0Cwt
 05LrZAg8M4AvBi9n4MfiRzQMCA==
X-Google-Smtp-Source: APXvYqxHD7BbCIY0j77ERUe0I/RA0LlVxarjIDcp+u3qRLt1BgzIdHynfclVK2xy6bU0jl17/2GpRQ==
X-Received: by 2002:a50:8828:: with SMTP id b37mr32306942edb.266.1562772576098; 
 Wed, 10 Jul 2019 08:29:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id c16sm814339edc.58.2019.07.10.08.29.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:29:35 -0700 (PDT)
Date: Wed, 10 Jul 2019 17:29:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maya Rashish <coypu@sdf.org>
Subject: Re: [PATCH 1/1] Drop unused return value to build_power_updown_phy
Message-ID: <20190710152933.GS15868@phenom.ffwll.local>
References: <20190703220259.GA17999@SDF.ORG>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703220259.GA17999@SDF.ORG>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y/90uKinCTD/EcZPFy/7H91bu/g6iDI8p/8nRQf+Ozo=;
 b=IzaZyRapnD0gzfiXJ2hllHCCnRgLst2oU6Kqyw9nUpmzc1bJXClgu7j36xIHJ4IyQy
 hS9yiqgNmGSXrVBqRcESGvOm/c08vtRH6D3zgtr7SHkNqGMTAnBDS8F/ZoIDxJQzfMKI
 Miuih7YatNhBAQjvIQwQNgH26dBAMI0EQqPXA=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciBkb2luZyB0aGlzIHBhdGNoIQoKT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTA6
MDI6NTlQTSArMDAwMCwgTWF5YSBSYXNoaXNoIHdyb3RlOgo+IC0tLQoKV2UgY2FuJ3QgYXBwbHkg
dGhpcyBwYXRjaCBiZWNhdXNlIGl0IGRvZXNuJ3QgZm9sbG93IG5lY2Fzc2FyeSBmb3JtIChzb2IK
bGluZSBtaXNzaW5nKS4gUGxlYXNlIGNoZWNrIG91dDoKCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcv
ZG9jL2h0bWwvdjQuMTcvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNzaWduLXlvdXIt
d29yay10aGUtZGV2ZWxvcGVyLXMtY2VydGlmaWNhdGUtb2Ytb3JpZ2luCgpCdXQgdGhlIGVudGly
ZSBkb2MgaXMgcmVsZXZhbnQgaW4gZ2VuZXJhbC4KClRoYW5rcywgRGFuaWVsCgo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggMDk4NGI5YTM0ZDU1Li41MTRlZjRlYjNmNDIgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBAQCAtNzgwLDcgKzc4MCw3
IEBAIHN0YXRpYyBpbnQgYnVpbGRfYWxsb2NhdGVfcGF5bG9hZChzdHJ1Y3QgZHJtX2RwX3NpZGVi
YW5kX21zZ190eCAqbXNnLCBpbnQgcG9ydF9uCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3Rh
dGljIGludCBidWlsZF9wb3dlcl91cGRvd25fcGh5KHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNn
X3R4ICptc2csCj4gK3N0YXRpYyB2b2lkIGJ1aWxkX3Bvd2VyX3VwZG93bl9waHkoc3RydWN0IGRy
bV9kcF9zaWRlYmFuZF9tc2dfdHggKm1zZywKPiAgCQkJCSAgaW50IHBvcnRfbnVtLCBib29sIHBv
d2VyX3VwKQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ19yZXFfYm9keSByZXE7
Cj4gQEAgLTc5Myw3ICs3OTMsNiBAQCBzdGF0aWMgaW50IGJ1aWxkX3Bvd2VyX3VwZG93bl9waHko
c3RydWN0IGRybV9kcF9zaWRlYmFuZF9tc2dfdHggKm1zZywKPiAgCXJlcS51LnBvcnRfbnVtLnBv
cnRfbnVtYmVyID0gcG9ydF9udW07Cj4gIAlkcm1fZHBfZW5jb2RlX3NpZGViYW5kX3JlcSgmcmVx
LCBtc2cpOwo+ICAJbXNnLT5wYXRoX21zZyA9IHRydWU7Cj4gLQlyZXR1cm4gMDsKPiAgfQo+ICAK
PiAgc3RhdGljIGludCBkcm1fZHBfbXN0X2Fzc2lnbl9wYXlsb2FkX2lkKHN0cnVjdCBkcm1fZHBf
bXN0X3RvcG9sb2d5X21nciAqbWdyLAo+IEBAIC0yMjEyLDcgKzIyMTEsNyBAQCBpbnQgZHJtX2Rw
X3NlbmRfcG93ZXJfdXBkb3duX3BoeShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1n
ciwKPiAgCQkJCSBzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LCBib29sIHBvd2VyX3VwKQo+
ICB7Cj4gIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ190eCAqdHhtc2c7Cj4gLQlpbnQgbGVu
LCByZXQ7Cj4gKwlpbnQgcmV0Owo+ICAKPiAgCXBvcnQgPSBkcm1fZHBfbXN0X3RvcG9sb2d5X2dl
dF9wb3J0X3ZhbGlkYXRlZChtZ3IsIHBvcnQpOwo+ICAJaWYgKCFwb3J0KQo+IEBAIC0yMjI1LDcg
KzIyMjQsNyBAQCBpbnQgZHJtX2RwX3NlbmRfcG93ZXJfdXBkb3duX3BoeShzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwKPiAgCX0KPiAgCj4gIAl0eG1zZy0+ZHN0ID0gcG9ydC0+
cGFyZW50Owo+IC0JbGVuID0gYnVpbGRfcG93ZXJfdXBkb3duX3BoeSh0eG1zZywgcG9ydC0+cG9y
dF9udW0sIHBvd2VyX3VwKTsKPiArCWJ1aWxkX3Bvd2VyX3VwZG93bl9waHkodHhtc2csIHBvcnQt
PnBvcnRfbnVtLCBwb3dlcl91cCk7Cj4gIAlkcm1fZHBfcXVldWVfZG93bl90eChtZ3IsIHR4bXNn
KTsKPiAgCj4gIAlyZXQgPSBkcm1fZHBfbXN0X3dhaXRfdHhfcmVwbHkocG9ydC0+cGFyZW50LCB0
eG1zZyk7Cj4gLS0gCj4gMi4xMS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
