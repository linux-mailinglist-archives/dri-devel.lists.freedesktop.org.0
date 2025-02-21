Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65957A3F871
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071010EAA7;
	Fri, 21 Feb 2025 15:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oX2pz/HH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50710EAA3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abb7d5a6577so27074466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151512; x=1740756312; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uETEnzxXsrcxJw343miABNyaWXgTTRBWJcaHZGLuMIQ=;
 b=oX2pz/HHlLgchaJsNTA0onSNJCAACKXYDDKZr97GXnJONrGadqBfNaPUvI1xkoAgN3
 rFEgjK04joe6EYuuyYIiU8lIQWuY8p3Xlt/LiyrnygF0oltDh4ZhkN0N2rmHUjJwz29v
 +DiIDiw8s0MwxyR4au2jinG/mZDsT3eTuSbziNRPCsOicUOfV4OPI24fakYWWv1S/pgA
 t4fYNnHJ6jwSOU3kjUoVfK2shHXEDVEFWldHwHxWR3Ob1EeKF8HuHTNSJuJ95a6QgPVU
 SPPvdXO9GX51bQyYreIZ8DMQGpo0jKtQhrx9ZAvu1XudKbXuadhdDMAVGkscr1Qee8G6
 /dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151512; x=1740756312;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uETEnzxXsrcxJw343miABNyaWXgTTRBWJcaHZGLuMIQ=;
 b=cr4rmfa/uqRDiOyP7tqt68ooGZjf1F6E+6DyUyiRILbiA/vaq2XYvkhwIiEoFvAqWP
 unTOYvcK/m5G+TKeS1B/9PlD8ReUyH7UVuoCTd5Ql02jWE5+yK1wEdr5rzxCUQqJIocW
 lDmRXiv71Q59vq1nPgIaqYr9ru0RMyo01Zu1Z1uYgaifUOJxP/cvyTqrW4wZdrt3EMTQ
 /Kj1PQ0v1uVcUBKIDE0u8RAhT5Ovsxc65PtYV4cZSvMQb4hm5bJQY51okJto9WItqChq
 8+3q0u1cIBaX+rOJAqszQtnKU6sVuLDTsHjMyJOp+p1m+TNvdM1n+iFJZLMv0mdG46Oa
 i1OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCnd0WCm7lTpThnoyGG5dakdx8EjlZktBoArwWRJ8WO9r0GvJ3k91OrUqrH1oUJxvpl5BXpfB7PIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYLb/AEDoqEr1oGXxnAYFb/Y72mgGAYz7NREiMjJM5CGsI4Ukp
 nGvSWPd8vLWS+HIa8LN/TarE96naNS1kiM23b8MjE7q3tnqIrEN27bPF8Of87f8=
X-Gm-Gg: ASbGncuAgG2ewro/wAyvibRBAaA30foCT1NHgiZizI3Go+GejF+NrV942LpwjNH0jZl
 b8cjvSZG1JhBpfUH9TZyAxok5kCJHHZ9+aFRSu7498TNab7W1nCR/MIVBsFsGxD5iMJzAgK1NlR
 ZnNzeYR43TSw8IxmqdQJzsRWCTV5v32pfA9EGcQ+i6/Y5yNAbx5y0fiawk36BEpiboI3imSYsAY
 jdFY2oIWH4Rtqyp5cfXxUWEWyBrSvZsa80fZK16rUzSmIvMNQTLKrY50Db8KN+jXaCuWGEEJhuG
 zpz2np/+IIfgICdJgQWIUfZ7yglA14htT61mRToG9DOXdeYWh5fx4T838Glbw64nqZBAqBKeQDV
 U
X-Google-Smtp-Source: AGHT+IH4qsBfcQ7xDFrHTtbwLWgEqC44pOLn8YYlo8rp3jDA5EwfNRoEqrdJZ5UAhQ9qdC2UwE14hQ==
X-Received: by 2002:a17:907:2d20:b0:ab7:bb4b:aa49 with SMTP id
 a640c23a62f3a-abc09a0bf7fmr159539766b.5.1740151511708; 
 Fri, 21 Feb 2025 07:25:11 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:21 +0100
Subject: [PATCH v3 11/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before
 blend setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-11-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NJ45LgTQlJolZGsxJ8wwShr0xgq7ERrenJp2LNxaJOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq1wq+sYpAfoG/91kYlqKkVWKgKfdeCiyeml
 U2xRmgpmwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatQAKCRDBN2bmhouD
 13daD/9FxXVjsQ4sx3at3aoeugF5KncoxC4kdwXt7iZz0vVgikqQmmT2o7fKhuiUp58xlvwJPKd
 OXzHkaaSFAriAt9bUjBuLbS4kqcY7CzD6Urq6LhSBM5XSYHo+9aIiPsGs5D9nhRAwJvYqrzbcQo
 G/Wqj0kmKQKKrUVSYui/43d8xF9IdIK3TbP4NAGbpguzD4q6EGp6C1cyErOPA79RUYxwdBI9iHb
 eCmpo8a9BqhGdYSOwkIZdXYoQ0Rj358UFgQbdIA0juFM5VlveKmAh6Q0K1yloymrAB+7/Kr5/SY
 VP+sI/IMKXollYlz1LRvVUWjrUC/T1xQIVcvY8LXCXpc6/jqb3WmoWDrjhTTfsY0cWgBTVOfwih
 VYg9SJB0xkPs/3xEVPjWzUvPl0yilAy92+2gv6qEY8vEj65pUHvDX/8KbWEau0GRpFH67COjpWB
 NonpnVCJyz++tyaKmeXrAdnxzp44jgvqCZDX9U+xqk5Rtm1F3nhWCityY/ukOGWDg0NbES2iC7d
 gz1vN186niRKeN4tD3kZPMrXdxFaeCer+Dm07Xeuz6LMKk6ZOc91azPPZvcU+Eog7khK8zIYKhz
 V0ihmfOzeT3/0JRGTD4+ZtYkXHhIUAe1K34SPjlk2ygPq7ksS/897vcbLH+sQWEljWDv0YBPH7a
 +6yzFQf/3wbpHNw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Before blend setup, all existing blend stages are cleared, so shall be
active fetch pipes.

Fixes: b3652e87c03c ("drm/msm/disp/dpu1: add support to program fetch active in ctl path")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4e630d3ac7effca2c2d4ff8801465c7a8d3ef136..b9fe3a7343d54f6f8b5aad7982928d5fc728bd61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -519,6 +519,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		if (mixer[i].lm_ctl->ops.clear_all_blendstages)
 			mixer[i].lm_ctl->ops.clear_all_blendstages(
 					mixer[i].lm_ctl);
+		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
+			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */

-- 
2.43.0

