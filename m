Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CE297501
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554A6F8ED;
	Fri, 23 Oct 2020 16:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15DA6F8F9;
 Fri, 23 Oct 2020 16:50:36 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t14so1706906pgg.1;
 Fri, 23 Oct 2020 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KFzgRAweXzmn2MO9Ofz0hLeT7MUlIlm2XMWMHmibkzc=;
 b=jjTEZX/wTYdDD5lHNJL27W2xxKiFRbgTn9CZuGMxqBNE7aO6w+V5K1v5f/d5sc171m
 sZrosNh78sEixsH6tiGfDKMAddRKkWo2GvMDPqQVQd0G8yW56h+s/ilB0LdoDQErSi6I
 rwlGJIyIBK6hHlWpVj1wDpchhLUgP3IUBFI8ZGmQEqj+uLAdi02T7JPuO0rfuMQADbVi
 uhvQAcSztekRlvJ9tgRRtEsURgoONqDBknwcqD1cVa+UjPgCZNUgwb8YH+lhJ24pVDI3
 9gam584zcrWq/gxASWZrj97X0xvOH7n080Pf+yvfqG7zQoXC65NG4Ymf1jPH/aojr9iI
 2atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KFzgRAweXzmn2MO9Ofz0hLeT7MUlIlm2XMWMHmibkzc=;
 b=Y24DSjBHFt463aFnryhhGI/dpw65JJXTh45syXei34FNdXu93S47g4rP+Gh/k0oocn
 Q5MawKkkBSP/s+OoT3n5kvd8ZwWIUdfLiM7dH2zzx8y2yLtA+ltA2nuO62zQTZzbjtm4
 bPWkepB8vQ+a128bYUg966T6ofgCL5PVD3FtgjTSo/sfi8HJwCRkrqvxuVQR6h3ERYD3
 eDlKvtBUXj9+YCfBdbhC/i+SMf5L8hCXaea/l/239gLaM9clPhTTMVcwTQAP25vbYzil
 4adXWcM7lC0f3NMR+nawNYhL/5GJiMh9q2CKwJ2W+ko2DnTRxZVb85Ll3GjfGbq+TO6g
 O7Wg==
X-Gm-Message-State: AOAM533YOf4RFyFjKn0M+M7ukTU+iVBT+jY2P9xLe8FhLCyMaJlvj6I/
 zUlYp51/3DLSJAhPF83dwUzjxslVXI5rpw==
X-Google-Smtp-Source: ABdhPJzFi3q0p9NxlvgnrXQCVcgYMewNZQIFbAEtQamzsp6p/YysaoGKemc8fdiLDn/MO8AmDlMZSA==
X-Received: by 2002:a17:90a:c48:: with SMTP id
 u8mr3502279pje.121.1603471835689; 
 Fri, 23 Oct 2020 09:50:35 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 z3sm2372338pgl.73.2020.10.23.09.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:50:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 11/23] drm/msm: Drop chatty trace
Date: Fri, 23 Oct 2020 09:51:12 -0700
Message-Id: <20201023165136.561680-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is somewhat redundant with the gpu tracepoints, and anyways not too
useful to justify spamming the log when debug traces are enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 015f6b884e2e..ed6645aa0ae5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -545,7 +545,6 @@ static void recover_worker(struct work_struct *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
-	DBG("%s", gpu->name);
 	mod_timer(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
