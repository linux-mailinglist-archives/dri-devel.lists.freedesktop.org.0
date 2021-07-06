Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E313BCE2C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFAD6E415;
	Tue,  6 Jul 2021 11:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F1C6E40A;
 Tue,  6 Jul 2021 11:23:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E06DD61E2E;
 Tue,  6 Jul 2021 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570613;
 bh=7QlEAfIR48X5g9ahb8H+jZ/laF635VDdUwllnzq05wo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XNJ8cIYmX7XyAuZZ7swcDQlHd4Ma3soSqvwujPXuoGwFg8gi+20u6ms4JYdJeLwu0
 TzG4bSLFhUFdnDmPeOikcI/vRT0J6cOdkDjoSBG+pS2qAWmsWxhMAjJH5mXo960Pui
 ZlVw75Ebu2uCLu/C1WSL4ZG/57Fbyt9GAxlKrDb4USUBYmrL6c4s7cE9mOVOcj8gXx
 FMehUQCIg/WhsYgFptbXOtL9Vq/qIamzVvqflA7WSj4Bm0oEGSGCG9/BNyQhQwt36t
 TMvfYLgwVFAQASjNJcwLsRCwl57bG5XDJbG809c3T/deSUqDiTmd1oUp8+pUgheYwF
 LncnYUtWju9EQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 070/137] drm/amd/display: Set
 DISPCLK_MAX_ERRDET_CYCLES to 7
Date: Tue,  6 Jul 2021 07:20:56 -0400
Message-Id: <20210706112203.2062605-70-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Stylon Wang <stylon.wang@amd.com>, Sasha Levin <sashal@kernel.org>,
 Wesley Chalmers <Wesley.Chalmers@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wesley Chalmers <Wesley.Chalmers@amd.com>

[ Upstream commit 3577e1678772ce3ede92af3a75b44a4b76f9b4ad ]

[WHY]
DISPCLK_MAX_ERRDET_CYCLES must be 7 to prevent connection loss when
changing DENTIST_DISPCLK_WDIVIDER from 126 to 127 and back.

Signed-off-by: Wesley Chalmers <Wesley.Chalmers@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index f1e9b3b06b92..9d3ccdd35582 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -243,7 +243,7 @@ void dcn20_dccg_init(struct dce_hwseq *hws)
 	REG_WRITE(MILLISECOND_TIME_BASE_DIV, 0x1186a0);
 
 	/* This value is dependent on the hardware pipeline delay so set once per SOC */
-	REG_WRITE(DISPCLK_FREQ_CHANGE_CNTL, 0x801003c);
+	REG_WRITE(DISPCLK_FREQ_CHANGE_CNTL, 0xe01003c);
 }
 
 void dcn20_disable_vga(
-- 
2.30.2

