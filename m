Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C41126B5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 10:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E3B6F98A;
	Wed,  4 Dec 2019 09:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FEB6F978
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 09:13:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D183B2E5;
 Wed,  4 Dec 2019 10:13:01 +0100 (CET)
Date: Wed, 4 Dec 2019 11:12:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 08/11] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191204091255.GB6705@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-9-boris.brezillon@collabora.com>
 <20191203181705.GT4730@pendragon.ideasonboard.com>
 <20191204100302.38096544@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204100302.38096544@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575450782;
 bh=DLM5cCVpIiTvnsH3JC8xvKQelO/hR7BI0EPVs3eAlow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kzM7AUt6QVwQbzGcNShmVYRGF7cZy0G56tTNhws6vdylDtSZ8mpivCzO0LoByFU9k
 zU6j7/26jWIr9N/aoDSA403924AQTD282woY3Q4bYH7XaJ0Z8qgMyBDjNeKTwGaX+y
 PR8Jc6UTa5egbU8wUD6/7IDC9j9L45y+yIA7Nau0=
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

SGkgQm9yaXMsCgpPbiBXZWQsIERlYyAwNCwgMjAxOSBhdCAxMDowMzowMkFNICswMTAwLCBCb3Jp
cyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gVHVlLCAzIERlYyAyMDE5IDIwOjE3OjA1ICswMjAwIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwMzoxNTox
MlBNICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiA+IE9uZSBvZiB0aGUgbGFzdCBy
ZW1haW5pbmcgb2JqZWN0cyB0byBub3QgaGF2ZSBpdHMgYXRvbWljIHN0YXRlLgo+ID4gPiAKPiA+
ID4gVGhpcyBpcyBiZWluZyBtb3RpdmF0ZWQgYnkgb3VyIGF0dGVtcHQgdG8gc3VwcG9ydCBydW50
aW1lIGJ1cy1mb3JtYXQKPiA+ID4gbmVnb3RpYXRpb24gYmV0d2VlbiBlbGVtZW50cyBvZiB0aGUg
YnJpZGdlIGNoYWluLgo+ID4gPiBUaGlzIHBhdGNoIGp1c3QgcGF2ZXMgdGhlIHJvYWQgZm9yIHN1
Y2ggYSBmZWF0dXJlIGJ5IGFkZGluZyBhIG5ldwo+ID4gPiBkcm1fYnJpZGdlX3N0YXRlIG9iamVj
dCBpbmhlcml0aW5nIGZyb20gZHJtX3ByaXZhdGVfb2JqIHNvIHdlIGNhbgo+ID4gPiByZS11c2Ug
c29tZSBvZiB0aGUgZXhpc3Rpbmcgc3RhdGUgaW5pdGlhbGl6YXRpb24vdHJhY2tpbmcgbG9naWMu
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlcyBpbiB2NDoKPiA+
ID4gKiBGaXggdGhlIGRvYwo+ID4gPiAqIEtpbGwgZGVmYXVsdCBoZWxwZXJzIChpbmxpbmVkKSAg
Cj4gPiAKPiA+IEkgbGlrZWQgdGhlIGRlZmF1bHQgaGVscGVycywgaW5saW5pbmcgdGhlaXIgY29u
dGVudCBtYWtlcyB0aGUgY29kZSBtb3JlCj4gPiBkaWZmaWN1bHQgdG8gZm9sbG93IGluIG15IG9w
aW5pb24uCj4gCj4gSSdsbCBnbyBiYWNrIHRvIHRoaXMgYXBwcm9hY2ggdGhlbi4gU2hvdWxkIEkg
a2VlcCB0aGUgb3JpZ2luYWwgaGVscGVyCj4gbmFtZXMgZXZlbiB0aG91Z2ggdGhleSdyZSBub3Qg
Z2xvYmFsbHkgdmlzaWJsZSAoYW5kIHNob3VsZCBwcm9iYWJseQo+IG5ldmVyIGJlKT8KCkkgYWdy
ZWUgdGhleSBzaG91bGQgcHJvYmFibHkgbmV2ZXIgYmUgdmlzaWJsZSwgYW5kIEkgdHJ1c3QgeW91
cgpqdWRnZW1lbnQgb24gbmFtaW5nLiBQbGVhc2UgZG91YmxlLWNoZWNrIHRoZSBkb2N1bWVudGF0
aW9uIHRob3VnaCwgdG8KZW5zdXJlIHRoYXQgaXQgbWF0Y2hlcyB0aGUgaW1wbGVtZW50YXRpb24u
CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
