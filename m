Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700386FBD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 04:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4782B6E8BA;
	Fri,  9 Aug 2019 02:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BB46E8BA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 02:40:21 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E1F32173E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 02:40:20 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d23so94483173qto.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 19:40:20 -0700 (PDT)
X-Gm-Message-State: APjAAAWGJEWwVMkRKFGKFSCAEGlvcHm77R5woykcQLeaI1CfL1dWrWbp
 uP6fAB0fRAI2TyVZ4zTXcb6mH+lG5NPtx6EjBQ==
X-Google-Smtp-Source: APXvYqyjSqSBa6Vtp2fK1QO/enF2EqMLKoVPXVAmpblw7aD/rhRkYxbjk455KSMNJsenTHN4LBVIT5SBM7b781S4ks4=
X-Received: by 2002:ac8:23b3:: with SMTP id q48mr6014889qtq.110.1565318419160; 
 Thu, 08 Aug 2019 19:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190808222918.15153-1-robh@kernel.org>
 <CAM0jSHNWDLOCw0EiS1f3Dt44B8mpQVW7unztWmev0G+kgHBjOg@mail.gmail.com>
In-Reply-To: <CAM0jSHNWDLOCw0EiS1f3Dt44B8mpQVW7unztWmev0G+kgHBjOg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Aug 2019 20:40:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+OZYoLFX4BV=KOzP2NKiHhpFe=w9FBmq5SS3wFtKwzKA@mail.gmail.com>
Message-ID: <CAL_Jsq+OZYoLFX4BV=KOzP2NKiHhpFe=w9FBmq5SS3wFtKwzKA@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
To: Matthew Auld <matthew.william.auld@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565318420;
 bh=5IYdqlL6qXJgkFuXuobbx2OZDTPnfP9xGzUdBnUHxX8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sc4RZCPLoD5pdgdNO/Pq/T9N7Zb3sVhamhoWA0W6GSd3yPNuAYvRC/jNoW5iiCZ8h
 tz1GInzWWUC8V8WrAAGb13FqGNcj/FCRKq9oaObOd6tzOEkwUzivyTV8/avPcKN89p
 8BA/xPO15IGEEgIis9mX/l8YuiqMUxB1MGcKauK8=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA1OjE4IFBNIE1hdHRoZXcgQXVsZAo8bWF0dGhldy53aWxs
aWFtLmF1bGRAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgOCBBdWcgMjAxOSBhdCAyMzoy
OSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gVXAgdW50aWwg
bm93LCBhIHNpbmdsZSBzaGFyZWQgR1BVIGFkZHJlc3Mgc3BhY2Ugd2FzIHVzZWQuIFRoaXMgaXMg
bm90Cj4gPiBpZGVhbCBhcyB0aGVyZSdzIG5vIHByb3RlY3Rpb24gYmV0d2VlbiBwcm9jZXNzZXMg
YW5kIGRvZXNuJ3Qgd29yayBmb3IKPiA+IHN1cHBvcnRpbmcgdGhlIHNhbWUgR1BVL0NQVSBWQSBm
ZWF0dXJlLiBNb3N0IGltcG9ydGFudGx5LCB0aGlzIHdpbGwKPiA+IGhvcGVmdWxseSBtaXRpZ2F0
ZSBBbHlzc2EncyBmZWFyIG9mIFdlYkdMLCB3aGF0ZXZlciB0aGF0IGlzLgo+ID4KPiA+IE1vc3Qg
b2YgdGhlIGNoYW5nZXMgaGVyZSBhcmUgbW92aW5nIHN0cnVjdCBkcm1fbW0gYW5kIHN0cnVjdAo+
ID4gcGFuZnJvc3RfbW11IG9iamVjdHMgZnJvbSB0aGUgcGVyIGRldmljZSBzdHJ1Y3QgdG8gdGhl
IHBlciBGRCBzdHJ1Y3QuCj4gPiBUaGUgY3JpdGljYWwgZnVuY3Rpb24gaXMgcGFuZnJvc3RfbW11
X2FzX2dldCgpIHdoaWNoIGhhbmRsZXMgYWxsb2NhdGluZwo+ID4gYW5kIHN3aXRjaGluZyB0aGUg
aC93IGFkZHJlc3Mgc3BhY2VzLgo+ID4KPiA+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9z
b0Bjb2xsYWJvcmEuY29tPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogUm9iaW4gTXVy
cGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiA+IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPgo+ID4gQ2M6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2Vp
Z0Bjb2xsYWJvcmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KPiA+IC0tLQo+ID4gVGhpcyBkZXBlbmRzIG9uIG1hZHZpc2Ugc3VwcG9ydCAobm93
IGluIGRybS1taXNjKSBhbmQgdGhlIGhlYXAvbm8tZXhlYwo+ID4gc2VyaWVzIChqdXN0IHRoZSBy
ZXdvcmspLiBTZWVlbXMgdG8gYmUgd29ya2luZyBwcmV0dHkgd2VsbCBmb3IgbWUsIGJ1dAo+ID4g
bW9yZSB0ZXN0aW5nIHdvdWxkIGJlIGhlbHBmdWwuIEkndmUgcnVuIG11bHRpcGxlICdnbG1hcmsy
LWVzMi1kcm0KPiA+IC0tb2ZmLXNjcmVlbicgaW5zdGFuY2VzIGFuZCBHbm9tZSBTaGVsbC4gUnVu
bmluZyBtb3JlIHRoYW4gOCBjbGllbnRzIChhdAo+ID4gbGVhc3QgZm9yIFQ4NjApIHdpbGwgaGl0
IHRoZSBhZGRyZXNzIHNwYWNlIHN3aXRjaCBjb2RlIHBhdGhzLgo+ID4KPiA+IFJvYgo+ID4KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9ETyAgICAgICAgICAgICAgfCAgIDQgLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8ICAgMiArCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgIDI0ICsrLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyAgICB8ICAzMSArKy0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgICAgfCAgMTUgKy0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmggICAgfCAgIDMgKwo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyAgICB8ICAxMiArLQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyAgICB8IDIyMCArKysrKysr
KysrKysrKystLS0tLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11
LmggICAgfCAgIDggKwo+ID4gIDkgZmlsZXMgY2hhbmdlZCwgMjM5IGluc2VydGlvbnMoKyksIDgw
IGRlbGV0aW9ucygtKQo+Cj4gW3NuaXBdCj4KPiA+IEBAIC00MTMsNyArNDE0LDI4IEBAIHBhbmZy
b3N0X29wZW4oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlKQo+
ID4gICAgICAgICBwYW5mcm9zdF9wcml2LT5wZmRldiA9IHBmZGV2Owo+ID4gICAgICAgICBmaWxl
LT5kcml2ZXJfcHJpdiA9IHBhbmZyb3N0X3ByaXY7Cj4gPgo+ID4gLSAgICAgICByZXR1cm4gcGFu
ZnJvc3Rfam9iX29wZW4ocGFuZnJvc3RfcHJpdik7Cj4gPiArICAgICAgIHNwaW5fbG9ja19pbml0
KCZwYW5mcm9zdF9wcml2LT5tbV9sb2NrKTsKPiA+ICsKPiA+ICsgICAgICAgLyogNEcgZW5vdWdo
IGZvciBub3cuIGNhbiBiZSA0OC1iaXQgKi8KPiA+ICsgICAgICAgcGFuZnJvc3RfcHJpdi0+bW0u
Y29sb3JfYWRqdXN0ID0gcGFuZnJvc3RfZHJtX21tX2NvbG9yX2FkanVzdDsKPiA+ICsgICAgICAg
ZHJtX21tX2luaXQoJnBhbmZyb3N0X3ByaXYtPm1tLCBTWl8zMk0gPj4gUEFHRV9TSElGVCwgKFNa
XzRHIC0gU1pfMzJNKSA+PiBQQUdFX1NISUZUKTsKPgo+IERyaXZlLWJ5LWNvbW1lbnQ6IGRybV9t
bV9pbml0IHdpbGwgdHJhbXBsZSB5b3VyIGNvbG9yX2FkanVzdC4gSW50ZW50aW9uYWw/CgpObywg
dGhhbmtzLiBJIG11c3QgaGF2ZSBzd2l0Y2hlZCB0aGVtIGF0IHNvbWUgcG9pbnQuCgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
