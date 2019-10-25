Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87CE44B1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9936E8C7;
	Fri, 25 Oct 2019 07:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522056E8C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:40:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q70so949796wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 00:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=0i/cK9uMTrwMSE+JKgIVqV/UjjdsSe5pyPCFF7pNniw=;
 b=NygvwEwv3kDepr3yfE8PrjTKOv2xTt6DbIEUkICcBX6cTyuo6kdQ97k6iobiCKCAoX
 sd2C81m0/GqjVbmNBjQlkJERTw/qwKYIMhxpO81VLlReLp5wzheSX7lNanejiqe5NGt5
 5p3VHkEtROzhzgmd9WAS//igzpgicjPpD1s/qQXztMu7qDjJIxIUH3Sp6M7ixpsn179L
 VJntiDintK0VU03xYNbf6IFPsFcyKjIMjl4dPPKRFW9eYfbZYU/0uCISAIEZjalG6ha6
 APD+z7JCV5CCi8jNMeQuliPaq0nXYN1HtVy0iMCgI49WZlglzpOoJMKpmk00qYAXSI50
 4IsQ==
X-Gm-Message-State: APjAAAW/4629Q9O9w5L1/8XvdDToSlWe4IBxMtH+BvXGUkHxyXS422gj
 v38Raqe9NScNK1BYfQWCn5N4eESFy/o=
X-Google-Smtp-Source: APXvYqz0/9O62XwSLCuSGtIQr1CGid6viyLyb5sJrUg+R6K0SkAvOclSpGGZK0BBwVpGoDKAzm4WhA==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr1997091wmb.97.1571989240894; 
 Fri, 25 Oct 2019 00:40:40 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v81sm1687285wmg.4.2019.10.25.00.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:40:40 -0700 (PDT)
Date: Fri, 25 Oct 2019 09:40:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] drm/udl: Add GEM object functions for free(),
 vmap(), and vunmap()
Message-ID: <20191025074038.GQ11828@phenom.ffwll.local>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024144237.8898-4-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0i/cK9uMTrwMSE+JKgIVqV/UjjdsSe5pyPCFF7pNniw=;
 b=DoMGXnFYGXjvX/K3eMrI5fh0XOMTC4Il0e6E6m7UYnna+wSABVh3NPp1VvwREZSII2
 eJNvoFLzHlnDSBCDMaWJGA/uUwSghsDy8VsMUDReHi7H2hM+259VWKjSU7GwnNKAHJn6
 Yfxv/yvbbCueAk1AmCmhs7doinf6Z8uiLiKsA=
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDQ6NDI6MzVQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSW1wbGVtZW50aW5nIHZtYXAoKSBhbmQgdnVubWFwKCkgb2Ygc3RydWN0IGRy
bV9nZW1fb2JqZWN0X2Z1bmNzIGlzCj4gcmVxdWlyZWQgYnkgZ2VuZXJpYyBmYmRldiBlbXVsYXRp
b24uIFN1cHBvcnRpbmcgZnJlZSgpIGlzIGVhc3kgYXMKPiB3ZWxsLiBNb3JlIHVkbC1zcGVjaWZp
YyBpbnRlcmZhY2VzIGNhbiBwcm9iYWJseSBiZSByZXBsYWNlZCBieSBHRU0KPiBvYmplY3QgZnVu
Y3Rpb25zIGluIGxhdGVyIHBhdGNoZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2dlbS5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCj4gaW5k
ZXggM2VhMGNkOWFlMmQ2Li42Y2EwOTdjMjcwZDYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYwo+
IEBAIC0xMSw2ICsxMSw4IEBACj4gIAo+ICAjaW5jbHVkZSAidWRsX2Rydi5oIgo+ICAKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB1ZGxfZ2VtX29iamVjdF9mdW5j
czsKPiArCj4gIHN0cnVjdCB1ZGxfZ2VtX29iamVjdCAqdWRsX2dlbV9hbGxvY19vYmplY3Qoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCQkJCQkgICAgc2l6ZV90IHNpemUpCj4gIHsKPiBAQCAt
MjUsNiArMjcsNyBAQCBzdHJ1Y3QgdWRsX2dlbV9vYmplY3QgKnVkbF9nZW1fYWxsb2Nfb2JqZWN0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJcmV0dXJuIE5VTEw7Cj4gIAl9Cj4gIAo+ICsJ
b2JqLT5iYXNlLmZ1bmNzID0gJnVkbF9nZW1fb2JqZWN0X2Z1bmNzOwo+ICAJb2JqLT5mbGFncyA9
IFVETF9CT19DQUNIRUFCTEU7Cj4gIAlyZXR1cm4gb2JqOwo+ICB9Cj4gQEAgLTIzMCwzICsyMzMs
MzQgQEAgaW50IHVkbF9nZW1fbW1hcChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsCj4gIAltdXRleF91bmxvY2soJnVkbC0+Z2VtX2xvY2spOwo+ICAJcmV0dXJu
IHJldDsKPiAgfQo+ICsKPiArLyoKPiArICogSGVscGVycyBmb3Igc3RydWN0IGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzCj4gKyAqLwo+ICsKPiArc3RhdGljIHZvaWQgdWRsX2dlbV9vYmplY3RfZnJlZShz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiArewo+ICsJdWRsX2dlbV9mcmVlX29iamVjdChv
YmopOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCAqdWRsX2dlbV9vYmplY3Rfdm1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaikKPiArewo+ICsJc3RydWN0IHVkbF9nZW1fb2JqZWN0ICp1b2Jq
ID0gdG9fdWRsX2JvKG9iaik7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXJldCA9IHVkbF9nZW1fdm1h
cCh1b2JqKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIEVSUl9QVFIocmV0KTsKPiArCXJldHVy
biB1b2JqLT52bWFwcGluZzsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgdWRsX2dlbV9vYmplY3Rf
dnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB2b2lkICp2YWRkcikKPiArewo+ICsJ
cmV0dXJuIHVkbF9nZW1fdnVubWFwKHRvX3VkbF9ibyhvYmopKTsKPiArfQo+ICsKPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyB1ZGxfZ2VtX29iamVjdF9mdW5jcyA9
IHsKPiArCS5mcmVlCT0gdWRsX2dlbV9vYmplY3RfZnJlZSwKPiArCS52bWFwCT0gdWRsX2dlbV9v
YmplY3Rfdm1hcCwKPiArCS52dW5tYXAJPSB1ZGxfZ2VtX29iamVjdF92dW5tYXAsCgpZZWFoIHRo
aXMgZG9lc24ndCB3b3JrLCB5b3UgbmVlZCB0byByZWZjb3VudCB0aGUgdm1hcCBoZXJlIEkgdGhp
bmsuIEknZApzYXkgc2ltcGxlciB0byBmaXJzdCBjdXQgb3ZlciB0byBzaG1lbSBoZWxwZXJzLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
