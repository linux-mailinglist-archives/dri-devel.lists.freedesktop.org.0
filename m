Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6E1EF9C6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3224E6E8FD;
	Fri,  5 Jun 2020 13:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5CD6E8EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:58:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F317CAC51;
 Fri,  5 Jun 2020 13:58:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com
Subject: [PATCH 01/14] drm/mgag200: Remove declaration of mgag200_mmap() from
 header file
Date: Fri,  5 Jun 2020 15:57:50 +0200
Message-Id: <20200605135803.19811-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605135803.19811-1-tzimmermann@suse.de>
References: <20200605135803.19811-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>, Armijn Hemel <armijn@tjaldur.nl>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDk0NjY4YWM3OTZhNSAoImRybS9tZ2FnMjAwOiBDb252ZXJ0IG1nYWcyMDAgZHJpdmVy
IHRvIFZSQU0gTU0iKQpyZW1vdmVkIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBtZ2FnMjAwX21tYXAo
KS4gQWxzbyByZW1vdmUgdGhlIGRlY2xhcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiA5NDY2OGFjNzk2YTUgKCJkcm0v
bWdhZzIwMDogQ29udmVydCBtZ2FnMjAwIGRyaXZlciB0byBWUkFNIE1NIikKQ2M6IEdlcmQgSG9m
Zm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0
LmNvbT4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiAiTm9y
YWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogQXJtaWpuIEhlbWVsIDxhcm1p
am5AdGphbGR1ci5ubD4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS4zKwotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfZHJ2LmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgKaW5kZXggNDdkZjYyYjFhZDI5MC4uOTJiNjY3
OTAyOWZlNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5oCkBAIC0xOTgsNiAr
MTk4LDUgQEAgdm9pZCBtZ2FnMjAwX2kyY19kZXN0cm95KHN0cnVjdCBtZ2FfaTJjX2NoYW4gKmky
Yyk7CiAKIGludCBtZ2FnMjAwX21tX2luaXQoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYpOwogdm9p
ZCBtZ2FnMjAwX21tX2Zpbmkoc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYpOwotaW50IG1nYWcyMDBf
bW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwogCiAj
ZW5kaWYJCQkJLyogX19NR0FHMjAwX0RSVl9IX18gKi8KLS0gCjIuMjYuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
