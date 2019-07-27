Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2655977814
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 12:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79A86EE99;
	Sat, 27 Jul 2019 10:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9246EE99
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 10:12:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9737C2001F;
 Sat, 27 Jul 2019 12:12:19 +0200 (CEST)
Date: Sat, 27 Jul 2019 12:12:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: My penguin has blue feets (aka: RGB versus BGR troubles)
Message-ID: <20190727101218.GB25081@ravnborg.org>
References: <20190726203626.GA31474@ravnborg.org>
 <CAKb7UvinPymcodpDuu8DX=L2bo4eY7ML1uKdh6no7byLLiurOg@mail.gmail.com>
 <CAKMK7uEVaFeWwGQcvkZ9m2Q0DKzKmKTgkfmVZoKgt9iTR3dOMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEVaFeWwGQcvkZ9m2Q0DKzKmKTgkfmVZoKgt9iTR3dOMQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=1LxmcPr5kq2IILxxITYA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKPiA+ID4KPiA+ID4gKkFueSogaGludHMgd2h5IG1vZGV0ZXN0IGZhaWxzIHdo
ZW4gbXkgZHJpdmVyIHJlcG9ydHMgdGhlIGNvcnJlY3QgZm9ybWF0cz8KPiA+Cj4gPiBFdmVyeSBk
cml2ZXIgdG8gZGF0ZSBzdXBwb3J0cyBYUjI0LiBTbyBtb2RldGVzdCB1c2VzIHRoYXQgYnkgZGVm
YXVsdC4KPiA+IEJ1dCB0aGlzIGZhaWxzIHdpdGggeW91ciBkcml2ZXIgc2luY2UgaXQncyBhbiB1
bnN1cHBvcnRlZCBmb3JtYXQuCj4gPiBTb21ldGhpbmcgbGlrZToKPiA+Cj4gPiBtb2RldGVzdCAt
TSBhdG1lbC1sY2RjIC1zIDM0OjgwMHg0ODAtNjBIekBYQjI0Cj4gPgo+ID4gc2hvdWxkIGRvIHRo
ZSB0cmljay4gVGhlIHF1aXJrIGNvdmVycyBkcml2ZXJzIHRoYXQgdXNlIEFkZEZCKCkuCj4gPiBI
b3dldmVyIG1vZGV0ZXN0IGlzIGZhbmN5IGFuZCB1c2VzIEFkZEZCMiwgd2hpY2ggdGFrZXMgYW4g
ZXhwbGljaXQKPiA+IGZvcm1hdC4KPiAKPiBZZWFoIEkgdGhpbmtpIGZvciBmYmRldiB0aGUgY29y
cmVjdCBmaXggaXMgdG8gbG9vayB3aGV0aGVyIHRoZSBkcml2ZXIKPiBlbmFibGVkIGF0b21pYyBh
bmQgaWYgc28sIGNvbnN1bHQgdGhlIGZvdXJjYyBmb3JtYXQgbGlzdCBvZiB0aGUKPiBwcmltYXJ5
IHBsYW5lIG9mIHRoZSBmaXJzdCBjcnRjIHRvIGZpZ3VyZSBvdXQgd2hhdCB5b3UgbWlnaHQgYWN0
dWFsbHkKPiBoYXZlIHNldC4gV2l0aG91dCBhdG9taWMgeW91IGNhbid0IHJlYWx5IG9uIHRoZSBm
b3JtYXQgbGlzdCBiZWluZwo+IGNvcnJlY3Qgc2luY2UgZm9yIGRyaXZlcnMgd2hvIGdldCB0aGUg
ZGVmYXVsdCBwcmltYXJ5IHBsYW5lIHRoYXQKPiBkcm1fY3J0Y19pbml0IHNldHMgdXAgdGhlIGZv
cm1hdCBsaXN0IGlzIGdhcmJhZ2UuCgpJIGRvIG5vdCBmb2xsb3cgeW91IGhlcmUuCgojIG1vZGV0
ZXN0IC1NIGF0bWVsLWxjZGMgLXAKUGxhbmVzOgppZCAgICAgIGNydGMgICAgZmIgICAgICBDUlRD
IHgseSAgICAgICAgeCx5ICAgICBnYW1tYSBzaXplICAgICAgcG9zc2libGUgY3J0Y3MKMzEgICAg
ICAzMiAgICAgIDM1ICAgICAgMCwwICAgICAgICAgICAgIDAsMCAgICAgMCAgICAgICAgICAgICAg
IDB4MDAwMDAwMDEKICBmb3JtYXRzOiBYQjI0IEJHMjQgQkcxNgoKIyBtb2RldGVzdCAtTSBhdG1l
bC1sY2RjIC1hIC1wClBsYW5lczoKaWQgICAgICBjcnRjICAgIGZiICAgICAgQ1JUQyB4LHkgICAg
ICAgIHgseSAgICAgZ2FtbWEgc2l6ZSAgICAgIHBvc3NpYmxlIGNydGNzCjMxICAgICAgMzIgICAg
ICAzNSAgICAgIDAsMCAgICAgICAgICAgICAwLDAgICAgIDAgICAgICAgICAgICAgICAweDAwMDAw
MDAxCiAgZm9ybWF0czogWEIyNCBCRzI0IEJHMTYKClNvIHdpdGggb3Igd2l0aG91dCBhdG9taWMg
KC1hIG9wdGlvbikgdGhlIGRyaXZlciByZXBvcnRzIHRoZSBzYW1lIGZvcm1hdHMuCgoKIyBtb2Rl
dGVzdCAtTSBhdG1lbC1sY2RjIC1hIC1zIC4uLgoKZG9lcyBub3Qgd29yayBidHcuIEl0IGp1c3Qg
ZXhpc3RzIHdpdGhvdXQgYW55dGhpbmcgc2hvd24gb24gdGhlIHBhbmVsLgoKCj4gUmV3b3JraW5n
IHRoZSBlbnRpcmUKPiBmYmRldiBlbXVsYXRpb24gdG8gdXNlIGZvdXJjYyBjb2RlcyB3b3VsZCBi
ZSBldmVuIG1vcmUgYXdlc29tZSBJCj4gZ3Vlc3MuClRvIHRha2UgdGhlIGJhaXQgSSB3b3VsZCBu
ZWVkIGEgbGl0dGxlIGJpdCBtb3JlIGd1aWRpYW5jZSBvbiB0aGlzLgoKSXMgaXQgc29tZXRoaW5n
IGxpa2U6Ci0gTmV3IHZhcmlhbnQgYWYgZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKSB0aGF0IHRh
a2VzIGEgZm91cmNjIGNvZGUsIG5vdAogIGEgcHJlZmVycmVkX2JwcAotIGRybV9mYl9oZWxwZXJf
aW5pdGlhbF9jb25maWcgbGlrZXdpc2UKLSBkcm1fZmJfaGVscGVyX2ZiZGV2X3NldHVwIGxpa2V3
aXNlCi0gZHJtX2ZiX2hlbHBlcl9zaW5nbGVfZmJfcHJvYmUgbGlrZXdpc2UKCkFuZCB0aGVuIHdv
cmsgdGhyb3VnaCBhbGwgdGhlIGNvZGUgdW50aWwgd2Ugbm8gbG9uZ2VyIHJlbHkgb24KcHJlZmVy
cmVkX2JwcD8/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
