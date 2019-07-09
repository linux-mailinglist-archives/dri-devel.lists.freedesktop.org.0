Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA70263CBC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 22:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6FB6E0A8;
	Tue,  9 Jul 2019 20:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070A6E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 20:30:45 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w196so16368750oie.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 13:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzzhMIXkgjfY/3I8xNBuuzFKRaBW4WRzScdd/5mOmm8=;
 b=PWela2GxcHdv6foAYoi3+xNX7jVJjlomXy0oTih5Zz3vXfsd9rDQQbQG4KdLo7gYJl
 M9FHt+IxHtKdCdtcATqUG3GNkCH5aIw5mAIlLBUTE41YxHsmc/DPimr0vsOianIbxEqQ
 emuhbTRe4VuCsksli6Sq1gL6uX42C5aJX5SzHs9YqTbH0vLG0jAWGVqXGSPjxbdVMc4r
 akJv1eD9IFkn3d8CHb9Uqn98PPUg/Ihh4IQEnsgINi2omsFEVqaoEoZFI5qht39HfyQE
 X/WUjg5RwWS8Fhz3ZXFd9JryIgoXGzV2g5oYdcmeWoyjB30YqUbMSIPQWiHk9NSXPPbe
 uP8A==
X-Gm-Message-State: APjAAAV7qIIrcAe4QxN3zREbw1gDNapd3xeJUCAHlJgNHIdEOvNdkULx
 DIoUKIdg3UhffZaKLvgROyURdg8r7QnWTRtGOIM=
X-Google-Smtp-Source: APXvYqxcnttgFG+ExJVZtKNgY/nJZ0LcoVm1wiyk2wRS4arEWWVemvY2rYVYYkQOuT1IpF4ima0OhtnS4WB0PchMdxE=
X-Received: by 2002:aca:b208:: with SMTP id b8mr1217173oif.98.1562704244691;
 Tue, 09 Jul 2019 13:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
 <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
 <20190709085532.cdqv7whuesrjs64c@flea>
In-Reply-To: <20190709085532.cdqv7whuesrjs64c@flea>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 9 Jul 2019 13:30:18 -0700
Message-ID: <CA+E=qVdz4vfU3rtTTKjYdM+4UA+=FWheJfWOMaDtFMnWQ1rHbw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=PzzhMIXkgjfY/3I8xNBuuzFKRaBW4WRzScdd/5mOmm8=;
 b=TK7AxUoPJ8Dp1bYwsCGbWOtglqsnbxpl+OsqficcEvLFcPrjduzrCyRFvtBGl1xr73
 qURoStNeMzxVIVm64zwh5TFdq9AsSUWUj4nLs77NBb97lBuPc+5RvLDo5bHdmHZEQdLM
 4BnivVI511PHSv6rb+gjX8zyi7OdBkFdHfR6lbALcvKx78W4lbNaoN59XlHuicbt7fbC
 slWnOxT4/3CPXM+Y8ob087puyLO3iPxUyWSzk8xl01WIq+U7kVDtqZ2LkxKZbcTznKwM
 d2mtxvLQtrnqSJ5YGcaVN7ZkU1jUK+MfLwg0qAkIym8QIVHlF9B+Nq/SflEE8mkVq7Cn
 uDbg==
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

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAxOjU1IEFNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDU6NDk6
MjFQTSAtMDcwMCwgVmFzaWx5IEtob3J1emhpY2sgd3JvdGU6Cj4gPiA+ID4gTWF5YmUgaW5zdGVh
ZCBvZiBlZHAtY29ubmVjdG9yIG9uZSB3b3VsZCBpbnRyb2R1Y2UgaW50ZWdyYXRvcidzIHNwZWNp
ZmljCj4gPiA+ID4gY29ubmVjdG9yLCBmb3IgZXhhbXBsZSB3aXRoIGNvbXBhdGlibGUgIm9saW1l
eCx0ZXJlcy1lZHAtY29ubmVjdG9yIgo+ID4gPiA+IHdoaWNoIHNob3VsZCBmb2xsb3cgZWRwIGFi
c3RyYWN0IGNvbm5lY3RvciBydWxlcz8gVGhpcyB3aWxsIGJlIGF0IGxlYXN0Cj4gPiA+ID4gY29u
c2lzdGVudCB3aXRoIGJlbG93IHByZXNlbnRhdGlvblsxXSAtIGVEUCByZXF1aXJlbWVudHMgZGVw
ZW5kcyBvbgo+ID4gPiA+IGludGVncmF0b3IuIFRoZW4gaWYgb2xpbWV4IGhhcyBzdGFuZGFyZCB3
YXkgb2YgZGVhbGluZyB3aXRoIHBhbmVscwo+ID4gPiA+IHByZXNlbnQgaW4gb2xpbWV4L3RlcmVz
IHBsYXRmb3JtcyB0aGUgZHJpdmVyIHdvdWxkIHRoZW4gY3JlYXRlCj4gPiA+ID4gZHJtX3BhbmVs
L2RybV9jb25uZWN0b3IvZHJtX2JyaWRnZSg/KSBhY2NvcmRpbmcgdG8gdGhlc2UgcnVsZXMsIEkg
Z3Vlc3MuCj4gPiA+ID4gQW55d2F5IGl0IHN0aWxsIGxvb2tzIGZpc2h5IGZvciBtZSA6KSwgbWF5
YmUgYmVjYXVzZSBJIGFtIG5vdAo+ID4gPiA+IGZhbWlsaWFyaXplZCB3aXRoIGRldGFpbHMgb2Yg
dGhlc2UgcGxhdGZvcm1zLgo+ID4gPgo+ID4gPiBUaGF0IG1ha2VzIHNlbnNlIHllcwo+ID4KPiA+
IEFjdHVhbGx5LCBpdCBtYWtlcyBubyBzZW5zZSBhdCBhbGwuIEN1cnJlbnQgaW1wbGVtZW50YXRp
b24gZm9yIGFueDYzNDUKPiA+IGRyaXZlciB3b3JrcyBmaW5lIGFzIGlzIHdpdGggYW55IHBhbmVs
IHNwZWNpZmllZCBhc3N1bWluZyBwYW5lbCBkZWxheXMKPiA+IGFyZSBsb25nIGVub3VnaCBmb3Ig
Y29ubmVjdGVkIHBhbmVsLiBJdCBqdXN0IGRvZXNuJ3QgdXNlIHBhbmVsIHRpbWluZ3MKPiA+IGZy
b20gdGhlIGRyaXZlci4gQ3JlYXRpbmcgYSBwbGF0Zm9ybSBkcml2ZXIgZm9yIGNvbm5lY3RvciBp
dHNlbGYgbG9va3MKPiA+IHJlZHVuZGFudCBzaW5jZSBpdCBjYW4ndCBiZSByZXVzZWQsIGl0IGRv
ZXNuJ3QgZGVzY3JpYmUgYWN0dWFsCj4gPiBoYXJkd2FyZSBhbmQgaXQncyBqdXN0IGRlZmVhdHMg
cHVycG9zZSBvZiBEVCBieSBpbnRyb2R1Y2luZwo+ID4gYm9hcmQtc3BlY2lmaWMgY29kZS4KPgo+
IEknbSBub3Qgc3VyZSB3aGVyZSB5b3UgZ290IHRoZSBpZGVhIHRoYXQgdGhlIHB1cnBvc2Ugb2Yg
RFQgaXMgdG8gbm90Cj4gaGF2ZSBhbnkgYm9hcmQtc3BlY2lmaWMgY29kZS4KCkkgYmVsaWV2ZSBE
VCB3YXMgYW4gYXR0ZW1wdCB0byBtb3ZlIHRvIGRlY2xhcmF0aXZlIGFwcHJvYWNoIGZvcgpkZXNj
cmliaW5nIGhhcmR3YXJlLiBZZXMsIHdlIGhhdmUgZGlmZmVyZW50IGNvbXBhdGlibGVzIGZvciBk
aWZmZXJlbnQKZGV2aWNlcyBidXQgdGhleSdyZSBzcGVjaWZpYyB0byBwYXJ0aWN1bGFyIGRldmlj
ZSByYXRoZXIgdGhhbgpwYXJ0aWN1bGFyIGJvYXJkLiBEZXZpY2UgaW50ZXJjb25uZWN0aW9uIGlz
IGRlc2NyaWJlZCBpbiBEVCBhbG9uZyB3aXRoCnNvbWUgcHJvcGVydGllcyByYXRoZXIgdGhhbiBp
biBib2FyZC1zcGVjaWZpYyBDLWZpbGUuIEludHJvZHVjaW5nCmJvYXJkLXNwZWNpZmljIGNvbXBh
dGlibGUgZm9yIGEgY29ubmVjdG9yIGlzbid0IGxvb2tpbmcgcmlnaHQgdG8gbWUuCgo+IEl0J3Mg
cGVyZmVjdGx5IGZpbmUgdG8gaGF2ZSBzb21lLCB0aGF0J3MgZXZlbiB3aHkgdGhlcmUncyBhIGNv
bXBhdGlibGUKPiBhc3NpZ25lZCB0byBlYWNoIGFuZCBldmVyeSBib2FyZC4KPgo+IFdoYXQgdGhl
IERUIGlzIGFib3V0IGlzIGFsbG93aW5nIHVzIHRvIGhhdmUgYSBnZW5lcmljIGJlaGF2aW91ciB0
aGF0Cj4gd2UgY2FuIGRldGVjdDogd2UgY2FuIGhhdmUgYSBnaXZlbiBiZWhhdmlvdXIgZm9yIGEg
Z2l2ZW4gYm9hcmQsIGFuZCBhCj4gc2VwYXJhdGUgb25lIGZvciBhbm90aGVyIG9uZSwgYW5kIHRo
aXMgd2lsbCBiZSBldmFsdWF0ZWQgYXQgcnVudGltZS4KPgo+IFRoaXMgaXMgKmV4YWN0bHkqIHdo
YXQgdGhpcyBpcyBhYm91dDogd2UgY2FuIGhhdmUgYSBjb21wYXRpYmxlIHRoYXQKPiBzZXRzIGEg
Z2l2ZW4sIG1vcmUgc3BlY2lmaWMsIGJlaGF2aW91ciAob2xpbWV4LHRlcmVzLWVkcC1jb25uZWN0
b3IpCj4gd2hpbGUgc2F5aW5nIHRoYXQgdGhpcyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIGdlbmVy
aWMgYmVoYXZpb3VyCj4gKGVkcC1jb25uZWN0b3IpLiBUaGF0IHdheSwgYW55IE9TIHdpbGwga25v
dyB3aGF0IHF1aXJrIHRvIGFwcGx5IGlmCj4gbmVlZGVkLCBhbmQgaWYgbm90IHRoYXQgaXQgY2Fu
IHVzZSB0aGUgZ2VuZXJpYyBiZWhhdmlvdXIuCj4KPiBBbmQgd2UgY291bGQgY3JlYXRlIGEgZ2Vu
ZXJpYyBkcml2ZXIsIGZvciB0aGUgZ2VuZXJpYyBiZWhhdmlvdXIgaWYKPiBuZWVkZWQuCj4KPiA+
IFRoZXJlJ3MgYW5vdGhlciBpc3N1ZTogaWYgd2UgaW50cm9kdWNlIGVkcC1jb25uZWN0b3Igd2Un
bGwgaGF2ZSB0bwo+ID4gc3BlY2lmeSBwb3dlciB1cCBkZWxheXMgc29tZXdoZXJlIChpbiBkdHM/
IG9yIGluIHBsYXRmb3JtIGRyaXZlcj8pLCBzbwo+ID4gZWRwLWNvbm5lY3RvciBkb2Vzbid0IHJl
YWxseSBzb2x2ZSB0aGUgaXNzdWUgb2YgbXVsdGlwbGUgcGFuZWxzIHdpdGgKPiA+IHNhbWUgbW90
aGVyYm9hcmQuCj4KPiBBbmQgdGhhdCdzIHdoYXQgdGhhdCBjb21wYXRpYmxlIGlzIGFib3V0IDop
CgpTb3JyeSwgSSBmYWlsIHRvIHNlZSBob3cgaXQgd291bGQgYmUgZGlmZmVyZW50IGZyb20gdXNp
bmcgZXhpc3RpbmcKcGFuZWxzIGluZnJhc3RydWN0dXJlIGFuZCBkaWZmZXJlbnQgcGFuZWxzIGNv
bXBhdGlibGVzLiBJIHRoaW5rIFJvYidzCmlkZWEgd2FzIHRvIGludHJvZHVjZSBnZW5lcmljIGVk
cC1jb25uZWN0b3IuIElmIHdlIGNhbid0IG1ha2UgaXQKZ2VuZXJpYyB0aGVuIGxldCdzIHVzZSBw
YW5lbCBpbmZyYXN0cnVjdHVyZS4KCj4gPiBJJ2Qgc2F5IERUIG92ZXJsYXlzIHNob3VsZCBiZSBw
cmVmZXJyZWQgc29sdXRpb24gaGVyZSwgbm90IGFub3RoZXIKPiA+IGNvbm5lY3RvciBiaW5kaW5n
Lgo+Cj4gT3ZlcmxheXMgYXJlIGEgd2F5IHRvIGFwcGx5IGEgZGV2aWNlIHRyZWUgZHluYW1pY2Fs
bHkuIEl0J3Mgb3J0aG9nb25hbAo+IHRvIHRoZSBiaW5kaW5nLgoKSXQgaXNuJ3Qgb3J0aG9nb25h
bCB0byBvcmlnaW5hbCBwcm9ibGVtIHRob3VnaC4KCj4gTWF4aW1lCj4KPiAtLQo+IE1heGltZSBS
aXBhcmQsIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
