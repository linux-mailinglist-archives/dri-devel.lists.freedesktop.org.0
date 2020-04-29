Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE081BE0C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 16:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACE36EEA6;
	Wed, 29 Apr 2020 14:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE3B6EEA6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:23:04 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AEC421775
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588170184;
 bh=G66dtQxbgcy1h44rcbSXdxCegSH9fBKXU5OqSZIxS8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PetStyHLEV2lrSXAVs6D/TdlIhWhS1z8l9Gl+vM/4MNdlQd4o+6yNZktsNtNHZQU6
 YIHcHaxmLo83AxCXmV1gKViG3iVFBBJBxN8LECtjbSqWDS7oeQIrFEsrWRfIgb3q0s
 Ur2XeOWeKdtohhLwNWX4xkXhaSx8gpjuNR5Cl7aI=
Received: by mail-ej1-f54.google.com with SMTP id e2so1676149eje.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:23:04 -0700 (PDT)
X-Gm-Message-State: AGi0PuY4mCP9CYziieczNzqdFAHW3SFkO/noyleS0VhPkm0rlj9z4sBQ
 U7JDCty9FfvP/huTCwTLWWq/hvDcfTUNnB8EWA==
X-Google-Smtp-Source: APiQypLbNUZaUbxOeAGl/VOSrDJwW0j3YRXLPpsXVC1sG9OeMKULA8AD+Z6wkppmAOEICwk03bQFeR9oFWYM3/4XLAs=
X-Received: by 2002:a17:906:2ad4:: with SMTP id
 m20mr2875207eje.324.1588170182786; 
 Wed, 29 Apr 2020 07:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200427075238.2828-1-bernard@vivo.com>
In-Reply-To: <20200427075238.2828-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Apr 2020 22:22:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY_86d-UryKQrLy8-zjTbrTRrHL4k3x=bx1KqvWxPL5jj2Q@mail.gmail.com>
Message-ID: <CAAOTY_86d-UryKQrLy8-zjTbrTRrHL4k3x=bx1KqvWxPL5jj2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: cleanup coding style in mediatek a bit
To: Bernard Zhao <bernard@vivo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NOaciDI35pelIOmAseS4gCDkuIvljYgzOjUz5a+r6YGT77yaCj4KPiBUaGlzIGNvZGUgY2hhbmdl
IGlzIHRvIG1ha2UgY29kZSBiaXQgbW9yZSByZWFkYWJsZS4KPiBPcHRpbWlzZSBhcnJheSBzaXpl
IGFsaWduIHRvIEhETUkgbWFjcm8gZGVmaW5lLgo+IEFkZCBjaGVjayBpZiBsZW4gaXMgb3ZlcmFu
Z2UuCgpPbmUgcGF0Y2ggc2hvdWxkIGp1c3QgZG8gb25lIHRoaW5nLCBidXQgdGhpcyBkbyB0aHJl
ZSB0aGluZ3MuClNvIGJyZWFrIHRoaXMgaW50byB0aHJlZSBwYXRjaGVzLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgMjIgKysr
KysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+IGluZGV4
IGZmNDNhM2Q4MDQxMC4uNDBmYjUxNTRlZDVkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMKPiBAQCAtMzExLDE1ICszMTEsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2hkbWlfaHdf
c2VuZF9pbmZvX2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAqaGRtaSwgdTggKmJ1ZmZlciwKPiAgICAg
ICAgIHU4IGNoZWNrc3VtOwo+ICAgICAgICAgaW50IGN0cmxfZnJhbWVfZW4gPSAwOwo+Cj4gLSAg
ICAgICBmcmFtZV90eXBlID0gKmJ1ZmZlcjsKPiAtICAgICAgIGJ1ZmZlciArPSAxOwo+IC0gICAg
ICAgZnJhbWVfdmVyID0gKmJ1ZmZlcjsKPiAtICAgICAgIGJ1ZmZlciArPSAxOwo+IC0gICAgICAg
ZnJhbWVfbGVuID0gKmJ1ZmZlcjsKPiAtICAgICAgIGJ1ZmZlciArPSAxOwo+IC0gICAgICAgY2hl
Y2tzdW0gPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7Cj4gKyAgICAgICBmcmFtZV90
eXBlID0gKmJ1ZmZlcisrOwo+ICsgICAgICAgZnJhbWVfdmVyID0gKmJ1ZmZlcisrOwo+ICsgICAg
ICAgZnJhbWVfbGVuID0gKmJ1ZmZlcisrOwo+ICsgICAgICAgY2hlY2tzdW0gPSAqYnVmZmVyKys7
Cj4gICAgICAgICBmcmFtZV9kYXRhID0gYnVmZmVyOwo+ICsgICAgICAgaWYgKChmcmFtZV9sZW4g
KyBIRE1JX0lORk9GUkFNRV9IRUFERVJfU0laRSkgPiBsZW4pIHsKPiArICAgICAgICAgICAgICAg
ZGV2X2VycihoZG1pLT5kZXYsICJXcm9uZyBmcmFtZSBsZW46ICVkXG4iLCBmcmFtZV9sZW47Cj4g
KyAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAgIH0KPgo+ICAgICAgICAgZGV2X2RiZyho
ZG1pLT5kZXYsCj4gICAgICAgICAgICAgICAgICJmcmFtZV90eXBlOjB4JXgsZnJhbWVfdmVyOjB4
JXgsZnJhbWVfbGVuOjB4JXgsY2hlY2tzdW06MHgleFxuIiwKPiBAQCAtOTgyLDcgKzk4Miw3IEBA
IHN0YXRpYyBpbnQgbXRrX2hkbWlfc2V0dXBfYXZpX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkg
KmhkbWksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICptb2RlKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaGRtaV9hdmlfaW5m
b2ZyYW1lIGZyYW1lOwo+IC0gICAgICAgdTggYnVmZmVyWzE3XTsKPiArICAgICAgIHU4IGJ1ZmZl
cltIRE1JX0lORk9GUkFNRV9IRUFERVJfU0laRSArIEhETUlfQVZJX0lORk9GUkFNRV9TSVpFXTsK
PiAgICAgICAgIHNzaXplX3QgZXJyOwo+Cj4gICAgICAgICBlcnIgPSBkcm1faGRtaV9hdmlfaW5m
b2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKCZmcmFtZSwKPiBAQCAtMTAwOCw3ICsxMDA4LDcgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9zZXR1cF9zcGRfaW5mb2ZyYW1lKHN0cnVjdCBtdGtfaGRtaSAq
aGRtaSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqcHJvZHVjdCkKPiAgewo+ICAgICAgICAgc3RydWN0IGhkbWlfc3BkX2luZm9mcmFtZSBmcmFt
ZTsKPiAtICAgICAgIHU4IGJ1ZmZlclsyOV07Cj4gKyAgICAgICB1OCBidWZmZXJbSERNSV9JTkZP
RlJBTUVfSEVBREVSX1NJWkUgKyBIRE1JX1NQRF9JTkZPRlJBTUVfU0laRV07Cj4gICAgICAgICBz
c2l6ZV90IGVycjsKPgo+ICAgICAgICAgZXJyID0gaGRtaV9zcGRfaW5mb2ZyYW1lX2luaXQoJmZy
YW1lLCB2ZW5kb3IsIHByb2R1Y3QpOwo+IEBAIC0xMDMxLDcgKzEwMzEsNyBAQCBzdGF0aWMgaW50
IG10a19oZG1pX3NldHVwX3NwZF9pbmZvZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLAo+ICBz
dGF0aWMgaW50IG10a19oZG1pX3NldHVwX2F1ZGlvX2luZm9mcmFtZShzdHJ1Y3QgbXRrX2hkbWkg
KmhkbWkpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBoZG1pX2F1ZGlvX2luZm9mcmFtZSBmcmFtZTsK
PiAtICAgICAgIHU4IGJ1ZmZlclsxNF07Cj4gKyAgICAgICB1OCBidWZmZXJbSERNSV9JTkZPRlJB
TUVfSEVBREVSX1NJWkUgKyBIRE1JX0FVRElPX0lORk9GUkFNRV9TSVpFXTsKPiAgICAgICAgIHNz
aXplX3QgZXJyOwo+Cj4gICAgICAgICBlcnIgPSBoZG1pX2F1ZGlvX2luZm9mcmFtZV9pbml0KCZm
cmFtZSk7Cj4gLS0KPiAyLjI2LjIKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
