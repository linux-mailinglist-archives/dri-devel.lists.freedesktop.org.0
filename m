Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5B685972B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 14:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BC610E289;
	Sun, 18 Feb 2024 13:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EJqsHUXV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E910E288
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 13:44:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-512a024851dso1572762e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708263875; x=1708868675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gkAm9FJgA8fZ1qm+DC2Z9j6bt6uIGztvWhk79Yld62Y=;
 b=EJqsHUXVF1fAIXPHmvyEXlteqhg7JhqEckhzYJIJbLx+bvMcc0NPiIfSr1QaOGYbKs
 ghV9kvtqFF2pWqAsCKOlssV4kAsWYW5a6BGhXKCmbgsdPYT/N42xySMcVdGzyqH8D5ve
 Fb9BKtmnJS9vM8ASW7/f69AtIX00t6i108zS6lVyOgrRElcck8BQ7njqeolhJwLBUDK5
 a0Vynr1Adx/uAPd+G/zSi+pAYMd4aLxl2Poa7f1rRnSrM9ICPkX2fFz+VasObOrp+CPV
 T8qGGN8fq/5l00czCxUFyhRZ+PBItA5ZFoPAAx/joqS5I5/ub0nAxJYstJ0WG8t78D3F
 oV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708263875; x=1708868675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gkAm9FJgA8fZ1qm+DC2Z9j6bt6uIGztvWhk79Yld62Y=;
 b=P1iUfqVB0kasyb3A7sPhWD5Uor3wgV0dGFi1hCi2hojlIJFbDZdwwpIJYDPARyRMD5
 RCBq2WedvKnnecViHyce08KUTWYiVl5AqjmJmbih0xLrIr5vCd3Fy1wfIzu33seXvaCD
 iptBCpyQRo9Fp786HUNT88z/wtI+ej58VEKRVrrH6oXoesfJWrL2Hk5Y3ZhIXhUg4PSY
 oNx4SSf2rdfwS/O4jGOwDrMeGdh4ACyjmUgh/Rr1mxJQ5cx6nxbCNZhaD4s3t0jyxaQC
 /HVIkl06+naYpKR+9mrg5KbDGzLQ7tcKZGnYx7PABHsBkcAuV7LK7mp0x9YVeF7g86jZ
 wnxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiKNFW3QJXksFnBphbeeKrcjHMCbikimsih6lrYYDVj556Yix+XqGVfYLZyhPOfD5PDRvtTEkBZMFUQKPkcFtfBv02J9knlPW+/qcFrisb
X-Gm-Message-State: AOJu0Yxf98KV9GG2cwoxi5gNu1dYNxTtlvTf2mRfvXTqfCume1COIJb5
 NEdfA4NqSM/2z7yZbfR6YQs7u2ls0tGchFS1rqe+o1IZ/86JfpbXZyTBEjCcJ4U=
X-Google-Smtp-Source: AGHT+IFaPpSe6tPn9cyTZaL/8FD45vmtfTMY7IiRBueShXuB3DzFM83GLkaa6gxt5a3A/8lmW1q4wQ==
X-Received: by 2002:a05:6512:15a9:b0:512:a9d4:c507 with SMTP id
 bp41-20020a05651215a900b00512a9d4c507mr2297689lfb.32.1708263875539; 
 Sun, 18 Feb 2024 05:44:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a197515000000b005124a4eab2csm547406lfe.225.2024.02.18.05.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 05:44:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Leonard Lausen <leonard@lausen.nl>,
 Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH] drm/msm/a6xx: skip programming of UBWC registers for a618
Date: Sun, 18 Feb 2024 15:44:34 +0200
Message-Id: <20240218134434.2531636-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Historically the Adreno driver has not been updating memory
configuration registers on a618 (SC7180 platform) implying that the
default configuration is fine. After the rework performed in the commit
8814455a0e54 ("drm/msm: Refactor UBWC config setting") the function
a6xx_calc_ubwc_config() still contained this shortcut and did not
calculate UBWC configuration. However the function which now actually
updates hardware registers, a6xx_set_ubwc_config(), doesn't contain such
check. Thus it ends up rewriting hardware registers with the default
(incorrect) values. Add the !a618 check to this function.

Reported-by: Leonard Lausen <leonard@lausen.nl>
Link: https://gitlab.freedesktop.org/drm/msm/-/issues/49
Fixes: 8814455a0e54 ("drm/msm: Refactor UBWC config setting")
Cc: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Note, a proper fix would be to incorporate actual values for sc7180
and drop the a618 shortcuts. However it might take some time to
materialize and to be properly tested. As such, I propose to merge this
for 6.8, keeping the existing behaviour.

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c9c55e2ea584..07d60dfacd23 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1325,6 +1325,11 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
+	/* a618 is using the hw default values */
+	if (adreno_is_a618(gpu))
+		return;
+
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
-- 
2.39.2

