Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC374ED4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 15:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D2A6E749;
	Thu, 25 Jul 2019 13:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 077566E749
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 13:08:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61B1228;
 Thu, 25 Jul 2019 06:08:51 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CE683F71F;
 Thu, 25 Jul 2019 06:08:49 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <552e3ef7-7a2f-b4c1-69f2-3c1b9fea827d@arm.com>
Date: Thu, 25 Jul 2019 14:08:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725011003.30837-7-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gMjUvMDcvMjAxOSAwMjoxMCwgUm9iIEhlcnJpbmcgd3JvdGU6ClsuLi5dCj4g
QEAgLTMyOCw2ICs0MjcsMTggQEAgc3RhdGljIGlycXJldHVybl90IHBhbmZyb3N0X21tdV9pcnFf
aGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ICAgCQlhY2Nlc3NfdHlwZSA9IChmYXVsdF9z
dGF0dXMgPj4gOCkgJiAweDM7Cj4gICAJCXNvdXJjZV9pZCA9IChmYXVsdF9zdGF0dXMgPj4gMTYp
Owo+IAo+ICsJCS8qIFBhZ2UgZmF1bHQgb25seSAqLwo+ICsJCWlmICgoc3RhdHVzICYgbWFzaykg
PT0gQklUKGkpKSB7Cj4gKwkJCVdBUk5fT04oZXhjZXB0aW9uX3R5cGUgPCAweEMxIHx8IGV4Y2Vw
dGlvbl90eXBlID4gMHhDNCk7Cj4gKwo+ICsJCQlyZXQgPSBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0
X2FkZHIocGZkZXYsIGksIGFkZHIpOwo+ICsJCQlpZiAoIXJldCkgewo+ICsJCQkJbW11X3dyaXRl
KHBmZGV2LCBNTVVfSU5UX0NMRUFSLCBCSVQoaSkpOwo+ICsJCQkJc3RhdHVzICY9IH5tYXNrOwo+
ICsJCQkJY29udGludWU7Cj4gKwkJCX0KPiArCQl9Cj4gKwo+ICAgCQkvKiB0ZXJtaW5hbCBmYXVs
dCwgcHJpbnQgaW5mbyBhYm91dCB0aGUgZmF1bHQgKi8KPiAgIAkJZGV2X2VycihwZmRldi0+ZGV2
LAo+ICAgCQkJIlVuaGFuZGxlZCBQYWdlIGZhdWx0IGluIEFTJWQgYXQgVkEgMHglMDE2bGxYXG4i
Cj4gQEAgLTM2OCw4ICs0NzksOSBAQCBpbnQgcGFuZnJvc3RfbW11X2luaXQoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYpCj4gICAJaWYgKGlycSA8PSAwKQo+ICAgCQlyZXR1cm4gLUVOT0RF
VjsKPiAKPiAtCWVyciA9IGRldm1fcmVxdWVzdF9pcnEocGZkZXYtPmRldiwgaXJxLCBwYW5mcm9z
dF9tbXVfaXJxX2hhbmRsZXIsCj4gLQkJCSAgICAgICBJUlFGX1NIQVJFRCwgIm1tdSIsIHBmZGV2
KTsKPiArCWVyciA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEocGZkZXYtPmRldiwgaXJxLCBO
VUxMLAo+ICsJCQkJCXBhbmZyb3N0X21tdV9pcnFfaGFuZGxlciwKPiArCQkJCQlJUlFGX09ORVNI
T1QsICJtbXUiLCBwZmRldik7CgpUaGUgY2hhbmdlIG9mIGZsYWdzIGhlcmUgYnJlYWtzIHBsYXRm
b3JtcyB1c2luZyBhIHNpbmdsZSBzaGFyZWQgCmludGVycnVwdCBsaW5lLgoKT3RoZXJ3aXNlLCB0
aG91Z2gsIEkndmUgaGFja2VkIGFyb3VuZCB0aGF0IGFuZCB0YWtlbiB0aGUgYnJhbmNoIGZvciBh
IApzcGluIHdpdGggbWVzYS9tYXN0ZXIgKGFuZCB1c2luZyBhIDY0SyBwYWdlIGtlcm5lbCBjb25m
aWcgZm9yIGdpZ2dsZXMpIAphbmQgbm90aGluZyBzZWVtcyBhbWlzcyB0byB0aGUgZXh0ZW50IG9m
IG15ICJnbG1hcmsyIHJ1bnMgYWxsIHRoZSB3YXkgCnRocm91Z2giIHRlc3RpbmcsIGJ1dCBJIGd1
ZXNzIHRoZXJlIHN0aWxsIG5lZWQgdG8gYmUgYWRkaXRpb25hbCBjaGFuZ2VzIApvbiB0aGUgdXNl
cnNwYWNlIGVuZCB0byBhY3R1YWxseSBleGVyY2lzZSB0aGVzZSBuZXcgZmxhZ3MuCgpSb2Jpbi4K
Cj4gCj4gICAJaWYgKGVycikgewo+ICAgCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJmYWlsZWQgdG8g
cmVxdWVzdCBtbXUgaXJxIik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vcGFuZnJv
c3RfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oCj4gaW5kZXggMTdmYjVk
MjAwZjdhLi45MTUwZGQ3NWFhZDggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9wYW5m
cm9zdF9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJtLmgKPiBAQCAt
ODMsNiArODMsNyBAQCBzdHJ1Y3QgZHJtX3BhbmZyb3N0X3dhaXRfYm8gewo+ICAgfTsKPiAKPiAg
ICNkZWZpbmUgUEFORlJPU1RfQk9fTk9FWEVDCTEKPiArI2RlZmluZSBQQU5GUk9TVF9CT19IRUFQ
CTIKPiAKPiAgIC8qKgo+ICAgICogc3RydWN0IGRybV9wYW5mcm9zdF9jcmVhdGVfYm8gLSBpb2N0
bCBhcmd1bWVudCBmb3IgY3JlYXRpbmcgUGFuZnJvc3QgQk9zLgo+IC0tCj4gMi4yMC4xCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
