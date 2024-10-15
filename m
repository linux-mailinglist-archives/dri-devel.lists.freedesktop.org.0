Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36BC99F8E7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 23:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819B010E604;
	Tue, 15 Oct 2024 21:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2YApt7a8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D60810E60F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 21:17:26 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6e355f1ff4bso57937917b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1729027045; x=1729631845;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qp+83TpI3TezfCC8Dtvl97cBiL4JnurBtXXrj0jn8lw=;
 b=2YApt7a8E6cwOyLclzVwuaTmr1wp1Y3stSqzddnkxS5tosN5r9q8wnykavkpp2Sngd
 MMP7XkUEmev4hr+TVjSc6Ey20UusUwmzpVU4IY6sFlvHveBnPhiCfSX6C1GgdYzy0g39
 BP6Vyb0w8JYkna6iqp0bmiH6+1VoAhP8pw3BG0BMsAWhuFUmjZ406TXTqtTrdq0u+EvQ
 opJjUgAu/MuvB4KfO39UZLHEiK+UpfS+KeFAVGka1Q3PxxECifpJxJytWwaujU+JJ+6/
 164MLijG0qp9etGVEI9RtBFiDwKEzvaAtM4JKQ6tJIAqHieqAiT+7j7b0RI8dppBmfnj
 oCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729027045; x=1729631845;
 h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qp+83TpI3TezfCC8Dtvl97cBiL4JnurBtXXrj0jn8lw=;
 b=sMMshB8h6m0/QReR95srp2Gmnn8QP8dGMXGaIqzqLnEKhgACtLrdf4ujPC0XGni2pl
 NIFUGKS/zxlV82449Y0BVND512jMirSfbAYBvRXbgz1cUWojVOLCikGFHdQzpfn1A0fz
 qzI89YKMZ258tnC0aaYrL82m7CUmMY1Fd4jVTzLvNNsjQWh7CekY9VvTrfsD2B7W63mc
 wmo5ki+B/GKzvordRM1b1Sp5kDYQRUZy3ac8Cxzfl9huacQ98IpXlfPAQWXwW4g7z90t
 3JkbaDZh9mcSmLnpkZs7k0KQrCXcCsC22957F8H55v1huA/689m6XW1pBrE1BcVNUD/H
 yiQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuuIjpkA2Ez2VCkEF6Axwpsrjz3Lu7lNyG3EdkxK3f6H4v1EX0kjd96IduZqxwbBkayDOTQb8cGXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcpk4nuUZPZZLH7XjjuqCOXtmUizjqcWlzXSWGwhcTMtYififm
 JmmYnJlyn1xNZc16LBYe4IWE4Ehgjvg2kSZ5uF3Ixn4jsuPOn6zw3K1xv5of+thmW9Tu1WZdIFT
 kg1BbGw==
X-Google-Smtp-Source: AGHT+IEl3NSU1WdQwze6KAXwiH4egozRYT4wu4exGFfYWyRpDzyjB1F5KOwgYO3ID9qtJyh31DrebhRjau2i
X-Received: from irogers.svl.corp.google.com
 ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:690c:7281:b0:6e3:1f46:77a6 with SMTP
 id 00721157ae682-6e3d40a2c01mr388767b3.2.1729027045640; Tue, 15 Oct 2024
 14:17:25 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:17:18 -0700
In-Reply-To: <20241015211719.1152862-1-irogers@google.com>
Message-Id: <20241015211719.1152862-2-irogers@google.com>
Mime-Version: 1.0
References: <20241015211719.1152862-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v2 2/3] proc_pid_fdinfo.5: Add subsection headers for
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
index 8678caf4a..02eceac04 100644
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
2.47.0.rc1.288.g06298d1525-goog

