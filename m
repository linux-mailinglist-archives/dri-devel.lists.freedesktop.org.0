Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA169FDB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 02:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7188489FF7;
	Tue, 16 Jul 2019 00:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE3089FF7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 00:29:12 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id x21so19060848otq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 17:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BYdUBysZ67vKMguvZgCh6yaor9Vs/Z93uWHz9zlur8=;
 b=E9wybmeEgOkC2bEU3AlJ7YQdaKjzAtkdy7w3OCFPDfkkM3+dOrZ6lS+Byz9ZY9C0Gk
 CcClMZD6sFiO1WPZItkRG3L5qfVMQVPIvS8nfBqLqI7pACaDb5p4Vry5CUeLVRL/uPY/
 NHOtWXshkQl3qmUKHt02eV9ufRnyC0FdbmTOg8z8jL/7PEgEfVneATLlXcfeCSmHzf9N
 sRW1ilrd0y6zEHDLpWNsExiCBjuPIEOqZypGN0jDfZLGe4oIkUB5DXNr//5Yb+ND/JUw
 r5UPIp324kIFegO2sQhfd2B1yeArPjtRA8mYLe44Hu8Vi342aK6W7YDvEYTFFXRnoQ9z
 DjRA==
X-Gm-Message-State: APjAAAVVfkSmHj8N9GthFPQK0gClslmcLnUpVtaBOqJQ4BTZ3I/q6vUX
 AE+HXci+MAKMlJpFgIaZH2DBbEvOIAGkLX4O9yo=
X-Google-Smtp-Source: APXvYqyEwg0cMSPwazZQij8oSS8ufGofjpqsKvgU98cS9UwddqUTmsuhAclAe7DHgcfs5tJkXQ2qzoJLnu9bi6JTBlk=
X-Received: by 2002:a9d:4b02:: with SMTP id q2mr2561759otf.312.1563236951460; 
 Mon, 15 Jul 2019 17:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
 <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
 <20190709085532.cdqv7whuesrjs64c@flea>
 <CA+E=qVdz4vfU3rtTTKjYdM+4UA+=FWheJfWOMaDtFMnWQ1rHbw@mail.gmail.com>
 <20190710114042.ybgavnxb4hgqrtor@flea>
 <CA+E=qVdFoT137pADfxz3uMwhOqjqrA9+6hBeOfbJxuH-M-3Pjw@mail.gmail.com>
 <20190712201543.krhsfjepd3cqndla@flea>
In-Reply-To: <20190712201543.krhsfjepd3cqndla@flea>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 15 Jul 2019 17:28:53 -0700
Message-ID: <CA+E=qVeDpLqAM6Qsd6oHfeYHB_JHdSb5GtY7i994GT5_RW4_Bg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5BYdUBysZ67vKMguvZgCh6yaor9Vs/Z93uWHz9zlur8=;
 b=qrzqnSsAKZNB/gem9bh/PkqLvVoR1oPCSliwxzsHir00TcpgIFy8AqTQIBspieq+bY
 oSinjoTFA9vRBFsRFOrXQbG3M9Xw0dvRlMoiIcewyU5D+7zxapkXZioy952S9ieXo8J3
 dLEGfocIuYgtUOQ8Y89CqwaILV2mKIj47y1DGwoa84qicsAyMD2nX3HzDKqHZEZM0VoU
 CYPCCAMkyM6+67xwDgCSc9rCBA++QDEQVW34C6PFmHyd7sqerODgwUXcAE3ynqQUQXOI
 a3XMHvh26a4Lw21UNpCplFEdq1j6AKNJddJrQ0gLoN9URjYCbKhN8JyfnM1q7XosTYyS
 GsSg==
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
 devicetree <devicetree@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMToxNSBQTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDAzOjEx
OjA0UE0gLTA3MDAsIFZhc2lseSBLaG9ydXpoaWNrIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMTAs
IDIwMTkgYXQgNDo0MCBBTSBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
PiB3cm90ZToKPiA+ID4gPiA+ID4gVGhlcmUncyBhbm90aGVyIGlzc3VlOiBpZiB3ZSBpbnRyb2R1
Y2UgZWRwLWNvbm5lY3RvciB3ZSdsbCBoYXZlIHRvCj4gPiA+ID4gPiA+IHNwZWNpZnkgcG93ZXIg
dXAgZGVsYXlzIHNvbWV3aGVyZSAoaW4gZHRzPyBvciBpbiBwbGF0Zm9ybSBkcml2ZXI/KSwgc28K
PiA+ID4gPiA+ID4gZWRwLWNvbm5lY3RvciBkb2Vzbid0IHJlYWxseSBzb2x2ZSB0aGUgaXNzdWUg
b2YgbXVsdGlwbGUgcGFuZWxzIHdpdGgKPiA+ID4gPiA+ID4gc2FtZSBtb3RoZXJib2FyZC4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBBbmQgdGhhdCdzIHdoYXQgdGhhdCBjb21wYXRpYmxlIGlzIGFib3V0
IDopCj4gPiA+ID4KPiA+ID4gPiBTb3JyeSwgSSBmYWlsIHRvIHNlZSBob3cgaXQgd291bGQgYmUg
ZGlmZmVyZW50IGZyb20gdXNpbmcgZXhpc3RpbmcKPiA+ID4gPiBwYW5lbHMgaW5mcmFzdHJ1Y3R1
cmUgYW5kIGRpZmZlcmVudCBwYW5lbHMgY29tcGF0aWJsZXMuIEkgdGhpbmsgUm9iJ3MKPiA+ID4g
PiBpZGVhIHdhcyB0byBpbnRyb2R1Y2UgZ2VuZXJpYyBlZHAtY29ubmVjdG9yLgo+ID4gPgo+ID4g
PiBBZ2FpbiwgdGhlcmUncyBubyBzdWNoIHRoaW5nIGFzIGEgZ2VuZXJpYyBlZHAtY29ubmVjdG9y
LiBUaGUgc3BlYwo+ID4gPiBkb2Vzbid0IGRlZmluZSBhbnl0aGluZyByZWxhdGVkIHRvIHRoZSBw
b3dlciBzZXF1ZW5jZSBmb3IgZXhhbXBsZS4KPiA+ID4KPiA+ID4gPiBJZiB3ZSBjYW4ndCBtYWtl
IGl0IGdlbmVyaWMgdGhlbiBsZXQncyB1c2UgcGFuZWwgaW5mcmFzdHJ1Y3R1cmUuCj4gPiA+Cj4g
PiA+IFdoaWNoIHVzZXMgYSBkZXZpY2Ugc3BlY2lmaWMgY29tcGF0aWJsZS4gUmVhbGx5LCBJJ20g
bm90IHN1cmUgd2hhdAo+ID4gPiB5b3VyIG9iamVjdGlvbiBhbmQgLyBvciBhcmd1bWVudCBpcyBo
ZXJlLgo+ID4gPgo+ID4gPiBJbiBhZGRpdGlvbiwgd2hlbiB0aGF0IHdhcyBicm91Z2h0IHVwIGlu
IHRoZSBkaXNjdXNzaW9uLCB5b3UgcmVqZWN0ZWQKPiA+ID4gaXQgYmVjYXVzZSBpdCB3YXMgaW5j
b252ZW5pZW50Ogo+ID4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
MjgzMDEyLz9zZXJpZXM9NTYxNjMmcmV2PTEjY29tbWVudF81MzUyMDYKPiA+Cj4gPiBJdCBpcyBp
bmNvbnZlbmllbnQsIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgaG93IGhhdmluZyBib2FyZC1zcGVj
aWZpYwo+ID4gY29ubmVjdG9ycyBmaXhlcyBpdC4KPgo+IEhvdyBpdCB3b3VsZCBub3QgZml4IGl0
PwoKSSB0aGluayBJIGdvdCB5b3VyIGlkZWEsIGJ1dCB5ZXQgSSB0aGluayBpdCdzIG5vdCB0aGUg
YmVzdCBzb2x1dGlvbi4KCkRvIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgdGhhdCB5b3UncmUgcHJv
cG9zaW5nIHRvIGludHJvZHVjZQpib2FyZC1zcGVjaWZpYyBlZHAtY29ubmVjdG9yIGRyaXZlciB0
aGF0IHdpbGwgYmUgYXdhcmUgb2Ygd29yc3QgY2FzZQpwb3dlciB1cCBkZWxheXMgYW5kIHdpbGwg
Y29udHJvbCBiYWNrbGlnaHQgYW5kIHBvd2VyPwoKVGhlbiB3aHkgbm90IHRvIGFkZCBhbm90aGVy
IGJvYXJkLXNwZWNpZmljIHBhbmVsIChlLmcuCiJwaW5lNjQscGluZWJvb2stcGFuZWwiKSB0byBz
aW1wbGUtcGFuZWwuYyB0aGF0IGRvZXMgdGhlIHNhbWU/Cgo+IFlvdSdsbCBoYXZlIG9uZSBjb25u
ZWN0b3IsIHdpdGhvdXQgdGhlIG5lZWQgdG8gZGVzY3JpYmUgZWFjaCBhbmQgZXZlcnkKPiBwYW5l
bCBpbiB0aGUgZGV2aWNlIHRyZWUgYW5kIHJlbHkgb24gdGhlIEVESUQgaW5zdGVhZCwgYW5kIHlv
dSdsbCBoYXZlCj4gdGhlIG9wdGlvbiB0byBwb3dlciB1cCB0aGUgcmVndWxhdG9yIHlvdSBuZWVk
Lgo+Cj4gSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0J3MgdGhlIGlzc3VlIGhlcmUsIHNv
IGxldCdzIHRha2UgYSBzdGVwCj4gYmFjay4gV2hhdCBhcmUgaXMgdGhlIGlzc3VlICwgd2hhdCBh
cmUgeW91ciByZXF1aXJlbWVudHMsIGFuZCBob3cKPiB3b3VsZCB5b3UgbGlrZSB0aGF0IHRvIGJl
IGRlc2NyaWJlZCA/CgpXZSBoYXZlIGEgZGV2aWNlIChQaW5lYm9vaykgdGhhdCB1c2VzIHRoZSBz
YW1lIGJvYXJkIHdpdGggbXVsdGlwbGUgZWRwCnBhbmVscy4gU28gZmFyIHRoZXJlJ3JlIHBpbmVi
b29rcyB3aXRoIDMgZGlmZmVyZW50IHBhbmVsczogMTEiIHdpdGgKNzY4cCBwYW5lbCwgMTEiIHdp
dGggMTA4MHAgcGFuZWwsIDE0IiB3aXRoIDc2OHAgcGFuZWwuCgpDdXJyZW50bHkgdGhlcmUncyBu
byB3YXkgdG8gZGVzY3JpYmUgYWxsIHBpbmVib29rcyB3aXRoIGEgc2luZ2xlIGR0cy4KVGhlcmUn
cyBhIHNpbXBsZSB3b3JrYXJvdW5kIHRob3VnaCAtLSB3ZSBjYW4ganVzdCBzcGVjaWZ5IGEgcGFu
ZWwgd2l0aAp3b3JzdCBwb3dlciB1cCBkZWxheXMgaW4gZHRzIGFuZCBpdCdsbCB3b3JrIHNpbmNl
IGFueDYzNDUgZHJpdmVyCmlnbm9yZXMgcGFuZWwgbW9kZXMgYW55d2F5IGFuZCB1c2VzIEVESUQu
CgpPcmlnaW5hbGx5IEkgcHJvcG9zZWQgdG8gZXh0ZW5kIHNpbXBsZS1wYW5lbCBkcml2ZXIgdG8g
c3VwcG9ydCBnZW5lcmljCmVkcC1wYW5lbCBidXQgaXQgd2FzIHJlamVjdGVkLiBJIHN0aWxsIGJl
bGlldmUgdGhhdCBpdCdzIHRoZSBiZXN0CnNvbHV0aW9uIGFzc3VtaW5nIHdlIGNhbiBzcGVjaWZ5
IGRlbGF5cyBpbiBkdHMsIHNpbmNlIHBhbmVscyBsaXN0IGlzCnNwZWNpZmljIHRvIHBhcnRpY3Vs
YXIgZGV2aWNlIGFuZCBpdCBwcm9iYWJseSBjYW4ndCBiZSByZXVzZWQsIGkuZS4KdGhlcmUncyBu
byBnb29kIHJlYXNvbiB0byBtb3ZlIGl0IGludG8gQyBjb2RlLgoKUm9iIEhlcnJpbmcgcHJvcG9z
ZWQgdG8gaW50cm9kdWNlIGVkcC1jb25uZWN0b3IuIFdoaWxlIEkgc3RpbGwgYmVsaWV2ZQp0aGF0
IGl0J3Mgbm90IGFjY3VyYXRlIGRlc2NyaXB0aW9uIG9mIGhhcmR3YXJlIHNpbmNlIGl0J2xsIGhh
dmUgdG8KaGF2ZSBiYWNrbGlnaHQgbm9kZSAoYmFja2xpZ2h0IGlzIGFjdHVhbGx5IHBhbmVsIHBy
b3BlcnR5KSBJIHdhcyBPSwp3aXRoIHRoaXMgYXBwcm9hY2ggYXNzdW1pbmcgd2UgY2FuIHN0b3Jl
IGRlbGF5cyBpbiBkdHMuCgpMYXRlciBpdCBldm9sdmVkIGludG8gYm9hcmQtc3BlY2lmaWMgZWRw
LWNvbm5lY3Rvci4KClNvIGZhciBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGV2ZXJ5b25lIGlzIHRy
eWluZyB0byBhdm9pZCBpbnRyb2R1Y2luZwplZHAtcGFuZWwgZHJpdmVyIHRoYXQgY2FuIHJlYWQg
ZGVsYXlzIGZyb20gZHRzLiBCYXNpY2FsbHksIEkgZG9uJ3QKdW5kZXJzdGFuZCB3aGF0J3MgdGhl
IG1hZ2ljIGJlaGluZCBzaW1wbGUtcGFuZWwuYyBhbmQgd2h5IG5ldyBwYW5lbHMKc2hvdWxkIGJl
IGFkZGVkIHRoZXJlIHJhdGhlciB0aGFuIGRlc2NyaWJlZCBpbiBkdHMuIFsxXSBEb2Vzbid0CmV4
cGxhaW4gdGhhdC4KClsxXSBodHRwOi8vc2lldGNoLXRhZ3IuYmxvZ3Nwb3QuY29tLzIwMTYvMDQv
ZGlzcGxheS1wYW5lbHMtYXJlLW5vdC1zcGVjaWFsLmh0bWwKClJlZ2FyZHMsClZhc2lseQoKCj4g
TWF4aW1lCj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
