Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60383E315
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA21E10FE23;
	Fri, 26 Jan 2024 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F6110FE24
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:09:17 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5955a4a9b23so467236eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706299695; x=1706904495;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLbf7wvlWiR8kI0tgAR7IXIidHbGnwaCBpWzqh5nGoA=;
 b=L+Xf7EImQig8x61PJPoXrymM/16cmxaSBmkPvjA+Nw18FXhKYZ1d9ZSSCVLvmzDPAD
 nRPzE1puAZCEokfVK+0AbL6aGXZU8LD0mYRBKgOG/WSTMQhxdGqi+7/0HyYk1Qo5ZkFQ
 NueKmekJP8RxWDfqysF+MeKyA15BaRV+8eFV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706299695; x=1706904495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLbf7wvlWiR8kI0tgAR7IXIidHbGnwaCBpWzqh5nGoA=;
 b=Cx48VZhnjENess+NmK50ajOlo5hs45JsMOOVBXNToXMlJ5Goe3BRDSz6ZIBmt9I9Ms
 E+L3oTj+89sA06yTrXfTL+PLbx6Fj/HbUxsjYlXxJWn36zHI5RkPOQ67HD36shFB16sV
 O1po2rwL3U36gDJfpEVe9HS5spf5GQO03mSHuGZ7P+34M7DES8UyDPKAtbCGyWyDbxQZ
 M7HPg+U1dp4cb20s4yjFGV2I8oLVeQvrbWpmin5yQQ3QXi/zgi3QOKAYHnGRYSllKbjw
 3DqZnXIiq/9FuOEtMmhI7H1e0RI3iQZ2YRwOkzNhCuTLj8HphaVPQLbM+A09Lp2qz6bt
 f4RA==
X-Gm-Message-State: AOJu0YzpMxfYepsuTXrt3NqbBA7dpBduc6CXQag8dw2EJc08gCa2Yin/
 nmuZK2EfFUE31+pFaT8Vkz/ixZVwS8z3W0L7S7QQOf2UgKtx0uF+N7jiFKzNeafjMiSO44hX0Ar
 qZJ1CZBowWpDhR/kvF2IYxzflMP+v7STMsPM5LRH30dFSaTV5jP3OB7xvIonlrnYoyVuDr1+X4r
 wRc4XC4fzjmh9iAQ4HuKZ2tI1GX+/A86nyHgPLroP1kh3ZFCauTw==
X-Google-Smtp-Source: AGHT+IGK+CivC1ehuvBeWHXLKmnVAHmBGqiFrwB+ETNP4299z/2RV5ic7XGKQT1v8/bZ+ILn0E/iFQ==
X-Received: by 2002:a4a:a786:0:b0:59a:100b:da0c with SMTP id
 l6-20020a4aa786000000b0059a100bda0cmr196030oom.19.1706299695498; 
 Fri, 26 Jan 2024 12:08:15 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a4abd87000000b00599f5c2c052sm358161oop.8.2024.01.26.12.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 12:08:15 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/vmwgfx: Add SPDX header to vmwgfx_drm.h
Date: Fri, 26 Jan 2024 15:08:02 -0500
Message-Id: <20240126200804.732454-4-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126200804.732454-1-zack.rusin@broadcom.com>
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Update vmwgfx_drm.h with SPDX-License-Identifier:
(GPL-2.0 WITH Linux-syscall-note) OR MIT

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/uapi/drm/vmwgfx_drm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 26d96fecb902..7d786a0cc835 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR MIT */
 /**************************************************************************
  *
  * Copyright © 2009-2023 VMware, Inc., Palo Alto, CA., USA
-- 
2.40.1

