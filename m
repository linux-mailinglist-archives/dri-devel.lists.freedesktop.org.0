Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53080A3D68B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDE510E91D;
	Thu, 20 Feb 2025 10:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zmUOyMUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC5F10E91C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:31 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5452e6f2999so804488e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047190; x=1740651990; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ff7ItJ+SnMHnASEHcZ5O+TpGECb0jLJ30NNOzaJgwmg=;
 b=zmUOyMUasW2cjhhlgx3L3FzYUjxSAlgKteSLQJ6jPTBXExmOXc/ORS5/BT7WyyRiso
 VuxRuJrLMJ8eipWfI8h4yAGQetGAo2TcvLlED6Q04R7omE3gAVREjtZiUMQhllhqZXcR
 7j2ysWtKI8MhhcFuNP57vZJ/lKgtLjLrz4t2lS/tui3m2fc5H8TlJmg429NML0LnRWk+
 M4+9CvSE6w9ab7pBeLuY+hCnrok5eDFR/55H5emm5PJ9gt54WtvI6rNsU4J3m42FVzmU
 zvLyloF9aBbLwPaBsD8tsB5NLDP0sfhvmzUD7unLXNpnMofN5uL6LQIzD7lYNwGFfr+B
 8pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047190; x=1740651990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ff7ItJ+SnMHnASEHcZ5O+TpGECb0jLJ30NNOzaJgwmg=;
 b=g0IuO0t+M91aLKZix0HPJbmkSXfkPmjndTIi9qWmfnmbarTkOEnkjmu5dRWgvsYKT5
 J+2qFg6uXlVY7pj8ku6ctlw5d/DCmQXxywbbaGHoJ8kZ+jrBY3I3BuyZAy/RpAqGL6Qn
 KsZz2cLmdFlYMK1Qv8ldPyH5SB3wwnBmYEqKr71qWCaO5tNam61+YtSJw0IEDRtQFdiR
 J2v07127vwujXm+srjql3gSyGR2h8+Qsy2vSlt2l8fK7bPI1KOTdWwlWUZbCfSC36kE9
 90KHBwTT4FQ2L1V8xFM/n5FpKSKMVbl92krAZC/437aqAaAJA0+e3VRXD6Flb0goOmjr
 xxbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmxfUcaw25mBq0GULSOpVBnVSdwx2ioeFHcTUR0f7WOprhzMzKmTrnbofkt/eI1XdvjMI96QY9HW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8tWMQf7VpkliUBmz6KZtD3brRIcNrfOGuA3gmdnfypZfoB1WP
 mcVpqiW6hsmB8wsses4kcWLVsMqkxlHbrT6EkRp4Uj4B2R/DxTPeh6/V5uMC7Ic=
X-Gm-Gg: ASbGncsvPcNP2F+n9ZL7GvjnVGB3461NZNw4MLTY/fRVULx+4UOyC0Iu+3LYbvitfUe
 1abefOPyf5V+x6w2N9rhKN3/iXC+Bu0/BsY3TAjdRQU53XOYP8rbZKf3hS2sx5v/Mg8WAMRAaQ0
 EIirz9xWYvwN2ue4/G/pNKMxfvgDpvUY+a9qa7aN58X9Wcik8UBmoF9AWioLuvPebZr+jdQ+few
 ORXsIptCkdbRD6Rx1UD39uiJ4Tsnbq41xSZWoYrySPmGRKFEfIh/3ry/ns7cHnTfIZeqUGH0wFD
 PF/4VE1W34Sncwl2/gAjKRI=
X-Google-Smtp-Source: AGHT+IHBt9HzRKY8jmkakzOnUvvbEh4NOe+or6nzqbYZMeRyoIBCIJTZbNW9HUfXavUHGy8LrqzxzA==
X-Received: by 2002:a19:5f1e:0:b0:546:2ea4:8e72 with SMTP id
 2adb3069b0e04-5462ea490bamr2874449e87.49.1740047190016; 
 Thu, 20 Feb 2025 02:26:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:21 +0200
Subject: [PATCH 4/7] drm/msm/dpu: use single CTL if it is the only CTL
 returned by RM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-4-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=R+chS185SijcfPYYCgAaRcXeK8VYBg1VE8B3d9ZjF0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNKH5HPpczCu9L/5cp+mmYPkPzXuoJvH2zlI
 /BJSbMIVtaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSgAKCRCLPIo+Aiko
 1U/bB/oDpQQYxShoHXWOQQeQDRt4B7KsbhHYKFXsqWyzLIMbrhA2+AYfan+s3Yq5pdKzRTf3LyU
 0hiFB09nCcmi8MDPcXtCiN+eDDJWkISat3ZWao6vEH81ToCIcb5opY0qewxzHsl2BB6ytR4DrrP
 tZLETlHLLEHNswnxDMFE3oQuVO18wQdNR8OItn7QnvTFV4vRr2OZly04xb6qfeWXVSaIs2TTu/q
 n038iCfbHa4xGdJ7qeiIybTB2quagcnpfdvPMe4onA/rgYIOlI3BSXZZtpWIhvX1VokAzA1oZX8
 zg4wRffj7liG//1uxiAL25vyvqYRTEGtI3vPaZmZhoWIYRcb
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

On DPU >= 5.0 CTL blocks were reworked in order to support using a
single CTL for all outputs. In preparation of reworking the RM code to
return single CTL make sure that dpu_encoder can cope with that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995a154cd88d05c3842d7425fc34ce..666a755dc74b41b79fa1bb2878339592478e4333 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1283,7 +1283,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		/* Use first (and only) CTL if active CTLs are supported */
+		if (num_ctl == 1)
+			phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[0]);
+		else
+			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
 		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);

-- 
2.39.5

