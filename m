Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 266734C14C4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38B610F1C7;
	Wed, 23 Feb 2022 13:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86F910F1BF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 09:02:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j7so29827270lfu.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 01:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=karuga-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYUz8Ivg2sbFi9UjIBOKZiugtmcYnDRDXJxBmoWlVVg=;
 b=sHXbPaiDyQ3l/e6qLDfuZeJXm2/PKiAgNVSSJYjNmC5GMFt8QDF4Y8dTpVE8OIcpTo
 loJTHj58geHyrTR/YmU5b4+wn/ojLgliBle3iateISLnKnfELvKp808M3oo7z7mNapA7
 bpYaSzBZee14Kw/BceIV2sB74QYFDmFggaoaqazsHY8i+Rr4JvzyZro1qpa1iWa426pL
 NfqEeNFd9cn02kYPz+QMj8GE/Hexn27XZV/QhvZMdMQ6NBwNFQrc4tWNAw4uemQfUAbq
 Qad0ca+nDUEu/hAUwrkkXSGPzVCYtc9uWxjil+F25yGhXuyyKkXJHkIahlw7hAh5YJwp
 fdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYUz8Ivg2sbFi9UjIBOKZiugtmcYnDRDXJxBmoWlVVg=;
 b=050VP6gDWPAs5E4cNM4ZVkSoyTGjtBncVPVHjvAlTbdWhHE0vprRMGV/gU+Dv4HckM
 ReN2kUOHtw58PXPCuqB7hyfH2LsnDYA2IUO7AMYPo/DsyYapL9NyInEanzirHj0UfnGK
 lzCNhsLyqO7kGzkZiJ2kDuSxh5fM8ukobrHF0IJvLn/+QEpnSzBLxRUGgMR1fUCwGmdn
 RnWAAgv+Gj3dLr9YsZbEL1mzjeXDvChMGdqCtTxpN9wuOoUHHKWwoJB4CJL5aO7ehEfJ
 1dSDBxlLSpRU8OJf0dmg6t0UHknjb8K9rAjsuaMdKvWqxgXvcXK3+a7cazFri9Oyyksp
 gJ3Q==
X-Gm-Message-State: AOAM531ZaTcWJchVlrcMTPoTSID+XhyX4FChwRY3bf0XQCPwpUMpS9KO
 X9Z448qzUP90QKfxXOhrRX5h/Q==
X-Google-Smtp-Source: ABdhPJzRxqYdGtINoTjRLuYEfhz/riWHFWKne4XGoI6AKqqyyI0KzUhiRfsSiUXDz3QTbCSq5IdOYQ==
X-Received: by 2002:a19:a404:0:b0:443:2ef6:1ae7 with SMTP id
 q4-20020a19a404000000b004432ef61ae7mr20699528lfc.554.1645606968882; 
 Wed, 23 Feb 2022 01:02:48 -0800 (PST)
Received: from virtualbox.. ([197.211.27.230])
 by smtp.gmail.com with ESMTPSA id k12sm642562lfg.108.2022.02.23.01.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:02:48 -0800 (PST)
From: Wambui Karuga <wambui@karuga.org>
To: zackr@vmware.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: make vmw_pt_sys_placement static
Date: Wed, 23 Feb 2022 12:02:44 +0300
Message-Id: <20220223090244.576093-1-wambui@karuga.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 13:51:45 +0000
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
Cc: linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts the variable vmw_pt_sys_placement to static to
fix the following Sparse warning:
warning: symbol 'vmw_pt_sys_placement' was not declared. Should it be static?

Signed-off-by: Wambui Karuga <wambui@karuga.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index b84ecc6d6611..21057ff0d340 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -120,7 +120,7 @@ struct ttm_placement vmw_sys_placement = {
 	.busy_placement = &sys_placement_flags
 };
 
-struct ttm_placement vmw_pt_sys_placement = {
+static struct ttm_placement vmw_pt_sys_placement = {
 	.num_placement = 1,
 	.placement = &vmw_sys_placement_flags,
 	.num_busy_placement = 1,
-- 
2.32.0

