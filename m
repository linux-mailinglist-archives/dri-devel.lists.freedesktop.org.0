Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1597EB5BB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C1E10E49A;
	Tue, 14 Nov 2023 17:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E7410E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 17:44:04 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-778711ee748so378075485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699983844; x=1700588644; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/Se8NuL5JKZV2azJTKlvFmjep69ofpc3jvqTI1b0ug=;
 b=BDnPmtFxEEVYQVOixFyQ9TJ/8QFowZJ+JJa3VlgIOjlRJyVQtuEjqZySVV0ttt2wNl
 ai05UaV11q3UFER8NOtN3VGkHjd3TpAisItLSUNTxPjugFzFqRH3YrnvUfIwT/yIohGZ
 39D16tOPqFbkLw3r1bTjBG6h/h1oFa4vMTl21zCmCqNQjyWidMVAtwZ7XkSNXG54oX5P
 /IktQd4bCs1/WEsMphARtGKy0AMUaqy/L1nOnEKLCV9krYZ7N+iupURmAKN0qR0DnpuB
 xhdaJjEPWNPLs7qtgumNsi0wYvIoDL1kXE3phRWsXd3PVQSJgcu+X1Ezk9U0HtMBLddT
 Z6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699983844; x=1700588644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/Se8NuL5JKZV2azJTKlvFmjep69ofpc3jvqTI1b0ug=;
 b=DaB2O1SlgkxhpyzDBdHBWQZKBbzthg60BY6t0QJxJUQELhnT0zb+WbihxPxkfORjsP
 dNut1ODg5hbWPgD/EeaU83SVcv9oeRgIsVM2xth9bjTCXcL+cEdgVAtq/3VJ3CFba5fp
 VzW4tY5JNsoUSUdjuJIyYSEn9Fy/3SAPTNZlGkWLQ/C40cJx5iIAssi+oP49X86HJ7aF
 GJ9XTmRRHDTCYOcDknzkgg3WRv2gooCQe2Xm8+1tbyqcpAhF19BBsECfgtTuWKbVIGOo
 C3YqIBUNHOf/ZRwPMmYKh80QzwMc1CKkRtaW4Ce49wvZ3N8/e6s4ks4LZV3Njj139IQC
 +Bkg==
X-Gm-Message-State: AOJu0YxnnBMqwfd8w/VVOFkasUzoBMeK0xNenNnrEvbxqijZdiuLWSt6
 a18dg2jXkaO0ODeZYkBjaSGQOQ==
X-Google-Smtp-Source: AGHT+IEVo5nwOKH3fh3lUeHfJPuHsZveyp2ikuoOIr0IRzcdZCJpfEChO6qWMjdi051wikBpH2Rarg==
X-Received: by 2002:a05:620a:4627:b0:779:efb4:73bb with SMTP id
 br39-20020a05620a462700b00779efb473bbmr3357188qkb.41.1699983844031; 
 Tue, 14 Nov 2023 09:44:04 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 09:44:03 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
Date: Tue, 14 Nov 2023 12:42:14 -0500
Message-Id: <20231114174218.19765-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114174218.19765-1-jonathan@marek.ca>
References: <20231114174218.19765-1-jonathan@marek.ca>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index bddc57726fb9..2ea2fc105fbf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -875,6 +875,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
-- 
2.26.1

