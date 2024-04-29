Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763A8B6288
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18A510FFA8;
	Mon, 29 Apr 2024 19:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hDYgw1fv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196A110FF4F;
 Mon, 29 Apr 2024 19:39:38 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7da4373f850so240096239f.3; 
 Mon, 29 Apr 2024 12:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419577; x=1715024377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dgWj2cFA2MU3UxaMwN/AH6DmAyC9gLaTAViD4Tt0Ck=;
 b=hDYgw1fvpXzbCzRRvbbCYEzqtsP799slftZXb8x+vVFyOg1MiE1n5PTckXQGF4FXR/
 qmQrKj3ANXkn/p8L64fiR7/j6xngeXS0a+lGttW/USUEpKkVCkDzF9rQ2108w95/beJi
 YvSWToxljoRCVYTNGKQRdIaN+qOQ8LYsr+DZ3SqxiUaeClyrXBMPhPFu8M+2fYz9aD0I
 c/j+nk1o8RG2BmX4dXzv9Xfylcx8Eqvk0YS6Eca0FgTvpdg2admIXGrW4eDqKJB07zlc
 k40lwf6KdMYWwPYuIG1MXcVRANqKKW7jDrO13tTyjPTwCbje39FXq+X38vNARjRInQJr
 PWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419577; x=1715024377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dgWj2cFA2MU3UxaMwN/AH6DmAyC9gLaTAViD4Tt0Ck=;
 b=XBtrX6cWu17/50gQNz1UCkiUnk6+4XsCszVnXwmZ5oxgf2WHId0npfX6d+bOhH/bAq
 xQF2xQlC8Gps38WDUH6HP0e7WBVsk45lbSeHm6kfCC3xyhj6cEU/Ms83Q7HgLc2IsB66
 2nfBFM6imk7gW+3g42ae1raMM9JyxGQ17Qvz3m2rFpSjOuZ74DRPBlvvF0DGTTHJaqzz
 eapkEP46fgVdLKJn8B2l1PEJ8KK2nkxQHSvyyb1R+Tzqwoeos+yQ23O1TgFeeV2211IG
 Fi3xreyjYr6Tz3TlY3GZPzrDq4f5bdq9wLgG1qdMKHJye6dPVA8mSUe+T+Ek1UdIArGh
 cUng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhV92bkMrOMXR3roS/5JvR6gwFZIATN4gXvKMqHDy44uEthTm+lbE2qVLq/24+AyLcQY2r+PzXV4SJSRBQWOf79VDhg35m/N1PUSAknm5pk9XTyhzavi5IWpd0PucPNM+KZF4dsaY0444ZmF13LpnYsIZMvZQRbh9cNpu+qSE7qCgjv3MqU1Zv6NevRSI5hmew9/NBkGcU/Et5FeGix5X6MNILL5BlKZ9pKoEzuJNZk7L5PAI=
X-Gm-Message-State: AOJu0YweJwEwaqgKAi7xv/PqHTCiYrDr7thmwdwTh5gcJukLnG5YMjF2
 pwy2SriYpbmkQUaXv8rAHHBnYpfhM0DCZvPUdFvhsvr8e3XJt5nv
X-Google-Smtp-Source: AGHT+IEs24YTwILUt5MHKr0F0OyxCq+SxhIGz3ARX0AwMIA0GR+8INeYUiHTkHCKHU43qMQt+OxxMA==
X-Received: by 2002:a05:6602:4b0f:b0:7de:c308:76e2 with SMTP id
 eo15-20020a0566024b0f00b007dec30876e2mr976745iob.3.1714419577342; 
 Mon, 29 Apr 2024 12:39:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 28/35] dyndbg-doc: explain flags parse 1st
Date: Mon, 29 Apr 2024 13:39:14 -0600
Message-ID: <20240429193921.66648-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

When writing queries to >control, flags are parsed 1st, since they are
the only required field.  So if the flags draw an error, then keyword
errors aren't reported.  This can be mildly confusing/annoying, so
explain it instead.

This note could be moved up to just after the grammar id's the flags,
and before the match-spec is detailed.  Opinions ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7b570f29ae98..ccf3704f2143 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -106,6 +106,16 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
 A match specification is a keyword, which selects the attribute of
 the callsite to be compared, and a value to compare against.  Possible
 keywords are:::
-- 
2.44.0

