Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE80A4ECE9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1A210E0E6;
	Tue,  4 Mar 2025 19:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Zd3xqMn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CA410E0E6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:13:26 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (unknown [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 32E4340D059A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 22:13:25 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=Zd3xqMn7
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dK517h3zFwfd
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:26:17 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 0BC7F42754; Tue,  4 Mar 2025 17:26:00 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=Zd3xqMn7
X-Envelope-From: <linux-kernel+bounces-541178-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=Zd3xqMn7
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 114C942AE0
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:46:48 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw2.itu.edu.tr (Postfix) with SMTP id DB9872DCE0
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:46:47 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id 900DC1890CE9
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id E407E1F0E27;
 Mon,  3 Mar 2025 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Zd3xqMn7"
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40241EE021
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.128.74
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740991552; cv=none;
 b=J6kwnaSqZ6y8FLOKOOSJeAyYdKrRG9jPSqdXzHUsfXOsZEB2tf02AEb87gzEyXuKH3pPk9irpD+lGDqE9E735MXwkBIaekQviyH710bvFJcjo2teFE6VJmC9dXyUsWAdbwgHkHQN/54DNBBNAhnwXttdkMozAftb6pMoWLzCJa4=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740991552; c=relaxed/simple;
 bh=rXOlJP2KwbZg6HLcbrBJs+P0GV/Go4oAq5PQVguOe0Q=;
 h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
 To:Cc:Content-Type;
 b=N3+D8xqymy2U6HNs9rwpHFxEY3l5g9GDGaAQv8Sp4vFFRUZA9oFJBdVvMh7idvAjlMhVDmL1e18TSYRRD1B/3nF2VlcIBBqLIJliVOSLv7tjrFcq62F75+07905qoE0CL6bRo6m47g3XLct4fMsTBp7SVYM2vr7VouWBjgSGwZU=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=google.com;
 spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=Zd3xqMn7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass
 smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-43ab456333aso35869445e9.1
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991549; x=1741596349; darn=vger.kernel.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uszf9jNzimaGC7A+MjcMbFfOoksGjtwuorOL4my3lD8=;
 b=Zd3xqMn7RXIz8sj1odvqq8+CEJsOSoZJLNB2Mk0FOc/AxFdaA9dcBZsR0EkADQFMkl
 zBGexVf5TILZQrfxMeJ+kqaSG65a29QjrbdUMx79U3PJvJYnSswJDDjZr5lNhhsHFe8b
 5RaX68lichSToLh+xhpfQnx9h2vBC0QTEP/X04Yk8u1xqVTkqtZRGsb80q5LjSyDiycI
 /5Lop8+qSjn0lQaJ/ByD7hfVTBv3Usb8KsW01VuXabMGKnQw98kUC2VuQhSWl+6gbmN8
 dvhiUbflt49sJIkGrtYgLXXp4nP9PODnfUPzTN8LsE6cEIhvLV+ceG4u9Td6KLj528Qq
 oNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991549; x=1741596349;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uszf9jNzimaGC7A+MjcMbFfOoksGjtwuorOL4my3lD8=;
 b=jLbTTQ2srSpVooSza2Dj1n5UFBruK3krjpU4sM+vGUE4iere175JfsLioQDDKSerlh
 WKGS/ntdg6tkXfyrXjWihMNKoY3JqD+agAIL5UjCTu4cOi/jCwlEIBM7FgRV9Z5AqHfa
 i0k0equ5LXxEDUi8kOe9M19nsaOW4u+/LBf7H9ccDf94FCpSKZITgJ/YNcUV6yG3m3z2
 35tXhpW0uRBXbfoqBbQT1dqf0ttXrqffIKvDiBdLF6VPj/RLss7i3a/lcjax3Rm/+qrx
 7iUJjvoX/vIW29nSEJjWUtMwg4lW/q55j3d16q0xCTvpuB7FT9BX7j5dsPm9mSPbZV/2
 LdWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcyDUdJxIJXRFLvyqe3C6SPBxTGrEg1WHOq1Fopq63SqOMj/GRkDbwIv9zW+1c3EDGg/VLu+KvUgdOBaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaK//drlLFzFqJMjYQ8rQYKnrV3oPTHcDjiz9B0Ew+sUsWn523
 Mk9m8bSJjuiaXsRW+VAlAVG+KmIiX+SUUarxNct/F1gqIrf6MkwbWPoRjpDfA04yYyLJyROT2OL
 hJ9jS6JgiA6DKPg==
X-Google-Smtp-Source: AGHT+IECCbQDp007YY5H9TzV4VTf2BNZ8iJKkXWl3w/rGfL/ku4+FSGRABIL2DQ9M+TCDMAM8FaLElccEauucog=
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:439:80fc:8bce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ca8:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-43ba675caafmr134644415e9.30.1740991549163; 
 Mon, 03 Mar 2025 00:45:49 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:12 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=rXOlJP2KwbZg6HLcbrBJs+P0GV/Go4oAq5PQVguOe0Q=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw0XCXyKCpx73jSQ2riTrt89M1w4DSLnlZ1+
 Cb235TozJGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNAAKCRAEWL7uWMY5
 RgRRD/9PrC+8ReqGY3MVcspxlBxm4PzYImTmwadXxvv6K8NDFtqSgszoxEfNsDJXIFFzYRHYa+N
 mJdl98HU7r6JRSNL6VV/+oRKhnoHhYbIAna1gFnE/RYTvvWwyUeyO/3CFv7nowjzYM2AnjxOWtM
 OOmg43zFRY6b/s1XnuR8F/qR30rygGjeSdK7pbE+PygOwoeoXMLh7Yr/UQ0him2uoJXBP0F/4Jt
 NhUEJHPhJV2Uts4nr2e42HpL35fnn8SH+eaBo+nrTG3wXgOEK3ItExaFsD8x6eYCRN9tONisJjH
 xBz+9+5gzepyskX2bOZ0ZhqRPhCSdiZBHxPdJAqs30uzVl7n2MQW5GzBrqu06sCxQ3iY4km60MC
 QkK3CQsguGeSvbMPuYpoIKd+Ld7jxqM27Pe8XJHI2H+nVz+/C5Ps7rZriN2QV4HCqc93vLTtGpB
 bfT33fQo4J5G/ediSmFwtU9NbUEyDlI3/LNY8azVt58TysT3PPWfLU/jtyifkjgDeFs1Tzwlv58
 AoTz7LeIRR8/ZK/Y4q/Nq9NF8+vnZf9gm4eXxu81s7bnfqXUiKc/+UoLzwpoBElajRnbah8+nQ/
 6A9eT6t+gCWE1hGbbP3vLG1gJgVICGT/4nZEhu8Ujark/AVtP1xoIh0B/sjLHEAQDPC8Rc5IGkh
 NtML/q9eIA2gOFg==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-1-41fbad85a27f@google.com>
Subject: [PATCH v3 1/5] rust: fix signature of rust_fmt_argument
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6dK517h3zFwfd
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741716267.64398@t3yXHwrrO18NORI05q+1Sg
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Without this change, the rest of this series will emit the following
error message:

error[E0308]: `if` and `else` have incompatible types
  --> <linux>/rust/kernel/print.rs:22:22
   |
21 | #[export]
   | --------- expected because of this
22 | unsafe extern "C" fn rust_fmt_argument(
   |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
   |
   = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
              found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`

The error may be different depending on the architecture.

To fix this, change the void pointer argument to use a const pointer,
and change the imports to use crate::ffi instead of core::ffi for
integer types.

Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 lib/vsprintf.c       | 2 +-
 rust/kernel/print.rs | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 56fe96319292..a8ac4c4fffcf 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
 early_param("no_hash_pointers", no_hash_pointers_enable);
 
 /* Used for Rust formatting ('%pA'). */
-char *rust_fmt_argument(char *buf, char *end, void *ptr);
+char *rust_fmt_argument(char *buf, char *end, const void *ptr);
 
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index b19ee490be58..61ee36c5e5f5 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -6,12 +6,11 @@
 //!
 //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
 
-use core::{
+use crate::{
     ffi::{c_char, c_void},
-    fmt,
+    str::RawFormatter,
 };
-
-use crate::str::RawFormatter;
+use core::fmt;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[expect(clippy::missing_safety_doc)]

-- 
2.48.1.711.g2feabab25a-goog


