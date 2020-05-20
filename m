Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D9D1DB516
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B401589B0C;
	Wed, 20 May 2020 13:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A389389B0C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:33:05 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id j127so760730vke.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L+wLib9t1HSBaFyWdcgT73oQcPqcnXrhuvBlj33PAy4=;
 b=CM8jiAIyPOnpHvZCdZ3L2PP0W7vHvBTY0t2LsqKNZ0Bc8bC+r+F4ZOd5k+AZf9Esg0
 42khJ5Z2U6jP3zxEr/OxsGS0H4ez8rg0yTE21HuVJ3LY8hBBLKCu4qakCI1ICnRSgyNu
 j0J7R5XAJP6HtFzExjm8u3QzcrfPFC4/Wk0lCjW8JdnRFWTL1J4VMq+zmIGRJT7VMkE0
 R8f+jpjdUeVDPObxWozp98FJCs2DIbHaU6TAyhmWNbvhC9MImK0l/kLHAdvP/EKbOGAe
 3gu5LQ33b4KWh5Eo2oY4/4KvjjDiWbBu75hxQntxZL3E7nGKA94Mx2CZMSPJ7cpCRFfT
 caJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L+wLib9t1HSBaFyWdcgT73oQcPqcnXrhuvBlj33PAy4=;
 b=H3XKbC4HWs6G8IG8Qj2wGkLfdP//zd3bSgRDVNkvidthbHPNN/hn2+E1k8mA933xXP
 OGKV0aPfNoxGNr0TzjYK4sH4XS3Tj8BVrMMFy3dhp+xxyEO+Xl5m6zHU0XFVGvezv/c4
 InEk1dMuC9UrjNl48xkO2Ev0uWsXvOCe72tVZkN1hqajrfHcoCFhsCZz505j8sAd77ne
 CUQZHWgM1m7FREvmfMwT3LxqoKrLDqdhXhdFtgq7gf/ugEyyKb6aSI0TDzVniV7yuOSU
 Cp7H0tdv/GPGQuzLrY5K2DKB0PCeVpuO13rnXipq5c+6nBFQ8A5h0Dik04OUS2Uk8nBI
 48gQ==
X-Gm-Message-State: AOAM530IjPoRQsm9HSVDXfh1/4UE3umkzEuW5RNVvW4wf8jMhhb8rHXb
 uXLwFO4dZ4/653NzVvL1jB0zH2Oq/G2JF6FqIw0=
X-Google-Smtp-Source: ABdhPJxuYsAMScS2doKnieh0Bl35Auo5CoD3JxVQAqtrxtZWEIwfKFIc9ZR9FDw+KGSPevjRt/rCw2AMU8bhY1RfpAE=
X-Received: by 2002:a1f:2bd7:: with SMTP id r206mr3802275vkr.28.1589981584306; 
 Wed, 20 May 2020 06:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200520121450.79340-1-nirmoy.das@amd.com>
 <96a01388-7d91-56b5-4cd4-16052aba7a60@amd.com>
 <158997895740.8153.16875812670855148581@build.alporthouse.com>
 <b2284cd6-56cb-847a-1b6f-e4825c4ec1d3@amd.com>
 <158998064926.8153.3458194049597605952@build.alporthouse.com>
In-Reply-To: <158998064926.8153.3458194049597605952@build.alporthouse.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 20 May 2020 14:30:08 +0100
Message-ID: <CACvgo52LSA9P-ifqFN8pgaTVC805vfbAsCV0rPbGyZQveTyAnw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: check for NULL pointer in drm_gem_object_put
To: Chris Wilson <chris@chris-wilson.co.uk>
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
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBNYXkgMjAyMCBhdCAxNDoxNywgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gUXVvdGluZyBDaHJpc3RpYW4gS8O2bmlnICgyMDIwLTA1
LTIwIDEzOjU0OjU1KQo+ID4gQW0gMjAuMDUuMjAgdW0gMTQ6NDkgc2NocmllYiBDaHJpcyBXaWxz
b246Cj4gPiA+IFF1b3RpbmcgQ2hyaXN0aWFuIEvDtm5pZyAoMjAyMC0wNS0yMCAxMzoxOTo0MikK
PiA+ID4+IEFtIDIwLjA1LjIwIHVtIDE0OjE0IHNjaHJpZWIgTmlybW95IERhczoKPiA+ID4+PiBk
cm1fZ2VtX2ZiX2Rlc3Ryb3koKSBjYWxscyBkcm1fZ2VtX29iamVjdF9wdXQoKSB3aXRoIE5VTEwg
b2JqIGNhdXNpbmc6Cj4gPiA+Pj4gWyAgIDExLjU4NDIwOV0gQlVHOiBrZXJuZWwgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+Pj4gWyAgIDEx
LjU4NDIxM10gI1BGOiBzdXBlcnZpc29yIHdyaXRlIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQo+ID4g
Pj4+IFsgICAxMS41ODQyMTVdICNQRjogZXJyb3JfY29kZSgweDAwMDIpIC0gbm90LXByZXNlbnQg
cGFnZQo+ID4gPj4+IFsgICAxMS41ODQyMTZdIFBHRCAwIFA0RCAwCj4gPiA+Pj4gWyAgIDExLjU4
NDIyMF0gT29wczogMDAwMiBbIzFdIFNNUCBOT1BUSQo+ID4gPj4+IFsgICAxMS41ODQyMjNdIENQ
VTogNyBQSUQ6IDE1NzEgQ29tbTogZ25vbWUtc2hlbGwgVGFpbnRlZDogRyAgICAgICAgICAgIEUg
ICAgIDUuNy4wLXJjMS0xLWRlZmF1bHQrICMyNwo+ID4gPj4+IFsgICAxMS41ODQyMjVdIEhhcmR3
YXJlIG5hbWU6IE1pY3JvLVN0YXIgSW50ZXJuYXRpb25hbCBDby4sIEx0ZC4gTVMtN0EzMS9YMzcw
IFhQT1dFUiBHQU1JTkcgVElUQU5JVU0gKE1TLTdBMzEpLCBCSU9TIDEuTVIgMTIvMDMvMjAxOQo+
ID4gPj4+IFsgICAxMS41ODQyMzddIFJJUDogMDAxMDpkcm1fZ2VtX2ZiX2Rlc3Ryb3krMHgyOC8w
eDcwIFtkcm1fa21zX2hlbHBlcl0KPiA+ID4+PiA8c25pcD4KPiA+ID4+PiBbICAgMTEuNTg0MjU2
XSBDYWxsIFRyYWNlOgo+ID4gPj4+IFsgICAxMS41ODQyNzldICBkcm1fbW9kZV9ybWZiKzB4MTg5
LzB4MWMwIFtkcm1dCj4gPiA+Pj4gWyAgIDExLjU4NDI5OV0gID8gZHJtX21vZGVfcm1mYisweDFj
MC8weDFjMCBbZHJtXQo+ID4gPj4+IFsgICAxMS41ODQzMTRdICBkcm1faW9jdGxfa2VybmVsKzB4
YWEvMHhmMCBbZHJtXQo+ID4gPj4+IFsgICAxMS41ODQzMjldICBkcm1faW9jdGwrMHgxZmYvMHgz
YjAgW2RybV0KPiA+ID4+PiBbICAgMTEuNTg0MzQ3XSAgPyBkcm1fbW9kZV9ybWZiKzB4MWMwLzB4
MWMwIFtkcm1dCj4gPiA+Pj4gWyAgIDExLjU4NDQyMV0gIGFtZGdwdV9kcm1faW9jdGwrMHg0OS8w
eDgwIFthbWRncHVdCj4gPiA+Pj4gWyAgIDExLjU4NDQyN10gIGtzeXNfaW9jdGwrMHg4Ny8weGMw
Cj4gPiA+Pj4gWyAgIDExLjU4NDQzMF0gIF9feDY0X3N5c19pb2N0bCsweDE2LzB4MjAKPiA+ID4+
PiBbICAgMTEuNTg0NDM0XSAgZG9fc3lzY2FsbF82NCsweDVmLzB4MjQwCj4gPiA+Pj4gWyAgIDEx
LjU4NDQzOF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKPiA+ID4+
PiBbICAgMTEuNTg0NDQwXSBSSVA6IDAwMzM6MHg3ZjBlZjgwZjcyMjcKPiA+ID4+Pgo+ID4gPj4+
IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPiA+ID4+IEZp
eGVzOiAuLi4uIG1pc3NpbmcgaGVyZS4gQXBhcnQgZnJvbSB0aGF0IFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnCj4gPiA+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4KPiA+ID4+Cj4g
PiA+PiBQbGVhc2UgcmVzZW5kIHdpdGggdGhlIHRhZyBhZGRlZCwgdGhlbiBJJ20gZ29pbmcgdG8g
cHVzaCB0aGlzIHRvCj4gPiA+PiBkcm0tbWlzYy1uZXh0IGFzYXAuCj4gPiA+Pgo+ID4gPj4gQ2hy
aXN0aWFuLgo+ID4gPj4KPiA+ID4+PiAtLS0KPiA+ID4+PiAgICBpbmNsdWRlL2RybS9kcm1fZ2Vt
LmggfCAzICsrKwo+ID4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+
ID4+Pgo+ID4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRl
L2RybS9kcm1fZ2VtLmgKPiA+ID4+PiBpbmRleCA1MjE3M2FiZGY1MDAuLmExMzUxMDM0NmE5YiAx
MDA2NDQKPiA+ID4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPiA+ID4+PiArKysgYi9p
bmNsdWRlL2RybS9kcm1fZ2VtLmgKPiA+ID4+PiBAQCAtMzcyLDYgKzM3Miw5IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBkcm1fZ2VtX29iamVjdF9nZXQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
Cj4gPiA+Pj4gICAgc3RhdGljIGlubGluZSB2b2lkCj4gPiA+Pj4gICAgZHJtX2dlbV9vYmplY3Rf
cHV0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQo+ID4gPj4+ICAgIHsKPiA+ID4+PiArICAg
ICBpZiAoIW9iaikKPiA+ID4+PiArICAgICAgICAgICAgIHJldHVybjsKPiA+ID4+PiArCj4gPiA+
IFRoaXMgYWRkcyBzZXZlcmFsIHRob3VzYW5kIE5VTEwgY2hlY2tzIHdoZXJlIHRoZXJlIHdlcmUg
cHJldmlvdXNseSBub25lLgo+ID4gPiBJIGRvdWJ0IHRoZSBjb21waWxlciBlbGltaW5hdGVzIHRo
ZW0gYWxsLgo+ID4gPgo+ID4gPiBJJ2Qgc3VnZ2VzdCByZXZlcnRpbmcKPiA+ID4gYjVkMjUwNzQ0
Y2NjICgiZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQgYW5kIF9fZHJt
X2dlbV9vYmplY3RfcHV0KCkiKQo+ID4KPiA+IEkgZGlkbid0IGxvb2tlZCBpbnRvIHRoaXMgcGF0
Y2ggaW4gZGV0YWlsLCBidXQgYWxsb3dpbmcgdG8gY2FsbCAqX3B1dCgpCj4gPiBmdW5jdGlvbnMg
d2l0aCBOVUxMIGFuZCBub3RoaW5nIGJhZCBoYXBwZW5zIGlzIHJhdGhlciBjb21tb24gcHJhY3Rp
Y2UuCj4gPgo+ID4gT24gdGhlIG90aGVyIGhhbmQgSSBhZ3JlZSB0aGF0IHRoaXMgbWlnaHQgY2F1
c2UgYSBwZXJmb3JtYW5jZSBwcm9ibGVtLgo+ID4gSG93IG1hbnkgc2l0ZXMgZG8gd2UgaGF2ZSB3
aGljaCBjb3VsZCBjYWxsIGRybV9nZW1fb2JqZWN0X3B1dCgpIHdpdGggTlVMTD8KPgo+IEp1c3Qg
dG8gcHV0IHRoaXMgaW4gYSB0aW55IGJpdCBvZiBwZXJzcGVjdGl2ZSwgZm9yIGk5MTUua28KPgo+
IGFkZC9yZW1vdmU6IDAvMCBncm93L3NocmluazogMTQxLzIwIHVwL2Rvd246IDIyMTEvLTUyNSAo
MTY4NikKPgo+IFdlJ3ZlIGhhZCBmbGFtZSB3YXJzIGZvciBsZXNzLiAoQmVjYXVzZSBpdCdzIGVh
c3kgdG8gYXJndWUgb3ZlciBsaXR0bGUKPiBjaGFuZ2VzLikgTm93IHRoaXMgaXMganVzdCBmcm9t
IHRoaXMgcGF0Y2ggYW5kIG5vdCB0aGUgcmV2ZXJ0Li4uCj4gVGhlIHJldmVydCBoYXMgbm8gZWZm
ZWN0IG9uIGNvZGUgc2l6ZS4KCklmIHdlIHBsYXkgdGhlIHJldmVydCBnYW1lIHRoaW5nIHdpbGwg
bmV2ZXIgZW5kIHdpdGggaGF2aW5nIGl0IGZpeGVkIDotKApJJ2Qgc3VnZ2VzdCBzdGlja2luZyB3
aXRoIHRoZSBOVUxMIGNoZWNrLCBtYXliZSBldmVuIGEgV0FSTiB0byBhaWQKZGVidWcgdGhlIDI0
MCB1c2VjYXNlcy4KCkZvciB0aGUgcGF0Y2g6CkZpeGVzOiBiNWQyNTA3NDRjY2MgKCJkcm0vZ2Vt
OiBmb2xkIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCBhbmQKX19kcm1fZ2VtX29iamVjdF9w
dXQoKSIpClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
