Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A9BE613
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 22:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D15B6F886;
	Wed, 25 Sep 2019 20:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40406F8A8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 20:06:58 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id u15so51115ybm.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ABB1q+Y6RI6wAP3Xdqh99tjF5hOwjSEUMnXMZT6J1rc=;
 b=uncEOK3t4z9u/5blS/iPgWYVz/JG43wVoeGqj2Tnd/Cfthm7obK/pNjxoRGclRCtrd
 QdaoVACjJMasAWEtp38oKYNeI8MWIt3iQ2wwjeWdHj0YdUBLroCDiLClyu8FqGrg86w3
 ryIDU+/PwPZuzmuwiWIR2yVnxVct4pp/6c/oHeScFAwVeptKpHsoaY1RLVyqukPhknln
 ySkk66thQSeen7x1FcngKTE8Jf1ct9vUaEuyiP7ygtFYBhWy0ZWFyKRBBJTEvt9zqKJM
 j6l056R7GOxd6qmUl/imozDVp5VA5ICT8B08pJh3xYTemD11JTAy60iO27Bo56J+6DDY
 eAgA==
X-Gm-Message-State: APjAAAVzKiaBw402Vjb4wBJlWsxvjZOlZzQVfPK0q83lvTIOQ0uqob1z
 H0ExV8Z4xrtDdnrlmVqHD1XXMg==
X-Google-Smtp-Source: APXvYqyz8CyPjhHSKjOQo+MhmqkEhTYzNHVW6eZJ8Ahvkq/qMhDQpurnoTbRWih2z82SMccWkrjB/A==
X-Received: by 2002:a25:b28f:: with SMTP id k15mr4219918ybj.381.1569442017953; 
 Wed, 25 Sep 2019 13:06:57 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k137sm1499578ywk.65.2019.09.25.13.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:06:57 -0700 (PDT)
Date: Wed, 25 Sep 2019 16:06:56 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 22/27] drm/nouveau: Don't grab runtime PM refs for HPD
 IRQs
Message-ID: <20190925200656.GN218215@art_vandelay>
References: <20190903204645.25487-1-lyude@redhat.com>
 <20190903204645.25487-23-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903204645.25487-23-lyude@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=ABB1q+Y6RI6wAP3Xdqh99tjF5hOwjSEUMnXMZT6J1rc=;
 b=CzZfMKa8bfAZ7J9rVawfIImN4IBxaHNbzsDoBVF+7TDRcnO4X2viq87HYwZbCBDRJq
 LEyPe8UbS0mYvr1fbzJS+tWsdcFMGrLBz1YTQCm2nEMTocplBmWSw3lqqQFoHxcekCQG
 vDEfx3/nl9dASKSDx6NnT9fMLBUJZD6YJhg3G+7+BleycoFmJbQ7tzhiLbfQbGFDyHjO
 7qgPDJkFZcLqcv/1lDBGrVYx0GbJ3z1bVC86aPwMTtxQsWVHh6MDUwog35JTpxyflbaY
 iQbpHTMGEeoZq67iCSYh6UQ5owbcpmZcDrhqmHaR2+brZjMuLv2gFwm4YxHrTI8T4jRz
 JVNA==
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Juston Li <juston.li@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Harry Wentland <hwentlan@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDQ6NDY6MDBQTSAtMDQwMCwgTHl1ZGUgUGF1bCB3cm90
ZToKPiBJbiBvcmRlciBmb3Igc3VzcGVuZC9yZXN1bWUgcmVwcm9iaW5nIHRvIHdvcmssIHdlIG5l
ZWQgdG8gYmUgYWJsZSB0bwo+IHBlcmZvcm0gc2lkZWJhbmQgY29tbXVuaWNhdGlvbnMgZHVyaW5n
IHN1c3BlbmQvcmVzdW1lLCBhbG9uZyB3aXRoCj4gcnVudGltZSBQTSBzdXNwZW5kL3Jlc3VtZS4g
SW4gb3JkZXIgdG8gZG8gc28sIHdlIGFsc28gbmVlZCB0byBtYWtlIHN1cmUKPiB0aGF0IG5vdXZl
YXUgZG9lc24ndCBib3RoZXIgZ3JhYmJpbmcgYSBydW50aW1lIFBNIHJlZmVyZW5jZSB0byBkbyBz
bywKPiBzaW5jZSBvdGhlcndpc2Ugd2UnbGwgc3RhcnQgZGVhZGxvY2tpbmcgcnVudGltZSBQTSBh
Z2Fpbi4KPiAKPiBOb3RlIHRoYXQgd2Ugd2VyZW4ndCBhYmxlIHRvIGRvIHRoaXMgYmVmb3JlLCBi
ZWNhdXNlIG9mIHRoZSBEUCBNU1QKPiBoZWxwZXJzIHByb2Nlc3NpbmcgVVAgcmVxdWVzdHMgZnJv
bSB0b3BvbG9naWVzIGluIHRoZSBzYW1lIGNvbnRleHQgYXMKPiBkcm1fZHBfbXN0X2hwZF9pcnEo
KSB3aGljaCB3b3VsZCBoYXZlIGNhdXNlZCB1cyB0byBvcGVuIG91cnNlbHZlcyB1cCB0bwo+IHJl
Y2VpdmluZyBob3RwbHVnIGV2ZW50cyBhbmQgZGVhZGxvY2tpbmcgd2l0aCBydW50aW1lIHN1c3Bl
bmQvcmVzdW1lLgo+IE5vdyB0aGF0IHRob3NlIHJlcXVlc3RzIGFyZSBoYW5kbGVkIGFzeW5jaHJv
bm91c2x5LCB0aGlzIGNoYW5nZSBzaG91bGQKPiBiZSBjb21wbGV0ZWx5IHNhZmUuCj4gCj4gQ2M6
IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPgo+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgo+IENjOiBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgoKU2VlbXMgcmVhc29uYWJsZSB0byBtZSwgYnV0
IHdvdWxkIGZlZWwgYmV0dGVyIGlmIGEgbm91dmVhdSBwZXJzb24gY29uZmlybWVkCgpSZXZpZXdl
ZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyB8IDMzICsrKysrKysrKysrLS0tLS0tLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9y
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gaW5kZXgg
NTY4NzFkMzRlM2ZiLi5mMjc2OTE4ZDNmM2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKPiBAQCAtMTEzMSw2ICsxMTMxLDE2IEBAIG5vdXZlYXVf
Y29ubmVjdG9yX2hvdHBsdWcoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCj4gIAljb25zdCBj
aGFyICpuYW1lID0gY29ubmVjdG9yLT5uYW1lOwo+ICAJc3RydWN0IG5vdXZlYXVfZW5jb2RlciAq
bnZfZW5jb2RlcjsKPiAgCWludCByZXQ7Cj4gKwlib29sIHBsdWdnZWQgPSAocmVwLT5tYXNrICE9
IE5WSUZfTk9USUZZX0NPTk5fVjBfVU5QTFVHKTsKPiArCj4gKwlpZiAocmVwLT5tYXNrICYgTlZJ
Rl9OT1RJRllfQ09OTl9WMF9JUlEpIHsKPiArCQlOVl9ERUJVRyhkcm0sICJzZXJ2aWNlICVzXG4i
LCBuYW1lKTsKPiArCQlkcm1fZHBfY2VjX2lycSgmbnZfY29ubmVjdG9yLT5hdXgpOwo+ICsJCWlm
ICgobnZfZW5jb2RlciA9IGZpbmRfZW5jb2Rlcihjb25uZWN0b3IsIERDQl9PVVRQVVRfRFApKSkK
PiArCQkJbnY1MF9tc3RtX3NlcnZpY2UobnZfZW5jb2Rlci0+ZHAubXN0bSk7Cj4gKwo+ICsJCXJl
dHVybiBOVklGX05PVElGWV9LRUVQOwo+ICsJfQo+ICAKPiAgCXJldCA9IHBtX3J1bnRpbWVfZ2V0
KGRybS0+ZGV2LT5kZXYpOwo+ICAJaWYgKHJldCA9PSAwKSB7Cj4gQEAgLTExNTEsMjUgKzExNjEs
MTYgQEAgbm91dmVhdV9jb25uZWN0b3JfaG90cGx1ZyhzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlm
eSkKPiAgCQlyZXR1cm4gTlZJRl9OT1RJRllfRFJPUDsKPiAgCX0KPiAgCj4gLQlpZiAocmVwLT5t
YXNrICYgTlZJRl9OT1RJRllfQ09OTl9WMF9JUlEpIHsKPiAtCQlOVl9ERUJVRyhkcm0sICJzZXJ2
aWNlICVzXG4iLCBuYW1lKTsKPiAtCQlkcm1fZHBfY2VjX2lycSgmbnZfY29ubmVjdG9yLT5hdXgp
Owo+IC0JCWlmICgobnZfZW5jb2RlciA9IGZpbmRfZW5jb2Rlcihjb25uZWN0b3IsIERDQl9PVVRQ
VVRfRFApKSkKPiAtCQkJbnY1MF9tc3RtX3NlcnZpY2UobnZfZW5jb2Rlci0+ZHAubXN0bSk7Cj4g
LQl9IGVsc2Ugewo+IC0JCWJvb2wgcGx1Z2dlZCA9IChyZXAtPm1hc2sgIT0gTlZJRl9OT1RJRllf
Q09OTl9WMF9VTlBMVUcpOwo+IC0KPiArCWlmICghcGx1Z2dlZCkKPiArCQlkcm1fZHBfY2VjX3Vu
c2V0X2VkaWQoJm52X2Nvbm5lY3Rvci0+YXV4KTsKPiArCU5WX0RFQlVHKGRybSwgIiVzcGx1Z2dl
ZCAlc1xuIiwgcGx1Z2dlZCA/ICIiIDogInVuIiwgbmFtZSk7Cj4gKwlpZiAoKG52X2VuY29kZXIg
PSBmaW5kX2VuY29kZXIoY29ubmVjdG9yLCBEQ0JfT1VUUFVUX0RQKSkpIHsKPiAgCQlpZiAoIXBs
dWdnZWQpCj4gLQkJCWRybV9kcF9jZWNfdW5zZXRfZWRpZCgmbnZfY29ubmVjdG9yLT5hdXgpOwo+
IC0JCU5WX0RFQlVHKGRybSwgIiVzcGx1Z2dlZCAlc1xuIiwgcGx1Z2dlZCA/ICIiIDogInVuIiwg
bmFtZSk7Cj4gLQkJaWYgKChudl9lbmNvZGVyID0gZmluZF9lbmNvZGVyKGNvbm5lY3RvciwgRENC
X09VVFBVVF9EUCkpKSB7Cj4gLQkJCWlmICghcGx1Z2dlZCkKPiAtCQkJCW52NTBfbXN0bV9yZW1v
dmUobnZfZW5jb2Rlci0+ZHAubXN0bSk7Cj4gLQkJfQo+IC0KPiAtCQlkcm1faGVscGVyX2hwZF9p
cnFfZXZlbnQoY29ubmVjdG9yLT5kZXYpOwo+ICsJCQludjUwX21zdG1fcmVtb3ZlKG52X2VuY29k
ZXItPmRwLm1zdG0pOwo+ICAJfQo+ICAKPiArCWRybV9oZWxwZXJfaHBkX2lycV9ldmVudChjb25u
ZWN0b3ItPmRldik7Cj4gKwo+ICAJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkcm0tPmRldi0+
ZGV2KTsKPiAgCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRybS0+ZGV2LT5kZXYpOwo+ICAJ
cmV0dXJuIE5WSUZfTk9USUZZX0tFRVA7Cj4gLS0gCj4gMi4yMS4wCj4gCgotLSAKU2VhbiBQYXVs
LCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
