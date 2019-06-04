Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495A34BA4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 17:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037FC898ED;
	Tue,  4 Jun 2019 15:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E35898ED
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 15:09:07 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id c3so19868466otr.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 08:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKSHYo9ctUMrD0sjylIwNb1es2ByOZKas8LIpRbYBmw=;
 b=msBRP+g7TpjITfsw1LjhM+04nfAANRSxlGDMAeOUuZiGkZXlzt1kxLLsfghCAa7OUi
 SPf6FWP9ulYaBd9ps3GnABS3ppy8cz0Rr6vx5sVn14Pn2Jjd/oIU/RQj8e2cVzMeCgQs
 19mdsd25K9vUXdnziL5ps6Ojcuap4krukAq1QxGLpSH1YeAB0rljYNI121HtPSzoezX0
 7Gyp40XYLLoAhm/e9lvO98XZz+Enlx2bppaYoaut4VLmIhnmoQHwHlPepoHxw9MpfIiQ
 1ZK0VkyJXGCDMNcLoa3GKlJnr+aAhweELYLVE7ruAroWzLjAyQcPBUeKX3NH3JCmFyfg
 bSWQ==
X-Gm-Message-State: APjAAAVRHt4gxI547bsJxfPijVwAGyADIvZfhO1mdJz57dI1nLwtEf7K
 lAGOgEhJfU7bDe5gNONYBggZ9AwWfdiduQKKsDA=
X-Google-Smtp-Source: APXvYqwWBcudZPjaM9b9iqmRFgfE4JacyimajXEuFISTyDx4p3PP+AK36wMIWf9cNbNJe5l9iy35X4ISimTqp7AgU2I=
X-Received: by 2002:a9d:d87:: with SMTP id 7mr5183267ots.263.1559660947275;
 Tue, 04 Jun 2019 08:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
In-Reply-To: <20190604122308.98D4868B20@newverein.lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 4 Jun 2019 08:08:40 -0700
Message-ID: <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XKSHYo9ctUMrD0sjylIwNb1es2ByOZKas8LIpRbYBmw=;
 b=iQ0KHhetCVR5IsqwtBICpgv+IF3ki1lApWvboK97GBOeFeF30aJpMMIc+Pv7G75AzY
 fbNFD0cVlFkARgRfffG0B0/ymhuaz58CPbPj1tRw3w/wzMKB/Q9gh9wimCyFPHETfFCB
 dIlApbe6rwG169C0YAk650uTa+EZqQlRNnBrNEBsmKxauoxatj6zeERRwK4njpSkGPQV
 Sda9jJhVREVTr/Wpb2Z+NAAcN0xOxA0sXnrZarbBM3lS0tAqTyWiI86aYo1/4ZcACEZ/
 B6v91CjdXTlpIAC3w9zSbHeDKu1YHNDQILpNAF6OD0np8sOXOnghUlUz0KHM/jlYzvDX
 hhZA==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gNCwgMjAxOSBhdCA1OjIzIEFNIFRvcnN0ZW4gRHV3ZSA8ZHV3ZUBsc3QuZGU+
IHdyb3RlOgo+Cj4gVGVyZXMtSSBoYXMgYW4gYW54NjM0NSBicmlkZ2UgY29ubmVjdGVkIHRvIHRo
ZSBSR0I2NjYgTENEIG91dHB1dCwgYW5kCj4gdGhlIEkyQyBjb250cm9sbGluZyBzaWduYWxzIGFy
ZSBjb25uZWN0ZWQgdG8gSTJDMCBidXMuIGVEUCBvdXRwdXQgZ29lcwo+IHRvIGFuIElubm9sdXgg
TjExNkJHRSBwYW5lbC4KPgo+IEVuYWJsZSBpdCBpbiB0aGUgZGV2aWNlIHRyZWUuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4gU2lnbmVkLW9mZi1i
eTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2UuZGU+Cj4gLS0tCj4gIC4uLi9ib290L2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyAgICAgIHwgNjUgKysrKysrKysrKysrKysrKysr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0
LXRlcmVzLWkuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10
ZXJlcy1pLmR0cwo+IGluZGV4IDBlYzQ2Yjk2OWE3NS4uYTBhZDQzOGIwMzdmIDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMK
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWku
ZHRzCj4gQEAgLTY1LDYgKzY1LDIxIEBACj4gICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICB9
Owo+Cj4gKyAgICAgICBwYW5lbDogcGFuZWwgewo+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0iaW5ub2x1eCxuMTE2YmdlIiwgInNpbXBsZS1wYW5lbCI7CgpJdCdzIHN0aWxsICJzaW1wbGUt
cGFuZWwiLiBJIGJlbGlldmUgSSBhbHJlYWR5IG1lbnRpb25lZCB0aGF0IFJvYgphc2tlZCBpdCB0
byBiZSBlZHAtY29ubmVjdG9yLgoKPiArICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+
ICsgICAgICAgICAgICAgICBwb3dlci1zdXBwbHkgPSA8JnJlZ19kY2RjMT47Cj4gKyAgICAgICAg
ICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArCj4gKyAgICAgICAgICAgICAgIHBv
cnRzIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwYW5lbF9pbjogcG9ydCB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZh
bng2MzQ1X291dD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+
ICsKPiAgICAgICAgIHJlZ191c2IxX3ZidXM6IHVzYjEtdmJ1cyB7Cj4gICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiAgICAgICAgICAgICAgICAgcmVndWxh
dG9yLW5hbWUgPSAidXNiMS12YnVzIjsKPiBAQCAtODEsMjAgKzk2LDQ4IEBACj4gICAgICAgICB9
Owo+ICB9Owo+Cj4gKyZkZSB7Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+
ICAmZWhjaTEgewo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+Cj4KPiAtLyogVGhl
IEFOWDYzNDUgZURQLWJyaWRnZSBpcyBvbiBpMmMwLiBUaGVyZSBpcyBubyBsaW51eCAobWFpbmxp
bmUpCj4gLSAqIGRyaXZlciBmb3IgdGhpcyBjaGlwIGF0IHRoZSBtb21lbnQsIHRoZSBib290bG9h
ZGVyIGluaXRpYWxpemVzIGl0Lgo+IC0gKiBIb3dldmVyIGl0IGNhbiBiZSBhY2Nlc3NlZCB3aXRo
IHRoZSBpMmMtZGV2IGRyaXZlciBmcm9tIHVzZXIgc3BhY2UuCj4gLSAqLwo+ICAmaTJjMCB7Cj4g
ICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKPiAgICAgICAgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7Cj4gICAgICAgICBwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47Cj4gICAg
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsgICAgICAgYW54NjM0NTogYW54NjM0NUAzOCB7
Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NjM0NSI7Cj4gKyAg
ICAgICAgICAgICAgIHJlZyA9IDwweDM4PjsKPiArICAgICAgICAgICAgICAgcmVzZXQtZ3Bpb3Mg
PSA8JnBpbyAzIDI0IEdQSU9fQUNUSVZFX0xPVz47IC8qIFBEMjQgKi8KPiArICAgICAgICAgICAg
ICAgZHZkZDI1LXN1cHBseSA9IDwmcmVnX2RsZG8yPjsKPiArICAgICAgICAgICAgICAgZHZkZDEy
LXN1cHBseSA9IDwmcmVnX2RsZG8zPjsKPiArCj4gKyAgICAgICAgICAgICAgIHBvcnRzIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcG9ydEAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFueDYzNDVf
aW46IGVuZHBvaW50IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9vdXRfYW54NjM0NT47Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcG9ydEAxIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFueDYzNDVfb3V0OiBlbmRwb2ludCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW5fZWRwPjsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsK
PiArICAgICAgICAgICAgICAgfTsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmbWl4ZXIwIHsK
PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPgo+ICAmbW1jMCB7Cj4gQEAgLTI3OSw2
ICszMjIsMjAgQEAKPiAgICAgICAgIHZjYy1oZG1pLXN1cHBseSA9IDwmcmVnX2RsZG8xPjsKPiAg
fTsKPgo+ICsmdGNvbjAgewo+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAr
ICAgICAgIHBpbmN0cmwtMCA9IDwmbGNkX3JnYjY2Nl9waW5zPjsKPiArCj4gKyAgICAgICBzdGF0
dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmdGNvbjBfb3V0IHsKPiArICAgICAgIHRjb24wX291
dF9hbng2MzQ1OiBlbmRwb2ludEAwIHsKPiArICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ICsg
ICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmFueDYzNDVfaW4+Owo+ICsgICAgICAg
fTsKPiArfTsKPiArCj4gICZ1YXJ0MCB7Cj4gICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOwo+ICAgICAgICAgcGluY3RybC0wID0gPCZ1YXJ0MF9wYl9waW5zPjsKPiAtLQo+IDIuMTYu
NAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
