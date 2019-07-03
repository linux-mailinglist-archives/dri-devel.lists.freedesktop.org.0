Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E25F3B0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535336E2C1;
	Thu,  4 Jul 2019 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A96989893
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 17:01:56 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z23so3193005wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2019 10:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTnb3wOq3N88WSvvVUf/IfvNsBRFmYHBdDSAW0StD1A=;
 b=nABVdSg1bgTI6+yolRMC/w7bFrNbDYgz9qG+cJSGxOOgnBoL2F9kfgWLKKXgpv39kJ
 mt7DlmIPnEg5pZXiVX80hQsIg8pNLLSq3GbVJB2angp2S/5WZ+lnlSTj1/wKW0CqaJ8f
 W+u/E9QsvqLiWbKxdDZDO7WGtOYUgYrd5A/P9Oz87oJ4kfHPYbQ1YIuv5yoGJFE0vKLF
 TR4WZ3OtHM6tMVAW+6iFK94X5tJdpUgWvMLsNItDKNX61nYGbNhURuH6mCZIzwn92mZG
 6M46Zj+5wyAWzx1WeEzxBmEiVVSC5cl2FO2sBWVKFZGYywSygd/QtoN08Aof3DNqPtS3
 qFTg==
X-Gm-Message-State: APjAAAXMOqSpDinysn1RlvvGWDu0TKvrt0oKO+AGj2gPB9tF3IQUmpcw
 wSz00uUyGvq6sFgMJKN+TU4=
X-Google-Smtp-Source: APXvYqyjAHPEpCL8N6tHtJF3KphEj+qBYOV0Mtg0ovBu+V7H9bU8XkndFHxSlCRSbhJrwClV10dXbA==
X-Received: by 2002:a1c:4184:: with SMTP id o126mr8571665wma.68.1562173314889; 
 Wed, 03 Jul 2019 10:01:54 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
 by smtp.googlemail.com with ESMTPSA id e7sm3990330wrt.94.2019.07.03.10.01.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 10:01:54 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH] drm/client: remove the exporting of drm_client_close
Date: Wed,  3 Jul 2019 20:01:50 +0300
Message-Id: <20190703170150.32548-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
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
Cc: dri-devel@lists.freedesktop.org, Denis Efremov <efremov@linux.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9uIGRybV9jbGllbnRfY2xvc2UgaXMgZGVjbGFyZWQgYXMgc3RhdGljIGFuZCBt
YXJrZWQgYXMKRVhQT1JUX1NZTUJPTC4gSXQncyBhIGJpdCBjb25mdXNpbmcgZm9yIGFuIGludGVy
bmFsIGZ1bmN0aW9uIHRvIGJlCmV4cG9ydGVkLiBUaGUgYXJlYSBvZiB2aXNpYmlsaXR5IGZvciBz
dWNoIGZ1bmN0aW9uIGlzIGl0cyAuYyBmaWxlCmFuZCBhbGwgb3RoZXIgbW9kdWxlcy4gT3RoZXIg
Ki5jIGZpbGVzIG9mIHRoZSBzYW1lIG1vZHVsZSBjYW4ndCB1c2UgaXQsCmRlc3BpdGUgYWxsIG90
aGVyIG1vZHVsZXMgY2FuLiBSZWx5aW5nIG9uIHRoZSBmYWN0IHRoYXQgdGhpcyBpcyB0aGUKaW50
ZXJuYWwgZnVuY3Rpb24gYW5kIGl0J3Mgbm90IGEgY3J1Y2lhbCBwYXJ0IG9mIHRoZSBBUEksIHRo
ZSBwYXRjaApyZW1vdmVzIHRoZSBFWFBPUlRfU1lNQk9MIG1hcmtpbmcgb2YgZHJtX2NsaWVudF9j
bG9zZS4KClNpZ25lZC1vZmYtYnk6IERlbmlzIEVmcmVtb3YgPGVmcmVtb3ZAbGludXguY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKaW5kZXggZjIwZDFkZGEzOTYxLi5iZmZjODdh
YzIxYzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jbGllbnQuYwpAQCAtNjAsNyArNjAsNiBAQCBzdGF0aWMgdm9pZCBk
cm1fY2xpZW50X2Nsb3NlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50KQogCiAJZHJtX2Zp
bGVfZnJlZShjbGllbnQtPmZpbGUpOwogfQotRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X2Nsb3Nl
KTsKIAogLyoqCiAgKiBkcm1fY2xpZW50X2luaXQgLSBJbml0aWFsaXNlIGEgRFJNIGNsaWVudAot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
