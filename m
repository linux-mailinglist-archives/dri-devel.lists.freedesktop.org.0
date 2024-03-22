Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CF887503
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE97112888;
	Fri, 22 Mar 2024 22:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qtbsqYwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5794C112888
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:57:02 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-513d3746950so3285261e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711148220; x=1711753020; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
 b=qtbsqYwxAPZ80M5Oq5ie77UK1PSMt4IvOHiFCNGLC13fmudQDJbZb03Mb7bxELcEaO
 DQ/50xElgleNd3evDjJd7kVvymLbF3PKl9KFPoTQw8YC6FjWJaXRPG8yCs2K8r+EQF18
 eeuf0oz8XnpHtZNrU3h/xNTHkwd5lGE8w3MChKF+YpiUMDNeqXIp1MGHUsIzHjUZbbN4
 FvzKUZ2M+cHla8/0qhVdsT+UOwHuOM6jsyMEFTObK9OcBfqasEutPPI0QCNzNAomgpRa
 BHl3SGUZkWOOb5reWFGfzWbsItFZ6xiRVx1qTm8OBkSL33nOK2iCmuhpwFnI8/XCwTPl
 W+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711148220; x=1711753020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1WXlzxfTJnIOKH/FylqIk+DUTDY6h4Yser6h5v1mYdc=;
 b=Wc/bBxj5cQk3wAgfv8mzn7Yurz9KQXDwouzX14+rVJ13TZnXU1gOvRD7FwE0OPA+uF
 0ZfLoTVgmdIGMFGMYnYWtSalktMUt6l0ZmLtu1Y7MDGq+4t9Zeh1hZEO1iDB7uwZc5ny
 dndDLRpfa5my/YAj/lbpK2hpeOhmO67vYPENQixT4WSyRKb0iA1kpBVqCrteR3PZIobS
 /7fkU8RRmYJFTLxBtCb/8MxnxGNxhC/0hFxtXqOGgDhv7HgYQU202mBgkY0SCdETxXQ3
 IgCjIrbsck44NuB476h2sKM7i4/2BC2Ujze3uRBVDHP0QLWczl3qAKSxKhgdd2xLzKiA
 typA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUggklzh/GQFFb3g3rC8tuoeUmrkPib6Ks/hQUO9e0R7uBBC6nEcgHYkY4jZx+VUpob2xIrc0fZAxgC7wBWTIPZ5s20wS2VUtQIl3c7xZAw
X-Gm-Message-State: AOJu0YxwszApLKUJaL4gTkta//XtSCvAKUMjfqLPWXlA8Rdtr7xoJaxD
 sW8nOl2e4HcEUtkl+FKal3tEygEq8EtZBzUqGHhZTLUAyPG9JqT+RTqR+GWG1do=
X-Google-Smtp-Source: AGHT+IFi98a3peQ7gl5fpSu6i7UURHoDaCqJKFvENDpkKo8CBFxcsgGxJ0sq2YvhLQ8oe9YUM1yavA==
X-Received: by 2002:a19:750b:0:b0:513:572f:88f0 with SMTP id
 y11-20020a19750b000000b00513572f88f0mr432301lfe.41.1711148220176; 
 Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 15:56:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:54 +0200
Subject: [PATCH v4 02/16] drm/msm/hdmi: drop qfprom.xml.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-2-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4711;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WdZH3u8yRJqqGjSYbceH8YaJBPAPZG8nl8tvSvRvLKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy2A60xzZFqp3Ep9ao6eEniBUNYUIkGdV0/N
 o5cRbHPVj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtgAKCRCLPIo+Aiko
 1agCB/0d2CNfjewMhWwbP3Zj9yqK2cOBQ5NFsWUrybI/9jg9V5n97zlinvrvMR7r+DbxrOeGcII
 vQM/yOPtV4J0/cB0sZtFqOm2SksmVnKDPVrJs/KrB61/khwu+F3mKmWQz3G2Q6kYDCfQ7TWN59R
 f0NJo4r/UorbIxiuEaKWN1R65dzrVcJqRtjP/xY+/qQ7x585UyEFh9RSKrPs570PimiFFB/S8kA
 RIbZP5HkBqRKG9i+p2FfPteSLjdE58gTrJYkxLfGK/C14RIzCayRDtmPj1hlAmSAd9V74An7NRU
 tgZZYj2xnW8KGceupmt3n2aotNTd1MBKg4E17P1rNHyYN73H
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

The qfprom.xml.h contains definitions for the nvmem code. They are not
used in the existing code. Also if we were to use them later, we should
have used nvmem cell API instead of using these defs. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h | 61 -----------------------------------
 1 file changed, 61 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h b/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
deleted file mode 100644
index 498801526695..000000000000
--- a/drivers/gpu/drm/msm/hdmi/qfprom.xml.h
+++ /dev/null
@@ -1,61 +0,0 @@
-#ifndef QFPROM_XML
-#define QFPROM_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
-
-The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-*/
-
-
-#define REG_QFPROM_CONFIG_ROW0_LSB				0x00000238
-#define QFPROM_CONFIG_ROW0_LSB_HDMI_DISABLE			0x00200000
-#define QFPROM_CONFIG_ROW0_LSB_HDCP_DISABLE			0x00400000
-
-
-#endif /* QFPROM_XML */

-- 
2.39.2

