Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E384A3C05
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 01:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF241124D0;
	Mon, 31 Jan 2022 00:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BA11124AD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 00:00:03 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id x23so23486662lfc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 16:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gt6NZg0usi9i7zJRlo1gTWfjjBJm3GJXgR2jsJ1DWWg=;
 b=IwMIj11XRdyOZVoWV2D7URI46/yngh8kyxEDc+0Hs+tZcFTsE1oxq6aZP2dhOA7GPP
 q0iGMRWPnDHSJajhDy0O5sym2zcmOdUkLqPZsPvFoalQGnGz2+r9BungeDTZgTaIBAJe
 xGeQzbAX1nGmaKuqHdgV+F8HcWxTMpyfwjIjfaCyYPMDv3UM7PdzuZds2mTlcQYBwo29
 FuCR2MvVyKuzJuqyahWolGMT4XUJNOpml7AnvUz3hsYFzrTmX/a8ttQb7dFZtugNAWxC
 h/jlO+yksLgEc8sZDEwd7V+HUJpETZqdTGkzve6JXshIbGzsxfo2SCsAIbGCjCp5EqBd
 5ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gt6NZg0usi9i7zJRlo1gTWfjjBJm3GJXgR2jsJ1DWWg=;
 b=uoKy1YR/fGghiARUTywpI+gs/xBiSHAzoL614Wpn/uAFfaOXA680SGbRbt9HiDLcjd
 f+9c/cLM0ye16rTQN3B00Wu/NDY2iYAEaYqK6cTW1+P5botb0lf3QC1w3fm9BvQJS9dt
 DhonJign7FlUJC+OGcRrUKKdXr6lpPzr5gRksNYeZV5qwDcd+xcovZKJGIhiEbk7/dMy
 QuV0K3SCYGf5P13DAhLbE/NIXMESHOBqd5CpAZBGIv+TM+21+ZKBrNV0D3Ie2cIuqAx7
 KYjTyPZQFQYe09vQnDSeEMnaDdKQQ39fdRsJoTlGtNS3kFHRQ3F/7KBXy8nnm0qXhSye
 2rgg==
X-Gm-Message-State: AOAM5316higN0Bf+14ZGs5R5siifRpXXGbU8fPEbkSM2nb5EqiNeOrKb
 kRxspjnGtg/yKDOhZXM2WfI=
X-Google-Smtp-Source: ABdhPJzjeQq0P/qp8/N27QAvzEUtfO6JllRIy0CzH2UyXMTJNF2yY2qDKxJvCMqm7orweoljFITfUA==
X-Received: by 2002:a05:6512:2612:: with SMTP id
 bt18mr13504520lfb.255.1643587201377; 
 Sun, 30 Jan 2022 16:00:01 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id e7sm3443193lfb.17.2022.01.30.16.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 16:00:01 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v3 2/3] dt-bindings: display: simple: Add HannStar HSD101PWW2
Date: Mon, 31 Jan 2022 02:59:44 +0300
Message-Id: <20220130235945.22746-3-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130235945.22746-1-digetx@gmail.com>
References: <20220130235945.22746-1-digetx@gmail.com>
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

