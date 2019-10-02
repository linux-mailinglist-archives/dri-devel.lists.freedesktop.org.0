Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DAC89E9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 15:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBA06E044;
	Wed,  2 Oct 2019 13:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C368D89B49;
 Wed,  2 Oct 2019 13:39:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y21so7069927wmi.0;
 Wed, 02 Oct 2019 06:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7C/lmvhnOK2ftbFYct5zRz8/v/Ze5kOZrnGinFzRgjI=;
 b=HCfdogXFSErBCeLwBklu9oQa5cQNWJcAZF5h4gkKR8bJTEMCEPrNYY5ZD3UQ3z2sAY
 MSmFyg+qPhlLT+jnGO1uZWh2Lf0KaZMwJVSjm4elA9TjVGTz1GReAFbiaXrj2UlPNDCT
 mjby5xg+OVwr8hJyt5REot5NXQ309Hfc0Lkz9tWyg9BOfBW6gbjK4Qny48HXBuRGX2V/
 k39fEJBXyTEJTc1ajOGhG9xRWmKZjHNzZN/Q9qmL1VCNegBZCyWNN4ffWMVMuAZuSoyJ
 6Pftq1Kbuoo2R3tMM47JCngHLvTtYEK8TSFFSG6Uw4lf4x2XfV01u2wU3ZWKF2CqlyIL
 8FqA==
X-Gm-Message-State: APjAAAW+JF3szjLCK9A8A/kaToWolcXUOFEXKmnoATeHbm7hgDhJ+040
 4St77SrKRvgtrOmisl83InHmzxw05BqXtKviL0w=
X-Google-Smtp-Source: APXvYqx5i5lPDDGn9linzRM7km60QUouiBdUZ6pNR81GRD+PFpCXfkZdbsDh4kZ/25N4vrvmnxAAVd7MhXAnP4vB2fQ=
X-Received: by 2002:a05:600c:54a:: with SMTP id
 k10mr3134474wmc.127.1570023581249; 
 Wed, 02 Oct 2019 06:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191002051759.GA161133@LGEARND20B15>
In-Reply-To: <20191002051759.GA161133@LGEARND20B15>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Oct 2019 09:39:28 -0400
Message-ID: <CADnq5_OsUSP0OXWfB4=XfLuHmDMtPDyWY7EwbMPGEbz3+mi=SQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Drop unused variable and statement
To: Austin Kim <austindh.kim@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7C/lmvhnOK2ftbFYct5zRz8/v/Ze5kOZrnGinFzRgjI=;
 b=EmzgMvl/cYe7h2v3GRBOlUfZcm7b3Blw3Q6HGG1ZYwjZZjOM7qquPWWzUP4IIpRNuK
 x+OZTSIigZUvASgyv6pKxtCEp1TiiK6+tCqouiYPc5eKthuuiPBxg7+tWs0ByTx3iQ0x
 u6HHGYdd25KkRi2jYBZW0lK37XvFT9vLNeqdM7lXe1grBO7JdGhu1h5Dim1I+xr+LvGX
 WkfXB23EDKqMmy9YyooyQ+ixCwHfUwbXcedn54zJ7ovCteYTMdeBNKrluLQVjCEU7Eic
 v4t1xqdOyBtpaLbJCfeYGfdBgRoYybC+UaFGQqzzwbswCz8HniR3AKU1AWRj+UkIfonZ
 j0yQ==
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAzOjE5IEFNIEF1c3RpbiBLaW0gPGF1c3RpbmRoLmtpbUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRXZlbiB0aG91Z2ggJ3NtdThfc211JyBpcyBkZWNsYXJlZCwg
aXQgaXMgbm90IHVzZWQgYWZ0ZXIgYmVsb3cgc3RhdGVtZW50Lgo+Cj4gICAgc211OF9zbXUgPSBo
d21nci0+c211X2JhY2tlbmQ7Cj4KPiBTbyAndW51c2VkIHZhcmlhYmxlJyBjb3VsZCBiZSBzYWZl
bHkgcmVtb3ZlZAo+IHRvIHN0b3Agd2FybmluZyBtZXNzYWdlIGFzIGJlbG93Ogo+Cj4gICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdW1nci9zbXU4X3NtdW1nci5j
OjE4MDoyMjoKPiAgICB3YXJuaW5nOiB2YXJpYWJsZSDigJhzbXU4X3NtdeKAmSBzZXQgYnV0IG5v
dCB1c2VkCj4gICAgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiAgICBzdHJ1Y3Qgc211
OF9zbXVtZ3IgKnNtdThfc211Owo+ICAgICAgICAgICAgICBeCj4gU2lnbmVkLW9mZi1ieTogQXVz
dGluIEtpbSA8YXVzdGluZGgua2ltQGdtYWlsLmNvbT4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4
Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211OF9zbXVt
Z3IuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3Ivc211OF9zbXVtZ3IuYwo+IGlu
ZGV4IDQ3MjhhYTIuLjdkY2EwNGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvc211bWdyL3NtdThfc211bWdyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVtZ3Ivc211OF9zbXVtZ3IuYwo+IEBAIC0xNzcsMTIgKzE3NywxMCBAQCBz
dGF0aWMgaW50IHNtdThfbG9hZF9tZWNfZmlybXdhcmUoc3RydWN0IHBwX2h3bWdyICpod21ncikK
PiAgICAgICAgIHVpbnQzMl90IHRtcDsKPiAgICAgICAgIGludCByZXQgPSAwOwo+ICAgICAgICAg
c3RydWN0IGNnc19maXJtd2FyZV9pbmZvIGluZm8gPSB7MH07Cj4gLSAgICAgICBzdHJ1Y3Qgc211
OF9zbXVtZ3IgKnNtdThfc211Owo+Cj4gICAgICAgICBpZiAoaHdtZ3IgPT0gTlVMTCB8fCBod21n
ci0+ZGV2aWNlID09IE5VTEwpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4g
LSAgICAgICBzbXU4X3NtdSA9IGh3bWdyLT5zbXVfYmFja2VuZDsKPiAgICAgICAgIHJldCA9IGNn
c19nZXRfZmlybXdhcmVfaW5mbyhod21nci0+ZGV2aWNlLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIENHU19VQ09ERV9JRF9DUF9NRUMsICZpbmZvKTsK
Pgo+IC0tCj4gMi42LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
