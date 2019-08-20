Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C04967B5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 19:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2BD6E44A;
	Tue, 20 Aug 2019 17:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1E06E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 17:41:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 925D533D;
 Tue, 20 Aug 2019 19:41:16 +0200 (CEST)
Date: Tue, 20 Aug 2019 20:41:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190820174110.GH10820@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-2-jacopo+renesas@jmondi.org>
 <CAMuHMdWVzm8yoZSoKZh3MJsaX4jCRXQCbn2x2LAu4UWtb1yYjw@mail.gmail.com>
 <CAMuHMdWFHDGPSZt2_H_sC9rCKDYBR0XDLn0TGxzPRxZsrOTEHw@mail.gmail.com>
 <20190820074826.5rdzeqyk6ylpjr7o@uno.localdomain>
 <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNJLLRqZCZ5KHkdUKgtwmE-F-s5Vi6P10xHR38n_=HrA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566322876;
 bh=8TSAbOc99oaocNanYpIuNSjuJymG5rkFZtxYVVqu2wU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTJV/F9uYWNZIyTdvp2beSi864kYUk09+Kil83mxRJqLnCUfKp6GLjFjFhe+0qzGK
 j1kpG8z5++Fhw2CUBIXfW/mSDmYrqPfUYpadGJVMau+4lBA6pj6N/V1xvjNsiENKFi
 XuoF6BLOH+sSnElD/PbT4xEU5K10CwPnYsKDQHMQ=
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
Cc: muroya@ksk.co.jp, Jacopo Mondi <jacopo@jmondi.org>,
 VenkataRajesh.Kalakodima@in.bosch.com, David Airlie <airlied@linux.ie>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAwOTo1Mzo0NEFNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgOTo0NyBBTSBK
YWNvcG8gTW9uZGkgPGphY29wb0BqbW9uZGkub3JnPiB3cm90ZToKPiA+IE9uIE1vbiwgQXVnIDE5
LCAyMDE5IGF0IDAzOjQ1OjU0UE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+
PiBPbiBNb24sIEp1bCA4LCAyMDE5IGF0IDk6NTggQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPj4+IE9uIFNhdCwgSnVsIDYsIDIwMTkgYXQgNDow
NyBQTSBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+IHdyb3RlOgo+ID4+
Pj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIHRoZSBSZW5lc2Fz
IFItQ2FyIERpc3BsYXkKPiA+Pj4+IFVuaXQgQ29sb3IgTWFuYWdlbWVudCBNb2R1bGUuCj4gPj4+
Pgo+ID4+Pj4gQ01NIGlzIHRoZSBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgYXZhaWxhYmxlIG9u
IGVhY2ggUi1DYXIgRFUgdmlkZW8KPiA+Pj4+IGNoYW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2Vu
MyBTb0NzIChWM0ggYW5kIFYzTSBleGNsdWRlZCkuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1i
eTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4+Pj4gUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KPiA+Pj4KPiA+Pj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+ID4+Pgo+ID4+Pj4gLS0tIC9k
ZXYvbnVsbAo+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvcmVuZXNhcyxjbW0udHh0Cj4gPj4+PiBAQCAtMCwwICsxLDI1IEBACj4gPj4+PiArKiBS
ZW5lc2FzIFItQ2FyIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pCj4gPj4+PiArCj4gPj4+
PiArUmVuZXNhcyBSLUNhciBpbWFnZSBlbmhhbmNlbWVudCBtb2R1bGUgY29ubmVjdGVkIHRvIFIt
Q2FyIERVIHZpZGVvIGNoYW5uZWxzLgo+ID4+Pj4gKwo+ID4+Pj4gK1JlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gPj4+PiArIC0gY29tcGF0aWJsZTogc2hhbGwgYmUgb25lIG9mOgo+ID4+Pj4gKyAgIC0g
InJlbmVzYXMscmNhci1nZW4zLWNtbSIKPiA+Pj4+ICsgICAtICJyZW5lc2FzLHJjYXItZ2VuMi1j
bW0iCj4gPj4+Cj4gPj4+IFdoeSBkbyB5b3UgdGhpbmsgeW91IGRvIG5vdCBuZWVkIFNvQy1zcGVj
aWZpYyBjb21wYXRpYmxlIHZhbHVlcz8KPiA+Pj4gV2hhdCBpZiB5b3UgZGlzY292ZXIgYSBkaWZm
ZXJlbnQgYWNyb3NzIHRoZSBSLUNhciBHZW4zIGxpbmUgdG9tb3Jyb3c/Cj4gPj4+IERvZXMgdGhl
IElQIGJsb2NrIGhhdmUgYSB2ZXJzaW9uIHJlZ2lzdGVyPwo+ID4+Cj4gPj4gRG8geW91IGhhdmUg
YW4gYW5zd2VyIHRvIHRoZXNlIHF1ZXN0aW9ucz8KPiA+Cj4gPiBJdCBkb2VzIG5vdCBzZWVtIHRv
IG1lIHRoYXQgQ01NIGhhcyBhbnkgdmVyc2lvbiByZWdpc3Rlciwgbm9yIHRoZXJlCj4gPiBhcmUg
ZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgZGlmZmVyZW50IEdlbjMgU29Dcy4uCj4gPgo+ID4gSG93
ZXZlciwgZXZlbiBpZiB3ZSBub3cgZGVmaW5lIGEgc2luZ2xlIGNvbXBhdGlibGUgcHJvcGVydHkg
Zm9yCj4gPiBnZW4zL2dlbjIgYW5kIHdlIGxhdGVyIGZpbmQgb3V0IG9uZSBvZiB0aGUgU29DIG5l
ZWRzIGEgc29jLXNwZWNpZmljCj4gPiBwcm9wZXJ0eSB3ZSBjYW4gc2FmZWx5IGFkZCBpdCBhbmQg
a2VlcCB0aGUgZ2VuZXJpYyBnZW4zL2dlbjIgb25lIGFzCj4gPiBmYWxsYmFjay4uIERvZXMgaXQg
d29yayBmb3IgeW91Pwo+IAo+IFVuZm9ydHVuYXRlbHkgdGhhdCB3b24ndCB3b3JrLCBhcyB0aGUg
ZXhpc3RpbmcgRFRCcyB3b24ndCBoYXZlIHRoZQo+IHNvYy1zcGVjaWZpYyBjb21wYXRpYmxlIHZh
bHVlLgo+IFlvdSBjb3VsZCBzdGlsbCByZXNvcnQgdG8gc29jX2RldmljZV9tYXRjaCgpLCBidXQg
aXQgaXMgYmV0dGVyIHRvIGF2b2lkIHRoYXQuCgpXZSd2ZSBoYWQgdGhlIHNhbWUgZGlzY3Vzc2lv
biBvdmVyIGFuZCBvdmVyIGZvciBxdWl0ZSBhIGxvbmcgdGltZSA6LSkgSQp3b25kZXIsIG5vdyB0
aGF0IHdlIGhhdmUgaW1wbGVtZW50ZWQgU29DLXNwZWNpZmljIGNvbXBhdGlibGUgdmFsdWVzIGZv
cgptYW55IElQIGNvcmVzLCBob3cgbWFueSBvZiB0aGVtIGhhdmUgYWN0dWFsbHkgYmVuZWZpdGVk
IGZyb20gaXQgPyBJJ20Kbm90IGNvbnNpZGVyaW5nIElQIGNvcmVzIHdoZXJlIHdlIGtuZXcgZnJv
bSB0aGUgc3RhcnQgdGhhdCBlYWNoIFNvQyB3YXMKZGlmZmVyZW50IChzdWNoIGFzIHBpbmN0cmwg
b3IgY2xvY2tzIGZvciBpbnN0YW5jZSksIGJ1dCBJUCBjb3JlcyB3aGVyZQp3ZSB0aG91Z2ggYWxs
IFNvQ3Mgd291bGQgYmUgaGFuZGxlZCBpbiB0aGUgc2FtZSB3YXkuIEkgYWxzbyB3b3VsZG4ndApj
b3VudCBFUy1zcGVjaWZpYyBkaWZmZXJlbmNlcywgYXMgdGhvc2UgYXJlIGhhbmRsZWQgYnkKc29j
X2RldmljZV9tYXRjaCgpIGFueXdheS4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
