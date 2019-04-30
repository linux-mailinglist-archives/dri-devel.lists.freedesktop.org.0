Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C23F898
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 14:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA9E891BF;
	Tue, 30 Apr 2019 12:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981A3891BF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 12:16:24 +0000 (UTC)
Received: from [IPv6:2a02:2450:102f:3e0:745b:36a7:ac16:6bf3] (unknown
 [IPv6:2a02:2450:102f:3e0:745b:36a7:ac16:6bf3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: robertfoss)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB2E926121E;
 Tue, 30 Apr 2019 13:16:22 +0100 (BST)
Subject: Re: [PATCH] drm/virtio: allocate fences with GFP_KERNEL
To: Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190429221021.159784-1-olvaffe@gmail.com>
From: Robert Foss <robert.foss@collabora.com>
Message-ID: <24777ff4-91a6-3070-1011-ee0963338ded@collabora.com>
Date: Tue, 30 Apr 2019 14:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429221021.159784-1-olvaffe@gmail.com>
Content-Language: en-US
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
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IENoaWEtSSwKClRoaXMgbG9va3MgZ29vZCB0byBtZSwgSSBjYW4ndCBmaW5kIGFueSBzcGlu
bG9ja3MgYmVpbmcgaGVsZApkdXJpbmcgdGhhdCBhbGxvY2F0aW9uLgoKUmV2aWV3ZWQtYnk6IFJv
YmVydCBGb3NzIDxyb2JlcnQuZm9zc0Bjb2xsYWJvcmEuY29tPgoKT24gMzAuMDQuMTkgMDA6MTAs
IENoaWEtSSBXdSB3cm90ZToKPiBJdCB3YXMgY2hhbmdlZCB0byBHRlBfQVRPTUlDIGluIGNvbW1p
dCBlYzJmMDU3N2MgKGFkZCAmIHVzZQo+IHZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVm
ZmVyKSBiZWNhdXNlIHRoZSBhbGxvY2F0aW9uIGhhcHBlbmVkCj4gd2l0aCBhIHNwaW5sb2NrIGhl
bGQuICBUaGF0IHdhcyBubyBsb25nZXIgdHJ1ZSBhZnRlciBjb21taXQKPiA5ZmRkOTBjMGYgKGFk
ZCB2aXJ0aW9fZ3B1X2FsbG9jX2ZlbmNlKCkpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoaWEtSSBX
dSA8b2x2YWZmZUBnbWFpbC5jb20+Cj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQu
Y29tPgo+IENjOiBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEuY29t
Pgo+IENjOiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jIHwgMiArLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2ZlbmNlLmMKPiBpbmRleCA4N2QxOTY2MTkyZjQuLmI2M2VhNDc5N2Fm
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jCj4gQEAgLTcxLDcg
KzcxLDcgQEAgc3RydWN0IHZpcnRpb19ncHVfZmVuY2UgKnZpcnRpb19ncHVfZmVuY2VfYWxsb2Mo
c3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldikKPiAgIHsKPiAgIAlzdHJ1Y3QgdmlydGlv
X2dwdV9mZW5jZV9kcml2ZXIgKmRydiA9ICZ2Z2Rldi0+ZmVuY2VfZHJ2Owo+ICAgCXN0cnVjdCB2
aXJ0aW9fZ3B1X2ZlbmNlICpmZW5jZSA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fZ3B1
X2ZlbmNlKSwKPiAtCQkJCQkJCUdGUF9BVE9NSUMpOwo+ICsJCQkJCQkJR0ZQX0tFUk5FTCk7Cj4g
ICAJaWYgKCFmZW5jZSkKPiAgIAkJcmV0dXJuIGZlbmNlOwo+ICAgCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
