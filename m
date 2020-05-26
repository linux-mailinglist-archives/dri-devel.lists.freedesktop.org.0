Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696401E1C32
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A748B89E35;
	Tue, 26 May 2020 07:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0610489C05
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:23:03 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g20so8833153qvb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 20:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWAnzxFlBG6fffzFUdxDOCWUGLZUTqYmdG/nfLxRIYw=;
 b=GTWzOqvEA7APlKZrtWytxI3UiIPa9Y6MaUsjnygPQbcUyaVx4c8XiCqiNr7Cff/a9G
 KgjjDLdUPGOfF7m9HbgzYwegRZ28LwBDg8+/wHxjDDe2zYW/RU5qqo50EXMqB5rfxOB7
 Fhmi6xUUmFAA6ClbRVu/6DWDq/MJWeN/LcpMRH89Vt1qVWcMNTtNRo+rYJE80hL6au+5
 BvNQuPooPe8liULVPK/iZkNHC++tBaF4M0at4yOAAPYbVW86K4Dqh+ITCYl+ipj7ufOF
 Q/ayVJCWCKD9JqufTNPlTcwRadXX/x/k4NoHaJPkyPyCto0vOwXgTGv+1Eqd1ACMJZsx
 idtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AWAnzxFlBG6fffzFUdxDOCWUGLZUTqYmdG/nfLxRIYw=;
 b=sRQCQ6qpNjvfNNglsIY9XDEMi12YynmTIRuobzBWmdiWaeormP2fvmoreRwQfiargh
 of0M5sTy0Z4QXtKQ9GNEpReMjScvUMmQo9quUtD3yaVkUbyBbfcx8Sf7iZaGAkJjc7Kt
 gQGQsLnaYJUDEKih9jC9rw4FA9epdOvPRMcEj16ddkhhDx7lb5a4Jek5qAZYjVPDwZwe
 j/a7wO/1gjLydYg0LBS0enQYHW5H6jTCgoZFUHXMePgx5LW2XvPviE25I3sS65kalbX2
 DEqT0IrK+nP19UqwLETUxlOntNnL3ewKMas1Ye3fwtWBLN0O66woW0ZAPyQfPAz6nmi7
 1dRA==
X-Gm-Message-State: AOAM531Cu+Pkl8tO8DweGfb2obretW7mqak0on4D6leSf7LKD1S2apeV
 K7wVllajOGK9xpparoq01+TcWA==
X-Google-Smtp-Source: ABdhPJwQ99YZM55+rNFn66oLsnyuqhfzXbeGT/sUdIanmJgqga8K7kurbsvipAlWTxcAKJBZ3WarOA==
X-Received: by 2002:ad4:5684:: with SMTP id bc4mr18783129qvb.85.1590463382263; 
 Mon, 25 May 2020 20:23:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:23:01 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 5/8] drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
Date: Mon, 25 May 2020 23:22:12 -0400
Message-Id: <20200526032235.21930-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes flushing of INTF_2 and INTF_3 on SM8150 and SM8250 hardware.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 831e5f7a9b7f..996666afdd66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -245,30 +245,14 @@ static int dpu_hw_ctl_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 static int dpu_hw_ctl_get_bitmask_intf_v1(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-	case INTF_1:
-		*flushbits |= BIT(31);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(31);
 	return 0;
 }
 
 static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 		u32 *flushbits, enum dpu_intf intf)
 {
-	switch (intf) {
-	case INTF_0:
-		*flushbits |= BIT(0);
-		break;
-	case INTF_1:
-		*flushbits |= BIT(1);
-		break;
-	default:
-		return 0;
-	}
+	*flushbits |= BIT(intf - INTF_0);
 	return 0;
 }
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
