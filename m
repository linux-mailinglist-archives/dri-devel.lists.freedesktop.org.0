Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EDF36348
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C85895C8;
	Wed,  5 Jun 2019 18:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23F6895C8;
 Wed,  5 Jun 2019 18:23:44 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id m29so13899278qtu.1;
 Wed, 05 Jun 2019 11:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=reia3UimS1RHMW7ivtQYIp2C+7muRQyRh6r0xagjnlQ=;
 b=dJaCJdAi3AejNut/s37hLh1wadL7fqSoQXmYU51YXn65O3tek4jTcvE4iy7DLv/41/
 BEiEV9v7mofB6KCO6aW/NG3ny5dYweXj5Zy4S6+RcBQUc92PwzI6SXiAOupZm9mNImN8
 CAX9Zku7kZJKvqNQUFArgbuFq1+cQfKp5PcQyuVUZXFt7byQO98z6G1fOj4WVH9hFhKd
 9Fo5/LJ+c/8beMlaQTcu5C9wjxMtQz8EKU9ZYX+bUD734xdUNWMmmLRmCgW4VyStvKX5
 UyLTvoJFCVDdOFuZLLk08/ql7hpdBP7ixbTdvwX65ejI6iPEqGk+LNCuXaZ+vQieDmGR
 IWmA==
X-Gm-Message-State: APjAAAU4JG3PlnBpNG9xJidBwhoc+0gtwC+fL/ufpX7qT0ECGrOK+jSw
 fwIwnRP/ZjCCb+RnBbbuevMO9F1bc30=
X-Google-Smtp-Source: APXvYqxdy2DmZWXVct5ocQS+4Xlb0j4VnbfV9gk43xVfDgUvFFhH10px5k39DM3xPZZsVCuuCcbisw==
X-Received: by 2002:a0c:a066:: with SMTP id b93mr33463142qva.140.1559759023777; 
 Wed, 05 Jun 2019 11:23:43 -0700 (PDT)
Received: from localhost.localdomain ([71.51.161.233])
 by smtp.gmail.com with ESMTPSA id t20sm2724422qtr.7.2019.06.05.11.23.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 11:23:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [pull] amdgpu drm-fixes-5.2
Date: Wed,  5 Jun 2019 13:23:32 -0500
Message-Id: <20190605182332.4073-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=reia3UimS1RHMW7ivtQYIp2C+7muRQyRh6r0xagjnlQ=;
 b=oP6KuBP5ijPwg0WeESog5/EAYkqLf6xx+hMhDzDow0n0aIlwvc1w73Z8jV3wvmCd1Z
 CWwTKOctllWVpFDrjv4u9KdpNKgLDTh5k/6iYjiuYcHdyV1iM0EmHyjUm9h/UpVAEaDJ
 T4/dW7nJ3xpKkqRhEUcBk4pQodhMEN70huXXlLyu74oy+SYKZBpeFX5s+HGb8sIqEqS7
 Ysj7+jNDFEYi2e70QB+oTg8Hez7ZeTyUXAFZT2Q0E+K5MAIlUfV7owYNybqQBtyY08ns
 HvQhvNtfpGcbhwA586+Lswa57WPzQweHcYxklW4HiRxzvTyXWRvAkWLJVhAa+/5wM7cS
 3jQA==
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

SGkgRGF2ZSwgRGFuaWVsLAoKRml4ZXMgZm9yIDUuMjoKLSBBIGZpeCB0byBtYWtlIFZDRSByZXN1
bWUgbW9yZSByZWxpYWJsZQotIFVwZGF0ZXMgZm9yIG5ldyByYXZlbiB2YXJpYW50cwoKVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyYTNlMGI3MTYyOTZhNTA0ZDllNjVmZWE3YWNi
Mzc5Yzg2ZmU0MjgzOgoKICBNZXJnZSB0YWcgJ2lteC1kcm0tZml4ZXMtMjAxOS0wNS0yOScgb2Yg
Z2l0Oi8vZ2l0LnBlbmd1dHJvbml4LmRlL2dpdC9wemEvbGludXggaW50byBkcm0tZml4ZXMgKDIw
MTktMDUtMzEgMDk6MTU6MjUgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKCiAgZ2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+YWdkNWYvbGludXggZHJt
LWZpeGVzLTUuMgoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDE5MjkwNTk4OTMwMjJh
M2JiZWQ0MzkzNGM3MzEzZTY2YWFkNzM0NmI6CgogIGRybS9hbWQvYW1kZ3B1OiBhZGQgUkxDIGZp
cm13YXJlIHRvIHN1cHBvcnQgcmF2ZW4xIHJlZnJlc2ggKDIwMTktMDYtMDUgMTE6MTQ6MTUgLTA1
MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCkNoZW5nbWluZyBHdWkgKDEpOgogICAgICBkcm0vYW1kL3Bvd2VycGxheTog
YWRkIHNldF9wb3dlcl9wcm9maWxlX21vZGUgZm9yIHJhdmVuMV9yZWZyZXNoCgpMb3VpcyBMaSAo
MSk6CiAgICAgIGRybS9hbWRncHU6IGZpeCByaW5nIHRlc3QgZmFpbHVyZSBpc3N1ZSBkdXJpbmcg
czMgaW4gdmNlIDMuMCAoVjIpCgpQcmlrZSBMaWFuZyAoMSk6CiAgICAgIGRybS9hbWQvYW1kZ3B1
OiBhZGQgUkxDIGZpcm13YXJlIHRvIHN1cHBvcnQgcmF2ZW4xIHJlZnJlc2gKCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgICAgIHwgMTIgKysrLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyAgICAgICAgICAgIHwgMTUgKysr
KysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5oICAgICAgICAg
ICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgICAgICAg
ICAgIHwgIDQgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgICAg
ICAgICAgIHwgMTIgKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21n
ci9od21nci5jICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3Ivc211MTBfaHdtZ3IuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvaHdtZ3IuaCAgICAgICAgIHwgIDEgKwogOCBmaWxlcyBj
aGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
