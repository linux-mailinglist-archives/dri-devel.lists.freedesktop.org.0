Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645921D0CB8
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D4B6E9EC;
	Wed, 13 May 2020 09:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CE56E9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:47:08 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id s11so9702513vsm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ww+4iOd1VDSyIGhFYZD98F7xhBzLKs7Ok2GL94LhC6M=;
 b=B2i0FaAIFy1vRYGBT2oqndGvuBVzcE2l3HTl3NNh/oswpkqsBhzOnScLc0/9cVe+Ee
 JGnOPlDxM+lEi/OyaPhDSvgaI7zj33EMlyqlbCRt0y6X/zlyED9UbMAcRWrsMUsWnY8R
 q20hl8Cy/4RPNj75Z0SuH9Zq5TJFhdqTVhkDxE2HbFRplC1onNvbCqCtSiPN9FHYHowT
 5lEvz1cZLZbORokknX0hI/hdNGv9eui8EgxO+nOKlXOhjvmUmUL1FC7NGYzcwCYw1TGY
 eiaFh4NCcE8sinLzR6Mta+HTP6kplRY1HqyHySf062k74uQGLfZ8hGAKNKev0fMl5zUD
 0xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ww+4iOd1VDSyIGhFYZD98F7xhBzLKs7Ok2GL94LhC6M=;
 b=S72NUonFKmWgB6K8eNH9TaGdEo0H8h4t4YzxVgrxbVOpoBMnY/ETeYb8uxuyoJHhAU
 mQ2h2H/7wT4UPpHyufo7ULXB+9CwR6hyKnJUCMUwZAswsLM3CcmYGSi3/9P2Deml2o0V
 BIV6nj0tziA+WzELrn7OG/CUnR4EMazjI9UTB254Uj9lAecOFNZgmjUzyPcFjQxYosum
 JPUjPLSaLuoF0UZMTNHf85+DcPSBo0yXjjp8bTtqOMYkl5lEAg0/xL0Qra//3Toft6NI
 oRxU7YB5MvtEwyYe7rGQL3Nxzf6Ldfc2PmpnpJYF17xJJPxHfPmVcLXxynWZentpw9Qb
 QEdw==
X-Gm-Message-State: AOAM532YOaVaf3qdpfhH26W7HgIr9rvVoyIlVrvl9mrBq79ybuLh3jHZ
 00WsIkCwxAmjlXRdy4kbPnnlxHChqrtmRCNV93Q=
X-Google-Smtp-Source: ABdhPJxgx+GIht8+9nZM2G/NdK/gAID6vQMXEuj+QWCVP94onXxADvSIV4J1rUJGmmz/DsYhtEnBLmwnoGUUT40bSgs=
X-Received: by 2002:a67:ecc2:: with SMTP id i2mr6542420vsp.85.1589363227941;
 Wed, 13 May 2020 02:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-3-emil.l.velikov@gmail.com>
 <CAGWqDJ4rAmwMzb6Q61Ou9ZLNA2M-i-JhOSokVUkHYHa_-ZxCTw@mail.gmail.com>
 <CACvgo50=scDC32UrWQQ0QLXFTh1e8w8GcPFs52f6+jNMwesGOQ@mail.gmail.com>
In-Reply-To: <CACvgo50=scDC32UrWQQ0QLXFTh1e8w8GcPFs52f6+jNMwesGOQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 10:44:27 +0100
Message-ID: <CACvgo501vdL3mUDXrYuehcf2XrH2eq8AXkTBGiFUfFWiO8JCEQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mipi: use dcs write for
 mipi_dsi_dcs_set_tear_scanline
To: Vinay Simha B N <simhavcs@gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Robert Chiras <robert.chiras@nxp.com>,
 Thierry Reding <treding@nvidia.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmluYXksCgpPbiBUaHUsIDcgTWF5IDIwMjAgYXQgMTc6MTgsIEVtaWwgVmVsaWtvdiA8ZW1p
bC5sLnZlbGlrb3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgNyBNYXkgMjAyMCBhdCAx
MzoyOSwgVmluYXkgU2ltaGEgQiBOIDxzaW1oYXZjc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IEVtaWwsCj4gPgo+ID4gUmVwbHkgaW5saW5lCj4gPgo+ID4gT24gVHVlLCA1IE1heSAyMDIwIGF0
IDk6MzUgUE0sIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPiB3cm90ZToK
PiA+Pgo+ID4+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+
Cj4gPj4KPiA+PiBUaGUgaGVscGVyIHVzZXMgdGhlIE1JUElfRENTX1NFVF9URUFSX1NDQU5MSU5F
LCBhbHRob3VnaCBpdCdzIGN1cnJlbnRseQo+ID4+IHVzaW5nIHRoZSBnZW5lcmljIHdyaXRlLiBU
aGlzIGRvZXMgbm90IGxvb2sgcmlnaHQuCj4gPj4KPiA+PiBQZXJoYXBzIHNvbWUgcGxhdGZvcm1z
IGRvbid0IGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlIHR3byB3cml0ZXJzPwo+ID4+Cj4gPj4gQ2M6
IFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4KPiA+PiBDYzogVmluYXkgU2lt
aGEgQk4gPHNpbWhhdmNzQGdtYWlsLmNvbT4KPiA+PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4KPiA+PiBDYzogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KPiA+PiBGaXhlczogZTgzOTUwODE2MzY3ICgiZHJtL2RzaTogSW1wbGVtZW50IHNldCB0ZWFy
IHNjYW5saW5lIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtv
dkBjb2xsYWJvcmEuY29tPgo+ID4+IC0tLQo+ID4+IFJvYmVydCwgY2FuIHlvdSBwbGVhc2UgdGVz
dCB0aGlzIGFnYWluc3QgdGhlIG9ubHkgdXNlciAtIHRoZSBSYXlkaXVtCj4gPj4gUk02NzE5MSBw
YW5lbCBkcml2ZXIgdGhhdCB5b3UgaW50cm9kdWNlZC4KPiA+Pgo+ID4+IFRoYW5rcwo+ID4+Cj4g
Pj4gVmluYXksIGNhbiB5b3UgY29uZmlybSBpZiB0aGlzIGlzIGEgZ2VudWluZSB0eXBvIG9yIHRo
ZXJlJ3Mgc29tZXRoaW5nCj4gPj4gcmVhbGx5IHN1YnRsZSBoYXBwZW5pbmcuCj4gPgo+ID4gdGhp
cyBoYXMgYmVlbiB0ZXN0ZWQgb24gbmV4dXMgNyB3aXRoIGpkaSBwYW5lbC4KPiBUaGUgamRpIHBh
bmVsIChKREkgTFQwNzBNRTA1MDAwIEkgYmVsaWV2ZSkgZG9lcyBub3QgdXNlIHRoZSBmdW5jdGlv
biwgaG1tLgo+Cj4gTG9va2luZyB0aHJvdWdoIHRoZSBNTCBhcmNoaXZlIC0gdGhlIGNhbGwgaW4g
dGhlIGZpcnN0IDQgcmV2aXNpb25zIG9mIHRoZSBwYXRjaC4KPiBUaGVuIHdpdGggdjUgaXQgaGFz
IG1hZ2ljYWxseSBkaXNhcHBlYXJlZCBhbG9uZ3NpZGUgbWlwaV9kc2lfZGNzX3NldF90ZWFyX29u
KCkuCj4KPiBObyBjb21tZW50IGV4cGxhaW5pbmcgd2h5IHRob3VnaCAtIGRvZXMgdGhlIGRyaXZl
ciB3b3JrIHcvbyBib3RoIG9mIHRob3NlPwo+CkFueSBpZGVhcywgZG9lcyB0aGUgZHJpdmVyIHdv
cmsgaW4gdG9kYXkncyBzdGF0ZT8KCj4gPiBJIGRpZCBub3QgdW5kZXJzdGFuZCB3aGF0IGlzIHRo
ZSB0eXBvIGhlcmU/Cj4gPiBXZSBuZWVkIHRvIHVzZSBEQ+KAmXMgd3JpdGUgaW5zdGVhZCBvZiBn
ZW5lcmljIHdyaXRlPwo+Cj4gSSBiZWxpZXZlIHRoZSBjbHVlIGlzIGluIHRoZSBjb21tYW5kIG5h
bWUgLSBNSVBJX0RTSV9EQ1MuIEkgd2FzIGdvaW5nCj4gdG8gZG91YmxlLWNoZWNrIHdpdGggdGhl
IHNwZWMgYWx0aG91Z2ggaXQncyBtZW1iZXJzIG9ubHkgOi1cCj4gQmFzZWQgb24gdGhlIHVzYWdl
IGluIERSTSwgYWxsIERDUyBjb21tYW5kcyBhcmUgaXNzdWVkIHZpYQo+IG1pcGlfZHNpX2Rjc197
cmVhZCx3cml0ZX0KPgpEbyB5b3UgYWdyZWUgd2l0aCB0aGUgcmF0aW9uYWxlPyBBbHRlcm5hdGl2
ZWx5LCBkbyB5b3UgaGF2ZSBhCnJlZmVyZW5jZSB0byB0aGUgQW5kcm9pZCB0cmVlIHdoZXJlIHRo
ZSBnZW5lcmljIHdyaXRlIGlzIHVzZWQuCgpUaGFua3MKRW1pbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
