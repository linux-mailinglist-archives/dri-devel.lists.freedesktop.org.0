Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF7A25788
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5210E479;
	Mon,  3 Feb 2025 10:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ey4nQLgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A0B10E48B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:58:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso28674495e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 02:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738580303; x=1739185103; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=Ey4nQLggM/l6QpRR7bmY0GBK/HZYu2ucbXVQR+FXAXH+hUUHfcwwkrZF2AvZA8von9
 YhsaTwy+65GdfGYJ9LiDqw7avzdcnthK3nYYJx6wS8NHcMXIE23w8TmFCOd/qiHqcd51
 GHYtxF68StXj6zH6/L0b+pkGbfeT/CfH9QzkWOWc/m5+H2tKqHen7QqxtDd5+u5ioGof
 XGjOJEJALTrVSAqHvw28wI+eCrJVRfrJXAJA5fB0HN1NB6Gvqn4LQ2/6WPo8i51xuhNH
 fn9yL6AWSbaBusuaDUyXu/BhyM7bEBT80gFb6tfNT5W8kHrgAbEWpefiSkn0NXjiVpZ2
 Zvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738580303; x=1739185103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=J+2WsOhT4Ek8E98FqHkbw9UylS9yHPTahg3q/q8XARpNC9oDqFASDS96I8JNVKKbIx
 J19z4cdS92aUfdzSy3WZKNqf8l7wll6M1Wt4Vtiqzg/ybkPC7FuDgP8Zkfc27F1cvYsj
 2+ur8QG9jZb/2AaLhlqBB2b89ymrbZatKcbM/FbrWVvCzwjrtj7Y42hA2DWZMISWC7GF
 5lf+D+XobAJyKnlsGy7Zd7jaSiqRwWJjoqRAoUS9R6bGvmR9uEp4vTGXUnBewxvtodvZ
 F34Cu4s1gGrC232IK9opBHlYirzoh7fWAklO6/UhMiMNWyUWoSzttVtcMRIFRdzlvPIr
 rwZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsWR/HvpVQraZ3zGoUP7zni4U9oKrT6EafPFJwf4f9OYQTkh/xPc3z3f1vP9Cvtsq7U0/uK8CROtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnLpR5/yU0GAktJV6jd0AaHfPKieQze7wgKRb0rnaJ12TMyXxH
 vY8DTICfS6VCKyGxHUHY0E/vwYZ7FEzsjLyXG0afAyGRCLo4LcWHrJ23Eb/wqbQ=
X-Gm-Gg: ASbGncuoFEDISGw6dt6+3qRLt79ewhijd2DJ/iTD8URtW/DVT3iKlkIfznKotxKMvU9
 m9KoiumpX2JbDf7s5ae0N7vFZye1b8jeyJ7iXklrDmOYbJiGbtO8cHKE1906KK4C4NP9FO1SeQl
 AWUtdv9XI6UyzOFD6Kjn/njEBHJOebmOxWu9l5rhTFKJ5/zT6Vmh/U8So5Jem3SWDwDd2cRpnb1
 bI2EgGWUekpUR8/mUburs0cNiEU5Sq558Po8IWftmPuOcdqjv991oPI+DCKj8/hC8mICIV5ILN+
 vg1uBCERvOPDzv4=
X-Google-Smtp-Source: AGHT+IFthNBbLjS02kgsZVYwGukRDHyL+VpzJLps1CtcKLr/74/ZMFJ692muUaKO63TfDrMyjpuBEw==
X-Received: by 2002:a05:600c:a44:b0:436:488f:50a with SMTP id
 5b1f17b1804b1-438dc3c877cmr187531275e9.17.1738580303507; 
 Mon, 03 Feb 2025 02:58:23 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 02:58:23 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:57 +0200
Subject: [PATCH v5 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-2-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFFwp0Q3Pa0vilB+WV1NstXg3L+NhCg1dZF4
 9nljGvt4aaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChRQAKCRAbX0TJAJUV
 VrpLD/9KZyQu8jIhJYXTVneqLeoUWkoZlTZO4UcXbLROqhAXzJHfoudtKqN6Uo7EBphzOjbqXkw
 L8V+j/CO9idN63ZqcHf5mQVmuMbjNWkvIeCsMq42M6ZZUmACXguioar1CbFgHQ8E5OB3ianHEyo
 ZEHBtewoLDvvkXGlx3Dhb/8MfMTiYeF5sCXozl5qdc2wrPhXO76+U+tpsexdEQxTUK/9iVE89x8
 sQlehJqfxHeZsz1PaavyvnQPc+KVvbdFdkwFfGWPYbSFn/TWOSkjIF64HS8q0tjcDLBDaXEr4yJ
 3hG+Wvz8DC9sXLujBQLUZXZIhqAdcPWUfiBvW5BZUB6B6Awfu0UwoRjExTQfKwqCOYPWJIXMRWq
 XbMkXFpQno5vlWWimF249S1Y9vIUWhyJro/PosAXnBrUzNzjS79NpAqD0GuP+vmBod/t5Ls/p10
 9M+KuiUzWArjDa4v0ZnRNhI4u+OUeTTrlDC9KGoKvArCLJwhmhkPaFQ5Kh0Za84DPk+SIcH3t8A
 u6SJ5QH/UTUb0MV3fg93+zQPTV4ZrYguUN4qyIgiulEbIPa1hYwBNs+96lfizy3+QAUO58clj/D
 PjEX7lpaZSm1/2PAINaciL/swbWOOjlUQMlUEe7fDoN+tTtc4cdp5Gcig7ewkuC47gVY46TdH1d
 raWn+ZZSSCri46A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1

