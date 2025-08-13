Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E45B24E7E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 17:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDB010E76C;
	Wed, 13 Aug 2025 15:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZwubzoqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED90210E76D;
 Wed, 13 Aug 2025 15:59:49 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4b1099126afso545931cf.0; 
 Wed, 13 Aug 2025 08:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755100789; x=1755705589; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/ZjL8BuYiXMAJDEbNeQ1u7fLpcTiw+Jir0VMSqwREoA=;
 b=ZwubzoqZDkPqYKAbWmvpWNXfxAyK/aQEt2bA/BBBjbuacXWzuUR0lABQlbPjyeN2A6
 ngOB3m0V0RkwLq2JOIZol/APP8wNIqJljTNWM6l9nUl7DrKfZvqLXwnSqoy8zoxr3y6b
 bPPtPlxFveZuVeGi5LmlWTfA1Ayh3sIWbCbz+/XA87KL2iNurAD9awwN3pE3u4nmA6R7
 xeQ5uqFPy44ibUUfW0wPQHe+N+9Hqa460gXfpkjjRStCXjPWRSXEqSMtfGG29HOxAI04
 P+BUh8lof68//LkQat/Fp+fn6Ee6CREYyPUAllJGEvVRiyuNQSW4niPEu2ZBUdyd1qk5
 WQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755100789; x=1755705589;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ZjL8BuYiXMAJDEbNeQ1u7fLpcTiw+Jir0VMSqwREoA=;
 b=VFpzN2Wlov1hzbciS80iWcLY8IsSLKvEdGdfFOZ1LFP5ENcdO/IzJzrKdvWb1y8chr
 xG6oAsXH8LEEmRsOYBjEbkxMaPUcdtRK0K77JByfJAMqovctizxz6io/DRUf2I8PLo92
 Jwj4hrx9idN3Hql/J6aDzCwqDcJtGruCIDwUtblLeVoVHt2YXFlX57efdUgCG2zNr8Yz
 g+SjpGqpLLwO0nteK+/rBGsGE81ucfH0R3JuV0v5wxEJoaW5pKgkv2G1aP4S3/2YHfCO
 Uho7E2/7ilPfDOUxeJKWqCKD2lazglypMJ3XzEasi6vQNdjy00yABKJRrOd//MmRoQIR
 e1wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl5PmQIu7IzEDX/B+iEH3cpXIEa+pRscaTDrY7Q7k3a96yh68DWIbq5V2z1buPrVt6VJ0OV4A7va8=@lists.freedesktop.org,
 AJvYcCXPIl6RNTo22vPj1TtRKQK/eErwr3sxC2VzP7wrJbe/H7719dX19DqGeG63eYXtb4y11Eyh05PzjA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQhBZNHbx7/P1mQX9NHDxMO37swiuoevH/F6MDwkmQpiBnsrMw
 QhZX5idoWdRAmRpaW3XEsLtP8eAv0n68JDLyN1sZp7KqpBZafoXivgHq
X-Gm-Gg: ASbGncvYh8D7lIp9Uxmt1dmFLP5cvUdn41wCOqwBNrsKBqf8nTBNeajMWAPQS4dBKtt
 BiRvh+5WTU7gyUgsyv2vTPexQTfiMVKqGdYw513rkxqHx7f17m+5mxrFiPkCA34OklOyz8ncpbn
 YADLCI7Ov+emxhncP9nbpALSvk7tDfqQysiX2vxAuj+K2qkZfcpefUESXBovnXmIiBD4pTJhMeo
 j3k1whkTuQ56daduzcWM6EcwTIWKdpDelZinNYVjb7pcDVdPDDsHPV3iEMsIYMCkGoOapDP2oSk
 81OBxtGE4n2nkJbIeOisxq0fq33bgIFBjG08l9sQVGeHpkKVu8nlQulwlEM1M5OnDyP1McVS4QW
 IHs2Ri/LZkInRa6dtaMBDOehxQUiAlx23LAxklpiuTd7ut7s7k+348hhkUmoGLxLIeNQIxB3Fpi
 N7qy8vuZMYn3y4za+iTKmDFWbJMNL7
X-Google-Smtp-Source: AGHT+IFFp6aIDI6QZQPb+JyapqaAj5uYDYsz9npJMS7fiT1IGSQMfKW1auc5xK12YIuMevr8ggZZCw==
X-Received: by 2002:a05:622a:4d0a:b0:4b0:8f6e:d70f with SMTP id
 d75a77b69052e-4b0fc8208cemr46654731cf.43.1755100788813; 
 Wed, 13 Aug 2025 08:59:48 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4808:6353:5c00:d445:7694:2051:518c])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b085ad7d08sm124482211cf.53.2025.08.13.08.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 08:59:48 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 13 Aug 2025 11:59:18 -0400
Subject: [PATCH v2 08/19] rust: firmware: replace `kernel::c_str!` with
 C-Strings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-core-cstr-cstrings-v2-8-00be80fc541b@gmail.com>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1755100760; l=1629;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=UGSTQZC9H1LDaPmLjFq4B1ddEUZz53neJbsEkAPyHbw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG+vCCP6hDccm3sUoowPnpwpgqqFe3IfCMbA99v8SH1XNqg9hEr3E2kDwI1zkxYST/aT1F37NuR
 CZw/X51tLPQo=
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

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/firmware.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 376e7e77453f..71168d8004e2 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -51,13 +51,13 @@ fn request_nowarn() -> Self {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{c_str, device::Device, firmware::Firmware};
+/// # use kernel::{device::Device, firmware::Firmware};
 ///
 /// # fn no_run() -> Result<(), Error> {
 /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
 /// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
 ///
-/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
+/// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
 /// let blob = fw.data();
 ///
 /// # Ok(())
@@ -204,7 +204,7 @@ macro_rules! module_firmware {
     ($($builder:tt)*) => {
         const _: () = {
             const __MODULE_FIRMWARE_PREFIX: &'static $crate::str::CStr = if cfg!(MODULE) {
-                $crate::c_str!("")
+                c""
             } else {
                 <LocalModule as $crate::ModuleMetadata>::NAME
             };

-- 
2.50.1

