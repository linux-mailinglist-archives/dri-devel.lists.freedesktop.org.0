Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1749A72
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7137E6E104;
	Tue, 18 Jun 2019 07:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4C06E104
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:23:38 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18CAC2084B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:23:38 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b11so8445727lfa.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:23:38 -0700 (PDT)
X-Gm-Message-State: APjAAAUZxCBMG5K/0dEzfWJCGVUvNoIGEpYPGe7gPAnKaBPq/4e8Ft+R
 IaXHFTo7Ve9s7oyasQjyKkaYwpqGZtz6rg4Bxnw=
X-Google-Smtp-Source: APXvYqyRHNQDL07p1uJ2f/qXQt0uHz3gs1RKOM3JMH7WeEFFTiqYcEscviwS2gclVEBGNFIJl+wI4FH934Nmw0KMC5A=
X-Received: by 2002:a19:e308:: with SMTP id a8mr55812523lfh.69.1560842616344; 
 Tue, 18 Jun 2019 00:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
 <20190616081557.GA3826@kozik-lap>
 <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 18 Jun 2019 09:23:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd6OqHohswSzj7UEWJi1E7H53M_gvv4fkYC5kE5ZfN_Aw@mail.gmail.com>
Message-ID: <CAJKOXPd6OqHohswSzj7UEWJi1E7H53M_gvv4fkYC5kE5ZfN_Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560842618;
 bh=aIcK8giJ/WbrE61iXtjfzXPTL4lG0NbWO6c7oX7UYyQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1i/nQ36nfQpP8jYB5z5Y4aveCxKAwge+ERqpI2t6oqDpgTpNwbVl25N3t3OciY6yf
 jSYa0nm2i4BKwHTCtEnqgf1g2BWDcGp2w6tyWnDwDHIeKmS7HfCMfLk30WP6OO3aUf
 2UijoB7tC0K15pQiXuKZC3YokFRTXriMA6JSC2sA=
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOCBKdW4gMjAxOSBhdCAwMDowNiwgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1biAxNiwgMjAxOSBhdCAyOjE2IEFNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdW4g
MTQsIDIwMTkgYXQgMDE6MzE6NDNQTSAtMDcwMCwgSm9zZXBoIEtvZ3V0IHdyb3RlOgo+ID4gPiBE
b2N1bWVudCB2ZW5kb3Igc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJpbmcgZm9yIE1hbGkgZ3B1cyBv
biBFeHlub3MgU29Dcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEtvZ3V0IDxq
b3NlcGgua29ndXRAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50eHQgfCAxICsKPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC50
eHQKPiA+ID4gaW5kZXggMWIxYTc0MTI5MTQxLi5hOTcwNGM3MzZkMDcgMTAwNjQ0Cj4gPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2Fy
ZC50eHQKPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9h
cm0sbWFsaS1taWRnYXJkLnR4dAo+ID4gPiBAQCAtMTgsNiArMTgsNyBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOgo+ID4gPiAgICAgICsgImFtbG9naWMsbWVzb24tZ3htLW1hbGkiCj4gPiA+ICAgICAg
KyAicm9ja2NoaXAscmszMjg4LW1hbGkiCj4gPiA+ICAgICAgKyAicm9ja2NoaXAscmszMzk5LW1h
bGkiCj4gPiA+ICsgICAgKyAic2Ftc3VuZyxleHlub3MtbWFsaSIKPiA+Cj4gPiBBcmUgdGhlcmUg
YW55IGRyaXZlciBkaWZmZXJlbmNlcyBmb3IgRXh5bm9zPyBJZiBub3QgdGhlbiB3aHkgYWRkaW5n
Cj4gPiBhbm90aGVyIGNvbXBhdGlibGU/Cj4KPiBXcm9uZyBxdWVzdGlvbi4gQXJlIHRoZXJlIGFu
eSBoYXJkd2FyZSBkaWZmZXJlbmNlcz8gKFRyaWNrIHF1ZXN0aW9uCj4gYmVjYXVzZSBkaWZmZXJl
bmNlIGNvbXBhcmVkIHRvIHdoYXQ/KQo+Cj4gUmVhbGx5LCB0aGlzIHNob3VsZG4ndCBiZSAnZXh5
bm9zJywgYnV0IHBlciBTb0MuIEJ1dCBJJ2xsIGxlYXZlIGl0IHRvCj4gdGhlIFNhbXN1bmcgZm9s
a3MgdG8gZGVjaWRlIGhvdyBzcGVjaWZpYyBpdCBzaG91bGQgYmUuCgpJZiB2ZW5kb3IgY29tcGF0
aWJsZSBpcyBleHBlY3RlZCwgdGhlbiBsZXQncyBnbyB3aXRoIHBlci1zb2MKKEV4eW5vczU0MjAp
IGJlY2F1c2Ugb3RoZXIgU29DcyB1c2UgZGlmZmVyZW50IE1pZGdhcmQgY2hpcHNldHMgc28gdGhl
eQptaWdodCBjb21lIHdpdGggb3duIGRpZmZlcmVuY2VzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0
b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
