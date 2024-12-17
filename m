Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B96279F4151
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 04:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FD410E837;
	Tue, 17 Dec 2024 03:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LZzv1jyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC4F10E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 03:49:37 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-725ce7b82cbso5659903b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 19:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734407376; x=1735012176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RHwC4IkPFLFA2YJtjf56D7Njy3q+au/+C2ewipT8jCg=;
 b=LZzv1jyj5eklfykVKC4GgQLGg9cvI1zwW958+AM9HdXDe3zProwIQY6c2OKed7pcYa
 ySeoAPdsMu3w0/FKKVwd/pgTVRNlhqR2EYt8NQ7bMl1XX6UU6vrkwuSkQIVwpGRiMipl
 dAyjZLm89YiAzG6ftAT+tzLSooQ6WT/MnVOMDP6BE/H5WTypjkDGVPUlf32tyUlkeOqj
 bfGIPTXa0UyXDdWkPMNgpm+jMnF8mCow/FH+W3/p0cHgOnBd4K/5wurHmEzAdLti3sGP
 SGHfukblQwexRqq/qr/P+Cvvvve9aIDFqc4yTvM7l7oKqjLxUJqan5/OEjv7rJ5lAVFo
 KkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734407376; x=1735012176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHwC4IkPFLFA2YJtjf56D7Njy3q+au/+C2ewipT8jCg=;
 b=ane1egtMsZ+hBuZX5slT9CClf3veyywwLnBCj3mkRFyjoCty81QlboAP5r/GcSGtsH
 GvusRJ2jInth+c5slN3iem+hc+8xna/WT9MadXKA3IUYa5lP0nOkKDVdnsS2YB8Y35fl
 p3RchniF8H9IiaYU3ETr035IYNex9LPECdxQGRqudK8gL1DylvY2vjSDmNyMmEDKIiEG
 ThZJgbs+oGC0zUIGENOBwy/5ix8fjpxc6TsSaMdWnTSrN9nc7YbiqE1JfYfO118Ai247
 LcHtCoePMiam0zg6dzRfCyKBQkWUEF+oJW06yEuNFB87D+lkaMzpGQkzzh4sbGDQx6/b
 fJLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBzQeLjUru1bMiOweC+KErdxzU02wzLA029n0zxPcVFQuFPSKsi5ZzZCUhaRxhbW4Vo+/ySLH0Uy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyujX1peBRSvp3gmmpM7iU4boWk9pXa/C2FlrotYYafxVXi77wP
 XGAtXoNC+DIX+Ko7jPsltOZBxrIZO3PR0Dk/6RsLDo/NzXEKxOXFQj0bNQ==
X-Gm-Gg: ASbGncuj6VPEukWXtgu+SnTfEHzsPE8KJ+E8JAjG8DOq6wQuWHXkveZhbeeMzNHkw8Q
 VIBY/mlb440cBTeJu/70OcrBN6sC9+lAD30UqFCxzRIbQxA/7JJSJudAWWnuFo/MzRou8X2T2wz
 6PXExIUsZYVN2/3BNR9G2QF0rS+7rLKQut0sKV/x1im1toG5PUkDvro0rdQMfRbxsBeRWbARKxn
 gX3fmAAAGGtKC/KTnFDaULhTsXobDz6p2NJBImKNDzriqRWoccuVkWN
X-Google-Smtp-Source: AGHT+IHkkzjFKa6T6f5I8fUnkhuTZkEfCbz+YwkuYZkslBD8aDyAlmi470dueY0lmNQx6ueoNLQUHg==
X-Received: by 2002:a05:6a00:1492:b0:725:f376:f4ff with SMTP id
 d2e1a72fcca58-7290c199ad6mr20130974b3a.13.1734407376470; 
 Mon, 16 Dec 2024 19:49:36 -0800 (PST)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bad9d2sm5565617b3a.157.2024.12.16.19.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 19:49:35 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 1FE3241F555A; Tue, 17 Dec 2024 10:49:32 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/sched: Separate drm_sched_fini() driver checklist
Date: Tue, 17 Dec 2024 10:49:15 +0700
Message-ID: <20241217034915.62594-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; i=bagasdotme@gmail.com;
 h=from:subject; bh=S9m4I7Y72fRnZkqseWk/7SquxQxDAjMpCLVy9dSSVYY=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDOkJXyRmLludN01tOjfvzE3tDUFCvjYKyx9c87jxWOXF9
 XvXZ68P7yhlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBEHksy/GbZvbb+uJ3tWxbl
 mPD/lzap1D2zuTF94YZ9n/vqWYtMZjkw/OHe/WKJ+2nLain5+9wsvwOnr2RLk3ihpH/z/han1fZ
 qgSwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
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

Commit baf4afc5831438 ("drm/sched: Improve teardown documentation")
documents drm_sched_fini() with a post-function call checklist for
drivers. The checklist triggers htmldocs warning (but renders correctly
in htmldocs output):

Documentation/gpu/drm-mm:571: ./drivers/gpu/drm/scheduler/sched_main.c:1359: ERROR: Unexpected indentation.

Separate the checklist from preceding paragraph by a blank line to fix
the warning. While at it, also end the aforementioned paragraph by a
colon.

Fixes: baf4afc58314 ("drm/sched: Improve teardown documentation")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20241108175655.6d3fcfb7@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7ce25281c74ce5..57da84908752c6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1355,7 +1355,8 @@ EXPORT_SYMBOL(drm_sched_init);
  * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
  * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
  * There is no solution for this currently. Thus, it is up to the driver to make
- * sure that
+ * sure that:
+ *
  *  a) drm_sched_fini() is only called after for all submitted jobs
  *     drm_sched_backend_ops.free_job() has been called or that
  *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called

base-commit: d172ea67dbeec5c90f72752c91d202d5718e3754
-- 
An old man doll... just what I always wanted! - Clara

