Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81E171221
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ECE6EC17;
	Thu, 27 Feb 2020 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E546E266
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:02:29 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id ec8aee7e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 26 Feb 2020 03:02:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id BCD4F4AF6B;
 Wed, 26 Feb 2020 11:02:19 +0000 (UTC)
Date: Wed, 26 Feb 2020 19:02:09 +0800
In-Reply-To: <f4109d23-4591-1c52-2822-0a2ba358fe1f@suse.de>
References: <20200221165127.813325-1-icenowy@aosc.io>
 <20200221171328.GC6928@lst.de> <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
 <f4109d23-4591-1c52-2822-0a2ba358fe1f@suse.de>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
To: Thomas Zimmermann <tzimmermann@suse.de>,Torsten Duwe <duwe@lst.de>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <07EED5EC-28C6-473D-B672-509F5C770479@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1582714944;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=pIFoYi183Typp2lmcp92AMk/OHIxESeRN6Iv4o1xpWU=;
 b=WOvbtHVjWIE9boKR2Mpt+dszNQp2Fuku0lplBgL1Ao10VSD4nV4IeDoEjrwMDcWUp5lpTx
 94uvk8zIvE3ZO6sqMtXHkhh+QDloNsAlQMO7xJAJQdVikEVdXGjfXHz+Mk3bdxnE2bl4gz
 j0eWRG/CA7cHbfUSNMcZbnBVNeg1t+Y=
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMOW5tDLmnIgyNuaXpSBHTVQrMDg6MDAg5LiL5Y2INjo1ODo0MywgVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IOWGmeWIsDoKPkhpIEljZXlub3csCj4KPlRv
cnN0ZW4gYXNrZWQgbWUgdG8gbWVyZ2UgeW91ciBwYXRjaCB2aWEgZHJtLW1pc2MtbmV4dC4gSSdk
IGFkZCB0aGUKPmFkZGl0aW9uYWwgY2MgYW5kIGZpeGVzIHRhZ3MgdGhhdCBUb3JzdGVuIGxpc3Rl
ZC4gQXJlIHlvdSBPSyB3aXRoIHRoYXQ/CgpJIHRoaW5rIHRoaXMgZml4ZXMgYSBkcml2ZXIgKGFu
ZCBhIGJvYXJkKSBhdmFpbGFibGUgaW4gNS42LgoKTWF5YmUgaXQgc2hvdWxkIGVudGVyIGZpeGVz
PwoKPgo+QmVzdCByZWdhcmRzCj5UaG9tYXMKPgo+QW0gMjIuMDIuMjAgdW0gMDM6NDMgc2Nocmll
YiBJY2Vub3d5IFpoZW5nOgo+PiAKPj4gCj4+IOS6jiAyMDIw5bm0MuaciDIy5pelIEdNVCswODow
MCDkuIrljYgxOjEzOjI4LCBUb3JzdGVuIER1d2UgPGR1d2VAbHN0LmRlPiDlhpnliLA6Cj4+PiBP
biBTYXQsIEZlYiAyMiwgMjAyMCBhdCAxMjo1MToyN0FNICswODAwLCBJY2Vub3d5IFpoZW5nIHdy
b3RlOgo+Pj4+IEN1cnJlbnQgY29kZSB0cmllcyB0byBzdG9yZSB0aGUgbGluayByYXRlIChpbiBi
cHMsIHdoaWNoIGlzIGEgYmlnCj4+Pj4gbnVtYmVyKSBpbiBhIHU4LCB3aGljaCBzdXJlbHkgb3Zl
cmZsb3cuIFRoZW4gaXQncyBjb252ZXJ0ZWQgYmFjayB0bwo+Pj4+IGJhbmR3aWR0aCBjb2RlICh3
aGljaCBpcyB0aHVzIDApIGFuZCB3cml0dGVuIHRvIHRoZSBjaGlwLgo+Pj4+Cj4+Pj4gVGhlIGNv
ZGUgc29tZXRpbWVzIHdvcmtzIGJlY2F1c2UgdGhlIGNoaXAgd2lsbCBhdXRvbWF0aWNhbGx5Cj5m
YWxsYmFjawo+Pj4gdG8KPj4+PiB0aGUgbG93ZXN0IHBvc3NpYmxlIERQIGxpbmsgcmF0ZSAoMS42
MkdicHMpIHdoZW4gZ2V0IHRoZSBpbnZhbGlkCj4+PiB2YWx1ZS4KPj4+PiBIb3dldmVyLCBvbiB0
aGUgZURQIHBhbmVsIG9mIE9saW1leCBURVJFUy1JLCB3aGljaCB3YW50cyAyLjdHYnBzCj4+PiBs
aW5rLAo+Pj4+IGl0IGZhaWxlZC4KPj4+Pgo+Pj4+IEFzIHdlIGhhZCBhbHJlYWR5IHJlYWQgdGhl
IGxpbmsgYmFuZHdpZHRoIGFzIGJhbmR3aWR0aCBjb2RlIGluCj4+PiBlYXJsaWVyCj4+Pj4gY29k
ZSAodG8gY2hlY2sgd2hldGhlciBpdCBpcyBzdXBwb3J0ZWQpLCB1c2UgaXQgd2hlbiBzZXR0aW5n
Cj4+PiBiYW5kd2lkdGgsCj4+Pj4gaW5zdGVhZCBvZiBjb252ZXJ0aW5nIGl0IHRvIGxpbmsgcmF0
ZSBhbmQgdGhlbiBjb252ZXJ0aW5nIGJhY2suCj4+Pj4KPj4+PiBGaXhlczogZTFjZmY4MmMxMDk3
ICgiZHJtL2JyaWRnZTogZml4IGFueDYzNDUgY29tcGlsYXRpb24gZm9yCj52NS41IikKPj4+PiBT
aWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4+Pj4gLS0tCj4+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jIHwg
MyArLS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygt
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW5hbG9naXgtYW54NjM0NS5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW5hbG9naXgtYW54NjM0NS5jCj4+Pj4gaW5kZXggNTZmNTVjNTNhYmZkLi4yZGZhMmZkMmEyM2Ig
MTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dp
eC1hbng2MzQ1LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2Fu
YWxvZ2l4LWFueDYzNDUuYwo+Pj4+IEBAIC0yMTAsOCArMjEwLDcgQEAgc3RhdGljIGludCBhbng2
MzQ1X2RwX2xpbmtfdHJhaW5pbmcoc3RydWN0Cj4+PiBhbng2MzQ1ICphbng2MzQ1KQo+Pj4+ICAJ
aWYgKGVycikKPj4+PiAgCQlyZXR1cm4gZXJyOwo+Pj4+ICAKPj4+PiAtCWRwY2RbMF0gPSBkcm1f
ZHBfbWF4X2xpbmtfcmF0ZShhbng2MzQ1LT5kcGNkKTsKPj4+PiAtCWRwY2RbMF0gPSBkcm1fZHBf
bGlua19yYXRlX3RvX2J3X2NvZGUoZHBjZFswXSk7Cj4+Pj4gKwlkcGNkWzBdID0gZHBfYnc7Cj4+
Pgo+Pj4gV2h5IGRvIHlvdSBtYWtlIHRoaXMgYXNzaWdubWVudCBhbmQgbm90IHVzZSBkcF9idyBk
aXJlY3RseSBpbiB0aGUKPmNhbGw/Cj4+IAo+PiBCZWNhdXNlIHRoZSBkcGNkIGFycmF5IGlzIHRo
ZW4gd3JpdHRlbiBhcyBhIGNvbnRpbm91cyBhcnJheQo+PiBiYWNrIHRvIERQQ0QuCj4+IAo+Pj4K
Pj4+PiAgCWVyciA9IHJlZ21hcF93cml0ZShhbng2MzQ1LT5tYXBbSTJDX0lEWF9EUFRYXSwKPj4+
PiAgCQkJICAgU1BfRFBfTUFJTl9MSU5LX0JXX1NFVF9SRUcsIGRwY2RbMF0pOwo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eCj4+
Pj4gIAlpZiAoZXJyKQo+Pj4+IC0tIAo+Pj4+IDIuMjQuMQo+Pj4KPj4+IEJUVywgbXkgdmVyc2lv
biBpcyBvbmx5IGEgYml0IG1vcmUgdmVyYm9zZToKPj4+Cj4+PiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvMzU0MzQ0Lwo+Pj4KPj4+IAlUb3JzdGVuCj4+IAoKLS0gCuS9
v+eUqCBLLTkgTWFpbCDlj5HpgIHoh6rmiJHnmoRBbmRyb2lk6K6+5aSH44CCCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
