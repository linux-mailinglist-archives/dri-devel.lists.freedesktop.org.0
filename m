Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858CDEFBA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AAA6E12A;
	Mon, 21 Oct 2019 14:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A506E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:35:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b24so13042019wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdncbwDUjQqnY7JtGrVTu3DyZ3SaO9/FVUphVX3LrW8=;
 b=c334iPp9kJrYNkKuqr2o/KWPameu5nKKp6t3Swci6z6FfNqrdfVgtkFjL37ypnEYpT
 PYtJ4vC1bDUsw1KcX37g6wLHA7o1nEfL1hYXr4LA3kenKaG7hcskqjCca+fosNno5q2m
 K3Q0Xo2SOtifsp8Skb+RKQeCWqgNSFEyap/r9DNyO28f3vrn92V1Pc/kbqWKf/yKrZSg
 LJvuByR+awP4Gf4afgYRw9DNo2L395ZnK5WVbcrzkhWy2j/KAlVgEq052sdgdWs3o3et
 xhkhmDBBR1qrn7qFST8zO6AabtGUha/doiEeKtIR2bZkRW4ZvIhTui+DH5iz0Mhy5W6N
 TJHw==
X-Gm-Message-State: APjAAAV7wbhx5YudYhxWIOcuatBg3Oxn27/0aR/gLxzxSnSXxNvyvYzx
 X/7H+vAqz1ZqEEXvXgHPBcCrha4o
X-Google-Smtp-Source: APXvYqwoFua8Jr3oXDndS4dXzTUoDFlshNIxcJFrnsEYVPrz2oCEVecVd8js9Do6Jei6MmAutxnvNw==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr20511462wmc.34.1571668513687; 
 Mon, 21 Oct 2019 07:35:13 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id w22sm13460246wmc.16.2019.10.21.07.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:35:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/13] drm/bridge: tc358767: Use DP nomenclature
Date: Mon, 21 Oct 2019 16:34:34 +0200
Message-Id: <20191021143437.1477719-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdncbwDUjQqnY7JtGrVTu3DyZ3SaO9/FVUphVX3LrW8=;
 b=frekzVW4cW8pyvAi7J8trQHqlbBdm/LLai+3Xx+57EiJlJX1I2YvmhIQy9Dr69H/ZV
 3pRpJMrcGzEYjL5RgwzCH7PZLaijXG/MN6QLdXMwpvI2gw6M1Ws1hxvS6tjg2H8XvJRK
 kVXkbb9PrT8MVSAQBHtavydwaRwYjrYDCbY+6g7YfZwkr33KnwOkTpdVNwXiENg56pOq
 dVhZICenhIv1CBug4aKrZH9RVtBWUmhV7c+5KpAIao5o7xcI8UlVD7eEfQOfXxeQw0hW
 LvZ7xgjPcQivtWnmR0DiVQA4jfbXo2CH8WUUz1HCfTNoUi+4vHLIOrCaoToRLsD0r+YE
 YhDg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBEUCBzcGVjaWZp
Y2F0aW9uIHVzZXMgdGhlIHRlcm0gImRlZmF1bHQgZnJhbWluZyIgaW5zdGVhZCBvZiAibm9uLQpl
bmhhbmNlZCBmcmFtaW5nIi4KClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwppbmRleCA5ZmU0MTM0NDI1YTcuLjgwMjk0NzhmZmViYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwpAQCAtNzE1LDcgKzcxNSw3IEBAIHN0YXRpYyBpbnQgdGNfZ2V0X2Rp
c3BsYXlfcHJvcHMoc3RydWN0IHRjX2RhdGEgKnRjKQogCQkodGMtPmxpbmsucmF0ZSA9PSAxNjIw
MDApID8gIjEuNjJHYnBzIiA6ICIyLjdHYnBzIiwKIAkJdGMtPmxpbmsubnVtX2xhbmVzLAogCQlk
cm1fZHBfZW5oYW5jZWRfZnJhbWVfY2FwKHRjLT5saW5rLmRwY2QpID8KLQkJImVuaGFuY2VkIiA6
ICJub24tZW5oYW5jZWQiKTsKKwkJImVuaGFuY2VkIiA6ICJkZWZhdWx0Iik7CiAJZGV2X2RiZyh0
Yy0+ZGV2LCAiRG93bnNwcmVhZDogJXMsIHNjcmFtYmxlcjogJXNcbiIsCiAJCXRjLT5saW5rLnNw
cmVhZCA/ICIwLjUlIiA6ICIwLjAlIiwKIAkJdGMtPmxpbmsuc2NyYW1ibGVyX2RpcyA/ICJkaXNh
YmxlZCIgOiAiZW5hYmxlZCIpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
