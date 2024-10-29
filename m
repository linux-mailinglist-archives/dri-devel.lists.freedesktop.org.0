Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEEC9B4F46
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 17:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601CF10E362;
	Tue, 29 Oct 2024 16:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UVjL9U2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274EE10E362;
 Tue, 29 Oct 2024 16:27:06 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id
 ca18e2360f4ac-83a9be2c028so211087239f.1; 
 Tue, 29 Oct 2024 09:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730219225; x=1730824025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ASoQSKASN9QgOSddChzWC0ph+ezd4/BJV7Zk4X4XopE=;
 b=UVjL9U2i3HXBMIhRjfBNVgWe/5Gqqt30Ltx5+u18no9fzTFXjMG440feGwOwPUK+Ji
 het22bv8oZbCZUfNX8BS8Y9tnici2OK+Kqj3zc8v+E1F2wTwvUdLrsKJj4T0FlZ1seir
 NB/OdtAs/Xlk7tcZPPIxTZmnFxIdduyChjHhSIxiGRRSepr/mVue8y5/gJjWIcsAEWMM
 9tLZQMPzGdbbYwcQE+VSzdbOoOs14nryGFxnsLd2celWdMDQRZpqtP+0eEjr7yPLvelq
 KrjnJgO4b3uCre0T3NlQAnEz3+rKaiqVDqY7ZwYoOPz72mDjcwnglZPq9Ek6N3AH2IdC
 +E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730219225; x=1730824025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASoQSKASN9QgOSddChzWC0ph+ezd4/BJV7Zk4X4XopE=;
 b=K26FmO7DdVJpJIaqNPozHkhuUf7EJO2uKVAnJmUGAbpGdmMj+Ol/yQ3HgMiwU/z3Pn
 ZcdP+k7oUnje2tUKpfBxNoriTu8Q/NhCKonNB8UdI0w7lXd9VGgdsDoFNA/SmPdEUKmF
 ohG8V7j2xrs6Tl6EZL+zudwCc+Ub+OY82+8z8tYIrccUlAaySzuBzBS3+tZrb7WUEslR
 Zns8U7Lh1k6rWcoVhAl1HDqKEvnfUm0p0305PG1QcswTspZ5bNXPzdJog6GKFVLG1MRZ
 PontevIG7PC1yH92Vsm676Qt34IBkxHvmRQUbZ5gy2f3VMYV1tZZGD1lySZonSKDIw0T
 puvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbkxYdQm7qSrTYsIFp2E/uZn/VFl0AtVB1mxwFtXFVZhhYvCPcFtGAv4nOBU/lHtKvfw/N/XyXmTTC@lists.freedesktop.org,
 AJvYcCX7P9KTLtjSgttwDj57DXY3XFJmosGWJZvD+f47IE9fyFR6UeWe7gFJNB3dCJ7ORQ/e8G2UudqwNXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCrlBi9pHVYcVp0bCz+aC3xKAiVxpbuRO3W3NfJxj1W1W44FqR
 Y45Pmu83h9EyHsc8WTd/L5X3wBvuZDULZ/pQQk+p22JLRbe75NpV
X-Google-Smtp-Source: AGHT+IEvtrNyNDg6roCPZ2SrcBJ3nsv+OgsLL9PX+PAZYjyDrP9VBVQKmfssIDDcJKdr59gYLOKekw==
X-Received: by 2002:a05:6602:2d87:b0:82a:a949:11e7 with SMTP id
 ca18e2360f4ac-83b1c4a9226mr1210900539f.7.1730219225039; 
 Tue, 29 Oct 2024 09:27:05 -0700 (PDT)
Received: from localhost.localdomain
 (host-36-25.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.25])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72751513sm2499769173.108.2024.10.29.09.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 09:27:04 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_kalyant@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/msm/dpu: Cast an operand to u64 to prevent potential
 overflow in _dpu_core_perf_calc_clk()
Date: Tue, 29 Oct 2024 11:26:46 -0500
Message-Id: <20241029162645.9060-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Zichen Xie <zichenxie0106@gmail.com>

There may be a potential integer overflow issue in
_dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
a smaller data type. The result of the calculation will be limited to
"int" in this case without correct casting. In screen with high
resolution and high refresh rate, integer overflow may happen.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..260accc151d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -80,7 +80,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 
 	mode = &state->adjusted_mode;
 
-	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
+	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
 
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		pstate = to_dpu_plane_state(plane->state);
-- 
2.25.1

