Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B13944D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 20:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641A389E36;
	Fri,  7 Jun 2019 18:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58E89E3E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 18:27:07 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c26so4320875edt.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 11:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=8kCDCieMLmldmK2W4BYM5BahSHh9W1C7qTFz6DelB3I=;
 b=ZXK3QvRKyJ0X6rC1Qb53kqyePiMAEd9Jv8Q+yIhpyWzquWGBGUNOmGTZPjQKD3Cq8Z
 bv/HWwdoW8bxTk8CzF/qzsNHvsxBunaYBoxgc3hb0yT2Vzlhspn9Dx2cZvjuHbbIJmH4
 Ea3bqQ0yUJUkIOG5S7XtRoCBZQlZgiFo9lb41HCduGsgaN7cN/Iz5sxyWmeFK+YUPDAt
 h+7AnqM/Eij5jdhEOyqfqSjRPaM0dbWP9vZc9Lzj0cobKzO6UHoQQQESeQl/bLfPyyh9
 DYvCbYi5o5SEtTlT0FTFwW/ZgfnE085USc1hxiLwN/0Yq9ZOHklW3hAtg99fTtELpT8X
 3rZw==
X-Gm-Message-State: APjAAAVt3Yr43QpDrksVuxwsvl0qJuiBHm49FFhwLSNN/89QhTeffb/U
 mHaaCETvHrkHYnLSYJm5cdUyOw==
X-Google-Smtp-Source: APXvYqwOUoHyH5L5O70eBQw2y5PufyBCm24YvCewEq8IGStBbAWVVjJOyPWVO4woCZ7G9p9d48cPSQ==
X-Received: by 2002:a50:cac1:: with SMTP id f1mr57466167edi.97.1559932026171; 
 Fri, 07 Jun 2019 11:27:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g18sm700350edh.13.2019.06.07.11.27.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 11:27:05 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:27:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm: Refuse to create zero width/height
 cmdline modes
Message-ID: <20190607182703.GM21222@phenom.ffwll.local>
References: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
 <20190607162611.23514-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607162611.23514-2-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=8kCDCieMLmldmK2W4BYM5BahSHh9W1C7qTFz6DelB3I=;
 b=Ai36x2/bUpo3TBYhmry1v5ukLMwvWUrZMFZzDlmfXOpgTb1hkyHe21EA99NiVxCHb5
 iZIIhcBpIAIe5bvzkT6Bu9YIqONICjvZYgb4JX2V76DaXUlkvCMNOYp8OnTIpzJcvdgH
 AZdNzFPyLj/orbPIqxAsktjiWF8npL7w9dGes=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDc6MjY6MDlQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IElmIHRoZSB1c2VyIHNwZWNpZmllcyB6ZXJvIHdpZHRoL2hlaWdodCBjbWRsaW5l
IG1vZGUgaTkxNSB3aWxsCj4gYmxvdyB1cCBhcyB0aGUgZmJkZXYgcGF0aCB3aWxsIGJ5cGFzcyB0
aGUgcmVndWxhciBmYiBzYW5pdHkKPiBjaGVjayB0aGF0IHdvdWxkIG90aGVyd2lzZSBoYXZlIHJl
ZnVzZWQgdG8gY3JlYXRlIGEgZnJhbWVidWZmZXIKPiB3aXRoIHplcm8gd2lkdGgvaGVpZ2h0Lgo+
IAo+IFRoZSByZWFzb24gSSB0aG91Z2h0IHRvIHRyeSB0aGlzIGlzIHNvIHRoYXQgSSBjYW4gZm9y
Y2UgYSBzcGVjaWZpYwo+IGRlcHRoIGZvciBmYmRldiB3aXRob3V0IGFjdHVhbGx5IGhhdmluZyB0
byBoYXJkY29kZSB0aGUgbW9kZQo+IG9uIHRoZSBrZXJuZWwgY21kbGluZS4gRWcuIGlmIEkgcGFz
cyB2aWRlbz0weDAtOCBJIHdpbGwgZ2V0IGFuCj4gOGJwcCBmcmFtZWJ1ZmZlciBhdCBteSBtb25p
dG9yJ3MgbmF0aXZlIHJlc29sdXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1ha2VzIHNlbnNlLiBNYXliZSB3
ZSBzaG91bGQgZml4IHRoZSBmYmRldiBoZWxwZXIgY29kZSBhbmQgc3RvcCBpdCBmcm9tCmJ5cGFz
c2luZyBub3JtYWwgZHJtX2ZiIHNhbml0eSBjaGVja3MgdG9vLCBidXQgdGhhdCdzIGFub3RoZXIg
c3RvcnkuClByb2JhYmx5IHdvdWxkIG1lYW4gcmViYXNpbmcgc29tZWhvdyBpbnRvIE5vcmFsZidz
IGdlbmVyaWMgZmJkZXYgc3R1ZmYsCndoaWNoIGRvZXNuJ3QgdXNlIG1hZ2ljIGRpcmVjdCBhY2Nl
c3MgdG8gdGhlIGRyaXZlciBhbnltb3JlLgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYwo+IGluZGV4IDVhMDdhMjhmZWM2ZC4uYjM2MjQ4YTVkODI2IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYwo+IEBAIC0xNTkzLDYgKzE1OTMsOSBAQCBkcm1fbW9kZV9jcmVhdGVfZnJvbV9jbWRs
aW5lX21vZGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgewo+ICAJc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgKm1vZGU7Cj4gIAo+ICsJaWYgKGNtZC0+eHJlcyA9PSAwIHx8IGNtZC0+eXJlcyA9
PSAwKQo+ICsJCXJldHVybiBOVUxMOwo+ICsKPiAgCWlmIChjbWQtPmN2dCkKPiAgCQltb2RlID0g
ZHJtX2N2dF9tb2RlKGRldiwKPiAgCQkJCSAgICBjbWQtPnhyZXMsIGNtZC0+eXJlcywKPiAtLSAK
PiAyLjIxLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QKPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1nZngKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jw
b3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
