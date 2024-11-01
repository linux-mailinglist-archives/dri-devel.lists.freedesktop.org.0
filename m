Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C649B9821
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 20:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A80310E9F9;
	Fri,  1 Nov 2024 19:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wrlVYoi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318F510E9F9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 19:12:05 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e35199eb2bso45436347b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730488324; x=1731093124;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gkz28xMAWt/2KXNBG3XjAFk4KTwZpcO3i3iJdGxkSFg=;
 b=wrlVYoi8ymwVla7JU03jZM974N9//GkDirs/8pgs+8rUGwvU+vXxf762BuOmK33VZc
 7k6wCU1cZ2cr7di1cqFsEPHGDWqlhMtpiCpt2Qit4IHdmt83wQs9qxspTWRXnhMFKZCu
 pKpLpjMoGR0VV52eH7QPHU7iElmecKQ4iqId476orsjT8Ew10rgmAXNcpUothpof0uL/
 kj07geTNIQseqc1La+Rpwt3jRSZIHxVfrCvOYrXXy6QjVDeVj0h7ZHdnRhLb83KIGOkp
 OlOfpdfSmMC9Euu+OljMctyORBqidfdtxXIlSXBxy8LoIRDpxt0l/w4ATYyAL/0OfKcU
 80uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730488324; x=1731093124;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gkz28xMAWt/2KXNBG3XjAFk4KTwZpcO3i3iJdGxkSFg=;
 b=OqhDlRASGkmGtroWcJ5pYkSCQwJACicRdTCXDMPj+x9rlyO7UOdxwohBfEs15NToRN
 SlrEUNl4sWBStv6fQk2CsirstcbGgWLukUdkj+Swm3KMuh+OAHMeyr/3A0irS78uf59p
 Rq5mqFEn91gGDCDH6dZfbWL2bphtkQaTZPSolwdqByrVo7/PFM/kAiPJErkQWkqSY46F
 M6iYORA5dBwvCa0EhaIU8pc3bRWpxQ79+kxx5tQ+cVjN7c7ZR44Js//+DfeE5fWRawZP
 6HNDmV0p/fev/dBN9cPIsXChr9gNp0xyCYZ9QIxlfFp+dKqNU/7232lzqkb+1B1j4GEu
 zQQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjVXG8Dh9+XQsqrwqO5e91dKOLidVk0L/zOQFUQAWeQqdc6SaHaPacHBo62JT5k2HRikCKuEvAPBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNUdZVuPVbAhDrV0scogMwjVT+eXdJk6O9l+Qgifc8T6YRor97
 FiB7adM2ic9J/kIBqlr6moDUppCq5szJAwtaWQOyLvrWJgTH8QYCIqOr++2u77Gt8aiKIHBKiln
 JIFUFrA==
X-Google-Smtp-Source: AGHT+IFNeLRXXudDwC0gCZ6v3ZzzirUae1o9p+zQDA9iH2FxOAlGCG5xI1JIXPP3rrEcjJqvieuCor38xzmk
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:f2e6:5ab5:a95f:35cb])
 (user=irogers job=sendgmr) by 2002:a05:690c:6482:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6ea64bed332mr945727b3.5.1730488324379; Fri, 01 Nov 2024
 12:12:04 -0700 (PDT)
Date: Fri,  1 Nov 2024 12:11:55 -0700
In-Reply-To: <20241101191156.1272730-1-irogers@google.com>
Message-Id: <20241101191156.1272730-3-irogers@google.com>
Mime-Version: 1.0
References: <20241101191156.1272730-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v3 3/4] proc_pid_fdinfo.5: Add subsection headers for
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
index 935b54b4c..290cae6a6 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -58,6 +58,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -76,6 +77,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -109,6 +111,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -134,6 +137,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -174,6 +178,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -230,6 +235,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.199.ga7371fff76-goog

