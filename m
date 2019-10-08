Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92314CFBDF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164689D5B;
	Tue,  8 Oct 2019 14:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CE889D5B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:05:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD9AC218DE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:05:45 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id u184so16858077qkd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:05:45 -0700 (PDT)
X-Gm-Message-State: APjAAAVJ4ougBXYjBYf7FLlsKRxb+1v0BrUQOVDOGJ+PZa12X8Ivbdpc
 9S/WKPtP04etIrmXx+/IWD7p7pqNbuHl7CmDwQ==
X-Google-Smtp-Source: APXvYqzmV2QKGWccGoICKAMKFwzAvk3BDhnCzy9bG1IFslKWjFwHSNzobfLRiSO2TBvO8XDayAdctf68UpVEJjgX+fE=
X-Received: by 2002:a05:620a:7da:: with SMTP id
 26mr27130717qkb.119.1570543544639; 
 Tue, 08 Oct 2019 07:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
 <20191008125038.GA2550@pi3>
In-Reply-To: <20191008125038.GA2550@pi3>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 09:05:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
Message-ID: <CAL_Jsq+GcsUWN6kjBLkyr1rHGh6_4=w6JL6+k7DBXkBcvHcSBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570543545;
 bh=BSS0pP5TSRCvXx2PTe+19CYaQtXYwyol55cIo7m2kK4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kew6HNvNZ6MlVZWAgDPneJGj58ojWZM9y1SNfNv2eqWdvrpd39CXDtv/nOjRtLDTn
 LXMWxGOtUr6RzWSRbP6C/c7tYxmpnY1iWy38I5FhwsOEecriIePU2URkPu38dZLjKK
 U8f9EO4J9PpFswvfVGwK3aBM5g1z582U/JNJ652A=
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
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA3OjUwIEFNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwNzozODoxNEFN
IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDQsIDIwMTkgYXQgMTA6
MTQgQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gVGhlIGNsa291dE4gbmFtZXMgb2YgY2xvY2tzIG11c3QgYmUgdW5pcXVlIGJlY2F1c2Ug
dGhleSByZXByZXNlbnQKPiA+ID4gdW5pcXVlIGlucHV0cyBvZiBjbG9jayBtdWx0aXBsZXhlci4K
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vc2Ftc3VuZy9wbXUueWFtbCB8IDYgKysrKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3BtdS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3BtdS55YW1sCj4g
PiA+IGluZGV4IDczYjU2ZmM1YmY1OC4uZDhlMDM3MTZmNWQyIDEwMDY0NAo+ID4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3NhbXN1bmcvcG11LnlhbWwKPiA+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5nL3Bt
dS55YW1sCj4gPiA+IEBAIC01Myw4ICs1MywxMCBAQCBwcm9wZXJ0aWVzOgo+ID4gPiAgICAgICAg
TGlzdCBvZiBjbG9jayBuYW1lcyBmb3IgcGFydGljdWxhciBDTEtPVVQgbXV4IGlucHV0cwo+ID4g
PiAgICAgIG1pbkl0ZW1zOiAxCj4gPiA+ICAgICAgbWF4SXRlbXM6IDMyCj4gPiA+IC0gICAgaXRl
bXM6Cj4gPiA+IC0gICAgICBwYXR0ZXJuOiAnXmNsa291dChbMC05XXxbMTJdWzAtOV18M1swLTFd
KSQnCj4gPiA+ICsgICAgYWxsT2Y6Cj4gPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gPiArICAgICAg
ICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTldfFsxMl1bMC05XXwzWzAtMV0pJCcKPiA+ID4gKyAg
ICAgIC0gdW5pcXVlSXRlbXM6IHRydWUKPiA+Cj4gPiBZb3Ugc2hvdWxkbid0IG5lZWQgdGhlICdh
bGxPZicsIGp1c3QgYWRkIHVuaXF1ZUl0ZW1zIGF0IHRoZSBzYW1lIGxldmVsIGFzIGl0ZW1zLgo+
Cj4gSWYgeW91IG1lYW4gc29tZXRoaW5nIGxpa2U6Cj4gICA1NiAgICAgdW5pcXVlSXRlbXM6IHRy
dWUKPiAgIDU3ICAgICBpdGVtczoKPiAgIDU4ICAgICAgIHBhdHRlcm46ICdeY2xrb3V0KFswLTld
fFsxMl1bMC05XXwzWzAtMV0pJCcKPgo+IFRoZW4gdGhlIGR0X2JpbmRpbmdfY2hlY2sgZmFpbHM6
Cj4KPiBkZXYvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1z
dW5nL3BtdS55YW1sOiBwcm9wZXJ0aWVzOmNsb2NrLW5hbWVzOgo+ICd1bmlxdWVJdGVtcycgaXMg
bm90IG9uZSBvZiBbJyRyZWYnLCAnYWRkaXRpb25hbEl0ZW1zJywgJ2FkZGl0aW9uYWxQcm9wZXJ0
aWVzJywgJ2FsbE9mJywgJ2FueU9mJywgJ2NvbnN0JywgJ2NvbnRhaW5zJywgJ2RlZmF1bHQnLCAn
ZGVwZW5kZW5jaWVzJywgJ2RlcHJlY2F0ZWQnLCAnZGVzY3JpcHRpb24nLCAnZWxzZScsICdlbnVt
JywgJ2l0ZW1zJywgJ2lmJywgJ21pbkl0ZW1zJywgJ21pbmltdW0nLCAnbWF4SXRlbXMnLCAnbWF4
aW11bScsICdub3QnLCAnb25lT2YnLCAncGF0dGVybicsICdwYXR0ZXJuUHJvcGVydGllcycsICdw
cm9wZXJ0aWVzJywgJ3JlcXVpcmVkJywgJ3RoZW4nLCAndHlwZScsICd0eXBlU2l6ZScsICd1bmV2
YWx1YXRlZFByb3BlcnRpZXMnXQoKSSBjYW4gYWRkIGl0LgoKVGhlIG90aGVyIG9wdGlvbiBpcyB0
byBmaXggdGhpcyBpbiB0aGUgY2xvY2sgc2NoZW1hLiBJJ20gbm90IHN1cmUgaWYKdGhlcmUncyBh
IG5lZWQgZm9yIGR1cGxpY2F0ZSBjbG9jay1uYW1lcy4gU2VlbXMgdW5saWtlbHkuIEknbGwgdGVz
dAp0aGF0LgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
