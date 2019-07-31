Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9377C79F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F8B89FA0;
	Wed, 31 Jul 2019 15:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1289F41;
 Wed, 31 Jul 2019 15:52:59 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so67052120qtl.5;
 Wed, 31 Jul 2019 08:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/e5rJ71qFKXwmIyoLAyWzrsP41pcnkto0tL41pV0reU=;
 b=ZLFIvCKgiwIkpDDKPOxNkrGgwnWO5j9/EBhHU5Lx3OMlHHvOudlRpCLRxSsRSSNee3
 Y2jeBkgoa4uBV6wD9SVPStx+db3NihN1Ckk7r8dZbWxuQGeu80G1FQ2EfYcrrYydDUxO
 Ug+mJS5xywXbUG1r8qTeFrVnmAiaca9FezyBsE9n0ZgqwlxSAkvHqtuN4aokXVPVICZJ
 Si82hnJC2x66S+b7ReLr7xKyUZsOV+unbJqZNopCGjEPGTfGX6nFo9/JeUKAkG8xj6PJ
 bUiHnng7fapHU1rjhhOWAr9atz2AU1ZY4DoRDA8f18zZyXXZieX3rGfDc9zdjxSh80O8
 G4/A==
X-Gm-Message-State: APjAAAWLpZehROgbAV2NpWncN1C7uSNiLvVeqLGyzm4/Kqyhwdp/Af06
 Kn/Prs0WVROll0O+6Ih3ZVCYz1BV
X-Google-Smtp-Source: APXvYqzW17+MVwsRkq2GOLzpebcujZzy0rxgUdBgtKwlXBTOdpL/J6EYwBukE1leubD8/joIoYkJUw==
X-Received: by 2002:aed:36e8:: with SMTP id f95mr85048312qtb.88.1564588378460; 
 Wed, 31 Jul 2019 08:52:58 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:58 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/amdgpu: drop drmP.h from vcn_v2_0.c
Date: Wed, 31 Jul 2019 10:52:45 -0500
Message-Id: <20190731155246.20603-7-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/e5rJ71qFKXwmIyoLAyWzrsP41pcnkto0tL41pV0reU=;
 b=HkMKZi/AZR7g6DkVyKLH+VJ9RYZtfkvyKg5PqWMA+vgEIgIuRVJaMnWQA2dLi1IKPe
 P3Mrl9ySg15P8/7+sLr4mgaNW0ESiI2NuUTvXXi/4ao0B1E5C9Fr4VSDKh5G+R7p5oA8
 lJwvbm3MIJ0GuhkjAy3BS6LBDHO9iN5Jnb/FmqvPqDARJiuEHib/0SPXbnkv/mbuaqY7
 9H22asRM56pE3kDCcAeHTew2XeEF4LQL6dEs2V1v98x/FtX3c/ydnsLPhwC58PsqUn04
 hsGxKofPfE4sd/uB1LPQUPqOuPtGJzxBdojwOvNgBeqNiFcwS/PRngw5/zdQKie3pBq/
 MPaw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGZpeCB0aGUgZmFsbG91dC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4IGVlZjNlYzU0
NDlhZi4uMzZhZDBjMGU4ZWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y25fdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMK
QEAgLTIyLDcgKzIyLDcgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZmlybXdhcmUuaD4KLSNp
bmNsdWRlIDxkcm0vZHJtUC5oPgorCiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1k
Z3B1X3Zjbi5oIgogI2luY2x1ZGUgInNvYzE1LmgiCkBAIC0yMTEyLDcgKzIxMTIsNyBAQCBzdGF0
aWMgaW50IHZjbl92Ml8wX2RlY19yaW5nX3Rlc3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcpCiAJCXRtcCA9IFJSRUczMihhZGV2LT52Y24uaW5zdFtyaW5nLT5tZV0uZXh0ZXJuYWwuc2Ny
YXRjaDkpOwogCQlpZiAodG1wID09IDB4REVBREJFRUYpCiAJCQlicmVhazsKLQkJRFJNX1VERUxB
WSgxKTsKKwkJdWRlbGF5KDEpOwogCX0KIAogCWlmIChpID49IGFkZXYtPnVzZWNfdGltZW91dCkK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
