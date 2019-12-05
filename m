Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8376411417F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ADB6E112;
	Thu,  5 Dec 2019 13:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA9E6E112
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:33:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AE2B2E5;
 Thu,  5 Dec 2019 14:33:17 +0100 (CET)
Date: Thu, 5 Dec 2019 15:33:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 18/28] drm/bridge: thc63: Use drm_bridge_init()
Message-ID: <20191205133310.GE16034@pendragon.ideasonboard.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-19-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-19-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575552797;
 bh=CM/D7ImuDda2Rno8YpyzWs+w1xLm2R0xK+5mrlUzuag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LcsEQV1+tNRZ8+JNpWuKyv2NVE95IXgah30yaQpfG55D04a4e5y5hjCIrQ4DnI0gl
 XkhhLhOfqjV+57w7t/Gsn5SGbZOv3qrahwvr1p341yaLFe/CFS7rL0fqvIneZqiSOj
 Rdb9Kt1k2+7O0+J+TaGmQtBTrD617A6k/GDE513A=
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIERlYyAwNCwgMjAx
OSBhdCAxMTo0ODoxOEFNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFp
bC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2
M2x2ZDEwMjQuYyB8IDcgKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RoYzYzbHZkMTAyNC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYwo+
IGluZGV4IDNkNzQxMjliMjk5NS4uYWJlODA2ZGI1ZjRkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGhjNjNsdmQxMDI0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RoYzYzbHZkMTAyNC5jCj4gQEAgLTIxOCwxMSArMjE4LDggQEAgc3RhdGljIGludCB0aGM2
M19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKHJldCkKPiAgCQly
ZXR1cm4gcmV0Owo+ICAKPiAtCXRoYzYzLT5icmlkZ2UuZHJpdmVyX3ByaXZhdGUgPSB0aGM2MzsK
PiAtCXRoYzYzLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOwo+IC0JdGhjNjMt
PmJyaWRnZS5mdW5jcyA9ICZ0aGM2M19icmlkZ2VfZnVuYzsKPiAtCXRoYzYzLT5icmlkZ2UudGlt
aW5ncyA9ICZ0aGM2My0+dGltaW5nczsKPiAtCj4gKwlkcm1fYnJpZGdlX2luaXQoJnRoYzYzLT5i
cmlkZ2UsICZwZGV2LT5kZXYsICZ0aGM2M19icmlkZ2VfZnVuYywKPiArCQkJJnRoYzYzLT50aW1p
bmdzLCB0aGM2Myk7CgpJIHRoaW5rIGRyaXZlcl9wcml2YXRlIGlzIHVudXNlZCwgc28gdGhlIGxh
c3QgYXJndW1lbnQgY2FuIGJlIE5VTEwuCgo+ICAJZHJtX2JyaWRnZV9hZGQoJnRoYzYzLT5icmlk
Z2UpOwo+ICAKPiAgCXJldHVybiAwOwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
