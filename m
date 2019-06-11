Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789D3C70D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 11:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22446890C5;
	Tue, 11 Jun 2019 09:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24289009;
 Tue, 11 Jun 2019 09:11:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 06814803F5;
 Tue, 11 Jun 2019 11:11:08 +0200 (CEST)
Date: Tue, 11 Jun 2019 11:11:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 01/10] drm: fix build errors with drm_print.h
Message-ID: <20190611091107.GA29656@ravnborg.org>
References: <20190609220757.10862-1-sam@ravnborg.org>
 <20190609220757.10862-2-sam@ravnborg.org>
 <20190611083911.GT21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611083911.GT21222@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=o786ZCjxpL7Azj8Xp1YA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=d3PnA9EDa4IxuAV0gXij:22
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6Mzk6MTFBTSArMDIwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAxMjowNzo0OEFNICsw
MjAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6Cj4gPiBkcm1fcHJpbnQuaCByZXF1aXJlcyA8ZHJtL2Ry
bS5oPiB0byBmaXggYnVpbGQgd2hlbiBtYWNyb3MgYXJlIHVzZWQuCj4gPiBQdWxsIGluIHRoZSBo
ZWFkZXIgZmlsZSBpbiBkcm1fcHJpbnQuaCBzbyB1c2VycyBkbyBub3QgaGF2ZSB0byBkbyBpdC4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+
ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5j
b20+Cj4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+
IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
ID4gLS0tCj4gPiAgaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCAyICsrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAo+ID4gaW5kZXggM2E0MjQ3MzE5
ZTYzLi5hNWQ2ZjJmM2U0MzAgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQu
aAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKPiA+IEBAIC0zMiw2ICszMiw4IEBA
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+Cj4gPiAgCj4gPiArI2luY2x1ZGUgPGRybS9kcm0uaD4KPiAKPiBXaGF0IGdvZXMgYm9v
bSB3aXRob3V0IHRoaXM/IE9ubHkgZHJtL2RybS5oIHRoYXQgSSBjb3VsZCBmaW5kIHdhcyB0aGUg
b25lCj4gaW4gdWFwaS9kcm0vZHJtLmgsIGFuZCB0aGF0IG9uZSBsb29rcyB2ZXJ5IGZpc2h5IHRv
IGluY2x1ZGUgZnJvbSBhbgo+IGludGVybmFsIGhlbHBlciBoZWFkZXIgbGlrZSBwcmludC5oLgoK
ZHJtX3ByaW50LmggdXNlcyBEUk1fTkFNRSAtIHdoaWNoIGlzIGRlZmluZWQgb25seSBpbiB1YXBp
L2RybS9kcm0uaC4KVGhlIGVycm9yIGlzIHNlZW4gd2hlbiB5b3UgaW5jbHVkZSBkcm1fcHJpbnQu
aCBhbmQgbm90IG11Y2ggb3RoZXIgZHJtCmhlYWRlciBmaWxlcy4KVGlkYXkgd2UgcmVseSBvbiBv
dGhlciBkcm0gaGVhZGVyIGZpbGVzIHRvIHB1bGwgaW4gZHJtLmguCgpOb3RpY2UgLSB0aGUgZXJy
b3Igb25seSBtYW5pZmVzdCBpdHNlbGYgd2hlbiB0aGUgbWFjcm9zIGFyZSB1c2VkLgpJbmNsdWRp
bmcgdGhlIGRybV9wcmludC5oIHdpbGwgbm90IGRvIGl0LgoKCVNhbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
