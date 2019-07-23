Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F671F24
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6566E375;
	Tue, 23 Jul 2019 18:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BD589ECD;
 Tue, 23 Jul 2019 11:10:17 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so18956277pfe.11;
 Tue, 23 Jul 2019 04:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LxPuevqDrXKRl+QxbN2Y5oAWPx3TYkvtTDFzWJOHnjs=;
 b=jymRxuKGH5PRQ1ymMB+UalFkRZszOLutVzf4SB1iG2Ce9FbB5Kqz58JD/J9xLPDX7v
 IAetDUvxUUNIZ2QtoJbPheWB0QlgBU1BHPkBHW+9yL6WSa13vsLNw5vipMrSEi29UvZC
 Ly/a+GBuhjTLCPmnknyGIGtS/a2GeWtZVn9jx8bWpmboeriXHxr2T3oh+ccdjKn4c1b2
 RfpIu9ZtqOmz997uSTSb/K4GkhaEr7BIf4oPnIjwNWRWL5m8/WssKE1h0/2Cf7lq8sqW
 NxWXifpeAMSbZ4TC8uVvzMFPcS07sjS3pY59GTSh83tGTlcER0m4uV/vmiFeHs2oDIxY
 df7w==
X-Gm-Message-State: APjAAAVQ8hJJcsWkCKoq/rhhysKZ9onnPm9bcur5slVpTWqfiErejLYX
 GqXJN3TDaCV0ilL3uvet2/8=
X-Google-Smtp-Source: APXvYqwtnMRZGdchvBOx/iERHD9AcxxAfbmX8wbGsH4fMfJSma9v9udnTzlqmuaZglKQqjqCkiCFvA==
X-Received: by 2002:a17:90a:3590:: with SMTP id
 r16mr82708219pjb.44.1563880217039; 
 Tue, 23 Jul 2019 04:10:17 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id v126sm11374576pgb.23.2019.07.23.04.10.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 04:10:16 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/radeon: Use dev_get_drvdata where possible
Date: Tue, 23 Jul 2019 19:10:08 +0800
Message-Id: <20190723111008.10955-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LxPuevqDrXKRl+QxbN2Y5oAWPx3TYkvtTDFzWJOHnjs=;
 b=YG9fniY0/+oHh3gEX8AcUgyWwxPgWQEPEhxjpZHpi94MqnZXwH+QdVyrVg+nmhEA8z
 SM/UqyK6EtA4Bc5sa2cLFgokwYU2cT+2CdpDqH76HU2xSy0bx+tFcd89YVxyXRuE2vLg
 MKlCtrYeWocOOwxzyIUrEwiYK2V+ct1EWD4rtV4vHOajVWE7zAA514xDwLU4s+36/CXp
 oWHrs4WW3S/NtRJrA+HaLlsocF2CgILAkg5SO1ue14LiWHwap7WudPDhryPG1+wpEr77
 RqA8g/5FuGum/BQHeLKg5v0+rVdCadygiLFXiEjpIN9sOreBsWuYIzbOT9LR7H+lf6Dh
 jBnQ==
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYyB8IDE1ICsrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwpp
bmRleCBhNmNiZTExZjc5YzYuLmIyYmI3NGQ1YmZmYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMKQEAgLTM1OCwxNSArMzU4LDEzIEBAIHJhZGVvbl9wY2lfc2h1dGRvd24oc3RydWN0
IHBjaV9kZXYgKnBkZXYpCiAKIHN0YXRpYyBpbnQgcmFkZW9uX3Btb3BzX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYp
OwotCXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwor
CXN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJcmV0
dXJuIHJhZGVvbl9zdXNwZW5kX2ttcyhkcm1fZGV2LCB0cnVlLCB0cnVlLCBmYWxzZSk7CiB9CiAK
IHN0YXRpYyBpbnQgcmFkZW9uX3Btb3BzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0J
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7Ci0Jc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IGRybV9kZXZpY2Ug
KmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAogCS8qIEdQVSBjb21lcyB1cCBlbmFi
bGVkIGJ5IHRoZSBiaW9zIG9uIHJlc3VtZSAqLwogCWlmIChyYWRlb25faXNfcHgoZHJtX2Rldikp
IHsKQEAgLTM4MCwxNSArMzc4LDEzIEBAIHN0YXRpYyBpbnQgcmFkZW9uX3Btb3BzX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAKIHN0YXRpYyBpbnQgcmFkZW9uX3Btb3BzX2ZyZWV6ZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRl
dik7Ci0Jc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7
CisJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAly
ZXR1cm4gcmFkZW9uX3N1c3BlbmRfa21zKGRybV9kZXYsIGZhbHNlLCB0cnVlLCB0cnVlKTsKIH0K
IAogc3RhdGljIGludCByYWRlb25fcG1vcHNfdGhhdyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0J
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7Ci0Jc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IGRybV9kZXZpY2Ug
KmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAlyZXR1cm4gcmFkZW9uX3Jlc3VtZV9r
bXMoZHJtX2RldiwgZmFsc2UsIHRydWUpOwogfQogCkBAIC00NDcsOCArNDQzLDcgQEAgc3RhdGlj
IGludCByYWRlb25fcG1vcHNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiBz
dGF0aWMgaW50IHJhZGVvbl9wbW9wc19ydW50aW1lX2lkbGUoc3RydWN0IGRldmljZSAqZGV2KQog
ewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwotCXN0cnVjdCBkcm1f
ZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2
aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJc3RydWN0IGRybV9jcnRjICpj
cnRjOwogCiAJaWYgKCFyYWRlb25faXNfcHgoZHJtX2RldikpIHsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
