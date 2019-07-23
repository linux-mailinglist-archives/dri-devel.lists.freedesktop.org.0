Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D671F04
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28256E34D;
	Tue, 23 Jul 2019 18:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09D5898F3;
 Tue, 23 Jul 2019 10:40:22 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id m30so18948374pff.8;
 Tue, 23 Jul 2019 03:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PK0IBZUbQHnyOZDtUqj2prrcS6SHRWpLkmBXJgDEKWo=;
 b=X/s8MPEuMbUfcUdoeeLxqsKbz20yXtMogzU8XfIlm4aybhKnpEmhJMTKGq+LRor/sJ
 T1ibqNkkH4d7WLjt2j2SYmqDkkyeoWapSNGt3ok2cKUI//TrYqFcvYGxg31DPbX7m1ID
 71Q7G1Bsn3oXVGH8u5IiYQdT51mF2OI0QbdorJsRzz3zBcObMmOi1CRTp9UHR5j20NZ5
 j3VVZH13HzmAXR92XLH6gVpfDObDqg+ClYdQvSWrmcLmkQN1YrGsxigR22x7Td2vs/Vn
 h3lux6PvBxG5Cj6rDU25ZRtjYzHE+2md/Rl1s14cl7ihsEsaecTW5t8g6HZ/Vtv82do+
 jT0w==
X-Gm-Message-State: APjAAAWp/x5Uenb3CwUfDJQUGEvyPhSq1fXnbWWx7nM6mImASnjmKpcg
 Ve4IlNCH5h1k3st36qdUiC0=
X-Google-Smtp-Source: APXvYqxNi+SizBMl+BpgOlGEa4wEMzr8MJSUWRsgRL/2x6RHFUOsxCW0h9hrMpeXnwK8haoe2AWQXQ==
X-Received: by 2002:a17:90a:1a45:: with SMTP id
 5mr83413685pjl.43.1563878422662; 
 Tue, 23 Jul 2019 03:40:22 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id c8sm47990214pjq.2.2019.07.23.03.40.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:40:22 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/qxl: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 18:40:00 +0800
Message-Id: <20190723103959.4078-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PK0IBZUbQHnyOZDtUqj2prrcS6SHRWpLkmBXJgDEKWo=;
 b=JJEGgQaULMIyBtsF9Zmew5QKL6iwU5DJsa+yzl56UpjBCSjzgnjbTm1D8sUg4zA1fo
 Rqvm5clXYIpVWuG3UvJ9Guhup1h3dWDqi38rpeBx/FQY9fMC+0kHJ/8HCq7soKQOzCxx
 nwgn3YjizCPCQ+Qi1XLpVkmwNITnKWINbFnzbGrSoayK4iQeWX6AjULlyQGLwmHCQtVV
 amlHgx7MOvg5GCeXx3OWz4VxnjAET5qyqL22PCCiUT9Jg/TO7ESxfPptPJhKRwX6ycIF
 GmOZ/RysLc2ZGHYfZv3DeeT+V/3DXyPwVvAGE2FKJKioGkfe9H/X7N7azeOk2u9XISBs
 q4Kg==
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
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKaW5kZXggZjMzZTM0OWM0ZWM1Li5hZjFlMmIzNzc5
NDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCkBAIC0yMDYsMTYgKzIwNiwxNCBAQCBzdGF0aWMgaW50
IHF4bF9wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0aWMgaW50IHF4bF9wbV90
aGF3KHN0cnVjdCBkZXZpY2UgKmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3Bj
aV9kZXYoZGV2KTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0
YShwZGV2KTsKKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwogCiAJcmV0dXJuIHF4bF9kcm1fcmVzdW1lKGRybV9kZXYsIHRydWUpOwogfQogCiBzdGF0
aWMgaW50IHF4bF9wbV9mcmVlemUoc3RydWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lf
ZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7CiAKIAlyZXR1cm4gcXhsX2RybV9mcmVlemUoZHJtX2Rldik7
CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
