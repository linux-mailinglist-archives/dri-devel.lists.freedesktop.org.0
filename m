Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5082765B95
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 18:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E39A6E266;
	Thu, 11 Jul 2019 16:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044826E266
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 16:32:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F41A2804C5;
 Thu, 11 Jul 2019 18:32:44 +0200 (CEST)
Date: Thu, 11 Jul 2019 18:32:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 4/5] drm/syncobj: Include the prototype for
 drm_timeout_abs_to_jiffies()
Message-ID: <20190711163238.GA3281@ravnborg.org>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
 <20190710125143.9965-4-ville.syrjala@linux.intel.com>
 <20190711153915.GF136584@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711153915.GF136584@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=A94k_kJpPAqGnPn1gOwA:9 a=wPNLvfGTeEIA:10
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMTE6Mzk6MTVBTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IE9uIFdlZCwgSnVsIDEwLCAyMDE5IGF0IDAzOjUxOjQyUE0gKzAzMDAsIFZpbGxlIFN5cmph
bGEgd3JvdGU6Cj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgo+ID4gCj4gPiBTcGFyc2UgY29tcGxhaW5zOgo+ID4gLi4vZHJpdmVycy9ncHUv
ZHJtL2RybV9zeW5jb2JqLmM6OTQyOjEzOiB3YXJuaW5nOiBzeW1ib2wgJ2RybV90aW1lb3V0X2Fi
c190b19qaWZmaWVzJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+ID4g
Cj4gPiBJbmNsdWRlIHRoZSBjb3JyZWN0IGhlYWRlciB3aXRoIHRoZSBwcm90b3R5cGUuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDEg
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5
bmNvYmouYwo+ID4gaW5kZXggYTE5OWM4ZDU2Yjk1Li4wMGVlY2M5YzQ2NGIgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9zeW5jb2JqLmMKPiA+IEBAIC01OCw2ICs1OCw3IEBACj4gPiAgI2luY2x1ZGUgPGRy
bS9kcm1fZ2VtLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiA+ICAjaW5jbHVk
ZSA8ZHJtL2RybV9zeW5jb2JqLmg+Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fdXRpbHMuaD4KPiAK
PiBKdXN0IHJlYWxpemVkIHdlIGhhdmUgYm90aCBkcm1fdXRpbC5oIGFuZCBkcm1fdXRpbHMuaCwg
d2hhdCBhIHdvcmxkIQpPbiBteSBUT0RPIGxpc3QgdG8gZ2V0IHJpZCBvZiBvbmUgb2YgdGhlbS4K
CglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
