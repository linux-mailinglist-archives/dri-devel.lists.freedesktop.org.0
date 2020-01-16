Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C213DB35
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 14:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345D6ECF6;
	Thu, 16 Jan 2020 13:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB586ECF6;
 Thu, 16 Jan 2020 13:12:46 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id g6so8320816plp.6;
 Thu, 16 Jan 2020 05:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/hYfulYDMmDqasXMfWqXBB41AaKXHjpBig2NTFrRRkY=;
 b=YPuhRjkcHaF3Cj2pkoOb0SaCxIP5pDKV3HuSNcQvzc/z12CKjS2MaN4NrfZlIDIeRp
 /hFeMGOo5Ctjjx8bOQfY4XVAFSaNPCWIznM5SZudf1NvCnkOqtzAd7fb5hezf8TJ8/HW
 tqdlwOJGJ/pAtUC6UixRbrnXhk22BzieFf+1c1mhAIQtO+pgvHavMdQIDU7WRafSRXbb
 ORAGmlUubDd3NbuJwB6dyKJQeQaIj9d7j5Z3A//Z1ohCk2lc8xzVrX8WSRfasX/liaZn
 Eznf5S3ozuaphaYEdFZOdn+PW9Sh0BU6q4Gx9vDP4Ak/IduCYKYTJEUb9BrRglHEHOrh
 WGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/hYfulYDMmDqasXMfWqXBB41AaKXHjpBig2NTFrRRkY=;
 b=XNNQRg8aP6tgmHteIZCWot0Mr0zosCpGGHctces3PuwOFt2Nvw7gFkTE/WFgBwNBWd
 U2ZSW9RI8Gn2WU7Vw9vR35Zh8K9de9PMfmwDT0vh+PltBUpk98QrOb5apxUnKUy6YqDJ
 dlSiGDufyK0/seR8ZKgRJf86gALxmft86i3WCzsk7aXCrD5HogXELNErjbAguHHzAhx3
 9cm4zPQU29mV4LkMN2FA6B3aYn9aYRwmZzmadk3q8MV1lkJezvpGSVv+a7XekQkT/rXB
 WRVIkh6qeyarLdjWhVO7/VtJMaH/QHonBT9xcKA0m21rVpYgywNN80kbjlSHRN8KGV/r
 czgg==
X-Gm-Message-State: APjAAAXrch0YUqOVvecO5Y2//eHVc0YAIl5iGSbSZ/VDGiuWhgloP1FP
 LS+n2j99yqShgT8K+9eV1q8g4JvC
X-Google-Smtp-Source: APXvYqyCA6hbN8ebFnzlbZ/4NSn85PEthyuahhIlSMt7vNQiLaEBdzTFccgHOns1UXPmab09ZMfnbA==
X-Received: by 2002:a17:902:ba91:: with SMTP id
 k17mr1540600pls.228.1579180366426; 
 Thu, 16 Jan 2020 05:12:46 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id v9sm25945877pfi.37.2020.01.16.05.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:12:45 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/lima: update register info
Date: Thu, 16 Jan 2020 21:11:53 +0800
Message-Id: <20200116131157.13346-2-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116131157.13346-1-yuq825@gmail.com>
References: <20200116131157.13346-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From Mali r10p0 kernel driver source code.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_regs.h b/drivers/gpu/drm/lima/lima_regs.h
index ace8ecefbe90..0124c90e0153 100644
--- a/drivers/gpu/drm/lima/lima_regs.h
+++ b/drivers/gpu/drm/lima/lima_regs.h
@@ -239,6 +239,7 @@
 #define   LIMA_MMU_STATUS_REPLAY_BUFFER_EMPTY BIT(4)
 #define   LIMA_MMU_STATUS_PAGE_FAULT_IS_WRITE BIT(5)
 #define   LIMA_MMU_STATUS_BUS_ID(x)           ((x >> 6) & 0x1F)
+#define   LIMA_MMU_STATUS_STALL_NOT_ACTIVE    BIT(31)
 #define LIMA_MMU_COMMAND                      0x0008
 #define   LIMA_MMU_COMMAND_ENABLE_PAGING      0x00
 #define   LIMA_MMU_COMMAND_DISABLE_PAGING     0x01
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
