Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E35AB08AE
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E1810E26E;
	Fri,  9 May 2025 03:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UERRK5Xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8585910E269;
 Fri,  9 May 2025 03:17:01 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3fb3f4bf97aso781098b6e.2; 
 Thu, 08 May 2025 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760621; x=1747365421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoqckDBCEduuhxuaJVPjKVAng30GrSpmzU1JLtBRF8I=;
 b=UERRK5XuefxmPMOH2T7ItgSdduPUXD95qZMl/PMg0rwBF8fo7xdUcJLGRWPeoJYxv3
 Thd3mjIVs3LxFJsYPxw372AU3DR7ybpwmlvbfwOh5b9DssF7wn38hpHsyMkPnEWRWXXz
 y3RpMUA5iMZ9yhJQAulOAF18zBt6OD+ngbJ0WjC5PVeB9GkG6JZFZZ+G+qKXNpttZVT6
 wyIXdT65fzegv5oqm8/uPbTyw0tCVs59umtr4luVmLbwKwCaSjFNH5XnNSNZrVLCNuj7
 lV+DrRYySgRjD2CD8u9aD600xDS1upF381rn8NK0a2vxMPiPbMeAA0/O//psmPVWbgK2
 3mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760621; x=1747365421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hoqckDBCEduuhxuaJVPjKVAng30GrSpmzU1JLtBRF8I=;
 b=b/L5h/BpjkirQkCtJ9UeSyd/Bm487BxujNWF1HIl3UN+7XoSTuqbuOdQvSmTo0GgdN
 sKWuRxHCZ52azopxeg5+BNHcIrSQODDZ2NuRd1uJb3qVAl5DcjmSS6Bw9OpLZYZoaXgn
 JO2y42dRIK5D68XTH5IDW4TtOisMSM1wU9neHYwUBJ3Hjuv1o3ZOSwsmRAHCORVwDnsL
 NqgP763UyjEec0q6MG1W8R8yQdOLNFzP4Ma/4vGZNwFjihuVpKeu4q1l7tMzTueIZD7p
 O6Ej0ImjoLORXC6ySpVFAiqnX9Z3mHm0RonbEOj3uX2LGbjF6KEXw5VT52BjHdlIGQCU
 oo5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3wnQSRShixoqMp1z8vB3JETqtTE4p9dHQJ2ev+oixWR/0H3x02/L2vjVMnz7YE37WK+QzEysmfDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXoTr/0PStWn0jFqDYAyWnEe+EBnitEiEpIeJLosDfXDKHH87H
 opWwU7Gnoo+fr9kUBDOuRbyg6dXnvUd89eIs1GOAHcKkQnCEcWFY
X-Gm-Gg: ASbGncs86eMi0XQna21fZfrrOarfcnuvd7C3anp0sgZtFP1Cf3SDG54flvQFguPqBDC
 miW/Wh7pEQVq/7jDiROSmcutUnliKPbdVIsfVw1xyaExiU3NTH2pCxw3weXV8A8AId5xrKAIG8d
 C5AFxt8GGROKNURWHkPOzUuVSeRcLGVfAmY07VKKnPedSh1Ch5UL3lTCNpOYew1fotrero+0TLu
 zwiLbzQiFPZZgX8JPMHq8Kz25gH50JOzUxHtNAmtHRtzArYwx1UkZ5Aa4m7wyk3o6I6Y38xID60
 /lW1Dv1Cybz6mL7dKKjnNtJufrvfvbRR6wC2qxqL0d4e6hxJyDTJ7dW0HUGk9w0/+f/kLHd3o04
 9lWrwaYhYm2uu
X-Google-Smtp-Source: AGHT+IFJactH9R43mBMIGMb7nbzPeCuDDlGMTikD03Mao0oUkKw8j52bGTKF3TXqX8VwPN7rT3jqPA==
X-Received: by 2002:a05:6820:1a0b:b0:604:4846:78a with SMTP id
 006d021491bc7-6083ff0ff81mr1538256eaf.2.1746760620739; 
 Thu, 08 May 2025 20:17:00 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:17:00 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 09/11] samples: rust: rust_driver_pci: update to use new bar
 and io api
Date: Thu,  8 May 2025 22:15:22 -0500
Message-ID: <20250509031524.2604087-10-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

update rust_driver_pci.rs to use the new bar and io api.

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 samples/rust/rust_driver_pci.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 2bb260aebc9e..b645155142db 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -4,7 +4,9 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, c_str, device::Core, devres::Devres, pci, prelude::*, types::ARef};
+use kernel::{
+    bindings, c_str, device::Core, devres::Devres, io::IoAccess, pci, prelude::*, types::ARef,
+};
 
 struct Regs;
 
@@ -16,7 +18,7 @@ impl Regs {
     const END: usize = 0x10;
 }
 
-type Bar0 = pci::Bar<{ Regs::END }>;
+type Bar0 = pci::IoBar<{ Regs::END }>;
 
 #[derive(Debug)]
 struct TestIndex(u8);
-- 
2.49.0

