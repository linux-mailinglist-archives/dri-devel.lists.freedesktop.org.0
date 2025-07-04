Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBB9AF9B8E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701CB10EA76;
	Fri,  4 Jul 2025 20:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LSN5mJdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8FB10EA76;
 Fri,  4 Jul 2025 20:16:08 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4a7a8c2b7b9so17462241cf.1; 
 Fri, 04 Jul 2025 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751660168; x=1752264968; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JftnGw2ieRIMfPF9FeFktko6aUdoxCz5p+LPiScYnD8=;
 b=LSN5mJdYb+24JRsuJnhmIKo/h9E0hJz99KgHFvXtwweYOswopUHqSU9iBtSpwy4gnS
 RNdzJOytUltKq1UpBqOFpSyz1zCdjJvKW7R7HYmgGRRS4jK1cALeECGVaKa1g5JiO9nS
 XZw1LI8Yc7XXzbyVdQyND1yW4tOKSg3hySgOUtWwEzH6AIcljuZZV3id0g0NWywg/7N7
 apPT78uSq6lxEVet6flaVFzTYNXADUUokuQ78oMXq3DIDLBvfQxEoJDUtBM8/bdiQIov
 bRBOJAbjfeQFUHh7NXlxT0EVxNvSL08i+y7+jCAQPHdlUCZOCDtKvXU4lQsuBnxRo02/
 sylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751660168; x=1752264968;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JftnGw2ieRIMfPF9FeFktko6aUdoxCz5p+LPiScYnD8=;
 b=krrrQtD4KT8PiNWy5MZ/TqQqs502GWbt10OorpOGFDSPkKhR9hwddSwL3J8L39dcMA
 InAQxLxDEdOMhgHfpi1x18pjsTtZ45ZTEstNCwC7EUVBCkCIofVnrbnlf+JkM+B2e6lp
 8ID69dAyWyx7czRMqiCe7/KfDE3if6MaWBj29FS847W6CKHXhRqJ0iGYvXVRQw3YbbZx
 QmbHHXoL1/GtqYaMgfh8ZIIkCqaim0qptZswuQV949LN690QsxsGpDMkElYAau945xDC
 58EwH64jjvLn6UGTYzcmnWX3fI9bOiaEviffg83yCm7cMasCFFbQPX7lNwv0OtOKCrVu
 /J4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkP7/5kaFazjJ1YJpjoZSF5qIbN09VMOjx2WhiEZH6f5qLhu3B0yBKJT5ed0UvbVqC6jWiiFKoWA==@lists.freedesktop.org,
 AJvYcCXZy+8N7T5MToiMSNyjU7IW+qwGMMS6zkzQZ2v8BdAa2vSJL64NaQ+h0rXm/RqsQ3547mJiGcYwM4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU8Jes0k42DZR7YiOPoV58FZnbpVDzUuMWE3ocJCeoR4phP5vy
 kCFJYu3FvCXB/AZ/8/ICdjQBQhnJYrsWRHPV/oZjSAG79PRffhekIr/N
X-Gm-Gg: ASbGncvpN9Uky8Y4BFLmDkiJ+YFy7U3XSle+Dexs3rHPFanv1Z5tgBDvv2t2bV1Mkpb
 WyGa+DnA+79H+KXvHf+VEMIolCCwILScGKIH8OmD4Oz8mo9ckklTRE6IaaH4z9QO4w3fZwAIdrs
 MS9mp1Am/XYRfe6alhJ28T5ty93ORrpaLzGztgPutE/TH6qX//Ew2+LL3nHwk6R2HAwLyLYmhaY
 Q/IFg293cf9VrfzkvBQN3IMxB6fbHCpYde1duBYDyZ/Ik08CgC2namaSSu5QuLlWbvj69c5l55H
 faFXZQ6tiSNMG8obDTAZt7G4bMgrdoHx/lcJ3TIB1YSagSIlZacgY3Thr5UfxUL16X6cOKTvf+3
 dNyvNcgrxVHVaujQehg==
X-Google-Smtp-Source: AGHT+IF1t1aKHOe1fk9iSK6MMX3BAmHjjyKwyg4+tGB5Y4Nti+Dmbb5QN0nFVxAZPfxMG3QwhMXk+A==
X-Received: by 2002:ac8:5fcf:0:b0:4a4:3d6e:57d4 with SMTP id
 d75a77b69052e-4a99883ca50mr51364261cf.46.1751660167869; 
 Fri, 04 Jul 2025 13:16:07 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa
 ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949e5221sm19772941cf.2.2025.07.04.13.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 13:16:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 16:14:55 -0400
Subject: [PATCH 4/6] rust: str: remove unnecessary qualification
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-core-cstr-prepare-v1-4-a91524037783@gmail.com>
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
In-Reply-To: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751660160; l=1218;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=sfKyAlpcVUQy80XFUpORKTGMx+OCz/EQm3USwht0+Yk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHvRIVvJtq07S1R75iYq2AMmkTap/2F2AhnqArHL10X6H2X/PDdiObvGpzgmEBt9fR6VL1UeMvw
 7vloZt88VjAw=
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

`core::ffi::*` is in the prelude, which is imported here.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/str.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 48d9a518db96..f326f0c40ab0 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -232,7 +232,7 @@ pub const fn is_empty(&self) -> bool {
     /// last at least `'a`. When `CStr` is alive, the memory pointed by `ptr`
     /// must not be mutated.
     #[inline]
-    pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ffi::c_char) -> &'a Self {
+    pub unsafe fn from_char_ptr<'a>(ptr: *const c_char) -> &'a Self {
         // SAFETY: The safety precondition guarantees `ptr` is a valid pointer
         // to a `NUL`-terminated C string.
         let len = unsafe { bindings::strlen(ptr) } + 1;
@@ -295,7 +295,7 @@ pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
 
     /// Returns a C pointer to the string.
     #[inline]
-    pub const fn as_char_ptr(&self) -> *const crate::ffi::c_char {
+    pub const fn as_char_ptr(&self) -> *const c_char {
         self.0.as_ptr()
     }
 

-- 
2.50.0

