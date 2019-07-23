Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E671F15
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6176E354;
	Tue, 23 Jul 2019 18:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B440E8989A;
 Tue, 23 Jul 2019 10:39:36 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y15so18941506pfn.5;
 Tue, 23 Jul 2019 03:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQdJg2/4lKgWcnf+TrMSalC//3yipNmoM7+B+S1bhVE=;
 b=PzSVnA9unhHaAKY88Vu1zNbr5hFPFGVR9pri2VvUtGGeWNZZJjN/FEBVEC9uZ810zf
 KWxDY1CqcKUH8MQKeNiqREvFlcqyDNGGD14XdkriZXPpTh0FeKRkCoJ5tqVzWvOIx2Ts
 0giB71rvDprdHYQralF5ca91DQa/dU0Rx02J/qoTbqdO7Alq7GeaV3+yYyvxNPPh1FOy
 aYMJCLZ2lqMOFMiOs8SyoJin9QCQCJiSF+CGzqiedPrRjUQr4zKEkcvLByH/0ZigIPhC
 7ktJsFV7pbAOdtckY58x1NYXZ9cMf4rl+2wMoFmFLJv+I441CTcA+AV0E9A56FPSOAt1
 Zmfw==
X-Gm-Message-State: APjAAAV3dFM/wOcw861ukpwFwfmDCO6BAIYea0MrQzq9Oi2BHWoQmcuu
 0XBpgTT0ZlU+ttKCJvftIrk=
X-Google-Smtp-Source: APXvYqxQ/ir9kTkIUyO/t324fyo6Rd7HEo6Ovpm8eULgEKQjKMdvhheMwSxnT5oTtU0Ms/rNJI+MCA==
X-Received: by 2002:a65:4786:: with SMTP id e6mr74113367pgs.448.1563878376347; 
 Tue, 23 Jul 2019 03:39:36 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id g11sm39871799pgu.11.2019.07.23.03.39.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:39:35 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/i915: Use dev_get_drvdata
Date: Tue, 23 Jul 2019 18:39:16 +0800
Message-Id: <20190723103915.3964-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQdJg2/4lKgWcnf+TrMSalC//3yipNmoM7+B+S1bhVE=;
 b=GiHRqsP0MqsxXU0/DDu//IyiPLurIp7h8Qsc4piNtaGXN3jiK5EJBCA6lPrMoXCIYN
 zMOpq3/jdKVtnynmnqLVM/cLbx93BVIiWlRUUEqldUdORuuFbNLY5XLzMxZKmNoFz65+
 xwMqfWNpQ3+nxoJgz6yGiECPpGzTn4cras7w+UP1SBQLwJ41vEV4RBrxFBMGUxymiVVZ
 eFkw0vGPP3SKRg8h6Hpqog2kbfqgPj9fkVQt7lhglEsr6PpB6w/OMdPvv1YfVtdNcft9
 sJIg2PQqXKRt7ydQlBYg9qaeVrblO/60VYLz35Yl+bqXBDJ1dPBFs5DkU0eGTiGAfPnW
 xnRw==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyB0b19wY2lfZGV2ICsgcGNpX2dldF9kcnZkYXRhLAp1c2UgZGV2X2dl
dF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgoKU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZ
dWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1
X2Rydi5jIHwgMTIgKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jCmluZGV4IGY2MmUzMzk3ZDkz
Ni4uMmE2NzdjODk2NDFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKQEAgLTIzODQsOCArMjM4
NCw3IEBAIHN0YXRpYyBpbnQgaTkxNV9yZXN1bWVfc3dpdGNoZXJvbyhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQogCiBzdGF0aWMgaW50IGk5MTVfcG1fcHJlcGFyZShzdHJ1Y3QgZGV2aWNlICprZGV2
KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihrZGV2KTsKLQlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBkZXZfZ2V0X2RydmRhdGEoa2Rldik7CiAKIAlpZiAoIWRldikgewogCQlkZXZf
ZXJyKGtkZXYsICJEUk0gbm90IGluaXRpYWxpemVkLCBhYm9ydGluZyBzdXNwZW5kLlxuIik7CkBA
IC0yNDAwLDggKzIzOTksNyBAQCBzdGF0aWMgaW50IGk5MTVfcG1fcHJlcGFyZShzdHJ1Y3QgZGV2
aWNlICprZGV2KQogCiBzdGF0aWMgaW50IGk5MTVfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpr
ZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihrZGV2KTsKLQlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBkZXZfZ2V0X2RydmRhdGEoa2Rldik7CiAKIAlpZiAoIWRldikgewogCQlk
ZXZfZXJyKGtkZXYsICJEUk0gbm90IGluaXRpYWxpemVkLCBhYm9ydGluZyBzdXNwZW5kLlxuIik7
CkBAIC0yODk1LDggKzI4OTMsNyBAQCBzdGF0aWMgaW50IHZsdl9yZXN1bWVfcHJlcGFyZShzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAKIHN0YXRpYyBpbnQgaW50ZWxfcnVudGlt
ZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmtkZXYpCiB7Ci0Jc3RydWN0IHBjaV9kZXYgKnBkZXYg
PSB0b19wY2lfZGV2KGtkZXYpOwotCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2Ry
dmRhdGEocGRldik7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGRldl9nZXRfZHJ2ZGF0YShr
ZGV2KTsKIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7
CiAJc3RydWN0IGludGVsX3J1bnRpbWVfcG0gKnJwbSA9ICZkZXZfcHJpdi0+cnVudGltZV9wbTsK
IAlpbnQgcmV0OwpAQCAtMjk5NCw4ICsyOTkxLDcgQEAgc3RhdGljIGludCBpbnRlbF9ydW50aW1l
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqa2RldikKIAogc3RhdGljIGludCBpbnRlbF9ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICprZGV2KQogewotCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0g
dG9fcGNpX2RldihrZGV2KTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZk
YXRhKHBkZXYpOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBkZXZfZ2V0X2RydmRhdGEoa2Rl
dik7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShkZXYpOwog
CXN0cnVjdCBpbnRlbF9ydW50aW1lX3BtICpycG0gPSAmZGV2X3ByaXYtPnJ1bnRpbWVfcG07CiAJ
aW50IHJldCA9IDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
