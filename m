Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E5B1AC6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE056EEE7;
	Fri, 13 Sep 2019 09:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06A86EEE7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:30:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9E16208C2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:30:02 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id w6so21630927lfl.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 02:30:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXIOjN/TRU7/L5URIX5n4kKOPGnsMcgslRgi1FMQZgUDxnweK26
 tctIlZG297A0wVwFWUgEQAUzwWQV8aaS+LKFRLo=
X-Google-Smtp-Source: APXvYqz5bssj8Eu7jmoWxgT0sHti6vv0ZODfmt2/e3kFzQQKbrpBz8lWDHX29tZkUIoK34EqGiyBjSpjvMVB0yXPqrA=
X-Received: by 2002:ac2:43b8:: with SMTP id t24mr11900825lfl.24.1568367001114; 
 Fri, 13 Sep 2019 02:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190912093315.5744-1-m.falkowski@samsung.com>
 <CGME20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a@eucas1p2.samsung.com>
 <20190912161538.4321-1-m.falkowski@samsung.com> <20190913062945.GA10283@pi3>
 <e082996a-743d-807a-38c0-dee65b490771@samsung.com>
In-Reply-To: <e082996a-743d-807a-38c0-dee65b490771@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 13 Sep 2019 11:29:49 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdSQJ4CR_0BQjudx1NdaC0E_rU8ZDtFVSB9XwcTbxSdUg@mail.gmail.com>
Message-ID: <CAJKOXPdSQJ4CR_0BQjudx1NdaC0E_rU8ZDtFVSB9XwcTbxSdUg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568367003;
 bh=DkbKPLd98o2D2jlg/SusdIF+USUESXyjosrHoIfXz9g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jdRFTgPhjhReuG/k949iM5v9sLI5ZgcQM5pTB4haEdx0G5S39nJa0js/STzxHkeXo
 O4/st057cFiVGF0AohwEfD6n5S088itbJQK1j0gqusXg0D58+xWfJ9PAjHNk1IS2oj
 Z4x2PqGDS6PsRvJKAGuVAn2kAPtNy7OzM/TKsWH8=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>, airlied@linux.ie,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAxMToxNSwgTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93
c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEhpIEtyenlzenRvZiwKPgo+IE9uIDkvMTMvMTkg
ODoyOSBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+IE9uIFRodSwgU2VwIDEyLCAy
MDE5IGF0IDA2OjE1OjM4UE0gKzAyMDAsIE1hY2llaiBGYWxrb3dza2kgd3JvdGU6Cj4gPj4gQ29u
dmVydCBTYW1zdW5nIEltYWdlIFJvdGF0b3IgdG8gbmV3ZXIgZHQtc2NoZW1hIGZvcm1hdC4KPiA+
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBGYWxrb3dza2kgPG0uZmFsa293c2tpQHNhbXN1
bmcuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3Nr
aUBzYW1zdW5nLmNvbT4KPiA+IEp1c3QgdG8gbWFrZSBpdCBjbGVhciwgTWFyZWsncyBzaWduZWQt
b2ZmIHNob3VsZCBhcHBlYXIgZm9yIG9uZSBvZgo+ID4gY29uZGl0aW9uczoKPiA+ICAgLSBoZSBj
b250cmlidXRlZCBzb21lIHNvdXJjZSBjb2RlIHRvIHlvdXIgcGF0Y2gsCj4gPiAgIC0gaGUgdG9v
ayB5b3VyIHBhdGNoLCByZWJhc2VkLCBzZW5kIGJ5IGhpbXNlbGYgKG5vdCBhIGNhc2UgaGVyZSwg
SQo+ID4gICAgIHRoaW5rKSwKPiA+ICAgLSBoZSBjb250cmlidXRlZCBzaWduaWZpY2FudCBpZGVh
cywgYWx0aG91Z2ggZm9yIHRoaXMgdGhlcmUgaXMgYQo+ID4gICAgICJDby1kZXZlbG9wZWQtYnki
IHRhZy4KPiA+Cj4gPiBJZiBzb21lb25lIG1hZGUganVzdCByZXZpZXcgLSBhZGQgUmV2aWV3ZWQt
YnkuIElmIHNvbWVvbmUgc3VnZ2VzdGVkIHRoZQo+ID4gcGF0Y2ggLSBhZGQgU3VnZ2VzdGVkLWJ5
Lgo+Cj4gTXkgc2lnbmVkLW9mZiBoZXJlIHdhcyBhZGRlZCB0byBtYXJrIHRoYXQgdGhpcyBwYXRj
aCBpcyBhbGxvd2VkIHRvIGJlCj4gc3VibWl0dGVkIHRvIHRoZSBwdWJsaWMgbWFpbGluZyBsaXN0
LCBhcyBJIGhhdmUgcmVxdWlyZWQgY29tcGFueQo+IHBlcm1pc3Npb25zIGZvciBzdWNoIGFjdGl2
aXR5LiBJdCBpcyBub3QgdGhhdCB1bmNvbW1vbiB0aGF0IGEgZ2l2ZW4KPiBwYXRjaCBoYXMgbW9y
ZSB0aGFuIG9uZSBzaWduZWQtb2ZmIGFuZCBzdGlsbCB0aGUgbWFpbiBhdXRob3IgaGFzIHRoZQo+
IGZpcnN0IHNpZ25lZC1vZmYgdGFnLgoKVGhhbmtzIGZvciBleHBsYW5hdGlvbnMuIElmIEkgdW5k
ZXJzdGFuZCBjb3JyZWN0bHksIHlvdXIgU29CIGFwcGVhcnMKYmVjYXVzZSBzb21lIGludGVybmFs
IFNhbXN1bmcgcnVsZXMuIFRoYXQgaXMgbm90IHdoYXQgU29CIGlzIG1lYW50CmZvcjoKaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy1yYzgvc291cmNlL0RvY3VtZW50YXRpb24v
cHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w0MzEKSWYgeW91IGRvIG5vdCBjb250cmli
dXRlZCB0byB0aGUgcGF0Y2gsIGRpZCBub3QgdG91Y2ggaXQgKGUuZy4KcmViYXNpbmcpIGFuZCB5
b3UgYXJlIG5vdCBzZW5kaW5nIGl0LCB0aGVuIHlvdXIgU29CIHNob3VsZCBub3QgYmUKdGhlcmUu
IEl0IGxvb2tzIGxpa2UgdGhlIHNhbWUgbWFkbmVzcyB3aXRoIEt5dW5nbWluIFBhcmsgbG9uZyB0
aW1lCmFnbzoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
a3J6ay9saW51eC5naXQvY29tbWl0Lz9oPWZvci1uZXh0JmlkPTZjNmNmNjRiMTY0MzhlYWM2ZGE5
YTkwNDEyYTgyMzE2YWQxOTZlN2MKRXZlcnkgcGF0Y2ggd2FzIG1hcmtlZCB3aXRoIFNvQiBldmVu
IHRob3VnaCBoZSB3YXMgbm90IGludm9sdmVkIGF0IGFsbAppbiB0aGUgcHJvY2Vzcy4KClRoYXQn
cyBub3Qgd2hhdCBrZXJuZWwncyBTb0IgaXMgZm9yLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
