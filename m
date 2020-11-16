Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B442B4DBD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AAD6EA01;
	Mon, 16 Nov 2020 17:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF56C6E9F5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c17so19627796wrc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nUt9W7GZWBzXYxZLOdkAJHN0947I5vPgihBPSlg9tj8=;
 b=p2MDgQX/wofftkkr1Hy4/72WZE0tdzpOt5FVLHl0WdVI391TYiA+wQE+3Qv15Wev+K
 1C/3yMtFQfGzVbXpJ+k2jQIDu07h2B2x+BqjRUY6JXv+1njqRBOd6GBuLP6+7M8AwHDB
 abfRtQE9KsXwu463fk4uX/pjlR0P72t8HyIiSMtE24bHGlVed/pW5LQ/7E6culC49Cas
 f4Lor5+/lgetHGYXYwq3C8HCnrJqkC1PH50HCucS4EHC/XpRkJzguHigLsLHACZjdL1F
 wPzQvak0EVel6EWTt8s1bgoVvaENbqFgSMduIVtNtiVmW1aSRdwBOU3YeatY5V1e9PJG
 LUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nUt9W7GZWBzXYxZLOdkAJHN0947I5vPgihBPSlg9tj8=;
 b=FT2TJFePeNoSRihGhITbhkna4hbfh/N+gXreTI2RQNrPNHUqR6Pr+3oicHeMaLRrsq
 n4UhOjyqdoWDfq2Oa4l4cjCy9f+MRMvRqCpTuKDJR0DWFMVprT7dBvfYKMztCDVvwtkT
 PFYLIEgwZGeIJII6yU4DLcKo3Jm18FJUnhAqOncXCHQYep1fiku5YhtX+y/MS92HjZvj
 Eem5apznR/4SO/HvM56QHJfl/iFT0JC9Y4r1k/jGRbppFDe7NmeDttqSoS8thjkzC3kN
 XByqa4N58IAHn2f7fkTFPSOvHxOgG8y8rgLMhdUd+JS688ou3tScBrlRi3XICoiAH/fi
 TeIw==
X-Gm-Message-State: AOAM530RnvgLPYAvgi1UWj7rYcM7MrZ3sfaK9zdzhXIDavkYUfNPDOkq
 wp57JsHhwr7jJNxIA6jmpqeNFg==
X-Google-Smtp-Source: ABdhPJwrJ3qM0N77lCgwewkn0o/4BJZQjYlEpD5Odpef/EinSGDz+FIBUabKsEPNOivdq3sEqD4lTg==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr19916658wrq.424.1605548505702; 
 Mon, 16 Nov 2020 09:41:45 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/42] drm/msm/disp/mdp5/mdp5_ctl: Demote non-conformant
 kernel-doc headers
Date: Mon, 16 Nov 2020 17:40:47 +0000
Message-Id: <20201116174112.1833368-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Very little attempt has been made to document these functions.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b7..b5c40f9773629 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -213,10 +213,10 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 	spin_unlock_irqrestore(&ctl->hw_lock, flags);
 }
 
-/**
+/*
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @enabled: true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -507,7 +507,7 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 	}
 }
 
-/**
+/*
  * mdp5_ctl_commit() - Register Flush
  *
  * The flush register is used to indicate several registers are all
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
