Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB2913E18
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97010E21F;
	Sun, 23 Jun 2024 20:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T9VrSqC9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A927310E110;
 Sun, 23 Jun 2024 20:30:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-366edce6493so351606f8f.3; 
 Sun, 23 Jun 2024 13:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719174643; x=1719779443; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8/H5C81Y675DpCKTHyrBPsjadWIIyfe3/F8KGCSH21I=;
 b=T9VrSqC9RxpRb57k6icRgcr408hhNfPROZDJkHBkt53dtiBp1u431J4P6Ybmpq9aA0
 B+VfXcRsijBnRjXb6Aao8sN6pMBtlTCT29/cH6B9yIyfuvgb4GEOV04sdP444c/DOfok
 VYwOjYx3C7UGi9BuxqME6BwhX9RHoLJ6KjSw5GDFHKK0Qq3foqyOqZCMREG8Y8OkkxaU
 fWAnZdyChKBbn8miSwSZTj8zXv8poJulveYui+yox/UWo6YIyp1CbD6kzaOBJLHP4wjL
 bZoEU+a0YNBrXXLDQYxWkK43vksrTdBWTiXBXGA//swQ/3iQGwR40ue50a2G1PaTVP/Y
 HjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174643; x=1719779443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/H5C81Y675DpCKTHyrBPsjadWIIyfe3/F8KGCSH21I=;
 b=jYklhxihfG2nCw4B9XWOtfjAKNjC+bVea9Db/L7Xwibm2X/g7lhKAr6F8jxEFjYf/z
 KhHmxA4b8bmqSFCmi6oJLrRwdV57OxiOhNXMehLz/G6l8CGf0b16ltnTxvLHWklC8NOp
 SWp6N5P9hsK0k2hXQmTNMq5VZK4mxHIzMNr6hzrOA/daj7mCOa2nfsvEZbwKZIGW/gpQ
 bqOQiQ/ckS39ZmY7WSGRlpURvM5zw75w9Uyb1rZRuh0aG8eWT0IZuctePiLQqudO9ziT
 KK2gLvc+BL/CMHzjxPqeOXELfPf0P810IbsW7rjI9JPPyj1rojdXcaT9lQdS1Df70Y7r
 PO9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUcj19d7f6xfjuwmUGCk5M+rXLo0qVu5OUBUc5CS0lkpeKwpIuGz+XCzDp2BqyUejS4rGn7AV/E92E0FJrjKQET+mbOu9iDjYeo2FPQgKP7QqksB+hyFOz/pz9TIS/6GCpAhzv7snXnU/hZaMCTkC4
X-Gm-Message-State: AOJu0YzotJRQbm2Ar5mxdkwUZnRDSNmqWVWQnqNlucyxzx7N/7E8leUv
 gbjfbTvIMuDNm3hBcCkmNUTJfzpM5FfQ1sxLKqVfmtNk4ZUNdmiCfxhq9u7zvVY=
X-Google-Smtp-Source: AGHT+IEwjjtcQORbdGpX3Q7URvaTjVDJl8ms7m20O6UywXTO6HIij4s86Eygram2ppZwdFy1YumRoA==
X-Received: by 2002:a5d:47ae:0:b0:366:efa2:f2f7 with SMTP id
 ffacd0b85a97d-366efa2f485mr915943f8f.1.1719174642725; 
 Sun, 23 Jun 2024 13:30:42 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:30:42 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:36 +0200
Subject: [PATCH v2 1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-1-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
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

Add the compatible for the MDP5 found on MSM8937.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 91c774f106ce..e153f8d26e7a 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,msm8226-mdp5
               - qcom,msm8916-mdp5
               - qcom,msm8917-mdp5
+              - qcom,msm8937-mdp5
               - qcom,msm8953-mdp5
               - qcom,msm8974-mdp5
               - qcom,msm8976-mdp5

-- 
2.45.2

