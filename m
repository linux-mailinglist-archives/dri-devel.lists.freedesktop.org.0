Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEEF2B106A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 22:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF3D6E44A;
	Thu, 12 Nov 2020 21:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947506E448;
 Thu, 12 Nov 2020 21:28:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c16so6727365wmd.2;
 Thu, 12 Nov 2020 13:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G2BYNuIxlaObS9p75wcHPXenJKV2OHZTqCiRZ3u3/NU=;
 b=MjSmxuzUy3A5nn2fW066uU93yV94ooVSUHoz6odmOf1nsFJ03GGRyLVDJVCSyYOY85
 8u7A1f43k99+/zp9KJUZ2aXt3pkZ1x1fbWRfRDFXLwnOd0EX6W7bfBuG6Ww0CSZQOD5K
 xeM7/Xw2pc+2/ZRW7NKqr3he6CaUEQfzuswJ5vpMnSp0tz3natDcFiqp0DOwAisWXBdt
 AShV7rRe5dbd74S0/maGQK0u88EIwPn/JgtF5Rc0Xy8N2FCLafPZGvKYSWRxzZVYUYdT
 VaTklWmbH8dCI6aK/0sv1qpWkNgSP5u7yc9wmLkaf+yGTYudq1KpsVZFEnrfGDH6K0Ir
 rPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G2BYNuIxlaObS9p75wcHPXenJKV2OHZTqCiRZ3u3/NU=;
 b=mM1pNQ94eUUDfH9eblNhWMWHEL+qpi4htzqzNCUDK/KoJ0USAaCgAq24MNY4Dms8vg
 FeTDos78wnj2AfAVejmdUCTMGR0DiN/ju3wir2X2uN8gYHoKkoomy9pbJdy/CR4gPKM7
 1049GDswx2eZZXOCnY54C0SfRgfEQ9gIq3keyRpq03oJ+LXqL87pIUTGFsQ+ic2uyXXM
 Ch60DiVxfqzxmtOhxukDGp+0BMAbpQ8aTTQlx/H9IASeoocVJ/c48LFI3TAd44dkAtf4
 SPmszfvS11eb9zO8/cWtvf+IsKP2CANIptRxwg83Ad8CGxJtXSCs9pR/CPgwLGZefhpe
 XqMA==
X-Gm-Message-State: AOAM532I5e2PAotDSyFKec64jOn60uSz7J4ItNbYp5h3Wih0hff1SAZ1
 Idkd97uaUQYpe4NS05+aeYOCNF8K6HjF5jtNv4M=
X-Google-Smtp-Source: ABdhPJwACnsJDr0htDUIcZ1390M+ztGM6mHPEVrjB75T5GqTdIpxllFizlL3nKTN1oMXRIMVR4CpDhPQIZX/zXW37Sk=
X-Received: by 2002:a1c:8150:: with SMTP id c77mr1687617wmd.26.1605216522204; 
 Thu, 12 Nov 2020 13:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20201112190039.2785914-1-lee.jones@linaro.org>
 <20201112190039.2785914-20-lee.jones@linaro.org>
In-Reply-To: <20201112190039.2785914-20-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Nov 2020 16:28:30 -0500
Message-ID: <CADnq5_Pu0v=JHsRnB_M1OJNqKOZT0otcU1GCtif12GnKt4ArAg@mail.gmail.com>
Subject: Re: [PATCH 19/30] drm/amd/amdgpu/amdgpu_cs: Add a couple of missing
 function param descriptions
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <glisse@freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMTIsIDIwMjAgYXQgMjowNyBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jOjY4
NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYmFja29mZicgbm90IGRl
c2NyaWJlZCBpbiAnYW1kZ3B1X2NzX3BhcnNlcl9maW5pJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3MuYzoxNjU1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Ig
bWVtYmVyICdtYXAnIG5vdCBkZXNjcmliZWQgaW4gJ2FtZGdwdV9jc19maW5kX21hcHBpbmcnCj4K
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IEpl
cm9tZSBHbGlzc2UgPGdsaXNzZUBmcmVlZGVza3RvcC5vcmc+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMu
bGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5v
cmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+IGluZGV4IDhk
Mjg3OGU5NTBkYWIuLjU5NGEwMTA4ZTkwZmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3MuYwo+IEBAIC02NzYsNiArNjc2LDcgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
c3luY19yaW5ncyhzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCkKPiAgICogY3NfcGFyc2VyX2Zp
bmkoKSAtIGNsZWFuIHBhcnNlciBzdGF0ZXMKPiAgICogQHBhcnNlcjogICAgcGFyc2VyIHN0cnVj
dHVyZSBob2xkaW5nIHBhcnNpbmcgY29udGV4dC4KPiAgICogQGVycm9yOiAgICAgZXJyb3IgbnVt
YmVyCj4gKyAqIEBiYWNrb2ZmOiAgIGluZGljYXRvciB0byBiYWNrb2ZmIHRoZSByZXNlcnZhdGlv
bgo+ICAgKgo+ICAgKiBJZiBlcnJvciBpcyBzZXQgdGhhbiB1bnZhbGlkYXRlIGJ1ZmZlciwgb3Ro
ZXJ3aXNlIGp1c3QgZnJlZSBtZW1vcnkKPiAgICogdXNlZCBieSBwYXJzaW5nIGNvbnRleHQuCj4g
QEAgLTE2NDQsNiArMTY0NSw3IEBAIGludCBhbWRncHVfY3Nfd2FpdF9mZW5jZXNfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgICogQHBhcnNlcjogY29tbWFuZCBz
dWJtaXNzaW9uIHBhcnNlciBjb250ZXh0Cj4gICAqIEBhZGRyOiBWTSBhZGRyZXNzCj4gICAqIEBi
bzogcmVzdWx0aW5nIEJPIG9mIHRoZSBtYXBwaW5nIGZvdW5kCj4gKyAqIEBtYXA6IFBsYWNlaG9s
ZGVyIHRvIHJldHVybiBmb3VuZCBCTyBtYXBwaW5nCj4gICAqCj4gICAqIFNlYXJjaCB0aGUgYnVm
ZmVyIG9iamVjdHMgaW4gdGhlIGNvbW1hbmQgc3VibWlzc2lvbiBjb250ZXh0IGZvciBhIGNlcnRh
aW4KPiAgICogdmlydHVhbCBtZW1vcnkgYWRkcmVzcy4gUmV0dXJucyBhbGxvY2F0aW9uIHN0cnVj
dHVyZSB3aGVuIGZvdW5kLCBOVUxMCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
