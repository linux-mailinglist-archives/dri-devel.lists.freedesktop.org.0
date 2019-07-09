Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F462D23
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 02:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8E89857;
	Tue,  9 Jul 2019 00:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4750289857
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 00:49:31 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id w196so14075269oie.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 17:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZfF3qmGUmaIXGQVLjO4ElcPFOkI/q/c+xioJlIBg2U=;
 b=AP+KnhjAbJGnntyb2uAY7Zy/q+5ZIlsuXeHFOJDKd41+nZHrHKwUZPNqH0VfH1fPW4
 Ev41R4TMGQGth+IgIeC5ieT+n+J+OyP6olYtPYB1NY/4s7P+uByQ9iGWmeTJxXYz/Af+
 mz7MyAYM1iFV72gkw9MouBSxd6746CeMj62nwNTmRBHz6VYfS+GYAdEKLRhnysWIQBkd
 84UiqJXoXBXtYPNuVBbo5yTaPN+o7vbotDknqKd5K4U+Gg1P4Xj5qAqADcobiY4DL3Vv
 XTPzTSpsNH9PT7AVvoE3N8mvoyyqcbGP9SzaFOz7fHnnjs9WN+BJcMT3HSW3VSwFtrDb
 qFbw==
X-Gm-Message-State: APjAAAVOcayaukhg6TXRSQDtAfwbla8WHMJRe/ueEXA+vvYPA3caVLSh
 CBRB7PYK3L2t2W0ltYsrpWZQTeIm7/FSh5EX0fE=
X-Google-Smtp-Source: APXvYqwn/NmbXG3TvpJ/5pRB/ldFPNOG9MC5TDpP7mMGAObq2oBz7QvF8Qh6xGlGhVhQcK1KBKGA38nN+dBvrIRtU7Y=
X-Received: by 2002:aca:f552:: with SMTP id t79mr10221713oih.145.1562633370288; 
 Mon, 08 Jul 2019 17:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
 <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
 <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
 <20190607062802.m5wslx3imiqooq5a@flea>
 <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
 <20190607094030.GA12373@lst.de>
 <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
 <20190612152022.c3cfhp4cauhzhfyr@flea>
 <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
 <20190701095842.fvganvycce2cy7jn@flea>
In-Reply-To: <20190701095842.fvganvycce2cy7jn@flea>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 8 Jul 2019 17:49:21 -0700
Message-ID: <CA+E=qVdsYV2Bxk245=Myq=otd7-7WHzUnSJN8_1dciAzvSOG8g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345 bridge
 on Teres-I
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mZfF3qmGUmaIXGQVLjO4ElcPFOkI/q/c+xioJlIBg2U=;
 b=A+6tMfOydkWZAq3FLs4JYZTw3Q+rRUwRJpGF79VNLOKlzkmnFjXBBoVFCPB6WH032H
 heRFES7RMAV1lT9/7vozKekg8HAZa7l54YEJ+ZJvC6W6P2DKHqFGmZ/zYZBf99ICvwaY
 6WK+H/4RwupNppMbKV5C81EiPhx08soNSJCaWtntbLw7fXD9/hCk929ra2K1C7XAoME0
 Z8aWaXfodpDgxVje7iFZrELXqv/9UCQpZt3t5HaDSVfbslLjbJ9j1yT2gI+cn0cjNAZE
 lLyUEpU6GREM2LLCUFPqQAHbDl2HpMKDqnru4XN80ye/ljTCNYMwEb/7SmrGmEPZg9Qf
 4pWg==
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

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAyOjU4IEFNIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBh
cmRAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkhCj4KPiBPbiBGcmksIEp1biAyOCwgMjAxOSBh
dCAxMjozOTozMlBNICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+ID4gT24gMTIuMDYuMjAx
OSAxNzoyMCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiA+ID4+IEkgYW0gbm90IHN1cmUgaWYgSSB1
bmRlcnN0YW5kIHdob2xlIGRpc2N1c3Npb24gaGVyZSwgYnV0IEkgYWxzbyBkbyBub3QKPiA+ID4+
IHVuZGVyc3RhbmQgd2hvbGUgZWRwLWNvbm5lY3RvciB0aGluZy4KPiA+ID4gVGhlIGNvbnRleHQg
aXMgdGhpcyBvbmU6Cj4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC8yNTczNTIvP3Nlcmllcz01MTE4MiZyZXY9MQo+ID4gPiBodHRwczovL3BhdGNod29yay5mcmVl
ZGVza3RvcC5vcmcvcGF0Y2gvMjgzMDEyLz9zZXJpZXM9NTYxNjMmcmV2PTEKPiA+ID4gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzI4NjQ2OC8/c2VyaWVzPTU2Nzc2JnJl
dj0yCj4gPiA+Cj4gPiA+IFRMO0RSOiBUaGlzIGJyaWRnZSBpcyBiZWluZyB1c2VkIG9uIEFSTSBs
YXB0b3BzIHRoYXQgY2FuIGNvbWUgd2l0aAo+ID4gPiBkaWZmZXJlbnQgZURQIHBhbmVscy4gU29t
ZSBvZiB0aGVzZSBwYW5lbHMgcmVxdWlyZSBhIHJlZ3VsYXRvciB0byBiZQo+ID4gPiBlbmFibGVk
IGZvciB0aGUgcGFuZWwgdG8gd29yaywgYW5kIHRoaXMgaXMgb2J2aW91c2x5IHNvbWV0aGluZyB0
aGF0Cj4gPiA+IHNob3VsZCBiZSBpbiB0aGUgRFQuCj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIHdlIGNh
bid0IHJlYWxseSBkZXNjcmliZSB0aGUgcGFuZWwgaXRzZWxmLCBzaW5jZSB0aGUgdmVuZG9yCj4g
PiA+IHVzZXMgc2V2ZXJhbCBvZiB0aGVtIGFuZCBqdXN0IHJlbGllcyBvbiB0aGUgZURQIGJ1cyB0
byBkbyBpdHMgam9iIGF0Cj4gPiA+IHJldHJpZXZpbmcgdGhlIEVESURzLiBBIGdlbmVyaWMgcGFu
ZWwgaXNuJ3QgcmVhbGx5IHdvcmtpbmcgZWl0aGVyCj4gPiA+IHNpbmNlIHRoYXQgd291bGQgbWVh
biBoYXZpbmcgYSBnZW5lcmljIGJlaGF2aW91ciBmb3IgYWxsIHRoZSBwYW5lbHMKPiA+ID4gY29u
bmVjdGVkIHRvIHRoYXQgYnVzLCB3aGljaCBpc24ndCB0aGVyZSBlaXRoZXIuCj4gPiA+Cj4gPiA+
IFRoZSBjb25uZWN0b3IgYWxsb3dzIHRvIGV4cG9zZSB0aGlzIG5pY2VseS4KPiA+Cj4gPiBBcyBW
RVNBIHByZXNlbnRhdGlvbiBzYXlzWzFdIGVEUCBpcyBiYXNlZCBvbiBEUCBidXQgaXMgbXVjaCBt
b3JlCj4gPiBmbGV4aWJsZSwgaXQgaXMgdXAgdG8gaW50ZWdyYXRvciAoISEhKSBob3cgdGhlIGNv
bm5lY3Rpb24sIHBvd2VyCj4gPiB1cC9kb3duLCBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSBzaG91
bGQgYmUgcGVyZm9ybWVkLiBUcnlpbmcgdG8gY292ZXIKPiA+IGV2ZXJ5IHN1Y2ggY2FzZSBpbiBl
ZHAtY29ubmVjdG9yIHNlZW1zIHRvIG1lIHNpbWlsYXIgdG8gcGFuZWwtc2ltcGxlCj4gPiBhdHRl
bXB0IGZhaWx1cmUuIE1vcmVvdmVyIHRoZXJlIGlzIG5vIHN1Y2ggdGhpbmcgYXMgcGh5c2ljYWwg
c3RhbmRhcmQKPiA+IGVEUCBjb25uZWN0b3IuIFRpbGwgbm93IEkgdGhvdWdoIERUIGNvbm5lY3Rv
ciBzaG91bGQgZGVzY3JpYmUgcGh5c2ljYWwKPiA+IGNvbm5lY3RvciBvbiB0aGUgZGV2aWNlLCBu
b3cgSSBhbSBsb3N0LCBhcmUgdGhlcmUgc29tZSBEVCBiaW5kaW5ncwo+ID4gZ3VpZGVsaW5lcyBh
Ym91dCBkZWZpbml0aW9uIG9mIGEgY29ubmVjdG9yPwo+Cj4gVGhpcyBtaWdodCBiZSBzZW1hbnRp
Y3MgYnV0IEkgZ3Vlc3Mgd2UncmUgaW4gc29tZSBraW5kIG9mIGdyZXkgYXJlYT8KPgo+IExpa2Us
IGZvciBlRFAsIGlmIGl0J3Mgc29sZGVyZWQgSSBndWVzcyB3ZSBjb3VsZCBzYXkgdGhhdCB0aGVy
ZSdzIG5vCj4gY29ubmVjdG9yLiBCdXQgd2hhdCBoYXBwZW5zIGlmIGZvciBzb21lIG90aGVyIGJv
YXJkLCB0aGF0IHNpZ25hbCBpcwo+IHJvdXRlZCB0aHJvdWdoIGEgcmliYm9uPwo+Cj4gWW91IGNv
dWxkIGFyZ3VlIHRoYXQgdGhlcmUncyBubyBwaHlzaWNhbCBjb25uZWN0b3IgaW4gYm90aCBjYXNl
cywgb3IKPiB0aGF0IHRoZXJlJ3Mgb25lIGluIGJvdGgsIG9yIG9uZSBmb3IgdGhlIHJpYmJvbiBh
bmQgbm8gY29ubmVjdG9yIGZvcgo+IHRoZSBvbmUgc29sZGVyZWQgaW4uCj4KPiA+IE1heWJlIGlu
c3RlYWQgb2YgZWRwLWNvbm5lY3RvciBvbmUgd291bGQgaW50cm9kdWNlIGludGVncmF0b3IncyBz
cGVjaWZpYwo+ID4gY29ubmVjdG9yLCBmb3IgZXhhbXBsZSB3aXRoIGNvbXBhdGlibGUgIm9saW1l
eCx0ZXJlcy1lZHAtY29ubmVjdG9yIgo+ID4gd2hpY2ggc2hvdWxkIGZvbGxvdyBlZHAgYWJzdHJh
Y3QgY29ubmVjdG9yIHJ1bGVzPyBUaGlzIHdpbGwgYmUgYXQgbGVhc3QKPiA+IGNvbnNpc3RlbnQg
d2l0aCBiZWxvdyBwcmVzZW50YXRpb25bMV0gLSBlRFAgcmVxdWlyZW1lbnRzIGRlcGVuZHMgb24K
PiA+IGludGVncmF0b3IuIFRoZW4gaWYgb2xpbWV4IGhhcyBzdGFuZGFyZCB3YXkgb2YgZGVhbGlu
ZyB3aXRoIHBhbmVscwo+ID4gcHJlc2VudCBpbiBvbGltZXgvdGVyZXMgcGxhdGZvcm1zIHRoZSBk
cml2ZXIgd291bGQgdGhlbiBjcmVhdGUKPiA+IGRybV9wYW5lbC9kcm1fY29ubmVjdG9yL2RybV9i
cmlkZ2UoPykgYWNjb3JkaW5nIHRvIHRoZXNlIHJ1bGVzLCBJIGd1ZXNzLgo+ID4gQW55d2F5IGl0
IHN0aWxsIGxvb2tzIGZpc2h5IGZvciBtZSA6KSwgbWF5YmUgYmVjYXVzZSBJIGFtIG5vdAo+ID4g
ZmFtaWxpYXJpemVkIHdpdGggZGV0YWlscyBvZiB0aGVzZSBwbGF0Zm9ybXMuCj4KPiBUaGF0IG1h
a2VzIHNlbnNlIHllcwoKQWN0dWFsbHksIGl0IG1ha2VzIG5vIHNlbnNlIGF0IGFsbC4gQ3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBmb3IgYW54NjM0NQpkcml2ZXIgd29ya3MgZmluZSBhcyBpcyB3aXRo
IGFueSBwYW5lbCBzcGVjaWZpZWQgYXNzdW1pbmcgcGFuZWwgZGVsYXlzCmFyZSBsb25nIGVub3Vn
aCBmb3IgY29ubmVjdGVkIHBhbmVsLiBJdCBqdXN0IGRvZXNuJ3QgdXNlIHBhbmVsIHRpbWluZ3MK
ZnJvbSB0aGUgZHJpdmVyLiBDcmVhdGluZyBhIHBsYXRmb3JtIGRyaXZlciBmb3IgY29ubmVjdG9y
IGl0c2VsZiBsb29rcwpyZWR1bmRhbnQgc2luY2UgaXQgY2FuJ3QgYmUgcmV1c2VkLCBpdCBkb2Vz
bid0IGRlc2NyaWJlIGFjdHVhbApoYXJkd2FyZSBhbmQgaXQncyBqdXN0IGRlZmVhdHMgcHVycG9z
ZSBvZiBEVCBieSBpbnRyb2R1Y2luZwpib2FyZC1zcGVjaWZpYyBjb2RlLgoKVGhlcmUncyBhbm90
aGVyIGlzc3VlOiBpZiB3ZSBpbnRyb2R1Y2UgZWRwLWNvbm5lY3RvciB3ZSdsbCBoYXZlIHRvCnNw
ZWNpZnkgcG93ZXIgdXAgZGVsYXlzIHNvbWV3aGVyZSAoaW4gZHRzPyBvciBpbiBwbGF0Zm9ybSBk
cml2ZXI/KSwgc28KZWRwLWNvbm5lY3RvciBkb2Vzbid0IHJlYWxseSBzb2x2ZSB0aGUgaXNzdWUg
b2YgbXVsdGlwbGUgcGFuZWxzIHdpdGgKc2FtZSBtb3RoZXJib2FyZC4KCkknZCBzYXkgRFQgb3Zl
cmxheXMgc2hvdWxkIGJlIHByZWZlcnJlZCBzb2x1dGlvbiBoZXJlLCBub3QgYW5vdGhlcgpjb25u
ZWN0b3IgYmluZGluZy4KCj4gTWF4aW1lCj4KPiAtLQo+IE1heGltZSBSaXBhcmQsIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
