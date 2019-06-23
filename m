Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C14FB13
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 12:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EB089A1E;
	Sun, 23 Jun 2019 10:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF389A1E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 10:23:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m23so9776931lje.12
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2019 03:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=w6qJCKDirQix6MVUcTU7Cm0oecCD3aSNSslrQAyPvc8=;
 b=r+URUzos8mGF0ZWDNScpnPRevWLhzaAmCC9CwTuhguQ2Rs1vzX7zwmmbmVkvSsonP/
 NkhZ6wD/Hk2/nJG1u3tXZJdLIjzSuEFUvjGbPDsV/0SmKD4fI/Dh9RySbvQOsKebU1bT
 NVOudFfTDPnmGOU2DDmAq7AI+gTiMPdn/f1FRRyhJAxd8pfVlqrxIeQNRqqWkueKitaf
 uzvVB6JKPUjWcPiUQ+zhC7ejuYsL14EWFki/8DOrvJSjMSQSIdCg940MMjEpZ1+CbtFA
 ZMDYgJHGspAmsI84lfKRCL+virODlHrvV0GcGIW4Xd+N8EvajeGQ26Ujsm4whBYQ2HFC
 GLmg==
X-Gm-Message-State: APjAAAXbJgyjaf2tgJhms9jQKIBRwaCUW1DWe2YSw6dHS7QdZ97VwjfT
 /3YuxdrcgeTDeI4dpLjVJ1o=
X-Google-Smtp-Source: APXvYqzCDe3EzVfCar5ofSoLLxQQQ38IH1awsCYVubT0PKqvKyAE++9MSsmyXwt0KDloVRodYpWK+w==
X-Received: by 2002:a2e:124b:: with SMTP id t72mr69919285lje.143.1561285424290; 
 Sun, 23 Jun 2019 03:23:44 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 y5sm1219299ljj.5.2019.06.23.03.23.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 03:23:43 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>
Subject: [PATCH v2 0/2] drm/vmwgfx: drop use of drmP.h
Date: Sun, 23 Jun 2019 12:23:32 +0200
Message-Id: <20190623102334.29406-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w6qJCKDirQix6MVUcTU7Cm0oecCD3aSNSslrQAyPvc8=;
 b=aOWtfNiFzwJj0yWAwWU6krPLR2EckBkQ2aMLmC6GcuAQHN4Th4x5iBK7NRdn3paUXD
 0wUJp9jy48trxpjTyb8sOhlHIZB2hby9bB7iF0WVqG+cgOcj4NKQnFD/YGYCwDv4owna
 qOaz0osU/uSskAtrV207H54yf0jiXDiALPRGrEbApSx3xVh27c98UVqzLzjiIOJLibXV
 sNAX4fWfYn4stRwpBjUfHw3WVCcpk3sL/H6R9xMrKyG7/eQ4Xng9I6yg4xotMP6376RC
 hHcC9j/MJqCYRV0dGSH6/a60i87jqQhNZlj6pqTiL3YaQtFrydfXhW+gGMVSIBx3AhlL
 mFwg==
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
djI6Ci0gZml4IHdhcm5pbmcgaW4gaTM4NiBidWlsZCByZXBvcnRlZCBieSAwLWRheQogIChtaXNz
aW5nIGluY2x1ZGUpCgogICAgICAgIFNhbQoKU2FtIFJhdm5ib3JnICgyKToKICAgICAgZHJtL3Zt
d2dmeDogZHJvcCB1c2Ugb2YgZHJtUC5oIGluIGhlYWRlciBmaWxlcwogICAgICBkcm0vdm13Z2Z4
OiBkcm9wIHJlbWluYWluZyB1c2VycyBvZiBkcm1QLmgKCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3R0bV9sb2NrLmggICAgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1f
b2JqZWN0LmggICAgICAgIHwgIDcgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfYmluZGluZy5oICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9i
by5jICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYu
YyAgICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICAg
ICB8IDE3ICsrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9k
cnYuaCAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X2ZiLmMgICAgICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9mZW5jZS5jICAgICAgfCAgMyArKy0KIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X2ZlbmNlLmggICAgICB8ICA1ICsrKystCiBkcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmMgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2dtci5jICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2lycS5jICAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfa21zLmMgICAgICAgIHwgMTAgKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfa21zLmggICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2xkdS5jICAgICAgICB8ICA2ICsrKystLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfbW9iLmMgICAgICAgIHwgIDIgKysKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X21zZy5jICAgICAgICB8IDExICsrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9vdmVybGF5LmMgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3Jlc291cmNlLmMgICB8ICA1ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9zY3JuLmMgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X3N0ZHUuYyAgICAgICB8ICA5ICsrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfdHRtX2dsdWUuYyAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdmFs
aWRhdGlvbi5oIHwgIDMgKystCiAyNCBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCA1
OCBkZWxldGlvbnMoLSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
