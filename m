Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63106B0B248
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7676E10E35D;
	Sat, 19 Jul 2025 22:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QfBawpxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1F10E346;
 Sat, 19 Jul 2025 22:42:20 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7e1f3b95449so411539485a.1; 
 Sat, 19 Jul 2025 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964940; x=1753569740; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VZcvS4JIeKOz3OyYrU6VSPD/RKPN1X8doP0FytHrmgA=;
 b=QfBawpxovk1EVxdIPCpabG05mCl8NbxHGwfJjYrPe/Qlk+JRRvTUsPJtKEt7HrxFde
 jn13Mbz2sf/ciYaoCtXwXaU6n7EEj5vFpsCojznI6n6kDcNgq+9quQHiP9DuzcKMjVod
 5/dMafs+E2OasFFb3KMwAGjgCfq4CXV+zH8jOSUrLUuLpCm6l8uwfZvLJDHR7FA8JEzW
 4DRnn3H8BrhK1NJaXfzqEn62q8AXRFR9lg7rL9h6roGc2oFCHGtK3ZwWmLM9XeZU2cxy
 sRoucbqMs882noYxx9ms8ZLTTauQqaVoDsD2/ZsXmiK+NvSAWHAYIgi++377RC5g6eLM
 vcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964940; x=1753569740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZcvS4JIeKOz3OyYrU6VSPD/RKPN1X8doP0FytHrmgA=;
 b=YENyarfoQsIlL0RA3oT93dX77eXBypTyecm+Ip5cmE87Gfx2xrr98KffDqMhHewxMv
 8Yvg3VOVpxgIXM0eqDEM4QlvYFi2Jw5m507odbdnbtu+TVM7GWSy15bvhrXN0W/1ueKg
 O2xw05jkNF4N+uoaMRTIXwAN7ChkQGimDmbwsbr55oJWK2j4Qvwaw3fYucHqfJaqAizf
 Vu7c152cNZTad+eW+PbiktoaGRdKjmUXlUCFSx+6yVuKxrazsh5Z98inZMtbNZQOl8SZ
 ThgLPxvDrapiIVx8Hg6Wvr278L+cNdAhKKMs63laSQxUpJRDKnyLNv8tW4LhA+HX1Xkp
 JDWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq7EGkOr/wSOwwTA2lb4DoJKEzr5A7gyYhCtdx9c22gKwnsRpr3z4J8VWBcuIis/BGba19zvVbMFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx15FyFj55HcOACgiMbS33np9MfHPpbaJ2C3tZjkbd7/wPYxu/I
 RDCV00jXt3XFC//k9bmI82IDzzPBVwY5iEmx0Ws7VwVpLh/b0iA5nXrS
X-Gm-Gg: ASbGncsFLEHxtshiJ0DXHNkVKKfZYvQ6UPS8pxY7pTWmGernGieQjz+KTiJwwGSUXiR
 COpriR1VLSuJdj0VyORzkMukVG/yBEZ1mriZtlmVvjNwvq0ELp1GuqFgLDDiiTpmDDF6iNbUUGm
 o56OTzQb0g3Ni/WeVewGk0c6XoAP82i9yNvumI73LEW2ieVCTzb2faqAk/h3aRbDJo9dFo0MTYu
 ZGzACTxB8BSBKlwo6YjDoVuLJQP+erigsZgezfqe3c793eR8IzhilaRZhK3MHF+WRGCbxdgzWKV
 eCanMBx+FyuQt16h9vSmhqFdv4nxcZQdvUkaCfGcUSKSMnEP1YExxlOgHMOpMn47pi2T25WXAD4
 Svdjo8PhBaqPiPI0SDtKZFtQSCE0al67PGx/JPp57fUtavDQdo8/AoTCurKm9HGuPqM0Zxv7Wfp
 sxyVYGDU7fXgrdMOCMBsU0x/b4z1Uv/khsbzY/9dw=
X-Google-Smtp-Source: AGHT+IHV2N3qMrMs14RixVMrz4N7FPqczHbGPdgP1qIFChDpfiZUqiOOYjpmsvCFrdcWFOVKjkhmCg==
X-Received: by 2002:a05:620a:2307:b0:7e3:328c:b7eb with SMTP id
 af79cd13be357-7e34d25445cmr1248059085a.21.1752964939622; 
 Sat, 19 Jul 2025 15:42:19 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e356c75cf5sm251550785a.84.2025.07.19.15.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:19 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:41:56 -0400
Subject: [PATCH v2 7/8] rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-7-1ab5ba189c6e@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964924; l=1715;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=gHz4toQCU6anYJFOzHxe6eDUDf8ThYIsMKIWmLd67QA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE/CoWxTuDiUL7P9sRtLudjxXtE9D5paPxY0RwUT1Ot1C5eNVZBHb7FvDXrP2kLzdXk8G/yjl4P
 KRF2R/+b7PAs=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/seq_file.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
index 8f199b1a3bb1..59fbfc2473f8 100644
--- a/rust/kernel/seq_file.rs
+++ b/rust/kernel/seq_file.rs
@@ -4,7 +4,7 @@
 //!
 //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_file.h)
 
-use crate::{bindings, c_str, types::NotThreadSafe, types::Opaque};
+use crate::{bindings, c_str, fmt, types::NotThreadSafe, types::Opaque};
 
 /// A utility for generating the contents of a seq file.
 #[repr(transparent)]
@@ -31,7 +31,7 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::seq_file) -> &'a SeqFile {
 
     /// Used by the [`seq_print`] macro.
     #[inline]
-    pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
+    pub fn call_printf(&self, args: fmt::Arguments<'_>) {
         // SAFETY: Passing a void pointer to `Arguments` is valid for `%pA`.
         unsafe {
             bindings::seq_printf(
@@ -47,7 +47,7 @@ pub fn call_printf(&self, args: core::fmt::Arguments<'_>) {
 #[macro_export]
 macro_rules! seq_print {
     ($m:expr, $($arg:tt)+) => (
-        $m.call_printf(format_args!($($arg)+))
+        $m.call_printf($crate::prelude::fmt!($($arg)+))
     );
 }
 pub use seq_print;

-- 
2.50.1

