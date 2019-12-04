Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A91126CF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124456FB76;
	Wed,  4 Dec 2019 09:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8416FBB6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:15:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21FF12E5;
 Wed,  4 Dec 2019 10:15:51 +0100 (CET)
Date: Wed, 4 Dec 2019 11:15:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Message-ID: <20191204091544.GC6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203181924.GU4730@pendragon.ideasonboard.com>
 <20191204100957.15406559@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204100957.15406559@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575450951;
 bh=doXYPCSvABgiJK88FVctcozTFTsD7J1hmZz7i3MphpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sX5L4odfl4lUqYjF83Ubr63SnJ+3IJsFwBDWGYFCDsEcP00+XFTF6zqOzOIJWCP/s
 ZxeTpTMHc+Lq4af3GqzaGV+9T6l7JihRlM4swQ+bHERplRM2rhE5UvrOeTAt40G4iE
 6JLLALQhE9vnRN5cme6tPUNqssCc2N8jh74akw/U=
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

SGkgQm9yaXMsCgpPbiBXZWQsIERlYyAwNCwgMjAxOSBhdCAxMDowOTo1N0FNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gVHVlLCAzIERlYyAyMDE5IDIwOjE5OjI0ICswMjAwIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwMzoxNTow
NFBNICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVz
IGFpbXMgYXQgYWRkaW5nIHN1cHBvcnQgZm9yIHJ1bnRpbWUgYnVzLWZvcm1hdAo+ID4gPiBuZWdv
dGlhdGlvbiBiZXR3ZWVuIGFsbCBlbGVtZW50cyBvZiB0aGUKPiA+ID4gJ2VuY29kZXIgLT4gYnJp
ZGdlcyAtPiBjb25uZWN0b3IvZGlzcGxheScgc2VjdGlvbiBvZiB0aGUgcGlwZWxpbmUuCj4gPiA+
IAo+ID4gPiBJbiBvcmRlciB0byBzdXBwb3J0IHRoYXQsIHdlIG5lZWQgZHJtIGJyaWRnZXMgdG8g
ZnVsbHkgdGFrZSBwYXJ0IGluIHRoZQo+ID4gPiBhdG9taWMgc3RhdGUgdmFsaWRhdGlvbiBwcm9j
ZXNzLCB3aGljaCByZXF1aXJlcyBhZGRpbmcgYQo+ID4gPiBkcm1fYnJpZGdlX3N0YXRlIGFuZCBh
IG5ldyBkcm1fYnJpZGdlX2Z1bmNzLmF0b21pY19jaGVjaygpIGhvb2suCj4gPiA+IE9uY2UgdGhv
c2UgYmFzaWMgYnVpbGRpbmcgYmxvY2tzIGFyZSBpbiBwbGFjZSwgd2UgY2FuIGFkZCBuZXcgaG9v
a3MgdG8KPiA+ID4gYWxsb3cgYnVzIGZvcm1hdCBuZWdvdGlhdGlvbiAodGhvc2UgYXJlIGNhbGxl
ZCBqdXN0IGJlZm9yZSAgCj4gPiA+IC0+YXRvbWljX2NoZWNrKCkpLiBUaGUgYnVzIGZvcm1hdCBz
ZWxlY3Rpb24gaXMgZG9uZSBhdCBydW50aW1lIGJ5ICAKPiA+ID4gdGVzdGluZyBhbGwgcG9zc2li
bGUgY29tYmluYXRpb25zIGFjcm9zcyB0aGUgd2hvbGUgYnJpZGdlIGNoYWluIHVudGlsCj4gPiA+
IG9uZSBpcyByZXBvcnRlZCB0byB3b3JrLgo+ID4gPiAKPiA+ID4gTm8gTWFqb3IgY2hhbmdlcyBp
biB0aGlzIHY0LiBJIHRoaW5rIEkgYWRkcmVzc2VkIGFsbCBjb21tZW50cyBJIGdvdAo+ID4gPiBm
cm9tIE5laWwgYW5kIExhdXJlbnQgKHRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIHJldmlld3MgQlRX
KS4gTm90ZSB0aGF0Cj4gPiA+IHRoaXMgdmVyc2lvbiBvbmx5IGNvbnRhaW5zIGNvcmUgY2hhbmdl
cy4gT25jZSB0aG9zZSBjaGFuZ2VzIGFyZSBtZXJnZWQKPiA+ID4gSSdsbCBzZW5kIHRoZSBpbXgv
cGFuZWwvbHZkcy1jb2RlYyBzcGVjaWZpYyBiaXRzLiAgCj4gPiAKPiA+IEkgdGhpbmsgaXQgd291
bGQgbWFrZSBzZW5zZSB0byBmYXN0LXRyYWNrIHBhdGNoZXMgMDEgdG8gMDcgKGEgYml0Cj4gPiBz
ZWxmaXNobHkgYXMgSSB3b3VsZCBoYXZlIGEgbmVlZCBmb3IgdGhlbSBpbiBvbWFwZHJtIDotKSkK
PiAKPiBXaWxsIGRvIHRoYXQgZW5kIG9mIHRoaXMgd2Vlay4KClRoYW5rIHlvdS4KCj4gPiwgYnV0
IHN0YXJ0aW5nCj4gPiBmcm9tIDA4IEkgd29uZGVyIGlmIGl0IHdvdWxkbid0IG1ha2UgbW9yZSBz
ZW5zZSB0byBtZXJnZSB0aGVtIHdpdGggdGhlCj4gPiBpbXgvcGFuZWwvbHZkcy1jb2RlYyBiaXRz
IHRvIGhhdmUgYSB1c2VyLgo+IAo+IEknZCByZWFsbHkgbGlrZSB0byBzZWUgdGhhdCBoYXBwZW4g
ZWFybHkgaW4gdGhpcyByZWxlYXNlIGN5Y2xlIHNvIHdlCj4gY2FuIGNhdGNoIGJ1Z3MgYmVmb3Jl
IHRob3NlIGNvbW1pdHMgcmVhY2ggTGludXMnIHRyZWUsCgpJIGhhdmUgbm8gaXNzdWUgbWVyZ2lu
ZyBhbGwgeW91ciBwYXRjaGVzIGVhcmx5IGluIHRoZSByZWxlYXNlIGN5Y2xlLAppbmNsdWRpbmcg
dGhlIGlteC9wYW5lbC9sdmRzLWNvZGVjIGJpdHMuIEdpdmVuIHRoZSByZWJhc2UgcmVxdWlyZWQg
Zm9yCmx2ZHMtY29kZWMgaXQgbWF5IHRha2UgYSBiaXQgb2YgdGltZSB0aG91Z2gsIHNvIEknbSBP
SyBpZiB5b3UgcHJlZmVyCm1lcmdpbmcgdGhlIGNvcmUgZmlyc3QsIGJ1dCBJJ20gbm90IHN1cmUg
aXQgd2lsbCBoZWxwIGNhdGNoaW5nIGJ1Z3MgaWYKaXQncyB1bnVzZWQgOi0pCgo+IGFuZCB0aGUK
PiBsdmRzLWNvZGVjIGNoYW5nZXMgZGVwZW5kIG9uIHlvdXIgUFIuIENhbiB3ZSBtYWtlIHN1cmUg
dGhpcyBvbmUgaXMKPiBtZXJnZWQganVzdCBhZnRlciB0aGUgTVcgaGFzIGNsb3NlZCBhbmQgdGhl
IGRybS1uZXh0IC0+IGRybS1taXNjLW5leHQKPiBiYWNrIG1lcmdlIGRvbmUganVzdCBhZnRlciB0
aGF0PwoKSSd2ZSBzZW50IHRoZSBwdWxsIHJlcXVlc3QgYWxyZWFkeSwgYXMgc29vbiBhcyBEYXZl
IG9yIERhbmllbCBoYW5kbGVzCml0LCB5b3UnbGwgaGF2ZSB0aGUgbmVjZXNzYXJ5IGRlcGVuZGVu
Y2llcy4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
