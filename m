Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BA7627A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056EB6ECFB;
	Fri, 26 Jul 2019 09:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79FD7899D4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:36:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF3C344;
 Thu, 25 Jul 2019 08:36:21 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9AC33F71A;
 Thu, 25 Jul 2019 08:36:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] drm/gem: Allow sparsely populated page arrays in
 drm_gem_put_pages
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-2-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <74652462-1c37-0690-929e-468023d9b2d6@arm.com>
Date: Thu, 25 Jul 2019 16:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725011003.30837-2-robh@kernel.org>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAwMjowOSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gUGFuZnJvc3QgaGFzIGEg
bmVlZCBmb3IgcGFnZXMgYWxsb2NhdGVkIG9uIGRlbWFuZCB2aWEgR1BVIHBhZ2UgZmF1bHRzLgo+
IFdoZW4gcmVsZWFzaW5nIHRoZSBwYWdlcywgdGhlIG9ubHkgdGhpbmcgcHJldmVudGluZyB1c2lu
Zwo+IGRybV9nZW1fcHV0X3BhZ2VzKCkgaXMgbmVlZGluZyB0byBza2lwIG92ZXIgdW5wb3B1bGF0
ZWQgcGFnZXMsIHNvIGFsbG93Cj4gZm9yIHNraXBwaW5nIG92ZXIgTlVMTCBzdHJ1Y3QgcGFnZSBw
b2ludGVycy4KPiAKPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGlu
LmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCkxHVE06IFJldmlld2VkLWJ5OiBTdGV2ZW4g
UHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKPiAtLS0KPiB2MjoKPiAgLSBuZXcgcGF0Y2gK
PiAKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiBpbmRleCAyNDNmNDNkNzBmNDIuLmRi
MzczYzk0NWYxNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+IEBAIC02MzMsNiArNjMzLDkgQEAgdm9pZCBk
cm1fZ2VtX3B1dF9wYWdlcyhzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHBhZ2Ug
KipwYWdlcywKPiAKPiAgCXBhZ2V2ZWNfaW5pdCgmcHZlYyk7Cj4gIAlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyBpKyspIHsKPiArCQlpZiAoIXBhZ2VzW2ldKQo+ICsJCQljb250aW51ZTsKPiArCj4g
IAkJaWYgKGRpcnR5KQo+ICAJCQlzZXRfcGFnZV9kaXJ0eShwYWdlc1tpXSk7Cj4gCj4gLS0KPiAy
LjIwLjEKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
