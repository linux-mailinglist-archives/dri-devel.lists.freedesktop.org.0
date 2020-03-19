Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8EB18C884
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D876EAD2;
	Fri, 20 Mar 2020 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6176EA31
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 16:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1584634202; bh=JE6As6CIZS8cuj7+7+rzHQMv4MweXNHp5Nj8F2f/1sA=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=m00v60jzWPKSy4jXWtAUn2BxQ5ECTDL76y74ZABR/+zsxyxNzOa9abxC1yecgnHjx
 KyWqFQ4mWOj4PlpaJGOWIf7n5O1LgS0Mx1dDT4j3JRi//FLpLhUvc7wcVlo8MsbAN0
 kGfArbhAbc0qZa9JaF5PXOh0PrQ1KuPwEaZS+Odk=
Date: Thu, 19 Mar 2020 17:10:02 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] [PATCH v2 5/5] arm64: allwinner: dts: a64: add
 LCD-related device nodes for PinePhone
Message-ID: <20200319161002.kmivhr3ouhoyn4bt@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-6-icenowy@aosc.io>
 <d32e59aeb8395af1ae7ac2daa1ce985c56c14acc.camel@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d32e59aeb8395af1ae7ac2daa1ce985c56c14acc.camel@aosc.io>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMTA6NTE6MzZQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyMC0wMy0xNuaYn+acn+S4gOeahCAyMTozNSArMDgwMO+8jEljZW5vd3kg
WmhlbmflhpnpgZPvvJoKPiA+IFBpbmVQaG9uZSB1c2VzIFBXTSBiYWNrbGlnaHQgYW5kIGEgWEJE
NTk5IExDRCBwYW5lbCBvdmVyIERTSSBmb3IKPiA+IGRpc3BsYXkuCj4gPiAKPiA+IEFkZCBpdHMg
ZGV2aWNlIG5vZGVzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vu
b3d5QGFvc2MuaW8+Cj4gPiAtLS0KPiA+IE5vIGNoYW5nZXMgaW4gdjIuCj4gPiAKPiA+ICAuLi4v
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXBpbmVwaG9uZS5kdHNpICAgfCAzNwo+ID4gKysrKysr
KysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0
LXBpbmVwaG9uZS5kdHNpCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUw
aS1hNjQtcGluZXBob25lLmR0c2kKPiA+IGluZGV4IGNlZmRhMTQ1YzNjOS4uOTZkOTE1MDQyM2Uw
IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2
NC1waW5lcGhvbmUuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWE2NC1waW5lcGhvbmUuZHRzaQo+ID4gQEAgLTE2LDYgKzE2LDE1IEBAIGFsaWFzZXMg
ewo+ID4gIAkJc2VyaWFsMCA9ICZ1YXJ0MDsKPiA+ICAJfTsKPiA+ICAKPiA+ICsJYmFja2xpZ2h0
OiBiYWNrbGlnaHQgewo+ID4gKwkJY29tcGF0aWJsZSA9ICJwd20tYmFja2xpZ2h0IjsKPiA+ICsJ
CXB3bXMgPSA8JnJfcHdtIDAgNTAwMDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVEPjsKPiA+ICsJCWJy
aWdodG5lc3MtbGV2ZWxzID0gPDAgMTYgMTggMjAgMjIgMjQgMjYgMjkgMzIgMzUgMzggNDIKPiA+
IDQ2IDUxIDU2IDYyIDY4IDc1IDgzIDkxIDEwMD47Cj4gCj4gU2hvdWxkIEkgZHJvcCB0aGUgMCBo
ZXJlIGFuZCByZXBsYWNlIGl0IHdpdGggMTQ/CgpBbG1vc3QgYWxsIGJvYXJkcyBpbiBhcm0vYm9v
dC9kdHMgc3RhcnQgYXQgMC4KCj4gSSBoYXZlIGhlYXJkIGNvbW11bml0eSBjb21wbGFpbmluZyBh
Ym91dCBzZXR0aW5nIDAgdG8gYnJpZ2h0bmVzcyBtYWtlCj4gdGhlIHNjcmVlbiBibGFjay4KCkxl
dmVsIDAgKGZpcnN0IHZhbHVlIGluIHRoZSBsaXN0KSBpcyBzcGVjaWFsLCBhbmQgdHVybnMgb2Zm
IHRoZSBiYWNrbGlnaHQ6CgoxMjMgICAgICAgICBpZiAoYnJpZ2h0bmVzcyA+IDApIHsKMTI0ICAg
ICAgICAgICAgICAgICBwd21fZ2V0X3N0YXRlKHBiLT5wd20sICZzdGF0ZSk7CjEyNSAgICAgICAg
ICAgICAgICAgc3RhdGUuZHV0eV9jeWNsZSA9IGNvbXB1dGVfZHV0eV9jeWNsZShwYiwgYnJpZ2h0
bmVzcyk7CjEyNiAgICAgICAgICAgICAgICAgcHdtX2FwcGx5X3N0YXRlKHBiLT5wd20sICZzdGF0
ZSk7CjEyNyAgICAgICAgICAgICAgICAgcHdtX2JhY2tsaWdodF9wb3dlcl9vbihwYik7CjEyOCAg
ICAgICAgIH0gZWxzZSB7CjEyOSAgICAgICAgICAgICAgICAgcHdtX2JhY2tsaWdodF9wb3dlcl9v
ZmYocGIpOwoxMzAgICAgICAgICB9CgoJby4KCj4gKEkgdGhpbmsgaW4gdGhpcyBzaXR1YXRpb24g
YmxfcG93ZXIgb3IgYmxhbmsgdGhlIERTSSBwYW5lbCBjYW4gc3RpbGwKPiB0b3RhbGx5IHNodXQg
ZG93biB0aGUgYmFja2xpZ2h0KS4KPiAKPiA+ICsJCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9
IDwxNT47Cj4gPiArCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyA3IDEwIEdQSU9fQUNUSVZFX0hJR0g+
OyAvKiBQSDEwICovCj4gPiArCQlwb3dlci1zdXBwbHkgPSA8JnJlZ19sZG9faW8wPjsKPiA+ICsJ
fTsKPiA+ICsKPiA+ICAJY2hvc2VuIHsKPiA+ICAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1
MjAwbjgiOwo+ID4gIAl9Owo+ID4gQEAgLTg0LDYgKzkzLDMwIEBAICZkYWkgewo+ID4gIAlzdGF0
dXMgPSAib2theSI7Cj4gPiAgfTsKPiA+ICAKPiA+ICsmZGUgewo+ID4gKwlzdGF0dXMgPSAib2th
eSI7Cj4gPiArfTsKPiA+ICsKPiA+ICsmZHBoeSB7Cj4gPiArCXN0YXR1cyA9ICJva2F5IjsKPiA+
ICt9Owo+ID4gKwo+ID4gKyZkc2kgewo+ID4gKwl2Y2MtZHNpLXN1cHBseSA9IDwmcmVnX2RsZG8x
PjsKPiA+ICsJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArCSNzaXplLWNlbGxzID0gPDA+Owo+
ID4gKwlzdGF0dXMgPSAib2theSI7Cj4gPiArCj4gPiArCXBhbmVsQDAgewo+ID4gKwkJY29tcGF0
aWJsZSA9ICJ4aW5nYmFuZ2RhLHhiZDU5OSI7Cj4gPiArCQlyZWcgPSA8MD47Cj4gPiArCQlyZXNl
dC1ncGlvcyA9IDwmcGlvIDMgMjMgR1BJT19BQ1RJVkVfTE9XPjsgLyogUEQyMyAqLwo+ID4gKwkJ
aW92Y2Mtc3VwcGx5ID0gPCZyZWdfZGxkbzI+Owo+ID4gKwkJdmNjLXN1cHBseSA9IDwmcmVnX2xk
b19pbzA+Owo+ID4gKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+Owo+ID4gKwl9Owo+ID4gK307
Cj4gPiArCj4gPiAgJmVoY2kwIHsKPiA+ICAJc3RhdHVzID0gIm9rYXkiOwo+ID4gIH07Cj4gPiBA
QCAtMTg4LDYgKzIyMSwxMCBAQCAmcl9waW8gewo+ID4gIAkgKi8KPiA+ICB9Owo+ID4gIAo+ID4g
KyZyX3B3bSB7Cj4gPiArCXN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gKwo+ID4gICZyX3Jz
YiB7Cj4gPiAgCXN0YXR1cyA9ICJva2F5IjsKPiA+ICAKPiA+IC0tIAo+ID4gMi4yNC4xCj4gPiAK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
