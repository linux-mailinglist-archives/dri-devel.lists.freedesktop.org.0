Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B8A4ADEB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 21:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785710E2E2;
	Sat,  1 Mar 2025 20:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LRMMV06V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE21610E22E
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 20:40:04 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30bb184ab24so1160281fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 12:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740861603; x=1741466403; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/rrKZtC/bMyEQV7p861KyPu6bgZA7HKXFytfcKKDOBo=;
 b=LRMMV06VCrykVe8ZeEYmbzrnmQYXUsHIRyTPiDoOPWy3M4y6RYhs5X3GdPJr/R4FN9
 Jyt1amIAqKyYyEETKtQ6KxxRlWkiM1rseji7yxJQy+HPMUbrZT2bE7TJlFLtGtKV+JTa
 N4Af4Og+S8Ae4owysIlgiPtPLnhdP4+iGxp8jiYv4meVk7E7QU9np+ZXM5fix0XWP8fb
 GdnTgUnoIv7xeoRCkvOxcq5vy2zyLZGymC5wYc/Yv7IZ3v2dwpg9apVQJ3nzqA7g3Rxk
 oczyhYwpldoqu0datDPCXzMLdlGOg0BPL6xnxdN9FCSim29xDev2PHwRLQC9hKagsp2F
 oo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740861603; x=1741466403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rrKZtC/bMyEQV7p861KyPu6bgZA7HKXFytfcKKDOBo=;
 b=kj38Vga8x/i7sNHfsnQQ0hgoUL4jFxXI2wfJ63QcXi5NLQrre1hBdOlmBMwndNtrpT
 6VSqYPZlg2mYdAcjU1UOW02oVnLJ7fcPlbSqtpRyhlEprMGUP93Gai1JYwTickH5iWsB
 TBHXHksRqwGjgzdnpcRwitPbaC9KMa38uk4zfrqTHak4pXSTtluzaPsWzZ2v25i//zwA
 KPNX7z/vTX9q9oqvU9uOpfpiiYUVwwfR0+sCeNPPAIH0kFXpKuqMfsLVbJeeT3fwiiW9
 o3qy+LpSNOOzzcaFrT8h9iCRwk4kk5iC6LTXAd1NU8QPf1+mREUo2HayHs12e+IKdKpZ
 a8tA==
X-Gm-Message-State: AOJu0YylLs97Lr8juBu5jvYkkCRK7Yo8sT730ohVfoCtjUQrbTmfVJQA
 LDmAQWjcm0ba1hBvhl1jJPudLa2cuJaL39QXTJwuxm7kJHmdtOyd8XjfeLFcQCBu6hc7b70mEB9
 Phq8=
X-Gm-Gg: ASbGncuJkA6ri81F6Iypkf1GpdBx7m2RHC90GuAiCWAQx/vyFAWmFj+LUHlL6pwMtc5
 KEYuU2ImM+2eS/mmMn74fMy1q/UD87cWY/NEM+v4X0lO+dxvSlfHsG+du+/1jyfdHOYzOZ3O2YV
 hCWSUZZRvH8gDhm4poSNHG6hn7L9SI9ycms1TmXkGX5/wfuHyv3jRaYPxRQoonbGQ6tBZPRsiC8
 R8SXqtDn+1EIXxQ9StTO2DcXUq31BlcrSe9Fprp8Hkt9A6+7PWVQJDT6sICVZlmnu1dgtlkV4f3
 3dmb+sXMoZeRjM1vQaKQGp4UqDD0T+yB/ZcL0t0ATnF9e3GCwVUz
X-Google-Smtp-Source: AGHT+IGzJuIl1nriLCLHVpXfC1qxg6TocNRgoMvm3sF5xsxOv1PgMaKL1vLpURJQMUg29MdXarznzw==
X-Received: by 2002:a05:651c:b2a:b0:30b:8dbd:b7b with SMTP id
 38308e7fff4ca-30b9325c8eemr30950491fa.19.1740861602945; 
 Sat, 01 Mar 2025 12:40:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b931524efsm6668921fa.60.2025.03.01.12.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 12:40:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 22:39:42 +0200
Subject: [PATCH RFC v2 7/7] drm/display: dp-tunnel: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-drm-rework-dpcd-access-v2-7-4d92602fc7cd@linaro.org>
References: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
In-Reply-To: <20250301-drm-rework-dpcd-access-v2-0-4d92602fc7cd@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AezDpTs9i2rYRC6AeDwZvqAV87zlWZZG2GdTd51PPFs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rhggk3/sV12amrbT3Pe02nov6j6csCu47VZ5cXfao4/
 dVhquTeTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMxKGa/X+hwLufpUrF3SdX
 3LhoFNIVapbxLr/w5zWZ7wGZP9b8KNj6JTX38dnpAgV5MdbTipeK//8T4qjhHx03Ued81S8Xq9N
 GwSWXUpYXSV2wTg76x/C0v6SNy7o/J1XB7Ex53YUas69tWerxP4R9r5wQLjFvMWi9vPKKzk+rK0
 nyzGFHEh6L8Qb63PeZ7/Bvy5l1/1tNbQ1N/7lcq+H+zMWo0Ffwku3CfoHri9uFTWf/+KOtNy0o4
 dHPJ/fvVSYzxZecW/h+fprD6iPefqtXMi/hcuVs23Wqd+OjF4+bg+M6XxUfakub9Hep1oRiFe07
 u+P36vAbxNlfUVZfW/zGmZ3PuTWwVlmAbbv2P0OXXaoOAA==
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

Switch drm_dp_tunnel.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 90fe07a89260e21e78f2db7f57a90602be921a11..076edf1610480275c62395334ab0536befa42f15 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -222,7 +222,7 @@ static int read_tunnel_regs(struct drm_dp_aux *aux, struct drm_dp_tunnel_regs *r
 	while ((len = next_reg_area(&offset))) {
 		int address = DP_TUNNELING_BASE + offset;
 
-		if (drm_dp_dpcd_read(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
+		if (drm_dp_dpcd_read_data(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
 			return -EIO;
 
 		offset += len;
@@ -913,7 +913,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	u8 mask = DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE | DP_UNMASK_BW_ALLOCATION_IRQ;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
 		goto out_err;
 
 	if (enable)
@@ -921,7 +921,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	else
 		val &= ~mask;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
 		goto out_err;
 
 	tunnel->bw_alloc_enabled = enable;
@@ -1039,7 +1039,7 @@ static int clear_bw_req_state(struct drm_dp_aux *aux)
 {
 	u8 bw_req_mask = DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED;
 
-	if (drm_dp_dpcd_writeb(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
+	if (drm_dp_dpcd_write_byte(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
 		return -EIO;
 
 	return 0;
@@ -1052,7 +1052,7 @@ static int bw_req_complete(struct drm_dp_aux *aux, bool *status_changed)
 	u8 val;
 	int err;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	*status_changed = val & status_change_mask;
@@ -1095,7 +1095,7 @@ static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
 	if (err)
 		goto out;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
 		err = -EIO;
 		goto out;
 	}
@@ -1196,13 +1196,13 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
 		goto out_err;
 
 	val &= mask;
 
 	if (val) {
-		if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
+		if (drm_dp_dpcd_write_byte(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
 			goto out_err;
 
 		return 1;
@@ -1215,7 +1215,7 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	 * Check for estimated BW changes explicitly to account for lost
 	 * BW change notifications.
 	 */
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
 		goto out_err;
 
 	if (val * tunnel->bw_granularity != tunnel->estimated_bw)
@@ -1300,7 +1300,7 @@ int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_aux *a
 {
 	u8 val;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	if (val & (DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED))

-- 
2.39.5

