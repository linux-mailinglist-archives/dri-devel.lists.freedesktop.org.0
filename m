Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63399B9A09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 22:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857110EA06;
	Fri,  1 Nov 2024 21:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HFRdfjjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59410EA06
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 21:18:40 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-e29205f6063so4276381276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730495919; x=1731100719;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7PJ/2oZM0NegT7a5kDJ3aS9OgH6F8LEnJac0dVeN2cw=;
 b=HFRdfjjLUP8XUbpygtutgxDZyauU7wrtOWaNN2o2Ydsld2xFRGYuzq+gl62c97TmT4
 OeuGEWTAzualIWTqsQHJQ6K0aVOfw9AMU4Dj2r2VxhcaiJmkIMRcDBzgw2cLk9fNu7d3
 tlwB+sHNIJTRJLEOjWAf0RrVRAqpF320N2Jc6U+U7BPjkMAFqMw+kRT1Uc+1jUE0gKad
 MfrvmnBoZSW1xsICc6eptJ/1SsosQEQThM4441fQ08hxJvjH5iqH7EfZkLEMhpH7vOTU
 GycAsiMXNJ3yK7c0V/HywNY3kXDDRcdomaMTIYqAmpYMdFgiDQKDbBVRi79DF86tF6rj
 lcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730495919; x=1731100719;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7PJ/2oZM0NegT7a5kDJ3aS9OgH6F8LEnJac0dVeN2cw=;
 b=QGvpetvE9Pj05QqccNj158b2nH7P/bJyJHRlYeUBa6LC4/Pbf+KfarxCLPRgSFTWsd
 X9NNJ0ko6jhfp+z9woUM4QKKGfcHqiHj9JCQ9/3LHBbsSYuMirdy7vwRzmU49yaIeSuc
 L1/WmZtwO6G+DlpoCun2ycj2Yd/tSylPhxeMxImHXhG1znFOKu823qi0IQ0FbAwksGvW
 Rle3FO3jPmt/QiA+fs6fIUEEP+37Bf2qIGXpoZ8H3rV319vvTUBuV1MBEe6ukofcjugn
 vB1LsUmyOWh92lFf+MKqybOYzRqjPwEWgL8+cYDOievSBzasjvAIS5FanOSUNPPpS3js
 ymVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVqNhm5B7H++mS32tzQlwcvrjSrIiFiyvcAsg1O37FEvCEWnDqvpJeNcJat31mmxAnoRcb1YmVcjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQNBQX9/NDZchgYa9qapMT+HnhF0zAfx+W26/kteViG0OG56vL
 kz2mvFeIDkPgXyebATIewYmm1FxZfRZj9rmgqgSyNdR6KFfk/2i2lUE+hY4Gpxb/3mf5ZI1uGle
 OummhDw==
X-Google-Smtp-Source: AGHT+IF5V1HJGBWziiGDeXXMkzf2czx8Sfxn3tBr/5H0nwa1W8aFmG7SyX3wNTs33/2yNGg5OwGEuXPobUmv
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a25:a1e9:0:b0:e30:b93a:b3e4 with SMTP id
 3f1490d57ef6-e33025549e4mr5858276.4.1730495919069; Fri, 01 Nov 2024 14:18:39
 -0700 (PDT)
Date: Fri,  1 Nov 2024 14:18:28 -0700
In-Reply-To: <20241101211830.1298073-1-irogers@google.com>
Message-Id: <20241101211830.1298073-2-irogers@google.com>
Mime-Version: 1.0
References: <20241101211830.1298073-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v4 2/4] proc_pid_fdinfo.5: Make pid clearer in the name and
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
index ad739bd84..be1675b69 100644
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
+.IR pid
+has open, named by its file descriptor.
 The files in this directory are readable only by the owner of the process.
 The contents of each file can be read to obtain information
 about the corresponding file descriptor.
-- 
2.47.0.199.ga7371fff76-goog

