Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D999E680C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 08:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AD310E15A;
	Fri,  6 Dec 2024 07:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dj7pYg7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A506910E154
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 07:38:35 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6ef542990dbso20970457b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733470715; x=1734075515;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fbEVs7detr4gWlE1fo2icdJ/ly1cL/4ZTUPJqPQuitM=;
 b=dj7pYg7xUDwwkXhbeskYU8yQxghjhY9t1atNQdx840M6488RCuIVUTn5VHFUCzOUto
 umHN206jOVkH8P9SX9QdvCC50EwzhNtKFZ9P8cu42fRZ42t/AE2bxtzOPMsGxhRcbqxO
 /kWzImol7jLiTBjwdYYKxyvwdds58qW4rfQfsikfNnllRUvXxylIBiPXCHVocIBd9GLe
 RgSTnoXy5f8DyN9WLWm2iWwStLwt8Hc91n372d/bNmR9ziYVRVhpjfEoZheGp2lwL+08
 y+8BgsnkDV4ZpXcOykLxf2lXidHi4dA8jz0TYGjRVaANOgZQQS7WtRXV1j845msEM/dY
 nJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733470715; x=1734075515;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fbEVs7detr4gWlE1fo2icdJ/ly1cL/4ZTUPJqPQuitM=;
 b=skSEk4u3CfRvW5A0ZsVZVDzje2gtMRCz0rT74gxmyk4XULC7wG6Qp9EF2mSiJYT0Sp
 D12AX/KvqRMtCCSiNqrGNGXAtSgK2w7nOBkeGBEoFOmRkB6CwEpnHwmv7ZAhz+wUWpWe
 JhrKJZTXuaoX3Ae0rJdAMBRedaXz7oFXSTzJ59nK9Gt5acTjiCBZEYOjWujqewV4ic96
 Wdb6rUan2QrAMGXmP4pDHvoLiI2gpT1eOoXQ5gcHwT/kgKeEtIeCll7S7ABQmsFuNXBa
 VHHsdHuDXIgMhae/bW5gOhvF82KOSYDmQsgc5NDxPRJIi+89N0mrhAowNqtD+2nlkigy
 ZBOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5RtAkfMXz4lRQeyGP3sjmpL29/th2ximd2tiEZiiRh3mPov6Rv9rfez/blCR9AeKngEXMESjWe9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAn/XN6nR6gfIrYTBRFTH/UEe9bCIGMflNv03V6P00r3njefuK
 OsO+xzzXo7mjlRcwBcq4Ci+71rjgz4yZES+8f5aYldsUzqe5SlKS44TcSYxr50neA9RsdB5jlFA
 GYh8qkg==
X-Google-Smtp-Source: AGHT+IEnc5lvx3tnV6q+JZ+7oy3fAvJY1NjK6AF22JKF722V6Xkpco7cg4TiIjSPK1XA9uKJwGB0NGP7c9Nv
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:bff4:a354:8911:79b3])
 (user=irogers job=sendgmr) by 2002:a05:690c:3143:b0:6ea:ecc3:ec61 with SMTP
 id 00721157ae682-6efe3bceae7mr17667b3.1.1733470714665; Thu, 05 Dec 2024
 23:38:34 -0800 (PST)
Date: Thu,  5 Dec 2024 23:38:26 -0800
In-Reply-To: <20241206073828.1119464-1-irogers@google.com>
Message-Id: <20241206073828.1119464-2-irogers@google.com>
Mime-Version: 1.0
References: <20241206073828.1119464-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Subject: [PATCH v5 2/4] proc_pid_fdinfo.5: Make pid clearer in the name and
 1st paragraph
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>,
 "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
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

Previously the pid was highlighted through being a tagged paragraph
but not mentioned in the description. Add italics to the path
emphasizing pid and then change the first sentence to include pid in
the definition.

Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>
---
v5. Switch .IR pid to .I pid
---
 man/man5/proc_pid_fdinfo.5 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 1c6c38423..2797ae216 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -6,10 +6,11 @@
 .\"
 .TH proc_pid_fdinfo 5 (date) "Linux man-pages (unreleased)"
 .SH NAME
-/proc/pid/fdinfo/ \- information about file descriptors
+.IR /proc/ pid /fdinfo " \- information about file descriptors"
 .SH DESCRIPTION
-This is a subdirectory containing one entry for each file which the
-process has open, named by its file descriptor.
+This subdirectory contains one entry for each file that process
+.I pid
+has open, named by its file descriptor.
 The files in this directory are readable only by the owner of the process.
 The contents of each file can be read to obtain information
 about the corresponding file descriptor.
-- 
2.47.0.338.g60cca15819-goog

