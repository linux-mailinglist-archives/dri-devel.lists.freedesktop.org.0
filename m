Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A07F41CA12
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 18:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B2C89BD2;
	Wed, 29 Sep 2021 16:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8289BD2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 16:26:07 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8E2D0402D9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632932765;
 bh=Rm+gsKMf3KO4CSrmWZZZ6Qt7mfefNMHgflz9fS2JkAo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=wP/hR1x32R8oYqCqcOyN2YA3L2+cUlhbUR0AY37FUfA7bZ+JO3rlZkllmJW9qDPaz
 Tw77qBd90v9GvthlrvF/WFOqIfPYZH0wYfLUriEMP7iDEJ2df6sPWiqsyFdac+jW6f
 DEh0qrciafG3sqS+krrlSFSbrMcZZfz7J7d7yt/w3n4Gl4wcUVQvKWvkhN2Gd3MAJO
 4PLM63dYExq765hdOvdl3nJ0+SmeRFHhwB9Ld4Og0S1zX2BIEqdDcMhEVahsgUefPv
 a6eW28x+ttmq1GnISB9y9N2QktzKH3kMDnyW6Nw5/rJf7wWfAZqMHy1dnC7vTh/05Y
 Ujc5a0jdeMr3g==
Received: by mail-pj1-f70.google.com with SMTP id
 rm6-20020a17090b3ec600b0019ce1db4eaeso5390037pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rm+gsKMf3KO4CSrmWZZZ6Qt7mfefNMHgflz9fS2JkAo=;
 b=64LqIyk+H9HDrH2QVfMBYXALKXNJSPdD/mwpvIKAlAn0FKETZ33am1cxgYGql/IKYE
 iEq0Ov5patzXCec1zL1fDD5DUlXuR8+PYgYuX2HD7K450QQv6U6HRDJJwQXlDcmPMM+K
 XsT3UE6+aRSIEEbdq2fBGL/kvblGj5ERJDqgr353H+ZKVr0hvzb4/YZEHK+A+zRg4nto
 Vu8deRM63h6CUJZhdNXGTb/kIuh5ahTMbba3tSTe8OQtzuTfkpive8O9d5KUG2nxTyY3
 bhWcoefjzGX4l8leoDENRmt99teIK/RBNj1bI9h4q6gj+HiWLuUyff+sNZQ0pFL2Gp1h
 2B6w==
X-Gm-Message-State: AOAM533JuMKCEaAsuUkqAarU/fkFbKzSODHFLN44zFAHCpIL8ZbJiE8V
 1XO1nkGtm7HqMH8oRNE5t/sxPJfrm0oM0fRFhYmfw0+bWv+3E5pyveBPpuDnUPdyQu1Hj4MRD4O
 mDnaskxFQihcmlqDOWIkr3H+r/iw9t+nrTyhzhNm2AyMGAA==
X-Received: by 2002:a17:90a:4290:: with SMTP id
 p16mr7357981pjg.112.1632932763763; 
 Wed, 29 Sep 2021 09:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC22Ts07QZM3TqmbHY6TDE7TF4sYwB/o3/NJgExi9doWhLlJTT95Q4jxI32IZQB87N6iLNQw==
X-Received: by 2002:a17:90a:4290:: with SMTP id
 p16mr7357953pjg.112.1632932763495; 
 Wed, 29 Sep 2021 09:26:03 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id p16sm293615pfq.95.2021.09.29.09.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 09:26:03 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: dri-devel@lists.freedesktop.org
Cc: tim.gardner@canonical.com, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: prevent NULL dereference in
 msm_gpu_crashstate_capture()
Date: Wed, 29 Sep 2021 10:25:54 -0600
Message-Id: <20210929162554.14295-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Coverity complains of a possible NULL dereference:

CID 120718 (#1 of 1): Dereference null return value (NULL_RETURNS)
23. dereference: Dereferencing a pointer that might be NULL state->bos when
    calling msm_gpu_crashstate_get_bo. [show details]
301                        msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
302                                submit->bos[i].iova, submit->bos[i].flags);

Fix this by employing the same state->bos NULL check as is used in the next
for loop.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8a3a592da3a4..2c46cd968ac4 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -296,7 +296,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
-		for (i = 0; i < submit->nr_bos; i++) {
+		for (i = 0; state->bos && i < submit->nr_bos; i++) {
 			if (should_dump(submit, i)) {
 				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
 					submit->bos[i].iova, submit->bos[i].flags);
-- 
2.33.0

