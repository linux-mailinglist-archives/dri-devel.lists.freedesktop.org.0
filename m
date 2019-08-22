Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1E98CD8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C784C892FD;
	Thu, 22 Aug 2019 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC96EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 08:04:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3D5DC28AE14;
 Thu, 22 Aug 2019 09:04:28 +0100 (BST)
Date: Thu, 22 Aug 2019 10:04:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RFC 13/19] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Message-ID: <20190822100425.60020b22@collabora.com>
In-Reply-To: <20190822001732.GD16985@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-14-boris.brezillon@collabora.com>
 <20190822001732.GD16985@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMiBBdWcgMjAxOSAwMzoxNzozMiArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywKPiAKPiBU
aGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAKPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwNTox
MTo0NFBNICswMjAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBXaWxsIGJlIHVzZWZ1bCBm
b3IgYnJpZGdlIGRyaXZlcnMgdGhhdCB3YW50IHRvIGRvIGJ1cyBmb3JtYXQKPiA+IG5lZ290aWF0
aW9uIHdpdGggdGhlaXIgbmVpZ2hib3Vycy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gPiAg
aW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICB8ICAyICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2JyaWRnZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+ID4gaW5kZXggZGNh
ZDY2MWRhYTc0Li45ZWZiMjcwODdlNzAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2JyaWRnZS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gPiBA
QCAtMjcxLDYgKzI3MSwyNSBAQCBkcm1fYnJpZGdlX2NoYWluX2dldF9uZXh0X2JyaWRnZShzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9icmlk
Z2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKTsKPiA+ICAKPiA+ICsvKioKPiA+ICsgKiBkcm1fYnJp
ZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZSgpIC0gR2V0IHRoZSBwcmV2aW91cyBicmlkZ2UgaW4g
dGhlIGNoYWluCj4gPiArICogQGJyaWRnZTogYnJpZGdlIG9iamVjdAo+ID4gKyAqCj4gPiArICog
UkVUVVJOUzoKPiA+ICsgKiB0aGUgcHJldmlvdXMgYnJpZGdlIGluIHRoZSBjaGFpbiwgb3IgTlVM
TCBpZiB0aGVyZSdzIEBicmlkZ2UgaXMgdGhlCj4gPiArICogbGFzdC4gIAo+IAo+IERpZCB5b3Ug
bWVhbiAiaWYgdGhlIEBicmlkZ2UgaXMgdGhlIGZpcnN0IiA/CgpZZXMsIHNvcnJ5IGFib3V0IHRo
YXQsIEkgbWVhbnQgImlmIEBicmlkZ2UgaXMgdGhlIGZpcnN0IiwgaW5kZWVkLgoKPiAKPiA+ICsg
Ki8KPiA+ICtzdHJ1Y3QgZHJtX2JyaWRnZSAqCj4gPiArZHJtX2JyaWRnZV9jaGFpbl9nZXRfcHJl
dl9icmlkZ2Uoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiA+ICt7Cj4gPiArCWlmICghYnJp
ZGdlIHx8ICFicmlkZ2UtPmVuY29kZXIgfHwgIAo+IAo+IERvIHdlIHJlYWxseSBuZWVkIHRvIHBy
b3RlY3QgYWdhaW5zdCAhYnJpZGdlIGFuZCAhYnJpZGdlLT5lbmNvZGVyLCBjYW4KPiB0aGF0IGhh
cHBlbiA/CgpNYXliZSBub3QuCgo+IEVzcGVjaWFsbHkgIWJyaWRnZSwgYXJlIHRoZXJlIHVzZSBj
YXNlcyBmb3IgcG90ZW50aWFsbHkKPiBjYWxsaW5nIHRoaXMgZnVuY3Rpb24gKGFuZCB0aGUgb3Ro
ZXIgbGlzdCB0cmF2ZXJzYWwgaGVscGVycyBpbiB5b3VyCj4gcHJldmlvdXMgcGF0Y2hlcykgd2l0
aCBhIE5VTEwgYnJpZGdlID8KCkkgdGhpbmsgdGhpcyBjaGVja3Mgd2FzIGRvbmUgd2hlbiBicmlk
Z2UgaXRlcmF0aW9uIHdhcyBiYXNlZCBvbgpyZWN1cnNpdml0eSwgd2hpY2ggaXMgbm8gbG9uZ2Vy
IHRoZSBjYXNlLgoKPiAKPiA+ICsJICAgIGxpc3RfaXNfZmlyc3QoJmJyaWRnZS0+ZW5jb2Rlci0+
YnJpZGdlX2NoYWluLCAmYnJpZGdlLT5jaGFpbl9ub2RlKSkKPiA+ICsgICAgICAgICAgICAgICAg
cmV0dXJuIE5VTEw7Cj4gPiArCj4gPiArCXJldHVybiBsaXN0X3ByZXZfZW50cnkoYnJpZGdlLCBj
aGFpbl9ub2RlKTsKPiA+ICt9Cj4gPiArRVhQT1JUX1NZTUJPTChkcm1fYnJpZGdlX2NoYWluX2dl
dF9wcmV2X2JyaWRnZSk7Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogRE9DOiBicmlkZ2UgY2FsbGJh
Y2tzCj4gPiAgICoKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggYi9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+IGluZGV4IDVkOGZlMzcwOWJkZS4uMmY2OWFkYjdi
MGYzIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCj4gPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiA+IEBAIC00ODUsNiArNDg1LDggQEAgc3RydWN0IGRy
bV9icmlkZ2UgKgo+ID4gIGRybV9icmlkZ2VfY2hhaW5fZ2V0X2xhc3RfYnJpZGdlKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2Rlcik7Cj4gPiAgc3RydWN0IGRybV9icmlkZ2UgKgo+ID4gIGRybV9i
cmlkZ2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpOwo+
ID4gK3N0cnVjdCBkcm1fYnJpZGdlICoKPiA+ICtkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2Jy
aWRnZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiA+ICBib29sIGRybV9icmlkZ2VfY2hh
aW5fbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gPiAgCQkJCSBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiA+ICAJCQkJIHN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlICphZGp1c3RlZF9tb2RlKTsgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
