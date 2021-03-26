Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0763E34A276
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 08:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AD76E15E;
	Fri, 26 Mar 2021 07:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4CA6E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 07:21:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36E3F61A18;
 Fri, 26 Mar 2021 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616743308;
 bh=BGRR36ccL5GWDF9Q8BHWhizHme3WDeUjirfIggnlBuI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ebh89u+11fnx6NG2uVsb/Hj3RD4LGwa+KuDvP4sslHy+3DWXdhts5u9rSgJek1ag0
 CQa3VMlMqVABdlLTwPjyL+38ovR1eZFQIVN00+te9FQqzpN9n4pOzjqAadOeKiumYm
 gK5wYLOIXsXYWkyRsU9PxIhc1cmIQqv8zZ/XZN2XiBGK1ISsMIuy2JWsNEL9yuXbvC
 v7fPT1v3aVJJj/+QqBnQrQpDAr4zoVAsW2Lc0tP7zGqRgKg6gyYEBPedzSH35N6D7Z
 dV3JFwr1hLLkXAMTkRwuvuR1A0RHYP1U7REKhpRQyY2z3CBwVNS2abdZWdkhUG0RNd
 pttvD1/2zejXA==
Subject: Re: [PATCH] drm/omap: fix misleading indentation in pixinc()
To: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210322164203.827324-1-arnd@kernel.org>
From: Tomi Valkeinen <tomba@kernel.org>
Message-ID: <1c385d8d-224b-3484-e539-d791512dd88f@kernel.org>
Date: Fri, 26 Mar 2021 09:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210322164203.827324-1-arnd@kernel.org>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jyri Sarha <jsarha@ti.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjIvMDMvMjAyMSAxODo0MSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBGcm9tOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IEFuIG9sZCBwYXRjaCBhZGRlZCBhICdyZXR1cm4n
IHN0YXRlbWVudCBhZnRlciBlYWNoIEJVRygpIGluIHRoaXMgZHJpdmVyLAo+IHdoaWNoIHdhcyBu
ZWNlc3NhcnkgYXQgdGhlIHRpbWUsIGJ1dCBoYXMgYmVjb21lIHJlZHVuZGFudCBhZnRlciB0aGUg
QlVHKCkKPiBkZWZpbml0aW9uIHdhcyB1cGRhdGVkIHRvIGhhbmRsZSB0aGlzIHByb3Blcmx5Lgo+
IAo+IGdjYy0xMSBub3cgd2FybnMgYWJvdXQgb25lIHN1Y2ggaW5zdGFuY2UsIHdoZXJlIHRoZSAn
cmV0dXJuJyBzdGF0ZW1lbnQKPiB3YXMgaW5jb3JyZWN0bHkgaW5kZW50ZWQ6Cj4gCj4gZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmM6IEluIGZ1bmN0aW9uIOKAmHBpeGluY+KAmToK
PiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYzoyMDkzOjk6IGVycm9yOiB0aGlz
IOKAmGVsc2XigJkgY2xhdXNlIGRvZXMgbm90IGd1YXJkLi4uIFstV2Vycm9yPW1pc2xlYWRpbmct
aW5kZW50YXRpb25dCj4gICAyMDkzIHwgICAgICAgICBlbHNlCj4gICAgICAgIHwgICAgICAgICBe
fn5+Cj4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmM6MjA5NToxNzogbm90ZTog
Li4udGhpcyBzdGF0ZW1lbnQsIGJ1dCB0aGUgbGF0dGVyIGlzIG1pc2xlYWRpbmdseSBpbmRlbnRl
ZCBhcyBpZiBpdCB3ZXJlIGd1YXJkZWQgYnkgdGhlIOKAmGVsc2XigJkKPiAgIDIwOTUgfCAgICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fgo+
IAo+IEFkZHJlc3MgdGhpcyBieSByZW1vdmluZyB0aGUgcmV0dXJuIGFnYWluIGFuZCBjaGFuZ2lu
ZyB0aGUgQlVHKCkKPiB0byBiZSB1bmNvbmRpdGlvbmFsIHRvIG1ha2UgdGhpcyBtb3JlIGludHVp
dGl2ZS4KPiAKPiBGaXhlczogYzZlZWU5NjhkNDBkICgiT01BUERTUzogcmVtb3ZlIGNvbXBpbGVy
IHdhcm5pbmdzIHdoZW4gQ09ORklHX0JVRz1uIikKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNz
L2Rpc3BjLmMgfCA1ICsrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
c3MvZGlzcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jCj4gaW5kZXgg
ZjRjYmVmOGNjYWNlLi41NjE5NDIwY2MyY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL2Rpc3BjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mv
ZGlzcGMuYwo+IEBAIC0yMDkwLDkgKzIwOTAsOCBAQCBzdGF0aWMgczMyIHBpeGluYyhpbnQgcGl4
ZWxzLCB1OCBwcykKPiAgIAkJcmV0dXJuIDEgKyAocGl4ZWxzIC0gMSkgKiBwczsKPiAgIAllbHNl
IGlmIChwaXhlbHMgPCAwKQo+ICAgCQlyZXR1cm4gMSAtICgtcGl4ZWxzICsgMSkgKiBwczsKPiAt
CWVsc2UKPiAtCQlCVUcoKTsKPiAtCQlyZXR1cm4gMDsKPiArCj4gKwlCVUcoKTsKPiAgIH0KPiAg
IAo+ICAgc3RhdGljIHZvaWQgY2FsY19vZmZzZXQodTE2IHNjcmVlbl93aWR0aCwgdTE2IHdpZHRo
LAoKVGhhbmtzLCBJJ2xsIHBpY2sgdGhpcyB1cC4KCiAgVG9taQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
