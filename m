Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54108442761
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 08:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619856FA9F;
	Tue,  2 Nov 2021 07:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFF76FA9F;
 Tue,  2 Nov 2021 07:01:40 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id s24so14579372plp.0;
 Tue, 02 Nov 2021 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQoPRk8ivYGfoPLY0uKKJcZTeIJDjKgCSjb0TdRpEts=;
 b=a4PkgHNAFD9tiKky1CA8bCU1tMMcEmSlOfw1LLmJ9Y+H7Y4klCH+G7ttV9k3ZzVWJS
 bwoigSRjS5hUNDnzflSNJDflJVufDavIQsH8P9sf+2RWlFZbqrsllWXKfuSFQzc0pc1O
 WvwJ9KDnPRGd+54acxO3tB6H3hfLJiZenHy21sAwc+FJMTGTlSEoBRrgkoxPpEKuGAsp
 +SHbwEWleQ2R2fVOo8+jSoBKzTLyKKNFiRqH+/kQ/bIDf284bEWZEm5R88zcGncsGvl3
 Z5xFpwZIhTBeulSnyZfQrFAaQ4YhiJduwUcMvWr+fnGob8+PGB56jYgxl26XNXXAcMx9
 N81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQoPRk8ivYGfoPLY0uKKJcZTeIJDjKgCSjb0TdRpEts=;
 b=SXg/jFOnjKzEAbw/XKD4EW1VKLvgfjDcm/ib/Rg3R6Z9asGBO/upbllxqQAJ3JJpD2
 fQmdgA7sNdznd6x8NrWRWHbe2lw4un80r+TP7tpA+nFDUM0u6EdQKeqUlMGejugA17d8
 O0P8uL4B3wK78LZomYzxP1y3zZLPpx2lI/3lqCdL3cHA+R1xjMxtREKfK1YVcVIo+bri
 yyF0rtnvEzIoy1gEC/ZzGA8GnnHlCKp7cnJm45laa7BG0KzE67yyD79JylwJgzD3yHLx
 KPUWGXMiYey1glypK/KlLYdpqE8zo42ubo4mcwl4/fiES+6NVYrC4xwBok85/pehemQ4
 Vj1w==
X-Gm-Message-State: AOAM5314dBtnDxw69954103qEM7EOKZXT1uoWZK0ItnSmBbfzD+EATJO
 OwlCf9XLfxIQGq/w3ocdaPk=
X-Google-Smtp-Source: ABdhPJwvd0T2hHcaD6+31RvPGMRiHpfwws6wPxEkTzrkBiAS+wxzFXvQR1utMLd7HTCdyJE0DGypBg==
X-Received: by 2002:a17:90a:4dcc:: with SMTP id
 r12mr4464805pjl.13.1635836500426; 
 Tue, 02 Nov 2021 00:01:40 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id e9sm13458381pfv.132.2021.11.02.00.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:01:40 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: remove unnecessary conditional operators
Date: Tue,  2 Nov 2021 07:01:25 +0000
Message-Id: <20211102070125.4445-1-ye.guojin@zte.com.cn>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, meenakshikumar.somasundaram@amd.com,
 lee.jones@linaro.org, shenshih@amd.com, jiapeng.chong@linux.alibaba.com,
 Zeal Robot <zealci@zte.com.cn>, Rodrigo.Siqueira@amd.com, syed.hassan@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, aurabindo.pillai@amd.com,
 george.shen@amd.com, Anson.Jacob@amd.com, nikola.cornij@amd.com,
 ye.guojin@zte.com.cn, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Roman.Li@amd.com, christian.koenig@amd.com, Wayne.Lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ye Guojin <ye.guojin@zte.com.cn>

Since the variables named is_end_of_payload and hpd_status are already
bool type, the ?: conditional operator is unnecessary any more.

Clean them up here.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 43e983e42c0f..752a79724ce1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -784,8 +784,7 @@ static void dm_dmub_outbox1_low_irq(void *interrupt_params)
 					plink = adev->dm.dc->links[notify.link_index];
 					if (plink) {
 						plink->hpd_status =
-							notify.hpd_status ==
-							DP_HPD_PLUG ? true : false;
+							notify.hpd_status == DP_HPD_PLUG;
 					}
 				}
 				queue_work(adev->dm.delayed_hpd_wq, &dmub_hpd_wrk->handle_hpd_work);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
index 60539b1f2a80..24dc662ec3e4 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
@@ -626,7 +626,7 @@ bool dal_ddc_submit_aux_command(struct ddc_service *ddc,
 	do {
 		struct aux_payload current_payload;
 		bool is_end_of_payload = (retrieved + DEFAULT_AUX_MAX_DATA_SIZE) >=
-				payload->length ? true : false;
+				payload->length;
 		uint32_t payload_length = is_end_of_payload ?
 				payload->length - retrieved : DEFAULT_AUX_MAX_DATA_SIZE;
 
-- 
2.25.1

