Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA97E38963
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEA289958;
	Fri,  7 Jun 2019 11:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2738789958
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:51:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA11FB91;
 Fri,  7 Jun 2019 13:51:30 +0200 (CEST)
Date: Fri, 7 Jun 2019 14:51:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 17/20] drm: rcar-du: crtc: Enable and disable CMMs
Message-ID: <20190607115116.GF7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-18-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-18-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559908290;
 bh=DIOoy9wgvhZ1Td5HDm9OqAdDcaAPB6MLeqCIuaVKhwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MNBs+tJzO6AkMubhk7oEyQE+Z9PTbVDop+9d30BoJLaX3r8M9w7vX6v+J377uGttH
 4nJ71FPWWKPnB7Ob3tZgRmlmVcNmSsaBe+FRblLYo+6GNzjHAVJT2/ctPxJO5ms6OL
 YC/wo2X2yB7H5zJVC6JJCeAvDRLFudGAG0flMYFs=
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
Cc: muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBUaHUsIEp1biAwNiwgMjAx
OSBhdCAwNDoyMjoxN1BNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gRW5hYmxlL2Rpc2Fi
bGUgdGhlIENNTSBhc3NvY2lhdGVkIHdpdGggYSBDUlRDIGF0Cj4gYXRvbWljX2VuYWJsZSgpL2F0
b21pY19kaXNhYmxlKCkgdGltZS4KCkkgd291bGQgc3F1YXNoIHRoaXMgcGF0Y2ggd2l0aCB0aGUg
bmV4dCAzLiBJdCdzIGhhcmQgdG8gcmV2aWV3IHRoZW0KaW5kZXBlbmRlbnRseS4KCj4gU2lnbmVk
LW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyB8IDggKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfY3J0Yy5jCj4gaW5kZXggOWYyNzBhNTRiMTY0Li5lNmQzZGYzN2M4MjcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYwo+IEBAIC0yMSw2ICsyMSw3IEBA
Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV92YmxhbmsuaD4KPiAgCj4gKyNpbmNsdWRlICJyY2FyX2NtbS5oIgo+ICAjaW5jbHVkZSAicmNh
cl9kdV9jcnRjLmgiCj4gICNpbmNsdWRlICJyY2FyX2R1X2Rydi5oIgo+ICAjaW5jbHVkZSAicmNh
cl9kdV9lbmNvZGVyLmgiCj4gQEAgLTUyMyw2ICs1MjQsNyBAQCBzdGF0aWMgaW50IHJjYXJfZHVf
Y3J0Y19nZXQoc3RydWN0IHJjYXJfZHVfY3J0YyAqcmNydGMpCj4gIAkJZ290byBlcnJvcl9ncm91
cDsKPiAgCj4gIAlyY2FyX2R1X2NydGNfc2V0dXAocmNydGMpOwo+ICsKClVucmVsYXRlZCBjaGFu
Z2UgPwoKPiAgCXJjcnRjLT5pbml0aWFsaXplZCA9IHRydWU7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4g
QEAgLTYxOSw2ICs2MjEsOSBAQCBzdGF0aWMgdm9pZCByY2FyX2R1X2NydGNfc3RvcChzdHJ1Y3Qg
cmNhcl9kdV9jcnRjICpyY3J0YykKPiAgCWlmIChyY2FyX2R1X2hhcyhyY3J0Yy0+ZGV2LCBSQ0FS
X0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UpKQo+ICAJCXJjYXJfZHVfdnNwX2Rpc2FibGUocmNydGMp
Owo+ICAKPiArCWlmIChyY2FyX2R1X2hhcyhyY3J0Yy0+ZGV2LCBSQ0FSX0RVX0ZFQVRVUkVfQ01N
KSAmJiByY3J0Yy0+Y21tKQoKWW91IGNhbiBqdXN0IHRlc3QgcmNydGMtPmNtbS4gU2FtZSBiZWxv
dy4KCj4gKwkJcmNhcl9jbW1fZGlzYWJsZShyY3J0Yy0+Y21tKTsKPiArCj4gIAkvKgo+ICAJICog
U2VsZWN0IHN3aXRjaCBzeW5jIG1vZGUuIFRoaXMgc3RvcHMgZGlzcGxheSBvcGVyYXRpb24gYW5k
IGNvbmZpZ3VyZXMKPiAgCSAqIHRoZSBIU1lOQyBhbmQgVlNZTkMgc2lnbmFscyBhcyBpbnB1dHMu
Cj4gQEAgLTY4Niw2ICs2OTEsOSBAQCBzdGF0aWMgdm9pZCByY2FyX2R1X2NydGNfYXRvbWljX2Vu
YWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIAl9Cj4gIAo+ICAJcmNhcl9kdV9jcnRjX3N0
YXJ0KHJjcnRjKTsKPiArCj4gKwlpZiAocmNhcl9kdV9oYXMocmNydGMtPmRldiwgUkNBUl9EVV9G
RUFUVVJFX0NNTSkgJiYgcmNydGMtPmNtbSkKPiArCQlyY2FyX2NtbV9lbmFibGUocmNydGMtPmNt
bSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIHJjYXJfZHVfY3J0Y19hdG9taWNfZGlzYWJsZShz
dHJ1Y3QgZHJtX2NydGMgKmNydGMsCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
