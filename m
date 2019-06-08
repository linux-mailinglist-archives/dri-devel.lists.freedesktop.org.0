Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0439BD8
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 10:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2AF8925E;
	Sat,  8 Jun 2019 08:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5A18925E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 08:35:24 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 131so3720583ljf.4
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jun 2019 01:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1POW5C1d+7NkpnVCECuSQo4MvLQtFdAxSTM9Lk3HnWQ=;
 b=iI1IoeJEzvUeL0jvYgN73IYy2BeU5uQocViK+Dc/hRdV5JY7AndOpm7o5qR/zEl7o/
 0Y/EHiethTv8XnGmGiaz03dwXIFd64PEzRWOsoGQlovuIFxot1uz5z3ZU9Ey8dIBhp+9
 iGgvAmL3cDO6wLs7dluGMr6gBF4e3oqktjmR3isPQlDo+x0Xiw+hMqKf5j9jYJwMcVg5
 d/NNd02sTgq89NTEbEHjZBwTn9pJZVsHm/ZyNai5YyBvcTOvelMtqpev0RajFHHf1TVu
 Tmsv6nMDLtbriumrmgDuMj8xTjxLcG4E+VgMw5V2AoVtO8t68VBsX8UXtDt3dJd4/z82
 KDTw==
X-Gm-Message-State: APjAAAVo5ejsnoSvblvJmxqD7O7tq8YtBDlt5HaPgmyxADXaoX555hM5
 37rH7noNEoJ14xAVSUJLZZDeQdT/GMgamw==
X-Google-Smtp-Source: APXvYqzLv3mRstR1I2CpIs/mRj542G9Pd27ibZY5zT2gFYzPs5Wt36nkRYDIxMHJRLDntpAZN2NpVQ==
X-Received: by 2002:a2e:9692:: with SMTP id q18mr31166061lji.89.1559982923189; 
 Sat, 08 Jun 2019 01:35:23 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n7sm824180lfi.68.2019.06.08.01.35.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 01:35:22 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 0/1] drm/exynos: drop use of drmP.h
Date: Sat,  8 Jun 2019 10:35:07 +0200
Message-Id: <20190608083508.6809-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1POW5C1d+7NkpnVCECuSQo4MvLQtFdAxSTM9Lk3HnWQ=;
 b=l03rM3+ve2JWMEAgARCCqm9B6ARU2rdHLDz3tYBInQtffO4lXz8BFBXb/yhirtn9eB
 40ayINN6wDsPKq8Xeo8QnEQjQy9ZAl6ImGWD32SaEn2yLfPBFH0YRgGvB88qe9A6TNB0
 rzzT0AuoXZFThdpNr96NyRir/QZXEcyKhNPNJkyyhPrL2tpRMqHQzWB8qO0VPLa6/0Cy
 C1G/GC24RNZbVpB8MBHI9UuqA3fucJtd8uNgJNWmm57R5jf25b+f0qnq1PL/gbY1QdB/
 k2840nxHCWtb3do/KYYKeQng9REdvF7cwlKe7SHXl2QFtTp3rqDMqMle6qGTWNGrhHSd
 9zOQ==
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJvcCB0aGUgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KCkJ1aWxk
IHRlc3RlZCB1c2luZyBhbGx5ZXNjb25maWcsIGFsbG1vZGNvbmZpZyBmb3IgdmFyaW91cwphcmNo
aXRlY3R1cmVzLgoKdjI6Ci0gYWRkIG1pc3NpbmcgcGVvcGxlIHRvIHJlY2lwaWVudCBsaXN0IG9m
IG1haWwKLSBubyBjaGFuZ2UgaW4gYWN0dWFsIHBhdGNoCgogICAgICAgIFNhbQoKU2FtIFJhdm5i
b3JnICgxKToKICAgICAgZHJtL2V4eW5vczogZHJvcCBkcm1QLmggdXNhZ2UKCiBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgfCAgNyArKystLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3M3X2RybV9kZWNvbi5jICAgIHwgIDggKysrKy0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jICAgICAgICAgICAgfCAxMyArKysrLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9jcnRjLmMgICAgICB8ICAyICstCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZG1hLmMgICAgICAgfCAgNiArKy0tCiBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHBpLmMgICAgICAgfCAgOCArKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyAgICAgICB8IDEyICsrKystLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmggICAgICAgfCAgOCArKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyAgICAgICB8IDIxICsr
KysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmIuYyAgICAg
ICAgfCAgNiArKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyAg
ICAgfCAgNyArKystLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZpbWMuYyAg
ICAgIHwgMTUgKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Zp
bWQuYyAgICAgIHwgMTQgKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZzJkLmMgICAgICAgfCAgOCArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9nZW0uYyAgICAgICB8ICA3ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZ3NjLmMgICAgICAgfCAxMyArKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9pcHAuYyAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fbWljLmMgICAgICAgfCAyMiArKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX3BsYW5lLmMgICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fcm90YXRvci5jICAgfCAxMCArKystLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMgICAgfCAxMiArKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX3ZpZGkuYyAgICAgIHwgIDkgKysrLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgICAgICAgICAgfCA0MSArKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVyLmMgICAg
ICAgICB8IDMxICsrKysrKysrKystLS0tLS0tLS0tCiAyNCBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5z
ZXJ0aW9ucygrKSwgMTM2IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
