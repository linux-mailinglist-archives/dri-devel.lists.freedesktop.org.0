Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A45A385B0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4510E4DE;
	Mon, 17 Feb 2025 14:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/NEoYn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D6110E4DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:16:35 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-220ca204d04so57745395ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801795; x=1740406595; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RmMTq1yg3BdpG12biaZryVgitfDEs+8M3vo1Tg0fh1k=;
 b=b/NEoYn4EDHBBCNme7ksnscXAUsJt2fGWemXdxh0CSeEsggayxsrLaB3SuYjEk7QT1
 RQufi6z9izIyH+cUsy6TjQK+uAe2sIJx27hXigoi9Qn8Z9SBaj27i8wZtwY21IbZEu6V
 okAqXyJSVwbCyH3uJvc7Jvin5JbPP2dVaOzAadV8TLfnsAlFvb6G7Jhh542JGnlwwvKo
 2hUEFtizkPZ2cHpmCeYkwR/wE/BJCr3fOEr5t5jLlruoOzsENGWN1pF/Jk75tk55XST5
 lauSYY8SOj0hfkEvZOPJOOZ0XPsrodENbLhNqjRlOXl1O5iOPli7aDydQq5BkFIcQMUr
 ASwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801795; x=1740406595;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RmMTq1yg3BdpG12biaZryVgitfDEs+8M3vo1Tg0fh1k=;
 b=MV6C7zIzL991bauuvtC0vqAQSKGf4dv2VrZD4Ffy6e3Afpauiyy9XZAACXBPDZyw6Z
 LFgalQlh17gQyz99XL6PAY4lj7jtaCDIGW+unhluMixki2UdoIbJrnZ9hhyWzTRS8qve
 zON559Jgl55HBqehravKUnq+kL6d2Nuzk7hmJOAjwTTjzrTGFdoj86DMtIHJAojlRhv0
 bnWiI1i57y3sErPbuE/yEza0Er/4JUqBINC63Ua/Du9VYQV+8ow0sOeKkI5XgKkz2oAz
 D2CjDc3Tt9O2Yau/yCDmWkRuVF8Q+hyHBdvp3EL1iGNvAsJzXQ6zfr1dAdLedeLbgEZq
 tSSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzWQxBN2T3ofoL03Hi9SoyHO2Xw8+/TYLl4q5imKVE8Hlb1AV15/8lZLJVsxKBd/kUbnUUHF7AxeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs2hJghLGlcwTe3WJ1CLALnVa2uIKCLc8WH5o44fHMfONRx3Mm
 xCXqkKcE0yx5t8KN6A7iMmO6vmp3dUjhsK4q1vw0cAxikkN4MZVwcCOlCNmwH3iyv+mdqzJU8oG
 +psvsXg==
X-Gm-Gg: ASbGncvAUg9X1Eu2zE8K9Z8coQbf5axEmuCbV40YbdpbrctYKRU3ceCm0EeEoGZqKft
 2uvXyWF6PBdpbnG+vCWDFInRW/dWzhgtN2B+tROVikF46oYKJSmUF+16I2yltTyvo+apPfoHS3F
 xpFvIb+qQso2DAL73xQvXMxvOc3tFSgapsrixwVercRRIHZejIq9y6brNSYyQ1D+K/DLFvC9SBJ
 2ZikgaAnHgBXkSk1F6/CqijU+oMw68QjwBTSd7dGLYY8BTVB6Y2wwGlJbv8uc7PpY3gJuNIPzWE
 +l5rKdnbzl9/
X-Google-Smtp-Source: AGHT+IHTUhzBstpP8pZgLyNRseCksJ6qVR+zySk21CoPLmhQjIQggRR9jeoPxxbblipKzTHwuYWXjA==
X-Received: by 2002:a17:903:22c3:b0:220:ef79:aca9 with SMTP id
 d9443c01a7336-221040ac0cbmr146525745ad.53.1739801794601; 
 Mon, 17 Feb 2025 06:16:34 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:16:34 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v6 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Mon, 17 Feb 2025 22:15:49 +0800
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZEs2cC/x2OQQ6CMBAAv0J6dpNCpYJfMR4qu5VGS8suoAnh7
 zYeZy4zuxLiQKKu1a6YtiAhTQXsqVLD6KYnQcDCqtFNq5v6AhI722rYLNRnGCMC0vByjBBRBOb
 VIaxZFiYXIb3xkdLyYZczMRgLmSkDGd373nfGWKdKqEgfvv+J2/04fpj+YASUAAAA
X-Change-ID: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=5025;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OFImnrcWjNciYGwVZ8IHue4RaKWvGkRcm4ILoNytHTk=;
 b=fZZL/25fH4kWX3elYxE/IfiUQQEM+iLOfCeCeHsprloY3Z3NjtUbzGbj+wH3LXYCfbVJomug1
 scyt7Nz5rU0Byw6dQRLvgLzPqqwFZOKoDExH7GSvYunzmBjnjT4Y9bG
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

2 or more SSPPs and dual-DSI interface are need for super wide panel.
And 4 DSC are preferred for power optimal in this case due to width
limitation of SSPP and MDP clock rate constrain. This patch set
extends number of pipes to 4 and revise related mixer blending logic
to support quad pipe. All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
are needed:
https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads

Changes in v6:
- Replace LM number with PP number to calculate PP number per encoder.
- Rebase to Linux v6.14-rc2.
- Add review tags.
- Link to v5: https://lore.kernel.org/r/20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org

Changes in v5:
- Iterate SSPP flushing within the required mixer pair, instead of all
  active mixers or specific mixer.
- Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
  interfaces case.
- Remove valid flag and use width for pipe validation.
- Polish commit messages and code comments.
- Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org

Changes in v4:
- Restrict SSPP flushing to the required mixer, instead of all active mixers.
- Polish commit messages and code comments.
- Rebase to latest msm/drm-next branch.
- Move pipe checking patch to the top of patch set.
- Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org
    

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (15):
      drm/msm/dpu: check every pipe per capability
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  88 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  70 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 403 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 510 insertions(+), 346 deletions(-)
---
base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
change-id: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

