Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A102AA544A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 09:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F8310E14B;
	Thu,  6 Mar 2025 08:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NFpunNOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6110E13D;
 Thu,  6 Mar 2025 08:22:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0789C5C10AF;
 Thu,  6 Mar 2025 08:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A5BC4CEE0;
 Thu,  6 Mar 2025 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741249355;
 bh=lqfVSt1q8Nv4x662WSVSo/wapty2VM77sNt4P9YbEes=;
 h=From:Subject:Date:To:Cc:From;
 b=NFpunNOu4mBT/7vt+D+E4gjgFVBNtbWNON0S1bfNI1eYlv+bkm4mLs/niYN7p4KKf
 8Bu9FkYYE9HUwxH6UAt0IIpztAfMDWIDEB7n832uEwsIFs3Se3uJ2woQy6sjXquF1L
 3v1AZGNhdrRrxcFHkJAh52STHIv1N1QpBrAfLS+hVCi6FC6I0sKLchrYDjL3V3G2fi
 k2lKutRKD5vwEJXWnUPyua5j7ITXYHKtBYMav8d/BvPB4S/bgzo4hKzq//6oDzR1NY
 XSpNGKeaC8Q6XwpTprimzduXaWLEbyJrYhR1p0dcGpyg0rxwBe4iWLi/iUiMhsR90V
 60NFrVCXfrZHg==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/2] drm/msm/dpu: two fixes for kerneldocs
Date: Thu, 06 Mar 2025 10:22:28 +0200
Message-Id: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAERbyWcC/x2MQQqAMAzAviI9W6ibTvAr4mFuVXtR2VCE4d8tH
 kNICmROwhmGqkDiW7Icu0JTVxA2v6+MEpXBkOnIksN4XrjIg/EIGW1P5FozW8seNDkTq/t34/S
 +Hwy3iDteAAAA
X-Change-ID: 20250306-dpu-fix-docs-3700642b33ea
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=524; i=lumag@kernel.org;
 h=from:subject:message-id; bh=lqfVSt1q8Nv4x662WSVSo/wapty2VM77sNt4P9YbEes=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyVtHx812qfFzzxfAi5u9cmy/26pr4haA7+zFG
 yGbuTwDqVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8lbRwAKCRCLPIo+Aiko
 1cBQCACJHtvEqKcWqxwsJtEvCMDDIVKtK6UH56HMXMtNDT2eosYBRosXkr2UmngSyu/xUF46zur
 9gQ3R4vvKJOQuEPi2qvA6BaFkf9kIHs8dZks5LCdMnA75yGdRGDk5XDea+/44IYqiAuy1Ud/rTS
 KXWog5nBigD7bUJd/nbi8cAaQfurTcQ2JDyRryhhPN0OfSOehz/43zWLxpZB1SKks6hwXje4/c0
 twdfgY/pL0GPxyqsBRYBorTV3EsXMf+Tmzyzbi2QbAX3GeaT/xKCbga7EeUdflwJ25C2gx91Cnx
 ekExEDPsA8+cmij5opfvM8fmpuxyi2dhvpVNNa5zImpfFJJu
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
Dmitry Baryshkov (2):
      drm/msm/dpu: correct dpu_crtc_check_mode_changed docs
      drm/msm/dpu: correct struct dpu_encoder_virt docs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
change-id: 20250306-dpu-fix-docs-3700642b33ea

Best regards,
-- 
Dmitry Baryshkov <lumag@kernel.org>

