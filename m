Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A94CB71BBB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 17:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810E6E2E8;
	Tue, 23 Jul 2019 15:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C36C6E2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 15:35:03 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55486
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hpwof-0003Wj-4S; Tue, 23 Jul 2019 17:35:01 +0200
Subject: Re: [PATCH] drm: Add Grain Media GM12U320 driver v2
To: Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
References: <20190721132525.10396-1-hdegoede@redhat.com>
 <20190723073332.GT15868@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <7097df21-56ab-506a-6d26-f172f726a215@tronnes.org>
Date: Tue, 23 Jul 2019 17:34:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723073332.GT15868@phenom.ffwll.local>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=o3/WejHQy1XYD7rDqXP+cgjLgErfpJ02DHotZ3/wEcw=; 
 b=iuEH6nlGSlgfR3YAA9uS1o3KusHibs7DMt6U3aiH5TWS4OY3qyICE4nQWQakyQdE8h2BF9P1spxVdxOXpvSlYAjpQTjHgtkR00xn2GcZTMXIR5eDkD/ZrWPRw8ulg8HitrRgQonbt76Up299z+AGzi5j+wH5uR4ukJ1A9FBxy3MdePrUfrg6QOT6jad0jHuiX9enUX1ShLMa0vU2CAQlVZTA9Hytc9qvKopxHw4UritSP00u6269eti70xAyFwjxsaTkmsXPge7Bxnm2ug32foOcPNmv/ZdkV5AdhKrT3r23lnjihnrpLtOJHzFNmTo3b8qEivuv+uAvJU0KuX2xeQ==;
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjMuMDcuMjAxOSAwOS4zMywgc2tyZXYgRGFuaWVsIFZldHRlcjoKPiBPbiBTdW4sIEp1
bCAyMSwgMjAxOSBhdCAwMzoyNToyNVBNICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+PiBB
ZGQgYSBtb2Rlc2V0dGluZyBkcml2ZXIgZm9yIEdyYWluIE1lZGlhIEdNMTJVMzIwIGJhc2VkIGRl
dmljZXMKPj4gKHByaW1hcmlseSBBY2VyIEMxMjAgcHJvamVjdG9yLCBidXQgdGhlcmUgbWF5IGJl
IGNvbXBhdGlibGUgZGV2aWNlcykuCj4+Cj4+IFRoaXMgaXMgYmFzZWQgb24gdGhlIGZiIGRyaXZl
ciBmcm9tIFZpYWNoZXNsYXYgTnVybWVraGFtaXRvdjoKPj4gaHR0cHM6Ly9naXRodWIuY29tL3Ns
YXZybi9nbTEydTMyMAo+Pgo+PiBUaGlzIGRyaXZlciB1c2VzIGRybV9zaW1wbGVfZGlzcGxheV9w
aXBlIHRvIGRlYWwgd2l0aCBhbGwgdGhlIGF0b21pYwo+PiBzdHVmZiwgZ2VtX3NobWVtX2hlbHBl
ciBmdW5jdGlvbnMgZm9yIGJ1ZmZlciBtYW5hZ2VtZW50IGFuZAo+PiBkcm1fZmJkZXZfZ2VuZXJp
Y19zZXR1cCBmb3IgZmJkZXYgZW11bGF0aW9uLCBzbyB0aGF0IGxlYXZlcyB0aGUgZHJpdmVyCj4+
IGl0c2VsZiB3aXRoIG9ubHkgdGhlIGFjdHVhbCBjb2RlIGZvciB0YWxraW5nIHRvIHRoZSBnbTEz
dTMyMCBjaGlwLAo+PiBsZWFkaW5nIHRvIGEgbmljZSBzaW1wbGUgYW5kIGNsZWFuIGRyaXZlci4K
Pj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLUFkZCBkcm0tbWlzYyB0cmVlIHRvIE1BSU5UQUlORVJT
Cj4+IC1Ecm9wIG1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDI0IC8gZml4IGZiZGV2IHN1
cHBvcnQKPj4KPj4gUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMu
b3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29t
Pgo+PiAtLS0KPj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsK
Pj4gIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAgIHwgICAyICsKPj4gIGRyaXZl
cnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsKPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9nbTEydTMyMC9LY29uZmlnICAgIHwgICA5ICsKPj4gIGRyaXZlcnMvZ3B1L2RybS9nbTEydTMy
MC9NYWtlZmlsZSAgIHwgICAyICsKPj4gIGRyaXZlcnMvZ3B1L2RybS9nbTEydTMyMC9nbTEydTMy
MC5jIHwgODE1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAKPiBIbSBJIHRob3VnaHQg
Tm9yYWxmJ3MgcGxhbiB3YXMgdG8gY29sbGVjdCBhbGwgc3VjaCB0aW55IGRyaXZlcnMgaW50bwo+
IGRybS90aW55ZHJtIChvciBkcm0vdGlueSkuIEkga2luZGEgbGlrZSB0aGF0IGlkZWEsIGluc3Rl
YWQgb2YgbGl0ZXJpbmcgdGhlCj4gdG9wIGxldmVsIHdpdGggdG9ucyBvZiBkaXJlY3RvcmllcyBh
bmQgZm9yY2luZyBldmVyeW9uZSB0byBjcmVhdGUgYSBuZXcKPiBNYWtlZmlsZS9LY29uZmlnLgo+
IAoKVGhhdCBoYXMgYmVlbiBteSBsb25nIHRlcm0gcGxhbiwgYnV0IEkgZGlkbid0IGtub3cgd2hl
biBJIHdvdWxkIGdldCB0bwp0aGF0IHBvaW50LiBUaGVyZSdzIGFsd2F5cyBzb21ldGhpbmdzIHRo
YXQgY29tZSB1cCBhbmQgSSBkaWRuJ3Qga25vdyBpZgpJIHdvdWxkIGdldCB0aGUgbmVjZXNzYXJ5
IHJldmlld3Mgbm93IHRoYXQgbWFueSBhcmUgb24gc3VtbWVyIHZhY2F0aW9uLgpJIGhhdmUgbm93
IGdvdHRlbiB0aGUgbmVjZXNzYXJ5IGFjay9yLWIgdG8gbW92ZSBvbiBhbmQgSSBmb3VuZCBhCnNv
bHV0aW9uIHRvIHRoZSBCQUNLTElHSFQgZGVwZW5kZW5jeSBwcm9ibGVtIEkgaGFkLCBzbyB0aGlz
IGhhcwpwcm9ncmVzc2VkIGZhc3RlciB0aGFuIEkgY291bGQgaG9wZSBmb3IuCgo+IE1heWJlIHdl
IGNvdWxkIG1vdmUgdGhpcyBhcyBwYXJ0IG9mIHRoZSB0aW55ZHJtLT50aW55LyByZW5hbWU/CgpJ
IGNhbiBhZGQgYSBwYXRjaCB0aGF0IGRvZXMgdGhhdC4KCk5vcmFsZi4KCj4gLURhbmllbAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
