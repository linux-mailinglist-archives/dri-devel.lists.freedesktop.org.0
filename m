Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 900B371F1F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B44B6E35D;
	Tue, 23 Jul 2019 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C4E89EA6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:11:22 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u14so18917952pfn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 03:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hbUuvVU1khp7VKFUFggKwVLkVb4q2fUGBg+CHMkUJd0=;
 b=V3xW0Jm3rOOQy9H2qzJMFjHDMv/e9CK5G5CVqsI+Uo3LObGIcy8BXw79JcCXAN3pA+
 e68ypySG1CJIabHZ+SC6dJY/yjMVBWXMPtUAaPRI1cOuECpD/9kytr3eR1+TJDCxcNKw
 uxsYIjuiquSyJnhlFnICjDXLbmrTpYguViAMuUmnHda4sIiVHxzMfY1wNVrQCwo1dRDL
 L01hl668J9z8j87JrBMPcsFHl8W6TePDsGVj72AcWwv3Jm+6PtBgkOAgxrmH/KEN6+xy
 c+wwmvN+OJeQbZL1w/x+XD2EKOhTHEEaogvUXUZOTiyupbqQyzipvbbPP2j6ROs4o7Wm
 WL1Q==
X-Gm-Message-State: APjAAAWnwjRqayXAbZI2zbd7RAbvA16HheyqEMj1uc6Pf6UmDakJagRM
 v4ISB+sR0hOhH98iz4CLsIc=
X-Google-Smtp-Source: APXvYqwy0r8ZusvFqfsldnwyEu98w+HFWmNsxG7OqhmiSQqukGtgNtu0HJn5kk33sRugAZkhG5uf6w==
X-Received: by 2002:a63:ff66:: with SMTP id s38mr76616987pgk.363.1563876681873; 
 Tue, 23 Jul 2019 03:11:21 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id s12sm43414905pgr.79.2019.07.23.03.11.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:11:21 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/bochs: Use dev_get_drvdata
Date: Tue, 23 Jul 2019 18:11:04 +0800
Message-Id: <20190723101103.30250-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hbUuvVU1khp7VKFUFggKwVLkVb4q2fUGBg+CHMkUJd0=;
 b=l2j4H0CdEmZdpJCZvrzmmDahBvKCJ8fXgy9HbAdqesEQ8sZ1khYFM0LnORwhE0hYZ0
 3Ze25ytmIxhjnmXe3bQwRjJ54RsCOGLmVfy40uxaV/DUaqP0KDeJlf9RZD41izLJrZiP
 gqsxN0rhaGjKtFeWhCWAaiu7Qp4tfMieiTwmdDSW4eP7uzpVH0Fvu7FquuWyi0AqR6ek
 YHV3VCX2oqZlsxUPmlxxHdyGpoK5fnI+6t/Je1c5LbRl6cw83448Ey1iIOjizX1xb2u9
 1UIinCNFpTGduwYlPA3TYct8ABOKHz3JOc2A+IW+tqVEFULDqAXXgDGdoWRSrXKDwJDf
 QwkQ==
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
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9j
aHNfZHJ2LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKaW5kZXggOGYzYTViZGE5ZDAz
Li5kOGE1MDIwMDQwOGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19k
cnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfZHJ2LmMKQEAgLTgzLDE2ICs4
MywxNCBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgYm9jaHNfZHJpdmVyID0gewogI2lmZGVm
IENPTkZJR19QTV9TTEVFUAogc3RhdGljIGludCBib2Noc19wbV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKIHsKLQlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKLQlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKKwlzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCiAJcmV0dXJu
IGRybV9tb2RlX2NvbmZpZ19oZWxwZXJfc3VzcGVuZChkcm1fZGV2KTsKIH0KIAogc3RhdGljIGlu
dCBib2Noc19wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2
ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0g
cGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7CiAKIAlyZXR1cm4gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1
bWUoZHJtX2Rldik7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
