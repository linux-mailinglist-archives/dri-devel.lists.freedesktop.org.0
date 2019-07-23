Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6271F01
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33A6E34E;
	Tue, 23 Jul 2019 18:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDBF898F3;
 Tue, 23 Jul 2019 10:39:58 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id m30so18947824pff.8;
 Tue, 23 Jul 2019 03:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Di0g6EEgkUa8jtL/xEkGliBvl02Xk0g05krGCQwF+C0=;
 b=VasVHvMp7OfnZPbztOlTKA+HlD8kfbSIhqE5mOegPm/b+u8J/WfsJ9KWguiZBJ7nLs
 XC6wCGxB/I8e0/Z4VT1qAHFbvxTyF/8VIDlPqqBejiW2EIVikyJbSajjz2esfz2tOouW
 pUhc0paKQ+Kfuz1LVRDMArrrOmh6z+PlxgUf0YJe/9cKn0RkD8cAfEI+HW48/lGRbL1i
 IMKk3S4HhwuhkVgmJqEPRGXr9G43AdIdb8fgt7DEWfzNx+AHWAkxY0MV1kW155NDtZfQ
 jKIvZasYZdCG4I73672BpAQV0HpBcU5dKHfcFaXkLw5J6YRUXu0YEQUrqQZW2rvuQLsB
 qt6w==
X-Gm-Message-State: APjAAAXLoWVQKHYCND3QAy/IYTCJVhTvR72Z68tpLQqSKzzkJOiW26Gh
 ezeAUTfGeijC85Sny1FA1ho=
X-Google-Smtp-Source: APXvYqy7Kjo9yItNbo9h6YPST0TITXU2NUUbMtA2mboZtD4dEoR9nnh4uwzcJcZLdh/lBbE4uEC2vQ==
X-Received: by 2002:a63:20d:: with SMTP id 13mr64729846pgc.253.1563878397922; 
 Tue, 23 Jul 2019 03:39:57 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id x9sm20574868pgp.75.2019.07.23.03.39.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:39:57 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/nouveau: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 18:39:39 +0800
Message-Id: <20190723103938.4021-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Di0g6EEgkUa8jtL/xEkGliBvl02Xk0g05krGCQwF+C0=;
 b=FwOqdcTPuWHslyIqWCg0jHZvRxaESjUl1kVvzINTDBMD1Pz/t53rxJBG58X7IdmmWL
 sGPB4oaAXM8veLfN8/TaJNN+KxLHZkIOAR5uX4uMCbJ9LDlpub0BP6KTl6wxxfmqcUe/
 0LJHP+CtHakkxv+3kGR0t0gqiArmXgtJezB9n6LryYiAW8ZKDk38hbqSOMgZyZwZN2H4
 G9QmrsvgHnufM9U8QHoa7FWJCypNLOPhGtDJRp3efrzHoDH+otqKwqbdKcrmXHv+768T
 KGU9mla+HYsr2XwDu2bMhs4PCzy876fa0Ik209o4naJVpmHOklGN6E9wmwEgjEHWLpX+
 KWTw==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2RybS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKaW5kZXgg
N2MyZmNhYmE0MmQ2Li4yMzIwM2RhZTIxMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZHJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kcm0uYwpAQCAtODgzLDE2ICs4ODMsMTQgQEAgbm91dmVhdV9wbW9wc19yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KQogc3RhdGljIGludAogbm91dmVhdV9wbW9wc19mcmVlemUoc3RydWN0IGRl
dmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwot
CXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0
cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJcmV0dXJu
IG5vdXZlYXVfZG9fc3VzcGVuZChkcm1fZGV2LCBmYWxzZSk7CiB9CiAKIHN0YXRpYyBpbnQKIG5v
dXZlYXVfcG1vcHNfdGhhdyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHBjaV9kZXYg
KnBkZXYgPSB0b19wY2lfZGV2KGRldik7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBw
Y2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKIAlyZXR1cm4gbm91dmVhdV9kb19yZXN1bWUoZHJtX2RldiwgZmFs
c2UpOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
