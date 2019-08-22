Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A698869
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 02:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6F6E3DA;
	Thu, 22 Aug 2019 00:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005056E3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 00:17:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCF8C2DF;
 Thu, 22 Aug 2019 02:17:38 +0200 (CEST)
Date: Thu, 22 Aug 2019 03:17:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH RFC 13/19] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Message-ID: <20190822001732.GD16985@pendragon.ideasonboard.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
 <20190808151150.16336-14-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808151150.16336-14-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566433058;
 bh=gDaZi1YIdQJbec2Wtw8z75B+gKhC6erbu0QD/p/St1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KpXV5GBlyeiEq+PrvDqp4/0V7+7CefoG17HbCKC+NlvArlszJwFfaEEZBhe6rpw10
 hptqerqIqYebjLYH3pQf5cnHErzIq2iU0K1PpYdco5egGYQy6PUXPTK7/7PRaHLqaJ
 UWzPbuOxeDZ+KnNMiZQyi1UGHgg3GEpkgpGWRpi8=
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

SGkgQm9yaXMsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFRodSwgQXVnIDA4LCAyMDE5
IGF0IDA1OjExOjQ0UE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiBXaWxsIGJlIHVz
ZWZ1bCBmb3IgYnJpZGdlIGRyaXZlcnMgdGhhdCB3YW50IHRvIGRvIGJ1cyBmb3JtYXQKPiBuZWdv
dGlhdGlvbiB3aXRoIHRoZWlyIG5laWdoYm91cnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVk
ZS9kcm0vZHJtX2JyaWRnZS5oICAgICB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+IGluZGV4IGRjYWQ2NjFkYWE3NC4uOWVm
YjI3MDg3ZTcwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gQEAgLTI3MSw2ICsyNzEsMjUgQEAg
ZHJtX2JyaWRnZV9jaGFpbl9nZXRfbmV4dF9icmlkZ2Uoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9icmlkZ2VfY2hhaW5fZ2V0X25leHRfYnJpZGdl
KTsKPiAgCj4gKy8qKgo+ICsgKiBkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZSgpIC0g
R2V0IHRoZSBwcmV2aW91cyBicmlkZ2UgaW4gdGhlIGNoYWluCj4gKyAqIEBicmlkZ2U6IGJyaWRn
ZSBvYmplY3QKPiArICoKPiArICogUkVUVVJOUzoKPiArICogdGhlIHByZXZpb3VzIGJyaWRnZSBp
biB0aGUgY2hhaW4sIG9yIE5VTEwgaWYgdGhlcmUncyBAYnJpZGdlIGlzIHRoZQo+ICsgKiBsYXN0
LgoKRGlkIHlvdSBtZWFuICJpZiB0aGUgQGJyaWRnZSBpcyB0aGUgZmlyc3QiID8KCj4gKyAqLwo+
ICtzdHJ1Y3QgZHJtX2JyaWRnZSAqCj4gK2RybV9icmlkZ2VfY2hhaW5fZ2V0X3ByZXZfYnJpZGdl
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gK3sKPiArCWlmICghYnJpZGdlIHx8ICFicmlk
Z2UtPmVuY29kZXIgfHwKCkRvIHdlIHJlYWxseSBuZWVkIHRvIHByb3RlY3QgYWdhaW5zdCAhYnJp
ZGdlIGFuZCAhYnJpZGdlLT5lbmNvZGVyLCBjYW4KdGhhdCBoYXBwZW4gPyBFc3BlY2lhbGx5ICFi
cmlkZ2UsIGFyZSB0aGVyZSB1c2UgY2FzZXMgZm9yIHBvdGVudGlhbGx5CmNhbGxpbmcgdGhpcyBm
dW5jdGlvbiAoYW5kIHRoZSBvdGhlciBsaXN0IHRyYXZlcnNhbCBoZWxwZXJzIGluIHlvdXIKcHJl
dmlvdXMgcGF0Y2hlcykgd2l0aCBhIE5VTEwgYnJpZGdlID8KCj4gKwkgICAgbGlzdF9pc19maXJz
dCgmYnJpZGdlLT5lbmNvZGVyLT5icmlkZ2VfY2hhaW4sICZicmlkZ2UtPmNoYWluX25vZGUpKQo+
ICsgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsJcmV0dXJuIGxpc3RfcHJldl9l
bnRyeShicmlkZ2UsIGNoYWluX25vZGUpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX2JyaWRn
ZV9jaGFpbl9nZXRfcHJldl9icmlkZ2UpOwo+ICsKPiAgLyoqCj4gICAqIERPQzogYnJpZGdlIGNh
bGxiYWNrcwo+ICAgKgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggYi9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBpbmRleCA1ZDhmZTM3MDliZGUuLjJmNjlhZGI3YjBm
MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiArKysgYi9pbmNsdWRl
L2RybS9kcm1fYnJpZGdlLmgKPiBAQCAtNDg1LDYgKzQ4NSw4IEBAIHN0cnVjdCBkcm1fYnJpZGdl
ICoKPiAgZHJtX2JyaWRnZV9jaGFpbl9nZXRfbGFzdF9icmlkZ2Uoc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyKTsKPiAgc3RydWN0IGRybV9icmlkZ2UgKgo+ICBkcm1fYnJpZGdlX2NoYWluX2dl
dF9uZXh0X2JyaWRnZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiArc3RydWN0IGRybV9i
cmlkZ2UgKgo+ICtkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZShzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlKTsKPiAgYm9vbCBkcm1fYnJpZGdlX2NoYWluX21vZGVfZml4dXAoc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyLAo+ICAJCQkJIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlICptb2RlLAo+ICAJCQkJIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2Rl
KTsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
