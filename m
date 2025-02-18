Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768AA3AC48
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:01:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDE010E0C9;
	Tue, 18 Feb 2025 23:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZgxPATSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3BC10E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:01:38 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-220ec47991aso64582335ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 15:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739919698; x=1740524498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rgkklgzg+KC89vfZ7sk39jLYW+8YEoMcWjrCaBYDcUw=;
 b=ZgxPATSehyO/9ZliLzccFz+qFP5KscChR1oXvruNVR081kyK9UleHPOeL2DbCXxC4R
 rhVEFhxuk+QxG8r1WMpRrxfOduQxFHa6yIt+buqznHTCMd+1nZJMjlLedCKg0mSOC3Rk
 E2IhloDLxkTEghOvqSRi7MwYvI4zis2IlyaurCUoAeVZsw1YxywX7ITSjEJ0CZ7ATEgG
 Ip1tBTailTdKw+m0++40MqIScpK7x/p7HAbDADEgvX6veoD/TEs7O5DU2IZF99UIJATc
 kO0oFj2XJcFU6sTwEJ9n3eOk8cc60DLcNvxc9taTn2F89yZO3nVPfn36VjiYL9M1G/PM
 Ejmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739919698; x=1740524498;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rgkklgzg+KC89vfZ7sk39jLYW+8YEoMcWjrCaBYDcUw=;
 b=Dr6O2sx92D8mhsS9RU1t1zMSdLeLe+yf5hcsxSL9F0uALqVwb4A4VnIgkrXEqq+KOO
 KjK5bxqK8kqhOZ6Rx9+C7E5xc2i9INFXvOD3eWOQDpWpXCZbbdePNbnleCHBvT2Ml9pp
 5hLk+0puyXPrcJ0WzxIL6IzJ/uJ78AP8GiwYRjsxIzX6eCNl9pH0z6/mdJik7I7W2TvR
 AYUF5GmDky3rlBlBrwdhoGTtqfK4TjbjqCcwYNdNsWDw3PLCXQpDceybmm9IGms9xV70
 WC0A32lC3LS+bi7t3f7dMbXNEaQJ7DZ+BNvq/Az1LjFDBtfBujyqeAIN0rdHlFt5uUI5
 GHxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5i/phlB8MXGRtHkmEqEFxb+I3344tGBMvwFWWmCYe4cphJlqseSy7Pb5UgjKj3WWrZkK+EEF4kp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFFpFBu7FaXWF+SlUX9fd3bZZoeUnms+Yt4GuwK+qEmmtauV6F
 7bUSIRLrLoKkPkRhBsndab4+qf0A/ouavNOSdN6q6Pgf/mr6XcKs
X-Gm-Gg: ASbGncu/aRrLBRfPr8vYbvJ+o3cQkfM/etzwEdJ2I2XuHBgQz1oA7R0NCIcWQXk3IfJ
 mRb8smh+e6V88w4tw37mnBdhYaf0FgCCskC9vcM7Ocd+7spThy72CrChNJIJPLSmP3xdAuTqP6g
 slzoYZVZK7IIJhbjX1dHHEih8fQ+g2wCfa3zID+QBvkrSU4Pb9D/LSZkwKisGTau9VLKzxZO6Bm
 /9hHr7NjdtbMLs7KGA23YbRcSEiAC60DwNYz00gTQI9Gj85op3y4ePyEYdnRjHJtGCrlo4/70cv
 AC1HIlgOCIdE3VB7HawC2NMKi7+kPGbP2S6mwZo+XIyJV1zb38vna7w6MJD6qwoFI20U
X-Google-Smtp-Source: AGHT+IEPS7VYLlllIEiqS7YMOU6jOcQEdPxDfRkeVHwuIMaMZhr6hscMXiB84+csU1GyapYRQGW9kg==
X-Received: by 2002:a05:6a00:148c:b0:728:9d19:d2ea with SMTP id
 d2e1a72fcca58-7329de81202mr1616355b3a.13.1739919697683; 
 Tue, 18 Feb 2025 15:01:37 -0800 (PST)
Received: from localhost.localdomain (syn-076-173-166-017.res.spectrum.com.
 [76.173.166.17]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73265678abasm6906047b3a.27.2025.02.18.15.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 15:01:37 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 deller@gmx.de, javierm@redhat.com, thomas.tai@oracle.com
Cc: tzimmermann@suse.de, kasong@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
Subject: [PATCH 1/1] fbdev: hyperv_fb: Fix hang in kdump kernel when on
 Hyper-V Gen 2 VMs
Date: Tue, 18 Feb 2025 15:01:30 -0800
Message-Id: <20250218230130.3207-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Gen 2 Hyper-V VMs boot via EFI and have a standard EFI framebuffer
device. When the kdump kernel runs in such a VM, loading the efifb
driver may hang because of accessing the framebuffer at the wrong
memory address.

The scenario occurs when the hyperv_fb driver in the original kernel
moves the framebuffer to a different MMIO address because of conflicts
with an already-running efifb or simplefb driver. The hyperv_fb driver
then informs Hyper-V of the change, which is allowed by the Hyper-V FB
VMBus device protocol. However, when the kexec command loads the kdump
kernel into crash memory via the kexec_file_load() system call, the
system call doesn't know the framebuffer has moved, and it sets up the
kdump screen_info using the original framebuffer address. The transition
to the kdump kernel does not go through the Hyper-V host, so Hyper-V
does not reset the framebuffer address like it would do on a reboot.
When efifb tries to run, it accesses a non-existent framebuffer
address, which traps to the Hyper-V host. After many such accesses,
the Hyper-V host thinks the guest is being malicious, and throttles
the guest to the point that it runs very slowly or appears to have hung.

When the kdump kernel is loaded into crash memory via the kexec_load()
system call, the problem does not occur. In this case, the kexec command
builds the screen_info table itself in user space from data returned
by the FBIOGET_FSCREENINFO ioctl against /dev/fb0, which gives it the
new framebuffer location.

This problem was originally reported in 2020 [1], resulting in commit
3cb73bc3fa2a ("hyperv_fb: Update screen_info after removing old
framebuffer"). This commit solved the problem by setting orig_video_isVGA
to 0, so the kdump kernel was unaware of the EFI framebuffer. The efifb
driver did not try to load, and no hang occurred. But in 2024, commit
c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info")
effectively reverted 3cb73bc3fa2a. Commit c25a19afb81c has no reference
to 3cb73bc3fa2a, so perhaps it was done without knowing the implications
that were reported with 3cb73bc3fa2a. In any case, as of commit
c25a19afb81c, the original problem came back again.

Interestingly, the hyperv_drm driver does not have this problem because
it never moves the framebuffer. The difference is that the hyperv_drm
driver removes any conflicting framebuffers *before* allocating an MMIO
address, while the hyperv_fb drivers removes conflicting framebuffers
*after* allocating an MMIO address. With the "after" ordering, hyperv_fb
may encounter a conflict and move the framebuffer to a different MMIO
address. But the conflict is essentially bogus because it is removed
a few lines of code later.

Rather than fix the problem with the approach from 2020 in commit
3cb73bc3fa2a, instead slightly reorder the steps in hyperv_fb so
conflicting framebuffers are removed before allocating an MMIO address.
Then the default framebuffer MMIO address should always be available, and
there's never any confusion about which framebuffer address the kdump
kernel should use -- it's always the original address provided by
the Hyper-V host. This approach is already used by the hyperv_drm
driver, and is consistent with the usage guidelines at the head of
the module with the function aperture_remove_conflicting_devices().

This approach also solves a related minor problem when kexec_load()
is used to load the kdump kernel. With current code, unbinding and
rebinding the hyperv_fb driver could result in the framebuffer moving
back to the default framebuffer address, because on the rebind there
are no conflicts. If such a move is done after the kdump kernel is
loaded with the new framebuffer address, at kdump time it could again
have the wrong address.

This problem and fix are described in terms of the kdump kernel, but
it can also occur with any kernel started via kexec.

See extensive discussion of the problem and solution at [2].

[1] https://lore.kernel.org/linux-hyperv/20201014092429.1415040-1-kasong@redhat.com/
[2] https://lore.kernel.org/linux-hyperv/BLAPR10MB521793485093FDB448F7B2E5FDE92@BLAPR10MB5217.namprd10.prod.outlook.com/

Reported-by: Thomas Tai <thomas.tai@oracle.com>
Fixes: c25a19afb81c ("fbdev/hyperv_fb: Do not clear global screen_info")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
The "Fixes" tag uses commit c25a19afb81c because that's where the problem
was re-exposed, and how far back a stable backport is needed. But I've
taken a completely different, and hopefully better, approach in the
solution that isn't related to the code changes in c25a19afb81c.

 drivers/video/fbdev/hyperv_fb.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 363e4ccfcdb7..ce23d0ef5702 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -989,6 +989,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 
 		base = pci_resource_start(pdev, 0);
 		size = pci_resource_len(pdev, 0);
+		aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME);
 
 		/*
 		 * For Gen 1 VM, we can directly use the contiguous memory
@@ -1010,11 +1011,21 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			goto getmem_done;
 		}
 		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
+	} else {
+		aperture_remove_all_conflicting_devices(KBUILD_MODNAME);
 	}
 
 	/*
-	 * Cannot use the contiguous physical memory.
-	 * Allocate mmio space for framebuffer.
+	 * Cannot use contiguous physical memory, so allocate MMIO space for
+	 * the framebuffer. At this point in the function, conflicting devices
+	 * that might have claimed the framebuffer MMIO space based on
+	 * screen_info.lfb_base must have already been removed so that
+	 * vmbus_allocate_mmio() does not allocate different MMIO space. If the
+	 * kdump image were to be loaded using kexec_file_load(), the
+	 * framebuffer location in the kdump image would be set from
+	 * screen_info.lfb_base at the time that kdump is enabled. If the
+	 * framebuffer has moved elsewhere, this could be the wrong location,
+	 * causing kdump to hang when efifb (for example) loads.
 	 */
 	dio_fb_size =
 		screen_width * screen_height * screen_depth / 8;
@@ -1051,11 +1062,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	info->screen_size = dio_fb_size;
 
 getmem_done:
-	if (base && size)
-		aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME);
-	else
-		aperture_remove_all_conflicting_devices(KBUILD_MODNAME);
-
 	if (!gen2vm)
 		pci_dev_put(pdev);
 
-- 
2.25.1

