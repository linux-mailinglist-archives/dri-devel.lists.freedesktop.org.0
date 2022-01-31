Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B514A4DCE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0810E2A7;
	Mon, 31 Jan 2022 18:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73B810E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:12:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a28so28570295lfl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gt6NZg0usi9i7zJRlo1gTWfjjBJm3GJXgR2jsJ1DWWg=;
 b=SKEqQkZtjM0lR8JE2205G7bt/hRClfuW6lv+1OJKnLaWnKjeNjNRXf5O7Pt94GCSus
 dAq0W2rCxEgflTsDhNa3PK2W+6Z48HCEqA1ucgwqFkiLafzVskaOYMASdXqzxT6Ep00U
 WLNwN1AwCEUuK/o3eTzE6J4jBUtArHA4H7Dw8uIkX1ZxDBQDxyBDZGxePJE8ESPs94Hr
 ljpVNKjKpJsPfpE3hpPIdTTCogkZPlCpAqsqiwJZWXMWo/4bOoyJ1HlCMbtigaYPC8oE
 XHvUVXwLIjCsJikqGgWqMM0lLloOuf/o+VsI3gkWex1NNvJ8zWMKdj9NGRnFrA0P22Ko
 +Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gt6NZg0usi9i7zJRlo1gTWfjjBJm3GJXgR2jsJ1DWWg=;
 b=asDiXMXAJ8jSEK6jWJYnL6HCKjzhGrZ1DZTzDpJ8T2xXRIlb6AxzvD5y1lTl//y+I9
 br+N8YNUrYi+ov7fVv0+nQIeJJ/ht7qDlBRSNjvQyuAO+97lu+zgwo7OIR4WFALAQ+iG
 uYY6bin5+8okIZa74jQg1y2lxs8YNBZOpsZ4Zuvm4zSj8WLmJyb7afl2OSueO2ATSs4g
 +2W5Dx23cKV1n84qlcQ2WlhsXC4cpwTu2imkLhmAkETZ98MWiW1GGDQNxmvOvmaT1Epq
 nGefqGvqJgv4qdJYKOJF7+s+lsUrDdpuPFAnvyFP4mE/iagcMmM+SmLWmgbjojUtjz0S
 Yc+w==
X-Gm-Message-State: AOAM531e1l1mQq+aKDjrHzioPBhOm3GRqpTp/SXbBvAs5zcy+L1JECz9
 rdlajJ6pyMud0BHBgRKImbc=
X-Google-Smtp-Source: ABdhPJxdagDD2HAb/bonm5f9mLZ2tjBJ/Hfhyz4zbxL6HgiHVkINrt4nt0EC65a7cyKJI3rmqyCCuA==
X-Received: by 2002:a05:6512:228f:: with SMTP id
 f15mr16913417lfu.115.1643652752185; 
 Mon, 31 Jan 2022 10:12:32 -0800 (PST)
Received: from localhost.localdomain (109-252-138-136.dynamic.spd-mgts.ru.
 [109.252.138.136])
 by smtp.gmail.com with ESMTPSA id r17sm3391297lfg.237.2022.01.31.10.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:12:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v4 2/3] dt-bindings: display: simple: Add HannStar HSD101PWW2
Date: Mon, 31 Jan 2022 21:12:07 +0300
Message-Id: <20220131181208.27101-3-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131181208.27101-1-digetx@gmail.com>
References: <20220131181208.27101-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add HannStar HSD101PWW2 10.1" WXGA (1280x800) TFT-LCD LVDS panel
to the list of compatibles.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62f5f050c1bc..fe49c4df65fa 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -156,6 +156,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
+      - hannstar,hsd101pww2
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.34.1

