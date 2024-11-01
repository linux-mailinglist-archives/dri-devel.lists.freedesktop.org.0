Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605819B9A0A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 22:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A900510EA07;
	Fri,  1 Nov 2024 21:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pGoaL+WX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389D310EA07
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 21:18:42 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6ea33140094so55567107b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730495921; x=1731100721;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=TjhT04moS+pzhk4qD4GZREcRn5lEbBBr+8ByueC2BeM=;
 b=pGoaL+WX1vtEcpa3WVmh2LQUiEBgUU9qacwsSxefirM1mxJrr1Hcz/nWilXR2E9lMt
 nPogrVdDkS+4qhmDwNNwti+MTwE1+10/dkGo2HytKMpXrNPhS9q7jmA2e6me+mZPklzS
 x6gJ8NCsanrKuDO9JrGIhhlPpwRAMoBR7caic3INy3OpyrtC43wK67uOnEc6KiVa6TE2
 vyRLZmMmvQm7b+QmegoWtmdfxvADRapGD0IaDrv7rc1xI8hx4ucrByq/triL12Sh6/6i
 P2xWyYk4jUPyRyJDPJWNBH4UZUkZbrQ8V+YbZnLoUne9Ok/uTtAHMLXF+x58j6qQE7qs
 SLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730495921; x=1731100721;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TjhT04moS+pzhk4qD4GZREcRn5lEbBBr+8ByueC2BeM=;
 b=k/alJNeM/V9CfjsYMWDEntkFLdW6z/A3nT26n8u2MYr0fIexk2kE+wgI4HtpIfE/ZN
 mnOGESKnyDmoucQAbiKWVlt5WbRQOTBQhHOciNP+5kq+9QTLVCsstZV2VCWMiVMYnAbf
 sDubcDc6irHq9lhxFH5muYUfaT5rPj41O50YGduPSkHjrqaWWeXW3iZiuoBNlmEZELgw
 51pPd8njB2T/DKgFPUe15SuVgSmMU6tMyHzTs9WjG6lzDMnVOBnvofDQ4ygdpm0s9kK8
 d8R1VKs0AA7+mZ5wIJSk4AOLpXSApj5RLliVJipBftuNWNbUi1r6EzXIEjjPF87IWwC5
 QV0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEO5zV22HA9axSLs7JG1f5CSMnDr4hTaCeoc3xOk8jZrrdoRmV+gZKEUwU1AD12SWGOjDMQfpqSfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2S5KfSvWjC82BoUmfbbIPlDgSxZzUwu2IUGtoKz2pVCfQyV4G
 uLbpohgmi2WKiSefo/NFFqSnGObPDrGN5U8iM7F70draiL7cZ7KOoC46yzZtsvVAJv0FdoGfIWI
 d5IQvzg==
X-Google-Smtp-Source: AGHT+IHXm26c8WZH+UjkbUUruw7NFdpvbU7c2tkYNL/I8+s9eDGfk36rQjWRvXRdCXMkraXiJKlP61gSHtxm
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a25:6b49:0:b0:e0e:8b26:484e with SMTP id
 3f1490d57ef6-e30e5b41dffmr4636276.8.1730495921311; Fri, 01 Nov 2024 14:18:41
 -0700 (PDT)
Date: Fri,  1 Nov 2024 14:18:29 -0700
In-Reply-To: <20241101211830.1298073-1-irogers@google.com>
Message-Id: <20241101211830.1298073-3-irogers@google.com>
Mime-Version: 1.0
References: <20241101211830.1298073-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v4 3/4] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
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

Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
timerfd better separated with a clearer subsection header.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index be1675b69..b7efde8f4 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -57,6 +57,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -75,6 +76,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -108,6 +110,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -133,6 +136,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -173,6 +177,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -229,6 +234,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.199.ga7371fff76-goog

