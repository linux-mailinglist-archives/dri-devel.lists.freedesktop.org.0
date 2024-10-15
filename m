Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A165C99F5BF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95A710E5EC;
	Tue, 15 Oct 2024 18:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IqbLwDFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF3810E5EC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:38:48 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-e290b8b69f8so9289301276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729017527; x=1729622327;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Z3Rbrb2Z8GgUdGOPxQ4ICuPuYc4IdHw2IwxB2sqLH4=;
 b=IqbLwDFZXJgKVuzU9Yzm/hnudwRbMDw/tWCGT4PJ+9u7M69/PcdPQv+AD9To31Hrek
 BTO4lqDsnaIbYTZBoe+dV0KVQTOZl1av0YphUrq915vOd87p4n29nHwh6LBe3sGPo/mx
 jI/NZO5zzX3oA9TTjJpm2KtkwtWRXlINvdcXQOZcHbmkh8xeGEuUwQRaE7LE3Fk98B4u
 APIHZWPhy1HMMR/VuQLMRaL6BP2sHyFAY0Dex09kHn+BnosV0QPmZHilRB6QRpclKAkq
 tFcCBhWmWkbx2ansznS+fK7CqCpDGy04GLKzcKMgjGe4raFhVY9BU2KTiId3Ltu9ZK2s
 0x+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729017527; x=1729622327;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Z3Rbrb2Z8GgUdGOPxQ4ICuPuYc4IdHw2IwxB2sqLH4=;
 b=UEabfpUbbJMwsmDFF58t/KPXhZrO15Wv8BFn9YoC5dM8qm0T1rbs0RIC0WsurFGVZw
 bIj5bxQqo9U8TmaXBHiU9wlCgxXoLXuhg7CPN1dSUZvrfR+XIneSoWrqw9y3KylP+dds
 /pEY9au8tbKwFRGPJEIBzdtchgLPLmEPPwc0UDvIo+auQkihHF+RU/pCv7mZMrMD6pM7
 GG6p6zQnHoT8pkUV4RtBDsKFOpYANiaRzuMpC0Z9qImErqIDaWq/CVK8gd8DK6Bt+XPz
 J4DfJ1AbpgtehE/rELRkANVzvoGITfvnXwT2BO4Sys4VhQqJe1eSM6aOI9mFou7JM6cA
 hsaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtBGFRLsXawKwclW9LK3J/VC6hmV+ZmjkNz/rMAPCxaiUBDffMvWiqfDOUGLxCxJvnZj9lB8wDqxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwDD/6asdihqZyPgI0QrOkK+poSI3A67/TkVQsjQDcNzC31aRC
 3kn7UrHPVEy+B6bO4d5pZSshlIlEVaB3TqJBGEef57y6FvVpTtRAOIpCZpSPtdXFcPHBix1Ry4Z
 tNr8rDw==
X-Google-Smtp-Source: AGHT+IEUCrsutY0kTkkqMWPEqq/3T+BcT4jT1L0k20dzjwNVEGp74umIyv30/nr5D82bDtqQwPBBUTwEa5Ol
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:6902:1c3:b0:e28:ee84:e4d8 with SMTP id
 3f1490d57ef6-e29783006b4mr737276.3.1729017527264; Tue, 15 Oct 2024 11:38:47
 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:38:23 -0700
In-Reply-To: <20241015183824.1014964-1-irogers@google.com>
Message-Id: <20241015183824.1014964-2-irogers@google.com>
Mime-Version: 1.0
References: <20241015183824.1014964-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v1 2/3] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>
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

Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
timerfd better separated with a clearer subsection header.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 0c4950d5d..3f90f6bb5 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -59,6 +59,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -77,6 +78,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -110,6 +112,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -135,6 +138,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -175,6 +179,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -231,6 +236,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.rc1.288.g06298d1525-goog

