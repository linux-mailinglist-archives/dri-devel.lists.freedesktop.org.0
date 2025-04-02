Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3FFA79148
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C71A10E7E4;
	Wed,  2 Apr 2025 14:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T1cUFagd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C130810E7D9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 14:36:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso2641182f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743604598; x=1744209398; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JzxsAOJT4Iqs9UJzPZL2Q0zcziM4hu6YpQDFHvHcut8=;
 b=T1cUFagdM4UQh2GXJqRoYIz5vrRKZUCLPmnX2KyySSDigynGplHvfLfVlhxj0g5tBk
 HHuZcghZWaXdxY1n0x9h7QqdNPsaqOnhcgGDsPPOmksDyd1CKZzWpsyYmumEtc7lWrSa
 JqPIsM2evSMCSh2JJ9oiHF44C4YDn9eQqXGbgiVaa7aQ0jMAvZe3r2m50qvseVj1jLpv
 OLajst4buJtj56110SE2Wpno7FXxzOK9hsUPuxeLui5CAhEJvgEtIyohY1fttvq2ff7x
 p9crUjMByFJNPMeKyIATLwQI6GAcQtlYHpRWqOPHFhgDbX5sUYiSscIjvDqsxm61rL72
 Hezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743604598; x=1744209398;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzxsAOJT4Iqs9UJzPZL2Q0zcziM4hu6YpQDFHvHcut8=;
 b=fDQIsMh0XgGXcBQyCG5Neyo1npBdna9ruvTxTIZacOfDEP1Gw52QYnhbRLSvhSfb3e
 zdhtWBqaCve0obfsFkS9Bah+K82jHIUMnkIX/UcVczHJlXcoOMKQi/lqMRIgXOMMMLCl
 fFjqlBSUf+/kt96au9kgAtyOwOf/hL3gzfBUNzKTHEujfntuibHcLdvqk/ErRJGGKAS0
 ieERO1GKyFdBBcwS5/8UvJD3pVk11Mba4Ws1al3PwE68bheyAih0TFqB86y+UA6dW4QI
 OniTOQiK+/+T5G5pXnlnJFkWCfYNWZVhVGL/b9OxUcxH2kujeldTxUDHJbSG4nZOKH7T
 /C6Q==
X-Gm-Message-State: AOJu0YzEmNe9r/JH9Jhw1JrXH0Azp49MAlSGazDo8olBzapG83wjePjH
 wsQz59tOjSTEDq3sNG8/cOeifoFaHF1+zCtTWayGS7F4Nl/wYur+FLF2vXzK05w=
X-Gm-Gg: ASbGnctdumafZ6kOH5V2jCnhsu9lQXsJWyGmoL/iGQLUWmSUvk741kKXHng4vxEMRU4
 qEHtraTwBPMtbBT1r/e3oMzUnLuvmnMszjHQ8m3+5jl3rRBF6wWZtps/cAZN7Co0fvvxoFbqwvk
 EB4xQVo4Ei3EUtaHkeTKvM6vl7x9PwwlBzDpb6/dVDTGHj+X8bQ2JApIIcgzSK5qfkj70nOK73G
 Q9rxDaUveNTMdoFDsjMwibIP82NIZM0Jn1IqgBq8cQ2ABAeN1bksmP0DIqUrRaZWF6jb+2J+kMe
 DitOlj8Ho6elbG3FTg7lLBlkrhugvyKcTgYEM/5gbHkXaj6ZLBqOAyq4
X-Google-Smtp-Source: AGHT+IGfBz/Tbc3ihv0gbUFvVnQ+Ik0K5L560vpD6awXQAxP5KkZBzRejgIatspUJzWM+LD8gckAfQ==
X-Received: by 2002:a5d:64cd:0:b0:391:412b:e23f with SMTP id
 ffacd0b85a97d-39c29751a59mr2180684f8f.15.1743604598316; 
 Wed, 02 Apr 2025 07:36:38 -0700 (PDT)
Received: from localhost ([213.215.212.194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39c0b662850sm16965019f8f.26.2025.04.02.07.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:36:37 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 02 Apr 2025 15:36:32 +0100
Subject: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=726;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=8hS6GfBJNXR0FuahNdWaTupB+X7huKbQP3wOJFPU12o=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn7Ut0tpiNwg8/a9cbIdQZJunopxaffChO5bBV7
 y8mLRat166JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+1LdAAKCRBjTcTwaHBG
 +EgcD/sE6Qds4MJdJXtaZcqzeDVC60vw8sK0/fGKt8X9MiP488uMAh8JT0+bLt14Tilx5sBgj+U
 HvcgrTD5qU+IZEAkRLIo7I7tGxJ0/WhXa4IBHsqKXaRz+CAAxIPZXkexTO8HeFsRzRb0AJWNkd3
 JU9IMBVgSU82sYq4Ya451T1ReBHNdwff6WX6Jb6qbfQO4p6R/0bS+ntwj8fRrcmNBlVEHn3zs8O
 0TbIKDbHnDF2CiaFdeSwBKAoM9WbymDcOqOHuHXjEDL8Wcdlh1OMM+yy8Kfc35X9IIiLHcf4TJF
 IgiRjP307m0TZsBp4wApqpQjE+hmBs29HYiXF87T72y3Gx6fIy1ZAINGawxX1yRqhMQ83Q5g43A
 C2Lxt45Gu2sZcOCrXVnttCvA4i66Ov8zyYM76Nb3d2fVLYi5N0bl7OeHmHf5x7YqS/f01e0wLoK
 L/9pvdl5b4NhCrgkuK3HfUb012E41/x/GeCKcB2L/lZsYqjfNJuj4gBhlmoSqKGEqBujbbMXr5G
 GiA0/ojdeHJDNVeuXXizAmahLTPdtdjs2I1y71L6Q37fmBbw3iEQ957rP1Cv4dtFOWZPTb/TpHR
 ANbGjp9m0UMyglMTZlYYafPEYsa6/fqLuRL8ZY9Iwh8utU1yfak2XMkUwSjY6pLZXQzGaSCOalJ
 11J0TLAL7pkEofg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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

Add edp_hpd_active pinctrl to the X1E80100 device tree.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -6389,6 +6389,11 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			edp_hpd_active: edp-hpd-active-state {
+				pins = "gpio119";
+				function = "edp_hot";
+			};
 		};
 
 		stm@10002000 {

-- 
2.49.0

