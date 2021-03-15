Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F177633A9F5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 04:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CCA89BF5;
	Mon, 15 Mar 2021 03:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96B989BF5;
 Mon, 15 Mar 2021 03:22:03 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id cx5so7126295qvb.10;
 Sun, 14 Mar 2021 20:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQcMG5LLxTg6nVFwEd1izOqUkx+QGUyBmxbcMRP29T4=;
 b=lK3AtlER+6LnsHJB5aMPze3Ua1gnhBGD44EnvsvH9T4gnS9qP9a7gPthBvg4Obzkgv
 2Wffxwga3H2+qhbIqKMizVdeWMPZ1OSugoaZP/nT4iJfX+0TDChHhX0H0+LUI0zZFYk6
 O1PPwcGEJgk4f5R+sgS9SxkzUZG7tlsTUasCEFF+nw7mGNklsNolsVq4iBYFP6MJX7MM
 pk21sMrglcsqqqto6J4uU94WzAUuR3O2yx+HTkwOz9OB8VzG/oOvW+HBti+EFTGVMVF/
 KhHbjwKi6jm45cRByW1XRnYSvJPWGzW88FK4/391k0Zk3lU2XMoA37DpGOSKSXxJSga2
 Zpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQcMG5LLxTg6nVFwEd1izOqUkx+QGUyBmxbcMRP29T4=;
 b=lef8O24eWezSi6asJgUN0qfTiCKxGww0QZ1re1vWOb05D7ahYjIRyUC2gZHLtkfadN
 9H9xvv/7W7zQ5341ls+Skfpol8qcUz83lKlS71ej/VPx7dYUeFm90s0Mk7pzDqGeWGd9
 FVk3xRRE+ZnV2JMFVD8YaUWvsd/2oL+xSAwHd/rWT4AZzSOMq3PvMZXcBm5NqI4HH6Kh
 vVcmz4sdJYFv2pC3eY3dNWQrJ4NJZlwfG/rMJETZ4ylXStg4weo80OU3BzcxbAQmsaMv
 ClWBU4HmoBFM2PnYybaLzdp5H4xsOz0vVvqHyCFOrzLpi4z186Jzh5CtWy1Eow1bXhc2
 cDRw==
X-Gm-Message-State: AOAM532m/bLZEQ980YWYgcwcyzfdVoMmmsrL6kjVXxytVmnwgSn0jyfa
 jJUgD5S7NCYbPMBdZ8gWC8I=
X-Google-Smtp-Source: ABdhPJyFJI/FWkYaSq+EV0B1lGJ/91vBmhZsHYT1zGgcWinemhjAv4EbeXzw9sNtw+NTbcnBf9J53A==
X-Received: by 2002:ad4:4d92:: with SMTP id cv18mr8704294qvb.5.1615778522920; 
 Sun, 14 Mar 2021 20:22:02 -0700 (PDT)
Received: from localhost.localdomain ([156.146.55.217])
 by smtp.gmail.com with ESMTPSA id t2sm10098763qtd.13.2021.03.14.20.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:22:02 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, nirmoy.das@amd.com,
 kevin1.wang@amd.com, ray.huang@amd.com, Xiaojian.Du@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2] drm: amd: pm: Mundane typo fixes in the file amdgpu_pm.c
Date: Mon, 15 Mar 2021 08:51:36 +0530
Message-Id: <20210315032136.3669883-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/"an minimum"/"a minimum"/
s/"an maxmum"/"a maximum"/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1:
  Randy's suggestion to adjust the subject line text
  And missed out a spell too,which now included

 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 5fa65f191a37..308249ae1a22 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3315,9 +3315,9 @@ static ssize_t amdgpu_hwmon_show_mclk_label(struct device *dev,
  *
  * - pwm1_max: pulse width modulation fan control maximum level (255)
  *
- * - fan1_min: an minimum value Unit: revolution/min (RPM)
+ * - fan1_min: a minimum value Unit: revolution/min (RPM)
  *
- * - fan1_max: an maxmum value Unit: revolution/max (RPM)
+ * - fan1_max: a maximum value Unit: revolution/max (RPM)
  *
  * - fan1_input: fan speed in RPM
  *
--
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
