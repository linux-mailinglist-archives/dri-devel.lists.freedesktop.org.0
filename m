Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6FEA1A475
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 13:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9942110E7FC;
	Thu, 23 Jan 2025 12:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="STUTsGQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7508E10E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 12:44:58 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so8343061fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 04:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737636297; x=1738241097; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBGx0pJ6DuzAZ6r4ZXbTDW8cZT3/l1BOJrqYDAamGOI=;
 b=STUTsGQlSWwLdu86Wu+h8FBjhIwkdjC4A2J6TzruP9FrLPngJqhbjqBrhYLbtiG4j3
 S7mTwf38qowgMyQoRWrgH5x0DuTtzVYQMTrCN96PU0aMfFTWrwhWPSBb9ZSR9oICaR4F
 omxECfXrLiHCaJlya3yazmrFt9g2PV69DQrvgUW/ic5tFoujbVNqweRjFrXIQHGfI5K4
 Xb9/jo8xUd77knGuClrlvppG/wKNK6x5AJFUh4znKPEL7o8Pq9wDeeTfdzaxOFGV4Xrc
 qd5dJK/AhMPJwG7nba643krVMq9IsvEjXCWkjwT0pEz7QPseOVh3DNzBUArG6TnuGZIx
 8BqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737636297; x=1738241097;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VBGx0pJ6DuzAZ6r4ZXbTDW8cZT3/l1BOJrqYDAamGOI=;
 b=aScS7ZOYu576+9bDxf5OomqR3+W0TdEM29vbm6ylsFm/6OycvDOOineHVnhf2/ymMS
 oya6FtwDTfbI2G4aqqSuVRdnYO+JVXSq9H3LDKchN7WYU/78UgU4rFCHb6fpnF4+xgM8
 olExWg68FgFp1RC3ilvaGQLnpZDIxU7ZOTX77zalB/DPtHsWxIsBwi2xerH98QtLfFbr
 Q3MlYgwxUo/xkPL0XA8Ngs8yqCYCezNor1/fdfU4fT8CxiC9sKOsR4munoe2vcQpQR6q
 Jc5ZiGd/ZyaOcks5/vCohKPU1YEA1RXqOlaPcivEAdCntdS/VOl6TZE7DYIPkTI6h+qv
 x4wQ==
X-Gm-Message-State: AOJu0Yy5TQOfHW3nWG15U/DnG9piH7IDtjf1f5ZXBqf5u6DPpDQr4Blg
 cFsp4bXQyqITLhQddcld/4bPU6KePts2HuB3kbzNnUjSV10E4QF2eSrK2MW+9OYNB847a63G4r3
 6SPY=
X-Gm-Gg: ASbGnctwTVlc+Pa+CsHOhafgUjOwaT4p4dWBg9d/Pb0ziWEpR5GSn2ppS8QHJfAcmSE
 Q+3/VAgURyK+MTJ6QAPrktQ6SiwHBGc2WBrj9ZXHlhjqIesh7DU4DDkYKgXPLhCIfqHBfNypQDW
 1SDXuAzrXJ+YFoEJLW3+XCTxbRaGnj0TLKRkVdiOKNWy8C6OaoU85o0EXE8yR21p3I6JcmLIS5a
 g9Z8SKHn6DnTaNT7nCEhUR7q4+lM/jAdrKVzcKs7qQah40Wa9NLqZ2pCAPfMuKZSwv3kDBkWv24
 I3dvkD4lw2Qk
X-Google-Smtp-Source: AGHT+IG3iLOKNh57If1JEXvmH21GHFRde3bWIOleZOnKeL2gbIgpP2Dn8w8RPp/ksU6ITD/Az7ZXuQ==
X-Received: by 2002:a05:651c:b12:b0:304:d31f:2fbc with SMTP id
 38308e7fff4ca-3072cb817c5mr88941861fa.36.1737636296655; 
 Thu, 23 Jan 2025 04:44:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:44:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/dpu: follow rules for
 drm_atomic_helper_check_modeset()
Date: Thu, 23 Jan 2025 14:43:32 +0200
Message-Id: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ5kmcC/32NTQ6CMBBGr0Jm7ZgyKj+uvIdhUegIkwglU0Ikp
 He3cgCX7yXf+3YIrMIB7tkOyqsE8VMCOmXQDXbqGcUlBjJ0zYkInY7oRJcNR+848IJVZcq6dVR
 aLiDtZuWXfI7ms0k8SFi8bsfFmv/sv9qao0HDZWFvF+64rR9vmaz6s9cemhjjF2e5JLCzAAAA
X-Change-ID: 20241222-drm-dirty-modeset-88079bd27ae6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Nyit5/PcakRGG2zBgKaMVblTWEFKcp9Xc8vegGFDe/8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnGAk6lcw+a8f/ppbmRkD0F0hPL6Y0pGnznE
 +MxVqrv8Q+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xgAKCRCLPIo+Aiko
 1QivB/9Eq+ovxg6lDDNzT97VfEQQ7kaJEY5IZcFlgG/479UoUWv985tRuy+PlAKkkG7Dx4s7UKi
 VBtKSx3gAw57qmEzAGQ2go8ZdLW1tdI0VSfNBG7TlitMgm8LoS4UkK7NP7quElO2IMzVn8KX/lb
 7WDKrkVkiijoehCceTzrd4ru4rrMdU+kYQOBP/Lskd9+nSPZmBqj7bFWH6KP0Cvv4Gw/f6zuwmf
 pI0/mEm/MIt4PKaezagw5UFmVps25Ru0fNYgGPg7zRs/pQAxGFZ9lMc/EOhaBjXAqehLR4MT427
 cxfNUja7++zAivWmtaNYUWo6JK8zIlXRzpX6DK5XgISn4omr
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

As pointed out by Simona, the drm_atomic_helper_check_modeset() and
drm_atomic_helper_check() require the former function is rerun if the
driver's callbacks modify crtc_state->mode_changed. MSM is one of the
drivers which failed to follow this requirement.

Rework the MSM / DPU driver to follow the requirements of the
drm_atomic_helper_check_modeset() helper function.

Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped drm-core patches (one was applied and another one is disputed)
- Link to v1: https://lore.kernel.org/r/20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org

---
Dmitry Baryshkov (4):
      drm/msm/dpu: don't use active in atomic_check()
      drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++
 6 files changed, 101 insertions(+), 35 deletions(-)
---
base-commit: 2c38461deb29fda236f40950f24d898c49b04e71
change-id: 20241222-drm-dirty-modeset-88079bd27ae6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

