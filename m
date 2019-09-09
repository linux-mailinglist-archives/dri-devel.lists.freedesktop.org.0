Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A23ADFF0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 22:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0C489E86;
	Mon,  9 Sep 2019 20:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A7F89E86
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 20:34:32 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MtO06-1iPVTp25eQ-00uoyd; Mon, 09 Sep 2019 22:34:11 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/tilcdc: include linux/pinctrl/consumer.h again
Date: Mon,  9 Sep 2019 22:33:57 +0200
Message-Id: <20190909203409.652308-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:/QqqGQ82u5FnWbqdP+LbmWnNSFW6MUOsg6NDDvR5njC66ZcA0Je
 L7djSnqII3g8lTGDbl/GBpLAil9uf6kZVGkLQaA2W9PzuLBzJEzWfDplIgVm2DyIO55lP5G
 N1v+MoAA4QQoj7lQoIp2nvGAf4vgnF+K5TlgBHoJWygDbvoBkE+XZb0GSj5CuwK1LsJfhUp
 3xPnWIVWeU204B5Qa4L+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YzuEVwEdJVE=:YBZv/R62O3TVU0Kr2ntzvH
 aEnQmenQ7MOIYP63yGzO2mA8M+3cIGxzLDgs7uKP6Crsz3wUv04WUwgdRwUNPWCe6boDSXxc5
 gGTtdrweJQCgl5aTEywkkPWdJP3ZMMnuHY/ya60EnGIAUKohQ/baIN+CeL9gMkXf0EB7ksufZ
 3EqgH1Qyx7FQ13cWHNzBqk6ZF3tCkfzUIIMWqFPQopT/b6xGX7Owv0JHyaoxH1zK+33uQw9U/
 W967y4S1+AWmCaEyHgAsFu/E0P4U66L7Gv+d9S9tNejzz9m+W38otjSxBjxaQOHPOgzbniAjS
 HaKCNKyRtUxWLdsphRh23wn0ppnqpmS+JSH5pCltY20+OWbBGRUOcfciVhRxcqYLCLxQW8y8R
 Ye3ymhXW0nulkvizvinLgcgXyTsBuYJNKziXMce6Qnzjtbar2TaOre/Aq3XESXFEbaw3bxStz
 Lq+zQLlMKzfv1V4nw+4kVID77Bu0UIJ5wTra0UaIVVBcGuoBZxXUCjEXiBOSbsP0L8s65+eTN
 RutaFlyLHKc5BZJvexf0QAxAQTGzo8vNn8k3EyubuR8/hEStCEf6WR2/cesO6GBMo+jcyczLi
 JEdZp5FwSLTF+jDHh1CmXIoxEW+nVA32dkROzopTDuv6RZV12gRHNnHDFvWkpoQMQgn2AX7+R
 PkJtWI5Y6ywaQF9th6ufH3BJWkxtYQC72oqleEdluMXxQA7dZJTBTWuDI+gV3O+yePzuPhrF4
 YUagZp9JK/Vt2O90LAbN5j+zaYaFITkuuvkNhKjHVJXS+UZpzguYOJBIQg1XjUH7abnif/GIv
 Jmr285ZZHI0n3k0l9iZvpYbzkcJWq8I2TD3L9zXuhYGrawYk34=
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3YXMgYXBwYXJlbnRseSBkcm9wcGVkIGJ5IGFjY2lkZW50IGluIGEgcmVjZW50CmNsZWFu
dXAsIGNhdXNpbmcgYSBidWlsZCBmYWlsdXJlIGluIHNvbWUgY29uZmlndXJhdGlvbnMgbm93OgoK
ZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmM6Mjk2OjEyOiBlcnJvcjogaW1w
bGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ2Rldm1fcGluY3RybF9nZXRfc2VsZWN0X2Rl
ZmF1bHQnIFstV2Vycm9yLC1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCgpGaXhlczog
ZmNiNTc2NjQxNzJlICgiZHJtL3RpbGNkYzogZHJvcCB1c2Ugb2YgZHJtUC5oIikKU2lnbmVkLW9m
Zi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGlsY2RjL3RpbGNkY190ZnA0MTAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYwppbmRleCA1MjVkYzFjMGYx
YzEuLjllZGNkZDdmMmI5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxj
ZGNfdGZwNDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMK
QEAgLTgsNiArOCw3IEBACiAjaW5jbHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+CiAjaW5j
bHVkZSA8bGludXgvb2ZfZ3Bpby5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
PgorI2luY2x1ZGUgPGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KIAogI2luY2x1ZGUgPGRybS9k
cm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZW5jb2Rlci5oPgotLSAKMi4y
MC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
