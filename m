Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583139CEB15
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB3210E880;
	Fri, 15 Nov 2024 15:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Fri, 15 Nov 2024 15:11:18 UTC
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 945C310E880;
 Fri, 15 Nov 2024 15:11:18 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.202])
 by gateway (Coremail) with SMTP id _____8BxeeCHYjdnO3c+AA--.57471S3;
 Fri, 15 Nov 2024 23:02:31 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.202])
 by front1 (Coremail) with SMTP id qMiowMBx20aDYjdnyf9WAA--.19097S2;
 Fri, 15 Nov 2024 23:02:30 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>, Rui Wang <wangrui@loongson.cn>
Subject: [PATCH] drm/amd/display: Allow building DC with clang on LoongArch
Date: Fri, 15 Nov 2024 23:02:25 +0800
Message-ID: <20241115150225.2812054-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMBx20aDYjdnyf9WAA--.19097S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr45Ww4furyUGrWDuF1fKrX_yoW5Jrykpw
 sYkFsxurWDJ3WrAFZrt3WxuFZ8Ca93AFyUJryrXw15uas8ZrykAr9akF4Ut3srZF92yFya
 yFn7GrWkZF1q9rbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
 67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=
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

Clang on LoongArch (18+) appears to be unaffected by the bug causing
excessive stack usage in calculate_bandwidth(). But when building DC_FP
support the stack frame size can be as large as 2816 bytes, which causes
the FRAME_WARN build warnings. So on LoongArch we allow building DC with
clang, but disable DC_FP by default.

The help message is also updated.

Tested-by: Rui Wang <wangrui@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/amd/display/Kconfig | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index df17e79c45c7..11e3f2f3b174 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -7,20 +7,21 @@ menu "Display Engine Configuration"
 config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
-	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
+	depends on BROKEN || !CC_IS_CLANG || ARM64 || LOONGARCH || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CLANG && (ARM64 || RISCV))
+	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && !(CC_IS_CLANG && (ARM64 || LOONGARCH || RISCV))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
 	  Raven ASICs.
 
-	  calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 || ARM64)
-	  architectures built with Clang (all released versions), whereby the stack
-	  frame gets blown up to well over 5k.  This would cause an immediate kernel
-	  panic on most architectures.  We'll revert this when the following bug report
-	  has been resolved: https://github.com/llvm/llvm-project/issues/41896.
+	  calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 ||
+	  ARM64 || LOONGARCH || RISCV) architectures built with Clang (all released
+	  versions), whereby the stack frame gets blown up to well over 5k.  This
+	  would cause an immediate kernel panic on most architectures.  We'll revert
+	  this when the following bug report has been resolved:
+	  https://github.com/llvm/llvm-project/issues/41896.
 
 config DRM_AMD_DC_FP
 	def_bool n
-- 
2.43.5

