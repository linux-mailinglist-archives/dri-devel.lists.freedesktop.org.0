Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 802FC8135C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD53E6E293;
	Mon,  5 Aug 2019 07:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FFF89C6E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:13:54 +0000 (UTC)
Received: from linux-e202.suse.de ([46.85.219.9]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MiaHf-1iWA0Z44Zj-00fjLj; Sun, 04 Aug 2019 22:13:49 +0200
From: Fabian Vogt <fabian@ritter-vogt.de>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
Date: Sun, 04 Aug 2019 22:13:46 +0200
Message-ID: <1676212.IEmuWfiXUz@linux-e202.suse.de>
In-Reply-To: <CACRpkda-5xu2-X5yo=dXchSvuD=ZmZSpTbGNrkv6V+UKs27xWA@mail.gmail.com>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <12154694.e2V3OH3Rcx@linux-e202.suse.de>
 <CACRpkda-5xu2-X5yo=dXchSvuD=ZmZSpTbGNrkv6V+UKs27xWA@mail.gmail.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZPrRox85xbudZBJheLSzA4a/12zpDpeL3Mfq2GW1bCEa4VY0Iyg
 L7ulPgS7AYIF9PrUuIcII+97cw/N8RIvUAWrS6Z1gj+/VTW3THhd4ihyAWZsMk2aipFRjlx
 VJm9dMLwI8bhKOrTj/TEr5nOg+53C86eQ8Zdsxh7HhExuAU7vUCh4nSJ/J2TKDgVEBlgLMW
 W95Gs8oLDaBMqjNk4ZfQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PlWs8CwP4o8=:qjk61i5fs8IYVoN/PrFvgh
 HoNIU8B2fgT3dPictcl07oi9/VX4h7g3OjRCt1XOPQQG9RtrCRZQdvpUHx1Q92T6hWL548dP8
 sz7pQuBds4bjRiSG4d3Q/KV4e4+FdxlSivgeXyeOta6G3HSNZNYj9fIBIeDFVqeBe6c8ctfI8
 DnkLJXcZ4DLjEVi8VuUJVdTLZHunwBJoxzUw9FBHJbc7SOYtnt9sf17PxoHkNNznCk3r6Je0O
 UBKEmPHxSwdRXiFgTP3EjdfGQEGtGasqG3cH+7usWAMjOvkF5sQ4yJRy2JZ9+Ar9Cg8FuVYYU
 TwydGj9hPvlgJjOblrXE0+08J4tMjEHmMshs7vhjnzT9rt8dwa9vIw0i6w48DpHPPelG3FFxZ
 XIoXfUt3/RVEhI6Ns4xnaG+KBZU4QbYQIFHwzSnB9tWV/cBjeYeIVQeh5vvvSWFSVeEqvQEv+
 90wNUUVLCldCELsqoSsUWS3i+vf/xnimex2hb83KKpOX4mIEscOqrpvmjUsKvYvHgnzBRuB30
 LI+fQjfH8jEu0H3nSRtc7zZTxFIOkwnVuk0bG8GqKIutb0S9iLSGOKeo77ZssRikebnNNopeM
 tsH8JLkdN6Xlkm+AHUz7B3NfLaXOUNrRD7E+r2nXMr3Wt3zYXJvZIFSWxBZJIjvkm5UnGoz3z
 kNF3MUDTaob50Zjuet1cPPBj0RWDhc2USLpIxCdSeujBaRRv8a1peR03DrYV0uUF56CflwgY2
 f5/N9B0aP8zXToBqsDFI3yQ8u5gJcLWRcdGxFtVyhoo5v46EH4Xgzo4gXaQ=
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
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
Cc: Daniel Tang <dt.tangr@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBbSBTYW1zdGFnLCAzLiBBdWd1c3QgMjAxOSwgMTE6NTE6NTkgQ0VTVCBzY2hyaWViIExp
bnVzIFdhbGxlaWo6Cj4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgOToyNiBQTSBGYWJpYW4gVm9n
dCA8ZmFiaWFuQHJpdHRlci12b2d0LmRlPiB3cm90ZToKPiAKPiA+IE9uIGEgcmVhbCBDWCB0aGUg
TENEIGRpc3BsYXlzIHNob3dzIGNvbnRlbnQgd2l0aG91dAo+ID4gYW55IG90aGVyIGNoYW5nZXMg
dG8gdGhlIHNldCwgYnV0IGhhcyBhIH4zSHogcHVsc2F0aW5nIGVmZmVjdCBzY3JvbGxpbmcgZnJv
bQo+ID4gdGhlIHRvcCB0byB0aGUgYm90dG9tIGFuZCB0aGUgZ3JheSB0ZXh0IGNoYW5nZXMgY29s
b3Igc2xpZ2h0bHkuCj4gCj4gU28geW91IG1lYW4gc29tZXRoaW5nIG1lYW5pbmdmdWwgYXBwZWFy
cyBpbiB0aGUgTENECj4gYnV0IHRoZXJlIGFyZSB2aXN1YWwgZGlzdHVyYmFuY2VzPwo+IAo+ID4g
V2l0aG91dCB0aGUgcGF0Y2hzZXQgYXBwbGllZCBldmVyeXRoaW5nIGxvb2tzIHBlcmZlY3RseS4K
PiA+Cj4gPiBJIHRyaWVkIHNldHRpbmcgdnJlZnJlc2ggdG8gMjAsIGZiX2JwcCB0byAxNiBhbmQg
Zm9yY2luZyBhbiBpbnZlcnRlZCBwYW5lbAo+ID4gY2xvY2ssIGJ1dCB0aGUgcHVsc2luZyBkaWRu
J3QgY2hhbmdlLgo+ID4KPiA+IFVzaW5nIHRoZSBlbXVsYXRlZCBDWCBJIGNvbXBhcmVkIHRoZSBj
b250ZW50cyBvZiB0aGUgcmVnaXN0ZXJzIGFuZCBmb3VuZAo+ID4gdGhhdCBvbmx5IHRoZSBJUEMg
Yml0ICh3aGljaCBJIHRyaWVkIHRvIHNldCwgc28gdGhhdCdzIGxpa2VseSBub3QgaXQpIGFuZAo+
ID4gdGhlIGludGVycnVwdCByZWdpc3RlcnMgaGF2ZSBhIGRpZmZlcmVudCBjb250ZW50Lgo+ID4K
PiA+IEFueSBpZGVhPwo+IAo+IEkgdGhpbmsgaXQncyB0aGUgY2xvY2sgc2V0dGluZ3MgaW4gcGF0
Y2ggMi8zLgo+IAo+IEkganVzdCBzZXQgdGhlbSB0byAiMTAwMCIgKDFNSHogc2luY2UgaXRzIGlu
IGtIeikgYmFzZWQgb24gc29tZQo+IGVkdWNhdGVkIGd1ZXNzZXMuCj4gCj4gVGhlIG9sZCBkcml2
ZXIgc2V0IHRoZSBjbG9jayB0byAiMSIgKGtIeikgc28ganVzdCB0cnkgdGhhdCBmaXJzdCwKPiBt
YXliZSBpdCBpcyByZWFsbHkgdGhhdCBzbG93LgoKRGlkIHRoYXQsIGl0IGxvb2tlZCByYXRoZXIg
dW5oZWFsdGh5IGZvciB0aGUgTENELiBNb3N0bHkgd2hpdGUgd2l0aCBzb21lCmdsaXRjaGluZyBl
eGNlcHQgZm9yIH4yLTMgbGluZXMgd2l0aCBjb250ZW50IHNjcm9sbGluZyBvbiB0aGUgc2NyZWVu
LgoKMjAwa0h6IHdhcyBzdGlsbCB3YXkgdG8gc2xvdywgc28gdHJpZWQgdGhlIG9wcG9zaXRlIGRp
cmVjdGlvbi4KV2l0aCBhIGNsb2NrIG9mIDEwTUh6IHRoZSBkaXNwbGF5IHNlZW1zIHRvIGJlIHdv
cmtpbmcgZmluZSBhbmQgcHJvZHVjZXMgYQp2aXNpYmx5IHN0YWJsZSBvdXRwdXQuCgpUaGFua3Ms
CkZhYmlhbgoKPiBJdCdzIGp1c3QgdGhhdCB0aGUgb2xkIGRyaXZlciBhbHNvIHNldCByZWZyZXMg
dG8gNjAgZnBzIHdoaWNoIGRvZXNuJ3QKPiBhZGQgdXAsIGJ1dCBJIHRoaW5rIHRoYXQgc2V0dGlu
ZyBpcyBzaW1wbHkgaWdub3JlZCBhbmQgdGhhdCBpcyB3aHkKPiBpdCB3b3Jrcy4KPgo+IFlvdXJz
LAo+IExpbnVzIFdhbGxlaWoKCi0tLQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCmlu
ZGV4IGU1Y2ZlMTM5OGEzYi4uM2FkZGNkYWI4YWRiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNpbXBsZS5jCkBAIC0yNzYzLDcgKzI3NjMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVs
X2Rlc2MgYXJtX3J0c20gPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSBuc3BpcmVfY3hfbGNkX21vZGVbXSA9IHsKIAl7Ci0JCS5jbG9jayA9IDEwMDAsCisJCS5jbG9j
ayA9IDEwMDAwLAogCQkuaGRpc3BsYXkgPSAzMjAsCiAJCS5oc3luY19zdGFydCA9IDMyMCArIDUw
LAogCQkuaHN5bmNfZW5kID0gMzIwICsgNTAgKyA2LApAQCAtMjc5MSw3ICsyNzkxLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIG5zcGlyZV9jeF9sY2RfcGFuZWwgPSB7CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBuc3BpcmVfY2xhc3NpY19sY2RfbW9k
ZVtdID0gewogCXsKLQkJLmNsb2NrID0gMTAwMCwKKwkJLmNsb2NrID0gMTAwMDAsCiAJCS5oZGlz
cGxheSA9IDMyMCwKIAkJLmhzeW5jX3N0YXJ0ID0gMzIwICsgNiwKIAkJLmhzeW5jX2VuZCA9IDMy
MCArIDYgKyA2LAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
