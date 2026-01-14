Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F4D21353
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 21:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DA610E36E;
	Wed, 14 Jan 2026 20:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="etJouZgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35AA10E36E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:43:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2081D6001D;
 Wed, 14 Jan 2026 20:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BBDC4CEF7;
 Wed, 14 Jan 2026 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768423416;
 bh=qfichP7xshYGFSCR4CwpNABFHfqMVK0zW00HFV+0Ppc=;
 h=From:Date:Subject:To:Cc:From;
 b=etJouZgfLTBrE3zutq1WvgULMAXLMPLYRA1OB+IkohMIN+G/kuGNOZLMDFORxfiHA
 qCr2G2zT8hu3QOp291w6wr+JwiE13yamT81agkXb1n1Psu5sqZHuB/84IsC4ZcVIYb
 WYUKmZO0rio1CHfSSs69jl+BmzoBtBowsRNS5a5Om9Bt54j5+wEWV0oruv0XdCTV0H
 YiM7WAqLqeeXs+XqDFfydl8+Rp57F0khLMVYJrAmV2qaXx1GCjYXotoIRoNsXnJo6g
 YIcE4g9CYEIg6AErCkaqySM7i7Ip7RpTR0FR1Ad2YiUhqi6RQ2H/xosLiOfivHbMky
 1v4i0DEL3cMxQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 14 Jan 2026 13:43:31 -0700
Subject: [PATCH] drm/panel: ilitek-ili9882t: Remove duplicate initializers
 in tianma_il79900a_dsc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-panel-ilitek-ili9882t-fix-override-init-v1-1-1d69a2b096df@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4Xs2U26lQj4K8YDwqCrpJBtJSaEf
 7foafKSmTcrRZgi0rlYybBo1ClkkENB3aMNd7D2mck7f3IiJc9twMg6asJrj6aufeJBPzwtMNM
 +L4Im9gJppDwOVeUo22ZDLv2eLtc/x/ftiS7tetq2L8ZhFAiLAAAA
X-Change-ID: 20260114-panel-ilitek-ili9882t-fix-override-init-21e19143f770
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4540; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qfichP7xshYGFSCR4CwpNABFHfqMVK0zW00HFV+0Ppc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnp/79pL5Mv6jR+3VjU5eS10X0q68sN/FzCwn07l7p6p
 37+Pm9vRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIBz8jQ5Me8yLnjy4Mn2Iq
 p92dIuZrPefAk4yqufafJy89Ksf2rZ+R4cc3/9MpU6p3uOe+r2e1ZWVSaHpgyl6Rm8mq5S1y9sB
 OTgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:95:16: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
     95 |         .vbr_enable = 0,
        |                       ^
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:90:16: note: previous initialization is here
     90 |         .vbr_enable = false,
        |                       ^~~~~
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:97:19: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
     97 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
        |                          ^~~~~~~~~~~~~~~~~~~~~~~
  include/drm/display/drm_dsc.h:22:38: note: expanded from macro 'DSC_RC_MODEL_SIZE_CONST'
     22 | #define DSC_RC_MODEL_SIZE_CONST             8192
        |                                             ^~~~
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:91:19: note: previous initialization is here
     91 |         .rc_model_size = DSC_RC_MODEL_SIZE_CONST,
        |                          ^~~~~~~~~~~~~~~~~~~~~~~
  include/drm/display/drm_dsc.h:22:38: note: expanded from macro 'DSC_RC_MODEL_SIZE_CONST'
     22 | #define DSC_RC_MODEL_SIZE_CONST             8192
        |                                             ^~~~
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:132:25: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
    132 |         .initial_scale_value = 32,
        |                                ^~
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:126:25: note: previous initialization is here
    126 |         .initial_scale_value = 32,
        |                                ^~
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:133:20: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
    133 |         .nfl_bpg_offset = 3511,
        |                           ^~~~
  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c:108:20: note: previous initialization is here
    108 |         .nfl_bpg_offset = 1402,
        |                           ^~~~

GCC would warn about this in the same manner but its version,
-Woverride-init, is disabled for a normal kernel build in
scripts/Makefile.warn. For clang, -Wextra in drivers/gpu/drm/Makefile
turns it back but GCC respects turning it off earlier in the command
line.

Of all the duplicate fields in the initializer, only nfl_bpg_offset is a
different value. Clear up the duplicate initializers, keeping the
'false' value for .vbr_enable, as it is bool, and the second value for
.nfl_bpg_offset, assuming it is the correct one since it was the one
tested in the original change.

Fixes: 65ce1f5834e9 ("drm/panel: ilitek-ili9882t: Switch Tianma TL121BVMS07 to DSC 120Hz mode")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 370424ddfc80..8b2bfb7d3638 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -88,11 +88,9 @@ static const struct drm_dsc_config tianma_il79900a_dsc = {
 	.native_422 = false,
 	.simple_422 = false,
 	.vbr_enable = false,
-	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
 	.pic_width = 1600,
 	.pic_height = 2560,
 	.convert_rgb = 0,
-	.vbr_enable = 0,
 	.rc_buf_thresh = {14, 28, 42, 56, 70, 84, 98, 105, 112, 119, 121, 123, 125, 126},
 	.rc_model_size = DSC_RC_MODEL_SIZE_CONST,
 	.rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST,
@@ -105,7 +103,6 @@ static const struct drm_dsc_config tianma_il79900a_dsc = {
 	.initial_offset = 6144,
 	.rc_quant_incr_limit0 = 11,
 	.rc_quant_incr_limit1 = 11,
-	.nfl_bpg_offset = 1402,
 	.rc_range_params = {
 		{ 0,  4, DSC_BPG_OFFSET(2)},
 		{ 0,  4, DSC_BPG_OFFSET(0)},
@@ -123,7 +120,6 @@ static const struct drm_dsc_config tianma_il79900a_dsc = {
 		{ 9, 12, DSC_BPG_OFFSET(-12)},
 		{12, 13, DSC_BPG_OFFSET(-12)},
 	},
-	.initial_scale_value = 32,
 	.slice_chunk_size = 800,
 	.initial_dec_delay = 657,
 	.final_offset = 4320,

---
base-commit: b36178488d479e9a53bbef2b01280378b5586e60
change-id: 20260114-panel-ilitek-ili9882t-fix-override-init-21e19143f770

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

