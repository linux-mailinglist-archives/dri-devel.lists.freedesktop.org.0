Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFB17433C2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 06:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E70F10E0F1;
	Fri, 30 Jun 2023 04:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967ED10E0F1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 04:52:58 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1b825993586so9987315ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 21:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688100777; x=1690692777;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QMopF0yt6SNtXURrQJLWhNgsWSeXqZOwln5eBV7VSyg=;
 b=X0Nlx2LfwFLDoIreU6J/7nCFcprP8zXSy4BxreWWpmLt4DmeFREe1gl/cooDVrO5uc
 QvfY2Cbb1PQsTS1vCHzruuFKJFgZT4o/rEBTiTTuI19w3kh2dNLNlnCtLlAOMOukieA1
 ZJ38X6tokAgCiMV300QArFfYtblOiB+cgTo6Cv1/mSKKV1g5KsbxMKb0LDp8/UKgYjmX
 O4mNSebBakv5tTr3K5HipZ4wOpIN2KIqlVbwTV147KpuJJhFWrw6eZanI7EWuXcbJEJ2
 YFSYjRYsRWlbBpq6SsWcGytlzaik5q2Z19hTce/BKQ8N4XwlNB7lOnCpcebUkw3N5buX
 wvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688100777; x=1690692777;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QMopF0yt6SNtXURrQJLWhNgsWSeXqZOwln5eBV7VSyg=;
 b=GsIiL4rcBze/uwF2W6fJe7HYkHOtQO/NzlDhdCTWXbIWhpg2w1bCyQpdiLAOC+iw//
 uQ+AEBRVa7zy5BmOzVrfuK2Z8lkCMY2tTGrxs17FFD3UKzvV6NgBiD1p5TqoPIYgWj0L
 4w3jd7/0osEobUpf0K+v/8bBubtsUK99RfiDXq4Ucg9TwilfUAe4uwMmhMO8a+7QXvMB
 4+1AEuTMEACNNVpM7pTcaoytAAmovEF/JlSbZlV52+JmiAkunaI7Ks2c2aMOEAQ2DXAb
 ztPaXrN9na8HtaarlZEeM2CR41B5S3juIy7M+Bf3tBNm93UUP1Nnnep+uqCi0/+9JxVc
 j5nw==
X-Gm-Message-State: ABy/qLZOEqhINknW1hNbyAfwgPQukxiCH085piF1CYHujv4E77lr/lbL
 FQeupcgxTYcMU7La6J98TbxficrXgZ4=
X-Google-Smtp-Source: APBJJlEV+O7siKol/DY7iCP6fmNhLuKbzWPu98PuLcJd0QPskucrT7s+QKRfycseJlSmVxoSK0wgrz7omUNv
X-Received: from jstultz-noogler2.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a17:903:2041:b0:1b8:fd7:cb0c with SMTP id
 q1-20020a170903204100b001b80fd7cb0cmr873422pla.5.1688100777397; Thu, 29 Jun
 2023 21:52:57 -0700 (PDT)
Date: Fri, 30 Jun 2023 04:52:23 +0000
In-Reply-To: <CABdmKX0A8mqz5cS4+CqjRgpQQKuSp=3SvE1KJ_di09VjJQVoGg@mail.gmail.com>
Mime-Version: 1.0
References: <CABdmKX0A8mqz5cS4+CqjRgpQQKuSp=3SvE1KJ_di09VjJQVoGg@mail.gmail.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230630045246.1674919-1-jstultz@google.com>
Subject: [PATCH] MAINTAINERS: Add T.J. Mercier as reviewer for DMA-BUF HEAPS
 FRAMEWORK
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 "T . J . Mercier" <tjmercier@google.com>, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T.J. has been responsible for dmab-buf items on the Android team
for awhile now, so it would be great to have him on as a reviewer.

Cc: T.J. Mercier <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kernel-team@android.com
Signed-off-by: John Stultz <jstultz@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb075f52d97b..f4e92b968ed7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6184,6 +6184,7 @@ R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
 R:	Laura Abbott <labbott@redhat.com>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <jstultz@google.com>
+R:	T.J. Mercier <tjmercier@google.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
-- 
2.41.0.255.g8b1d071c50-goog

