Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDE49676E3
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 15:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7E310E0D0;
	Sun,  1 Sep 2024 13:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bb9bH7CR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7763A10E0D0;
 Sun,  1 Sep 2024 13:58:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5becc379f3fso2834173a12.3; 
 Sun, 01 Sep 2024 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725199133; x=1725803933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+CwOEtqu3IBPCzfQKTkK2Lp868q6E74YpTPp0btJmU=;
 b=bb9bH7CRESNxK1bjr3OPiu9pp02T8c/NfUkpS6tzlQF9NwHLSRQwrZw8UYkUOkdgpF
 z9aJvVmDMgYINdSURGO+nAipFHsDKdo573PPd/grlNp/7umMvk7NpaIYoyAWgAA+ztaa
 lFXms7qTA3nmmUBhs72pBSmgzqh3YTfE7HHj9p/RfD0nbKntjiVp7WQ/sf6nxsy0B9ba
 2HMAnP+uzgpVqUXi/qM5A6gPQc3/sQqZwlQ6wRqYM+0rxsKLmKXOLIRAf6IFNna8s3dW
 YyuLxxjrwJc4qBGqavB58JE6VtXGFI5jMm3u57xYY9oP+6QggM/AQ1OCKnWvLMMCuQh5
 OH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725199133; x=1725803933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+CwOEtqu3IBPCzfQKTkK2Lp868q6E74YpTPp0btJmU=;
 b=DC91JrO+eA5GRq7sTreeRRLN1Bz9mh0Hybh8/3O5UrWQyVoPSWOWqCcMbk1taZqjZN
 5zXShdt57STyv0XlrLdC2mrslPWLNKlGlIHZGNCuXjLRwmGnagnnehG9DQqnSKGg3Uvp
 1ocidbjWG/oGjR1Zz+ykbDJlovp4bzA1miatgibAvlrKSfBD3IbULq2CFE5kOvbSRJ2X
 yeojAobcRAvPfpejfmNy3kfHSePEZY69zgLCsrRLcfLpgbhmngiBokQwuyBYjQwbMwf3
 BGxWV477d+grfSRZOflbmopPD9T9NbHNraZFD2m99jgRF7SWEUtcXDZaInTDKpWPMA3r
 5FiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvjmwKc+7UL2u895ZE9qwaQhSYvCuoWtwHQFFKxYNtc9naQ9S34uel5Ks1UfLU/Jj5qW0yOl0TI2E1@lists.freedesktop.org,
 AJvYcCXXosuLgrd8qHr1Ytvi5mAnKbxeaTgEDLZeh5Xj+yL/U72zz+IYILX9BwgCkNwgI81GKX4pA+kJOoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSboaGfe2bbeCJf2y4aKhlLIYxTpKYeFX/VecC/baexgmH7liy
 AlqQjEfCyX28oM5NBzdianRd6Q9Vkx0Bmd21jOsitwUWHXAS6yFe
X-Google-Smtp-Source: AGHT+IGB9/p9xuAKpPD5hLbzPgo/k1PC7HI4vXcDLu/C9nNRamu9OWu9KjLrtObSAMysisCiqYCWgA==
X-Received: by 2002:a05:6402:254d:b0:5c2:5cc8:353f with SMTP id
 4fb4d7f45d1cf-5c25cc837bcmr436347a12.22.1725199132019; 
 Sun, 01 Sep 2024 06:58:52 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp.
 [219.100.37.233]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 06:58:51 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/msm/a5xx: properly clear preemption records on
 resume
Date: Sun,  1 Sep 2024 13:54:01 +0000
Message-ID: <20240901135419.1075412-3-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
References: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
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

Two fields of preempt_record which are used by CP aren't reset on
resume: "data" and "info". This is the reason behind faults which happen
when we try to switch to the ring that was active last before suspend.
In addition those faults can't be recovered from because we use suspend
and resume to do so (keeping values of those fields again).

Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index f58dd564d122..67a8ef4adf6b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		return;
 
 	for (i = 0; i < gpu->nr_rings; i++) {
+		a5xx_gpu->preempt[i]->data = 0;
+		a5xx_gpu->preempt[i]->info = 0;
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
-- 
2.46.0

