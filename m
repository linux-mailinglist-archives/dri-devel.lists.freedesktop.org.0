Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97947160D18
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80A36E8EC;
	Mon, 17 Feb 2020 08:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs63.siol.net [185.57.226.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08276E4E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 06:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 51884522CE8;
 Mon, 17 Feb 2020 07:39:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id aQUjgWNbNH1b; Mon, 17 Feb 2020 07:39:01 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id F4052522C8E;
 Mon, 17 Feb 2020 07:39:00 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id 1C5E9522CE8;
 Mon, 17 Feb 2020 07:38:59 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 boris.brezillon@collabora.com, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 02/11] drm/bridge: dw-hdmi: add max bpc connector
 property
Date: Mon, 17 Feb 2020 07:38:58 +0100
Message-ID: <11463907.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20200206191834.6125-3-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-3-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgxI1ldHJ0ZWssIDA2LiBmZWJydWFyIDIwMjAgb2IgMjA6MTg6MjUgQ0VUIGplIE5l
aWwgQXJtc3Ryb25nIG5hcGlzYWwoYSk6Cj4gRnJvbTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dp
Ym9vLnNlPgo+IAo+IEFkZCB0aGUgbWF4X2JwYyBwcm9wZXJ0eSB0byB0aGUgZHctaGRtaSBjb25u
ZWN0b3IgdG8gcHJlcGFyZSBzdXBwb3J0Cj4gZm9yIDEwLCAxMiAmIDE2Yml0IG91dHB1dCBzdXBw
b3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4K
PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNCAr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGluZGV4Cj4gOWUwOTI3ZDIyZGI2Li4wNTEw
MDFmNzdkZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
Ywo+IEBAIC0yNDA2LDYgKzI0MDYsMTAgQEAgc3RhdGljIGludCBkd19oZG1pX2JyaWRnZV9hdHRh
Y2goc3RydWN0IGRybV9icmlkZ2UKPiAqYnJpZGdlKSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEs
Cj4gIAkJCQkgICAgaGRtaS0+ZGRjKTsKPiAKPiArCWRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl9yZXNldChjb25uZWN0b3IpOwoKV2h5IGlzIHRoaXMgcmVzZXQgbmVlZGVkPwoKQmVzdCByZWdh
cmRzLApKZXJuZWoKCj4gKwo+ICsJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfbWF4X2JwY19wcm9wZXJ0
eShjb25uZWN0b3IsIDgsIDE2KTsKPiArCj4gIAlpZiAoaGRtaS0+dmVyc2lvbiA+PSAweDIwMGEg
JiYgaGRtaS0+cGxhdF9kYXRhLT51c2VfZHJtX2luZm9mcmFtZSkKPiAgCQlkcm1fb2JqZWN0X2F0
dGFjaF9wcm9wZXJ0eSgmY29ubmVjdG9yLT5iYXNlLAo+ICAJCQljb25uZWN0b3ItPmRldi0KPm1v
ZGVfY29uZmlnLmhkcl9vdXRwdXRfbWV0YWRhdGFfcHJvcGVydHksIDApOwoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
