Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30E36C8D3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 17:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505886E0C8;
	Tue, 27 Apr 2021 15:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 250236E0C8;
 Tue, 27 Apr 2021 15:41:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8B1C31B;
 Tue, 27 Apr 2021 08:41:10 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86C0C3F73B;
 Tue, 27 Apr 2021 08:41:10 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 19D3068393E; Tue, 27 Apr 2021 16:41:09 +0100 (BST)
Date: Tue, 27 Apr 2021 16:41:09 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/8] drm/arm/malidp: Always list modifiers
Message-ID: <YIgwlRnguY+K3gJV@e110455-lin.cambridge.arm.com>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427092018.832258-2-daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjcsIDIwMjEgYXQgMTE6MjA6MTJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBFdmVuIHdoZW4gYWxsIHdlIHN1cHBvcnQgaXMgbGluZWFyLCBtYWtlIHRoYXQgZXhw
bGljaXQuIE90aGVyd2lzZSB0aGUKPiB1YXBpIGlzIHJhdGhlciBjb25mdXNpbmcuCgo6KQoKPiAK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IENjOiBQZWtrYSBQYWFsYW5lbiA8cGVra2Eu
cGFhbGFuZW5AY29sbGFib3JhLmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KCkFja2Vk
LWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywKTGl2
aXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5lcy5jIHwgOSArKysr
KysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9wbGFuZXMuYwo+IGluZGV4IGRkYmJhNjdmMDI4My4u
OGMyYWIzZDY1M2I3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3Bs
YW5lcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKPiBAQCAt
OTI3LDYgKzkyNywxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVu
Y3MgbWFsaWRwX2RlX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsKPiAgCS5hdG9taWNfZGlzYWJsZSA9
IG1hbGlkcF9kZV9wbGFuZV9kaXNhYmxlLAo+ICB9Owo+ICAKPiArc3RhdGljIGNvbnN0IHVpbnQ2
NF90IGxpbmVhcl9vbmx5X21vZGlmaWVyc1tdID0gewo+ICsJRFJNX0ZPUk1BVF9NT0RfTElORUFS
LAo+ICsJRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRAo+ICt9Owo+ICsKPiAgaW50IG1hbGlkcF9kZV9w
bGFuZXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQo+ICB7Cj4gIAlzdHJ1Y3QgbWFsaWRw
X2RybSAqbWFsaWRwID0gZHJtLT5kZXZfcHJpdmF0ZTsKPiBAQCAtOTkwLDggKzk5NSw4IEBAIGlu
dCBtYWxpZHBfZGVfcGxhbmVzX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgCQkgKi8K
PiAgCQlyZXQgPSBkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoZHJtLCAmcGxhbmUtPmJhc2UsIGNy
dGNzLAo+ICAJCQkJJm1hbGlkcF9kZV9wbGFuZV9mdW5jcywgZm9ybWF0cywgbiwKPiAtCQkJCShp
ZCA9PSBERV9TTUFSVCkgPyBOVUxMIDogbW9kaWZpZXJzLCBwbGFuZV90eXBlLAo+IC0JCQkJTlVM
TCk7Cj4gKwkJCQkoaWQgPT0gREVfU01BUlQpID8gbGluZWFyX29ubHlfbW9kaWZpZXJzIDogbW9k
aWZpZXJzLAo+ICsJCQkJcGxhbmVfdHlwZSwgTlVMTCk7Cj4gIAo+ICAJCWlmIChyZXQgPCAwKQo+
ICAJCQlnb3RvIGNsZWFudXA7Cj4gLS0gCj4gMi4zMS4wCj4gCgotLSAKPT09PT09PT09PT09PT09
PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkn
cmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0t
LS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
