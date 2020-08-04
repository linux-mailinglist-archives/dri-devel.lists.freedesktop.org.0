Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7223B2E8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E36E39C;
	Tue,  4 Aug 2020 02:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EA26E39C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:13 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-zCuvHdyfMf-Xr_bZC3yWcw-1; Mon, 03 Aug 2020 22:57:07 -0400
X-MC-Unique: zCuvHdyfMf-Xr_bZC3yWcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623D8100AA21;
 Tue,  4 Aug 2020 02:57:06 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B807A90E7B;
 Tue,  4 Aug 2020 02:57:04 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/59] drm/vmwgfx/gmrid: don't provide pointless ttm debug
 callback
Date: Tue,  4 Aug 2020 12:55:43 +1000
Message-Id: <20200804025632.3868079-11-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZ21yaWRfbWFuYWdlci5jIHwgNyAtLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nbXJp
ZF9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nbXJpZF9tYW5hZ2Vy
LmMKaW5kZXggNGE3NmZjNzExNGFkLi5mYjFiZjRkZDkxZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2dtcmlkX21hbmFnZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9nbXJpZF9tYW5hZ2VyLmMKQEAgLTEzNywxNiArMTM3LDkgQEAgc3Rh
dGljIGludCB2bXdfZ21yaWRfbWFuX3Rha2Vkb3duKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgdm9pZCB2bXdfZ21yaWRfbWFuX2RlYnVn
KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAotCQkJCXN0cnVjdCBkcm1fcHJpbnRl
ciAqcHJpbnRlcikKLXsKLQlkcm1fcHJpbnRmKHByaW50ZXIsICJObyBkZWJ1ZyBpbmZvIGF2YWls
YWJsZSBmb3IgdGhlIEdNUiBpZCBtYW5hZ2VyXG4iKTsKLX0KLQogY29uc3Qgc3RydWN0IHR0bV9t
ZW1fdHlwZV9tYW5hZ2VyX2Z1bmMgdm13X2dtcmlkX21hbmFnZXJfZnVuYyA9IHsKIAkuaW5pdCA9
IHZtd19nbXJpZF9tYW5faW5pdCwKIAkudGFrZWRvd24gPSB2bXdfZ21yaWRfbWFuX3Rha2Vkb3du
LAogCS5nZXRfbm9kZSA9IHZtd19nbXJpZF9tYW5fZ2V0X25vZGUsCiAJLnB1dF9ub2RlID0gdm13
X2dtcmlkX21hbl9wdXRfbm9kZSwKLQkuZGVidWcgPSB2bXdfZ21yaWRfbWFuX2RlYnVnCiB9Owot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
