Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59009B981F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 20:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BE510E9F6;
	Fri,  1 Nov 2024 19:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LEsK36u9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD0F10E9F6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 19:12:03 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e3d660a1afso48184857b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730488322; x=1731093122;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=GTmM4lMLfU7fGWgK3OZ9YV6wKdDzMuf6g9cMhIBqTuY=;
 b=LEsK36u9si6gEsEQTKC+qyYbcAPIwHqVQiBrNybSQAkrROJoKBHg2cpcNE6gaORzvt
 2orkTKHgB3ULkLUqt6O39F4V1uoA1N+DKsQ7ouhA3T9mk3r3K9EaD+xVmipWYhokNgzK
 NCxv9YkBbfktHyoV2xF7gu3x5AkmkJiSwH5gHDcOb5gjNsOrq9vK5fGiKx54CYjV3i0+
 TC1XCyrl1OJXvZeW1dJ5jXzrXPsLp3RVKHe9/mSKUYAObMFdvH49e1X57R6abCgTG5e2
 DNPo+2VYy3c8Wz7Yx7wVNhxmRg4h0MLYgWQVyD4JItTt1CYyNSS2S2o35TCcKDMIUmlK
 7NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730488322; x=1731093122;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GTmM4lMLfU7fGWgK3OZ9YV6wKdDzMuf6g9cMhIBqTuY=;
 b=EwoQbk4BGp14i1P/W3Upv3QzqSb346H/s7ZgiEv9GzbJywgzsAjiT8vOl7EOxvelQj
 thCuMk03McfzAfEOjePHso34smnk0AQUyO2nLYj3Q/twIVuRN2w02gvpxUddkx9sjHed
 gPdHo9D5tbG8qA56aiItj+gqhr+mU2s+MtZi+nCISIZlWHgMM9XyzuoBxpEbtnS6r6C7
 phhG957MdlyTyNvBSh9DmyzSne6iWBar7XBHq+gqkp7j7vf9d/U/M5kqsb40Zn1ShrV9
 aOlcqNwuASpA9DQlZlS8V+q11IiI0K8s0kp7LGc5RFigxeTIT1cfJcMJlAi35mgeg3cP
 J6zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlDBTl/sTUhB+pJ0u10/tI77GbF099wGlilO4uDVq5X4ZdnOYlkz1sPd7t/Z3C+g/jJA2Esq4fhXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/U63tLPfCqEI13GQWFvuf2yahMfUjXlwX1T0P2hhQHyKn0uHR
 ZHp74eNOTFkDRWNzXJdPq9kzDSQzJwPGAraU7kGYJL4iQnu0ZKhi4+szl5b0SSQnjh20gftCUmF
 4Zebk9g==
X-Google-Smtp-Source: AGHT+IEFgEJ9V+dh83TejHj9KUuGhQ2RdYn3JAxq+LxsKxbpt4nL0i5Wq1qyj0+MuSpB5JhnuJSnp05GuRfa
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a05:690c:6c8c:b0:6e3:1702:b3e6 with SMTP
 id 00721157ae682-6ea64b8c450mr305747b3.4.1730488322219; Fri, 01 Nov 2024
 12:12:02 -0700 (PDT)
Date: Fri,  1 Nov 2024 12:11:54 -0700
In-Reply-To: <20241101191156.1272730-1-irogers@google.com>
Message-Id: <20241101191156.1272730-2-irogers@google.com>
Mime-Version: 1.0
References: <20241101191156.1272730-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v3 2/4] proc_pid_fdinfo.5: Make pid clearer in the name and
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
Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 87e6dbe56..935b54b4c 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -6,11 +6,12 @@
 .\"
 .TH proc_pid_fdinfo 5 (date) "Linux man-pages (unreleased)"
 .SH NAME
-/proc/pid/fdinfo/ \- information about file descriptors
+.IR /proc/ pid /fdinfo " \- information about file descriptors"
 .SH DESCRIPTION
 Since Linux 2.6.22,
-this is a subdirectory containing one entry for each file which the
-process has open, named by its file descriptor.
+this subdirectory contains one entry for each file that process
+.IR pid
+has open, named by its file descriptor.
 The files in this directory are readable only by the owner of the process.
 The contents of each file can be read to obtain information
 about the corresponding file descriptor.
-- 
2.47.0.199.ga7371fff76-goog

