Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623DE58FB6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FD46E877;
	Fri, 28 Jun 2019 01:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E246E358;
 Thu, 27 Jun 2019 17:36:47 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id c70so1208649pga.8;
 Thu, 27 Jun 2019 10:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T7nDlxgAbHwIPfNOE7F83rtRIAmZKxOzk4AlOTCiOZQ=;
 b=qVxAIRjDF0vANODn1aMa7dQHzrxLgooJ9SrlVXWHmTz3+gxo095ZC2iH27LHIQzQmg
 OQe04+KiuSkixxRvvQgDlWfnp2hdsXIMB7nKWsH+E1znNTAPMFk+6iA6mtH0rVkC1jQH
 adNoMBEsojXrhbj/OiNucx562t5gv4uBW4aurbIi9cQL6dJJES89Vp8cgRWOUvJUynwO
 hLeVGFSrct42ihYxx/sWiHkcVG9jyUDZvV8ic4VPGaZ07Hz3CoPSxubON9FTApMP6PRq
 Pi7zzg1EKacu9pQZtcsoC44gcH90cLBgHZ7c+xGP1RtiYsRoTTciecznkw3oqO6nGCFc
 fX4g==
X-Gm-Message-State: APjAAAVXfKWryTrmoLo4AlHAZUYi0BK3/D1HO8pWVr3Eew4842Hf46Tx
 HrISrrMgTvYj36JdHzcvFjA=
X-Google-Smtp-Source: APXvYqwOGe41/aVWH3nFXJGYtJo7kL6W6anx9Wkp3js7xNTLCEJIB3I5BMcvsSY4tEAO+dNr5LvEww==
X-Received: by 2002:a65:4348:: with SMTP id k8mr4934574pgq.219.1561657007423; 
 Thu, 27 Jun 2019 10:36:47 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id 201sm7441791pfz.24.2019.06.27.10.36.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 10:36:47 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 18/87] gpu: drm: Remove call to memset after kzalloc in
 tonga_smumgr.c
Date: Fri, 28 Jun 2019 01:36:38 +0800
Message-Id: <20190627173639.2779-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=T7nDlxgAbHwIPfNOE7F83rtRIAmZKxOzk4AlOTCiOZQ=;
 b=Ujl1mwOMHwV1d6/BYCi5LNmxPksXeTW4Q6NpgeQx2HkTbe+Y4jMd3sKbj44KdAb6GF
 zpNnI/WveW/NRlDkjb6xgUApufF8v13jMNZMzq4X6FBV+hZ/l9sqByFNIexL/ran+ljR
 sev0uchO6Nb2OLtSEIhYDE6deil6NvRlicSBGfGaW/+RkrrHTVLmGUZ9sgBm6avFE2Tm
 fFocFI+qUuIo9o1ynqwV4K3ihId2QgM1zCnosV82v3xgEz6KWlOsE0JF1pzjNGtVo4NK
 EVOOtlYAcm2syoPxBoIwHfK8eihGWP65/X0P8wvNGayftOfZG7OZyuBGnBi8F/vgzcTS
 PeRQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Fuqian Huang <huangfq.daxian@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a3phbGxvYyBoYXMgYWxyZWFkeSB6ZXJvZXMgdGhlIG1lbW9yeS4KU28gbWVtc2V0IGlzIHVubmVl
ZGVkLgoKU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBnbWFpbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3RvbmdhX3NtdW1n
ci5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3RvbmdhX3NtdW1nci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3RvbmdhX3NtdW1nci5jCmluZGV4IDNl
ZDZjNWYxZTVjZi4uNjA0NjJjNzIxMWUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9zbXVtZ3IvdG9uZ2Ffc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211bWdyL3RvbmdhX3NtdW1nci5jCkBAIC0zMTE0LDggKzMxMTQsNiBAQCBz
dGF0aWMgaW50IHRvbmdhX2luaXRpYWxpemVfbWNfcmVnX3RhYmxlKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IpCiAJY2dzX3dyaXRlX3JlZ2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1tTUNfU0VRX1dSX0NU
TF8yX0xQLAogCQkJY2dzX3JlYWRfcmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwgbW1NQ19TRVFfV1Jf
Q1RMXzIpKTsKIAotCW1lbXNldCh0YWJsZSwgMHgwMCwgc2l6ZW9mKHBwX2F0b21jdHJsX21jX3Jl
Z190YWJsZSkpOwotCiAJcmVzdWx0ID0gYXRvbWN0cmxfaW5pdGlhbGl6ZV9tY19yZWdfdGFibGUo
aHdtZ3IsIG1vZHVsZV9pbmRleCwgdGFibGUpOwogCiAJaWYgKCFyZXN1bHQpCi0tIAoyLjExLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
