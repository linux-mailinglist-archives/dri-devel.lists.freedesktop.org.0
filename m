Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685854C808
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0977B6E512;
	Thu, 20 Jun 2019 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2D86E439;
 Wed, 19 Jun 2019 16:19:55 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p15so110618eds.8;
 Wed, 19 Jun 2019 09:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/70MdY/0tH5yuFXGbIsIIxbdNqF1Z4II/87UAeKzlM=;
 b=W5CZeAO6r8Ngcv7bONgbLGJx4k21Csg8+u/JmN9drn+8uOPZyzn5H7a3cP1xN8KNvQ
 OWjPMbrcfPsHUe0oV1kqaEWRGWPi3tn/d4yHc8lqWGdvChI6R8EIvqWfjssM/GY4/VPw
 JrzB/EYJKJJlIgxQgtEufKK8OssJ6c1K+gB7vDXasyHajnFjq5WX1vMVzAqBJS7Ldec2
 zCDtU6lstiPvdDhYEkiGZFGuBR7niclwfGCdC1b8NCgLzxggp7geETUGKgQEgUXV7uBY
 eWuNFwlzbWztAY6YaxTYu71G+SoMKgCGTR5go57dGkyHd/hxvo3QQATvmtnmQ8HdIc3F
 Hinw==
X-Gm-Message-State: APjAAAWAAxO15FiKMBV8XFWRcfsaLb4GPyoF7JMpAa51BSNS5M00rSUY
 d9iD4i14eCm/FITIuxyPeddHM26GyzJj1A==
X-Google-Smtp-Source: APXvYqyloM3q+6YhVKxzh2feNRKyW+L9adi/61z6PVaPdtSijqAYhpJuHMoZWaZ44GgKaSYENXImkQ==
X-Received: by 2002:a50:8bfa:: with SMTP id n55mr100851735edn.9.1560961193617; 
 Wed, 19 Jun 2019 09:19:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id o22sm5871437edc.37.2019.06.19.09.19.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 09:19:53 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
Date: Wed, 19 Jun 2019 09:19:13 -0700
Message-Id: <20190619161913.102998-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/70MdY/0tH5yuFXGbIsIIxbdNqF1Z4II/87UAeKzlM=;
 b=Qk3jX7/otMjoix9fIHajqFF0BwJRqjAztAwca/uaSoluZurh4NgFEo+SLrgsMmNRjc
 Svf9wOa0Gq++Wjo3My8zblJRzOM5HoLunWu4Vfgd6dt9/00FsuAEdmurnSiUW4BOGFg3
 sGb9dSZJGj7aoo5lA3VViZA7XDb9Ndw9LRqmFS/jfV19PZp1KfhWt/U7oAsPxtX5AsAo
 jmriVXFpA08JKYEjJ67oY6WcvVOBo/rz8BpbdJXIgbiIcbH4fWkiTXfqmfhFZcMubEtJ
 mp/LElN5RTR7bFJ0JsS/8DqbwYjCDsN8fvKC8uSkkmxPfW+4F3MfIbIm5Db8dtM4Icjb
 cgbQ==
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
Cc: kbuild test robot <lkp@intel.com>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2xhbmcgd2FybnM6Cgpkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6
ODA6Njogd2FybmluZzogbG9naWNhbCBub3QgaXMKb25seSBhcHBsaWVkIHRvIHRoZSBsZWZ0IGhh
bmQgc2lkZSBvZiB0aGlzIGJpdHdpc2Ugb3BlcmF0b3IKWy1XbG9naWNhbC1ub3QtcGFyZW50aGVz
ZXNdCiAgICAgICAgaWYgKCFwaHktPmNmZy0+cXVpcmtzICYgVjNfMF8wXzEwTk1fT0xEX1RJTUlO
R1NfUVVJUkspIHsKICAgICAgICAgICAgXiAgICAgICAgICAgICAgICAgfgpkcml2ZXJzL2dwdS9k
cm0vbXNtL2RzaS9waHkvZHNpX3BoeV8xMG5tLmM6ODA6Njogbm90ZTogYWRkIHBhcmVudGhlc2Vz
CmFmdGVyIHRoZSAnIScgdG8gZXZhbHVhdGUgdGhlIGJpdHdpc2Ugb3BlcmF0b3IgZmlyc3QKICAg
ICAgICBpZiAoIXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlS
SykgewogICAgICAgICAgICBeCiAgICAgICAgICAgICAoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICApCmRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lf
cGh5XzEwbm0uYzo4MDo2OiBub3RlOiBhZGQgcGFyZW50aGVzZXMKYXJvdW5kIGxlZnQgaGFuZCBz
aWRlIGV4cHJlc3Npb24gdG8gc2lsZW5jZSB0aGlzIHdhcm5pbmcKICAgICAgICBpZiAoIXBoeS0+
Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBOTV9PTERfVElNSU5HU19RVUlSSykgewogICAgICAgICAg
ICBeCiAgICAgICAgICAgICggICAgICAgICAgICAgICAgKQoxIHdhcm5pbmcgZ2VuZXJhdGVkLgoK
QWRkIHBhcmVudGhlc2VzIGFyb3VuZCB0aGUgYml0d2lzZSBBTkQgc28gaXQgaXMgZXZhbHVhdGVk
IGZpcnN0IHRoZW4KbmVnYXRlZC4KCkZpeGVzOiAzZGJiZjhmMDllODMgKCJkcm0vbXNtL2RzaTog
QWRkIG9sZCB0aW1pbmdzIHF1aXJrIGZvciAxMG5tIHBoeSIpCkxpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvNTQ3ClJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJleS5s
Lmh1Z29AZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNo
YW5jZWxsb3JAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lf
cGh5XzEwbm0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5
XzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5XzEwbm0uYwppbmRl
eCBlYjI4OTM3ZjRiMzQuLjQ3NDAzZDRmMmQyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kc2kvcGh5L2RzaV9waHlfMTBubS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BoeS9kc2lfcGh5XzEwbm0uYwpAQCAtNzcsNyArNzcsNyBAQCBzdGF0aWMgdm9pZCBkc2lfcGh5
X2h3X3YzXzBfbGFuZV9zZXR0aW5ncyhzdHJ1Y3QgbXNtX2RzaV9waHkgKnBoeSkKIAkJCSAgICAg
IHR4X2RjdHJsW2ldKTsKIAl9CiAKLQlpZiAoIXBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBfMTBO
TV9PTERfVElNSU5HU19RVUlSSykgeworCWlmICghKHBoeS0+Y2ZnLT5xdWlya3MgJiBWM18wXzBf
MTBOTV9PTERfVElNSU5HU19RVUlSSykpIHsKIAkJLyogVG9nZ2xlIEJJVCAwIHRvIHJlbGVhc2Ug
ZnJlZXplIEkvMCAqLwogCQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJFR19EU0lfMTBubV9Q
SFlfTE5fVFhfRENUUkwoMyksIDB4MDUpOwogCQlkc2lfcGh5X3dyaXRlKGxhbmVfYmFzZSArIFJF
R19EU0lfMTBubV9QSFlfTE5fVFhfRENUUkwoMyksIDB4MDQpOwotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
