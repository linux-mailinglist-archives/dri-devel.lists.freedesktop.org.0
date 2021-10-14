Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D117942D6E4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 12:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DF36EC60;
	Thu, 14 Oct 2021 10:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615356EC34;
 Thu, 14 Oct 2021 08:51:58 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id f21so3698955plb.3;
 Thu, 14 Oct 2021 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9VG9Tb+ozGbmwq3ZiIbFIRjiDvL9LwB7A4vhXuIIMG4=;
 b=UqpjmWDNsn4r2X4bBdAsIxTO6X6CthCzxhJ7UJ1/tTH9EiiU4275X6M9+62DNjTPrX
 mjrtPNIrNMPWPRfHHep0hqCqPRxO3dMrTk4xLC9O89BPO1Zq9x8vHhqgqBFod8kh/7yn
 Gs5MNq3XAgrIpBFRCcAFRrQ5hyBbGXSVnb8xC4PbDq1CG+6XDr2BO5rCbI4XElNxv4yB
 yvWBEPI50MGO/oXbQyErYRmzf+++vKNYN1V0ifZQciwokbuAst9/3L3lcDOpGrSPNdHu
 MCVLhhsAPJNKxVuO4fIE00tG7EeeC59qNCLvlqza4exDM2jtTGxOqQUPXmR30EKz2En3
 Ny3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VG9Tb+ozGbmwq3ZiIbFIRjiDvL9LwB7A4vhXuIIMG4=;
 b=NI7cGXPRvSNfPvgyB7MKx7SRP8Aw0COyNysmcG3WhE5oq8bPFJc+mBalHgdDli0EMM
 lumeANOuanK30rk7gGGADZK4r/7cCf0veQTHl0VAlK3u3o+v5/VfxFJWCDwg5WQ/tB6D
 /YKq+QWX+kVmlNjD+qcvNDKGASrlxs6+QYbtbeIlrR9hxV5rKXqEOQtVzTyrlBkAwob5
 I4XshshoyVcRu58cCWyJg+NV3owNkpw/M/i0CvG5XPKtUybNsSWQYzc2KkcuzmyXZpE3
 Y6zIKEf5oHnRAlAg79xaRN44Kp7JCvH7OMj8ti5oefzVChEs8gz4A8jLUmZuugKVxAMp
 9ivg==
X-Gm-Message-State: AOAM533zCelmlxxBiKuhzRfkwBBWxb/Z8lXRJNY9uMWTTqbeSD7gYvrZ
 OGx/eBcfd38d5kc5fJpEH/6lpWd/RN9Y5E80Ips=
X-Google-Smtp-Source: ABdhPJw7KNcoB8+LMt8KO0oNXB9C01+w0kV4D1uZug7DlC4dqgo+gfRNib+4CHdRwKkcoz6rP16xag==
X-Received: by 2002:a17:90b:2349:: with SMTP id
 ms9mr4861383pjb.45.1634201518051; 
 Thu, 14 Oct 2021 01:51:58 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.154])
 by smtp.gmail.com with ESMTPSA id i2sm7968082pjt.19.2021.10.14.01.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:51:57 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Fix missing include files in msm_gem_shrinker.c
Date: Thu, 14 Oct 2021 16:51:34 +0800
Message-Id: <f270502946fa411cc85c18fc252e5ddbeaf9c2f5.1634200323.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634200323.git.siyanteng@loongson.cn>
References: <cover.1634200323.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:24:16 +0000
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

Include linux/vmalloc.h to fix below errors:
error: implicit declaration of function 'register_vmap_purge_notifier'
error: implicit declaration of function 'unregister_vmap_purge_notifier'

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 0f1b29ee04a9..4a1420b05e97 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -4,6 +4,8 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/vmalloc.h>
+
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
-- 
2.27.0

