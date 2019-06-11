Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BB3D0B3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 17:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8F689057;
	Tue, 11 Jun 2019 15:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629CE89057;
 Tue, 11 Jun 2019 15:25:50 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03D0221743;
 Tue, 11 Jun 2019 15:25:50 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id 33so6843029qtr.8;
 Tue, 11 Jun 2019 08:25:49 -0700 (PDT)
X-Gm-Message-State: APjAAAU5LutOlWlXyc710fBrfr3CPEQp+b0AMKnjdGMS6e4PbBwpmw5H
 GdkrMgvQ0G58L5Dkw4Idtn9pfVBJ3OPx7emBkA==
X-Google-Smtp-Source: APXvYqzPjuRg7gzez7BpTEniSzx8damxLOxBNc/30j7Wqsby4Sg0SN/ftQhCVmvj52vSz6sLfP6GnUjon1dfQkvHQ3o=
X-Received: by 2002:a05:6214:248:: with SMTP id
 k8mr29740285qvt.200.1560266749174; 
 Tue, 11 Jun 2019 08:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-3-dbasehore@chromium.org>
In-Reply-To: <20190611040350.90064-3-dbasehore@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 11 Jun 2019 09:25:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLM1CikZ8+NPjLk2CEW-z9vPynZpVG20x0jsa7hVq0LvA@mail.gmail.com>
Message-ID: <CAL_JsqLM1CikZ8+NPjLk2CEW-z9vPynZpVG20x0jsa7hVq0LvA@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: display/panel: Expand rotation
 documentation
To: Derek Basehore <dbasehore@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560266750;
 bh=d/VaFO2GopJ/soJKDMYISKQ69HFRcP7EG77tPBICDJk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CdshHLDgJ7Z/1d5LTs2sVuwWCODL2x/qXUFAMEQPKZm794Tm7ad0pFwve7BIfoo62
 4WDI7usTGjFy11bRMh+JpMTO5ZOpdW4p4qrqu8N+4vInTl3LBXaRd+8FMIxGt33wcR
 dracVjyhFWQwwtHdPHeCNubvSPz6pWMOO7QqSbIQ=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMTA6MDMgUE0gRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9y
ZUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBhZGRzIHRvIHRoZSByb3RhdGlvbiBkb2N1
bWVudGF0aW9uIHRvIGV4cGxhaW4gaG93IGRyaXZlcnMgc2hvdWxkCj4gdXNlIHRoZSBwcm9wZXJ0
eSBhbmQgZ2l2ZXMgYW4gZXhhbXBsZSBvZiB0aGUgcHJvcGVydHkgaW4gYSBkZXZpY2V0cmVlCj4g
bm9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERlcmVrIEJhc2Vob3JlIDxkYmFzZWhvcmVAY2hyb21p
dW0ub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQgICAg
ICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwudHh0Cj4gaW5kZXggZTJlNjg2Nzg1MmI4Li5mMzVk
NjJkOTMzZmMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvcGFuZWwudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwudHh0Cj4gQEAgLTIsMyArMiwzNSBAQCBDb21t
b24gZGlzcGxheSBwcm9wZXJ0aWVzCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPgo+ICAt
IHJvdGF0aW9uOiAgICBEaXNwbGF5IHJvdGF0aW9uIGluIGRlZ3JlZXMgY291bnRlciBjbG9ja3dp
c2UgKDAsOTAsMTgwLDI3MCkKPiArCj4gK1Byb3BlcnR5IHJlYWQgZnJvbSB0aGUgZGV2aWNlIHRy
ZWUgdXNpbmcgb2Ygb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbgoKRG9uJ3QgcHV0IGtlcm5l
bCBzcGVjaWZpY3MgaW50byBiaW5kaW5ncy4KCj4gKwo+ICtUaGUgcGFuZWwgZHJpdmVyIG1heSBh
cHBseSB0aGUgcm90YXRpb24gYXQgdGhlIFRDT04gbGV2ZWwsIHdoaWNoIHdpbGwKCldoYXQncyBU
Q09OPyBTb21ldGhpbmcgTWVkaWF0ZWsgc3BlY2lmaWMgSUlSQy4KCj4gK21ha2UgdGhlIHBhbmVs
IGxvb2sgbGlrZSBpdCBpc24ndCByb3RhdGVkIHRvIHRoZSBrZXJuZWwgYW5kIGFueSBvdGhlcgo+
ICtzb2Z0d2FyZS4KPiArCj4gK0lmIG5vdCwgYSBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBz
aG91bGQgYmUgYWRkZWQgdGhyb3VnaCB0aGUgU29DCj4gK3ZlbmRvciBEUk0gY29kZSB1c2luZyB0
aGUgZHJtX2Nvbm5lY3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5Cj4gK2Z1bmN0
aW9uLgoKVGhlICdyb3RhdGlvbicgcHJvcGVydHkgc2hvdWxkIGJlIGRlZmluZWQgcHVyZWx5IGJh
c2VkIG9uIGhvdyB0aGUKcGFuZWwgaXMgbW91bnRlZCByZWxhdGl2ZSB0byBhIGRldmljZSdzIG9y
aWVudGF0aW9uLiBJZiB0aGUgZGlzcGxheQpwaXBlbGluZSBoYXMgc29tZSBhYmlsaXR5IHRvIGhh
bmRsZSByb3RhdGlvbiwgdGhhdCdzIGEgZmVhdHVyZSBvZiB0aGUKZGlzcGxheSBwaXBlbGluZSBh
bmQgbm90IHRoZSBwYW5lbC4KCj4gKwo+ICtFeGFtcGxlOgoKVGhpcyBmaWxlIGlzIGEgY29sbGVj
dGlvbiBvZiBjb21tb24gcHJvcGVydGllcy4gSXQgc2hvdWxkbid0IGhhdmUgYW4KZXhhbXBsZSBl
c3BlY2lhbGx5IGFzIHRoaXMgZXhhbXBsZSBpcyBtb3N0bHkgbm9uLWNvbW1vbiBwcm9wZXJ0aWVz
LgoKPiArICAgICAgIHBhbmVsOiBwYW5lbEAwIHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJib2UsaGltYXg4Mjc5ZDhwIjsKPiArICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ICsg
ICAgICAgICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSAwPjsKCj4gKyAgICAgICAgICAg
ICAgIHBwMzMtZ3Bpb3MgPSA8JnBpbyAzNSAwPjsKPiArICAgICAgICAgICAgICAgcHAxOC1ncGlv
cyA9IDwmcGlvIDM2IDA+OwoKQlRXLCBhcmUgdGhlc2UgdXBzdHJlYW0gYmVjYXVzZSB0aGV5IGxv
b2sgbGlrZSBHUElPIGNvbnRyb2xsZWQKc3VwcGxpZXMgd2hpY2ggd2UgbW9kZWwgd2l0aCBncGlv
LXJlZ3VsYXRvciBiaW5kaW5nIHR5cGljYWxseS4KCj4gKyAgICAgICAgICAgICAgIHBpbmN0cmwt
bmFtZXMgPSAiZGVmYXVsdCIsICJzdGF0ZV8zMzAwbXYiLCAic3RhdGVfMTgwMG12IjsKPiArICAg
ICAgICAgICAgICAgcGluY3RybC0wID0gPCZwYW5lbF9waW5zX2RlZmF1bHQ+Owo+ICsgICAgICAg
ICAgICAgICBwaW5jdHJsLTEgPSA8JnBhbmVsX3BpbnNfMzMwMG12PjsKPiArICAgICAgICAgICAg
ICAgcGluY3RybC0yID0gPCZwYW5lbF9waW5zXzE4MDBtdj47Cj4gKyAgICAgICAgICAgICAgIGJh
Y2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+Owo+ICsgICAgICAgICAgICAgICByb3RhdGlvbiA9
IDwxODA+Owo+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBwb3J0IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwYW5lbF9pbjogZW5kcG9p
bnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0g
PCZkc2lfb3V0PjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICAg
ICB9Owo+ICsgICAgICAgfTsKPiAtLQo+IDIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
