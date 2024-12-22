Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4C9FA3DF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 06:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8622A10E22E;
	Sun, 22 Dec 2024 05:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FdLRBPDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20D910E22E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 05:00:50 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso3207238e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2024 21:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734843649; x=1735448449; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WUHXS68dzii47sCyHoBGO1JrTDTtIN7oWeXHXt5K2JQ=;
 b=FdLRBPDlJALebWHnQEzU22qjARSwc3myCFCpjyYmxrPgAcOdZ6uAejtCvH2hVMKV/X
 X2SAU70YStKGGozzEIqJuqXkAHX4UjdkV4AtbWQpo95n7jUXVh5ON14fSCcUiq4y9IQa
 u+VLcHQZGOOHMadbwx8XclF5tp3r3fOFEoE6+FjLHQWNBMesBgaVc8P+apKnSQVVOyji
 1CRoODcAjDiv6WZII1AzRffT33zB39BdQJWe6mTKETdFxjTWvjuJJ4sDcnQ1djKbJs31
 biDb6VHDXftEk9Jv2+ka/uFxBEtwCfOuauARp9FtwGK0j//+TrjAPU3Yb5nPLaRd4Up+
 BMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734843649; x=1735448449;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WUHXS68dzii47sCyHoBGO1JrTDTtIN7oWeXHXt5K2JQ=;
 b=WAJWeVB8DFB3Bt1WF/F3LgWl8EsCvho7jnBCGRODG/LGYh+8NbrHo3oAxokXUNw9ZL
 f/BPTiZhWef6dfy+e9lZriy7CAfG67vDYjALH65GZPRLR63yZIwUJfIKGPmrRt5CP5JW
 QGE8t9q6Q4rmyFkTBI7degahc0NrdGYpr5z8LIqBpilbNMUcN6IHyt3vBu1bbnUTIrz6
 apHMVEM3p6rjvPp5HU97tHGkm0R7eXkiYnbaP02mK3DyMP8xLXDtJ0E3tbZ3scSxI+3x
 CjuxiTspEPN71fCDh51B4dAVMmTc2NHgVU2EUwDhOgmecyGlu9AmfXD3AtVXC2FJpQfh
 A9/A==
X-Gm-Message-State: AOJu0Yz73WUaK6pWyC5m+cH9/wOGnAHpgoC+wAIttAgH2rkiO49rqGBq
 FvorJKUut2nnEALvEJThABxz8o5Ks4fG8at3D/6hCiPRYWFk9KEDVuojpsNO+u0=
X-Gm-Gg: ASbGncsAQLUG1JiQxga9rYf0YKkWw7aHnzDR800ooKimZ3g2++58tMepp5SBJu/pqWF
 ho3OmOagEadDi8I9zC6Ll2bMQmdca7JbzFIpYyYhW4ymiy1LLcYgpzGFpCh3dJXyGXKmGikg5Ye
 zLNa3Zx3CAfO2Hx96TWtNdNwRK9AilqqIAqlypGYcOG2I+dkcbaDyLGrF0UQz8RJqD+iyxQ7hxb
 R8p9oXkz/KbvIACtiqO68mSEIG8qKkzL/WH94J90ZSqWdIev5/DZrzpdL/X4qFu
X-Google-Smtp-Source: AGHT+IF+Pt1nCCP5OVvGkhTdNXEz4B1kunIC5TH+Ahw6Mi+g/aUmHdjgPeeYunkjxCOH1d29CuDaLQ==
X-Received: by 2002:a05:6512:31d1:b0:540:1dac:c038 with SMTP id
 2adb3069b0e04-54229524fc7mr2631228e87.1.1734843649198; 
 Sat, 21 Dec 2024 21:00:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2024 21:00:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:41 +0200
Subject: [PATCH 1/6] drm/atomic-helper: document drm_atomic_helper_check()
 restrictions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lEzV2DFxHSmrj9mC/gnIKltRLYW/iHK8CYgZvjQpABw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7nPIekJhdnUK5YoeVX9bvlTyiNvqjiLjxF
 HpRt+nQbpqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1Wr9B/40R/wzCdA6LcKR5piuLK5GBYyyXYi+7z6d1Ml4lcBIde24q+/8h69RHvVODCvzFYcRG43
 RU+/30LCutV5t2i0fS2sc/ZDYUFxAsLkUADrXK9YswlbqT1K3Jscky9S2+TWLxEskNFPwP5GSUI
 IumfzysS9OagOKAtHinV+1OOi4rARn7NsWyHUOlqiIedR1j+STxpB7D3J/dwHa0EVHjQrl2YTVS
 MQ+WKXsWgN4uLX0K1jQXgpBSXgVYUyNjvqBEVOqT9GjEGdhPP03CHccy0hZgR93nPCV93pTP4Fg
 Ao9XIaGu26sfYfQPSBiLeKSV6rEifwYMjU6y0AT9T6Jq2tOk
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

The drm_atomic_helper_check() calls drm_atomic_helper_check_modeset()
insternally. Document that corresponding restrictions also apply to the
drivers that call the former function (as it's easy to miss the
documentation for the latter function).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a503701e228e382cc45180b0c578d0c..f26887c3fe8b194137200f9f2426653274c50fda 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1059,6 +1059,15 @@ EXPORT_SYMBOL(drm_atomic_helper_check_planes);
  * For example enable/disable of a cursor plane which have fixed zpos value
  * would trigger all other enabled planes to be forced to the state change.
  *
+ * IMPORTANT:
+ *
+ * As this function calls drm_atomic_helper_check_modeset() internally, its
+ * restrictions also apply:
+ * Drivers which set &drm_crtc_state.mode_changed (e.g. in their
+ * &drm_plane_helper_funcs.atomic_check hooks if a plane update can't be done
+ * without a full modeset) _must_ call drm_atomic_helper_check_modeset()
+ * function again after that change.
+ *
  * RETURNS:
  * Zero for success or -errno
  */

-- 
2.39.5

