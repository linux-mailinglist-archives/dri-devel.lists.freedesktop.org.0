Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D278D28EE
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A473810F68B;
	Tue, 28 May 2024 23:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n3qloMzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF71110F3C5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:52:59 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2e95a1d5ee2so27274241fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 16:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716940378; x=1717545178; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=epU7ofKFUVORXm5Zp3LH/iJERgxS72joIk8yaDqIF6g=;
 b=n3qloMzf0E+4jvkAklxfTqHR3BOAlvGdxOLtDMdVCtWrwSwtusTE1tOpv10Yt0FQdE
 +4JDxXrlhuldqqqk44XYPAHMVDLfYzqexBirAYAWIobGbRj7Kz/iiRnhahCXx2DTnOrM
 Mt2HTOlq1vQkIvIAZ9kNnY6uZspC0alzObiz65ZmBY39gU+oWFVLrH000/mpi2Hlp+05
 jKdobDD9IaVmdxXlILWe2o97rWID5BWw9ercxbJcwikR8ygqWIgxciIbuXXFVBFyTgcv
 fW3JQagbZeS9Xb55Pr/3VheTh2rz8nQqvOzsY6IcYm8LCR9gsVYf43MsgeDZqJeALqQd
 qFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716940378; x=1717545178;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epU7ofKFUVORXm5Zp3LH/iJERgxS72joIk8yaDqIF6g=;
 b=ddHzCiRBLFgwCsMc3dtroMLVhQ5C5p6ywpeCN1EBYAWlI1N5+mCXJ0soP54QwUpuLe
 GM4TlOVQDqkairFTcBqpMGnVnHB8bPx5B038x18SLrYiE9LuFk1yjl0h9TFceQNofOmJ
 Gm8qDnR76jQQabtPa/nN3QBy959Be2/fd4k9tCxH8C6i+72BQm6kqUSgIK6e9ENyP0fm
 aeH00uslztvLS5m6U6XvgYFSSa6FQyJHWmenUerRn70p3tWqvc42EL7B1g1pKZi/UxDV
 KvvlpVzFk4SuYxw3l8vmPKw934QI2UxDexi19WjJe6m73dtbsQJUlVbf+S0cWfb011Xh
 BQHw==
X-Gm-Message-State: AOJu0YyWUCK0eyBxd59i0KbOLwRRc0LjH1dinRvjtt+E8qcpjF3YSmI6
 csSrA2vR1MUuhXoOPOne/pYe6neC+t7z8DstKNXsp7e6whCiTb5vwDZjPUlNxUo=
X-Google-Smtp-Source: AGHT+IF7uwaZgGb+yrWIOcUgI06JtcHOSDj/jnR7jimtQ12vuH4mIz1Vlkr4CD0g2/t5KduQ//gZ5g==
X-Received: by 2002:a19:2d5d:0:b0:52a:e7c7:4ce6 with SMTP id
 2adb3069b0e04-52ae7c74dc6mr80914e87.39.1716940377383; 
 Tue, 28 May 2024 16:52:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066bd0bsm1099869e87.165.2024.05.28.16.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 16:52:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 02:52:55 +0300
Subject: [PATCH v2 2/3] dt-bindings: display: panel-simple: drop several
 eDP panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-edp-panel-drop-v2-2-fcfc457fc8dd@linaro.org>
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
In-Reply-To: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2691;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DdrfEnSvoeRW1E2r/WH6/wGMDZXUBm6mjy8uD45GQWQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVm5WY3yuKK2fQT+EbUmK8+P5TRcjqhHWqwSbS
 Z01hMfGKEeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZuVgAKCRCLPIo+Aiko
 1eMRCACqLWRAzCgQAAIxGTwJ0u8YzGQCPZ3qN1HasotTwLUL35ficmtV5M6mL3J0NV5Q0E0fvyp
 6zHSZCfHRospwVgWkajrmaH/s+e4hEeBWvquC7k7JfXAA5U25rt8/E2jspVca65nSo/UbGkvI4F
 10Zul/rRkDoiyY1QVtpkPbX0gMSPt/xbU/cXSnFq/Xp8PQq3y73FAre/O8zchrJIX0kO6kuzr9w
 GBikOcttFJrNQziQstd8LuW1ITRwwMlE2lkDoBYSnwQoa9VrL8sPMmpuf8ybonypU5eFpkVL/EW
 8fDZF7tt4Znz/9RV2hXKZlora4vva+EsjNus+HBTM3aHP1+6
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

The panel-simple.yaml includes legacy bindings for several eDP panels
which were never used in DT files present in Linux tree and most likely
have never been used with the upstream kernel. Drop compatibles for
these panels in favour of using a generic "edp-panel" device on the AUX
bus.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml        | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5067f5c0a272..e5ed51226433 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -50,13 +50,9 @@ properties:
         # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
       - auo,b116xw03
         # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133han05
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
       - auo,b133htn01
         # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
       - auo,b133xtn01
-        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
-      - auo,b140han06
         # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
       - auo,g070vvn01
         # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
@@ -172,8 +168,6 @@ properties:
       - hannstar,hsd100pxn1
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
-        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-      - ivo,m133nwf4-r0
         # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
       - innolux,at043tn24
         # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
@@ -310,16 +304,12 @@ properties:
       - sharp,lq101k1ly04
         # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
       - sharp,lq123p1jx31
-        # Sharp 14" (1920x1080 pixels) TFT LCD panel
-      - sharp,lq140m1jw46
         # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
       - sharp,ls020b1dd01d
         # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
       - shelly,sca07010-bfn-lnn
         # Starry KR070PE2T 7" WVGA TFT LCD panel
       - starry,kr070pe2t
-        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-      - starry,kr122ea0sra
         # Startek KD070WVFPA043-C069A 7" TFT LCD panel
       - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel

-- 
2.39.2

