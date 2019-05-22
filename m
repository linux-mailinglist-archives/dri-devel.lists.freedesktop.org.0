Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFCF26887
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4064389C14;
	Wed, 22 May 2019 16:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4CC89BFD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:42:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id i3so2905777wml.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DKrzunIyydueP1ABArbsyU6wbPwjgNS2c0Kr6npnPM=;
 b=ANpm5zRzG3CsjTBcn7WbueFIuKt+brX8Aht04mfPJeTUA7AnKEdj393QIr7aaS+7Cn
 h080c0GWApsZn2trO/+Ez2x0QgLo3USP8oemRlMX90bb10LH7V4vz1RaQMJzQBCMMA4z
 b2SdhsFF48RmOQDvv8wgIbvsu+TL7AEdovuy96oMg4vit14/4hayX1XBFXpowC18gaWV
 yMTxEptyTBHREdR1qHqsf9rD6ufXJLSyzBmRoL9sQ6KjYxxxtTZpO0wsoVsvMjGsyYC/
 m04vVbjxU5DRDRRhzn8XOLVoQfmiPKeReoNYTVngpnGq/2LbKkYUW9sEt3qDNcCXivfU
 CYFw==
X-Gm-Message-State: APjAAAVS7MBDyAt7eTrfmTlvzBRGRJBhNpoCS1DxLZ+n9ZnEA8KCxzaL
 4h6YTt+MNIXlLCLG/9E3mM7onQyG
X-Google-Smtp-Source: APXvYqwV9jyQPgH+Ni5KCSKizkyNxbz2D0yFCaqOi32oy5VqFVjA7Kwax01ltoajKvOzqwKd6D3W7Q==
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr8200833wmt.136.1558543363722; 
 Wed, 22 May 2019 09:42:43 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l18sm24576684wrv.38.2019.05.22.09.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:42:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vmgfx: kill off unused init_mutex
Date: Wed, 22 May 2019 17:41:16 +0100
Message-Id: <20190522164119.24139-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522164119.24139-1-emil.l.velikov@gmail.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9DKrzunIyydueP1ABArbsyU6wbPwjgNS2c0Kr6npnPM=;
 b=Ug446RUhhuSVanuiILd+TW7vv9oc1fRcofmEvW3KjnmHcgRSyfUOJWJpHqRCqAtgk5
 v2HoP6/qgvYxmD89yCXDJ1HWuiXCMvZ8CwH6tsb7lYBqils/cVkso6OcOqfGLYYdU/nc
 ni10whoByNa4iA8XFbNNS4HyrvpOYoZ4V7QDZz57kZY/g0NgRtA+C8rEpNDF/S6QMAR7
 Yfsw8b95sNcMqXJGKMxzWyW7yuDXv3MEWNClkpKBMDYL39nxxbFQdXMbLssT3Ws7w7E7
 0G97xCcqsSS7z2i9E60gfhGyKPEJz3uXa+cuLr+aq4ITl0no4fFrljYmhYYqXAscep+z
 bYUQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel@collabora.com,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFjY29yZGlu
ZyB0byB0aGUgZG9jcyAtIHByZXZlbnRzIGZpcnN0b3Blbi9sYXN0Y2xvc2UgcmFjZXMuIFlldCBu
ZXZlcgp1c2VkIGluIHByYWN0aXNlLgoKQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFw
aGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+CkNjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0
cm9tQHZtd2FyZS5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25l
ZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAxIC0KIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2Rydi5oIHwgNSAtLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggYTM4ZjA2OTA5ZmI2
Li5kM2YxMDhmN2U1MmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBAIC02NjQs
NyArNjY0LDYgQEAgc3RhdGljIGludCB2bXdfZHJpdmVyX2xvYWQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdW5zaWduZWQgbG9uZyBjaGlwc2V0KQogCQlJTklUX0xJU1RfSEVBRCgmZGV2X3ByaXYt
PnJlc19scnVbaV0pOwogCX0KIAotCW11dGV4X2luaXQoJmRldl9wcml2LT5pbml0X211dGV4KTsK
IAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZkZXZfcHJpdi0+ZmVuY2VfcXVldWUpOwogCWluaXRfd2Fp
dHF1ZXVlX2hlYWQoJmRldl9wcml2LT5maWZvX3F1ZXVlKTsKIAlkZXZfcHJpdi0+ZmVuY2VfcXVl
dWVfd2FpdGVycyA9IDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oCmluZGV4IDk2OTgz
YzQ3ZmI0MC4uOWJlMjE3NmNjMjYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaApA
QCAtNDg0LDExICs0ODQsNiBAQCBzdHJ1Y3Qgdm13X3ByaXZhdGUgewogCiAJc3BpbmxvY2tfdCBy
ZXNvdXJjZV9sb2NrOwogCXN0cnVjdCBpZHIgcmVzX2lkclt2bXdfcmVzX21heF07Ci0JLyoKLQkg
KiBCbG9jayBsYXN0Y2xvc2UgZnJvbSByYWNpbmcgd2l0aCBmaXJzdG9wZW4uCi0JICovCi0KLQlz
dHJ1Y3QgbXV0ZXggaW5pdF9tdXRleDsKIAogCS8qCiAJICogQSByZXNvdXJjZSBtYW5hZ2VyIGZv
ciBrZXJuZWwtb25seSBzdXJmYWNlcyBhbmQKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
