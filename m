Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C805310FB8F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770BA6E46D;
	Tue,  3 Dec 2019 10:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F12D6E46D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:15:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95F77309;
 Tue,  3 Dec 2019 11:15:43 +0100 (CET)
Date: Tue, 3 Dec 2019 12:15:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 12/21] drm/bridge: Add an ->atomic_check() hook
Message-ID: <20191203101537.GO4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-13-boris.brezillon@collabora.com>
 <20191202170336.GP4929@pendragon.ideasonboard.com>
 <20191203111151.28d86f53@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203111151.28d86f53@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575368143;
 bh=IVjK8/i+nUnppQ/CIcHWTcjPI3l6ji3A4nJKjmHK8yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yh9CIC75iZWShzztTl8a4pNolc5OLR+UhoRSwH7JGWrwQhZKXVASfzBKX0a5A8Wjz
 k3ObQUJRIxTtCKDoDpTrO7gzol9qYMVcUddfj2JfT2Smes/ASPt9BgAcO5UNql2tct
 Yluk4X7jUpbO99J6tniahgQiouHVyZgGXVTlJ/8s=
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

SGkgQm9yaXMsCgpPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAxMToxMTo1MUFNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gTW9uLCAyIERlYyAyMDE5IDE5OjAzOjM2ICswMjAwIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gCj4gPiA+ICsJLyoqCj4gPiA+ICsJICogQGF0b21pY19j
aGVjazoKPiA+ID4gKwkgKgo+ID4gPiArCSAqIFRoaXMgbWV0aG9kIGlzIHJlc3BvbnNpYmxlIGZv
ciBjaGVja2luZyBicmlkZ2Ugc3RhdGUgY29ycmVjdG5lc3MuCj4gPiA+ICsJICogSXQgY2FuIGFs
c28gY2hlY2sgdGhlIHN0YXRlIG9mIHRoZSBzdXJyb3VuZGluZyBjb21wb25lbnRzIGluIGNoYWlu
Cj4gPiA+ICsJICogdG8gbWFrZSBzdXJlIHRoZSB3aG9sZSBwaXBlbGluZSBjYW4gd29yayBwcm9w
ZXJseS4gIAo+ID4gCj4gPiBBcyBleHBsYWluZWQgaW4gdGhlIHJldmlldyBvZiB0aGUgUkZDLCBJ
IHRoaW5rIGl0J3MgYSBtaXN0YWtlIG5vdCB0bwo+ID4gZGVmaW5lIHRoZSBzZW1hbnRpY3Mgb2Yg
dGhpcyBvcGVyYXRpb24gcHJlY2lzZWx5LCBhbmQgaW4gcGFydGljdWxhciBub3QKPiA+IHRvIGRl
ZmluZSBleHBsaWN0bHkgd2hhdCBwYXJhbWV0ZXJzIGJyaWRnZSBkcml2ZXJzIGFyZSBhbGxvd2Vk
IHRvIG1vZGlmeQo+ID4gaGVyZS4gSSBob3dldmVyIGRvbid0IHdhbnQgdG8gbWFrZSB0aGlzIGEg
cHJlcmVxdWlzaXRlIGZvciB5b3VyIHNlcmllcywKPiA+IHNvCj4gPiAKPiA+IFJldmlld2VkLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4g
PiAKPiA+IGJ1dCBJJ20gc3VyZSB3ZSdsbCByZWdyZXQgdGhpcyBsYXRlciB3aGVuIGRpZmZlcmVu
dCBicmlkZ2VzIHdpbGwgaGF2ZQo+ID4gc2xpZ2h0bHkgaW5jb21wYXRpYmxlIGltcGxlbWVudGF0
aW9ucy4KPiAKPiBOb3RoaW5nIHByZXZlbnRzIHVzIGZyb20gd29ya2luZyBvbiB0aGlzIGNsYXJp
ZmljYXRpb24gYWZ0ZXIgdGhlIHBhdGNoCj4gc2VyaWVzIGhhcyBiZWVuIG1lcmdlZC4gSSBqdXN0
IHNhaWQgSSBjb3VsZG4ndCBjb21lIHVwIHdpdGggYSBnb29kCj4gc2V0IG9mIHJ1bGVzIG9uIG15
IG93biwgYXMgSSBkb24ndCByZWFsbHkga25vdyB3aGF0IGJyaWRnZS0+bW9kZV9maXh1cCgpCj4g
YWxsb3dzIHVzIHRvIG1vZGlmeSBpbiB0aGUgZmlyc3QgcGxhY2UuCgpXZSBjYW4gb2YgY291cnNl
IHdvcmsgb24gaXQgbGF0ZXIsIGJ1dCB3ZSBib3RoIGtub3cgaXQgd29uJ3QgaGFwcGVuIGZvcgpz
b21lIHRpbWUsIHVudGlsIGRpZmZlcmVudCBicmlkZ2VzIHdpbGwgYmVoYXZlIGRpZmZlcmVudGx5
IGFuZCB3ZSdsbApoYXZlIHRvIHNvcnQgYSByZWFsbHkgYmlnIG1lc3MgOi0pCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
