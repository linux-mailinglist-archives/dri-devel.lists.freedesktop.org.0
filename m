Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17DCDC0C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13A16E46D;
	Mon,  7 Oct 2019 07:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223696E0BA
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 15:13:54 +0000 (UTC)
Received: from [199.195.250.187] (port=36604 helo=hermes.aosc.io)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iH8ED-0004ZV-JS; Sun, 06 Oct 2019 16:13:50 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 5115582914;
 Sun,  6 Oct 2019 15:13:30 +0000 (UTC)
Message-ID: <14da3ae768c439e387f6609553bd465e945d4a33.camel@aosc.io>
Subject: Re: [linux-sunxi] [PATCH 3/3] Revert "drm/sun4i: dsi: Rework a bit
 the hblk calculation"
From: Icenowy Zheng <icenowy@aosc.io>
To: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 06 Oct 2019 23:12:43 +0800
In-Reply-To: <58dc94b6371ab2f5b11b13ab707d73ab3fc4cc64.camel@aosc.io>
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-4-icenowy@aosc.io>
 <CAMty3ZDW4XHyW+6XL_RSVHqTSk79-r749pa0n5e6VbUzowAsiw@mail.gmail.com>
 <58dc94b6371ab2f5b11b13ab707d73ab3fc4cc64.camel@aosc.io>
Organization: Anthon Open-Source Community
MIME-Version: 1.0
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5ZyoIDIwMTktMTAtMDbml6XnmoQgMjI6NDQgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77ya
Cj4g5ZyoIDIwMTktMTAtMDPlm5vnmoQgMDk6NTMgKzA1MzDvvIxKYWdhbiBUZWtp5YaZ6YGT77ya
Cj4gPiBIaSBXZW5zLAo+ID4gCj4gPiBPbiBUdWUsIE9jdCAxLCAyMDE5IGF0IDE6MzQgUE0gSWNl
bm93eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgo+ID4gd3JvdGU6Cj4gPiA+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgNjJlNzUxMWE0ZjRkY2YwN2Y3NTM4OTNkMzQyNGRlY2Q5NDY2Yzk4Yi4KPiA+ID4g
Cj4gPiA+IFRoaXMgY29tbWl0LCBhbHRob3VnaCBjbGFpbWVkIGFzIGEgcmVmYWN0b3IsIGluIGZh
Y3QgY2hhbmdlZCB0aGUKPiA+ID4gZm9ybXVsYS4KPiA+ID4gCj4gPiA+IEJ5IGV4cGFuZGluZyB0
aGUgb3JpZ2luYWwgZm9ybXVsYSwgd2UgY2FuIGZpbmQgdGhhdCB0aGUgY29uc3QgMTAKPiA+ID4g
aXMKPiA+ID4gbm90Cj4gPiA+IHN1YnN0cmFjdGVkLCBpbnN0ZWFkIGl0J3MgYWRkZWQgdG8gdGhl
IHZhbHVlIChiZWNhdXNlIDEwIGlzCj4gPiA+IG5lZ2F0aXZlCj4gPiA+IHdoZW4gY2FsY3VsYXRp
bmcgaHNhLCBhbmQgaHNhIGl0c2VsZiBpcyBuZWdhdGl2ZSB3aGVuIGNhbGN1bGF0aW5nCj4gPiA+
IGhibGspLgo+ID4gPiBUaGlzIGJyZWFrcyB0aGUgc2ltaWxhciBwYXR0ZXJuIHRvIG90aGVyIGZv
cm11bGFzLCBzbyByZXN0b3JpbmcKPiA+ID4gdGhlCj4gPiA+IG9yaWdpbmFsIGZvcm11bGEgaXMg
bW9yZSBwcm9wZXIuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxp
Y2Vub3d5QGFvc2MuaW8+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjZpX21pcGlfZHNpLmMgfCA5ICsrLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW42aV9taXBpX2RzaS5jCj4gPiA+IGluZGV4IDJkM2U4MjJhNzczOS4uY2I1ZmQx
OWMwZDBkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlw
aV9kc2kuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2ku
Ywo+ID4gPiBAQCAtNTc3LDE0ICs1NzcsOSBAQCBzdGF0aWMgdm9pZCBzdW42aV9kc2lfc2V0dXBf
dGltaW5ncyhzdHJ1Y3QKPiA+ID4gc3VuNmlfZHNpICpkc2ksCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKG1vZGUtPmhzeW5jX3N0YXJ0IC0gbW9kZS0+aGRpc3BsYXkpICoKPiA+ID4g
QnBwIC0gSEZQX1BBQ0tFVF9PVkVSSEVBRCk7Cj4gPiA+IAo+ID4gPiAgICAgICAgICAgICAgICAg
LyoKPiA+ID4gLSAgICAgICAgICAgICAgICAqIFRoZSBibGFua2luZyBpcyBzZXQgdXNpbmcgYSBz
eW5jIGV2ZW50ICg0Cj4gPiA+IGJ5dGVzKQo+ID4gPiAtICAgICAgICAgICAgICAgICogYW5kIGEg
YmxhbmtpbmcgcGFja2V0ICg0IGJ5dGVzICsgcGF5bG9hZCArIDIKPiA+ID4gLSAgICAgICAgICAg
ICAgICAqIGJ5dGVzKS4gSXRzIG1pbmltYWwgc2l6ZSBpcyB0aGVyZWZvcmUgMTAKPiA+ID4gYnl0
ZXMuCj4gPiA+ICsgICAgICAgICAgICAgICAgKiBoYmxrIHNlZW1zIHRvIGJlIHRoZSBsaW5lICsg
cG9yY2hlcyBsZW5ndGguCj4gPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+ID4gLSNkZWZpbmUg
SEJMS19QQUNLRVRfT1ZFUkhFQUQgICAxMAo+ID4gPiAtICAgICAgICAgICAgICAgaGJsayA9IG1h
eCgodW5zaWduZWQgaW50KUhCTEtfUEFDS0VUX09WRVJIRUFELAo+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAobW9kZS0+aHRvdGFsIC0gKG1vZGUtPmhzeW5jX2VuZCAtCj4gPiA+IG1v
ZGUtCj4gPiA+ID4gaHN5bmNfc3RhcnQpKSAqIEJwcCAtCj4gPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgIEhCTEtfUEFDS0VUX09WRVJIRUFEKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGhi
bGsgPSBtb2RlLT5odG90YWwgKiBCcHAgLSBoc2E7Cj4gPiAKPiA+IFRoZSBvcmlnaW5hbCBmb3Jt
dWxhIGlzIGNvcnJlY3QgYWNjb3JkaW5nIHRvIEJTUCBbMV0gYW5kIHdvcmsgd2l0aAo+ID4gbXkK
PiA+IHBhbmVscyB3aGljaCBJIGhhdmUgdGVzdGVkIGJlZm9yZS4gTWF5IGJlIHRoZSBob3Jpem9u
dGFsIHRpbWluZ3Mgb24KPiA+IHBhbmVscyB5b3UgaGF2ZSBsZWFkcyB0byBuZWdhdGl2ZSB2YWx1
ZS4KPiAKPiBEbyB5b3UgdGVzdGVkIHRoZSBzYW1lIHRpbWluZyB3aXRoIEJTUCBrZXJuZWw/Cj4g
Cj4gSXQncyBxdWl0ZSBkaWZmaWN1bHQgdG8gZ2V0IGEgbmVnYXRpdmUgdmFsdWUgaGVyZSwgYmVj
YXVzZSB0aGUgdmFsdWUKPiBpcwo+IHF1aXRlIGJpZyAoaW5jbHVkZXMgbW9kZS0+aGRpc3BsYXkg
KiBCcHApLgoKQnkgcmUtY2hlY2tpbmcgd2l0aCB0aGUgQlNQIHNvdXJjZSBjb2RlLCBJIGZvdW5k
IHRoYXQgdGhlIGNvbnN0YW50IGluCnRoZSBIRlAgZm9ybXVsYSBpcyBpbmRlZWQgd3JvbmcgLS0g
aXQgc2hvdWxkIGJlIDE2LCBub3QgNi4KCj4gCj4gU3RyYW5nZWx5LCBvbmx5IGNoYW5nZSB0aGUg
Zm9ybXVsYSBoZXJlIGJhY2sgbWFrZXMgdGhlIHRpbWluZwo+IHRyYW5zbGF0ZWQgZnJvbSBGRVgg
ZmlsZSB3b3JrcyAodGVzdGVkIG9uIFBpbmVUYWIgYW5kIFBpbmVQaG9uZQo+IHByb2R1Y3Rpb24g
dmVyKS4gVGhlIHRyYW5zbGF0aW9uIHJ1bGUgaXMgZnJvbSBbMV0uCj4gCj4gU28gSSBzdGlsbCBp
bnNpc3Qgb24gdGhlIHBhdGNoIGJlY2F1c2UgaXQncyBuZWVkZWQgYnkgZXhwZXJpbWVudC4KPiAK
PiBbMV0gaHR0cDovL2xpbnV4LXN1bnhpLm9yZy9MQ0QKPiAKPiA+IFsxXSAKPiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS9heXVmYW4tcGluZTY0L2xpbnV4LXBpbmU2NC9ibG9iL215LWhhY2tzLTEuMi13
aXRoLWRybS9kcml2ZXJzL3ZpZGVvL3N1bnhpL2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxfc3VuNTBp
dzEvZGVfZHNpLmMjTDkxOQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
