Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FB88A58B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 20:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D386E59C;
	Mon, 12 Aug 2019 18:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6828C6E59C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 18:20:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CC19B803BC;
 Mon, 12 Aug 2019 20:20:49 +0200 (CEST)
Date: Mon, 12 Aug 2019 20:20:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/4] drm/panel/ili9341: Support DPI panels
Message-ID: <20190812182048.GA6607@ravnborg.org>
References: <20190801135249.28803-1-noralf@tronnes.org>
 <20190801135249.28803-5-noralf@tronnes.org>
 <20190811164139.GB14660@ravnborg.org>
 <4b195dcc-1b78-2d4b-b309-17cf8761296a@tronnes.org>
 <20190812153542.GJ5006@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812153542.GJ5006@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=3E17--2Uet9rWMPD100A:9 a=wPNLvfGTeEIA:10
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
Cc: daniel.vetter@ffwll.ch, emil.l.velikov@gmail.com, josef@lusticky.cz,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC9Ob3JhbGYuCgpPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAwNjozNTo0MlBNICsw
MzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDAy
OjEzOjU0UE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiA+IERlbiAxMS4wOC4yMDE5
IDE4LjQxLCBza3JldiBTYW0gUmF2bmJvcmc6Cj4gPiA+IE9uIFRodSwgQXVnIDAxLCAyMDE5IGF0
IDAzOjUyOjQ5UE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiA+ID4+IEFkZCBzdXBw
b3J0IGZvciBwYW5lbHMgdGhhdCB1c2UgdGhlIERQSSBpbnRlcmZhY2UuCj4gPiA+PiBJTEk5MzQx
IGhhcyBvbmJvYXJkIFJBTSBzbyB0aGUgYXNzdW1wdGlvbiBtYWRlIGhlcmUgaXMgdGhhdCBhbGwg
c3VjaAo+ID4gPj4gcGFuZWxzIHN1cHBvcnQgcGl4ZWwgdXBsb2FkIG92ZXIgREJJLgo+ID4gPj4K
PiA+ID4+IFRoZSBwcmVzZW5jZS9hYnNlbnNlIG9mIHRoZSBEZXZpY2UgVHJlZSAncG9ydCcgbm9k
ZSBkZWNpZGVzIHdoaWNoCj4gPiA+PiBpbnRlcmZhY2UgaXMgdXNlZCBmb3IgcGl4ZWwgdHJhbnNm
ZXIuCj4gPiA+Cj4gPiA+IEhhdmUgeW91IGNvbnNpZXJlZCBpZiB0aGUgY29tcGF0aWJsZSBjb3Vs
ZCBiZSB1c2VkIHRvIGRldGVybWluZSB0aGUgdXNlCj4gPiA+IG9mIGEgcGFuZWw/IFRoZW4gaXQg
aXMgbW9yZSBleHBsaWNpdCBob3cgdGhlIEhXIGlzIGRlc2NyaWJlZCBpbiBEVC4KPiA+IAo+ID4g
SXMgdGhhdCBjb21tb24gdG8gdXNlIHRoZSBjb21wYXRpYmxlIHRvIHRlbGwgd2hpY2ggaW50ZXJm
YWNlIHRvIHVzZT8KPiA+IEkgZG9uJ3Qga25vdyB3aGF0IGJlc3QgcHJhY3RpY2UgaXMgaGVyZS4K
PiAKPiBVc3VhbGx5IHRoZSBjb21wYXRpYmxlIGlkZW50aWZpZXMgdGhlIGRldmljZSwgbm90IHRo
ZSBpbnRlcmZhY2UuCj4gQWRkaXRpb25hbCBwcm9wZXJ0aWVzIGFyZSBwcmVmZXJyZWQgdG8gZGVz
Y3JpYmUgdGhlIGludGVyZmFjZS4KVGhhbmtzIExhdXJlbnQuClRoZW4gdGhlIHBvcnRzIGlkZWEg
YXMgaW1wbG1lbnRlZCBieSB0aGUgcGF0Y2ggc2VlbXMgdG8gZmx5LgoKCVNhbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
