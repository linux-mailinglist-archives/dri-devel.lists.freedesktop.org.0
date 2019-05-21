Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD5A24D9A
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 13:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74C892FA;
	Tue, 21 May 2019 11:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460D0892FA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 11:08:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D02C8AE14;
 Tue, 21 May 2019 11:08:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, kraxel@redhat.com,
 christian.koenig@amd.com, ray.huang@amd.com, sam@ravnborg.org
Subject: [PATCH 0/3] Various clean-up patches for GEM VRAM
Date: Tue, 21 May 2019 13:08:28 +0200
Message-Id: <20190521110831.20200-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjaW5nIGRybV9nZW1fdnJhbV9wdXNoX3RvX3N5c3RlbSgpIG1vdmVzIHBvbGljeSBmcm9t
IGRyaXZlcnMgYmFjawp0byB0aGUgbWVtb3J5IG1hbmFnZXIuIE5vdywgdW51c2VkIEJPcyBhcmUg
b25seSBldmljdGVkIHdoZW4gdGhlIHNwYWNlCmlzIHJlcXVpcmVkLgoKVGhlIGxvY2svdW5sb2Nr
LXJlbmFtaW5nIHBhdGNoIGFsaWducyB0aGUgaW50ZXJmYWNlIHdpdGggb3RoZXIgbmFtZXMKaW4g
RFJNLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgYXJlIGRvbmUuCgpGaW5hbGx5LCB0aGVyZSdzIG5v
dyBhIGxvY2tkZXAgYXNzZXJ0IHRoYXQgZW5zdXJlcyB3ZSBkb24ndCBjYWxsIHRoZQpHRU0gVlJB
TSBfbG9ja2VkKCkgZnVuY3Rpb25zIHdpdGggYW4gdW5sb2NrZWQgQk8uCgpQYXRjaGVzIGFyZSBh
Z2FpbnN0IGEgcmVjZW50IGRybS10aXAgYW5kIHRlc3RlZCBvbiBtZ2FnMjAwIGFuZCBhc3QgSFcu
CgpUaG9tYXMgWmltbWVybWFubiAoMyk6CiAgZHJtOiBSZXBsYWNlIGRybV9nZW1fdnJhbV9wdXNo
X3RvX3N5c3RlbSgpIHdpdGgga3VubWFwICsgdW5waW4KICBkcm06IFJlbmFtZSByZXNlcnZlL3Vu
cmVzZXJ2ZSB0byBsb2NrL3VubG9jayBpbiBHRU0gVlJBTSBoZWxwZXJzCiAgZHJtOiBBc3NlcnQg
dGhhdCBCTyBpcyBsb2NrZWQgaW4gZHJtX2dlbV92cmFtX3twaW4sdW5waW59X2xvY2tlZCgpCgog
ZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYyAgICAgICAgICAgICB8IDExICsrLQogZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jICAgICAgICAgICB8IDI2ICsrKystLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgfCA4NiArKysrKystLS0tLS0tLS0tLS0t
LS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9oZWxwZXJfY29tbW9uLmMgfCAgMiAtCiBk
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIHwgNDAgKysrKystLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYyAgICAgfCAxMSArKy0KIGRyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jICAgfCAxNSArKystLQogaW5jbHVkZS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAgICB8ICA5ICsrLQogOCBmaWxlcyBjaGFuZ2Vk
LCA4MCBpbnNlcnRpb25zKCspLCAxMjAgZGVsZXRpb25zKC0pCgotLQoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
