Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF682AAC9E0
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF1510E355;
	Tue,  6 May 2025 15:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WhxNDYFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6520810E6EC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:48:23 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-309d2e8c20cso7627931a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546503; x=1747151303; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=WhxNDYFjvIH/Dg/YivlrOYezHuT4GyfUQIAplBGR4RtS+SGLAxiSABUc+GFkm6Hdna
 jnHyENbW3TF+rfxxrC51oHlgYy5nrxQnzwt6nkpPMV/rpEEYwwaeUBy1uThHiMtixEAP
 iUOb65cQtHbWmZXL0JB65atxeSOU5RKy0u4dtgpucxdSz39y6fvEMzjejBfkS+7aKsmj
 6cECfCxef9b01Nxf+PZHHTHR0TM+m7IiDBvMAQmq7swyY5WVTsqJLXBMAKhXbYhBhD/V
 SdGKbkrw2b/+vTSxXcq8IuVhu8V2+pVwZGhSasCNAf85aXtqsEXOtgZKL9iW4LJTASKV
 +hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546503; x=1747151303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=JPyuDQruBsU1CK6AweHBDhwjR2EatheuNrToZVa1DCKQFYDDBNLFjjZ8aVMleUMmoN
 QysMlplMQysjjH3nlPVb0GfP2xjjaN7f5Njpi4mf4zyQVwsLeBJz1TIyBlPGe7FozEJL
 7noUZmjV5sD0E1MVTzbwy5L29LqLk0Vhvv5cxtAWpE6wpJTXylD3+b7cnCcEGbBF+kfn
 F3v727Jd/QMpCfX10uBguLCcl3s8jsIcD4m3GLTxkgkXQIESkbSAo5NmOLgKOgzyCz8N
 D5gz3+owSoIWnc6XgyPTCJyTo03vAuPpF4gL33rFd9wieWOdKa7goa6bBkC7tmnpFykw
 WZ/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm2S7gMoTPeuoLOceHTtl/KtCLaVQmc3vC8WYJHEBgV4SLtsEHGWXZVmUkmhDbjqSn/vZLyBot+to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytwFiMHIvEJ3sSECJ/KeIzdR6Qh9GXlKEtH37B898Ox1r1RczE
 3+L2fPonwqfc+bv/SViA3OKta+q9gsvF6Tw+NNt8dsl1pkjMjezljlQnv7pXbxQ=
X-Gm-Gg: ASbGncut0kAwfe18pMLDs7tLbndQwAWAZjeysERlQydiavH1+Q2FboB/nyp5Gb0XgG1
 atp1zgoyxlMoaXNe3ngP+r9JvVLEw2GQG0w0MFSFDl6lS0iIbQQgaQaWumHqLMJxTHrZWNuVkiR
 uw3mFDp0TKJSoMkhiW/9+dUJQq0bfsxlntwZmfofsWi4xmlLCIAea5NjGQTgDIFj9Uilh1eVjTL
 QI2JD5K2x2twlti6cMj7aCTcxvvhQiF6diMhWQ67b2x+arZkPt39Y4oAR+QQJp1ZvNrYkeZGs3v
 tQJ0yiEuq+0smWfs26frp1RclF91Vj8maB9Paw==
X-Google-Smtp-Source: AGHT+IFq3IHy8I9tBXRjsLakmdCQshZzPku4/NS3tQZMk4s/Veh6/YDLmRsPoGsFRWV8UFwvJW2chw==
X-Received: by 2002:a17:90b:1e4b:b0:2fe:a614:5cf7 with SMTP id
 98e67ed59e1d1-30a7dac8819mr4272376a91.3.1746546502959; 
 Tue, 06 May 2025 08:48:22 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:48:22 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:35 +0800
Subject: [PATCH v9 05/14] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-5-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=lAl0mGwOz6tvf85lHQs6kYyEJo9BJPPpOgpe5c6z9L3qc10QWWgeFhpzlUK4dFgPK1N/asGtV
 c9hCSlXhwbbCdvoi+ct/btEMdvVH+5MJ9KdWA5BEP12t4l+O/9eNnJJ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2d8ff4b524715c658188fe56bc337e3ffa831c0a..bc7639a46386c6b9457edf3afdf6f747a632651f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

