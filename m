Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD59DEE86
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 02:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C915E10EE4E;
	Sat, 30 Nov 2024 01:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U5qZn6Ux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20510EE4C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 01:55:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ffbf4580cbso26220131fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 17:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732931729; x=1733536529; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IUEcAbfuBPO7l5+gt8OvRpERGEOEeXxRlakeMrm+69Y=;
 b=U5qZn6Ux9mqtPDwzAgkO3o0gjtPY/QIt+gBY/X/C+4lD0feLR/D7l0lKeUJu/zkgS1
 dEE99mZv8rtpb3WHsAaemD0xbNbOCORW2tz8xKXyNiLPJkTM9WTy4TEjb1PR4pzE1hIK
 tFWI1I4TYYwuMHuTJ/OFcZRUaSfO4WSR6ccoDKLHlTMuy+nWay41qnYblD1TJwREdzrp
 YIE5QIgG/WLlPGGJ1u2SMX7k4z+w61IcEhYL2iIWxPTuElQWR5seqr4nVmH5Ls5agAFW
 N8IGXqOPZo+/eBk6O55HLJ9aOsEfVunIkd4cztnIixZ0F5x/Rp262AiBLe3M/l7y2N4B
 70Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732931729; x=1733536529;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IUEcAbfuBPO7l5+gt8OvRpERGEOEeXxRlakeMrm+69Y=;
 b=K6spkAMx38YUh7OYTIKcqExZ1XxkXgF8mQiBqzT1WFeM8SXuXLiaoE1ucgzfl4j8om
 eQb1Ffak/jHgU0X1dHqzCKHgdkHMxTlfugRVn7gfflRmct5w0aw/nDjliiU+Efw7Bs0V
 zEsjdcmuyyR+z4aPH9KheWEprwFRv7KnYaIOn9MsaKdDq5NRqUAx273cGXK/Xabf/BvU
 12h2d/OUQrnGicQ/iJr4TCuVU8yrUYnUI778r0G2YmiJZ6MX3cCsLlg6u6Y0l+zC3JcB
 NtV0uUY6EbJSJoBL4gkUP/jfkZa+MTW5Xcy5wxe++b2AdCdznx/yzQnDxMshFPSjXAKM
 szZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqUE27e7NuDHT/MyG3kbCf5+7xFOANx+yOAWUdgaFJgGV2GMXD58etAdY9Czqtklmw/BiSKhcbEjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuvsKR5ioOU514guv0o1X7ryfuYG87qosExqDaC+86Ct18Ldt8
 8JiX8oZ7oNgXoRhxFp2PBtKm9JTBhExmVcy/k6B/kSH2E+4ZKcIxytJFJLrdfpY=
X-Gm-Gg: ASbGnctCzG7MzRBhBHQeWfzB1taUvXbvzE5ul/ssBe35xuFLqyExtpREEzWs6gIPjjR
 iDlEL3NMBIZh1aMkBAfaSE132A1ZDCnre2uivn64IM0/EkmFR/JWKOIX/qOnbu3XQD+BU2oGVVs
 7DgtpDIfXJ7BMzTdDqCPcLN5bh6/VFL1Xv2z7oBLJ570+uN443yzYWlSR/M39rA+5Gc93xbwElY
 CkvIx2aCmx8DuxRj4yV24dxWU00OvHtYFtH5oORQ5gce0llPF4kzhBFCg==
X-Google-Smtp-Source: AGHT+IHOqKLHvt93hDrBLQHJsz24OXfaq0tMtK/gwb31csC9y6TkKpbJBJNrYlaSsNcduvA1snTmhA==
X-Received: by 2002:a05:6512:b9d:b0:53d:dc1c:60e4 with SMTP id
 2adb3069b0e04-53df00d112fmr7905016e87.21.1732931729176; 
 Fri, 29 Nov 2024 17:55:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6430cc8sm635601e87.31.2024.11.29.17.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2024 17:55:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:55:19 +0200
Subject: [PATCH v7 3/3] drm/msm/dpu: include SSPP allocation state into the
 dumped state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-dpu-virtual-wide-v7-3-991053fcf63c@linaro.org>
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
In-Reply-To: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0H6B6m4YfEscj5/eTxfCR+sI5ay0GD8NDcl46LffCeo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pXQbvK5u6p0guEDC9uusod3qr5+nq35q6ptWffRLCIi
 hTdiVDsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBExL04GDZP27Zrs+uNCgef
 WRNuiti6ZDYY8UQ/5Wa5/Jr33rKSpPAiUfm2E9+XdxUXbE1y5hHfpl8SJhEs95P1z9t3nSm+Ijd
 8kvwDr9m55djvE+FkC1q75o3Dm01zjgW2axoZBTx+nfV47adveZYsmqW3DMx6VNNY9biDgh6U9D
 BViva1X78sdMHI7ZNj/PO9k2XjJr+2bFf0Dpyt6leQ+2LnnMUK/YxVu+rUPx2L232wm0Vl24VlK
 25eDXOaxPToq/S86Yk+zwRjJQ+Kt3zpUCq9Z/vpTaPy+usb9e5/cjwUG7c76ucKT4vZe6es/B0S
 kHXu3bPpoclmfz652NdsS3v/t4FFvUWvJeQX4zzrikVbAA==
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4964aa92ce18f9da3b9ca4e599b13ffb02dd81e4..278ed58004f655e20f8c4d9e84e92d0031f7a105 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -941,4 +941,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.5

