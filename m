Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4894F73705
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 20:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24216E621;
	Wed, 24 Jul 2019 18:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB996E621
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:53:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8DB608061A;
 Wed, 24 Jul 2019 20:53:30 +0200 (CEST)
Date: Wed, 24 Jul 2019 20:53:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] RTF: drm/panel: simple: Add TI nspire panels
Message-ID: <20190724185329.GB22640@ravnborg.org>
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-3-linus.walleij@linaro.org>
 <20190723175445.GA23588@ravnborg.org>
 <CACRpkdYmO=fBj3MFoQdLrEgA05BLZR3tNv9WhqjLeJ0R0cdDbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYmO=fBj3MFoQdLrEgA05BLZR3tNv9WhqjLeJ0R0cdDbQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=jZMA-zlA99eSfViNHAoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMuCgpPbiBXZWQsIEp1bCAyNCwgMjAxOSBhdCAwMzo1ODo0MFBNICswMjAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+IEhpIFNhbSwKPiAKPiBmaXhlZCBtb3N0IHRoaW5ncywgb25lIHF1
ZXN0aW9uIHJlbWFpbjoKPiAKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCA3OjU0IFBNIFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4gd3JvdGU6Cj4gCj4gPiBGdXJ0aGVybW9yZSBJIGRp
ZCBub3Qgc2VlIGFueSBiaW5kaW5ncyBmb3IgdGhlIHBhbmVscy4KPiA+IElmIHRoZXkgaW5kZWVk
IGFyZSBtaXNzaW5nLCB0aGVuIHBsZWFzZSBwcm92aWRlIGJpbmRpbmdzIGluIHRoZSB5YW1sCj4g
PiBmb3JtYXQuCj4gCj4gSUlVQyB3ZSBkbyBub3QgY3JlYXRlIGJpbmRpbmcgZG9jdW1lbnRzIGZv
ciB0aGUgc2ltcGxlIHBhbmVscywKPiBidXQgSSBjYW4gZG8gdGhpcyBvZiBjb3Vyc2UsIGp1c3Qg
dmFndWVseSByZW1lbWJlciB0aGF0IHRoZSBEVAo+IHBlb3BsZSBkaWRuJ3Qgd2FudCB0byBzZWUg
YmluZGluZ3MgdGhhdCBhbGwgbG9vayB0aGUgc2FtZQo+IGJ1dCBpbnN0ZWFkIHJlbHkgb24gcGFu
ZWwtY29tbW9uLnR4dAoKTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSBiaW5kaW5ncyBmb3Ig
dGggcGFuZWxzIHNob3VsZCBsaXN0IHdoYXQgaXMKcmVxdWlyZWQvb3B0aW9uYWwsIGJ1dCB3aXRo
IHJlZmVyZW5jZSB0byBwYW5lbC1jb21tb24gKHdoaWNoIElJUkMgaGFzIGEKbmV3IG5hbWUgaW4g
dGhlIHlhbWwgd29ybGQpLgpJZiB5b3UgbG9vayBpbiBiaW5kaW5ncy9kaXNwbGF5L3BhbmVscyB5
b3UgY2FuIHNlZSBhIGxvdCBvZiBzaW1wbGUKcGFuZWxzIGxpc3RlZC4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
