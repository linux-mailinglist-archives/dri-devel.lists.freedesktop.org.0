Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7AB0B85
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 11:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8836EA44;
	Thu, 12 Sep 2019 09:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABEE96EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 09:36:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 264081000;
 Thu, 12 Sep 2019 02:36:27 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C98E3F59C;
 Thu, 12 Sep 2019 02:36:26 -0700 (PDT)
Subject: Re: [RESEND PATCH] drm/panfrost: Reduce the amount of logs on
 deferred probe
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190909155146.14065-1-krzk@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <1858ea3d-8f33-66f4-0e71-31bf68443b24@arm.com>
Date: Thu, 12 Sep 2019 10:36:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909155146.14065-1-krzk@kernel.org>
Content-Language: en-GB
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkvMDkvMjAxOSAxNjo1MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGVyZSBp
cyBubyBwb2ludCB0byBwcmludCBkZWZlcnJlZCBwcm9iZSAoYW5kIGl0cyBmYWlsdXJlcyB0byBn
ZXQKPiByZXNvdXJjZXMpIGFzIGFuIGVycm9yLgo+IAo+IEluIGNhc2Ugb2YgbXVsdGlwbGUgcHJv
YmUgdHJpZXMgdGhpcyB3b3VsZCBwb2xsdXRlIHRoZSBkbWVzZy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CgpMb29rcyBsaWtlIGEgZ29v
ZCBpZGVhLCBob3dldmVyIGZyb20gd2hhdCBJIGNhbiB0ZWxsIHlvdSBoYXZlbid0CmNvbXBsZXRl
bHkgc2lsZW5jZWQgdGhlICdlcnJvcicgYXMgdGhlIHJldHVybiBmcm9tCnBhbmZyb3N0X3JlZ3Vs
YXRvcl9pbml0KCkgd2lsbCBiZSAtRVBST0JFX0RFRkVSIGNhdXNpbmcgYW5vdGhlcgpkZXZfZXJy
KCkgb3V0cHV0OgoKICAgICAgICBlcnIgPSBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7
CiAgICAgICAgaWYgKGVycikgewogICAgICAgICAgICAgICAgZGV2X2VycihwZmRldi0+ZGV2LCAi
cmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBlcnIpOwogICAgICAgICAgICAgICAgZ290byBl
cnJfb3V0MDsKICAgICAgICB9CgpDYW4geW91IGZpeCB0aGF0IHVwIGFzIHdlbGw/IE9yIGluZGVl
ZCBkcm9wIGl0IGFsdG9nZXRoZXIgc2luY2UKcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoKSBhbHJl
YWR5IG91dHB1dHMgYW4gYXBwcm9wcmlhdGUgbWVzc2FnZS4KClN0ZXZlCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCA0ICsrKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKPiBpbmRleCA0NmIwYjAyZTQyODkuLjIy
NTIxNDdiYzI4NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
aWNlLmMKPiBAQCAtOTUsNyArOTUsOSBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3JlZ3VsYXRvcl9p
bml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQo+ICAJCXBmZGV2LT5yZWd1bGF0b3Ig
PSBOVUxMOwo+ICAJCWlmIChyZXQgPT0gLUVOT0RFVikKPiAgCQkJcmV0dXJuIDA7Cj4gLQkJZGV2
X2VycihwZmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVkXG4iLCByZXQpOwo+
ICsJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPiArCQkJZGV2X2VycihwZmRldi0+ZGV2LCAi
ZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVkXG4iLAo+ICsJCQkJcmV0KTsKPiAgCQlyZXR1cm4g
cmV0Owo+ICAJfQo+ICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
