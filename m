Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCD36383
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D538959D;
	Wed,  5 Jun 2019 18:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BA88959D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 18:45:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2A2DF200F9;
 Wed,  5 Jun 2019 20:45:55 +0200 (CEST)
Date: Wed, 5 Jun 2019 20:45:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 2/2] drm/r128: drop use of drmP.h
Message-ID: <20190605184553.GA30763@ravnborg.org>
References: <20190605141321.17819-1-sam@ravnborg.org>
 <20190605141321.17819-3-sam@ravnborg.org>
 <20190605164744.GX21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605164744.GX21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=ZCM2Z_Q9WSBPggbZm4sA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDY6NDc6NDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwNDoxMzoyMVBNICswMjAwLCBTYW0gUmF2
bmJvcmcgd3JvdGU6Cj4gPiBEcm9wIHVzZSBvZiB0aGUgZGVwcmVjYXRlZCBkcm1QLmggaGVhZGVy
IGZpbGUuCj4gPiBSZXBsYWNlIGl0IHdpdGggcmVsZXZhbnQgaW5jbHVkZSBmaWxlcy4KPiA+IFNv
cnQgaW5jbHVkZSBmaWxlcyBpbiBmaWxlcyB0b3VjaGVkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiAKPiBPbiBib3RoIHBhdGNoZXM6Cj4gCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClRoYW5rcywKcHVzaGVkIHRvIGRybS1taXNjLW5leHQuCgoK
U3RpbGwgYSBsb25nIHdheSB0byBnbzoKJCBjZCBkcml2ZXJzL2dwdS9kcm0KJCBnaXQgZ3JlcCBk
cm1QIHwgd2MgLWwKNDkyCgpTbyB3aG8gaXMgaXQgdGhhdCB0b2RheSB1c2VzIGRybVAgLSBsaXN0
IHRoZSAxNSBsYXJnZXN0IHVzZXJzOgooVGhlcmUgYXJlIGxpa2VseSBzbWFydGVyIHdheXMgdG8g
Y291bnQgaXQsIGJ1dCB0aGlzIHdvcmtzIGZvciBtZSkKJCBnaXQgZ3JlcCBkcm1QIHwgY3V0IC1k
ICcvJyAtZiAxIHwgdW5pcSAtYyB8IHNvcnQgLW4gfCB0YWlsIC1uIDE1CiAgICAgIDggYXJtCiAg
ICAgIDggdmlhCiAgICAgIDggeGVuCiAgICAgIDkgdWRsCiAgICAgMTAgdmlydGlvCiAgICAgMTEg
bWVzb24KICAgICAxMiBtZWRpYXRlawogICAgIDEzIHZtd2dmeAogICAgIDE1IHJvY2tjaGlwCiAg
ICAgMTYgc3RpCiAgICAgMTggc3VuNGkKICAgICAyNCBleHlub3MKICAgICAyNyBub3V2ZWF1CiAg
ICAxMDMgcmFkZW9uCiAgICAxMTAgYW1kCgpub3V2ZWF1IGlzIGFscmVhZHkgZG9uZSwgcGVuZGlu
ZyBtZXJnZSBmcm9tIHRoZWlyIHRyZWUuCnN0aSBhbmQgZXh5bm9zIGF3YWl0cyByZXZpZXcgZmVl
ZGJhY2suIFNvIHRoaXMgaXMgYW5vdGhlciA2NyB1c2VzIGdvbmUuCgpXaGVuIGluc2FuaXR5IGhp
dHMgbWUgYWdhaW4gSSB3aWxsIHRyeSB0byBmb2N1cyBvbiB0aGUgdW5tYWludGFpbmVkCnBhcnRz
LiBBc3N1bWluZyBzb21lb25lIGVsc2UgY2FyZSBhYm91dCB0aGUgbWFpbnRhaW5lZCBwYXJ0cyBh
bmQgd2lsbApmb2xsb3cgdGhlIGV4YW1wbGUuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
