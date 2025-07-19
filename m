Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B0B0B257
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DE710E42F;
	Sat, 19 Jul 2025 22:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EQaKPf2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E46110E42F
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:50 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4ab92d06ddeso47472171cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964969; x=1753569769; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=shIOPZHNE3YOj8YEFGq9npDcc3SRxzlV4M7LnlpOpn8=;
 b=EQaKPf2fHuPqPv1BVt7HGFuFC8pQzmY42tUR3ffEiUyMa/9WFQLTPSPKEN1WujCwDZ
 mumWn/8m4p10oYJpHTfI+xIvyzy2r6EdwMh3qrEffMDmByWyXBiEXB+L/BBAAiUbgbcv
 Lr5W23+3TBgE7JgtBv7dSrgL9CO4EFlrUY/1M5ToFv9lnuPzfctbl1GS8fjenrH02DZ3
 6Z63bONOcTBjLYU5cg4mVjVlkENB+fizYNyCMBtsGGnCOl15Bb5yyl+DRA3hU3snVRfH
 PJ3Ze8Hi1hFcsLKKycDj0Wdpy18blklLON72IfWGxOLCrSl8gsRABpXX3i12YPCwaVB+
 n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964969; x=1753569769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=shIOPZHNE3YOj8YEFGq9npDcc3SRxzlV4M7LnlpOpn8=;
 b=JmPrIjjDJuUvEYKyn/X2tSAlBUchDUCJpZuBU3SEJWrgoa78SAFhHOfk+jGbYvbQHa
 P+UAdWZnFJSuQdREMfQ6pb4Jr+4fKDTOsKZPfug9QhXMBHh8quLNg+/PqZI53jKm2or5
 YfsCO9RYei8aQByJ3MrFXUatJmFTWQ7qXUagxmyxPen/5DUws20zmwfP/sIs55+LZgC/
 S625XNk2aeE4J9pgA4TAq/oI2azBR1B4JSQrjno3oSvIBtZgO7ROFW3cQGJyVCU8P7e2
 97DnKEmw2O7kWNFvJksMBOIksAy8b1GuIpTb/Hz4OI5EMZEDdoxtjducqz97NoJaOslF
 NOUg==
X-Gm-Message-State: AOJu0Yz695Zpc2NiSi57vJqEN7cvXPq9XOwdLw//C8wPIwdA9SkU/Te/
 Tp7bsJSEcU5MXxBp3YOoL4vebyfUnG/aiIo9v5xZPvLpoPaYtjjGHdB+
X-Gm-Gg: ASbGncsxYf3QVwveTpNwncWuolxdlHuocCyryToGro11dg4PaXOVGhVnTyXnOaNQ55N
 MlcHsFzMwLsqaQPSY9DD+8shssSCRn0UTi0iitcBuwxHuCI3fejSxn3PpZsLCiLs1JWntDcmPmn
 KbuNnhpipGmw14UwN7D54xgy9WCUD7Y/cBaL6jIAT/Gjsg6jJ2z88nz7m2bbC6qZ0gZjXtWppNe
 hSZ+BiVu8eozR+srTVHGuZq4gyHKFJznK6nBfN91E5WZOxkGoSulMLNfYatzp5ODB4rEtX33nc+
 dNME9tI7TfYPpZdOoDMDnFZJ3rQqTQovN8H0hDGPdzPzepbHpdB5UuAvZHiwNsyemQuCtxALFUz
 jmXSD77KAUXLlGuRvT6E2cHI97XEZNDo1/SGoTiKcuOf/MyBGdpMUINJ/bFowe1hhwL2kkGPgMk
 wHUsPk5MbOgzUQd0+bwd+qT7rTdNIA
X-Google-Smtp-Source: AGHT+IEGo/MTvkIry259WaVh/tw9rDFQDiRK5HBiJnLYSAsembv5QYNewH86zQneZbtR/Kc+tN9uQQ==
X-Received: by 2002:ac8:5888:0:b0:4ab:8692:408e with SMTP id
 d75a77b69052e-4ab93d8db2cmr238698361cf.25.1752964969436; 
 Sat, 19 Jul 2025 15:42:49 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:48 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:35 -0400
Subject: [PATCH v2 06/10] rust: firmware: use `core::ffi::CStr` method
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-6-e1cb53f6d233@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=1139;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=eJzxwo6+dOxZLnVsYJ7KLApzPh+yuXrFuqz7GoEm5V8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP1e6JGRPX2Yn2Vgs8WZJjmjU+81WfzK4lKb2id8EqsgtG1MZLLxYbdgmtODlw4OTWKcgMCQa+x
 S01m6sOBO/Aw=
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
 rust/kernel/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index be684e860ed2..ca00aa2b4d85 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -291,7 +291,7 @@ const fn push_module_name(self) -> Self {
         let module_name = this.module_name;
 
         if !this.module_name.is_empty() {
-            this = this.push_internal(module_name.as_bytes_with_nul());
+            this = this.push_internal(module_name.to_bytes_with_nul());
 
             if N != 0 {
                 // Re-use the space taken by the NULL terminator and swap it with the '.' separator.

-- 
2.50.1

