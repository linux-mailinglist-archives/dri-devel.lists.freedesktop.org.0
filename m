Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF14EAB4E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 12:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7992310E80F;
	Tue, 29 Mar 2022 10:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BA510E80F;
 Tue, 29 Mar 2022 10:34:36 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id kd21so11093170qvb.6;
 Tue, 29 Mar 2022 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aANeBL0m3LmSP3dECp2J5wZnDSo6Du/pm89aOfFASWU=;
 b=jdPD1Ok/EP0MAsV+pBnwl4krVmzQYmhR3yct0VzqtGV/iet2+Bh0aMTVyAOKffqzdj
 zFxIjHrI79PA0/EkcykYHBUMpZ+UN3/tEof+ad/4vFuZf3YPWkrlKugYJ+eC/nad5iPw
 TkqVpjGGyXtlLJUwAISpOgQTQkoC/SZW8ywZoDDO4TyZ2FUSHcJ81Oy0QhWLM60pytoT
 Wfkv9Aezj+CKhJ+H+uxHVAgw2lpsEJHAYowKQWNIlI72d9ePriR8P9NdHzaLBOBEisZe
 DR6l71NqmCmUYRrSM3Z5uAHOQTdtxNnMEbdPCyFode4/wnPl30QvgK3Z4PolMhmguVpY
 vfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aANeBL0m3LmSP3dECp2J5wZnDSo6Du/pm89aOfFASWU=;
 b=bYJMrvKE7AEABv2sCcjC5R0eyepl7vdVq745zv3dWpVlCt/VlDojKUeOVLjnxYQ30u
 By4uIqqVgPXfWmcBXRndrQyHIaZzj7QFUSoZ24hy7BUw9hCjnTAtQBJL/vJnXa815h+D
 YG9/3R6rNchxI1xwLzGCqjFQ1mxwcbvxzg/AIZ5kGrsNR+UKIpbweT9bVDg1vWJiYhE5
 K9ZbczmsrIajKaFaCfUg0IeozB/60z43t4AaHKGMO0zW/+9HNzJc7Zaz8Iz5qxphRZYT
 YEi9rU12ItkJc4cU6YevmpynDJXEuVh3oPAXxxtDZ9f/N4p9yFVfzP3Qkqn7k6/poe7G
 37OQ==
X-Gm-Message-State: AOAM532oNzDMlwEjk41OumZmlDuiZ4Rhx2TpKCG2JE2y90WFpmPQ1CUj
 5MEkUZhWjfoE+XVdI1yyjWo=
X-Google-Smtp-Source: ABdhPJz31/qk/lbKvZcxtFiVePIvBfOpXdDxA9FpgWoHvH6i5FkLDwV3L4gLJuzuwYPhfVr2xY7cWQ==
X-Received: by 2002:a05:6214:22c:b0:432:6b2b:95d0 with SMTP id
 j12-20020a056214022c00b004326b2b95d0mr25374527qvt.63.1648550075469; 
 Tue, 29 Mar 2022 03:34:35 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05620a066e00b0067d36cc5b12sm8941753qkh.87.2022.03.29.03.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 03:34:35 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: robdclark@gmail.com
Subject: [PATCH] drm: msm: add null pointer check
Date: Tue, 29 Mar 2022 10:34:16 +0000
Message-Id: <20220329103416.2376616-1-lv.ruyi@zte.com.cn>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, lv.ruyi@zte.com.cn,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org, sean@poorly.run,
 Zeal Robot <zealci@zte.com.cn>, greenfoo@u92.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

kzalloc is a memory allocation function which can return NULL when some
internal memory errors happen. Add null pointer check to avoid
dereferencing null pointer.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 5d2ff6791058..acfe1b31e079 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -176,6 +176,8 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	va_list va;
 
 	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
+	if (!new_blk)
+		return;
 
 	va_start(va, fmt);
 
-- 
2.25.1

