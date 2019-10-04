Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67799CB339
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 04:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B346E293;
	Fri,  4 Oct 2019 02:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526DB6E293
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 02:12:56 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 23so2863181pgk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 19:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=CbztEByvGzHsECJN5H1J52dAe2UKr0hWe9DWy6b2oF0=;
 b=qM7sQwi6VCCtRICWmUnzkLoZLVdNJYBCvXBPDTHf3R8gaKE16m2VJRb4wjjgQEzSkr
 2MTv2V2J2rca1d4EQPVazzOKBscQ4PXm7KBDJyiKpM2ezH+2ucMl08CwEX+8q5YWt9P1
 Kb7t5+20ckuF11lQwpuogzDAkFkU0d2YtYkA6gm6hG63sX+u/MtvxIw49ZyYzny/qkXE
 C3VzwILXOTZtdTV+PtaP4qcLj1qrl21nSQLN2VQQu4exXxYqA0M2mAeIJlmfUlFrhzm7
 VVyHzd6MqxqoUUkAR0MI4Ntxs8FWT8wWWGjhYdgU8gUOnOv6CWXoU6sVOkrQh7eVNE53
 Bu9A==
X-Gm-Message-State: APjAAAXzHqdNGQaz1oRMGgPfdsfiYYMXAw6gascyBsxktifNkCMHdaq9
 yP8M5Ky2zsnHE8biLbgYP9siWklmINo=
X-Google-Smtp-Source: APXvYqxRX5bHjaCZd18s/RsczWVFfcIuQE4XX1YoAQzjW6pzaxprLgtXd5n+fKE7R/3mzfqVeQ7KzA==
X-Received: by 2002:a17:90a:17c5:: with SMTP id
 q63mr13993070pja.106.1570155175811; 
 Thu, 03 Oct 2019 19:12:55 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
 by smtp.gmail.com with ESMTPSA id b14sm4324037pfi.95.2019.10.03.19.12.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Oct 2019 19:12:55 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/amdgpu: Fix build error when !CONFIG_PERF_EVENTS
Date: Fri,  4 Oct 2019 10:15:11 +0800
Message-Id: <1570155311-1272-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=CbztEByvGzHsECJN5H1J52dAe2UKr0hWe9DWy6b2oF0=;
 b=cssnydM97Ir5FPA/VgrUlaL8jHxaVn2a5xX5DYEtZ/Wiok4lDv9ytd82qT55JOJ/1n
 OrWNeiMSYrdH9FEoy1LPKMMrBY0OQeTaEkBREo3phtwVobv0jcQdlwMAUElWxBZYEdXj
 vI7j2YhQN4T9uPZj5mCugJ6YvyFWVY5CmzU9dxyK2kkdfZGpZbJWspWlGwCzxyLF6dUA
 +pIADK2R8P1yyVQeco18Q1mwQyXAdYQbwbcaN8HSMV1zbqOfxCboWm9Ey/P+2U48RxRE
 aFo6QLnziQB1dCAXpJAYJA2/2dk4ipAhrydgDcClPI2Ho7lcAJMhoWsWyPT5Dc1POzYu
 ymOQ==
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
Cc: dri-devel@lists.freedesktop.org, Luben Tuikov <Luben.Tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Huacai Chen <chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJldmlvdXMgcmVsZWFzZSBhbWRncHVfcG11Lm8gaXMgb25seSBidWlsdCB3aGVuIENPTkZJ
R19QRVJGX0VWRU5UUwppcyBzZWxlY3RlZC4gQnV0IGFmdGVyIGNvbW1pdCA2NGY1NWU2MjkyMzdl
NDc1MmRiMSAoImRybS9hbWRncHU6IEFkZCBSQVMKRUVQUk9NIHRhYmxlLiIpIGl0IGlzIGR1cGxp
Y2F0ZWQgaW4gYW1kZ3B1LXkuIFRoaXMgY2hhbmdlIGNhdXNlcyBhIGJ1aWxkCmVycm9yIHdoZW4g
IUNPTkZJR19QRVJGX0VWRU5UUywgc28gZml4IGl0LgoKRml4ZXM6IDY0ZjU1ZTYyOTIzN2U0NzUy
ZGIxICgiZHJtL2FtZGdwdTogQWRkIFJBUyBFRVBST00gdGFibGUuIikKQ2M6IEFuZHJleSBHcm9k
em92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgpDYzogTHViZW4gVHVpa292IDxMdWJl
bi5UdWlrb3ZAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogSHVhY2FpIENoZW4gPGNoZW5oY0BsZW1v
dGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9NYWtlZmlsZQppbmRleCA0MmUyYzFmLi4wMDk2MmE2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9NYWtlZmlsZQpAQCAtNTQsNyArNTQsNyBAQCBhbWRncHUteSArPSBhbWRncHVf
ZGV2aWNlLm8gYW1kZ3B1X2ttcy5vIFwKIAlhbWRncHVfZ3R0X21nci5vIGFtZGdwdV92cmFtX21n
ci5vIGFtZGdwdV92aXJ0Lm8gYW1kZ3B1X2F0b21maXJtd2FyZS5vIFwKIAlhbWRncHVfdmZfZXJy
b3IubyBhbWRncHVfc2NoZWQubyBhbWRncHVfZGVidWdmcy5vIGFtZGdwdV9pZHMubyBcCiAJYW1k
Z3B1X2dtYy5vIGFtZGdwdV94Z21pLm8gYW1kZ3B1X2NzYS5vIGFtZGdwdV9yYXMubyBhbWRncHVf
dm1fY3B1Lm8gXAotCWFtZGdwdV92bV9zZG1hLm8gYW1kZ3B1X3BtdS5vIGFtZGdwdV9kaXNjb3Zl
cnkubyBhbWRncHVfcmFzX2VlcHJvbS5vIHNtdV92MTFfMF9pMmMubworCWFtZGdwdV92bV9zZG1h
Lm8gYW1kZ3B1X2Rpc2NvdmVyeS5vIGFtZGdwdV9yYXNfZWVwcm9tLm8gc211X3YxMV8wX2kyYy5v
CiAKIGFtZGdwdS0kKENPTkZJR19QRVJGX0VWRU5UUykgKz0gYW1kZ3B1X3BtdS5vCiAKLS0gCjIu
Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
