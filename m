Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2079DFB00E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 12:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1416ECEB;
	Wed, 13 Nov 2019 11:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7126ECEC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 11:52:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90CBDAF92;
 Wed, 13 Nov 2019 11:52:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, noralf@tronnes.org, kraxel@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH v4 0/3] drm/udl: Replace fbdev by generic emulation
Date: Wed, 13 Nov 2019 12:52:30 +0100
Message-Id: <20191113115233.18483-1-tzimmermann@suse.de>
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
ZXMgMiArIDMpLgoKVjQgb2YgdGhlIHBhdGNoc2V0IGtlZXBzIHVkbF9nZW1fb2JqZWN0X2ZyZWVf
b2JqZWN0KCkuIFRoZSBmdW5jdGlvbgppcyBzdGlsbCByZXF1aXJlZCB0byBjbGVhbiB1cCBhZnRl
ciB0aGUgZGFtYWdlIGhhbmRsZXIgbWFwcGVkIGEgQk8uCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4g
dGVzdGVkIGJ5IHJ1bm5pbmcgdGhlIGNvbnNvbGUsIFgxMSBhbmQgV2VzdG9uCm9uIGEgRGlzcGxh
eUxpbmsgYWRhcHRlci4KCnY0OgoJKiBnbyBiYWNrIHRvIDI0IGJwcCBieSBkZWZhdWx0LCAxNiBi
cHAgZm9yIGNvbnNvbGUKCSoga2VlcCB1ZGxfZ2VtX29iamVjdF9mcmVlX29iamVjdCgpOyByZXF1
aXJlZCBieSBkYW1hZ2UgaGFuZGxlcgp2MzoKCSogdXNlIDMyIGJwcCBieSBkZWZhdWx0CgkqIHVz
ZSBkZWZhdWx0cyBmb3Igc2V2ZXJhbCBjYWxsYmFjayBmdW5jdGlvbnMKCSogcmVtb3ZlIGFsbCBm
YiBtb2R1bGUgcGFyYW1ldGVycwoJKiByZW1vdmUgdWRsX2ZiZGV2X2luaXQoKQp2MjoKCSogY29u
dmVydGVkIHVkbCB0byBTSE1FTSBhbmQgcmVjcmVhdGVkIGZiZGV2IHBhdGNoc2V0IG9uIHRvcAoK
VGhvbWFzIFppbW1lcm1hbm4gKDMpOgogIGRybS91ZGw6IFJlcGxhY2UgZmJkZXYgY29kZSB3aXRo
IGdlbmVyaWMgZW11bGF0aW9uCiAgZHJtL2ZiLWhlbHBlcjogUmVtb3ZlIGRybV9mYl9oZWxwZXJf
dW5saW5rX2ZiaSgpCiAgZmJkZXY6IFVuZXhwb3J0IHVubGlua19mcmFtZWJ1ZmZlcigpCgogZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgIHwgIDE2ICstCiBkcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9kcnYuYyAgICAgfCAgIDEgLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2Lmgg
ICAgIHwgICA2IC0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2ZiLmMgICAgICB8IDI4MiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4u
YyAgICB8ICAgNSArLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgICAxIC0K
IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jICB8ICAgMyArLQogaW5jbHVkZS9kcm0v
ZHJtX2ZiX2hlbHBlci5oICAgICAgIHwgICA2IC0KIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAg
ICAgICAgICB8ICAgMSAtCiA5IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMzE3IGRl
bGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
