Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DC4F641
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 16:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766326E059;
	Sat, 22 Jun 2019 14:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71EE6E059
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 14:41:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a21so8529368ljh.7
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Q+aPNQuGqEdadqA4h5w5zS078TPuzEgRusBOyRh2EAs=;
 b=hcFcfLSzgsjbMYVtukY4BXXt1kjgCTLL/Tf+SOlCHtjDCd4JCQNNVof54x5r5GHM2g
 uvQlofoUJKaJrdIXMv9yWSodG9El7Esr8TXZFobJIYybq2yuS+dG2NTeL+vSuyWdQSJe
 X56Wzgu5RlZcEoqE4gDUHZTSttcV5n/84QaFcYFQPraSYji7o+qLuZvYk93hSYGPn1uw
 WB0H4PpRms04xE67u6+cWfwqmJ7D9hCcWbECCmnjNhYxPWYUqaujep8kFCdPMKxfS0w4
 +fGW+TxGGw5QUQJTttTeJpSOcu+MLzRcshUu4o3NZkVhsgZD68d1x2wlAUxFMtLGif1Q
 yTHQ==
X-Gm-Message-State: APjAAAVNyL0pd96tY02Zn8tpT9FGbWUjbRSiPwSkg9QHSYwXNJImL6+m
 uNqdxlahOB3tUkSISBrwHWlLrQNHdsKfmw==
X-Google-Smtp-Source: APXvYqwjeYFVZE/cGv4RhfMwcgHSRa4UHlCJUjktEUj5Pc5sVV8nuSfWTDsi9CO6pqvMsJcn7XcFWw==
X-Received: by 2002:a2e:7614:: with SMTP id r20mr48543292ljc.42.1561214463061; 
 Sat, 22 Jun 2019 07:41:03 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 u22sm969610ljd.18.2019.06.22.07.41.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 07:41:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>
Subject: [PATCH v1 0/2] drm/vmwgfx: drop use of drmP.h
Date: Sat, 22 Jun 2019 16:40:50 +0200
Message-Id: <20190622144052.29428-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+aPNQuGqEdadqA4h5w5zS078TPuzEgRusBOyRh2EAs=;
 b=Uv6Tua5ykgJPU5OJ81s9Q+EXs9t2LuOZkkp+bJuUBOtag/8ltx9JymJpi8+ohg3dZ0
 bMl1DX7houh8UhJUdAZxzHsZ9mr8jNWzxI2XkyXhy+ph0Pf2SPbZiTENGCUu4LqrTQFO
 py3fZaM/zZ547tAJ28mtuZmJlVp/vl7Iary9ezuqgmVEdgFBiR2407jYluLQaOdsTFXV
 37WVpsaV3g/SvIpHZmfPeCsdL1YevzkzxgPql0ACpGsv5vBBrwn7SCj+mjvI6QDtUvQ0
 E3CyX5ebYs7cFFeumv6vMu0WmDMgzZ1/HougClveP9G2Npyreincs/Y+4B87M4JShNZy
 Bquw==
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdHdvIHN0ZXBzIGRyb3AgdGhlIHVzZSBvZiBkcm1QLmgKRmlyc3QgcGF0Y2ggcmVtb3ZlIGRy
bVAuaCBmcm9tIGhlYWRlciBmaWxlcyBhbmQgZml4ZXMgZmFsbG91dC4KU2Vjb25kIHBhdGNoIHJl
bW92ZSBkcm1QLmggZnJvbSB0aGUgcmVtYWluaW5nIGZpbGVzLgoKV2hpbGUgdG91Y2hpbmcgdGhl
IGxpc3Qgb2YgaW5jbHVkZSBmaWxlcyBkaXZpZGUgdGhlbSBpbiBibG9ja3MKYW5kIHNvcnQgaW5j
bHVkZSBmaWxlcyB3aXRoaW4gdGhlIGJsb2Nrcy4KClBhdGNoZXMgbWFkZSBvbiB0b3Agb2YgZHJt
LW1pc2MtbmV4dCwgYW5kIGNoZWNrZWQgdGhhdAp0aGV5IGFwcGx5IHRvIHZtd2dmeC1maXhlcy01
LjIgaW4KZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+dGhvbWFzaC9saW51eAoKQnVpbGQg
dGVzdGVkIHdpdGggdmFyaW91cyBjb25maWdzIHdpdGggc2V2ZXJhbCBhcmNoaXRlY3R1cmVzLgoK
CVNhbQoKClNhbSBSYXZuYm9yZyAoMik6CiAgICAgIGRybS92bXdnZng6IGRyb3AgdXNlIG9mIGRy
bVAuaCBpbiBoZWFkZXIgZmlsZXMKICAgICAgZHJtL3Ztd2dmeDogZHJvcCByZW1pbmFpbmcgdXNl
cnMgb2YgZHJtUC5oCgogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fbG9jay5oICAgICAgICAg
IHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX29iamVjdC5oICAgICAgICB8ICA3
ICsrKystLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JpbmRpbmcuaCAgICB8ICAz
ICsrLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyAgICAgICAgIHwgIDEgLQog
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmLmMgICAgIHwgIDMgKysrCiBkcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyAgICAgICAgfCAxNyArKysrKysrKysrKy0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggICAgICAgIHwgMzAgKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9mYi5jICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZmVuY2UuYyAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9m
ZW5jZS5oICAgICAgfCAgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZmlm
by5jICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nbXIu
YyAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pcnEuYyAg
ICAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jICAgICAg
ICB8IDEwICsrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5oICAg
ICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9sZHUuYyAgICAgICAg
fCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jICAgICAgICB8
IDExICsrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9vdmVybGF5LmMg
ICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMg
ICB8ICA1ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zY3JuLmMgICAgICAg
fCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N0ZHUuYyAgICAgICB8
ICA5ICsrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYyAg
IHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdmFsaWRhdGlvbi5oIHwgIDMg
KystCiAyMyBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
