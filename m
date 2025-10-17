Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9794CBEB6C9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 22:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95B10E19B;
	Fri, 17 Oct 2025 20:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RKly9WRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F7910E19E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 20:00:42 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3612c38b902so21586801fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760731241; x=1761336041; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xQNJSxr8t/BdOOWVzHAAqI48NQwvfIqpyN0Al86/+Ik=;
 b=RKly9WRE4crDbwveIPtEztjCL4cZLObPRTnn7ki2ydoPYh3BD7kyh1kCfdiQaIIiN7
 7JIvGmq9zxSlVznPpngLDCE/3BsiNWpdpwzDZuHRMaictaSMwSnEhbusOEJuauT5tql5
 V18YaNNn/aJOqU6usBm3e2AOaQ9xpbjBAqCqRBBjDDgzQK/WDWVpMbUPgk7iXI5msfGI
 VMGgrZt/xwcIQ0XE+bRmvwGhwaF2tu0qWUAInXOoiPPdN49Mq7AYX1EYK/QKyo1xeY6I
 uywhLZlpfuCc6Iyq92mZ9yXLhAXGOORzXWWpQuLx5QxQOdRJ8IpaXzgkfV1L1dok2gz8
 d7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760731241; x=1761336041;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQNJSxr8t/BdOOWVzHAAqI48NQwvfIqpyN0Al86/+Ik=;
 b=IQ4KyvpvVWqj78ORMDqysnw/SzZQtAzZoGsgPQRDDQRbcV9F0Z7rINcJwcnryYcP2h
 b3Qe2xcQPS0+o9UnpsuvTQK9tIF27tShb9E6N75trncA2TLIC5ifyLQfTRKcKKMi+s4K
 lPlQfEYg38mZXZ71S6zCWW0BQ5cDh+ajSmqNeNC7+oqLRFBP7Kgaz5NtuDmMS5f1USrE
 cLQRtL+G0Rlm/ZWVHqjN9eB9hX3ZPSjo3hCiVDDg2u35gNw+IzBkqtpEAxobJJn4xLgs
 5K2vcK0AOCdlkzoykjLafSl9r8HFVKGATfOzMAeGEXPr5CQHtB6f9K6YKEGIkAfL/418
 JFbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrgjekNlYk3RiHYozh7TydRF1kPAdgMNaMJrSbbE1LFC58RuLTy8s/C54jgQy6H9gMyaISgw41cxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqKXx9rIBAzs6OlFQIimcR/zg4jW2sM99hV4Uey5Mx08XMygI2
 cwUiGas7zwOOHS6L00YnBjM8r1fec6mlekN0AtsPY8WIbq1aMnKnALUi
X-Gm-Gg: ASbGnctQKODkXb3rxMSNdjXirWLXh7z+HP9c7BFYTrN6ZFtcakvw6ZPyHBUpjh27frb
 a4pZJVXmset6K2a9ZsKFtC1tuXpS0FsvPD9s+MrHA+TIMeNQARA2A7OSFghxvo4J/olZDD2qF4R
 21p0uLWn0YYwsBHhalj2KgzrhC38W7j4oiL2PEMoE7b95HdDnL0hoOtzP4K56A6Julet/K/ZhPV
 Z5iWYwoisJmpaz98x3wX0BhbXlbpcCHSKeIKx23ZLMa510NHPHXTyvND8XccHQa7MK1uEfGgaoF
 +bKh/Qz3kTmt8lmTiobm6ZalRiWIIR1Phb1qVxJBtel1k20CgjILahacjL+VKnd/GN5AAMi+C+Z
 BaIw8Fs5kTmnEqzB7E1EtdCmgmfJMuSxVp4vAoKvRKaK8KFU4uahU5N1cONtBRf6IvQH1blP8A/
 4kJwrOXYULAwK2EoSpmG6t7Yvw9RrJE57LtjWXma/tRfx/VpDBkm8fHH4SqZ9N2g==
X-Google-Smtp-Source: AGHT+IGNU4fQjBz2jSA6DBrpEqZEn5tDNBRAgHPtQC9tAm1M2lku7pLWWHwNUw5re71jbQvu9jXrmA==
X-Received: by 2002:a2e:bd03:0:b0:333:e590:1bc9 with SMTP id
 38308e7fff4ca-37797a0e735mr14647271fa.24.1760731240714; 
 Fri, 17 Oct 2025 13:00:40 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.13.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 13:00:40 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Fri, 17 Oct 2025 19:58:37 +0000
Subject: [PATCH 3/6] drm/msm/dpu: Disable scaling for unsupported scaler types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-b4-dpu-fixes-v1-3-40ce5993eeb6@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

Scaling is not implemented for some type of scalers (QSEED2 and RGB) but
it was unintentionally re-enabled with change below. The remaining
condition in dpu_plane_atomic_check_pipe is not enough because it only
checks for length of scaler block (which is present). This patch adds a
additional check for setup_scaler operation.

Fixes: 8f15005783b8 ("drm/msm/dpu: move scaling limitations out of the hw_catalog")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d198a65a2c5fef5fbdebc9c383a4b08bc71b8bf3..6effe0fa4837284a1f038e4907c4c91d239aeb8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -740,7 +740,7 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	 * We already have verified scaling against platform limitations.
 	 * Now check if the SSPP supports scaling at all.
 	 */
-	if (!sblk->scaler_blk.len &&
+	if (!(sblk->scaler_blk.len && pipe->sspp->ops.setup_scaler) &&
 	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
 	      drm_rect_width(&new_plane_state->dst)) ||
 	     (drm_rect_height(&new_plane_state->src) >> 16 !=

-- 
2.51.0

