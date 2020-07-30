Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D98232F17
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFDE6E8A0;
	Thu, 30 Jul 2020 09:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE76E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:00:31 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bo3so4549672ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 02:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7TfgMtTQ6g96UDPfNiMo+eWA7+sxRHXa7rA7d4IoY9k=;
 b=egZTU4gAx40f6O/IcjyaFec1mnnJryo5Zb9NVu1m5sFXotYvcraGo1AboiaeXLPNbV
 XzID+wOxmV2JnTWy7wOcGs0g8wSZeEGjjSbzkJ9sTu9TrpeNvHMF7XoU0ji6pt/tGHgw
 S7JK/wUuAHt61xkYIwMJFYSScUBqL0YOjhFn1aX/CEivb9IKtmFFenNDxZcE9WJzUVJ2
 rtstptkUm00Xeq7EOeHu4uj+cRVfGnORt4OVPVDudfy//TX88wbdxEyd+8puj7Khig9g
 lRprCj6He1og/hcdtvcl9rrRR8G8U9yWF5prNnlXjQeD274AZXMOTcrs9RK36l9PNARG
 FSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7TfgMtTQ6g96UDPfNiMo+eWA7+sxRHXa7rA7d4IoY9k=;
 b=W097O7tpIYn+3BC0omEfdBgtl91vKb/24lS3ymeF9zMEoVkwIqnWtkyUfjnVdCXyFV
 4yp/sIvTL4m+CRTYsm/jdzdWgvnk7koBQ3SL6zY/Fo0ss1OhBqnbHJQyC8ZMng6IurB1
 7U2ekfZ0vkqC2nQkJEW0hpUJShJLdNDsybE4SKTlWkCrjRURexuvn2WQxCX3C3gjkZ94
 AtBfKOsaXoyHHM3XAQt6g7zFtNTmSpAjr6jdzhT8HybagdbVRahW7vbrdAoWaSoTUSye
 bssMTkxweNLHQoGWHZDYzq1zOURyF9X7NKm0w9efwlgvYFrkMxu4PnvrXKLrK4K7mFQM
 me+A==
X-Gm-Message-State: AOAM533ymOd/B4FH5JG8A2yMoQ9xf0w8VkeVFszn+YFg+NGZvj6r0RZb
 YQlHwRhoH3cWviY0/SFCFCzHr+TW
X-Google-Smtp-Source: ABdhPJw5MkBBZkzJtvbq26/W8OkTh/UAE6P664CXi700Ozb9uxgccUqvOGo84nsrbVyETU1KopLV9w==
X-Received: by 2002:a17:906:e118:: with SMTP id
 gj24mr1585954ejb.219.1596099629481; 
 Thu, 30 Jul 2020 02:00:29 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:cb71:127d:d8c4:4acb])
 by smtp.gmail.com with ESMTPSA id j24sm4968238ejv.32.2020.07.30.02.00.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 02:00:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/qxl: stop implementing init_mem_type
Date: Thu, 30 Jul 2020 11:00:13 +0200
Message-Id: <20200730090015.17295-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730090015.17295-1-christian.koenig@amd.com>
References: <20200730090015.17295-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBqdXN0IGluaXRpYWxpemUgdGhlIG1lbW9yeSB0eXBlIHBhcmFtZXRlcnMKYmVmb3Jl
IGNhbGxpbmcgdHRtX2JvX2luaXRfbW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRt
LmMgfCAzNSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMK
aW5kZXggYWJiOWZhNGQ4MGNmLi44NTIwODlkN2Y3ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX3R0bS5jCkBA
IC01MSwyMSArNTEsNiBAQCBzdGF0aWMgc3RydWN0IHF4bF9kZXZpY2UgKnF4bF9nZXRfcWRldihz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKIHN0YXRpYyBpbnQgcXhsX2luaXRfbWVtX3R5cGUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCQkgICAgIHN0cnVj
dCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuKQogewotCXN3aXRjaCAodHlwZSkgewotCWNhc2Ug
VFRNX1BMX1NZU1RFTToKLQkJLyogU3lzdGVtIG1lbW9yeSAqLwotCQlicmVhazsKLQljYXNlIFRU
TV9QTF9WUkFNOgotCWNhc2UgVFRNX1BMX1BSSVY6Ci0JCS8qICJPbi1jYXJkIiB2aWRlbyByYW0g
Ki8KLQkJbWFuLT5mdW5jID0gJnR0bV9ib19tYW5hZ2VyX2Z1bmM7Ci0JCW1hbi0+YXZhaWxhYmxl
X2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwotCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9
IFRUTV9QTF9GTEFHX0NBQ0hFRDsKLQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJRFJNX0VSUk9SKCJV
bnN1cHBvcnRlZCBtZW1vcnkgdHlwZSAldVxuIiwgKHVuc2lnbmVkIGludCl0eXBlKTsKLQkJcmV0
dXJuIC1FSU5WQUw7Ci0JfQogCXJldHVybiAwOwogfQogCkBAIC0yMzgsNiArMjIzLDE5IEBAIHN0
YXRpYyBzdHJ1Y3QgdHRtX2JvX2RyaXZlciBxeGxfYm9fZHJpdmVyID0gewogCS5tb3ZlX25vdGlm
eSA9ICZxeGxfYm9fbW92ZV9ub3RpZnksCiB9OwogCitzdGF0aWMgaW50IHF4bF90dG1faW5pdF9t
ZW1fdHlwZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKKwkJCQkgdW5zaWduZWQgaW50IHR5cGUs
CisJCQkJIHVpbnQ2NF90IHNpemUpCit7CisJc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICpt
YW4gPSAmcWRldi0+bW1hbi5iZGV2Lm1hblt0eXBlXTsKKworCW1hbi0+ZnVuYyA9ICZ0dG1fYm9f
bWFuYWdlcl9mdW5jOworCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNI
SU5HOworCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfQ0FDSEVEOworCisJcmV0
dXJuIHR0bV9ib19pbml0X21tKCZxZGV2LT5tbWFuLmJkZXYsIHR5cGUsIHNpemUpOworfQorCiBp
bnQgcXhsX3R0bV9pbml0KHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2KQogewogCWludCByOwpAQCAt
MjU1LDE0ICsyNTMsMTMgQEAgaW50IHF4bF90dG1faW5pdChzdHJ1Y3QgcXhsX2RldmljZSAqcWRl
dikKIAl9CiAJLyogTk9URTogdGhpcyBpbmNsdWRlcyB0aGUgZnJhbWVidWZmZXIgKGFrYSBzdXJm
YWNlIDApICovCiAJbnVtX2lvX3BhZ2VzID0gcWRldi0+cm9tLT5yYW1faGVhZGVyX29mZnNldCAv
IFBBR0VfU0laRTsKLQlyID0gdHRtX2JvX2luaXRfbW0oJnFkZXYtPm1tYW4uYmRldiwgVFRNX1BM
X1ZSQU0sCi0JCQkgICBudW1faW9fcGFnZXMpOworCXIgPSBxeGxfdHRtX2luaXRfbWVtX3R5cGUo
cWRldiwgVFRNX1BMX1ZSQU0sIG51bV9pb19wYWdlcyk7CiAJaWYgKHIpIHsKIAkJRFJNX0VSUk9S
KCJGYWlsZWQgaW5pdGlhbGl6aW5nIFZSQU0gaGVhcC5cbiIpOwogCQlyZXR1cm4gcjsKIAl9Ci0J
ciA9IHR0bV9ib19pbml0X21tKCZxZGV2LT5tbWFuLmJkZXYsIFRUTV9QTF9QUklWLAotCQkJICAg
cWRldi0+c3VyZmFjZXJhbV9zaXplIC8gUEFHRV9TSVpFKTsKKwlyID0gcXhsX3R0bV9pbml0X21l
bV90eXBlKHFkZXYsIFRUTV9QTF9QUklWLAorCQkJCSAgcWRldi0+c3VyZmFjZXJhbV9zaXplIC8g
UEFHRV9TSVpFKTsKIAlpZiAocikgewogCQlEUk1fRVJST1IoIkZhaWxlZCBpbml0aWFsaXppbmcg
U3VyZmFjZXMgaGVhcC5cbiIpOwogCQlyZXR1cm4gcjsKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
