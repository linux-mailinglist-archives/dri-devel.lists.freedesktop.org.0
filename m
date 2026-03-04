Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAA8EZl2qGnpugAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 19:14:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703CA20604D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 19:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8610510EA90;
	Wed,  4 Mar 2026 18:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kV6UOD5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0BA10EA90
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 18:14:45 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38a3066b68bso13544101fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 10:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772648083; x=1773252883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wRrufKol/wI70vYGE1YUZ3egJpHf7UYfsd/A/UWs3+U=;
 b=kV6UOD5LIz9hOx++Zf0r0UmX/kiyK0IvLe6Hxu9Bef7/kp+fLdw51o2fSHQS9sjYB+
 RKwH5BW639HXDqDcRt7jiFxvrfBVBhQUJXWYMxJiTcJ79NUs7ETJAQKLGCIFjNAqJdCD
 9IKkbCu3Pe68975xwhjoRGyInCr6AQLbZX4uh+0uDbawG54FXhjVoF89HcXvDmcw/SOz
 fP/UADdObAptInBA30Cpk6ucvT1UxwRIu3A2++HDHxybfnviPELbHgk3iHdO4OXayTNa
 +VKt4IvYnzzTn+wvvEAK2dMQU7YIef1xOqTHz00MpEVBuho/Y/ernrBZ2jJHKNaxPebt
 I+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772648083; x=1773252883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRrufKol/wI70vYGE1YUZ3egJpHf7UYfsd/A/UWs3+U=;
 b=LizwqE1d0X4mqpWSxpWICvOZ/eW7EVNXjwr51yYdhuldJuXwwS65ulHzCX8ZdHZhpZ
 QvD176cOzmSBLUp5KTmvgQkC4fcqVyZy2Gf3KI6hQQKEbRqtGEDRGeA0khGu6XRCl8PF
 mK5KVGysqRxfuFXuaIy+zNHfCcrVha2o9iTALIpnnkEA12nbAkhqmS28Y5CWDNcupopH
 HssWGg9UXeXZj8Cn1ihIWjavMZQmmvxTFl+mOFB9cImv4JovrhM605k4aZlC2n5hbcuI
 KZxNWZJ2dOKZ+7+cdCwXLY2WLMncRYSNAPP10wKsjZvbRgBgwuSJD7CJ6rNJWiQBpJwn
 9azA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKoFVqRaVqsSYR//+tzVRxIHLeWW8/btSVK7gXayaqvROZMAfdYw14Fiwx4NnabPD7SFTapJ/UPbY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7HbrX07uyGheg3ZbsQWyk8+Dk+KBpzktV15rXg/KMBKcgPYG9
 CCub7gMlsP+Wazlg6P7yY72VuohVhPt3llwlAWscqDh15KZRGBxKOSHB
X-Gm-Gg: ATEYQzx81h+nlknIoRA3lUMJFuNif+Qc/fbHCuZ38OdXfJlNs31YSsNjfoEFlSi6gl0
 sAODam6VuZ3NemzA1okNawqDh7bb1rsDdYYiJl+GVLtFIC47aUPr1Ow/cBbflzdWjjolIs1IU45
 6JJ4IV8Wdqo5/nNJ1vAfOSkGzzAuPtt/+k8NwQPAh0Qc6m7nSFWQkKQy35jiBeVcFgKrjwQOPZC
 YakxyuF0BNk49wv4J+mLGSSooCnN0eZJe2vJXr0uFDlAD7oQiONeruZSCRA3dRtpUa1Gv9zlR4t
 uRS5GFqxOhDGLZ9zAUFuZELSn1n4JhaXdS+wKoiYr470gLV8hYu/qt/XTZ3OqUrxfL6Xh2SYfEN
 Lv9iX9oVsCQ4JpL8cBWZTrrGpiS9SFMz37IHBFCuIpVLGxdNx3c7NODJ7DXO0C+idSimJHGS2I+
 qx8Tocv+xYkXmIn7wweBT3qbSU5IzAbhWsczrPHJ3riMM/wJ60Mbk86QZHZrsVABj361X0POM3z
 N13/SEsg45Y7aV+rKr1cQ==
X-Received: by 2002:a2e:964a:0:b0:38a:5e7:29d0 with SMTP id
 38308e7fff4ca-38a2c7b38a2mr21323471fa.28.1772648083079; 
 Wed, 04 Mar 2026 10:14:43 -0800 (PST)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru.
 [46.138.191.69]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12357da2dsm1102043e87.45.2026.03.04.10.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 10:14:42 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH] gpu: nova: add impl_num_enum!() macro to replace
 FromPrimitive boilerplate
Date: Wed,  4 Mar 2026 21:14:20 +0300
Message-ID: <20260304181420.5482-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: 703CA20604D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nouveau@lists.freedesktop.org,m:dakr@kernel.org,m:acourbot@nvidia.com,m:aliceryhl@google.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[iprintercanon@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[iprintercanon@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add a declarative macro impl_num_enum!() to generate both From<Enum>
for primitive and TryFrom<primitive> for Enum implementations for
repr(primitive) enums. This addresses the TODO[FPRI] markers
throughout the driver.

The macro accepts a list of variants to map, allowing certain variants
to be excluded from the reverse mapping (e.g. dead_code variants like
FalconModSelAlgo::Aes).

Replace the manual TryFrom and impl_from_enum_to_u8!() boilerplate for:
  - FalconCoreRev
  - FalconSecurityModel
  - FalconModSelAlgo
  - DmaTrfCmdSize
  - FalconFbifTarget
  - Architecture

FalconCoreRevSubversion retains its manual TryFrom because it requires
a bitmask operation on the input value. The Chipset enum retains its
existing define_chipset!() macro which already generates TryFrom.

While at it, add the missing repr(u8) attribute to FalconFbifTarget,
which is needed for the enum-to-primitive cast to be well-defined.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/gpu/nova-core/falcon.rs | 128 ++++++--------------------------
 drivers/gpu/nova-core/gpu.rs    |  21 +-----
 drivers/gpu/nova-core/num.rs    |  34 +++++++++
 3 files changed, 57 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..5b67cabe02f2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -23,6 +23,7 @@
     driver::Bar0,
     gpu::Chipset,
     num::{
+        impl_num_enum,
         FromSafeCast,
         IntoSafeCast, //
     },
@@ -34,17 +35,6 @@
 mod hal;
 pub(crate) mod sec2;
 
-// TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u8 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u8 {
-            fn from(value: $enum_type) -> Self {
-                value as u8
-            }
-        }
-    };
-}
-
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
 #[repr(u8)]
@@ -59,29 +49,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u8!(FalconCoreRev);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconCoreRev::*;
-
-        let rev = match value {
-            1 => Rev1,
-            2 => Rev2,
-            3 => Rev3,
-            4 => Rev4,
-            5 => Rev5,
-            6 => Rev6,
-            7 => Rev7,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(rev)
-    }
-}
+impl_num_enum!(FalconCoreRev: u8 [Rev1, Rev2, Rev3, Rev4, Rev5, Rev6, Rev7] => EINVAL);
 
 /// Revision subversion number of a falcon core, used in the
 /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
@@ -94,24 +62,27 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u8!(FalconCoreRevSubversion);
 
-// TODO[FPRI]: replace with `FromPrimitive`.
+impl From<FalconCoreRevSubversion> for u8 {
+    fn from(val: FalconCoreRevSubversion) -> u8 {
+        val as u8
+    }
+}
+
+// Manual TryFrom is required here due to the bitmask operation on the input value.
 impl TryFrom<u8> for FalconCoreRevSubversion {
     type Error = Error;
 
     fn try_from(value: u8) -> Result<Self> {
         use FalconCoreRevSubversion::*;
 
-        let sub_version = match value & 0b11 {
-            0 => Subversion0,
-            1 => Subversion1,
-            2 => Subversion2,
-            3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
+        match value & 0b11 {
+            0 => Ok(Subversion0),
+            1 => Ok(Subversion1),
+            2 => Ok(Subversion2),
+            3 => Ok(Subversion3),
+            _ => Err(EINVAL),
+        }
     }
 }
 
@@ -138,25 +109,7 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u8!(FalconSecurityModel);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        use FalconSecurityModel::*;
-
-        let sec_model = match value {
-            0 => None,
-            2 => Light,
-            3 => Heavy,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sec_model)
-    }
-}
+impl_num_enum!(FalconSecurityModel: u8 [None, Light, Heavy] => EINVAL);
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
 /// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
@@ -170,19 +123,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u8!(FalconModSelAlgo);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            1 => Ok(FalconModSelAlgo::Rsa3k),
-            _ => Err(EINVAL),
-        }
-    }
-}
+impl_num_enum!(FalconModSelAlgo: u8 [Rsa3k] => EINVAL);
 
 /// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
 #[repr(u8)]
@@ -192,19 +133,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u8!(DmaTrfCmdSize);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            0x6 => Ok(Self::Size256B),
-            _ => Err(EINVAL),
-        }
-    }
-}
+impl_num_enum!(DmaTrfCmdSize: u8 [Size256B] => EINVAL);
 
 /// Currently active core on a dual falcon/riscv (Peregrine) controller.
 #[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
@@ -247,6 +176,7 @@ pub(crate) enum FalconMem {
 /// This determines the memory type for external memory access during a DMA transfer, which is
 /// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
 #[derive(Debug, Clone, Default)]
+#[repr(u8)]
 pub(crate) enum FalconFbifTarget {
     /// VRAM.
     #[default]
@@ -257,23 +187,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u8!(FalconFbifTarget);
-
-// TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
-            0 => Self::LocalFb,
-            1 => Self::CoherentSysmem,
-            2 => Self::NoncoherentSysmem,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(res)
-    }
-}
+impl_num_enum!(FalconFbifTarget: u8 [LocalFb, CoherentSysmem, NoncoherentSysmem] => EINVAL);
 
 /// Type of memory addresses to use.
 #[derive(Debug, Clone, Default)]
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..045bd35f2d8f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -19,6 +19,7 @@
     fb::SysmemFlush,
     gfw,
     gsp::Gsp,
+    num::impl_num_enum,
     regs,
 };
 
@@ -135,25 +136,7 @@ pub(crate) enum Architecture {
     Ada = 0x19,
 }
 
-impl TryFrom<u8> for Architecture {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
-            0x16 => Ok(Self::Turing),
-            0x17 => Ok(Self::Ampere),
-            0x19 => Ok(Self::Ada),
-            _ => Err(ENODEV),
-        }
-    }
-}
-
-impl From<Architecture> for u8 {
-    fn from(value: Architecture) -> Self {
-        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
-        value as u8
-    }
-}
+impl_num_enum!(Architecture: u8 [Turing, Ampere, Ada] => ENODEV);
 
 pub(crate) struct Revision {
     major: u8,
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index c952a834e662..d5db97c3de0f 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -215,3 +215,37 @@ pub(crate) const fn [<$from _into_ $into>]<const N: $from>() -> $into {
 impl_const_into!(u64 => { u8, u16, u32 });
 impl_const_into!(u32 => { u8, u16 });
 impl_const_into!(u16 => { u8 });
+
+/// Implements [`TryFrom`] and [`From`] conversions between a `#[repr(primitive)]` enum and its
+/// underlying primitive type.
+///
+/// The [`TryFrom`] conversion returns the specified error for unrecognized values. The [`From`]
+/// conversion casts the enum variant to the primitive type.
+///
+/// Only the variants listed in the macro invocation are recognized by [`TryFrom`]. This allows
+/// excluding certain variants (e.g., dead code) from the reverse mapping.
+///
+/// The enum **must** have a `#[repr($prim_type)]` attribute. Without it, the `as` cast in the
+/// generated [`From`] impl is not guaranteed to be correct.
+macro_rules! impl_num_enum {
+    ($enum_type:ty : $prim_type:ty [$($variant:ident),+ $(,)?] => $err:expr) => {
+        impl From<$enum_type> for $prim_type {
+            fn from(val: $enum_type) -> $prim_type {
+                val as $prim_type
+            }
+        }
+
+        impl TryFrom<$prim_type> for $enum_type {
+            type Error = kernel::error::Error;
+
+            fn try_from(val: $prim_type) -> core::result::Result<Self, Self::Error> {
+                $(if val == <$enum_type>::$variant as $prim_type {
+                    return Ok(<$enum_type>::$variant);
+                })*
+                Err($err)
+            }
+        }
+    };
+}
+
+pub(crate) use impl_num_enum;
-- 
2.43.0

