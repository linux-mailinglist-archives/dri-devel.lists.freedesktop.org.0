Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22C8A6FD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 21:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62E56E5C9;
	Mon, 12 Aug 2019 19:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2126E5C9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 19:21:15 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77EB12070C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 19:21:15 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id y26so104012810qto.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:21:15 -0700 (PDT)
X-Gm-Message-State: APjAAAVpNehv/xaMfa3KQcYDBZ4XEL4Qc5KARPm5svaQyzFgLGxGBAPv
 pRacN0kMuVvU5QXzfrGPy2XEllNjT+4bqvH5ug==
X-Google-Smtp-Source: APXvYqzukQLPCpRqyhl2yBg9VDqcLGj27JeP/LpiADUz51AXuwlmEIe3TH1B9NMFhgt0VhH4sIBcsAms6uCG0vdIMz8=
X-Received: by 2002:ac8:7593:: with SMTP id s19mr23708920qtq.136.1565637674680; 
 Mon, 12 Aug 2019 12:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
 <20190811165558.GE14660@ravnborg.org>
In-Reply-To: <20190811165558.GE14660@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Aug 2019 13:21:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLkhh7v_h0WKq5WoXEKXHECDcSvvUHPNspgMj15wfNxwQ@mail.gmail.com>
Message-ID: <CAL_JsqLkhh7v_h0WKq5WoXEKXHECDcSvvUHPNspgMj15wfNxwQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565637675;
 bh=zTCVHvVzoCk41i7ZTn9PL1j0I5PzM2dEUwY166PH8GY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=um360vUQISUia4GbR4p2qn8VvXmaFEQM2hYH9ZF/vPoeI+zp34odJjKJXGjWe/ZIz
 pm0AY1zpFKW8tTQdGZAkI350XzWLOycE7DcMVHMNCujFgU81bV2kJ32cLWVUzWPaWJ
 mdj4A99l8xawx7P/zEnG5F5pMj+PkPx0zWlV2Ook=
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMTA6NTYgQU0gU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPiB3cm90ZToKPgo+IEhpIExhdXJlbnQuCj4KPiBNeSBtZXRhLXNjaGVtYXMgZm9vIGlz
IHZlcnkgbGltaXRlZCwgYnV0IEkgbm90aWNlZCBhIGZldyB0aGluZ3MuCj4gSG9wZWZ1bGx5IFJv
YiBmaW5kcyB0aW1lIHNvb24gdG8gcmV2aWV3Lgo+Cj4gICAgICAgICBTYW0KPgo+IE9uIFN1biwg
QXVnIDExLCAyMDE5IGF0IDAyOjEwOjQyQU0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gPiBUaGUgTkVDIE5MODA0OEhMMTEgaXMgYSAxMC40Y20gV1ZHQSAoODAweDQ4MCkgcGFuZWwg
d2l0aCBhIDI0LWJpdCBSR0IKPiA+IHBhcmFsbGVsIGRhdGEgaW50ZXJmYWNlIGFuZCBhbiBTUEkg
Y29udHJvbCBpbnRlcmZhY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+ID4KPiA+IC0gQ29udmVydCB0byBZQU1MCj4gPiAtLS0KPiA+ICAuLi4vZGlz
cGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sICAgICAgICAgfCA0OSArKysrKysrKysrKysr
KysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvbmVjLG5sODA0OGhsMTEueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvbmVjLG5sODA0
OGhsMTEueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uY2MzZDQwOTc1ODI4Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sCj4g
PiBAQCAtMCwwICsxLDQ5IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sIwo+ID4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4g
K3RpdGxlOiBORUMgTkw4MDQ4SEwxMSA0LjEiIFdWR0EgVEZUIExDRCBwYW5lbAo+ID4gKwo+ID4g
K2Rlc2NyaXB0aW9uOgo+ID4gKyAgVGhlIE5FQyBOTDgwNDhITDExIGlzIGEgNC4xIiBXVkdBIFRG
VCBMQ0QgcGFuZWwgd2l0aCBhIDI0LWJpdCBSR0IgcGFyYWxsZWwKPiA+ICsgIGRhdGEgaW50ZXJm
YWNlIGFuZCBhbiBTUEkgY29udHJvbCBpbnRlcmZhY2UuCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6
Cj4gPiArICAtIExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KPiA+ICsKPiA+ICthbGxPZjoKPiA+ICsgIC0gJHJlZjogcGFuZWwtY29tbW9uLnlhbWwj
Cj4gSSAqdGhpbmsqIHdlIGFyZSBtaXNzaW5nIGEgcmVmZXJlbmNlIHRvIHNwaS1jb250cm9sbGVy
LnlhbWwgaGVyZS4KCk5vLCBiZWNhdXNlIHRoaXMgaXMgYSBTUEkgc2xhdmUsIG5vdCBhIFNQSSBj
b250cm9sbGVyLiBUaGUgZXhhbXBsZQpkb2VzIG5lZWQgYSAnc3BpJyBwYXJlbnQgbm9kZSBhbmQg
dGhlbiBzcGktY29udHJvbGxlci55YW1sIHdpbGwgZ2V0CmFwcGxpZWQgdG8gdGhlIGV4YW1wbGUu
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
