Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A2A329D9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2E10E8F1;
	Wed, 12 Feb 2025 15:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S3yhmCxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6009E10E8F1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 15:24:14 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5de849a0b6cso6367241a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739373853; x=1739978653; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PPKru0l0aVU3WKEJ1///OpkRf3iWaCUXDAkjzEyzYT8=;
 b=S3yhmCxQZYhNJthFA8ngRRdAE+T5OZj7pAPiejqbYGnEDYMaP9kuVcgh+vQRbhCBbn
 lUkqq49mybdG9SUToeKMPD0TFzMYjoqB5kig7R73qNDyEGB7oISSYEWHxse9e6CWXn6m
 qE04t3QFIplsoUg/pf0QFspsW4lNgwOXthWVsDW9I8F6JbeQXab83O3DuNkkk/Zfysbz
 ZADOEPltyjbpbEqGcmm9Ln/1cFnwZdLje7kdKCWo8M4cMFQ54JXDsUv5vaDoJWLvsqUo
 mEWQVuGZPtcnDW1yn5v69amTdiuUJaCdJpTFodsSQmXCUY3AzaMERWkxL1JkYlrjJ1dc
 NTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739373853; x=1739978653;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PPKru0l0aVU3WKEJ1///OpkRf3iWaCUXDAkjzEyzYT8=;
 b=pECEWgvVwrtetlEr8cRVWZLM8J3TRU9e5GsgHlC8OIxt6C+e4ekN17Q19AZbsBCPj4
 yE4TU3vnTwrAOZKy5T0lNP1W15HfKiPioapnHlsUw6g+n4pbMNm+lnzXXNXmS6MlwVIn
 mS4P0oHiq1j1OMu6yWXT22VU9Gd7+reyVMZSqIBIDpQ51tIP7bVzqsrqlboKgDYqLqyQ
 Vcz0VJwACoJKoyzZ33wfP3aaRwfMdwWZOjUD9p4PqwmD/ESOYL3U89eydrAlMWt11xi3
 FIGjgNt5O1ZMA2WLtzDa4iu2tT1vmt90EdTE78RbtzYo9dDYBegGcBf+A0KUSRMjFxeG
 cYXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSUYBtsf63euDKk66MFqFqQmTU2l1TEL16xgkroJZ1PtCQ9h8htfSPqgMyR3N6h1Cb/8z71FO7JV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp4193oe9WbC9+YNIsP91lBcRb3jPEfNzS4NJD+CGP5+rNtvGk
 a+ZYum/7xTt57r/7cD8elS5bGE0F5sdEu/1dquhbItiJQQDZXoH+Um26XLIqaLI=
X-Gm-Gg: ASbGncs7+BcdLYAnV0d9wDN75HclNs+ZCbbcEYvZ+O6T388cD+kjOF/Wo62GwmJUWlw
 Q5JDU1HzORPbrHoet5lubVbCRqMytorntmTG6OccHgw5OApH86+E9CoeCAexvkZMaIzlom63vXN
 I9aqur7UQSYatue19kBEoRDAzUnJwmhdaJXCUYyagABaUp7QN/m0p40blJ0RD1ehjIqxESPUyFM
 y+PZwgnxk4tSouiqujhlc308uYuOAFzpc5bkyCivh7zQzpayaMIVweg55ObJcv3HJ5W0LJFHlDE
 cLpGLMdm6RRqd503Dj43
X-Google-Smtp-Source: AGHT+IFjmw0Zgy4ifMz5CBDov7HZwLscmnRL30CFaXtX/9ilCY9ZxRB02Ln3oI9dpncAe8X2WxdR1Q==
X-Received: by 2002:a17:907:9490:b0:ab6:9d92:6d6 with SMTP id
 a640c23a62f3a-ab7f33d1036mr294868366b.26.1739373852788; 
 Wed, 12 Feb 2025 07:24:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ab7eaeb8596sm269915866b.138.2025.02.12.07.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 07:24:12 -0800 (PST)
Date: Wed, 12 Feb 2025 18:24:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/tests: Fix a test in drm_test_check_valid_clones()
Message-ID: <c50f11c7-932c-47dc-b40f-4ada8b9b6679@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The drm_atomic_get_crtc_state() function returns error pointers and not
NULL.  Update the check to check for error pointers as well as NULL.

Fixes: 88849f24e2ab ("drm/tests: Add test for drm_atomic_helper_check_modeset()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tests/drm_atomic_state_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_atomic_state_test.c b/drivers/gpu/drm/tests/drm_atomic_state_test.c
index 0ab5d9ec4a75..5945c3298901 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_test.c
@@ -283,7 +283,7 @@ static void drm_test_check_valid_clones(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
 
 	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
-	KUNIT_ASSERT_NOT_NULL(test, crtc_state);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
 
 	crtc_state->encoder_mask = param->encoder_mask;
 
-- 
2.47.2

