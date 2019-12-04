Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C3112966
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 11:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35C26E8B8;
	Wed,  4 Dec 2019 10:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A90A6E8B8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 10:38:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-7-253-nat.elisa-mobile.fi
 [85.76.7.253])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB93C2E5;
 Wed,  4 Dec 2019 11:38:15 +0100 (CET)
Date: Wed, 4 Dec 2019 12:38:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191204103806.GD6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
 <20191203181705.GT4730@pendragon.ideasonboard.com>
 <20191204100302.38096544@collabora.com>
 <20191204091255.GB6705@pendragon.ideasonboard.com>
 <20191204104207.38367944@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204104207.38367944@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575455896;
 bh=VYwRJOBjxh1800/WKysrFil7fftC0CbXVFmWz6HfoEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nYNUlz4rM9JU3o4YMkEk4KMPylmWuw6KYLkdVB+mkhIffo3E1dnrgcYy4DpS/cGtU
 Py9TgpAhqAhVa3g8Fk4nA4QLi/JFiYFvgiv875y4s6oNT0pgasXvWTbaqcrI0e9tdw
 EpyXCl+nBxjN4iHOvMlwBeOvfl13FUpttkinZTWE=
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

SGkgQm9yaXMsCgpPbiBXZWQsIERlYyAwNCwgMjAxOSBhdCAxMDo0MjowN0FNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gV2VkLCA0IERlYyAyMDE5IDExOjEyOjU1ICswMjAwIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAwNCwgMjAxOSBhdCAxMDowMzow
MkFNICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMyBEZWMgMjAx
OSAyMDoxNzowNSArMDIwMCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOiAgCj4gPiA+ID4gT24gVHVl
LCBEZWMgMDMsIDIwMTkgYXQgMDM6MTU6MTJQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9uIHdyb3Rl
OiAgCj4gPiA+ID4gPiBPbmUgb2YgdGhlIGxhc3QgcmVtYWluaW5nIG9iamVjdHMgdG8gbm90IGhh
dmUgaXRzIGF0b21pYyBzdGF0ZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhpcyBpcyBiZWluZyBt
b3RpdmF0ZWQgYnkgb3VyIGF0dGVtcHQgdG8gc3VwcG9ydCBydW50aW1lIGJ1cy1mb3JtYXQKPiA+
ID4gPiA+IG5lZ290aWF0aW9uIGJldHdlZW4gZWxlbWVudHMgb2YgdGhlIGJyaWRnZSBjaGFpbi4K
PiA+ID4gPiA+IFRoaXMgcGF0Y2gganVzdCBwYXZlcyB0aGUgcm9hZCBmb3Igc3VjaCBhIGZlYXR1
cmUgYnkgYWRkaW5nIGEgbmV3Cj4gPiA+ID4gPiBkcm1fYnJpZGdlX3N0YXRlIG9iamVjdCBpbmhl
cml0aW5nIGZyb20gZHJtX3ByaXZhdGVfb2JqIHNvIHdlIGNhbgo+ID4gPiA+ID4gcmUtdXNlIHNv
bWUgb2YgdGhlIGV4aXN0aW5nIHN0YXRlIGluaXRpYWxpemF0aW9uL3RyYWNraW5nIGxvZ2ljLgo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlz
LmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IE5laWwgQXJt
c3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
Q2hhbmdlcyBpbiB2NDoKPiA+ID4gPiA+ICogRml4IHRoZSBkb2MKPiA+ID4gPiA+ICogS2lsbCBk
ZWZhdWx0IGhlbHBlcnMgKGlubGluZWQpICAgIAo+ID4gPiA+IAo+ID4gPiA+IEkgbGlrZWQgdGhl
IGRlZmF1bHQgaGVscGVycywgaW5saW5pbmcgdGhlaXIgY29udGVudCBtYWtlcyB0aGUgY29kZSBt
b3JlCj4gPiA+ID4gZGlmZmljdWx0IHRvIGZvbGxvdyBpbiBteSBvcGluaW9uLiAgCj4gPiA+IAo+
ID4gPiBJJ2xsIGdvIGJhY2sgdG8gdGhpcyBhcHByb2FjaCB0aGVuLiBTaG91bGQgSSBrZWVwIHRo
ZSBvcmlnaW5hbCBoZWxwZXIKPiA+ID4gbmFtZXMgZXZlbiB0aG91Z2ggdGhleSdyZSBub3QgZ2xv
YmFsbHkgdmlzaWJsZSAoYW5kIHNob3VsZCBwcm9iYWJseQo+ID4gPiBuZXZlciBiZSk/ICAKPiA+
IAo+ID4gSSBhZ3JlZSB0aGV5IHNob3VsZCBwcm9iYWJseSBuZXZlciBiZSB2aXNpYmxlLCBhbmQg
SSB0cnVzdCB5b3VyCj4gPiBqdWRnZW1lbnQgb24gbmFtaW5nLiBQbGVhc2UgZG91YmxlLWNoZWNr
IHRoZSBkb2N1bWVudGF0aW9uIHRob3VnaCwgdG8KPiA+IGVuc3VyZSB0aGF0IGl0IG1hdGNoZXMg
dGhlIGltcGxlbWVudGF0aW9uLgo+IAo+IElzIHRoZXJlIGFueSBwb2ludCBrZWVwaW5nIHRoZSBk
b2N1bWVudGF0aW9uIGlmIHRoZXkncmUgbm90IGV4cG9zZWQ/CgpJJ2xsIGxldCB5b3UgZGVjaWRl
IG9uIHRoYXQsIGRlcGVuZGluZyBvbiBpZiB0aGUgZG9jdW1lbnRhdGlvbiBjb3VsZApicmluZyB2
YWx1ZSBvciBpZiB0aGUgZnVuY3Rpb25zIHdvdWxkIGJlIHNvIHRyaXZpYWwgdGhhdCBpdCB3b3Vs
ZCBiZQpvdmVya2lsbC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
