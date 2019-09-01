Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB9A4FCC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0B88FB2;
	Mon,  2 Sep 2019 07:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3187 seconds by postgrey-1.36 at gabe;
 Sun, 01 Sep 2019 20:36:59 UTC
Received: from fallback21.mail.ru (fallback21.m.smailru.net [94.100.176.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E27A896AF
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 20:36:58 +0000 (UTC)
Received: from [10.161.64.41] (port=42026 helo=smtp33.i.mail.ru)
 by fallback21.m.smailru.net with esmtp (envelope-from <trek00@inbox.ru>)
 id 1i4VlN-0002jN-Q0
 for dri-devel@lists.freedesktop.org; Sun, 01 Sep 2019 22:43:50 +0300
Received: by smtp33.i.mail.ru with esmtpa (envelope-from <trek00@inbox.ru>)
 id 1i4VlK-0005wi-Vi
 for dri-devel@lists.freedesktop.org; Sun, 01 Sep 2019 22:43:47 +0300
Date: Sun, 1 Sep 2019 21:43:49 +0200
From: Trek <trek00@inbox.ru>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Allow reading more status registers on si/cik
Message-ID: <20190901214349.40055a46@enterprise>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/cbhWo13DVkFuroGP8L2M1tF"
X-77F55803: CF41D5CA8C6D3C0C7F9F52485CB584D786C548EC7EDDB260CD9782038F6275D0A2568E6B41E1012932749D0B7FF8D3A451CE0648C9E8651D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B198AA70935470D0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637695C86F4341D7D1D8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC7FDB7DD2F0D8C07522E4AFA3B00B9EB343C6370FBCE28ACE389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947C9FFED5BD9FB41755BA3038C0950A5D36C8A9BA7A39EFB766BE1D6DAAD8F14AE176E601842F6C81A127C277FBC8AE2E8BBAB84C70CF72A8F33AA81AA40904B5D9C68CB3A264D9FF60CE5475246E174218D5E8D9A59859A8B6CAC4D16390889D371BEB6EF8769FD0705E1C53F199C2BB95B5C8C57E37DE458B4C7702A67D5C3316FA3894348FB808DBEB6346B700B4D54FE5BFE6E7EFDEDCD789D4C264860C145E
X-Mailru-Sender: 3A58916676D730AD110EA4D0B6E51700BBCDB78E73057EA7DAE39CCEC1D39659140FE51BDE05C0F778D1C52C123379C53DDE9B364B0DF289C7C68A5D2B74F2F41BE96DBAF4D557C5AE208404248635DF
X-Mras: OK
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDCC0EC7B6C70AD602FA23C38C37E1519A5D5055D21D4CFF792EA34D90F5C6EEE47
X-7FA49CB5: 0D63561A33F958A56B0FC3FA593C0A364E727FEE604CA31E3EBB0BF28708052A8941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C224982563F3F8B9AE5B03AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE746629162691A9FFFCD04E86FAF290E2D6359072D249038FD3C9F3DD0FB1AF5EBE26B79914A659FB62623479134186CDE6BA297DBC24807EABDAD6C7F3747799A
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C900556A444D277242DFDACF2CC407E51AA79A23C38C37E1519A53CD95BDAFD65CBB278D1C52C123379C53DDE9B364B0DF289C7C68A5D2B74F2F41BE96DBAF4D557C5AE208404248635DF
X-Mras: OK
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail; 
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date;
 bh=5Xg1AKWX/lB89xKJ9T5/kmxH8t01Rg9+tzlbGhTSMvw=; 
 b=nBdEXUwkgQscSynBQ1JroMsuA4qGosuVG7qbtHCwonQzI0I+7eYrYl/A+gkp6Fp/5C+sx9R6x33uCpNiZRuW34adZwzzu8/m311x+gDGX8dTp5sfdOnHoGq3XSNyIQn8HYguuneGTA69PkxtQRyL2w08gJgGQNaM3oFNTzr0Fn8=;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail; 
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date;
 bh=5Xg1AKWX/lB89xKJ9T5/kmxH8t01Rg9+tzlbGhTSMvw=; 
 b=nBdEXUwkgQscSynBQ1JroMsuA4qGosuVG7qbtHCwonQzI0I+7eYrYl/A+gkp6Fp/5C+sx9R6x33uCpNiZRuW34adZwzzu8/m311x+gDGX8dTp5sfdOnHoGq3XSNyIQn8HYguuneGTA69PkxtQRyL2w08gJgGQNaM3oFNTzr0Fn8=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

--MP_/cbhWo13DVkFuroGP8L2M1tF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hello,

this patch adds some registers to the list of allowed registers. It is
based on commit c7890fea. I have added any register that is defined for
each architecture. I'm interested only to mmSRBM_STATUS{,2} but I think
it is good to have more coherency between architectures.

Not sure if KMS_DRIVER_MINOR need to be increased, but it seems to be
as it was written in version 3.1.0.

This patch was tested only for cik on KAVERI, other architectures are
untested, but it compiles fine.

Please to tell me if it needs some changes
ciao!

--MP_/cbhWo13DVkFuroGP8L2M1tF
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-drm-amdgpu-Allow-reading-more-status-registers-for-s.patch

From b55c65cd534c2994766920ee2cd5ed33d232e8f8 Mon Sep 17 00:00:00 2001
From: Trek <trek00@inbox.ru>
Date: Sat, 31 Aug 2019 21:37:32 +0200
Subject: [PATCH] drm/amdgpu: Allow reading more status registers on si/cik

Allow userspace to read the same status registers for every family.
Based on commit c7890fea, added any of these registers if defined in
the include files of each architecture.

Signed-off-by: Trek <trek00@inbox.ru>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  3 ++-
 drivers/gpu/drm/amd/amdgpu/cik.c        | 19 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/nv.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/si.c         | 11 +++++++++++
 drivers/gpu/drm/amd/amdgpu/soc15.c      |  1 +
 5 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 5376328d3..65f171e64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -79,9 +79,10 @@
  * - 3.31.0 - Add support for per-flip tiling attribute changes with DC
  * - 3.32.0 - Add syncobj timeline support to AMDGPU_CS.
  * - 3.33.0 - Fixes for GDS ENOMEM failures in AMDGPU_CS.
+ * - 3.34.0 - Allow reading more status registers on si/cik
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	33
+#define KMS_DRIVER_MINOR	34
 #define KMS_DRIVER_PATCHLEVEL	0
 
 #define AMDGPU_MAX_TIMEOUT_PARAM_LENTH	256
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 1ffbc0d3d..43d5773e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -966,6 +966,25 @@ static bool cik_read_bios_from_rom(struct amdgpu_device *adev,
 
 static const struct amdgpu_allowed_register_entry cik_allowed_read_registers[] = {
 	{mmGRBM_STATUS},
+	{mmGRBM_STATUS2},
+	{mmGRBM_STATUS_SE0},
+	{mmGRBM_STATUS_SE1},
+	{mmGRBM_STATUS_SE2},
+	{mmGRBM_STATUS_SE3},
+	{mmSRBM_STATUS},
+	{mmSRBM_STATUS2},
+	{mmSDMA0_STATUS_REG + SDMA0_REGISTER_OFFSET},
+	{mmSDMA0_STATUS_REG + SDMA1_REGISTER_OFFSET},
+	{mmCP_STAT},
+	{mmCP_STALLED_STAT1},
+	{mmCP_STALLED_STAT2},
+	{mmCP_STALLED_STAT3},
+	{mmCP_CPF_BUSY_STAT},
+	{mmCP_CPF_STALLED_STAT1},
+	{mmCP_CPF_STATUS},
+	{mmCP_CPC_BUSY_STAT},
+	{mmCP_CPC_STALLED_STAT1},
+	{mmCP_CPC_STATUS},
 	{mmGB_ADDR_CONFIG},
 	{mmMC_ARB_RAMCFG},
 	{mmGB_TILE_MODE0},
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 9922bce3f..bfedefc0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -175,6 +175,7 @@ static struct soc15_allowed_register_entry nv_allowed_read_registers[] = {
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPF_BUSY_STAT)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPF_STALLED_STAT1)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPF_STATUS)},
+	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPC_BUSY_STAT)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPC_STALLED_STAT1)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPC_STATUS)},
 	{ SOC15_REG_ENTRY(GC, 0, mmGB_ADDR_CONFIG)},
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 4d74453f3..519905cbe 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -975,6 +975,17 @@ static void si_smc_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
 
 static struct amdgpu_allowed_register_entry si_allowed_read_registers[] = {
 	{GRBM_STATUS},
+	{mmGRBM_STATUS2},
+	{mmGRBM_STATUS_SE0},
+	{mmGRBM_STATUS_SE1},
+	{mmSRBM_STATUS},
+	{mmSRBM_STATUS2},
+	{DMA_STATUS_REG + DMA0_REGISTER_OFFSET},
+	{DMA_STATUS_REG + DMA1_REGISTER_OFFSET},
+	{mmCP_STAT},
+	{mmCP_STALLED_STAT1},
+	{mmCP_STALLED_STAT2},
+	{mmCP_STALLED_STAT3},
 	{GB_ADDR_CONFIG},
 	{MC_ARB_RAMCFG},
 	{GB_TILE_MODE0},
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 04fbf05d7..9facb6ed2 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -291,6 +291,7 @@ static struct soc15_allowed_register_entry soc15_allowed_read_registers[] = {
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPF_BUSY_STAT)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPF_STALLED_STAT1)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPF_STATUS)},
+	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPC_BUSY_STAT)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPC_STALLED_STAT1)},
 	{ SOC15_REG_ENTRY(GC, 0, mmCP_CPC_STATUS)},
 	{ SOC15_REG_ENTRY(GC, 0, mmGB_ADDR_CONFIG)},
-- 
2.20.1


--MP_/cbhWo13DVkFuroGP8L2M1tF
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--MP_/cbhWo13DVkFuroGP8L2M1tF--
