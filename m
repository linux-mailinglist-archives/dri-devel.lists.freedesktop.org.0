Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0195E454D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570DB6E8E2;
	Fri, 25 Oct 2019 08:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C1C6E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:27:22 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x127so878014pfb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 23:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=36i9Cnu9kOjCXlgna67ZglUl3zyetw5GjDP3IDvFlEo=;
 b=X8VQb1TJm2DuW6HQ5vIB1ojccQcr9BW7T379ssv1C8tocjpI7X9kotA2xT+lPberx9
 LCvtM3O5TEqSf1laQVfwa56cRZQ3fWTJBRJscaJIhoCSL7Aps86Ezny5ocUNRelSJREl
 2fBi4WtN9tTBblL1xvz2W91tN+sdHb9GP/iNX4690CX+D7wfSijcGoq/r7s0TlcdrVE6
 fjs8PqSlQB1aYMq8Fptev57wXVk2IjkYzQpP9Wf5OeDkzqpBQ4ui2Y8DlwK/Lu2MZy4n
 2kebVHCPTX4vONoW0XyTi+u2jOnQ0x7WHXZ0JEECUcpZ4RcyOH7jTn5Lciy/Oprmh0KH
 XflA==
X-Gm-Message-State: APjAAAVtysNUpnGiUZwada12jPCgCGEqwdiwUE8yZTOlWC+tcnGzXYAc
 8gpupcMkNkc1cIh9BxEBfdFMeQaF
X-Google-Smtp-Source: APXvYqzWYnHXA4Tds17u6XHQu3yTwo3hI/6dcLFuitGVStbBcBqpksh4yZ1DEa2qTe3bE9t3lNt5pQ==
X-Received: by 2002:a62:60c7:: with SMTP id u190mr2228481pfb.256.1571984841468; 
 Thu, 24 Oct 2019 23:27:21 -0700 (PDT)
Received: from bhanu-VirtualBox.danlawtech.com ([183.82.102.247])
 by smtp.gmail.com with ESMTPSA id x9sm1818398pje.27.2019.10.24.23.27.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Oct 2019 23:27:20 -0700 (PDT)
From: Bhanusree <bhanusreemahesh@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/gpu: Fix Missing blank line after declarations
Date: Fri, 25 Oct 2019 11:57:13 +0530
Message-Id: <1571984833-4596-1-git-send-email-bhanusreemahesh@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 25 Oct 2019 08:11:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=36i9Cnu9kOjCXlgna67ZglUl3zyetw5GjDP3IDvFlEo=;
 b=nHBF0tQwkaZ83s2Esp5nOW2xdh+Tmf+tKtRb4i9wjINzGyntPzQOobPIfGduHPR8UU
 FWp0/7fFjUtWN6MFOSYUBuWIiWJlrA7qw4gX1B9pRV+xYbqw+S7ZEj3+eVrPVhL/xPJ7
 qpWCXfFOrotfp7C3ir/71w3SPIip/VVF0GpZSYmw6/iNF+Y3kCCm2KiIuQ7etc52pi2L
 O9+z8hbQtk9mdy2e5xpeqgPfejLh8yczs5Uh+UBlV8AFgAHn0bPkhyWN+2EPA7ilpRqJ
 XWAAs1a78YFEi8LkZdqWZLg+g6OSeICSybIUyXRNcFEuOAYpiV/wMkxmqu98+Pq3PP/O
 i1MQ==
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
Cc: airlied@linux.ie, Bhanusree <bhanusreemahesh@gmail.com>, sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LUluc2VydCBhIGJsYW5rIGxpbmUgYWZ0ZXIgdGhlIGRlY2xhcmF0aW9ucy4KLUlzc3VlIGZvdW5k
IHVzaW5nIGNoZWNrcGF0Y2gucGwKClNpZ25lZC1vZmYtYnk6IEJoYW51c3JlZSA8YmhhbnVzcmVl
bWFoZXNoQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9jYWNoZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jCmluZGV4IGU1
NzQyNjEuLjEyZjhkMWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2FjaGUuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKQEAgLTkyLDYgKzkyLDcgQEAgZHJtX2Ns
Zmx1c2hfcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2VzW10sIHVuc2lnbmVkIGxvbmcgbnVtX3BhZ2Vz
KQogCiAjZWxpZiBkZWZpbmVkKF9fcG93ZXJwY19fKQogCXVuc2lnbmVkIGxvbmcgaTsKKwogCWZv
ciAoaSA9IDA7IGkgPCBudW1fcGFnZXM7IGkrKykgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBh
Z2VzW2ldOwogCQl2b2lkICpwYWdlX3ZpcnR1YWw7CkBAIC0xNTcsNiArMTU4LDcgQEAgZHJtX2Ns
Zmx1c2hfdmlydF9yYW5nZSh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIGxlbmd0aCkKIAlpZiAo
c3RhdGljX2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ0xGTFVTSCkpIHsKIAkJY29uc3QgaW50IHNpemUg
PSBib290X2NwdV9kYXRhLng4Nl9jbGZsdXNoX3NpemU7CiAJCXZvaWQgKmVuZCA9IGFkZHIgKyBs
ZW5ndGg7CisKIAkJYWRkciA9ICh2b2lkICopKCgodW5zaWduZWQgbG9uZylhZGRyKSAmIC1zaXpl
KTsKIAkJbWIoKTsKIAkJZm9yICg7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gc2l6ZSkKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
