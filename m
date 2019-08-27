Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0964C9E391
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507C8970E;
	Tue, 27 Aug 2019 09:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8BC8970E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:04:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 76CE228A3A1;
 Tue, 27 Aug 2019 10:03:59 +0100 (BST)
Date: Tue, 27 Aug 2019 11:03:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 3/8] drm/bridge: synopsys: dw-hdmi: add bus
 format negociation
Message-ID: <20190827110356.3bec488b@collabora.com>
In-Reply-To: <20190827081425.15011-4-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
 <20190827081425.15011-4-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNyBBdWcgMjAxOSAxMDoxNDoyMCArMDIwMApOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBBZGQgdGhlIGF0b21pY19nZXRfb3V0cHV0X2J1
c19mbXRzLCBhdG9taWNfZ2V0X2lucHV0X2J1c19mbXRzIHRvIG5lZ29jaWF0ZQoKCQkJCQkJCQkg
ICBebmVnb3RpYXRlCgo+IHRoZSBwb3NzaWJsZSBvdXRwdXQgYW5kIGlucHV0IGZvcm1hdHMgZm9y
IHRoZSBjdXJyZW50IG1vZGUgYW5kIG1vbml0b3IsCj4gYW5kIHVzZSB0aGUgbmVnb2NpYXRlZCBm
b3JtYXRzIGluIGEgYmFzaWMgYXRvbWljX2NoZWNrIGNhbGxiYWNrLgoKCSAgICAgIF5uZWdvdGlh
dGVkCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4KPiAtLS0KCgo+ICAKPiArc3RhdGljIHZvaWQgZHdfaGRtaV9icmlkZ2VfYXRvbWlj
X2dldF9vdXRwdXRfYnVzX2ZtdHMoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiArCQkJCQlz
dHJ1Y3QgZHJtX2JyaWRnZV9zdGF0ZSAqYnJpZGdlX3N0YXRlLAo+ICsJCQkJCXN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKPiArCQkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0
ZSAqY29ubl9zdGF0ZSwKPiArCQkJCQl1bnNpZ25lZCBpbnQgKm51bV9vdXRwdXRfZm10cywKPiAr
CQkJCQl1MzIgKm91dHB1dF9mbXRzKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
biA9IGNvbm5fc3RhdGUtPmNvbm5lY3RvcjsKPiArCXN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICpp
bmZvID0gJmNvbm4tPmRpc3BsYXlfaW5mbzsKPiArCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlID0gJmNydGNfc3RhdGUtPm1vZGU7Cj4gKwlib29sIGlzX2hkbWkyX3NpbmsgPSBpbmZvLT5o
ZG1pLnNjZGMuc3VwcG9ydGVkOwkKPiArCWludCBpID0gMDsKPiArCj4gKwkvKgo+ICsJICogSWYg
dGhlIGN1cnJlbnQgbW9kZSBlbmZvcmNlcyA0OjI6MCwgZm9yY2UgdGhlIG91dHB1dCBidXQgZm9y
bWF0Cj4gKwkgKiB0byA0OjI6MCBhbmQgZG8gbm90IGFkZCB0aGUgWVVWNDIyLzQ0NC9SR0IgZm9y
bWF0cwo+ICsJICovCj4gKwlpZiAoZHJtX21vZGVfaXNfNDIwX29ubHkoaW5mbywgbW9kZSkgfHwK
PiArCSAgICAoIWlzX2hkbWkyX3NpbmsgJiYgZHJtX21vZGVfaXNfNDIwX2Fsc28oaW5mbywgbW9k
ZSkpKSB7Cj4gKwo+ICsJCS8qIE9yZGVyIGJ1cyBmb3JtYXRzIGZyb20gMTZiaXQgdG8gOGJpdCBp
ZiBzdXBwb3J0ZWQgKi8KPiArCQlpZiAoaW5mby0+YnBjID09IDE2ICYmCj4gKwkJICAgIChpbmZv
LT5oZG1pLnk0MjBfZGNfbW9kZXMgJiBEUk1fRURJRF9ZQ0JDUjQyMF9EQ180OCkpIHsKPiArCQkJ
aWYgKG91dHB1dF9mbXRzKQo+ICsJCQkJb3V0cHV0X2ZtdHNbaV0gPSBNRURJQV9CVVNfRk1UX1VZ
WVZZWTE2XzBfNVg0ODsKPiArCQkJKytpOwo+ICsJCX0KCllvdSBjb3VsZCBwcm9iYWJseSBhZGQg
dGhlIGZvbGxvd2luZyBoZWxwZXI6CgpzdGF0aWMgdm9pZCBkd19oZG1pX2JyaWRnZV9hZGRfZm10
KHVuc2lnbmVkIGludCAqbnVtX2ZtdHMsIHUzMiAqZm10cywKCQkJCSAgIHUzMiBuZXdfZm10KQp7
CglpZiAoZm10cykKCQlmbXRzWypudW1fZm10c10gPSBuZXdfZm10OwoKCSgqbnVtX2ZtdHMpKys7
Cn0KCnRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZQoKCWlmIChmbXRzKQoJCS4uLgoKCWkrKzsJCQkK
CmxvZ2ljLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
