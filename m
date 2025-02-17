Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B696EA389A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77F10E582;
	Mon, 17 Feb 2025 16:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R+R7iB0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9061710E575
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:42:04 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-abbb16a0565so4916066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810523; x=1740415323; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z6p4+QSdk7352l5SdZRRV5Uk/V8Du1BEH+vmjNhZlpU=;
 b=R+R7iB0tbvpbTtxrOZzSeanjkJYk6A5sWpu50bhF8TEti2E3WN/n8UPHBeweozIql0
 ypBH6ffydAKadMW97lHVSFjKlPIhnFvAzSpBpI6CD9OYzIRBD1vnrz25ZHG+p6rHY+z+
 fhiNzOD89KtsCURh010WOqxTVpwnFyGPvVJAPo5LIKRxT6WZXElzjEmhoo1TE+akB6pO
 AfS02rhdgUdVuODVxHxCNcDgKVKmPwB/swcqHPJiYjuHDnF3iCkBCcCpb5V3L5HeT3wl
 qRMo8bM+pv6qBtQYMVEY7zZ6RGyDEOeIz53tJ4ur53hd5HXOGbC9RH49nG8TjTw9dv2+
 Se+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810523; x=1740415323;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6p4+QSdk7352l5SdZRRV5Uk/V8Du1BEH+vmjNhZlpU=;
 b=MqBe9aOEdnOx/w545edsZP61lyRx0Smhkbou46zQOIjFhYUHfcbWLYkACwiihrJw1d
 +wayjLkEfBnDhLh/5YkspjwiPDnqjvjATLXLSpcis6vuH1Tlfd1M5bzI2w+3Q/qR7q64
 3CsFHHTQ6Qz1KO3ZMYjwu3v/nD9EdO0XQXQ+KDI24ZbD1q9qIT0948xxHhABFOYyqGJY
 NK4c8t3STBffrJGoQkbsucoPChqSB2ULPtvxFa30d1zq9X3YbS02tkx0BddjhX3QMYAO
 8HhM0xhYNa79TFrijKjH7KGkN5aK/LpRTM4mv8Q6+C1rMYgy5brg92J0U6/OEV6bk2TG
 EJAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2rAvc6+aT3xwipEqfZtZL59bkKabb+GbvnENQRx+i59bsSmSnCsPXkTir6cL67i+DTOvUsXQnZxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjhQsMt/577j6AwKjz0vL8VyDmJgKZ1cV2b0aPe0Dgfr1Xv3of
 wEclchpUErUQjRHMDEKFJHew58xb+1QTEvBzGWPkp69Y5BMaCw3qDOkq/xn/+hY=
X-Gm-Gg: ASbGncsHpGwkrvO86hjwXiMHrWbPZiOCxhTGg5PQYZW5fQmTsNbGIjtCSuJOYStvFuR
 W0dbo43PXIUPhNTWQsyXcq2O+uNXJc2pI/YuO4EqYplxbLP77NNBtjMLowDlmJUNxXNdctDxu1k
 RkvcrDon8VJiUi8Zkn19Mkd0Q2dMc9prCUcpmspEk7GJX02XuPNFlmL5fO7i+S0PZEF/HbxRj6Y
 ftuMyss9kjfiFcmEqRqofv2E/vHm8994QK5l5miBBFOGdSu+KI9WR/5A/CDpCCr7qdYX1/p0KMR
 E6RJ7vUeB7hbrf5OWs6Usy/XsRhtYCU=
X-Google-Smtp-Source: AGHT+IEf0N+YXNj+Lsp8pSLDVMmk8n6zVEVjQz9QSgt08hAUoLCi7hE5mlxyzTEta8YrodPyyRpM7w==
X-Received: by 2002:a17:907:6d17:b0:ab7:be81:893b with SMTP id
 a640c23a62f3a-abb70547245mr386804666b.0.1739810522989; 
 Mon, 17 Feb 2025 08:42:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:42:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:31 +0100
Subject: [PATCH v2 10/16] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
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
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b+uEdY+iyNFmz1IDRdoHXm0B/oA8pvjvi+pDy5sh3HU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a/sM6sYomoofm72CEjN1eXM1WFCtr8vOTkk
 B35Et4SOmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmvwAKCRDBN2bmhouD
 10TfEACCYRiC4TTn8bnLGvE29vlC56l6pDMDYXw8N2i1iR7JxQfSkt+G1VnWermPCGGAqingyzV
 zujx4iEb+ySY1ESIg2TVSjU+es4jH5p/yExyqiML8hwntHzZo5ad8nt9T2Js9aC+s+qmU9ADaTV
 4YHfTCfNPtimh/Y7lK3qviz1KcEeEMDtYmpeW9C9SQwydzqapB9ebc6rKjg39yLDvYrxrGuXFg0
 16R2QzW2Tk1ZHKZKXApVF4HPe9SMpnYehocY/0lpCNRaqclM/RGnkliobRxe//OdjAcVYQUeCgQ
 lv9PwljqgGakdLj76D+BXQu4n/w1Yqea8At4rBnfqd5QrNm4ht8xcIWSwaimeC7E6Zr6uDgN0OE
 esgwRZdH+QRyvjROWF2JGxItirMQt+3S0RLIIDJOgzFZyIgsUCiJz0uEUJBgoWVmOhD312M4u5e
 bbsvr7YhTh3Y3UNn6O9+yxitbx7PHLH8S75tLahRHdxPJytzJqZLV7w8ZPIWDr5SSxJ4jcBEhkN
 SnqvS5cwNham3nirLF/rm2Pn5mj7kDnGLSSNv+wWtwFOIVmV9agjIkmMkHIvOBiHnBZ0M6BojJn
 PR2rgDhPivb2tLRncp5+R8fkSyXV3KpeZBXLJRRzGv45MFOTuAp668j/ManMrDwdcJVHBOJ1HQk
 d5LC5uHDSS2+qjw==
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

MDSS/MDP v12 comes with new bits in flush registers (e.g.
MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 0021df38f8662683771abb2cef7794c3209e9413..9d4866509e97c262006e15cf3e02a2f1ca851784 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -254,6 +254,12 @@ static void dpu_hw_ctl_update_pending_flush_mixer(struct dpu_hw_ctl *ctx,
 	case LM_5:
 		ctx->pending_flush_mask |= BIT(20);
 		break;
+	case LM_6:
+		ctx->pending_flush_mask |= BIT(21);
+		break;
+	case LM_7:
+		ctx->pending_flush_mask |= BIT(27);
+		break;
 	default:
 		break;
 	}

-- 
2.43.0

