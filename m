Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB82B77D0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC21B6E3DB;
	Wed, 18 Nov 2020 08:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012E89F53
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 17:26:12 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id q34so286415pgb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXY01vYqSIFKCXp0IDMP/PsFb63uKbgbyX0xqNFjPx8=;
 b=Ui84wE1DPycMuErhBKrJglxCN+6U2dIsJ8AXIsquTnLJwX7valeZ/Wj4u13g/P7cca
 hCCwyq37SCXL+glSjaLy48q3Es/ccTZPdji18Jc19ouRkm25CJBTDoKB2hq56S1gsxJT
 CgkNQMv/DyTA8jUzzWDYbwu+gOE/Q4fpQMkqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXY01vYqSIFKCXp0IDMP/PsFb63uKbgbyX0xqNFjPx8=;
 b=LGCs+3HVbyn6kEFuyV3Pj93Lcjl3szcpxwLUCJLQTaQLSOk16a1PxKO9gEA4ez0wtV
 Z8UozzHXuwzrUD6TZRAdiz28cqLI/XE7+WEmFlwZJauGwAXBTS5eDWqjVW/foSv+I93B
 y3ZUFiSX0x9Cse2uSj94HSZXnV6t5kkmUajYCB2YLWy1s47RLJlGBdGDNnc1u6f71uEW
 ZJfdxYpVGTErhli4x9DQDnO7QtYxm0vp13Gu9hzcVhkZp8aGWG+obzFL8oAAq+jXgwA6
 GdNZEqtQkcgjWgj41R59XuX2VU2uaj9VdcDViSzD6xJ27MkTwtSIaWRnEDJDMXNDsJqr
 S5hA==
X-Gm-Message-State: AOAM530uW2N9wwI/eZLiCSvoWcDFAXCqwypRoONCBxgUimdcLs3ZRMrP
 vHQEQb2N0jLIx2/uTOofykuUGA==
X-Google-Smtp-Source: ABdhPJx6BBjXdUQptGLanbbvON0/vIPEQPGdKUos1T5nRqRB9kJFXWbLNYc4fRG2VpF08DlYFiAz3w==
X-Received: by 2002:a65:4485:: with SMTP id l5mr4316577pgq.10.1605633971667;
 Tue, 17 Nov 2020 09:26:11 -0800 (PST)
Received: from smtp.gmail.com ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id y9sm3816846pjn.24.2020.11.17.09.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:26:11 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/dpu: Remove chatty vbif debug print
Date: Tue, 17 Nov 2020 09:26:08 -0800
Message-Id: <20201117172608.2091648-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't know what this debug print is for but it is super chatty,
throwing 8 lines of debug prints in the logs every time we update a
plane. It looks like it has no value. Let's nuke it so we can get
better logs.

Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 5e8c3f3e6625..5eb2b2ee09f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
-				params->vbif_idx, params->xin_id, i,
-				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 	}
-- 
Sent by a computer, using git, on the internet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
