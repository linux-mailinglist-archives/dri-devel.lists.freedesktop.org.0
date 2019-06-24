Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E1951C8B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A77F89DD5;
	Mon, 24 Jun 2019 20:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903889DD5;
 Mon, 24 Jun 2019 20:39:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AC3D88032A;
 Mon, 24 Jun 2019 22:39:57 +0200 (CEST)
Date: Mon, 24 Jun 2019 22:39:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm: drop uapi dependencies from include/drm
Message-ID: <20190624203956.GB12316@ravnborg.org>
References: <20190622121156.17217-1-sam@ravnborg.org>
 <20190624082135.GL12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624082135.GL12905@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=_ps_cLxEE-RF22TXy8QA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKPiA+IGRybV9maWxlLmg6Cj4gPiAtIG5lZWRzIGRybV9tYWdpY190Cj4gPiAg
IGRybV9tYWdpY190IGlzIGEgc2ltcGxlIHR5cGVkZWYsIGEgc2ltcGxlIHVuc2lnbmVkIGludCB3
b3VsZCBkbyB0aGUgdHJpY2sKPiAKPiBJIHRoaW5rIHdlIGNvdWxkIHN3aXRjaCBvdmVyIHRvIHVu
c2lnbmVkIGludCBmb3IgdGhpcy4KCk9LLCB3aWxsIHNlbmQgYSB2MiB3aXRoIHRoaXMgYWRkcmVz
c2VkLgpUaGVyZSBpcyBzb21lIHByZXBhcmF0b3J5IHBhdGNoZXMgdG8gZml4IGJ1aWxkIGJyZWFr
YWdlIHdoZW4gdGhlIGluY2x1ZGUKZmlsZSBpcyBkcm9wcGVkLgo+IAo+ID4gZHJtX2xlZ2FjeS5o
Cj4gPiAtIG5lZWRzIGRybV9tYXBfdHlwZSBhbmQgZHJtX21hcF9mbGFncy4gU2VlbXMgbGVnaXQu
Cj4gCj4gZW51bSBpbiB1YXBpLCBzd2VldCAobmV2ZXIgZG8gdGhpcywgaXQncyBub3QgcG9ydGFi
bGUgYWNyb3NzIGNvbXBpbGVycywKPiAjZGVmaW5lcyBhbGwgdGhlIHdheSkuIEJ1dCB5ZWFoIHNl
ZW1zIGxlZ2l0LCBwbHVzIHdlIGRvbid0IGNhcmUgYWJvdXQKPiBkcm1fbGVnYWN5LmgKQW5kIHRo
aXMgcGFydCBJIHdpbGwgaGFwcGlseSBpZ25vcmUuCk1heWJlIG9uZSBkYXkgSSB3aWxsIGNoZWNr
IHdoYXQgb3RoZXIgZGVwZW5kZW5jaWVzIHRoZXJlIGFyZS4KT24gYSByYWlueSBkYXkgb3Igd2hl
biB0aGVyZSBhcmUgbm8gbW9yZSB1c2VycyBvZiBkcm1QLmggb3Igc28uCgoJU2FtCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
