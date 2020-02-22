Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A716A1D6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD998924F;
	Mon, 24 Feb 2020 09:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9DA6F5BC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 02:43:16 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 3a5da3da
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 21 Feb 2020 18:43:12 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id DE74848A85;
 Sat, 22 Feb 2020 02:43:07 +0000 (UTC)
Date: Sat, 22 Feb 2020 10:43:02 +0800
In-Reply-To: <20200221171328.GC6928@lst.de>
References: <20200221165127.813325-1-icenowy@aosc.io>
 <20200221171328.GC6928@lst.de>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
To: Torsten Duwe <duwe@lst.de>
From: Icenowy Zheng <icenowy@aosc.io>
Message-ID: <1E7BDB0F-639B-42BB-A4B4-A4C8CF94EBE0@aosc.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1582339390;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references;
 bh=HdzgxMt6spoiHKpSzevHwlrwkDQO+555z64Q+HRu8y8=;
 b=iBuZGyAA0D0whU3sCLhDXXiLyba9sqcc4GM3/SEbgRPvBCAzBSwOwFuOdjRUYotm6k9CAh
 KBxhTXsm/SKXf4+xZP00qKmnXmiOoDmtW8Ui2hLE9BKBR3Wvx1l0M6NvybawdkxtH9XpqX
 njZ0SNgbpZfZrWMJDhaAGIDFLL8Ea4E=
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgrkuo4gMjAyMOW5tDLmnIgyMuaXpSBHTVQrMDg6MDAg5LiK5Y2IMToxMzoyOCwgVG9yc3RlbiBE
dXdlIDxkdXdlQGxzdC5kZT4g5YaZ5YiwOgo+T24gU2F0LCBGZWIgMjIsIDIwMjAgYXQgMTI6NTE6
MjdBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPj4gQ3VycmVudCBjb2RlIHRyaWVzIHRv
IHN0b3JlIHRoZSBsaW5rIHJhdGUgKGluIGJwcywgd2hpY2ggaXMgYSBiaWcKPj4gbnVtYmVyKSBp
biBhIHU4LCB3aGljaCBzdXJlbHkgb3ZlcmZsb3cuIFRoZW4gaXQncyBjb252ZXJ0ZWQgYmFjayB0
bwo+PiBiYW5kd2lkdGggY29kZSAod2hpY2ggaXMgdGh1cyAwKSBhbmQgd3JpdHRlbiB0byB0aGUg
Y2hpcC4KPj4gCj4+IFRoZSBjb2RlIHNvbWV0aW1lcyB3b3JrcyBiZWNhdXNlIHRoZSBjaGlwIHdp
bGwgYXV0b21hdGljYWxseSBmYWxsYmFjawo+dG8KPj4gdGhlIGxvd2VzdCBwb3NzaWJsZSBEUCBs
aW5rIHJhdGUgKDEuNjJHYnBzKSB3aGVuIGdldCB0aGUgaW52YWxpZAo+dmFsdWUuCj4+IEhvd2V2
ZXIsIG9uIHRoZSBlRFAgcGFuZWwgb2YgT2xpbWV4IFRFUkVTLUksIHdoaWNoIHdhbnRzIDIuN0di
cHMKPmxpbmssCj4+IGl0IGZhaWxlZC4KPj4gCj4+IEFzIHdlIGhhZCBhbHJlYWR5IHJlYWQgdGhl
IGxpbmsgYmFuZHdpZHRoIGFzIGJhbmR3aWR0aCBjb2RlIGluCj5lYXJsaWVyCj4+IGNvZGUgKHRv
IGNoZWNrIHdoZXRoZXIgaXQgaXMgc3VwcG9ydGVkKSwgdXNlIGl0IHdoZW4gc2V0dGluZwo+YmFu
ZHdpZHRoLAo+PiBpbnN0ZWFkIG9mIGNvbnZlcnRpbmcgaXQgdG8gbGluayByYXRlIGFuZCB0aGVu
IGNvbnZlcnRpbmcgYmFjay4KPj4gCj4+IEZpeGVzOiBlMWNmZjgyYzEwOTcgKCJkcm0vYnJpZGdl
OiBmaXggYW54NjM0NSBjb21waWxhdGlvbiBmb3IgdjUuNSIpCj4+IFNpZ25lZC1vZmYtYnk6IElj
ZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDYzNDUuYyB8IDMgKy0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMKPmIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMKPj4gaW5kZXgg
NTZmNTVjNTNhYmZkLi4yZGZhMmZkMmEyM2IgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jCj4+IEBAIC0yMTAsOCArMjEw
LDcgQEAgc3RhdGljIGludCBhbng2MzQ1X2RwX2xpbmtfdHJhaW5pbmcoc3RydWN0Cj5hbng2MzQ1
ICphbng2MzQ1KQo+PiAgCWlmIChlcnIpCj4+ICAJCXJldHVybiBlcnI7Cj4+ICAKPj4gLQlkcGNk
WzBdID0gZHJtX2RwX21heF9saW5rX3JhdGUoYW54NjM0NS0+ZHBjZCk7Cj4+IC0JZHBjZFswXSA9
IGRybV9kcF9saW5rX3JhdGVfdG9fYndfY29kZShkcGNkWzBdKTsKPj4gKwlkcGNkWzBdID0gZHBf
Ync7Cj4KPldoeSBkbyB5b3UgbWFrZSB0aGlzIGFzc2lnbm1lbnQgYW5kIG5vdCB1c2UgZHBfYncg
ZGlyZWN0bHkgaW4gdGhlIGNhbGw/CgpCZWNhdXNlIHRoZSBkcGNkIGFycmF5IGlzIHRoZW4gd3Jp
dHRlbiBhcyBhIGNvbnRpbm91cyBhcnJheQpiYWNrIHRvIERQQ0QuCgo+Cj4+ICAJZXJyID0gcmVn
bWFwX3dyaXRlKGFueDYzNDUtPm1hcFtJMkNfSURYX0RQVFhdLAo+PiAgCQkJICAgU1BfRFBfTUFJ
Tl9MSU5LX0JXX1NFVF9SRUcsIGRwY2RbMF0pOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXgo+PiAgCWlmIChlcnIpCj4+IC0tIAo+
PiAyLjI0LjEKPgo+QlRXLCBteSB2ZXJzaW9uIGlzIG9ubHkgYSBiaXQgbW9yZSB2ZXJib3NlOgo+
Cj5odHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzU0MzQ0Lwo+Cj4JVG9y
c3RlbgoKLS0gCuS9v+eUqCBLLTkgTWFpbCDlj5HpgIHoh6rmiJHnmoRBbmRyb2lk6K6+5aSH44CC
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
