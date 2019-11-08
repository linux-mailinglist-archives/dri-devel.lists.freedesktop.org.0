Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF2F4302
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 10:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5CC6F8E4;
	Fri,  8 Nov 2019 09:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA52D6F8E4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 09:20:46 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e17so4633697otk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 01:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ekrEQBU5lx2xhaN2Wx6mzNjkiPZbwUYAWTVO5T2USE=;
 b=g/+pl81byIaDTb6ybSeLxRDTrVpU0mGOCSWPf2jjcdzwYaUAhQdmUTVTs6+LdE6dm2
 1YMwGjl+F9XJogtfaryyfeYz60/stbaJ8zgh3eh1JwyA/xX6uG4z7rFFSQ2Ns0OohBAg
 lMEbHEtyonlCn7qUUQbpSbK3sfCx8/R5RMaSE3/ySJgdJC/co2kkTCqnFBt0QyKYx1Dl
 R3xbFWe/C5eh0i2B731GJUofX0tZGLRZ3FQA10O5X1dfnM6KFmc3qRpV9+gT3KAESi6w
 Am5HznaRLgj+ead8dwobdsYhNGEgJiiE3z5n7fHE5o2r2l5gymObA8Ix5tOiTHvkwdii
 /0pA==
X-Gm-Message-State: APjAAAULRmB77mbIXFfU/+6iCzEpHczJZ8bvdjKCN5Rf5No0c0o5+ORB
 YpLI2/Fv6Z9GEAWR84XNfSyOEF/l+Pf0KGxLGqc=
X-Google-Smtp-Source: APXvYqx4/IZm2/WNkldEQnZffy6SAN4QDo9D9NC9WGgb426MgWXKVPYg/IVcHxuUriAP2PNnXWeTZB2xwKtOvwh/Cw4=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr5659117ota.297.1573204845980; 
 Fri, 08 Nov 2019 01:20:45 -0800 (PST)
MIME-Version: 1.0
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572443014-17335-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <870bea7e-5e5d-c0ba-2f5d-ebd0fd493c7e@baylibre.com>
 <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Nov 2019 10:20:34 +0100
Message-ID: <CAMuHMdXr00yvtdOkZ9JW2EZwWmT_hBiomvnU_sbCE9MyBKs8uA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Simon Horman <horms@verge.net.au>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBNb24sIE5vdiA0LCAyMDE5IGF0IDExOjQyIEFNIEZhYnJpemlvIENh
c3Rybwo8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToKPiA+IEZyb206IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiA+IFNlbnQ6IDA0IE5vdmVt
YmVyIDIwMTkgMDk6MTgKPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBkcm0vYnJpZGdlOiBS
ZXB1cnBvc2UgbHZkcy1lbmNvZGVyLmMKPiA+Cj4gPiBPbiAzMC8xMC8yMDE5IDE0OjQzLCBGYWJy
aXppbyBDYXN0cm8gd3JvdGU6Cj4gPiA+IGx2ZHMtZW5jb2Rlci5jIGltcGxlbWVudGF0aW9uIGlz
IGFsc28gc3VpdGFibGUgZm9yIExWRFMgZGVjb2RlcnMsCj4gPiA+IG5vdCBqdXN0IExWRFMgZW5j
b2RlcnMuCj4gPiA+IEluc3RlYWQgb2YgY3JlYXRpbmcgYSBuZXcgZHJpdmVyIGZvciBhZGRyZXNz
aW5nIHN1cHBvcnQgZm9yCj4gPiA+IHRyYW5zcGFyZW50IExWRFMgZGVjb2RlcnMsIHJlcHVycG9z
ZSBsdmRzLWVuY29kZXIuYyBmb3IgdGhlIGdyZWF0ZXIKPiA+ID4gZ29vZC4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAg
ICAgICB8ICAgOCArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAg
ICB8ICAgMiArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWNvZGVjLmMgICB8
IDE2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5jIHwgMTU1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKyksIDE2MCBk
ZWxldGlvbnMoLSkKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2x2ZHMtY29kZWMuYwo+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvbHZkcy1lbmNvZGVyLmMKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+
ID4gPiBpbmRleCAzNDM2Mjk3Li45ZTc1Y2E0ZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZwo+ID4gPiBAQCAtNDUsMTQgKzQ1LDE0IEBAIGNvbmZpZyBEUk1fRFVNQl9WR0FfREFD
Cj4gPiA+ICAgICAgIFN1cHBvcnQgZm9yIG5vbi1wcm9ncmFtbWFibGUgUkdCIHRvIFZHQSBEQUMg
YnJpZGdlcywgc3VjaCBhcyBBREkKPiA+ID4gICAgICAgQURWNzEyMywgVEkgVEhTODEzNCBhbmQg
VEhTODEzNSBvciBwYXNzaXZlIHJlc2lzdG9yIGxhZGRlciBEQUNzLgo+ID4gPgo+ID4gPiAtY29u
ZmlnIERSTV9MVkRTX0VOQ09ERVIKPiA+ID4gLSAgIHRyaXN0YXRlICJUcmFuc3BhcmVudCBwYXJh
bGxlbCB0byBMVkRTIGVuY29kZXIgc3VwcG9ydCIKPiA+ID4gK2NvbmZpZyBEUk1fTFZEU19DT0RF
Qwo+ID4KPiA+Cj4gPiBJJ20gbm90IENDZWQgb24gb3RoZXIgcGF0Y2hlcywgYnV0IEknbSBwcmV0
dHkgc3VyZSB5b3Ugc2hvdWxkIGZpeCBvdGhlcgo+ID4gS2NvbmZpZyBhbmQgZGVmY29uZmlncyBz
ZWxlY3RpbmcgdGhpcyBjb25maWcgaW4gdGhpcyBwYXRjaCB0byBhdm9pZCBicmVha2luZyBiaXNl
Y3QuCj4KPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgbm8gZGVmY29uZmlnIGFuZCBubyBvdGhl
ciBvcHRpb24gcmVmZXIgZGlyZWN0bHkgdG8gRFJNX0xWRFNfRU5DT0RFUiwgZG8geW91IG1pbmQg
YmVpbmcgYSBsaXR0bGUgYml0IG1vcmUgc3BlY2lmaWMgaGVyZT8KClNpZGVub3RlOiBpdCBsb29r
cyBsaWtlIENPTkZJR19EUk1fTFZEU19FTkNPREVSIHNob3VsZCBoYXZlIGJlZW4gZW5hYmxlZApp
biBzaG1vYmlsZV9kZWZjb25maWcgc2luY2UgY29tbWl0cyAzODFkZGZlNDc4ODcxNTg4ICgiZHJt
OiByY2FyLWR1OgpIYXJkY29kZSBlbmNvZGVycyB0eXBlcyB0byBEUk1fTU9ERV9FTkNPREVSX05P
TkUiKSBhbmQgNzE2MGQ1N2I2ZjgxMTg1YwooImRybTogYnJpZGdlOiBsdmRzLWVuY29kZXI6IEFk
ZCB0aGluZSx0aGM2M2x2ZG04M2QgY29tcGF0aWJsZSBzdHJpbmciKSwKdG8gc3VwcG9ydCB0aGlu
ZSx0aGM2M2x2ZG04M2QgaW4gYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc3OS1tYXJ6ZW4uZHRzPwoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
