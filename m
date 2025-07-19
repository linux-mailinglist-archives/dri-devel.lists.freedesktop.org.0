Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D51B0B25F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37BA10E43A;
	Sat, 19 Jul 2025 22:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Unwzlwru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA4E10E43B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:43:00 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4ab9ba884c6so40005121cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964980; x=1753569780; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s3NY47tJRGk+8ZCP8/kt7QLiEFpyYgbdtZryIR8Da5M=;
 b=UnwzlwrueTiGTuGNYduRsUFUkD5gLa1mp09FiNkTkmeC7n1AkXbco0xW8RbqGdvu5C
 gnYlkWRlDy4xHy14b+u3Nu7M2c/QOs0QIHAeOXdJHZ6B/5AcMDC7nNPJ6Ec7E3IeYsmn
 NJoXSvCM9TbjL4Eo+I4lXj8tidibLRKV/Vd2fPmqfh3IrCN+iYzPMRq0Y75cnixPs312
 BkoNkr7G2BNdLyNuh+DXlQuQzZKfMDYcF3pZ3zodea/u/C7Hk91ZiS33Z6AnS3tF692F
 9CDDFoZiMkqfyhezzooseQgtjWBAM0Y5hJ3ESZc81k4dzdA6/Np9jnXu/s2ZeR2qkC4s
 xVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964980; x=1753569780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3NY47tJRGk+8ZCP8/kt7QLiEFpyYgbdtZryIR8Da5M=;
 b=iXKXdPvfUMG3BGeWse66Ac1LArrn7GbgF69RanuChBgsVB0+Yk1RDV0B2DsUkYW28T
 I+HGmsQQ5wBG8pKLvXG+obTmGF6FavoctWY03zc9jwo7uV0nxpW/oN+bbhZ2u3AuavyY
 heOeYbwmxvIT0ulOco/D7u5rqSyStTC3x6pE4w1qMErBjygemjRAuX2I6gqNf9/IGiaQ
 1zHk55vTtdJiD0FtbtwET95Bt7VkRuh/lkU9udGImYLII+7y9P982DGpS2Z+HOLJ7FCI
 0srIFTY9GvmyiWoOYl4dLYsudNbdjn/rZXCqLgiUdfVcrUOfGUgeVbVvw1V/QVTIzwZU
 ROCA==
X-Gm-Message-State: AOJu0Yx24/M2Cl5Ttb1mdu5e2GHYtu7xbUWrY5DalEof5p8+P1BWKHaH
 Fm+2BghFDGGgh9sJFE6LzpGjpDj1sWQXH5NcYDgRrE2xieP+k0ltYobc
X-Gm-Gg: ASbGncufmS8qYNWagnFWBGMDsncH/9yCeRl34ubBdEU+k79yySF9G4LzOkG0PO9OS0x
 /TV0hDL94Hx6pwsCvS+YWnIk8CSW7MXUwLwtGbGPw+P4i1HqQBCrxbiCpkNNqFa1P0/ldsm2qJc
 auq+n5bofAGz4XHg+4H+X6CgYzp04qmbgVMfXyBoueUPEXbXSWDGl7OIdIsOPmBSbi/bNWI/4mO
 WdD8HfeRl0+9sXoU153zFwXzhMr9GM/b6hZVARVlY0SDbkUrQ2Puo6WICI1giNjquKRLLhj3Z8/
 PFlEeGGt2fadYQWtneFmtU9KwfbOZX4xlF6T2Mm10ZUkNAy6PiaU3e7xX3XX+ePAZWcAIvUQ/Mu
 Ua2wLMPDNcz8Do46SaEJ5w3ksIdEbtSQLHC6lTznapdHik7NocqzlNbr5PSf8VYsz8n6NV6hequ
 FKYz+8QmRd4dm1pPTB6conD6EYm8lh
X-Google-Smtp-Source: AGHT+IE+VLj1eoQJlkntq9FCqSiBVAWaZ6ejE3+GS7GuKBpgeIfpkdAoy8KZVTX3zCCXeHxJrsI52A==
X-Received: by 2002:ac8:7d89:0:b0:4ab:70df:fa20 with SMTP id
 d75a77b69052e-4aba25f73cdmr190367941cf.16.1752964979879; 
 Sat, 19 Jul 2025 15:42:59 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:59 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:39 -0400
Subject: [PATCH v2 10/10] rust: of: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-10-e1cb53f6d233@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964956; l=1199;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=SD3G4jqyuzcSVOOImxvxCQKawvUyi73ZCoxehYBa7Fo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDbHtLruIIxp9ZSU/n/rHXJnJySJp0GBObTIQohb5XiIw2SrNPfLKfjjQVWotSa6tEAbOEg5G0M
 tsoqBodzCsg4=
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/of.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
index 40d1bd13682c..5cf50979c1e8 100644
--- a/rust/kernel/of.rs
+++ b/rust/kernel/of.rs
@@ -29,7 +29,7 @@ fn index(&self) -> usize {
 impl DeviceId {
     /// Create a new device id from an OF 'compatible' string.
     pub const fn new(compatible: &'static CStr) -> Self {
-        let src = compatible.as_bytes_with_nul();
+        let src = compatible.to_bytes_with_nul();
         // Replace with `bindings::of_device_id::default()` once stabilized for `const`.
         // SAFETY: FFI type is valid to be zero-initialized.
         let mut of: bindings::of_device_id = unsafe { core::mem::zeroed() };

-- 
2.50.1

