Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514E99F53B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA7010E5D9;
	Tue, 15 Oct 2024 18:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RgG8CFN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC4F10E5D9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:27:52 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e3497c8eb0so2609197b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729016871; x=1729621671;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gM3YrE4Q9C+Si8Co65mOi5KDwsbx7zuVuDXpGhuB+1o=;
 b=RgG8CFN9Eripq4k1qVGjS4VeBUSN4EqH7lZyNwqN3svm3WD9yhZgbcVftWvhtOMW71
 XUTzKlfBNop0VKDT+nfoEEPL/Yc3EYJEZowvMWJ8qTLIw4iJf9vBrnOPfpH11qiMpFRc
 LqkUDc1iGkYf4klChzhwAFf8Lxm0CaUsanE+6xOKwya9EGtVxSZHcWfvP1nRlluCe+A4
 9RN1WwrCiyHc62yIM0notyndzHBhiObG63BYN+sjt39w7JgMqxVYAo2FkVICyUoyvJK6
 dIFSgyNa0AFzddKKIfcrXBVE9HcOUlaDQnKREu2gT3DeFbnJkWWMxbnprIquNvcxFJ6R
 a4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729016871; x=1729621671;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gM3YrE4Q9C+Si8Co65mOi5KDwsbx7zuVuDXpGhuB+1o=;
 b=AlWKV/2VLBk6r0533CwVT7p0oVTIvnR8COn8JunEtX3P8INIQ7wLJRnXfVAENjlM+4
 hYsGFBSdDw3P8EgO5hlDrzflv4vkSsTZ+N85tOvsyn+29fa2DxFHlwvI7w9tjugH9Dkj
 apLaWzcVILjwZiwJ4Hn3jNYtReCfYBMtr6LDd9chS/VRLm+16UyqnusBXCpPNK7RzIew
 skJUkBfw1Iu1ARIIT8mn+64ZpA3eM03dZpoedWl66puq1nlVc9/rwJbugIkNPTdXPo4+
 McY/ZJVJ4jBtRjupgT5Sd4FhfB7t8fzpXUfopk/O+T2t7tFUsPsGb2xFFQrgC9/4gRhV
 QyFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/vvMyR2/Vq6wqzwxldhes67f5F/n+xE5bxHGoFmWbsNyDSTqCSmYszs/m0L3+cFm3RwAQrE+YLUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsn1U4dUhRHd5MTrmahGLYyt2gYw5zwPwS8xiO8tvM8H81YBWM
 HKaor8iTN7kljgzfZH70a91jgwOXEWGOkIrC4IFWPX51XjAi4GeIS9jcriJ5W9oJE63GJ4xDgaC
 VAUwArA==
X-Google-Smtp-Source: AGHT+IEAFY2fyFLu1qZ7jkAzDxh/B5nDgk+pHq87dsAFMXXqft5EY45jsumwuefjFJboTq8uj+pIP6i8tkZf
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:690c:3587:b0:68e:8de6:617c with SMTP
 id 00721157ae682-6e3d3aacfc0mr155807b3.5.1729016871353; Tue, 15 Oct 2024
 11:27:51 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:27:45 -0700
Message-Id: <20241015182745.1012684-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v1] drm: Fix separator for drm-pdev
From: Ian Rogers <irogers@google.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PCI slot address for drm-pdev should be a colon not a period. On a
i915 GPU I see:
```
drm-pdev:       0000:00:02.0
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 Documentation/gpu/drm-usage-stats.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index a80f95ca1b2f..f56ca58312fc 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -56,7 +56,7 @@ Optional fully standardised keys
 Identification
 ^^^^^^^^^^^^^^
 
-- drm-pdev: <aaaa:bb.cc.d>
+- drm-pdev: <aaaa:bb:cc.d>
 
 For PCI devices this should contain the PCI slot address of the device in
 question.
-- 
2.47.0.rc1.288.g06298d1525-goog

