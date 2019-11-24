Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98910827F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 08:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53DD6E0F5;
	Sun, 24 Nov 2019 07:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CAC6E0F2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 07:50:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2766728DBA0;
 Sun, 24 Nov 2019 07:50:11 +0000 (GMT)
Date: Sun, 24 Nov 2019 08:50:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 09/21] drm/bridge: Add a drm_bridge_state object
Message-ID: <20191124085008.7f871adc@collabora.com>
In-Reply-To: <6e60e98e-46b2-a979-511e-4717bc6feadc@baylibre.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-10-boris.brezillon@collabora.com>
 <6e60e98e-46b2-a979-511e-4717bc6feadc@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA1IE5vdiAyMDE5IDE3OjA1OjE2ICswMTAwCk5laWwgQXJtc3Ryb25nIDxuYXJtc3Ry
b25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+ID4gIHZvaWQgZHJtX2JyaWRnZV9hZGQoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSk7Cj4gPiAgdm9pZCBkcm1fYnJpZGdlX3JlbW92ZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiA+ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqb2ZfZHJtX2ZpbmRf
YnJpZGdlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApOwo+ID4gQEAgLTQ3NSw2ICs1NDMsNTYgQEAg
dm9pZCBkcm1fYXRvbWljX2JyaWRnZV9jaGFpbl9wcmVfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdl
ICpicmlkZ2UsCj4gPiAgdm9pZCBkcm1fYXRvbWljX2JyaWRnZV9jaGFpbl9lbmFibGUoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwKPiA+ICAJCQkJICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSk7Cj4gPiAgCj4gPiArdm9pZCBfX2RybV9hdG9taWNfaGVscGVyX2JyaWRnZV9yZXNl
dChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gKwkJCQkgICAgICBzdHJ1Y3QgZHJtX2Jy
aWRnZV9zdGF0ZSAqc3RhdGUpOwo+ID4gK3N0cnVjdCBkcm1fYnJpZGdlX3N0YXRlICoKPiA+ICtk
cm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfcmVzZXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7
Cj4gPiArdm9pZCBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfZGVzdHJveV9zdGF0ZShzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlLAo+ID4gKwkJCQkJICAgIHN0cnVjdCBkcm1fYnJpZGdlX3N0YXRl
ICpzdGF0ZSk7Cj4gPiArdm9pZCBfX2RybV9hdG9taWNfaGVscGVyX2JyaWRnZV9kdXBsaWNhdGVf
c3RhdGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiA+ICsJCQkJCQlzdHJ1Y3QgZHJtX2Jy
aWRnZV9zdGF0ZSAqbmV3KTsKPiA+ICtzdHJ1Y3QgZHJtX2JyaWRnZV9zdGF0ZSAqCj4gPiArZHJt
X2F0b21pY19oZWxwZXJfYnJpZGdlX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKTsKPiA+ICsKPiA+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fYnJpZGdlX3N0YXRl
ICoKPiA+ICtkcm1fYXRvbWljX2dldF9icmlkZ2Vfc3RhdGUoc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLAo+ID4gKwkJCSAgICBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ID4gK3sK
PiA+ICsJc3RydWN0IGRybV9wcml2YXRlX3N0YXRlICpvYmpfc3RhdGU7Cj4gPiArCj4gPiArCW9i
al9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X3ByaXZhdGVfb2JqX3N0YXRlKHN0YXRlLCAmYnJpZGdl
LT5iYXNlKTsKPiA+ICsJaWYgKCFvYmpfc3RhdGUpCj4gPiArCQlyZXR1cm4gTlVMTDsgIAo+IAo+
IGRybV9hdG9taWNfZ2V0X3ByaXZhdGVfb2JqX3N0YXRlIHdpbGwgcmV0dXJuIGFuIGVycm9yIG9i
amVjdCBvbiBlcnJvciwgc28gc2hvdWxkIGJlOgo+IAlpZiAoSVNfRVJSKG9ial9zdGF0ZSkpCj4g
ICAgICAgICAgICAgICByZXR1cm4gRVJSX0NBU1Qob2JqX3N0YXRlKTsKClJpZ2h0LCBJJ2xsIGZp
eCBpdCBpbiB2NC4KClRoYW5rcywKCkJvcmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
