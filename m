Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5083F4BA3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 13:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827706E0E4;
	Fri,  8 Nov 2019 12:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23D26E09A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 12:33:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 036C8B27A;
 Fri,  8 Nov 2019 12:33:36 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH 0/4] drm/udl: Replace fbdev by generic emulation
Date: Fri,  8 Nov 2019 13:33:29 +0100
Message-Id: <20191108123333.25274-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHVkbCBkcml2ZXIgY2FuIHVzZSB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24uIEFmdGVy
IGNvbnZlcnNpb24sCmEgbnVtYmVyIG9mIGNsZWFudXBzIGNhbiBiZSBhcHBsaWVkLgoKVGhlIGZi
ZGV2IGNvbnZlcnNpb24gaXMgaW4gcGF0Y2ggMS4gVGhlIG9yaWdpbmFsIGZiZGV2IGNvZGUgaW4g
dWRsCm1hcHBlZCB0aGUgZnJhbWVidWZmZXIncyBHRU0gb2JqZWN0IG1lbW9yeSB1bmNvbmRpdGlv
bmFsbHksIGFuZAp1bm1hcHBlZCB0aGUgbWVtb3J5IGluIHRoZSBvYmplY3QncyBmcmVlKCkgZnVu
Y3Rpb24uIFRoZSByZXNwZWN0aXZlCmNvZGUgaW4gZnJlZSgpIGNhbiBub3cgYmUgcmVtb3ZlZCAo
UGF0Y2ggMikuIEFuZCBhcyB1ZGwgd2FzIHRoZQpvbmx5IHJlbWFpbmluZyBleHRlcm5hbCB1c2Vy
IG9mIHVubGlua19mcmFtZWJ1ZmZlcigpLCB0aGF0IGZ1bmN0aW9uCm5vdyBiZWNvbWVzIGFuIGlu
dGVybmFsIGludGVyZmFjZSBvZiB0aGUgZmJkZXYgY29kZS4KClRoZSBwYXRjaHNldCBoYXMgYmVl
biB0ZXN0ZWQgYnkgcnVubmluZyB0aGUgY29uc29sZSwgWDExIGFuZCBXZXN0b24Kb24gYSBEaXNw
bGF5TGluayBhZGFwdGVyLgoKVGhvbWFzIFppbW1lcm1hbm4gKDQpOgogIGRybS91ZGw6IFJlcGxh
Y2UgZmJkZXYgY29kZSB3aXRoIGdlbmVyaWMgZW11bGF0aW9uCiAgZHJtL3VkbDogUmVtb3ZlIHVk
bCBpbXBsZW1lbnRhdGlvbiBvZiBHRU0ncyBmcmVlX29iamVjdCgpCiAgZHJtL2ZiLWhlbHBlcjog
UmVtb3ZlIGRybV9mYl9oZWxwZXJfdW5saW5rX2ZiaSgpCiAgZmJkZXY6IFVuZXhwb3J0IHVubGlu
a19mcmFtZWJ1ZmZlcigpCgogZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgIHwgIDE2
ICstCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyAgICAgfCAgIDQgKy0KIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5oICAgICB8ICAgNSAtCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9mYi5jICAgICAgfCAyNzAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9nZW0uYyAgICAgfCAgMTggKy0KIGRyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX21haW4uYyAgICB8ICAgMiAtCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMg
fCAgIDMgKy0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jICB8ICAgMyArLQogaW5j
bHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oICAgICAgIHwgICA2IC0KIGluY2x1ZGUvbGludXgvZmIu
aCAgICAgICAgICAgICAgICB8ICAgMSAtCiAxMCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAzMTggZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
