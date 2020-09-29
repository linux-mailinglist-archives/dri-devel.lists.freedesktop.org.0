Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C85927BDD8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3DA89BDB;
	Tue, 29 Sep 2020 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93C489BDB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:18:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 08D27804E5;
 Tue, 29 Sep 2020 09:17:55 +0200 (CEST)
Date: Tue, 29 Sep 2020 09:17:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] drm/rockchip: fix build due to undefined
 drm_gem_cma_vm_ops
Message-ID: <20200929071754.GA736868@ravnborg.org>
References: <20200925215524.2899527-1-sam@ravnborg.org>
 <20200925215524.2899527-2-sam@ravnborg.org>
 <83650213-3b09-aea0-4485-cd20de1d9548@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83650213-3b09-aea0-4485-cd20de1d9548@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=7gkXJVJtAAAA:8 a=nVws210Im4UeU8Tq7v4A:9
 a=QEXdDO2ut3YA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjksIDIwMjAgYXQgMDg6NTM6MDZBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkgU2FtCj4gCj4gQW0gMjUuMDkuMjAgdW0gMjM6NTUgc2NocmllYiBTYW0g
UmF2bmJvcmc6Cj4gPiBDb21taXQgMGQ1OTBhZjMxNDBkICgiZHJtL3JvY2tjaGlwOiBDb252ZXJ0
IHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzIikKPiA+IGludHJvZHVjZWQgdGhlIGZvbGxvd2luZyBi
dWlsZCBlcnJvcjoKPiA+IAo+ID4gcm9ja2NoaXBfZHJtX2dlbS5jOjMwNDoxMzogZXJyb3I6IOKA
mGRybV9nZW1fY21hX3ZtX29wc+KAmSB1bmRlY2xhcmVkIGhlcmUKPiA+ICAgMzA0IHwgIC52bV9v
cHMgPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAo+ID4gICAgICAgfCAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn4KPiA+ICAgICAgIHwgICAgICAgICAgICAgZHJtX2dlbV9tbWFwX29iago+ID4g
Cj4gPiBGaXhlZCBieSBhZGRpbmcgbWlzc2luZyBpbmNsdWRlIGZpbGUuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAKPiBEaWRuJ3QgeW91
IHJldmlldyBleGFjdGx5IHRoaXMgY2hhbmdlIHllc3RlcmRheT8gQW55d2F5LCB5b3Ugc2hvdWxk
IGFkZApZZXAuCgo+IAo+IEZpeGVzOiAwZDU5MGFmMzE0MGQgKCJkcm0vcm9ja2NoaXA6IENvbnZl
cnQgdG8gZHJtX2dlbV9vYmplY3RfZnVuY3MiKQo+IAo+IGFuZAo+IAo+IFJldmlld2VkLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAKPiBJdCBtaWdodCBoYXBw
ZW4gdGhhdCBJIGxhbmQgbXkgcGF0Y2ggZmlyc3QsIGRlcGVuZGluZyBvbiB0aGUgdXJnZW5jeSBv
Zgo+IHRoZSBpc3N1ZS4KSSBleHBlY3QgeW91IHRvIGxhbmQgdGhlIHBhdGNoIHlvdSBtYWRlIGFz
YXAgc28gd2UgY2FuIGhhdmUgdGhlIGJ1aWxkCmZpeGVkIGFnYWluLgoKCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
