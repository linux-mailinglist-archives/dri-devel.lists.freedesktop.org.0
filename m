Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B00423F81
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 19:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB39891CB;
	Mon, 20 May 2019 17:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07370891CA;
 Mon, 20 May 2019 17:53:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AF5B5803DF;
 Mon, 20 May 2019 19:53:04 +0200 (CEST)
Date: Mon, 20 May 2019 19:53:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 27/33] fbdev: remove FBINFO_MISC_USEREVENT around fb_blank
Message-ID: <20190520175303.GA31421@ravnborg.org>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-28-daniel.vetter@ffwll.ch>
 <20190520172008.GB27230@ravnborg.org>
 <CAKMK7uEfyaex+kWyphReA9uaX9p21hDd_WquskocarvWtq1MHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEfyaex+kWyphReA9uaX9p21hDd_WquskocarvWtq1MHA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=-wFEsubm2uO9Ciycw-kA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMDc6Mjk6NTJQTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIE1heSAyMCwgMjAxOSBhdCA3OjIwIFBNIFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgRGFuaWVsLgo+ID4K
PiA+ID4gV2l0aCB0aGUgcmVjdXJzaW9uIGJyb2tlbiBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggd2Ug
Y2FuIGRyb3AgdGhlCj4gPiA+IEZCSU5GT19NSVNDX1VTRVJFVkVOVCBmbGFnIGFyb3VuZCBjYWxs
cyB0byBmYl9ibGFuayAtIHJlY3Vyc2lvbgo+ID4gPiBwcmV2ZW50aW9uIHdhcyBpdCdzIG9ubHkg
am9iLgo+ID4gPgo+ID4gV2hlbiBncmVwcGluZyBmb3IgRkJJTkZPX01JU0NfVVNFUkVWRU5UIEkg
Z2V0IGEgZmV3IGhpdHMgbm90IGFkZHJlc3NlZAo+ID4gaW4gdGhlIHBhdGNoIGJlbG93Ogo+ID4K
PiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jOiAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKCEoaW5mby0+ZmxhZ3MgJiBGQklORk9fTUlTQ19VU0VSRVZFTlQpKQo+ID4gZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmM6ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJl
dCAmJiAoZmxhZ3MgJiBGQklORk9fTUlTQ19VU0VSRVZFTlQpKSB7Cj4gPiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYzogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mby0+
ZmxhZ3MgJj0gfkZCSU5GT19NSVNDX1VTRVJFVkVOVDsKPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYm1lbS5jOiAgICAgICAgICAgICAgIGluZm8tPmZsYWdzIHw9IEZCSU5GT19NSVNDX1VT
RVJFVkVOVDsKPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jOiAgICAgICAgICAg
ICAgIGluZm8tPmZsYWdzICY9IH5GQklORk9fTUlTQ19VU0VSRVZFTlQ7Cj4gPiBkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYzogICAgICAgICAgICAgICBpbmZvLT5mbGFncyB8PSBGQklO
Rk9fTUlTQ19VU0VSRVZFTlQ7Cj4gPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYzog
ICAgICAgICAgICAgICBpbmZvLT5mbGFncyAmPSB+RkJJTkZPX01JU0NfVVNFUkVWRU5UOwo+ID4g
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMuYzogICAgIGZiX2luZm8tPmZsYWdzIHw9
IEZCSU5GT19NSVNDX1VTRVJFVkVOVDsKPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5
c2ZzLmM6ICAgICBmYl9pbmZvLT5mbGFncyAmPSB+RkJJTkZPX01JU0NfVVNFUkVWRU5UOwo+ID4g
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMuYzogICAgIGZiX2luZm8tPmZsYWdzIHw9
IEZCSU5GT19NSVNDX1VTRVJFVkVOVDsKPiA+IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5
c2ZzLmM6ICAgICBmYl9pbmZvLT5mbGFncyAmPSB+RkJJTkZPX01JU0NfVVNFUkVWRU5UOwo+ID4g
ZHJpdmVycy92aWRlby9mYmRldi9wczNmYi5jOiAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bmZvLT5mbGFncyB8PSBGQklORk9fTUlTQ19VU0VSRVZFTlQ7Cj4gPiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3BzM2ZiLmM6ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8tPmZsYWdzICY9IH5G
QklORk9fTUlTQ19VU0VSRVZFTlQ7Cj4gPiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9s
Y2RjZmIuYzogICogRkJJTkZPX01JU0NfVVNFUkVWRU5UIGZsYWcgaXMgc2V0LiBTaW5jZSB3ZSBk
byBub3Qgd2FudCB0byBmYWtlIGEKPiA+IGluY2x1ZGUvbGludXgvZmIuaDojZGVmaW5lIEZCSU5G
T19NSVNDX1VTRVJFVkVOVCAgICAgICAgICAweDEwMDAwIC8qIGV2ZW50IHJlcXVlc3QKPiA+Cj4g
PiBUaGUgdXNlIGluIHBzM2ZiIGxvb2tzIGxpa2UgYSBjYW5kaWRhdGUgZm9yIHJlbW92YWwgYW5k
IHRoaXMgZmlsZSBpcyBub3QKPiA+IHRvdWNoIGluIHRoaXMgcGF0Y2ggc2VyaWVzLCBzbyBJIGd1
ZXNzIEkgZGlkIG5vdCBtaXNzIGl0Lgo+ID4KPiA+IEFzIEkgZGlkIG5vdCBhcHBseSB0aGUgZnVs
bCBzZXJpZXMgbWF5YmUgc29tZSBvZiB0aGUgb3RoZXIgdXNlcnMgd2FzCj4gPiBhbHJlYWR5IHRh
a2VuIGNhcmUgb2YuCj4gCj4gSXQncyBhbHNvIHVzZWQgdG8gYnJlYWsgcmVjdXJzaW9uIGFyb3Vu
ZCBmYl9zZXRfcGFyIGFuZCBmYl9zZXRfcGFuLgo+IFVudGFuZ2xpbmcgdGhhdCBvbmUgd291bGQg
YmUgcG9zc2libGUsIGJ1dCBhbHNvIHJlcXVpcmVzIHVudGFuZ2xpbmcKPiBzb21lIGxvY2tpbmcs
IHNvIGEgbG90IG1vcmUgd29yay4gSWYgeW91IGNoYXNlIGFsbCB0aGUgY2FsbCBwYXRocyB0aGVu
Cj4geW91J2xsIG5vdGljZWQgdGhhdCB0aGUgdXNlcnMgc3RpbGwgbGVmdCBoYXZlIG5vIG92ZXJs
YXAgd2l0aCB0aGUgb25lcwo+IEknbSByZW1vdmluZyBoZXJlLgpOb3cgeW91IHNwZWxsIGl0IG91
dCBpdCBpcyBvYnZpb3VzLiBJIGd1ZXNzIEkgbmV2ZXIgcmVhZCBtb3JlIHRoYW4gZmJfCmFuZCBt
aXNzZWQgdGhhdCB3ZSBhcmUgZGVhbGluZyB3aXRoIGRpZmZlcmVudCBjYWxscy4KVGhhbmtzIGZv
ciB0aGUgcXVpY2sgZmVlZGJhY2ssIGFuZCBzb3JyeSBmb3IgdGhlIG5vaXNlLgoKCVNhbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
