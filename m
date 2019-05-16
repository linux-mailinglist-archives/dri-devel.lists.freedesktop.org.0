Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5220C8F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D5F89780;
	Thu, 16 May 2019 16:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF14889780
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:07:08 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t187so2906942oie.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 09:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=If7DIMq1Gfx6XG6/ApM/VqLufFm2C3KncjrdjTPi5fw=;
 b=YaK0hR+9U3AaOtCNDt6OOC+otjiGd2x5lW2CQqMdKteAAzlZTvpBGqRnQJvcA43UON
 sanKI2Wj789xKqjpBG5aFpsTcT/m47AWt9Ul27tpQJv/+8upEKe5FL/8rH+7OK6nfdP5
 mHIF/FLO5bnAhIArQVgP6ByCbfUs3K0J9xpUBAsc4es4MeCM/dHrYxzAwSFlbSx+BF4Z
 fS204H1C2iztJIbsqOsvd9EjGkuhptiNDlNUkzPtepYq4pCaUFHsachX4I/aOAW8GEzL
 cL3lQuOSBzUqda/CHPngRM/Otm+iIuYDFp+8M9xq/aoWvmUR5QVBtAsW/o1LwNCm56w8
 Z1oQ==
X-Gm-Message-State: APjAAAUw+Gmpu9qUtfZ2PDNEim6hNvc+P5s6MIFsUO0VWll7vMO4ANs4
 Yec9dChrRtjxQp1Qt+4tgTdFSrXv15aa2vsNagE=
X-Google-Smtp-Source: APXvYqxeWnmWZhffcM9dTuiS/N02EO1l6OnHcvpZADX+xNRI7YfuXCN7riZ/UAUEu9b/pdmZpShaSStxlQVSsRJkIpk=
X-Received: by 2002:aca:38d4:: with SMTP id f203mr1339419oia.88.1558022828175; 
 Thu, 16 May 2019 09:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
In-Reply-To: <20190516154820.GA10431@lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 16 May 2019 09:06:41 -0700
Message-ID: <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=If7DIMq1Gfx6XG6/ApM/VqLufFm2C3KncjrdjTPi5fw=;
 b=W9HrIa/zrt9i9wWQLsWOgqvOcJ/ZEinVeMjhGTg/M6LgXGdcbPB38gp7CKW1Akzuix
 FZeEC2qxcJaDiDUQWE144oDzyC6CIY14bFcVik75qRdaFo6gpHvLaXMHScwpez/TBXDE
 LEJud/rc55JbTq4FLPH0uKppHUcREMpYUO0cWhrffQid3TzgZG0dj9tA79ffwhu7DX1L
 ARsIgzfa6OlYV0/AUIwNy4TqKQ6NF/L3JtlzigKT31jbr3qBLHxPDUBJIR439EiMSiLt
 zv6T7X7Lj9kuFbhIBO14quCYdRswsASy27tioqzSIKYGeVZBprXPfyb9dHAXh381oL9i
 Ed7A==
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgODo0OCBBTSBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRl
PiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDE1LCAyMDE5IGF0IDA4OjA4OjU3QU0gLTA3MDAsIFZh
c2lseSBLaG9ydXpoaWNrIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6MzIg
QU0gVG9yc3RlbiBEdXdlIDxkdXdlQGxzdC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEl0IGRvZXMg
Y29tcGx5IHdpdGggdGhlIGJpbmRpbmdzLiBUaGUgcG9ydHMgYXJlIGFsbCBvcHRpb25hbC4KPiA+
ID4gQXMgZmFyIGFzIERUIGlzIGNvbmNlcm5lZCwgdGhlIHNpZ25hbCBwYXRoIGVuZHMgaGVyZS4g
VGhpcyBpcyBhbHNvIHRoZQo+ID4gPiBmaW5hbCBjb21wb25lbnQgX3JlcXVpcmVkXyB0byBnZXQg
dGhlIExpbnV4IGtlcm5lbCBEUkkgdXAgYW5kIHJ1bm5pbmcuCj4gPgo+ID4gVWdoLCB0aGVuIGJp
bmRpbmdzIHNob3VsZCBiZSBmaXhlZC4gSXQncyBub3Qgb3B0aW9uYWwuIEl0IG1heSB3b3JrIGlm
Cj4gPiBib290bG9hZGVyIGVuYWJsZXMgcG93ZXIgZm9yIHlvdSwgYnV0IGl0IHdvbid0IGlmIHlv
dSBkaXNhYmxlIGRpc3BsYXkKPiA+IGRyaXZlciBpbiB1LWJvb3QuCj4KPiBJIGRvdWJsZS1jaGVj
a2VkLiBPbiB0aGUgVGVyZXMtSSwgbWVudGlvbmluZyB0aGUgcGFuZWwgX2lzXyBvcHRpb25hbC4K
Ckl0J3Mgbm90LiBTZWUgcG93ZXIgb24gc2VxdWVuY2UgaW4KaHR0cHM6Ly93d3cub2xpbWV4LmNv
bS9Qcm9kdWN0cy9ESVktTGFwdG9wL1NQQVJFLVBBUlRTL1RFUkVTLTAxNS1MQ0QxMS02L3Jlc291
cmNlcy9OMTE2QkdFLUVBMi5wZGYKCkRyaXZlciBjYW4gdGFsayB0byB0aGUgcGFuZWwgb3ZlciBB
VVggY2hhbm5lbCBvbmx5IGFmdGVyIHQxK3QzLCB0MSBpcwp1cCB0byAxMG1zLCB0MyBpcyB1cCB0
byAyMDBtcy4gSXQgd29ya3Mgd2l0aCBvbGRlciB2ZXJzaW9uIG9mIGRyaXZlcgp0aGF0IGtlZXBz
IHBhbmVsIGFsd2F5cyBvbiBiZWNhdXNlIGl0IHRha2VzIGEgd2hpbGUgYmV0d2VlbiBkcml2ZXIK
cHJvYmUgYW5kIHBpcGVsaW5lIHN0YXJ0LgoKSXQnbGwgbGlrZWx5IGJyZWFrIHdpdGggbmV3ZXIg
dmVyc2lvbiBvZiBkcml2ZXIgdGhhdCB0dXJucyBvbiBwYW5lbApvbmx5IHdoZW4gYnJpZGdlIGlz
IGFjdGl2ZS4gWW91J2xsIHNlZSBBVVggdGltZW91dHMgLSBpdCB3b24ndCBiZSBhYmxlCnRvIHBy
b2JlIEVESUQgaW4gc29tZSBjYXNlcy4gUHJvYmxlbSBjYW4gYmUgaW50ZXJtaXR0ZW50IGFuZCBk
ZXZpY2UKZGVwZW5kZW50LgoKQWxsIGluIGFsbCAtIHlvdSBkb24ndCBuZWVkIHBhbmVsIHRpbWlu
Z3Mgc2luY2UgdGhlcmUncyBFRElEIGJ1dCB5b3UKc3RpbGwgbmVlZCBwYW5lbCBkZWxheXMuIEFu
eXdheSwgaXQncyB1cCB0byB5b3UgYW5kIG1haW50YWluZXJzLgoKPiBQRDIzIHBvd2VycyBkb3du
IHBhbmVsIGFuZCBiYWNrbGlnaHQgYXMgbXVjaCBhcyBwb3NzaWJsZSwgc2VlCj4gMjRiZDVkMmNi
OTNiYyBhcm02NDogZHRzOiBhbGx3aW5uZXI6IGE2NDogdGVyZXMtaTogZW5hYmxlIGJhY2tsaWdo
dAo+IChjdXJyZW50bHkgb25seSBpbiBNYXhpbWUncyByZXBvKSBhbmQgdGhlIFRlcmVzLUkgc2No
ZW1hdGljcy4uLgo+Cj4gQW5kIHRoZSBkcml2ZXIgaW4geW91ciByZXBvIG5lYXRseSBndWFyZHMg
YWxsIGFjY2Vzc2VzIHdpdGgKPiAiaWYgKGFueDYzNDUtPnBhbmVsKSIgLS0gZ29vZCEKPiBCdXQg
SSBmb3VuZCB0aGUgVmRkcyBhcmUgcmVxdWlyZWQsIHNvIEkgYWRkZWQgdGhlbSBhcyBzdWNoLgo+
Cj4gPiBJIGd1ZXNzIHlvdSdyZSB0ZXN0aW5nIGl0IHdpdGggb2xkZXIgdmVyc2lvbiBvZiBhbng2
MzQ1LiBOZXdlciB2ZXJzaW9uCj4gPiB0aGF0IHN1cHBvcnRzIHBvd2VyIG1hbmFnZW1lbnQgWzFd
IG5lZWRzIHN0YXJ0dXAgZGVsYXkgZm9yIHBhbmVsLgo+ID4gQW5vdGhlciBpc3N1ZSB0aGF0IHlv
dSdyZSBzZWVpbmcgaXMgdGhhdCBiYWNrbGlnaHQgaXMgbm90IGRpc2FibGVkIG9uCj4gPiBEUE1T
IGV2ZW50cy4gQWxsIGluIGFsbCwgeW91IG5lZWQgdG8gZGVzY3JpYmUgcGFuZWwgaW4gZHRzLgo+
ID4KPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYW5hcnNvdWwvbGludXgtMi42L2NvbW1pdC8y
ZmJmOWMyNDI0MTljOGJkYTY5OGU4MzMxYTAyZDQzMTIxNDNhZTJjCj4KPiA+ID4gU2hvdWxkIEkg
YWxzbyBoYXZlIGFkZGVkIGEgVGVzdGVkLWJ5OiA/IDstKQo+ID4KPiA+IEkgZG9uJ3QgaGF2ZSBU
ZXJlcywgc28gSSBoYXZlbid0IHRlc3RlZCB0aGVzZS4KPgo+ICpJKiBoYXZlIG9uZSwgYW5kIHRo
aXMgd29ya3MuIEknbGwgcmV0ZXN0IHdpdGggeW91ciBuZXdlciBkcml2ZXIsCj4ganVzdCBpbiBj
YXNlLiBOb25ldGhlbGVzcywgdGhlIGNoYW5nZXMgaW4gdGhpcyBzZXJpZXMgc2hvdWxkIGJlIGZp
bmUuCj4gU2VuZGluZyBvdXQgdjIgaW4gYSBtb21lbnQuLi4KPgo+ICAgICAgICAgVG9yc3Rlbgo+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
