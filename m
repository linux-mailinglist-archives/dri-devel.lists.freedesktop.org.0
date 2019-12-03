Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D010FBA2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D176B6E46F;
	Tue,  3 Dec 2019 10:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020876E46F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:17:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9628309;
 Tue,  3 Dec 2019 11:17:36 +0100 (CET)
Date: Tue, 3 Dec 2019 12:17:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 18/21] drm/bridge: panel: Propage bus format/flags
Message-ID: <20191203101730.GP4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-19-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-19-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575368257;
 bh=oT8aVb9gFuG6LRGtXmKix4LSGzY7LvR7mDNzrD/+yns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kTzLTcnGXMWM4h61u/SIO3Yz8OFrRHkkF25jr033tOTzqQByAd2tS0T9ZNDXcyJWG
 Ukz5kOQbtIf8Zxx0YJoJ3wFK6rZmQegNF0huN693flPsXmRmHSGJTT/QMX7TbdC4YS
 D7d0nzyeLYGvTCg1VY33eEsI8KXneqlL7aHxLIx4=
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
IGF0IDA1OjQ1OjA5UE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBTbyB0aGF0IHRo
ZSBwcmV2aW91cyBicmlkZ2UgZWxlbWVudCBpbiB0aGUgY2hhaW4ga25vd3Mgd2hpY2ggaW5wdXQK
PiBmb3JtYXQgdGhlIHBhbmVsIGJyaWRnZSBleHBlY3RzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MzoKPiAqIEFkanVzdCB0aGluZ3MgdG8gbWF0Y2ggdGhlIG5ldyBidXMtZm9ybWF0
IG5lZ290aWF0aW9uIGFwcHJvYWNoCj4gKiBVc2UgZHJtX2F0b21pY19oZWxwZXJfYnJpZGdlX3By
b3BhZ2F0ZV9idXNfZm10Cj4gKiBEb24ndCBpbXBsZW1lbnQgLT5hdG9taWNfY2hlY2soKSAodGhl
IGNvcmUgbm93IHRha2VzIGNhcmUgb2YgYnVzCj4gICBmbGFncyBwcm9wYWdhdGlvbikKPiAKPiBD
aGFuZ2VzIGluIHYyOgo+ICogQWRqdXN0IHRoaW5ncyB0byBtYXRjaCB0aGUgbmV3IGJ1cy1mb3Jt
YXQgbmVnb3RpYXRpb24gYXBwcm9hY2gKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9w
YW5lbC5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3BhbmVsLmMKPiBpbmRleCBmNGUyOTNlN2NmNjQuLmE3MGMzNjNhMmJkMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3BhbmVsLmMKPiBAQCAtMTI3LDYgKzEyNyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBwYW5lbF9icmlkZ2VfYnJpZGdlX2Z1bmNzID0gewo+ICAJ
LmVuYWJsZSA9IHBhbmVsX2JyaWRnZV9lbmFibGUsCj4gIAkuZGlzYWJsZSA9IHBhbmVsX2JyaWRn
ZV9kaXNhYmxlLAo+ICAJLnBvc3RfZGlzYWJsZSA9IHBhbmVsX2JyaWRnZV9wb3N0X2Rpc2FibGUs
Cj4gKwkuYXRvbWljX2dldF9pbnB1dF9idXNfZm10cyA9IGRybV9hdG9taWNfaGVscGVyX2JyaWRn
ZV9wcm9wYWdhdGVfYnVzX2ZtdCwKClNob3VsZG4ndCB0aGUgZm9ybWF0IGJlIHJldHJpZXZlZCBm
cm9tIHRoZSBwYW5lbCBpbnN0ZWFkIG9mIGZyb20gdGhlCmNvbm5lY3RvciA/IFdlJ3JlIG1vdmlu
ZyB0b3dhcmRzIHJlbW92aW5nIGNvbm5lY3RvciBjcmVhdGlvbiBmcm9tCmJyaWRnZXMsIHNvIEkg
dGhpbmsgaXQgd291bGQgYmUgbW9yZSBmdXR1cmUtcHJvb2YuCgo+ICB9Owo+ICAKPiAgLyoqCgot
LSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
