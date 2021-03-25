Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EC234958A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 16:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3BF6EDA7;
	Thu, 25 Mar 2021 15:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8D66EDA7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 15:31:08 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lPRww-0005wP-Ix; Thu, 25 Mar 2021 15:31:06 +0000
Subject: Re: [PATCH] drm/ttm: fix invalid NULL deref
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210325152740.82633-1-christian.koenig@amd.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <74a0c5ed-8688-34f0-974f-ecdd15072772@canonical.com>
Date: Thu, 25 Mar 2021 15:31:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325152740.82633-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDMvMjAyMSAxNToyNywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBUaGUgQk8gbWln
aHQgYmUgTlVMTCBpbiB0aGlzIGZ1bmN0aW9uLCB1c2UgdGhlIGJkZXYgZGlyZWN0bHkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+IFJlcG9ydGVkLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pgo+IEZpeGVzOiBhMWYwOTFmOGVmMmIgKCJkcm0vdHRtOiBzd2l0Y2ggdG8gcGVyIGRldmljZSBM
UlUgbG9jayIpCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA2ICsrKy0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDJkMmFjNTMyOTg3ZS4uNmFiN2I2NmNlMzZkIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTYyNSw3ICs2MjUsNyBAQCBpbnQgdHRtX21lbV9ldmlj
dF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgCXVuc2lnbmVkIGk7Cj4gIAlpbnQg
cmV0Owo+ICAKPiAtCXNwaW5fbG9jaygmYm8tPmJkZXYtPmxydV9sb2NrKTsKPiArCXNwaW5fbG9j
aygmYmRldi0+bHJ1X2xvY2spOwo+ICAJZm9yIChpID0gMDsgaSA8IFRUTV9NQVhfQk9fUFJJT1JJ
VFk7ICsraSkgewo+ICAJCWxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZtYW4tPmxydVtpXSwgbHJ1
KSB7Cj4gIAkJCWJvb2wgYnVzeTsKPiBAQCAtNjYyLDcgKzY2Miw3IEBAIGludCB0dG1fbWVtX2V2
aWN0X2ZpcnN0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAo+ICAJaWYgKCFibykgewo+ICAJCWlm
IChidXN5X2JvICYmICF0dG1fYm9fZ2V0X3VubGVzc196ZXJvKGJ1c3lfYm8pKQo+ICAJCQlidXN5
X2JvID0gTlVMTDsKPiAtCQlzcGluX3VubG9jaygmYm8tPmJkZXYtPmxydV9sb2NrKTsKPiArCQlz
cGluX3VubG9jaygmYmRldi0+bHJ1X2xvY2spOwo+ICAJCXJldCA9IHR0bV9tZW1fZXZpY3Rfd2Fp
dF9idXN5KGJ1c3lfYm8sIGN0eCwgdGlja2V0KTsKPiAgCQlpZiAoYnVzeV9ibykKPiAgCQkJdHRt
X2JvX3B1dChidXN5X2JvKTsKPiBAQCAtNjc2LDcgKzY3Niw3IEBAIGludCB0dG1fbWVtX2V2aWN0
X2ZpcnN0KHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4g
IAo+IC0Jc3Bpbl91bmxvY2soJmJvLT5iZGV2LT5scnVfbG9jayk7Cj4gKwlzcGluX3VubG9jaygm
YmRldi0+bHJ1X2xvY2spOwo+ICAKPiAgCXJldCA9IHR0bV9ib19ldmljdChibywgY3R4KTsKPiAg
CWlmIChsb2NrZWQpCj4gCkxvb2tzIGdvb2QgdG8gbWUuIFRoYW5rcy4KClJldmlld2VkLWJ5OiBD
b2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
