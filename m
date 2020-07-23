Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E560D22B250
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 17:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902736E20C;
	Thu, 23 Jul 2020 15:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB326E211
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 15:17:21 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gg18so3397372ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=djF6L1zi2Vg3zkHXdy1Qm9eMyDfh3s3BXZmfIjzspp8=;
 b=YttwQjd8+IVVUiRezBP0Srbfhm1vabauodEiYbBtdnuikLa6qfqcqTwMPHFbrPtkBk
 KyFN7DA5tpKbdjyR8cT67oI1QpSQFnLi4GJYaWPtWzkPhAXn0Ne6Rr3MyWXr1O9739HX
 l0v4dM2xBwLoVyhhTSqIRhU4QXCgjjSogj7YimHGDcYcA0iilUWKzs+zwYaO4cO3+Aja
 Dy/nGpz0TBQvdron9zvRboXNmoN/KTHPAvz+CdWTAzKNBemsoYZKovNnDQP85DMTVzUi
 9r+U0+c7ZxHHTnA4zLOaTDNdjfs5isXXmLqoziXNavpjxGyucop5+U2g4ewI40C6PzGk
 iQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djF6L1zi2Vg3zkHXdy1Qm9eMyDfh3s3BXZmfIjzspp8=;
 b=X8OSIgJqkWnIxoN9B+T8Q93v87wAY5/rl9pEKuIF0zCWBr/i2QRyaEaSIT6i88XdW1
 dY6rmB/vDitST8rjcDdvJaQzqcwAMvvyD0c7ZfH545UbCEAGRnsPQZT33GVivs75GhsR
 LywEhZLxkQ0ndW44yEz8v7CToXBSodgaN+h89XAkdRNhScrXVC9OipQE29olefhXl56s
 gqJnfJ4Uf0hBc4SyMiTtVyFPmumUlBBgdv9ie0zxhPuqIFWJYxyOax9MZUHSH9cO20y5
 qA40PQOfn/2EdPLbQPY64z33+4CbC9ahw0Sbuup/Fq2J3d4ORLPFgBcU+MyRQ9XkbLhN
 77AA==
X-Gm-Message-State: AOAM533CdtRhPycdWKme8Z9LAYjiTT692hKT+VcSRVTTfTsi/SoBpBSU
 a5GJh4/C/LAkBVhNc7x0uFG1/YgA
X-Google-Smtp-Source: ABdhPJzN5WZQ47krJrLEHhy2JnNgDfkmgW37HycjTE197jLSLGVVZviD5ZR0L0jsKNpPr0XZnLjHUg==
X-Received: by 2002:a17:906:c18d:: with SMTP id
 g13mr921848ejz.239.1595517439641; 
 Thu, 23 Jul 2020 08:17:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4ca2:7494:c4d6:51a4])
 by smtp.gmail.com with ESMTPSA id q6sm2239197ejn.30.2020.07.23.08.17.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:17:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/vram-helper: stop implementing init_mem_type
Date: Thu, 23 Jul 2020 17:17:09 +0200
Message-Id: <20200723151710.3591-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723151710.3591-1-christian.koenig@amd.com>
References: <20200723151710.3591-1-christian.koenig@amd.com>
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
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuYyB8IDE2ICsrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hl
bHBlci5jCmluZGV4IDgwMWExNGM2ZTllMC4uZjdmOTNhNDljZDdmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTEwMDcsMTggKzEwMDcsNiBAQCBzdGF0aWMgc3RydWN0
IHR0bV90dCAqYm9fZHJpdmVyX3R0bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywKIHN0YXRpYyBpbnQgYm9fZHJpdmVyX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCiAJCQkJICAgc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4pCiB7Ci0Jc3dpdGNoICh0eXBlKSB7Ci0JY2FzZSBUVE1fUExfU1lTVEVNOgot
CQlicmVhazsKLQljYXNlIFRUTV9QTF9WUkFNOgotCQltYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFn
ZXJfZnVuYzsKLQkJbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVE
IHwKLQkJCQkJIFRUTV9QTF9GTEFHX1dDOwotCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9Q
TF9GTEFHX1dDOwotCQlicmVhazsKLQlkZWZhdWx0OgotCQlyZXR1cm4gLUVJTlZBTDsKLQl9CiAJ
cmV0dXJuIDA7CiB9CiAKQEAgLTExMjYsNiArMTExNCw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3Zy
YW1fbW1fZGVidWdmc19pbml0KTsKIHN0YXRpYyBpbnQgZHJtX3ZyYW1fbW1faW5pdChzdHJ1Y3Qg
ZHJtX3ZyYW1fbW0gKnZtbSwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCSAgICB1aW50NjRf
dCB2cmFtX2Jhc2UsIHNpemVfdCB2cmFtX3NpemUpCiB7CisJc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyICptYW4gPSAmdm1tLT5iZGV2Lm1hbltUVE1fUExfVlJBTV07CiAJaW50IHJldDsKIAog
CXZtbS0+dnJhbV9iYXNlID0gdnJhbV9iYXNlOwpAQCAtMTEzOCw2ICsxMTI3LDkgQEAgc3RhdGlj
IGludCBkcm1fdnJhbV9tbV9pbml0KHN0cnVjdCBkcm1fdnJhbV9tbSAqdm1tLCBzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwltYW4tPmZ1bmMgPSAm
dHRtX2JvX21hbmFnZXJfZnVuYzsKKwltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZM
QUdfVU5DQUNIRUQgfCBUVE1fUExfRkxBR19XQzsKKwltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRU
TV9QTF9GTEFHX1dDOwogCXJldCA9IHR0bV9ib19pbml0X21tKCZ2bW0tPmJkZXYsIFRUTV9QTF9W
UkFNLCB2cmFtX3NpemUgPj4gUEFHRV9TSElGVCk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
