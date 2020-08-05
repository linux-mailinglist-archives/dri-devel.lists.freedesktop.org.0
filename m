Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374623C52C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 07:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90746E4C7;
	Wed,  5 Aug 2020 05:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453096E4C7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 05:43:01 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x2so3019832ybf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 22:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4NMCxxX6Q8ZBGp9djCu9aQalGbA1QvjVWEPgBkZ1NyE=;
 b=I61jl3x3SchjDoWOXROhr4vzCezWlNeFRArHNjiuXXPRJJ5W1cRDwfJYRZULXcrGYK
 049UjhwrmhNYFmUssYS96Gsxj8skwEX/AfkklpRkYQPsZXCEiaAtdVdilEtKa6Yry7fA
 om5EIRz4c2LPbulDqvbEI8pwHqbNmRD8TsLCo5VlqT1/X62dMcM78O9wfUUdC9H3gZCM
 t9HsT91e77bfFSb4+UvTs2E6dkONA/Tun0S87lUFfh++AIP6shSK3+Xo+VDGyUd2JD/J
 rExrht66eMtAATQLrWG5AnaQiLFwK07FC9zBDyQTQZ9rVMdqlozwL6LIHAZG8Wv8na8L
 PSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4NMCxxX6Q8ZBGp9djCu9aQalGbA1QvjVWEPgBkZ1NyE=;
 b=mE+oyOB1/OYL8iccsVlB8pOHiGPQQK0Y1jIMuAAHmaz7ux1xeS5bJvqtiGUOZcP8SM
 Pglby5xFInfEgHzLHG5KKpQCc1z5KIDz5+PhYFo6gxzs01BdUXBKT/kKrO5sElSzRxUW
 ep7IvFT6WicEoywgzIHJYyAdG3XIMIlro4JbNvZ3SijzghBrYTNzCvrP7DD24+2DWWTU
 OQdvmGIsRAFXhFltpYMsbsH/ifzrkB6oWuInzA+jCZfYyAYr416mRhSwQ2d4wwJZeRUD
 ap7zl5u9b4KYz6s4InqrCBQ/IQAk2xTl0+qD9MOliCRW7aDkOd00vg8Wj2f7Ny2glLpp
 D6Kg==
X-Gm-Message-State: AOAM533ZQkwEYCCyPstYianI8hkvIxHFcWKgLSvdKfzCAchDoEDaz7+o
 TMmBfDMZ4iG3AjzP0wURcFzsYV5H3sEXXtN7HAg=
X-Google-Smtp-Source: ABdhPJxbQ3g4/J2q/aCwyGH23zkBxxSaL9SBcX/MEE+jt0YOWHcn2QSAkfwKBL9js3XkfUA2iMwcu11TjBSGC3hqgZI=
X-Received: by 2002:a25:8447:: with SMTP id r7mr2112794ybm.147.1596606180554; 
 Tue, 04 Aug 2020 22:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-26-airlied@gmail.com>
 <0c714033-96a3-58cb-af6f-c8a20018a08f@amd.com>
In-Reply-To: <0c714033-96a3-58cb-af6f-c8a20018a08f@amd.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 5 Aug 2020 15:42:49 +1000
Message-ID: <CACAvsv64Q=XDo1gD4cP0LuZLGzBOOXFw0Fs7Gb3Dzrn3HtA5-w@mail.gmail.com>
Subject: Re: [PATCH 25/59] drm/ttm: make some inline helper functions for
 cleanup paths. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: sroland@vmware.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-graphics-maintainer@vmware.com, Ben Skeggs <bskeggs@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA0IEF1ZyAyMDIwIGF0IDIxOjE4LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Cj4gQW0gMDQuMDguMjAgdW0gMDQ6NTUgc2NocmllYiBE
YXZlIEFpcmxpZToKPiA+IEZyb206IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
Pgo+ID4gVGhlIGRpc2FibGUgcGF0aCBpcyBqdXN0IHRlbXBvcmFyeSBmb3Igbm93LCBpdCB3aWxs
IGJlIGRyb3BwZWQgb25jZSBoYXNfdHlwZQo+ID4gaXMgZ29uZSBpbiBhIGxhdGVyIHBhdGNoLgo+
ID4KPiA+IHYyOiBhZGQgZG9jcy4KPiA+IHJlbmFtZSB0byB0dG1fbWVtX3R5cGVfbWFuYWdlciBu
YW1lc3BhY2UKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4K
Cj4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgIHwgIDYgKyst
LS0tCj4gPiAgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmggfCAyNiArKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPiBpbmRleCBhZjFiMWMz
ZjZlZDIuLjEyN2EwYjYyYmY5OCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiA+IEBAIC0x
NDY4LDggKzE0NjgsNyBAQCBpbnQgdHRtX2JvX2NsZWFuX21tKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCB1bnNpZ25lZCBtZW1fdHlwZSkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsK
PiA+ICAgICAgIH0KPiA+Cj4gPiAtICAgICBtYW4tPnVzZV90eXBlID0gZmFsc2U7Cj4gPiAtICAg
ICBtYW4tPmhhc190eXBlID0gZmFsc2U7Cj4gPiArICAgICB0dG1fbWVtX3R5cGVfbWFuYWdlcl9k
aXNhYmxlKG1hbik7Cj4gPgo+ID4gICAgICAgcmV0ID0gMDsKPiA+ICAgICAgIGlmIChtZW1fdHlw
ZSA+IDApIHsKPiA+IEBAIC0xNDgyLDggKzE0ODEsNyBAQCBpbnQgdHRtX2JvX2NsZWFuX21tKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1bnNpZ25lZCBtZW1fdHlwZSkKPiA+ICAgICAgICAg
ICAgICAgcmV0ID0gKCptYW4tPmZ1bmMtPnRha2Vkb3duKShtYW4pOwo+ID4gICAgICAgfQo+ID4K
PiA+IC0gICAgIGRtYV9mZW5jZV9wdXQobWFuLT5tb3ZlKTsKPiA+IC0gICAgIG1hbi0+bW92ZSA9
IE5VTEw7Cj4gPiArICAgICB0dG1fbWVtX3R5cGVfbWFuYWdlcl9jbGVhbnVwKG1hbik7Cj4gPgo+
ID4gICAgICAgcmV0dXJuIHJldDsKPiA+ICAgfQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4g
PiBpbmRleCA1NDhjMjcyOTRjNjQuLjQxYmZhNTE0YzI5ZCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1f
Ym9fZHJpdmVyLmgKPiA+IEBAIC02ODAsNiArNjgwLDMyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0
dG1fbWVtX3R5cGVfbWFuYWdlcl9zZXRfdXNlZChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hCj4gPiAgICAgICBtYW4tPnVzZV90eXBlID0gdXNlZDsKPiA+ICAgfQo+ID4KPiA+ICsvKioK
PiA+ICsgKiB0dG1fbWVtX3R5cGVfbWFuYWdlcl9kaXNhYmxlLgo+ID4gKyAqCj4gPiArICogQG1h
bjogQSBtZW1vcnkgbWFuYWdlciBvYmplY3QuCj4gPiArICoKPiA+ICsgKiBJbmRpY2F0ZSB0aGUg
bWFuYWdlciBpcyBub3QgdG8gYmUgdXNlZCBhbmQgZGVyZWdpc3RlcmVkLiAodGVtcG9yYXJ5IGR1
cmluZyByZXdvcmspLgo+ID4gKyAqLwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0dG1fbWVtX3R5
cGVfbWFuYWdlcl9kaXNhYmxlKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQo+ID4g
K3sKPiA+ICsgICAgIG1hbi0+aGFzX3R5cGUgPSBmYWxzZTsKPiA+ICsgICAgIG1hbi0+dXNlX3R5
cGUgPSBmYWxzZTsKPiA+ICt9Cj4gPiArCj4gPiArLyoqCj4gPiArICogdHRtX21lbV90eXBlX21h
bmFnZXJfY2xlYW51cAo+ID4gKyAqCj4gPiArICogQG1hbjogQSBtZW1vcnkgbWFuYWdlciBvYmpl
Y3QuCj4gPiArICoKPiA+ICsgKiBDbGVhbnVwIHRoZSBtb3ZlIGZlbmNlcyBmcm9tIHRoZSBtZW1v
cnkgbWFuYWdlciBvYmplY3QuCj4gPiArICovCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyX2NsZWFudXAoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4p
Cj4gPiArewo+ID4gKyAgICAgZG1hX2ZlbmNlX3B1dChtYW4tPm1vdmUpOwo+ID4gKyAgICAgbWFu
LT5tb3ZlID0gTlVMTDsKPiA+ICt9Cj4gPiArCj4gPiAgIC8qCj4gPiAgICAqIHR0bV9ib191dGls
LmMKPiA+ICAgICovCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
