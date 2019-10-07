Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F6CF3CE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC256E202;
	Tue,  8 Oct 2019 07:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CE6E602
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:19:22 +0000 (UTC)
Date: Mon, 7 Oct 2019 17:19:19 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] [PATCH 3/3] Revert "drm/sun4i: dsi: Rework a bit
 the hblk calculation"
Message-ID: <20191007151919.4uraoe374lui22gi@core.my.home>
Mail-Followup-To: Icenowy Zheng <icenowy@aosc.io>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-4-icenowy@aosc.io>
 <CAMty3ZDW4XHyW+6XL_RSVHqTSk79-r749pa0n5e6VbUzowAsiw@mail.gmail.com>
 <58dc94b6371ab2f5b11b13ab707d73ab3fc4cc64.camel@aosc.io>
 <14da3ae768c439e387f6609553bd465e945d4a33.camel@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14da3ae768c439e387f6609553bd465e945d4a33.camel@aosc.io>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=megous.com; s=mail; 
 t=1570461560; bh=OMxyikXfTnLOBqWm+QEP8j50cJcpiVKIgC8XLUKV570=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=m7g5UEjw7VFuKAAkFVCxO3wEHwsalXDMCOagem7pdBWKPdNT2aYudIhcBhI4kKSu0
 GbYJuS+e2J+VDLiYmdNd6Ec36l6rKDbsQjjr3tw1qU9T+xZiDXsWrGIba54j8J3XVd
 k3PKY59M3+VGq3LLOMSy3EowU+0nwjsLVz5VcsZw=
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
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SEkgSWNlbm93eSwKCk9uIFN1biwgT2N0IDA2LCAyMDE5IGF0IDExOjEyOjQzUE0gKzA4MDAsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4g5ZyoIDIwMTktMTAtMDbml6XnmoQgMjI6NDQgKzA4MDDvvIxJ
Y2Vub3d5IFpoZW5n5YaZ6YGT77yaCj4gPiDlnKggMjAxOS0xMC0wM+Wbm+eahCAwOTo1MyArMDUz
MO+8jEphZ2FuIFRla2nlhpnpgZPvvJoKPiA+ID4gSGkgV2VucywKPiA+ID4gCj4gPiA+IE9uIFR1
ZSwgT2N0IDEsIDIwMTkgYXQgMTozNCBQTSBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+
Cj4gPiA+IHdyb3RlOgo+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNjJlNzUxMWE0ZjRkY2Yw
N2Y3NTM4OTNkMzQyNGRlY2Q5NDY2Yzk4Yi4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGNvbW1pdCwg
YWx0aG91Z2ggY2xhaW1lZCBhcyBhIHJlZmFjdG9yLCBpbiBmYWN0IGNoYW5nZWQgdGhlCj4gPiA+
ID4gZm9ybXVsYS4KPiA+ID4gPiAKPiA+ID4gPiBCeSBleHBhbmRpbmcgdGhlIG9yaWdpbmFsIGZv
cm11bGEsIHdlIGNhbiBmaW5kIHRoYXQgdGhlIGNvbnN0IDEwCj4gPiA+ID4gaXMKPiA+ID4gPiBu
b3QKPiA+ID4gPiBzdWJzdHJhY3RlZCwgaW5zdGVhZCBpdCdzIGFkZGVkIHRvIHRoZSB2YWx1ZSAo
YmVjYXVzZSAxMCBpcwo+ID4gPiA+IG5lZ2F0aXZlCj4gPiA+ID4gd2hlbiBjYWxjdWxhdGluZyBo
c2EsIGFuZCBoc2EgaXRzZWxmIGlzIG5lZ2F0aXZlIHdoZW4gY2FsY3VsYXRpbmcKPiA+ID4gPiBo
YmxrKS4KPiA+ID4gPiBUaGlzIGJyZWFrcyB0aGUgc2ltaWxhciBwYXR0ZXJuIHRvIG90aGVyIGZv
cm11bGFzLCBzbyByZXN0b3JpbmcKPiA+ID4gPiB0aGUKPiA+ID4gPiBvcmlnaW5hbCBmb3JtdWxh
IGlzIG1vcmUgcHJvcGVyLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kg
WmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA5ICsrLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+ID4g
PiA+IGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKPiA+ID4gPiBpbmRl
eCAyZDNlODIyYTc3MzkuLmNiNWZkMTljMGQwZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCj4gPiA+ID4gQEAgLTU3NywxNCArNTc3LDkgQEAg
c3RhdGljIHZvaWQgc3VuNmlfZHNpX3NldHVwX3RpbWluZ3Moc3RydWN0Cj4gPiA+ID4gc3VuNmlf
ZHNpICpkc2ksCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAobW9kZS0+aHN5bmNf
c3RhcnQgLSBtb2RlLT5oZGlzcGxheSkgKgo+ID4gPiA+IEJwcCAtIEhGUF9QQUNLRVRfT1ZFUkhF
QUQpOwo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICAgICAgICAgICAvKgo+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgKiBUaGUgYmxhbmtpbmcgaXMgc2V0IHVzaW5nIGEgc3luYyBldmVudCAoNAo+ID4g
PiA+IGJ5dGVzKQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgKiBhbmQgYSBibGFua2luZyBwYWNr
ZXQgKDQgYnl0ZXMgKyBwYXlsb2FkICsgMgo+ID4gPiA+IC0gICAgICAgICAgICAgICAgKiBieXRl
cykuIEl0cyBtaW5pbWFsIHNpemUgaXMgdGhlcmVmb3JlIDEwCj4gPiA+ID4gYnl0ZXMuCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAqIGhibGsgc2VlbXMgdG8gYmUgdGhlIGxpbmUgKyBwb3JjaGVz
IGxlbmd0aC4KPiA+ID4gPiAgICAgICAgICAgICAgICAgICovCj4gPiA+ID4gLSNkZWZpbmUgSEJM
S19QQUNLRVRfT1ZFUkhFQUQgICAxMAo+ID4gPiA+IC0gICAgICAgICAgICAgICBoYmxrID0gbWF4
KCh1bnNpZ25lZCBpbnQpSEJMS19QQUNLRVRfT1ZFUkhFQUQsCj4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgKG1vZGUtPmh0b3RhbCAtIChtb2RlLT5oc3luY19lbmQgLQo+ID4gPiA+
IG1vZGUtCj4gPiA+ID4gPiBoc3luY19zdGFydCkpICogQnBwIC0KPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICBIQkxLX1BBQ0tFVF9PVkVSSEVBRCk7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICAgIGhibGsgPSBtb2RlLT5odG90YWwgKiBCcHAgLSBoc2E7Cj4gPiA+IAo+ID4gPiBUaGUg
b3JpZ2luYWwgZm9ybXVsYSBpcyBjb3JyZWN0IGFjY29yZGluZyB0byBCU1AgWzFdIGFuZCB3b3Jr
IHdpdGgKPiA+ID4gbXkKPiA+ID4gcGFuZWxzIHdoaWNoIEkgaGF2ZSB0ZXN0ZWQgYmVmb3JlLiBN
YXkgYmUgdGhlIGhvcml6b250YWwgdGltaW5ncyBvbgo+ID4gPiBwYW5lbHMgeW91IGhhdmUgbGVh
ZHMgdG8gbmVnYXRpdmUgdmFsdWUuCj4gPiAKPiA+IERvIHlvdSB0ZXN0ZWQgdGhlIHNhbWUgdGlt
aW5nIHdpdGggQlNQIGtlcm5lbD8KPiA+IAo+ID4gSXQncyBxdWl0ZSBkaWZmaWN1bHQgdG8gZ2V0
IGEgbmVnYXRpdmUgdmFsdWUgaGVyZSwgYmVjYXVzZSB0aGUgdmFsdWUKPiA+IGlzCj4gPiBxdWl0
ZSBiaWcgKGluY2x1ZGVzIG1vZGUtPmhkaXNwbGF5ICogQnBwKS4KPiAKPiBCeSByZS1jaGVja2lu
ZyB3aXRoIHRoZSBCU1Agc291cmNlIGNvZGUsIEkgZm91bmQgdGhhdCB0aGUgY29uc3RhbnQgaW4K
PiB0aGUgSEZQIGZvcm11bGEgaXMgaW5kZWVkIHdyb25nIC0tIGl0IHNob3VsZCBiZSAxNiwgbm90
IDYuCgpJJ20gbm90IHN1cmUgaWYgaXQncyByZWxldmFudCB0byB0aGUgZGlzY3Vzc2lvbiwgYnV0
IEkndmUgcmVjZW50bHkgZm91bmQKYSBMQ0QgY29uZmlndXJhdGlvbiBtYW51YWwgZm9yIEExMCwg
dGhhdCBtYXkgY29udGFpbiBzb21lIHVzZWZ1bCBpbmZvOgoKU2VlIHRoaXM6IGh0dHBzOi8vZ2l0
aHViLmNvbS9wb2NrZXRib29rL1BsYXRmb3JtX0ExMy9ibG9iL21hc3Rlci9LZXJuZWwvZHJpdmVy
cy92aWRlby9zdW41aS9sY2QvYTEwX2xjZF9jb25maWdfbmFudWFsX3YxLjAucGRmCgpyZWdhcmRz
LAoJby4KCj4gPiAKPiA+IFN0cmFuZ2VseSwgb25seSBjaGFuZ2UgdGhlIGZvcm11bGEgaGVyZSBi
YWNrIG1ha2VzIHRoZSB0aW1pbmcKPiA+IHRyYW5zbGF0ZWQgZnJvbSBGRVggZmlsZSB3b3JrcyAo
dGVzdGVkIG9uIFBpbmVUYWIgYW5kIFBpbmVQaG9uZQo+ID4gcHJvZHVjdGlvbiB2ZXIpLiBUaGUg
dHJhbnNsYXRpb24gcnVsZSBpcyBmcm9tIFsxXS4KPiA+IAo+ID4gU28gSSBzdGlsbCBpbnNpc3Qg
b24gdGhlIHBhdGNoIGJlY2F1c2UgaXQncyBuZWVkZWQgYnkgZXhwZXJpbWVudC4KPiA+IAo+ID4g
WzFdIGh0dHA6Ly9saW51eC1zdW54aS5vcmcvTENECj4gPiAKPiA+ID4gWzFdIAo+ID4gPiBodHRw
czovL2dpdGh1Yi5jb20vYXl1ZmFuLXBpbmU2NC9saW51eC1waW5lNjQvYmxvYi9teS1oYWNrcy0x
LjItd2l0aC1kcm0vZHJpdmVycy92aWRlby9zdW54aS9kaXNwMi9kaXNwL2RlL2xvd2xldmVsX3N1
bjUwaXcxL2RlX2RzaS5jI0w5MTkKPiAKPiAtLSAKPiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdl
IGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJsaW51eC1z
dW54aSIgZ3JvdXAuCj4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJl
Y2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1zdW54aSt1bnN1
YnNjcmliZUBnb29nbGVncm91cHMuY29tLgo+IFRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRo
ZSB3ZWIsIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9saW51eC1zdW54
aS8xNGRhM2FlNzY4YzQzOWUzODdmNjYwOTU1M2JkNDY1ZTk0NWQ0YTMzLmNhbWVsJTQwYW9zYy5p
by4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
