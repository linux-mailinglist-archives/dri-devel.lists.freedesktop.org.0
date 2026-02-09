Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO57JfLUiWmCCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F263910EC32
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B49610E3CA;
	Mon,  9 Feb 2026 12:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uuh1ROzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237F10E3CC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 12:27:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D053043453;
 Mon,  9 Feb 2026 12:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B735CC16AAE;
 Mon,  9 Feb 2026 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770640053;
 bh=WgqiWVoHlPsT7FIc5ByMzq7REt3FLkvnK/cYU1bi2ZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Uuh1ROzGRhjFu/DtTNevjfcQTG7ztxPCh1nYFv6eQnfhlP23WhZM88SNX1u3IbLwR
 rs2ftY8dNWGjlIcJMoo+a0yqduWhIfC12Kym8JTyMPLlQBksUwnwOntVxqQCJklanx
 s+ftOJ+YxAsZVzQiZaqB9TXU0G4WxgRN25PnwoRo62F38nSotrvuSHUfxeHNZWBOUk
 N9hPFk86drUz54TihgqcYUjSUOAgk4pSlembHJzeOiw6/290k5CYFTzLGdYv9+sANR
 PFVoJOasZrF64wTJlMPpdonp6AUXVIDkzKMgWSBIM9dVGgafCF1Fe20EYwndHPZ5Vh
 P5pcAh8+O693A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Brahmajit Das <listout@listout.xyz>, Thierry Reding <treding@nvidia.com>,
 Sasha Levin <sashal@kernel.org>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] =?UTF-8?q?drm/tegra:=20hdmi:=20sor:=20F?=
 =?UTF-8?q?ix=20error:=20variable=20=E2=80=98j=E2=80=99=20set=20but=20not?=
 =?UTF-8?q?=20used?=
Date: Mon,  9 Feb 2026 07:26:49 -0500
Message-ID: <20260209122714.1037915-10-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209122714.1037915-1-sashal@kernel.org>
References: <20260209122714.1037915-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.9
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:listout@listout.xyz,m:treding@nvidia.com,m:sashal@kernel.org,m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:linux-tegra@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[listout.xyz,nvidia.com,kernel.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,listout.xyz:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F263910EC32
X-Rspamd-Action: no action

From: Brahmajit Das <listout@listout.xyz>

[ Upstream commit 1beee8d0c263b3e239c8d6616e4f8bb700bed658 ]

The variable j is set, however never used in or outside the loop, thus
resulting in dead code.
Building with GCC 16 results in a build error due to
-Werror=unused-but-set-variable= enabled by default.
This patch clean up the dead code and fixes the build error.

Example build log:
drivers/gpu/drm/tegra/sor.c:1867:19: error: variable ‘j’ set but not used [-Werror=unused-but-set-variable=]
 1867 |         size_t i, j;
      |                   ^

Signed-off-by: Brahmajit Das <listout@listout.xyz>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Link: https://lore.kernel.org/r/20250901212020.3757519-1-listout@listout.xyz
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of Commit: drm/tegra: hdmi: sor: Fix error: variable 'j' set
but not used

### 1. Commit Message Analysis

The commit message explicitly states this is a **build fix** for GCC 16,
which enables `-Werror=unused-but-set-variable=` by default. The commit
removes dead code (an unused variable `j`) to fix a compilation error.

Key indicators:
- "Fix error" - indicates a build failure
- "Building with GCC 16 results in a build error" - explicit mention of
  build breakage
- Provides concrete build log showing the error

### 2. Code Change Analysis

The changes are minimal and purely mechanical:

**In `drivers/gpu/drm/tegra/hdmi.c`:**
- Line 660: Changes `size_t i, j;` to `size_t i;`
- Line 693: Changes `for (i = 3, j = 0; i < size; i += 7, j += 8)` to
  `for (i = 3; i < size; i += 7)`

**In `drivers/gpu/drm/tegra/sor.c`:**
- Line 1866: Changes `size_t i, j;` to `size_t i;`
- Line 1899: Changes `for (i = 3, j = 0; i < size; i += 7, j += 8)` to
  `for (i = 3; i < size; i += 7)`

The variable `j` was:
1. Declared but never used anywhere
2. Incremented in the loop (`j += 8`) but the value was never read
3. Pure dead code that has no functional impact

### 3. Classification

This is a **build fix** - one of the explicit exception categories that
ARE allowed in stable:

> **BUILD FIXES:**
> - Fixes for compilation errors or warnings, Kconfig dependency fixes,
include file fixes
> - These are critical for users who need to build the kernel

### 4. Scope and Risk Assessment

- **Lines changed:** ~4 lines total (2 per file)
- **Files affected:** 2 files in the same subsystem (Tegra DRM driver)
- **Risk level:** Extremely low
- **Complexity:** None - purely removes unused code
- **Behavioral change:** None - the variable was never used

This is one of the lowest-risk changes possible:
- No logic changes
- No control flow changes
- No memory management changes
- Simply removing dead code that was never executed meaningfully

### 5. User Impact

**Who is affected:**
- Anyone trying to build the kernel with GCC 16
- Tegra (NVIDIA) platform users who need HDMI output

**Severity:**
- Without this fix, the kernel fails to compile with newer GCC versions
- This blocks users from building the kernel entirely

### 6. Stability Indicators

- Signed-off by the subsystem maintainer (Thierry Reding from NVIDIA)
- Link to the mailing list discussion provided
- The change is trivial and obviously correct

### 7. Dependency Check

- No dependencies on other commits
- The affected code (Tegra DRM HDMI/SOR drivers) exists in stable trees
- The fix is self-contained

### Conclusion

This commit meets all stable kernel criteria for a **build fix**:

1. **Obviously correct:** The variable `j` was declared, incremented,
   but never read - pure dead code
2. **Fixes a real bug:** Build failure with GCC 16
3. **Small and contained:** Only 4 lines changed across 2 related files
4. **No new features:** Removes unused code
5. **No risk of regression:** Cannot change behavior since the removed
   code was never used

Build fixes are explicitly allowed in stable trees because they are
critical for users who need to build the kernel. As GCC 16 becomes more
widely used (and is now the default compiler in some distributions),
this fix will become essential for anyone building the kernel.

The fix is trivial, obviously correct, and fixes a real build failure.
It has zero risk of causing runtime regressions since it only removes
dead code.

**YES**

 drivers/gpu/drm/tegra/hdmi.c | 4 ++--
 drivers/gpu/drm/tegra/sor.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 8cd2969e7d4bf..c4820f5e76581 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -658,7 +658,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hdmi *hdmi, const void *data,
 {
 	const u8 *ptr = data;
 	unsigned long offset;
-	size_t i, j;
+	size_t i;
 	u32 value;
 
 	switch (ptr[0]) {
@@ -691,7 +691,7 @@ static void tegra_hdmi_write_infopack(struct tegra_hdmi *hdmi, const void *data,
 	 * - subpack_low: bytes 0 - 3
 	 * - subpack_high: bytes 4 - 6 (with byte 7 padded to 0x00)
 	 */
-	for (i = 3, j = 0; i < size; i += 7, j += 8) {
+	for (i = 3; i < size; i += 7) {
 		size_t rem = size - i, num = min_t(size_t, rem, 4);
 
 		value = tegra_hdmi_subpack(&ptr[i], num);
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 21f3dfdcc5c95..bc7dd562cf6b6 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1864,7 +1864,7 @@ static void tegra_sor_hdmi_write_infopack(struct tegra_sor *sor,
 {
 	const u8 *ptr = data;
 	unsigned long offset;
-	size_t i, j;
+	size_t i;
 	u32 value;
 
 	switch (ptr[0]) {
@@ -1897,7 +1897,7 @@ static void tegra_sor_hdmi_write_infopack(struct tegra_sor *sor,
 	 * - subpack_low: bytes 0 - 3
 	 * - subpack_high: bytes 4 - 6 (with byte 7 padded to 0x00)
 	 */
-	for (i = 3, j = 0; i < size; i += 7, j += 8) {
+	for (i = 3; i < size; i += 7) {
 		size_t rem = size - i, num = min_t(size_t, rem, 4);
 
 		value = tegra_sor_hdmi_subpack(&ptr[i], num);
-- 
2.51.0

