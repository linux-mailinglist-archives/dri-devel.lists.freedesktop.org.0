Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2E112D68
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C76E6E909;
	Wed,  4 Dec 2019 14:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D348E6E909
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:25:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3D4F020107;
 Wed,  4 Dec 2019 15:25:45 +0100 (CET)
Date: Wed, 4 Dec 2019 15:25:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/7] drm/udl: Vmap framebuffer after all tests succeeded
 in damage handling
Message-ID: <20191204142544.GA20926@ravnborg.org>
References: <20191204132430.16874-1-tzimmermann@suse.de>
 <20191204132430.16874-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204132430.16874-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=N00QSxMDQvl-pQ2LwbQA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKSSBkaWQgYSBjYXN1YWwgYnJvd3NlIG9mIHRoZSBwYXRjaGVzLgpMb29rcyBs
aWtlIHNvbWUgbmljZSBjbGVhbnVwLgoKT24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDI6MjQ6MjZQ
TSArMDEwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gV2Ugbm93IGRvIHRoZSBmYXN0IHRl
c3RzIGJlZm9yZSB0aGUgcG90ZW50aWFsbHkgZXhwZW5zaXZlIHZtYXAgb3BlcmF0aW9uLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jICAgICAgIHwgMTkgKysrKysrKy0t
LS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF90cmFuc2Zlci5jIHwgIDEgLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9mYi5jCj4gaW5kZXggZWQ2ZDk0NzZiMjViLi5kZDdiYTdmNjMyMTQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX2ZiLmMKPiBAQCAtODUsMTIgKzg1LDYgQEAgaW50IHVkbF9oYW5kbGVfZGFt
YWdlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBpbnQgeCwgaW50IHksCj4gIAl9Cj4gIAlz
cGluX3VubG9jaygmdWRsLT5hY3RpdmVfZmJfMTZfbG9jayk7Cj4gIAo+IC0JdmFkZHIgPSBkcm1f
Z2VtX3NobWVtX3ZtYXAoZmItPm9ialswXSk7Cj4gLQlpZiAoSVNfRVJSKHZhZGRyKSkgewo+IC0J
CURSTV9FUlJPUigiZmFpbGVkIHRvIHZtYXAgZmJcbiIpOwo+IC0JCXJldHVybiAwOwo+IC0JfQo+
IC0KPiAgCWFsaWduZWRfeCA9IERMX0FMSUdOX0RPV04oeCwgc2l6ZW9mKHVuc2lnbmVkIGxvbmcp
KTsKPiAgCXdpZHRoID0gRExfQUxJR05fVVAod2lkdGggKyAoeC1hbGlnbmVkX3gpLCBzaXplb2Yo
dW5zaWduZWQgbG9uZykpOwo+ICAJeCA9IGFsaWduZWRfeDsKPiBAQCAtOTgsOCArOTIsMTMgQEAg
aW50IHVkbF9oYW5kbGVfZGFtYWdlKHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBpbnQgeCwg
aW50IHksCj4gIAlpZiAoKHdpZHRoIDw9IDApIHx8Cj4gIAkgICAgKHggKyB3aWR0aCA+IGZiLT53
aWR0aCkgfHwKPiAgCSAgICAoeSArIGhlaWdodCA+IGZiLT5oZWlnaHQpKSB7Cj4gLQkJcmV0ID0g
LUVJTlZBTDsKPiAtCQlnb3RvIGVycl9kcm1fZ2VtX3NobWVtX3Z1bm1hcDsKPiArCQlyZXR1cm4g
LUVJTlZBTDsKPiArCX0KPiArCj4gKwl2YWRkciA9IGRybV9nZW1fc2htZW1fdm1hcChmYi0+b2Jq
WzBdKTsKPiArCWlmIChJU19FUlIodmFkZHIpKSB7Cj4gKwkJRFJNX0VSUk9SKCJmYWlsZWQgdG8g
dm1hcCBmYlxuIik7Cj4gKwkJcmV0dXJuIDA7Cj4gIAl9Cj4gIAo+ICAJdXJiID0gdWRsX2dldF91
cmIoZGV2KTsKPiBAQCAtMTMxLDEwICsxMzAsNiBAQCBpbnQgdWRsX2hhbmRsZV9kYW1hZ2Uoc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGludCB4LCBpbnQgeSwKPiAgCWRybV9nZW1fc2htZW1f
dnVubWFwKGZiLT5vYmpbMF0sIHZhZGRyKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAtCj4gLWVycl9k
cm1fZ2VtX3NobWVtX3Z1bm1hcDoKPiAtCWRybV9nZW1fc2htZW1fdnVubWFwKGZiLT5vYmpbMF0s
IHZhZGRyKTsKPiAtCXJldHVybiByZXQ7ClRoaXMgbGFiZWwgaXMgcmVpbnRyb2R1Y2VkIHR3byBw
YXRjaGVzIGxhdGVyLgpJcyB0aGlzIG9uIHB1cnBvc2UgaXQgaXMgZ29uZSBhbmQgcmVpbnRyb2R1
Y2VkPwoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
