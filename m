Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824107E4A00
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441410E037;
	Tue,  7 Nov 2023 20:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C4610E037
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:46:18 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1f0820b7657so2638273fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 12:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699389978; x=1699994778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CI8E8ZkOUyQxsoOHsWIKkWEPfMjq/RkXlFb3jvVXrZI=;
 b=jiNKPFcgXUK1yXpUTVwjR+zeOn3Fy8xQs8BSI/owqzl3CJBkYIdLktTg6AY/Ggnya+
 n/HiOcNSU2J9nBRp9fuFDpizElIUs2gdzYvsB6WtTE/HidXWR4T9xUrqF7VCopiv1f9C
 nPqqavcA792xmi+Ki9UsEIzyhx/S5QEanx/4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699389978; x=1699994778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CI8E8ZkOUyQxsoOHsWIKkWEPfMjq/RkXlFb3jvVXrZI=;
 b=roXzgSjv128NcdfB8fB39/XZi9BUSRbiqKTVn1fbJ9gpjiBDRv3+YRwmihaO1P0i+T
 ugJVihuvYg7wj7zYxmo2nXEzlECgx0zGamZICCHp4x/LW/8Ttgj9a+0YkVTv02DiofOf
 J5nG1t6x63SmZvnbs8PWOdSHTizrff1yJ09uHaW/CtRFG5DKn6asmFCQieWQVMWMc0n2
 pc4GETuniIrCylLe/hhudDckSYUmGY+JEz2zdkecIVGUIL3C08OETuYCeJZL62qiIKdf
 XFbklXhFTK8XW6vtGXm+07nbsDW7PDLBNqTNjGjUizC/LTfizC0PDoZ6pAiDQ59Z5Jrq
 aerg==
X-Gm-Message-State: AOJu0YxIwege6icKUaH1HbcfqNGvhrzpuxL054cNlAMD3AN/UZZ2iULp
 LEJjLIceXX2HUQ1WwRJ4Un/ONA==
X-Google-Smtp-Source: AGHT+IG4+WjPFmv9VQuDc3IYdvpiQQnqLiKzlENFNXYIcyp8lIWVCPZ8pWJUN350sbXi/kkpjcSeTQ==
X-Received: by 2002:a05:6871:7248:b0:1e9:d4fd:6554 with SMTP id
 ml8-20020a056871724800b001e9d4fd6554mr5120551oac.39.1699389977846; 
 Tue, 07 Nov 2023 12:46:17 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a630f07000000b005ab46970aaasm1750211pgl.17.2023.11.07.12.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 12:46:17 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 0/5] Add a few panels and use correct modes
Date: Tue,  7 Nov 2023 12:41:50 -0800
Message-ID: <20231107204611.3082200-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains following patches:
1-2. Fix 2 panel naming and timing.
3. Add a few new generic edp panels.
4. Support a new quirk to override the mode read from edid
5. Only add hard-coded mode if both edid and hard-coded modes presents.

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231101212604.1636517-1-hsinyi@chromium.org/
v2: https://patchwork.kernel.org/project/dri-devel/cover/20231102221309.1971910-1-hsinyi@chromium.org/
v3: https://patchwork.kernel.org/project/dri-devel/cover/20231106202718.2770821-1-hsinyi@chromium.org/
v4: https://patchwork.kernel.org/project/dri-devel/cover/20231106210337.2900034-1-hsinyi@chromium.org/
v5: https://patchwork.kernel.org/project/dri-devel/cover/20231107000023.2928195-1-hsinyi@chromium.org/

Hsin-Yi Wang (5):
  drm/panel-edp: drm/panel-edp: Fix AUO B116XAK01 name and timing
  drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
  drm/panel-edp: drm/panel-edp: Add several generic edp panels
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/panel-edp: Avoid adding multiple preferred modes

 drivers/gpu/drm/panel/panel-edp.c | 134 +++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 12 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

