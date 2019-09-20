Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DF0B99F7
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2019 01:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7CD6FE11;
	Fri, 20 Sep 2019 23:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8B26FE11
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 23:12:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC0662F9;
 Sat, 21 Sep 2019 01:12:37 +0200 (CEST)
Date: Sat, 21 Sep 2019 02:12:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 06/11] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20190920231228.GH12672@pendragon.ideasonboard.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-7-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911075215.78047-7-dmitry.torokhov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1569021157;
 bh=rjz1wJjGxXSYjN7ynywAFExyXsol+TYBRcie4ik5QFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JeYj3LfQ2XRfPhk6Ulsz3ivewW9stOFV7hn8IvUAjrSXWo0UuPGQufLY4KiyICKy+
 nN4IdpmQgooiW64b5jnvntaP6C7v63g4CaCbYfEfAJKgR4ptfKnNFY7oFw56gjtBfB
 rOuCz07m5mhlBVKozL75z1u45T/przGI192osQdc=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKKENDJ2luZyBIZWlra2kgYXMgdGhlIG9yaWdpbmFsIGF1dGhvciBvZiBzb2Z0
d2FyZSBub2RlcyBzdXBwb3J0KQoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIFNl
cCAxMSwgMjAxOSBhdCAxMjo1MjoxMEFNIC0wNzAwLCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6Cj4g
SW5zdGVhZCBvZiBmd25vZGVfZ2V0X25hbWVkX2dwaW9kKCkgdGhhdCBJIHBsYW4gdG8gaGlkZSBh
d2F5LCBsZXQncyB1c2UKPiB0aGUgbmV3IGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKSB0aGF0IG1p
bWljcyBncGlvZF9nZXRfaW5kZXgoKSwgYml0CgpzL2JpdC9idXQvCgo+IHdvcmtzIHdpdGggYXJi
aXRyYXJ5IGZpcm13YXJlIG5vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFRvcm9raG92
IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCk9uIGEgc2lkZSBub3RlLCBh
cyBJJ20gbm90IHZlcnkgZmFtaWxpYXIgd2l0aCBzb2Z0d2FyZSBub2RlcywgSSB0cmllZCB0bwpz
ZWUgaG93IHRoZXkgYXJlIHRvIGJlIHVzZWQsIGFuZCBpdCBzZWVtcyB0aGV5IGFyZSBjb21wbGV0
ZWx5CnVuZG9jdW1lbnRlZCA6LSggSGVpa2tpLCBpcyB0aGlzIHNvbWV0aGluZyB0aGF0IGNvdWxk
IGJlIGZpeGVkID8KCj4gLS0tCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEw
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKPiBpbmRleCA2MWNjMjM1NGVm
MWIuLmQ5YzljOWViYWQyYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXRmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+IEBA
IC0yODQsOCArMjg0LDggQEAgc3RhdGljIGludCB0ZnA0MTBfZ2V0X2Nvbm5lY3Rvcl9wcm9wZXJ0
aWVzKHN0cnVjdCB0ZnA0MTAgKmR2aSkKPiAgCWVsc2UKPiAgCQlkdmktPmNvbm5lY3Rvcl90eXBl
ID0gRFJNX01PREVfQ09OTkVDVE9SX0RWSUQ7Cj4gIAo+IC0JZHZpLT5ocGQgPSBmd25vZGVfZ2V0
X25hbWVkX2dwaW9kKCZjb25uZWN0b3Jfbm9kZS0+Zndub2RlLAo+IC0JCQkJCSJocGQtZ3Bpb3Mi
LCAwLCBHUElPRF9JTiwgImhwZCIpOwo+ICsJZHZpLT5ocGQgPSBmd25vZGVfZ3Bpb2RfZ2V0X2lu
ZGV4KCZjb25uZWN0b3Jfbm9kZS0+Zndub2RlLAo+ICsJCQkJCSAgImhwZCIsIDAsIEdQSU9EX0lO
LCAiaHBkIik7Cj4gIAlpZiAoSVNfRVJSKGR2aS0+aHBkKSkgewo+ICAJCXJldCA9IFBUUl9FUlIo
ZHZpLT5ocGQpOwo+ICAJCWR2aS0+aHBkID0gTlVMTDsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQ
aW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
