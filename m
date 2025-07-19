Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80765B0B25B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2A110E430;
	Sat, 19 Jul 2025 22:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Li2LjVe5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F78310E43A
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:54 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4ab6e66ea68so43304881cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964973; x=1753569773; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dNvCZ3pjMtqtkb7kluvKanA1YBUxX9SYGV79cPChZl4=;
 b=Li2LjVe5PA2fZRz8a4GnkMmgzv9AXcF9ADz1Eu1X0yey0L0MQHEnqagyq8GmMonB+n
 lM5sQe86P39hyvvQ9Us/ULG0Ih9h3Po+a3GVj3ibaOVUcDOX8PsV0sIbOj19+h3DxHY1
 FVrgXdQfEM7na3waqRiPtzynYKmxKWxbwf5zj+TCFkdcwdYAa+exChj/LOJDV+k9keyu
 KUk2wKWWuIFHo9YxQ6quRQGnbX4WHNe9lWUcDDw85IU4cdqE1HCyuVxHvlebOVYbsqsr
 qNV5Jt9eS0y9mpUwpqyznUTjZnC+DSE1I0l9o9GWSaJl7dw2J1SFJ3WB60l8AllhfV0n
 W6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964973; x=1753569773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNvCZ3pjMtqtkb7kluvKanA1YBUxX9SYGV79cPChZl4=;
 b=MUGACcwR1smNd5FxqeFO6qHM3FzcIe6ryDJ0bG9aivA7cPxLffmm61F/8Nq5U+IZQ3
 BRLClHaFXR4cdr+RvQOPN0Xq011tIBAlZlE78caTFVBZG+mB61Hw7VoyH7MfZ9adAqZW
 X9pnFvEBE9X3zXPvT4JxOH/GLqrlmMal+95aN5CT0q/N/7qeQyeVnvEN9gv1hEBldp8R
 H4He15YUWYo/kOyjX75s1dC8JXkjNGGQqsR0y38dg6dLckWxZEMimecfSsaCyWSyZ0eW
 Yt7F0ZlIDW9HCzSD7utwbTbSeP2KJ8oIfiFOgSiTAqfYu79Wu8qHZOKtKvY2qIGlH/vb
 GleA==
X-Gm-Message-State: AOJu0YwDMYzEBVoeRor3McAa+CuQT4jlRWxYximk2+M0nymIw1jo0wPd
 9AVPYQVM+WATlV0Dv9lixGjWXWG3vS4UOA65C35HlaI75LyGte60Vxhx
X-Gm-Gg: ASbGnctoSQ78v2gFmWBia54CzdnPfqdaB/jJ8thNgPTbCh1iCEblx1R3YxoFeNdCGgz
 6AWfR/GZ4cVMZuwJoqFQtZ44FFfZmmKc+4c7VZEhwLgpZVK87I7fVQ6sPwGpxEkJogTajZEmLEV
 LyRDSGG/9mQ972zgj4i4063glLruOu1bFFRisrstvkKdV2ed0PRE3qZTKuvxwdtCEhCK2NxBcMc
 dH0Cl7VQ0vy4LOa+uGTdREoajHR+hPJBQWVFEPJ2lSL0IM+MqPV7RgWuQov3Fu3COp6cRgAOV0j
 gBEEEtjgZw4S99EOACTYim19DWkxWGbbfj+Pozr1UAy8TwL7nk1njoG81UUCztE/RhDDX793Da+
 0vfiBnc6FhhRxeB5ssIQH6fSKjkYTcIurhn0Q+mcBrt0zUTKMwsNg3LjxgxOT0ikMmvf7gzoNvl
 6fM/nvSPCfcnWiHjSFVzbwJfrSdHJl
X-Google-Smtp-Source: AGHT+IGuVgalovnA+HCQB1axFBvdtzKf0ypyaad2YVYZ3IyuazjlnfCCWqKMExbkm60aghoSvVdt5w==
X-Received: by 2002:ac8:7d51:0:b0:4ab:377c:b6be with SMTP id
 d75a77b69052e-4aba3cca75emr161850101cf.22.1752964973336; 
 Sat, 19 Jul 2025 15:42:53 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:52 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:37 -0400
Subject: [PATCH v2 08/10] rust: miscdevice: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-8-e1cb53f6d233@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964955; l=1231;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=lZfqelYwV8zIrJ8mC1Q2efKvp9yb5zIZ8TIX1qUdauE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNgVoP5fUEeNshHPuiSNpSaABih144IwAS+Gk+Fr79lMmJelh+Zmxg2GxFCxv0BmRtW8iB/JzKp
 oMNvetu19nwo=
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
 rust/kernel/miscdevice.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index ad51ffc549b8..585cfbcb8a2f 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -35,7 +35,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         // SAFETY: All zeros is valid for this C type.
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
-        result.name = self.name.as_char_ptr();
+        result.name = crate::str::as_char_ptr_in_const_context(self.name);
         result.fops = MiscdeviceVTable::<T>::build();
         result
     }

-- 
2.50.1

