Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD58A6F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 21:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654E76E5C2;
	Mon, 12 Aug 2019 19:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8A86E5C2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 19:18:52 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D674A2075B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 19:18:51 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id y26so104005037qto.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:18:51 -0700 (PDT)
X-Gm-Message-State: APjAAAUdNshL8M37H2fQTBDRXeQIJA5rgBC/cBd6JGaucPp0CWuoMsvw
 Rp01ZLXCQPb2CZlE0lvv1u2VgODjhcvi9LeVuQ==
X-Google-Smtp-Source: APXvYqyO2vN61nr9Bc+CutAJZzormeluj0RgPVQuuzzd9Ob5t+0uR5H/a2E3sH/M8koro44rI+YeUBrCHeMB224WDLo=
X-Received: by 2002:ac8:7593:: with SMTP id s19mr23705857qtq.136.1565637531060; 
 Mon, 12 Aug 2019 12:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190810231048.1921-1-laurent.pinchart@ideasonboard.com>
 <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20190810231048.1921-4-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 12 Aug 2019 13:18:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+NO+s1Wz5AYKzVqC=ki0mHtK8dr3namdt82DvnDebeyw@mail.gmail.com>
Message-ID: <CAL_Jsq+NO+s1Wz5AYKzVqC=ki0mHtK8dr3namdt82DvnDebeyw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: panel: Add bindings for NEC
 NL8048HL11 panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565637532;
 bh=SAZ7+3iWzSFdHt0t+ouVPwJxcISNZwkTzBhnYy7gyYI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bCcolVlP8GvWBiocgubLR8mv9SgZW+g7lCPDyjqNgLs2Xw5C76rnQjVMBvDWBPuGA
 FvsDV7kmOeI7w9U9SmxB2AkS6VebSoMI4jxJ/2s/0KNTSRXAuZfJDJAVhK/TY7Vfjw
 lI6bmvNEiteX9SozrB6QG8vEihdCyrSe23B8Ti9U=
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
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMTAsIDIwMTkgYXQgNToxMCBQTSBMYXVyZW50IFBpbmNoYXJ0CjxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+Cj4gVGhlIE5FQyBOTDgwNDhITDEx
IGlzIGEgMTAuNGNtIFdWR0EgKDgwMHg0ODApIHBhbmVsIHdpdGggYSAyNC1iaXQgUkdCCj4gcGFy
YWxsZWwgZGF0YSBpbnRlcmZhY2UgYW5kIGFuIFNQSSBjb250cm9sIGludGVyZmFjZS4KPgo+IFNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+Cj4gLSBDb252ZXJ0IHRvIFlBTUwK
PiAtLS0KPiAgLi4uL2Rpc3BsYXkvcGFuZWwvbmVjLG5sODA0OGhsMTEueWFtbCAgICAgICAgIHwg
NDkgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygr
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwvbmVjLG5sODA0OGhsMTEueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDEx
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9u
ZWMsbmw4MDQ4aGwxMS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLmNjM2Q0MDk3NTgyOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9uZWMsbmw4MDQ4aGwxMS55YW1sCj4g
QEAgLTAsMCArMSw0OSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4g
KyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9k
aXNwbGF5L3BhbmVsL25lYyxubDgwNDhobDExLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IE5FQyBOTDgw
NDhITDExIDQuMSIgV1ZHQSBURlQgTENEIHBhbmVsCj4gKwo+ICtkZXNjcmlwdGlvbjoKPiArICBU
aGUgTkVDIE5MODA0OEhMMTEgaXMgYSA0LjEiIFdWR0EgVEZUIExDRCBwYW5lbCB3aXRoIGEgMjQt
Yml0IFJHQiBwYXJhbGxlbAo+ICsgIGRhdGEgaW50ZXJmYWNlIGFuZCBhbiBTUEkgY29udHJvbCBp
bnRlcmZhY2UuCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJl
ZjogcGFuZWwtY29tbW9uLnlhbWwjCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6
Cj4gKyAgICBjb25zdDogbmVjLG5sODA0OGhsMTEKPiArCj4gKyAgbGFiZWw6IHRydWUKPiArICBy
ZXNldC1ncGlvczogdHJ1ZQo+ICsgIHBvcnQ6IHRydWUKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0g
Y29tcGF0aWJsZQo+ICsgIC0gcmVzZXQtZ3Bpb3MKPiArICAtIHBvcnQKPiArCj4gK2FkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6CgpZb3VyIGV4YW1wbGUgd2lsbCBm
YWlsIG9uICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snLi4uCgo+ICsgIC0gfAo+ICsgICAgbGNkX3Bh
bmVsOiBwYW5lbCB7CgpTUEkgZGV2aWNlcyBoYXZlIHRvIGhhdmUgYSBtaW5pbWFsIFNQSSBjb250
cm9sbGVyIHBhcmVudC4gUHJpbWFyaWx5Cmp1c3QgI3NpemUtY2VsbHMgYW5kICNhZGRyZXNzLWNl
bGxzIGFyZSBuZWVkZWQuCgoncmVnJyBpcyBtaXNzaW5nIGhlcmUgdG9vLgoKPiArICAgICAgY29t
cGF0aWJsZSA9ICJuZWMsbmw4MDQ4aGwxMSI7Cj4gKyAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0g
PDEwMDAwMDAwPjsKClRoaXMgbmVlZHMgdG8gYmUgbGlzdGVkIGluIHByb3BlcnRpZXMgaWRlYWxs
eSB3aXRoIHNvbWUgY29uc3RyYWludHMuCgo+ICsKPiArICAgICAgcmVzZXQtZ3Bpb3MgPSA8Jmdw
aW83IDcgR1BJT19BQ1RJVkVfTE9XPjsKCkFuZCBHUElPX0FDVElWRV9MT1cuIFlvdSBoYXZlIHRv
IGFkZCBpbmNsdWRlcyB5b3UgbmVlZC4KCj4gKwo+ICsgICAgICBwb3J0IHsKPiArICAgICAgICBs
Y2RfaW46IGVuZHBvaW50IHsKPiArICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZHBpX291
dD47Cj4gKyAgICAgICAgfTsKPiArICAgICAgfTsKPiArICAgIH07Cj4gKwo+ICsuLi4KPiAtLQo+
IFJlZ2FyZHMsCj4KPiBMYXVyZW50IFBpbmNoYXJ0Cj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
