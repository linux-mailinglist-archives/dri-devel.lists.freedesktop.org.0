Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EDB112C83
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5592E6F467;
	Wed,  4 Dec 2019 13:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E286E907
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:24:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3B96B12F;
 Wed,  4 Dec 2019 13:24:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH 0/7] drm/udl: Prepare damage handler for simple-pipe KMS
Date: Wed,  4 Dec 2019 14:24:23 +0100
Message-Id: <20191204132430.16874-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
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

VWRsJ3MgZGFtYWdlLWhhbmRsaW5nIGNvZGUgcmVxdWlyZXMgY2xlYW4gdXAgYmVmb3JlIHN3aXRj
aGluZyB0aGUgZHJpdmVyCnRvIHNpbXBsZS1waXBlIGhlbHBlcnMuIFBhdGNoZXMgMSwgMiBhbmQg
NyByZW1vdmUgdW51c2VkIHN0YXRlIHZhcmlhYmxlcwphbmQgc3RhdGlzdGljcy4gUGF0Y2hlcyAz
IHRvIDUgcmVvcmdhbml6ZXMgdGhlIGRhbWFnZSBoYW5kbGVyIHRvIGJlIG1vcmUKcmVhZGFibGUu
IFBhdGNoIDYgbW92ZXMgZG1hLWJ1ZiBiZWdpbi9lbmQgY2FsbHMgaW50byB0aGUgZGFtYWdlIGhh
bmRsZXIsCnNvIGl0IHdpbGwgcnVuIGR1cmluZyBwYWdlLWZsaXAgYW5kbW9kZXNldCBvcGVyYXRp
b25zLgoKVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nIGZiZGV2IGNvbnNv
bGUgZW11bGF0aW9uLCBYMTEsIGFuZApXZXN0b24gd2l0aCBhIERpc3BsYXlMaW5rIGFkYXB0ZXIu
CgpUaG9tYXMgWmltbWVybWFubiAoNyk6CiAgZHJtL3VkbDogUmVtb3ZlIHVudXNlZCBzdGF0aXN0
aWNzIGNvdW50ZXJzCiAgZHJtL3VkbDogRG9uJ3QgdHJhY2sgbnVtYmVyIG9mIGlkZW50aWNhbCBh
bmQgc2VudCBwaXhlbHMgcGVyIGxpbmUKICBkcm0vdWRsOiBWbWFwIGZyYW1lYnVmZmVyIGFmdGVy
IGFsbCB0ZXN0cyBzdWNjZWVkZWQgaW4gZGFtYWdlIGhhbmRsaW5nCiAgZHJtL3VkbDogTW92ZSBj
bGlwLXJlY3RhbmdsZSBjb2RlIG91dCBvZiB1ZGxfaGFuZGxlX2RhbWFnZSgpCiAgZHJtL3VkbDog
TW92ZSBsb2ctY3BwIGNvZGUgb3V0IG9mIHVkbF9kYW1hZ2VfaGFuZGxlcigpCiAgZHJtL3VkbDog
QmVnaW4vZW5kIGFjY2VzcyB0byBpbXBvcnRlZCBidWZmZXJzIGluIGRhbWFnZS1oYW5kbGVyCiAg
ZHJtL3VkbDogUmVtb3ZlIGZpZWxkIGxvc3RfcGl4ZWxzIGZyb20gc3RydWN0IHVkbF9kZXZpY2UK
CiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAgIHwgICA4ICstCiBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9mYi5jICAgICAgIHwgMTI5ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgICAgIHwgICAzIC0KIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX3RyYW5zZmVyLmMgfCAgMTIgKystCiA0IGZpbGVzIGNoYW5nZWQsIDcy
IGluc2VydGlvbnMoKyksIDgwIGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
