Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883010EDD3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 18:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9C86E264;
	Mon,  2 Dec 2019 17:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66FD6E264
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 17:05:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBCE5309;
 Mon,  2 Dec 2019 18:05:49 +0100 (CET)
Date: Mon, 2 Dec 2019 19:05:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 13/21] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Message-ID: <20191202170543.GQ4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-14-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-14-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575306350;
 bh=aA+iKqe3Q9MVSZpTaAGoQxIb4KBP+2rQFU94GPK0fdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ugqFrXZtGfggFHHPjHyDa9zVrmwi+8ZluUTZ3McNAGT756LiUHOiPz1khn6akZMb1
 YQw87SJuquipznrjMdgHkG/b0uE6IEeZktcid/+sTaRTLb7bsr3JN+P+YPQDEtx9ne
 VM2FQ+e8eXOfg89mOIhkJmxjQ3XkKtIjp0aclcvg=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9yaXMsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgT2N0IDIzLCAyMDE5
IGF0IDA1OjQ1OjA0UE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBXaWxsIGJlIHVz
ZWZ1bCBmb3IgYnJpZGdlIGRyaXZlcnMgdGhhdCB3YW50IHRvIGRvIGJ1cyBmb3JtYXQKPiBuZWdv
dGlhdGlvbiB3aXRoIHRoZWlyIG5laWdoYm91cnMuCgpBIGdlbmVyYWwgY29tbWVudCwgSSB0aGlu
ayB0aGUgYm9keSBvZiB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGJlCnJlYWRhYmxlIG9uIGl0
cyBvd24sIHdpdGhvdXQgdGhlIHN1YmplY3QgbGluZS4gSXQgbWF5IGJlIGEgbWF0dGVyIG9mCnBl
cnNvbmFsIHRhc3RlLgoKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoK
PiAqIElubGluZSBkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZSgpCj4gKiBGaXggdGhl
IGRvYwo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gKiBGaXggdGhlIGtlcm5lbGRvYwo+ICogRHJvcCB0
aGUgIWJyaWRnZSB8fCAhYnJpZGdlLT5lbmNvZGVyIGNoZWNrCj4gLS0tCj4gIGluY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaCB8IDE2ICsrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5o
IGIvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gaW5kZXggMmJlYjFlZjlhNzMzLi4zZmI1MTg0
OTQ2NDAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gQEAgLTUyNiw2ICs1MjYsMjIgQEAgZHJtX2JyaWRnZV9j
aGFpbl9nZXRfbmV4dF9icmlkZ2Uoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgCXJldHVy
biBsaXN0X25leHRfZW50cnkoYnJpZGdlLCBjaGFpbl9ub2RlKTsKPiAgfQo+ICAKPiArLyoqCj4g
KyAqIGRybV9icmlkZ2VfY2hhaW5fZ2V0X3ByZXZfYnJpZGdlKCkgLSBHZXQgdGhlIHByZXZpb3Vz
IGJyaWRnZSBpbiB0aGUgY2hhaW4KPiArICogQGJyaWRnZTogYnJpZGdlIG9iamVjdAo+ICsgKgo+
ICsgKiBSRVRVUk5TOgo+ICsgKiB0aGUgcHJldmlvdXMgYnJpZGdlIGluIHRoZSBjaGFpbiwgb3Ig
TlVMTCBpZiBAYnJpZGdlIGlzIHRoZSBmaXJzdC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgc3Ry
dWN0IGRybV9icmlkZ2UgKgo+ICtkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZShzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICt7Cj4gKwlpZiAobGlzdF9pc19maXJzdCgmYnJpZGdl
LT5jaGFpbl9ub2RlLCAmYnJpZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4pKQo+ICsJCXJldHVy
biBOVUxMOwo+ICsKPiArCXJldHVybiBsaXN0X3ByZXZfZW50cnkoYnJpZGdlLCBjaGFpbl9ub2Rl
KTsKPiArfQo+ICsKPiAgLyoqCj4gICAqIGRybV9icmlkZ2VfY2hhaW5fZ2V0X2ZpcnN0X2JyaWRn
ZSgpIC0gR2V0IHRoZSBmaXJzdCBicmlkZ2UgaW4gdGhlIGNoYWluCj4gICAqIEBlbmNvZGVyOiBl
bmNvZGVyIG9iamVjdAoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
