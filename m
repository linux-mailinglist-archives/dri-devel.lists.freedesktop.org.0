Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8663D1C5963
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC89C6E5C0;
	Tue,  5 May 2020 14:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1348E6E5BD;
 Tue,  5 May 2020 14:25:35 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MJVU0-1jpiHq2SC0-00Jpo7; Tue, 05 May 2020 16:25:22 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu/dc: don't pass -mhard-float to clang
Date: Tue,  5 May 2020 16:24:56 +0200
Message-Id: <20200505142519.1138945-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:kyuCbCEFYOcHR9DitYTjAbdHsjMrBAl6tRD/hASI8cLhgsKb51z
 4SM5jXD33rd9/xC4Ev/039yaCDjFmF940iPtDNjHpkoyNLksYCThRDq3NxoD5XAj9b56A+N
 Wn1FMJsGA+XcWsm8tu1gT6IJamHNPqS//MWiN5SJg/G/fHJknT72vtObM6aOgfGAKtrJpXy
 2uj8DD9Q4oJPQ0wB4c8yg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zuXYTAazwNE=:PutM/bcLCGJjXJnOuEuYkH
 ZYpn4w7i2HwOMEBxnl8nED8rAiamNiwCxhrgA18hTQyg/lkPUp39/qIPXLPi3Z0xE83px2DKu
 ktQ86tTo2g5qB588P9fOBUEiVXI0iu3VX9yzyocfYCaCB0fz+MHFjKeiSV1q55BtLzDGOqWG1
 9VoJ+D3p5nhYeRUyWS4H8XoojR+X2Ne3OfTL5pPuTW8NMIfF7twoyVo+L897h7mmku9BKWJqR
 ahqfIzW13oTTMA3W/PoKXRtWxpzNEQ0HEbYykyVAoQbGdVJq30sfAiXLGaFUw6MyGjPfLqBxv
 EN9q2TxRx+wyFVulikYVOaduHdAwjG6FU1maMCdzIcNP5rE1OLjQLywYBBCziS46+obh9J4dV
 K1cdjItfVQUFOoKzmZTEpHcdS0xkbPRQARihqQcuYmI0qug3JwpQo/Si19/NoVYvUZNHdL+Z7
 ksMqzvtFiE74x5kMdFAAmDTvCqY/7X3hq8T6kR9aCFNN2giRR909dKlMC76msaQFcdfggubY1
 yIBDsnLNXTQPcr3pIPWbxt1Mo6rY6j4kaoEJjXQ2AWEq7z06KQNGV87ooVcyi2Wag3NcUDcmK
 SQ+AvWrCQ4spBhCBt+RawkuBvWH4emWNZ//soISOPpuCipnlu+XkdidFfYhfCTYx/5LdPPUo4
 JK1mGkJAe4P7+JEqTKlxn8bwSv7eGO+a0OvJKK2nsrv/aOSvUd7UYH/0T7i2dt3RmkjGKRyzA
 Q00x5Iezmpf4ojKXOh+y7MBF9RbadJpAEiStCnqyCN7juVfsCadGE2d+BXgkE/FmZmpyZ2B2t
 avuyqPcFNOJpGaZHCb1llcI/0ZQQm3FbIKEJqyQXc7iUb5dP9s=
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
Cc: Charlene Liu <charlene.liu@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux@googlegroups.com, Marc Zyngier <maz@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 dri-devel@lists.freedesktop.org, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang does not appear to care, and instead prints a warning:

clang: warning: argument unused during compilation: '-mhard-float' [-Wunused-command-line-argument]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/calcs/Makefile | 5 +++--
 drivers/gpu/drm/amd/display/dc/dcn20/Makefile | 5 +++--
 drivers/gpu/drm/amd/display/dc/dcn21/Makefile | 5 +++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 5 +++--
 drivers/gpu/drm/amd/display/dc/dsc/Makefile   | 5 +++--
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/calcs/Makefile b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
index 4674aca8f206..64195cacf6fc 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/calcs/Makefile
@@ -26,14 +26,15 @@
 #
 
 ifdef CONFIG_X86
-calcs_ccflags := -mhard-float -msse
+calcs_ccflags := -msse
 endif
 
 ifdef CONFIG_PPC64
-calcs_ccflags := -mhard-float -maltivec
+calcs_ccflags := -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
+calcs_ccflags += -mhard-float
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
index 5fcaf78334ff..0d3ce716c753 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/Makefile
@@ -10,14 +10,15 @@ DCN20 = dcn20_resource.o dcn20_init.o dcn20_hwseq.o dcn20_dpp.o dcn20_dpp_cm.o d
 DCN20 += dcn20_dsc.o
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -msse
 endif
 
 ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -mhard-float -maltivec
+CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o := -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
+CFLAGS_$(AMDDALPATH)/dc/dcn20/dcn20_resource.o += -mhard-float
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
index 07684d3e375a..fd209d1cf6bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/Makefile
@@ -6,14 +6,15 @@ DCN21 = dcn21_init.o dcn21_hubp.o dcn21_hubbub.o dcn21_resource.o \
 	 dcn21_hwseq.o dcn21_link_encoder.o
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -msse
 endif
 
 ifdef CONFIG_PPC64
-CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -mhard-float -maltivec
+CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o := -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
+CFLAGS_$(AMDDALPATH)/dc/dcn21/dcn21_resource.o += -mhard-float
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 7ee8b8460a9b..fb74e79e15a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -26,14 +26,15 @@
 # subcomponents.
 
 ifdef CONFIG_X86
-dml_ccflags := -mhard-float -msse
+dml_ccflags := -msse
 endif
 
 ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float -maltivec
+dml_ccflags := -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
+dml_ccflags += -mhard-float
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/Makefile b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
index 3f66868df171..b0077f5c318d 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
@@ -3,14 +3,15 @@
 # Makefile for the 'dsc' sub-component of DAL.
 
 ifdef CONFIG_X86
-dsc_ccflags := -mhard-float -msse
+dsc_ccflags := -msse
 endif
 
 ifdef CONFIG_PPC64
-dsc_ccflags := -mhard-float -maltivec
+dsc_ccflags := -maltivec
 endif
 
 ifdef CONFIG_CC_IS_GCC
+dsc_ccflags += -mhard-float
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
