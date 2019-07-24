Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A37482A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82366E678;
	Thu, 25 Jul 2019 07:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D243789CDE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 13:17:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id m30so20962281pff.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 06:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ynlMYwwbUrHc4SOrISDzcpXFXjwRYIJ/NcSOEUlhS+4=;
 b=NLz8YLY0plFPRt/Lfah3xOHoNJKfqJdJmHJYeZqzUG9Cbhyw4yuUo9f/5aRu9UjYHe
 7xcDmU7PXMNi9a5/bsrWTwTt7JMY6sbxHHGfMPOPMV4uSUSxDix9GF2mJSJftDJuqAWI
 0etLgOVml84ReX40KzDDHKZ6O6QhDVqDSt8pPzJYrlAMRqZNAI0V1tsqPFebgzS3qZuB
 POqnxxDMjEpw+tUyBXh2eed9MpMDDnBfDlC0Ymi/3YXB5BzI/p9UrDaGSk58Zp/FtjPn
 ielSpWiQLx8dJjMiC2g//bY8qJ0EgTarHGG/tuvsGByXr75zC3irYRT8L4QwITwHRHTS
 v0ZA==
X-Gm-Message-State: APjAAAX4y4HxcZsIYuQAvB0ECxbcqYo7LOx/czmVg2OqWPMTHcNP2jkO
 jEwJBZA47KO5sbTgjYdr3yo=
X-Google-Smtp-Source: APXvYqxe+3Q32Rp5kuQ5S3t50hpt5vPn7SU/JGnCM+q6dfXdaWCHHt6DzrAraogN/MLgkzva0xgd5A==
X-Received: by 2002:a63:8a43:: with SMTP id y64mr80625585pgd.104.1563974270480; 
 Wed, 24 Jul 2019 06:17:50 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id 143sm67567613pgc.6.2019.07.24.06.17.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 06:17:49 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] fbdev: sm712fb: Use dev_get_drvdata
Date: Wed, 24 Jul 2019 21:17:44 +0800
Message-Id: <20190724131744.1709-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ynlMYwwbUrHc4SOrISDzcpXFXjwRYIJ/NcSOEUlhS+4=;
 b=uolqLFiJouhYH33CRrKgT+//sVZzPIrfc59iUU6EgZhr00v4l0ptOaDu0hPc/o53ar
 JZj8TTCyFEPxSh4IbMhxTQPCNR9ipqji3s6auZzfK791eBXTBiBs3gguqcYHBBozrHiO
 W/HqJYp5H/1iQycbJ1Wpy0ZgNnFmvHyspQOT2z8E2W6ViulHCH/ANPwCvlwVuqWzgp1v
 zDAOQuScR4t07QwfXSmBD4F/lUQexdNp9KWNKzwmbYXIDOhu57YXEtttk1lxL4c/RXq2
 NUInL4ZGIogVQqnGOmM6Ly/AxqhqdA0RrNWOdXUgUEE8QKXW5AwBQ7m8tC26h6QogKTy
 GkTg==
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEy
ZmIuYyB8IDggKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zbTcxMmZiLmMgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEyZmIuYwppbmRleCA3YjFiMGQ4ZDI3YTcuLjIwN2QwYWRk
Njg0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zbTcxMmZiLmMKKysrIGIvZHJp
dmVycy92aWRlby9mYmRldi9zbTcxMmZiLmMKQEAgLTE2OTQsMTAgKzE2OTQsOCBAQCBzdGF0aWMg
dm9pZCBzbXRjZmJfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAogc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBzbXRjZmJfcGNpX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2aWNl
KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXZpY2UpOwotCXN0cnVj
dCBzbXRjZmJfaW5mbyAqc2ZiOworCXN0cnVjdCBzbXRjZmJfaW5mbyAqc2ZiID0gZGV2X2dldF9k
cnZkYXRhKGRldmljZSk7CiAKLQlzZmIgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiAKIAkvKiBz
ZXQgdGhlIGh3IGluIHNsZWVwIG1vZGUgdXNlIGV4dGVybmFsIGNsb2NrIGFuZCBzZWxmIG1lbW9y
eSByZWZyZXNoCiAJICogc28gdGhhdCB3ZSBjYW4gdHVybiBvZmYgaW50ZXJuYWwgUExMcyBsYXRl
ciBvbgpAQCAtMTcxNywxMCArMTcxNSw4IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc210
Y2ZiX3BjaV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldmljZSkKIAogc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBzbXRjZmJfcGNpX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXZpY2UpCiB7Ci0J
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldmljZSk7Ci0Jc3RydWN0IHNtdGNm
Yl9pbmZvICpzZmI7CisJc3RydWN0IHNtdGNmYl9pbmZvICpzZmIgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2aWNlKTsKIAotCXNmYiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAogCS8qIHJlaW5pdCBo
YXJkd2FyZSAqLwogCXNtN3h4X2luaXRfaHcoKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
