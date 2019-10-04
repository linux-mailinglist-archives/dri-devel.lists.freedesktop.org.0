Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A94CB4C1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3641A6EAA9;
	Fri,  4 Oct 2019 07:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459FF6EAA9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:02:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55CAB2E5;
 Fri,  4 Oct 2019 09:02:44 +0200 (CEST)
Date: Fri, 4 Oct 2019 10:02:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yizhuo <yzhai003@ucr.edu>
Subject: Re: [PATCH] drm/bridge: sii902x: Variable status in
 sii902x_connector_detect() could be uninitialized if regmap_read() fails
Message-ID: <20190930231948.GB10149@pendragon.ideasonboard.com>
References: <20190930044502.18734-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930044502.18734-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570172565;
 bh=zrmGFbzG/xfE9YuhXNxnTY76RKJI2smtQphq1F+z+qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OsTRP76d6DshPuBsb+yJthu1LXvQRz2gJ/DeNpO+FRr80VEQBegUxgXQB/Xk4XNA7
 Z2Oa1uF1bX19rXANY+O6G5WWa1svRYuun46yNIarOMkrP1BziraQjA+ePnMcjxX9Wv
 CQh80E7fSvDHK7yJ3klcIw+WS5aefuRxP9r9JWiA=
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
Cc: csong@cs.ucr.edu, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, zhiyunq@cs.ucr.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWl6aHVvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBTdW4sIFNlcCAyOSwgMjAx
OSBhdCAwOTo0NTowMlBNIC0wNzAwLCBZaXpodW8gd3JvdGU6Cj4gSW4gZnVuY3Rpb24gc2lpOTAy
eF9jb25uZWN0b3JfZGV0ZWN0KCksIHZhcmlhYmxlICJzdGF0dXMiIGNvdWxkIGJlCj4gaW5pdGlh
bGl6ZWQgaWYgcmVnbWFwX3JlYWQoKSBmYWlscy4gSG93ZXZlciwgInN0YXR1cyIgaXMgdXNlZCB0
bwoKSSBhc3N1bWUgeW91IG1lYW50ICJjb3VsZCBiZSB1bmluaXRpYWxpemVkIiA/Cgo+IGRlY2lk
ZSB0aGUgcmV0dXJuIHZhbHVlLCB3aGljaCBpcyBwb3RlbnRpYWxseSB1bnNhZmUuCj4gCj4gU2ln
bmVkLW9mZi1ieTogWWl6aHVvIDx5emhhaTAwM0B1Y3IuZWR1Pgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBpbmRl
eCAzOGY3NWFjNTgwZGYuLmFmY2U2NGY1MWZmMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3NpaTkwMnguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAy
eC5jCj4gQEAgLTI0Niw3ICsyNDYsNyBAQCBzdGF0aWMgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1
cwo+ICBzaWk5MDJ4X2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwgYm9vbCBmb3JjZSkKPiAgewo+ICAJc3RydWN0IHNpaTkwMnggKnNpaTkwMnggPSBjb25u
ZWN0b3JfdG9fc2lpOTAyeChjb25uZWN0b3IpOwo+IC0JdW5zaWduZWQgaW50IHN0YXR1czsKPiAr
CXVuc2lnbmVkIGludCBzdGF0dXMgPSAwOwo+ICAKPiAgCW11dGV4X2xvY2soJnNpaTkwMngtPm11
dGV4KTsKCkknbGwgYWRkIGEgYml0IG1vcmUgY29udGV4dDoKCj4gCXJlZ21hcF9yZWFkKHNpaTkw
MngtPnJlZ21hcCwgU0lJOTAyWF9JTlRfU1RBVFVTLCAmc3RhdHVzKTsKPgo+IAltdXRleF91bmxv
Y2soJnNpaTkwMngtPm11dGV4KTsKPgo+IAlyZXR1cm4gKHN0YXR1cyAmIFNJSTkwMlhfUExVR0dF
RF9TVEFUVVMpID8KPiAJICAgICAgIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkIDogY29ubmVj
dG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7CgpJZiByZWdtYXAgcmVhZCBmYWlscywgc2hvdWxkbid0
IHdlIHJldHVybiBjb25uZWN0b3Jfc3RhdHVzX3Vua25vd24gPwoKLS0gClJlZ2FyZHMsCgpMYXVy
ZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
