Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C6BDAE6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 11:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76C66EB51;
	Wed, 25 Sep 2019 09:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14AF96EB51
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:25:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DDBD1570;
 Wed, 25 Sep 2019 02:25:28 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9044C3F694;
 Wed, 25 Sep 2019 02:25:27 -0700 (PDT)
Subject: Re: [PATCH v2] drm/panfrost: Reduce the amount of logs on deferred
 probe
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20190923171222.9256-1-krzk@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <a738d0d8-a1a9-5ffb-a858-0c3336339f46@arm.com>
Date: Wed, 25 Sep 2019 10:25:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923171222.9256-1-krzk@kernel.org>
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

T24gMjMvMDkvMjAxOSAxODoxMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBUaGVyZSBp
cyBubyBwb2ludCB0byBwcmludCBkZWZlcnJlZCBwcm9iZSAoYW5kIGl0cyBmYWlsdXJlcyB0byBn
ZXQKPiByZXNvdXJjZXMpIGFzIGFuIGVycm9yLiAgQWxzbyB0aGVyZSBpcyBubyBuZWVkIHRvIHBy
aW50IHJlZ3VsYXRvciBlcnJvcnMKPiB0d2ljZS4KPiAKPiBJbiBjYXNlIG9mIG11bHRpcGxlIHBy
b2JlIHRyaWVzIHRoaXMgd291bGQgcG9sbHV0ZSB0aGUgZG1lc2cuCj4gCj4gU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN0
ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cgo+IAo+IC0tLQo+IAo+IENoYW5nZXMg
c2luY2UgdjE6Cj4gMS4gUmVtb3ZlIHNlY29uZCBlcnJvciBtZXNzYWdlIGZyb20gY2FsbGluZyBw
YW5mcm9zdF9yZWd1bGF0b3JfaW5pdCgpLgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZpY2UuYwo+IGluZGV4IDQ2YjBiMDJlNDI4OS4uMjg3YzZiYTMxNGQ5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwo+IEBAIC05
NSw3ICs5NSw5IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoc3RydWN0IHBh
bmZyb3N0X2RldmljZSAqcGZkZXYpCj4gIAkJcGZkZXYtPnJlZ3VsYXRvciA9IE5VTEw7Cj4gIAkJ
aWYgKHJldCA9PSAtRU5PREVWKQo+ICAJCQlyZXR1cm4gMDsKPiAtCQlkZXZfZXJyKHBmZGV2LT5k
ZXYsICJmYWlsZWQgdG8gZ2V0IHJlZ3VsYXRvcjogJWRcbiIsIHJldCk7Cj4gKwkJaWYgKHJldCAh
PSAtRVBST0JFX0RFRkVSKQo+ICsJCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0
IHJlZ3VsYXRvcjogJWRcbiIsCj4gKwkJCQlyZXQpOwo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4g
IAo+IEBAIC0xMzMsMTAgKzEzNSw4IEBAIGludCBwYW5mcm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldikKPiAgCX0KPiAgCj4gIAllcnIgPSBwYW5mcm9zdF9yZWd1
bGF0b3JfaW5pdChwZmRldik7Cj4gLQlpZiAoZXJyKSB7Cj4gLQkJZGV2X2VycihwZmRldi0+ZGV2
LCAicmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBlcnIpOwo+ICsJaWYgKGVycikKPiAgCQln
b3RvIGVycl9vdXQwOwo+IC0JfQo+ICAKPiAgCWVyciA9IHBhbmZyb3N0X3Jlc2V0X2luaXQocGZk
ZXYpOwo+ICAJaWYgKGVycikgewo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
