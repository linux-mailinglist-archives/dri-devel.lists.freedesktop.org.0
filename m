Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E01AD82
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 19:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A278954A;
	Sun, 12 May 2019 17:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA633892B0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:30:58 +0000 (UTC)
X-Originating-IP: 46.193.9.130
Received: from localhost (cust-west-pareq2-46-193-9-130.wb.wifirst.net
 [46.193.9.130]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2BB1B1C0004;
 Sun, 12 May 2019 17:30:54 +0000 (UTC)
Date: Sun, 12 May 2019 19:30:54 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 4/6] drm/fourcc: Pass the format_info pointer to
 drm_format_plane_cpp
Message-ID: <20190512173054.uj3thuvkgmllsy2n@flea>
References: <27b0041c7977402df4a087c78d2849ffe51c9f1c.1557486447.git-series.maxime.ripard@bootlin.com>
 <32aa13e53dbc98a90207fd290aa8e79f785fb11e.1557486447.git-series.maxime.ripard@bootlin.com>
 <20190510160031.GM24299@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510160031.GM24299@intel.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpPbiBGcmksIE1heSAxMCwgMjAxOSBhdCAwNzowMDozMVBNICswMzAwLCBWaWxs
ZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDE6MDg6NDlQTSAr
MDIwMCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiA+IFNvIGZhciwgdGhlIGRybV9mb3JtYXRfcGxh
bmVfY3BwIGZ1bmN0aW9uIHdhcyBvcGVyYXRpbmcgb24gdGhlIGZvcm1hdCdzCj4gPiBmb3VyY2Mg
YW5kIHdhcyBkb2luZyBhIGxvb2t1cCB0byByZXRyaWV2ZSB0aGUgZHJtX2Zvcm1hdF9pbmZvIHN0
cnVjdHVyZSBhbmQKPiA+IHJldHVybiB0aGUgY3BwLgo+ID4KPiA+IEhvd2V2ZXIsIHRoaXMgaXMg
aW5lZmZpY2llbnQgc2luY2UgaW4gbW9zdCBjYXNlcywgd2Ugd2lsbCBoYXZlIHRoZQo+ID4gZHJt
X2Zvcm1hdF9pbmZvIHBvaW50ZXIgYWxyZWFkeSBhdmFpbGFibGUgc28gd2Ugc2hvdWxkbid0IGhh
dmUgdG8gcGVyZm9ybSBhCj4gPiBuZXcgbG9va3VwLiBTb21lIGRybV9mb3VyY2MgZnVuY3Rpb25z
IGFsc28gYWxyZWFkeSBvcGVyYXRlIG9uIHRoZQo+ID4gZHJtX2Zvcm1hdF9pbmZvIHBvaW50ZXIg
Zm9yIHRoYXQgcmVhc29uLCBzbyB0aGUgQVBJIGlzIHF1aXRlIGluY29uc2lzdGVudAo+ID4gdGhl
cmUuCj4gPgo+ID4gTGV0J3MgZm9sbG93IHRoZSBsYXR0ZXIgcGF0dGVybiBhbmQgcmVtb3ZlIHRo
ZSBleHRyYSBsb29rdXAgd2hpbGUgYmVpbmcgYQo+ID4gYml0IG1vcmUgY29uc2lzdGVudC4gSW4g
b3JkZXIgdG8gYmUgZXh0cmEgY29uc2lzdGVudCwgYWxzbyByZW5hbWUgdGhhdAo+ID4gZnVuY3Rp
b24gdG8gZHJtX2Zvcm1hdF9pbmZvX3BsYW5lX2NwcCBhbmQgdG8gYSBzdGF0aWMgZnVuY3Rpb24g
aW4gdGhlCj4gPiBoZWFkZXIgdG8gbWF0Y2ggdGhlIGN1cnJlbnQgcG9saWN5Lgo+Cj4gSXMgdGhl
cmUgYW55IHBvaW50IGtlZXBpbmcgdGhlIGZ1bmN0aW9uIGF0IGFsbD8KPiBJdCdzIGp1c3QgaW5m
by0+Y3BwW2ldIG5vPwoKWW91J3JlIHJpZ2h0LCB3ZSBjYW4gcmVtb3ZlIGl0LgoKRG8geW91IHdh
bnQgdGhpcyB0byBiZSBkb25lIGluIHRoYXQgcGF0Y2ggb3IgYSBzdWJzZXF1ZW50IG9uZT8KCk1h
eGltZQoKLS0KTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
