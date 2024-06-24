Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CB91509F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1014E10E485;
	Mon, 24 Jun 2024 14:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hfL7CEZ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9F10E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:22 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so5085946e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240441; x=1719845241; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
 b=hfL7CEZ/VFHIn3TqZnR6+lmBzzixkuTRjBkj463ZKsGsYDTRBCq2R/dLtDmZZrzzmT
 99K0IGptTX4UKh2S1g6qv+kt6X9z/+m1/Cjqvo7Izi5iMNaQkXjOma0Omv12kQW42F/J
 KYCHotiBGa6aJeDqLMkmejnqeHYL8qUyUo/11AtkqPWK56c/lKjYaI2bkxpCqrlKWerH
 mCls/Lx96Y9+oQsKKEtCUpVVEd54n6CQOSccQsEXPpsrwB4dKqWttX/OHMt9Z3YNq339
 QVYnuqL3iUw4CYk43waFGwNC9RqkrigD8c+PJ1FhpyIxrZE72CKRUjsaNfAfhi12AoMi
 YrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240441; x=1719845241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SPozXOfnQpkwCjUxXDexUWZWPSk8EJlZgnDGsjKSuG0=;
 b=Zf9O1FH/7Mb1I+797FvuMiawlMi4A22eY1uvPifpwGSCTYZnVWHR4bAVlE/aZFLAUI
 kRLEppLiuP5gph0yvm4fXUOL7fhLF6UXychPf243Lr++aAF0gT4JAg+BmEgTuKwx0qeM
 Zi6KjsWZju9p/XmulfbmAs3Ccnd3luTHaLVIm88JHoAy0kfG1U/gSfjIXUZTniffW4BW
 jaFegKFClWKdmG20q8sDFapVOcilVw0ig0HXf5EKM9E9a/3rADAR0+PKeaUU09yvfvz5
 iWq7oIlQf7wNWowc0t3kveUyXcCRvh0uGfI7k+XxC9qHNIYZoe1Kqea+ThP5GtdrjU3X
 mrWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUgQrX+LFL3JUbHAEjSJusTB6x2uXq6qyAxU30z9R4HeXdQ7OxwTzC18oPXSO5b+4L2kKWJCIxaSbVy+j8BjV9OlxdGDv5aZVWGleEMYoW
X-Gm-Message-State: AOJu0Yy8UtP0+8hUXcYj4fOGGWuLrK+LAmjnVY26sKo9ZJCdqG6leQbt
 qc6vCTJdaxXO1a8UPzP1jZkgsh5wlsqwQzoWibk7KUmCvjc49ecfYErNKeO8HBA=
X-Google-Smtp-Source: AGHT+IEWEVedxizz7wL35346SfuzkwcOxrGhZmWmTesVJLBvRgGjQKJ0LKJ3PlJSSoWZaVRtugvtNQ==
X-Received: by 2002:a05:6512:10d1:b0:52c:e982:8457 with SMTP id
 2adb3069b0e04-52ce9828502mr1763058e87.32.1719240440814; 
 Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:16 +0300
Subject: [PATCH v4 10/16] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-10-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PvarS7GjKhySpbWrpwCTIA/zEFMlNGs5eUuK3EGV4IQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwE4Ng1KUwuMPQqNNhl2jUNCi/sq3YbTvFP
 cvNquVeUEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1YbqB/47/wo7upDky0O43P8ivMBAIsvt8g0v+bXSkiq4FPPYOc3hJZsLeINCaUhMIc7Wa2KmZNs
 h9R0S1zzHNHGc+3rh3q6fTqGyw63KQfBuZXy4eooA+zKwfZf2rlh0XxGxLkfNsF2r1AsoThb4ws
 Ba2NbIVLFKFlmmYnFnxhafHXCSCJQs2s+TQhb7Sk7NtcWq2M1QWOdwCd7/5IDkQ6V9fvNqqUUzt
 P7I5QypLz62J3Q1/rDUEsKAJaCT6ZCAvcZKjh+MBtTUENBECJWddDR7Gqw7HmA+vSW2ea+OFSDO
 gSEyXd6VtGc5OaWG7JxXvwyMgWv9TUlfPnIim/oLQL/g74QF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
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

The _dpu_format_get_plane_sizes_linear() already compares pitches of
the framebuffer with the calculated pitches. Move the check to the same
place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
kernel log.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index df046bc88715..4d17eb88af40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -229,8 +229,13 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (layout->plane_pitch[i] < fb->pitches[i])
+		if (layout->plane_pitch[i] <= fb->pitches[i]) {
 			layout->plane_pitch[i] = fb->pitches[i];
+		} else {
+			DRM_DEBUG("plane %u expected pitch %u, fb %u\n",
+				  i, layout->plane_pitch[i], fb->pitches[i]);
+			return -EINVAL;
+		}
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -360,15 +365,6 @@ static int _dpu_format_populate_addrs_linear(
 {
 	unsigned int i;
 
-	/* Can now check the pitches given vs pitches expected */
-	for (i = 0; i < layout->num_planes; ++i) {
-		if (layout->plane_pitch[i] > fb->pitches[i]) {
-			DRM_ERROR("plane %u expected pitch %u, fb %u\n",
-				i, layout->plane_pitch[i], fb->pitches[i]);
-			return -EINVAL;
-		}
-	}
-
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);

-- 
2.39.2

