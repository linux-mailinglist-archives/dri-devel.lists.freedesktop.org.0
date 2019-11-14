Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB3FC691
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 13:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE486E222;
	Thu, 14 Nov 2019 12:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3355D6E222
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 12:51:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10FE5ACA0;
 Thu, 14 Nov 2019 12:51:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v5 0/3] drm/udl: Replace fbdev by generic emulation
Date: Thu, 14 Nov 2019 13:51:03 +0100
Message-Id: <20191114125106.28347-1-tzimmermann@suse.de>
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
ZGV2IGNvbnZlcnNpb24gaXMgaW4gcGF0Y2ggMS4gQXMgdWRsIHdhcyB0aGUgb25seSByZW1haW5p
bmcKZXh0ZXJuYWwgdXNlciBvZiB1bmxpbmtfZnJhbWVidWZmZXIoKSwgdGhhdCBmdW5jdGlvbiBu
b3cgYmVjb21lcyBhbgppbnRlcm5hbCBpbnRlcmZhY2Ugb2YgdGhlIGZiZGV2IGNvZGUgKFBhdGNo
ZXMgMiArIDMpLgoKVGhlIHBhdGNoc2V0IGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nIHRoZSBj
b25zb2xlLCBYMTEgYW5kIFdlc3RvbgpvbiBhIERpc3BsYXlMaW5rIGFkYXB0ZXIuCgp2NToKCSog
aW5pdGlhbGl6ZSBjb25zb2xlIGFmdGVyIHJlZ2lzdGVyaW5nIGRldmljZQp2NDoKCSogZ28gYmFj
ayB0byAyNCBicHAgYnkgZGVmYXVsdCwgMTYgYnBwIGZvciBjb25zb2xlCgkqIGtlZXAgdWRsX2dl
bV9vYmplY3RfZnJlZV9vYmplY3QoKTsgcmVxdWlyZWQgYnkgZGFtYWdlIGhhbmRsZXIKdjM6Cgkq
IHVzZSAzMiBicHAgYnkgZGVmYXVsdAoJKiB1c2UgZGVmYXVsdHMgZm9yIHNldmVyYWwgY2FsbGJh
Y2sgZnVuY3Rpb25zCgkqIHJlbW92ZSBhbGwgZmIgbW9kdWxlIHBhcmFtZXRlcnMKCSogcmVtb3Zl
IHVkbF9mYmRldl9pbml0KCkKdjI6CgkqIGNvbnZlcnRlZCB1ZGwgdG8gU0hNRU0gYW5kIHJlY3Jl
YXRlZCBmYmRldiBwYXRjaHNldCBvbiB0b3AKClRob21hcyBaaW1tZXJtYW5uICgzKToKICBkcm0v
dWRsOiBSZXBsYWNlIGZiZGV2IGNvZGUgd2l0aCBnZW5lcmljIGVtdWxhdGlvbgogIGRybS9mYi1o
ZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX3VubGlua19mYmkoKQogIGZiZGV2OiBVbmV4cG9y
dCB1bmxpbmtfZnJhbWVidWZmZXIoKQoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMg
ICB8ICAxNiArLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgICAgIHwgICA4ICstCiBk
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAgfCAgIDYgLQogZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZmIuYyAgICAgIHwgMjgyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jICAgIHwgICA2IC0KIGRyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX21vZGVzZXQuYyB8ICAgMSAtCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
ZW0uYyAgfCAgIDMgKy0KIGluY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCAgICAgICB8ICAgNiAt
CiBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAgICAgfCAgIDEgLQogOSBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDMyMCBkZWxldGlvbnMoLSkKCi0tCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
