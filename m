Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E746934D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1082B73D61;
	Mon,  6 Dec 2021 10:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914A16FB5D;
 Fri,  3 Dec 2021 16:18:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso5295183wms.2; 
 Fri, 03 Dec 2021 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LPkN68tYspfEa2svzvg7iyj4T9p7CaSU3K6P782Fdw=;
 b=g2S3EPebcJNAfwNc5v6rHce3p4JPeOX8jq2jgny1i7i6I0pQBv6ab0x055D8Qntl9g
 sOCtaFKVUZIyDjf3TfGZQxEJW4utSuMpXeYfU9EtRwlCI3g7X7ByXchi/V00JiCuYxPW
 ND1ZPpODaA1hifD8cwrXs+p5BP1Z3ojig+eShCqg3RouXry7hyfMYx9I0pIX6isk9TlE
 rgRHNhmK0jL2uohPoDQ0mU2VsELYNz80QcQfGwIqkr1qGN0pijc41nBLieWYCkQ0VoYt
 1kVyVu/GfknhgVr8yMsJfSgbAvnfFi+RpnqTJiGk7GDIFRsOTFdKaoLH17EgJua598li
 JEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LPkN68tYspfEa2svzvg7iyj4T9p7CaSU3K6P782Fdw=;
 b=eoNMFJaNTWn+BUCMnB3cYHlJxQhYHPXcV6OcdPOF51HD7hPbTPDjuj3bwd0gAhmc4W
 rM78TAYDeNtsLolOVHPAjSUxpmIyCLcljB5onyoYtpSz1XOp+bfn/Z9RyLw0eDd+1ie3
 eJPzZwUe2GXZ4Exq5PkAIDVLWRSrwiH3NdGHLfFKHQKsR/VYCplANaxYusa8ROV6VB5H
 cr4ILwVZcHZqUHNxgPxa65DdCQUUG+dEoGzg4dpJHyjNUHantxD/rrKHVc+6VWQbimfy
 eqfb38LZr6XSekZGtoL5eHbSLr6AwsNsz4K7fsy13U578+hKleT9QtFT7YIS/TpqroaA
 1ijA==
X-Gm-Message-State: AOAM530Qor+PH5HIxIitEjoDlNRhv2Ega/stB9GggrG1QK0dEkb7Oj5C
 xp24//Kgchzu7bh4RUk6yza0mOMgHuVROpzC
X-Google-Smtp-Source: ABdhPJzmcfbTgyWLQSHJ5e/BGnE3Pqje/jXItvJqco9AXkaN5rIXhT48X2OYs6JMnimTMbYjs6If7A==
X-Received: by 2002:a05:600c:3d06:: with SMTP id
 bh6mr16326257wmb.40.1638548334048; 
 Fri, 03 Dec 2021 08:18:54 -0800 (PST)
Received: from localhost.localdomain ([39.48.132.131])
 by smtp.gmail.com with ESMTPSA id t17sm5665970wmq.15.2021.12.03.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 08:18:53 -0800 (PST)
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm/dpu: removed logically dead code
Date: Fri,  3 Dec 2021 21:18:46 +0500
Message-Id: <20211203161846.37720-1-amhamza.mgc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Dec 2021 08:15:50 +0000
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
Cc: linux-arm-msm@vger.kernel.org, amhamza.mgc@gmail.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed coverity warning by removing the dead code

Addresses-Coverity: 1494147 ("Logically dead code")

Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 185379b18572..75f0c0cee661 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -751,8 +751,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 
 fail:
 	DPU_ERROR("failed to create encoder\n");
-	if (phys_enc)
-		dpu_encoder_phys_vid_destroy(phys_enc);
 
 	return ERR_PTR(ret);
 }
-- 
2.25.1

