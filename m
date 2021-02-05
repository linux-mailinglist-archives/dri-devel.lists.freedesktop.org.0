Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD7311041
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 19:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9B6F4A2;
	Fri,  5 Feb 2021 18:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs4.siol.net [185.57.226.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5576F4A2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 18:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 9463F52406E;
 Fri,  5 Feb 2021 19:47:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id uFpchGQ_I5wi; Fri,  5 Feb 2021 19:47:18 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 390065241AB;
 Fri,  5 Feb 2021 19:47:18 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 9385D52406E;
 Fri,  5 Feb 2021 19:47:17 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: Re: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1
 channel
Date: Fri, 05 Feb 2021 19:47:17 +0100
Message-ID: <3972834.uPFdDeCNB3@kista>
In-Reply-To: <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <2156838.FvJGUiYDvf@kista>
 <CAGb2v65cZ7DXzcPzt8ER1ucwhbhTOc0-mCCye3eK-ZgP3a6ivA@mail.gmail.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHBldGVrLCAwNS4gZmVicnVhciAyMDIxIG9iIDE3OjI4OjIzIENFVCBqZSBDaGVuLVl1IFRz
YWkgbmFwaXNhbChhKToKPiBPbiBTYXQsIEZlYiA2LCAyMDIxIGF0IDEyOjIxIEFNIEplcm5laiDF
oGtyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+IAp3cm90ZToKPiA+Cj4gPiBEbmUgcGV0
ZWssIDA1LiBmZWJydWFyIDIwMjEgb2IgMTc6MDE6MzAgQ0VUIGplIE1heGltZSBSaXBhcmQgbmFw
aXNhbChhKToKPiA+ID4gT24gRnJpLCBGZWIgMDUsIDIwMjEgYXQgMTE6MjE6MjJBTSArMDgwMCwg
Q2hlbi1ZdSBUc2FpIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgRmViIDUsIDIwMjEgYXQgMjo0OCBB
TSBKZXJuZWogU2tyYWJlYyAKPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ID4gd3JvdGU6Cj4g
PiA+ID4gPgo+ID4gPiA+ID4gQ2hhbm5lbCAxIGhhcyBwb2xhcml0eSBiaXRzIGZvciB2c3luYyBh
bmQgaHN5bmMgc2lnbmFscyBidXQgZHJpdmVyIApuZXZlcgo+ID4gPiA+ID4gc2V0cyB0aGVtLiBJ
dCB0dXJucyBvdXQgdGhhdCB3aXRoIHByZS1IRE1JMiBjb250cm9sbGVycyBzZWVtaW5nbHkgCnRo
ZXJlCj4gPiA+ID4gPiBpcyBubyBpc3N1ZSBpZiBwb2xhcml0eSBpcyBub3Qgc2V0LiBIb3dldmVy
LCB3aXRoIEhETUkyIGNvbnRyb2xsZXJzCj4gPiA+ID4gPiAoSDYpIHRoZXJlIG9mdGVuIGNvbWVz
IHRvIGRlLXN5bmNocm9uaXphdGlvbiBkdWUgdG8gcGhhc2Ugc2hpZnQuIApUaGlzCj4gPiA+ID4g
PiBjYXVzZXMgZmxpY2tlcmluZyBzY3JlZW4uIEl0J3Mgc2FmZSB0byBhc3N1bWUgdGhhdCBzaW1p
bGFyIGlzc3VlcyAKbWlnaHQKPiA+ID4gPiA+IGhhcHBlbiBhbHNvIHdpdGggcHJlLUhETUkyIGNv
bnRyb2xsZXJzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvbHZlIGlzc3VlIHdpdGggc2V0dGluZyB2
c3luYyBhbmQgaHN5bmMgcG9sYXJpdHkuIE5vdGUgdGhhdCBkaXNwbGF5Cj4gPiA+ID4gPiBzdGFj
a3Mgd2l0aCB0Y29uIHRvcCBoYXZlIHBvbGFyaXR5IGJpdHMgYWN0dWFsbHkgaW4gdGNvbjAgcG9s
YXJpdHkKPiA+ID4gPiA+IHJlZ2lzdGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEZpeGVzOiA5MDI2
ZTBkMTIyYWMgKCJkcm06IEFkZCBBbGx3aW5uZXIgQTEwIERpc3BsYXkgRW5naW5lIApzdXBwb3J0
IikKPiA+ID4gPiA+IFRlc3RlZC1ieTogQW5kcmUgSGVpZGVyIDxhLmhlaWRlckBnbWFpbC5jb20+
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNA
c2lvbC5uZXQ+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfdGNvbi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiAgZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uaCB8ICA1ICsrKysrCj4gPiA+ID4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMgYi9kcml2ZXJzL2dwdS9k
cm0vCnN1bjRpLwo+ID4gc3VuNGlfdGNvbi5jCj4gPiA+ID4gPiBpbmRleCA2YjlhZjRjMDhjZDYu
LjBkMTMyZGFlNThjMCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40
aV90Y29uLmMKPiA+ID4gPiA+IEBAIC02NzIsNiArNjcyLDI5IEBAIHN0YXRpYyB2b2lkIHN1bjRp
X3Rjb24xX21vZGVfc2V0KHN0cnVjdCAKc3VuNGlfdGNvbgo+ID4gKnRjb24sCj4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICBTVU40SV9UQ09OMV9CQVNJQzVfVl9TWU5DKHZzeW5jKSB8Cj4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICBTVU40SV9UQ09OMV9CQVNJQzVfSF9TWU5DKGhz
eW5jKSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKyAgICAgICAvKiBTZXR1cCB0aGUgcG9sYXJpdHkg
b2Ygc3luYyBzaWduYWxzICovCj4gPiA+ID4gPiArICAgICAgIGlmICh0Y29uLT5xdWlya3MtPnBv
bGFyaXR5X2luX2NoMCkgewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHZhbCA9IDA7Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKG1vZGUtPmZsYWdzICYgRFJNX01P
REVfRkxBR19QSFNZTkMpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB2YWwgfD0g
U1VONElfVENPTjBfSU9fUE9MX0hTWU5DX1BPU0lUSVZFOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgIGlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfUFZTWU5DKQo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmFsIHw9IFNVTjRJX1RDT04wX0lPX1BP
TF9WU1lOQ19QT1NJVElWRTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBy
ZWdtYXBfd3JpdGUodGNvbi0+cmVncywgU1VONElfVENPTjBfSU9fUE9MX1JFRywgCnZhbCk7Cj4g
PiA+ID4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgdmFsID0g
U1VONElfVENPTjFfSU9fUE9MX1VOS05PV047Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIGEgY29t
bWVudCBmb3IgdGhlIG9yaWdpbiBvZiB0aGlzIGlzIHdhcnJhbnRlZC4KPiA+ID4KPiA+ID4gSWYg
aXQncyBhbnl0aGluZyBsaWtlIFRDT04wLCBpdCdzIHRoZSBwaXhlbCBjbG9jayBwb2xhcml0eQo+
ID4KPiA+IEhhcmQgdG8gc2F5LCBEVyBIRE1JIGNvbnRyb2xsZXIgaGFzICJkYXRhIGVuYWJsZSIg
cG9sYXJpdHkgYWxvbmcgaHN5bmMgYW5kCj4gPiB2c3luYy4gSXQgY291bGQgYmUgZWl0aGVyIG9y
IG5vbmUgb2YgdGhvc2UuCj4gPgo+ID4gV2hhdCBzaG91bGQgSSB3cml0ZSBpbiBjb21tZW50PyBC
U1AgZHJpdmVycyBhbmQgZG9jdW1lbnRhdGlvbiB1c2Ugb25seSAKZ2VuZXJpYwo+ID4gbmFtZXMg
bGlrZSBpbzJfaW52Lgo+IAo+IEp1c3Qgc2F5IHRoYXQgd2UgZG9uJ3Qga25vdyBleGFjdGx5IHdo
YXQgaXQgaXMsIGJ1dCBpdCBpcyByZXF1aXJlZCBmb3IgCnRoaW5ncwo+IHRvIHdvcmsgcHJvcGVy
bHk/IFdvdWxkIGJlIGludGVyZXN0aW5nIHRvIGtub3cgd2hhdCBoYXBwZW5zIGlmIHlvdSBkb24n
dCBzZXQKPiB0aGlzIGJpdCwgYnV0IGRvIHNldCBWU1lOQy9IU1lOQyBwb2xhcml0eSBwcm9wZXJs
eS4KCk5vdGhpbmcgc2VlbXMgdG8gaGFwcGVuIC0gdGVzdGVkIG9uIEgzIHdpdGggSERNSSAoNGtA
MzApIGFuZCBDVkJTLiBBdCBsZWFzdCBJIApkaWRuJ3Qgbm90aWNlIGFueXRoaW5nLgoKQmVzdCBy
ZWdhcmRzLApKZXJuZWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
