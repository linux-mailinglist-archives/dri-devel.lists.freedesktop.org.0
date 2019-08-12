Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B9689DBB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 14:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B316E4F8;
	Mon, 12 Aug 2019 12:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6E6E4F8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 12:11:40 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:20806
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hx9Ao-0008US-EZ; Mon, 12 Aug 2019 14:11:38 +0200
Subject: Re: [PATCH 2/4] drm/tiny/ili9341: Move driver to drm/panel
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-3-noralf@tronnes.org>
 <20190811152448.GA14660@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e5670264-a674-73d8-ae9f-17bdbbeda3f2@tronnes.org>
Date: Mon, 12 Aug 2019 14:11:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190811152448.GA14660@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=VH0mmSdHLh8JfUTREgU2L22upbzWSlrfkYoiCIcrYhc=; 
 b=P5E7gNCXEnAPxvubsVZX6kxBI3edWBCK1/284argvNlf6DbG7OiopmDX7csg3u3/a6TUAl22/1WNjnyy4DVAZybAa0/da1UokRAEkxR9DfYBLxKK94sE0Qb/bRE9sRq/8M2eKRqkEpCSN9XgDnUhL8QdfuysHBB9CHiasg8fFiAhDSvly76r18CtIkqG0WzVZ1WJ1m8VWZW7HxDfc77Vykz2dIBJXvO2RtuudEciCkO2/NQmUo4ObS1dLdXOWwxiCbu715xzmbtpUSXvg8uXd+hdTmYt/Vm1ekf3gIfuzKInTuGdGhmfZ4Gam9/2IQfNRprKAxm21flBK8ssArMbUA==;
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
Cc: David Lechner <david@lechnology.com>, daniel.vetter@ffwll.ch,
 emil.l.velikov@gmail.com, josef@lusticky.cz, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTEuMDguMjAxOSAxNy4yNCwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBNb3N0IGZlZWRiYWNrIG9uIHRoaXMgZHJpdmVyIHdhcyBjb3ZlcmVkIGluIGNvbW1lbnQg
dG8gMS80Lgo+IE9ubHkgYSBmZXcgdGhpbmdzIGNhdWdodCBteSBleWUuCj4gCj4gT24gVGh1LCBB
dWcgMDEsIDIwMTkgYXQgMDM6NTI6NDdQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+
PiBNb3ZlIHRoZSBkcml2ZXIgdG8gZHJtL3BhbmVsIGFuZCB0YWtlIGFkdmFudGFnZSBvZiB0aGUg
bmV3IHBhbmVsIHN1cHBvcnQKPj4gaW4gZHJtX21pcGlfZGJpLiBDaGFuZ2UgdGhlIGZpbGUgbmFt
ZSB0byBtYXRjaCB0aGUgbmFtaW5nIHN0YW5kYXJkIGluCj4+IGRybS9wYW5lbC4gVGhlIERSTSBk
cml2ZXIgbmFtZSBpcyBrZXB0IHNpbmNlIGl0IGlzIEFCSS4KPj4KPj4gQWRkIG1pc3NpbmcgTUFJ
TlRBSU5FUlMgZW50cnkuCj4+Cj4+IENjOiBEYXZpZCBMZWNobmVyIDxkYXZpZEBsZWNobm9sb2d5
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+Cj4+IC0tLQo+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA3ICsKPj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAg
ICAgICB8ICAxMiArKwo+PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2VmaWxlICAgICAgICAg
ICAgICAgIHwgICAxICsKPj4gIC4uLi9wYW5lbC1pbGl0ZWstaWxpOTM0MS5jfSAgICAgICAgICAg
ICAgICAgICB8IDE3NCArKysrKysrKysrLS0tLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS90aW55
L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxMyAtLQo+PiAgZHJpdmVycy9ncHUvZHJtL3Rp
bnkvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxIC0KPj4gIDYgZmlsZXMgY2hhbmdlZCwg
MTEzIGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQo+PiAgcmVuYW1lIGRyaXZlcnMvZ3B1
L2RybS97dGlueS9pbGk5MzQxLmMgPT4gcGFuZWwvcGFuZWwtaWxpdGVrLWlsaTkzNDEuY30gKDY2
JSkKPj4KPj4gKwo+PiArc3RydWN0IGlsaTkzNDEgewo+PiArCXN0cnVjdCBtaXBpX2RiaV9kZXYg
ZGJpZGV2OyAvKiBUaGlzIG11c3QgYmUgdGhlIGZpcnN0IGVudHJ5ICovCj4gCj4gQ2FuIHdlIGF2
b2lkIHRoZSBuZWVkIGZvciB0aGlzIHRvIGJlIHRoZSBmaXJzdCBlbnRyeT8KPiAKClRoYXQgd291
bGQgcmVxdWlyZSB0aGlzIGRyaXZlciB0byBoYXZlIGEgY3VzdG9tIGRybV9kcml2ZXItPnJlbGVh
c2UgYW5kCnBhc3MgdGhhdCBpbnRvIHRoZSBERUZJTkVfRFJNX01JUElfREJJX1BBTkVMX0RSSVZF
UiBtYWNyby4KCkhhdmluZyBpdCBhcyB0aGUgZmlyc3QgZW50cnksIG1pcGlfZGJpX3JlbGVhc2Uo
KSB3aWxsIHN1ZmZpY2UuClNpbXBsaWZ5aW5nIHRoaW5ncy4KCj4gCj4+IC1zdGF0aWMgc3RydWN0
IGRybV9kcml2ZXIgaWxpOTM0MV9kcml2ZXIgPSB7Cj4+IC0JLmRyaXZlcl9mZWF0dXJlcwk9IERS
SVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9NSUMsCj4+IC0JLmZvcHMJCQk9
ICZpbGk5MzQxX2ZvcHMsCj4+IC0JLnJlbGVhc2UJCT0gbWlwaV9kYmlfcmVsZWFzZSwKPj4gLQlE
Uk1fR0VNX0NNQV9WTUFQX0RSSVZFUl9PUFMsCj4+IC0JLmRlYnVnZnNfaW5pdAkJPSBtaXBpX2Ri
aV9kZWJ1Z2ZzX2luaXQsCj4+IC0JLm5hbWUJCQk9ICJpbGk5MzQxIiwKPj4gLQkuZGVzYwkJCT0g
IklsaXRlayBJTEk5MzQxIiwKPj4gLQkuZGF0ZQkJCT0gIjIwMTgwNTE0IiwKPj4gLQkubWFqb3IJ
CQk9IDEsCj4+IC0JLm1pbm9yCQkJPSAwLAo+IAo+PiArREVGSU5FX0RSTV9NSVBJX0RCSV9QQU5F
TF9EUklWRVIoaWxpOTM0MSwgIklsaXRlayBJTEk5MzQxIiwgIjIwMTgwNTE0Iik7Cj4gVXBkYXRl
IHRoZSBkYXRlLiBUaGlzIGlzIGEgbWFqb3IgY2hhbmdlIHNvIGxldCBpdCBiZSByZWZlbGN0ZWQg
aW4gdGhlCj4gZGF0ZS4KPiAKCkkgZ3Vlc3MgdGhhdCBtYWtlcyBzZW5zZS4gSSBkb24ndCBrbm93
IHdoYXQgdGhpcyBkYXRlIGZpZWxkIGlzIHVzZWQgZm9yCnRob3VnaC4KCk5vcmFsZi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
