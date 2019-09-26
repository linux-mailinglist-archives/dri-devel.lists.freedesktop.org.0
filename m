Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 107ADBF564
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 17:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37B76ECB9;
	Thu, 26 Sep 2019 15:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 13D1F89F35;
 Thu, 26 Sep 2019 15:00:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FCD128;
 Thu, 26 Sep 2019 08:00:53 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 897003F534;
 Thu, 26 Sep 2019 08:00:52 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 0/6] drm/lima: simplify driver by using more drm helpers
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190926141046.30758-1-yuq825@gmail.com>
Message-ID: <f1181de2-7222-eaa1-7da2-0e2b117e13a0@arm.com>
Date: Thu, 26 Sep 2019 16:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926141046.30758-1-yuq825@gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDkvMjAxOSAxNToxMCwgUWlhbmcgWXUgd3JvdGU6Cj4gQnkgdXNpbmcgc2hhcmVkIGRy
bSBoZWxwZXJzOgo+IDEuIGRybV9nZW1fb2JqZWN0c19sb29rdXAKPiAyLiBkcm1fZ2VtXyh1bils
b2NrX3Jlc2VydmF0aW9ucwo+IDMuIGRybV9nZW1fc2htZW1faGVscGVycwo+IHdlIGNhbiBzaW1w
bGlmeSBsaW1hIGRyaXZlciBhIGxvdCBhbmQgYmVuaWZpdCBmcm9tIHVwZGF0ZXMgdG8KPiB0aGVz
ZSBmdW5jdGlvbnMuCj4gCj4gZHJtX2dlbV9vYmplY3RzX2xvb2t1cCBuZWVkIGEgcmVmaW5lIGlu
IG9yZGVyIHRvIGJlIHVzZWQgYnkgbGltYS4KCkknbSBub3QgY29udmluY2VkIHRoaXMgaXMgYWN0
dWFsbHkgYSBncmVhdCBpZGVhLiB2M2QgbG9va3MgbGlrZSBpdCBjb3VsZAphbHJlYWR5IHVzZSB0
aGUgZXhpc3RpbmcgZHJtX2dlbV9vYmplY3RzX2xvb2t1cCBtZWNoYW5pc206IHNlZSBiZWxvdwoo
dW50ZXN0ZWQpIHBhdGNoLiBTbyB3ZSdyZSBhY3R1YWxseSBhZGRpbmcgbW9yZSBjb2RlIHRvIFBh
bmZyb3N0IChhbmQKdjNkKSBqdXN0IGZvciB0aGUgcXVpcmsgaW4gbGltYSB0aGF0IHRoZSBzdXBw
bGllZCBhcnJheSBvZiBCT3MgaXMKaW50ZXJsZWF2ZWQgd2l0aCBmbGFncy4gQW5kIHRoZSBkaWZm
c3RhdCBmb3IgdGhlIGxpbWEgY2hhbmdlIGFkZHMgbGluZXMKdG9vISBTbyBpdCBkb2Vzbid0IGxv
b2sgbGlrZSBhIG5ldCB3aW4gdG8gbWUuCgpJJ3ZlIG5vdCBsb29rZWQgYXQgcGF0Y2hlcyA0LTYs
IGJ1dCB0aGUgZGlmZnN0YXQgb24gdGhvc2UgbG9va3MgYmV0dGVyIQoKU3RldmUKCi0tLTg8LS0t
LQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdjNkL3YzZF9nZW0uYwppbmRleCA0YzRiNTlhZTJjODEuLmRiZTM2NmQzNTE5NSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3YzZC92M2RfZ2VtLmMKQEAgLTMwNCw0OCArMzA0LDkgQEAgdjNkX2xvb2t1cF9ib3Moc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCi0Jam9iLT5ibyA9
IGt2bWFsbG9jX2FycmF5KGpvYi0+Ym9fY291bnQsCi0JCQkJIHNpemVvZihzdHJ1Y3QgZHJtX2dl
bV9jbWFfb2JqZWN0ICopLAotCQkJCSBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Ci0JaWYgKCFq
b2ItPmJvKSB7Ci0JCURSTV9ERUJVRygiRmFpbGVkIHRvIGFsbG9jYXRlIHZhbGlkYXRlZCBCTyBw
b2ludGVyc1xuIik7Ci0JCXJldHVybiAtRU5PTUVNOwotCX0KLQotCWhhbmRsZXMgPSBrdm1hbGxv
Y19hcnJheShqb2ItPmJvX2NvdW50LCBzaXplb2YodTMyKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFo
YW5kbGVzKSB7Ci0JCXJldCA9IC1FTk9NRU07Ci0JCURSTV9ERUJVRygiRmFpbGVkIHRvIGFsbG9j
YXRlIGluY29taW5nIEdFTSBoYW5kbGVzXG4iKTsKLQkJZ290byBmYWlsOwotCX0KLQotCWlmIChj
b3B5X2Zyb21fdXNlcihoYW5kbGVzLAotCQkJICAgKHZvaWQgX191c2VyICopKHVpbnRwdHJfdCli
b19oYW5kbGVzLAotCQkJICAgam9iLT5ib19jb3VudCAqIHNpemVvZih1MzIpKSkgewotCQlyZXQg
PSAtRUZBVUxUOwotCQlEUk1fREVCVUcoIkZhaWxlZCB0byBjb3B5IGluIEdFTSBoYW5kbGVzXG4i
KTsKLQkJZ290byBmYWlsOwotCX0KLQotCXNwaW5fbG9jaygmZmlsZV9wcml2LT50YWJsZV9sb2Nr
KTsKLQlmb3IgKGkgPSAwOyBpIDwgam9iLT5ib19jb3VudDsgaSsrKSB7Ci0JCXN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqYm8gPSBpZHJfZmluZCgmZmlsZV9wcml2LT5vYmplY3RfaWRyLAotCQkJCQkJ
ICAgICBoYW5kbGVzW2ldKTsKLQkJaWYgKCFibykgewotCQkJRFJNX0RFQlVHKCJGYWlsZWQgdG8g
bG9vayB1cCBHRU0gQk8gJWQ6ICVkXG4iLAotCQkJCSAgaSwgaGFuZGxlc1tpXSk7Ci0JCQlyZXQg
PSAtRU5PRU5UOwotCQkJc3Bpbl91bmxvY2soJmZpbGVfcHJpdi0+dGFibGVfbG9jayk7Ci0JCQln
b3RvIGZhaWw7Ci0JCX0KLQkJZHJtX2dlbV9vYmplY3RfZ2V0KGJvKTsKLQkJam9iLT5ib1tpXSA9
IGJvOwotCX0KLQlzcGluX3VubG9jaygmZmlsZV9wcml2LT50YWJsZV9sb2NrKTsKLQotZmFpbDoK
LQlrdmZyZWUoaGFuZGxlcyk7Ci0JcmV0dXJuIHJldDsKKwlyZXR1cm4gZHJtX2dlbV9vYmplY3Rz
X2xvb2t1cChmaWxlX3ByaXYsCisJCQkJICAgICAgKHZvaWQgX191c2VyICopKHVpbnRwdHJfdCli
b19oYW5kbGVzLAorCQkJCSAgICAgIGpvYi0+Ym9fY291bnQsICZqb2ItPmJvKTsKIH0KIAogc3Rh
dGljIHZvaWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
