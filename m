Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9C343973
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 07:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844B898D9;
	Mon, 22 Mar 2021 06:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3C2898A4;
 Mon, 22 Mar 2021 06:27:37 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id 94so11585268qtc.0;
 Sun, 21 Mar 2021 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UN2DBp337bmBg2JvFEjyAICLpTyBUkKCj50Vu8+iwuM=;
 b=Jc9deH4H24Hwb+zAcnS/+DV4Uc9NQo4DVFWJ3tytn9oE2c5VR14YI9Lil+U+sR20bw
 8kP53duoNq906ODsgcQ42bc2/NJuTx3r35IMAUYVMpbpKAoPS1fS057FnCzIJGoX/Mw8
 pzhhobgidi7r6mExQedAnXQWvNtREM4bZFzd07wTF+X0m+CazjFCnPoLxmIc51mNUlXu
 EVyGo+mgRg5WBqIQrdh/zAroIy/7st5oPsFzuPwAYqm5BUmcNVEbD0ljyT7fsrn7zgsf
 8/NQoFSszycCJskPW0UHcDaxxomv175Bmbru5jAmCUbGvy/n7eX7Vb/4D3kactiTumnx
 tIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UN2DBp337bmBg2JvFEjyAICLpTyBUkKCj50Vu8+iwuM=;
 b=A+rWfG6sdPO/Ux16exa0WPDaUfbOAPMxI4lbldflwPkTC6mGpkVUB9J+RSSYtbvkeW
 HShGKTQkgnVw0pTa30CMNGzEXD9eqPFYkSwLlkJBZuEN337rcPRcucLjxqklEq9EJTfm
 mJXo88PWSCCx5R6MMhirQEmTs3QrGOtvZTzBXkpiQgTrLN2KrNT3lu0WtHnQumRk4amU
 QKCJ4P6FDEAN9sR2Bqbn83ddjb7ZEDdcazbOfDRmVSp/nIhX5vEd4jJcLC/ZPkcMlGj5
 cy8AsXSr2MxP4VjVk2MTKW9GY11okrh8QJjji87X1cGoKf8zEMVr48cqfJUmRzqKMoTP
 7atQ==
X-Gm-Message-State: AOAM532aM2FmmyfJDiC9MTsq6zqa88I9GXuWRhkrGFjWfRX3QLhEJi5M
 NeNEoXIW4bac12RSbXvpHxY=
X-Google-Smtp-Source: ABdhPJy4NxShUwnCd/VrghbUj6oBBdhFC2Gxq22ZklZjA6vzIY+k1hFBOaq0tGdi0GcFlF2FTF0vmQ==
X-Received: by 2002:ac8:109a:: with SMTP id a26mr8228026qtj.156.1616394456942; 
 Sun, 21 Mar 2021 23:27:36 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.40])
 by smtp.gmail.com with ESMTPSA id t188sm10405066qke.91.2021.03.21.23.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 23:27:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jonathan@marek.ca, unixbhaskar@gmail.com, dmitry.baryshkov@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Fix a typo
Date: Mon, 22 Mar 2021 11:57:23 +0530
Message-Id: <20210322062723.3215931-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/struture/structure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 09a3fb3e89f5..bb9ceadeb0bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -343,7 +343,7 @@ enum dpu_3d_blend_mode {

 /** struct dpu_format - defines the format configuration which
  * allows DPU HW to correctly fetch and decode the format
- * @base: base msm_format struture containing fourcc code
+ * @base: base msm_format structure containing fourcc code
  * @fetch_planes: how the color components are packed in pixel format
  * @element: element color ordering
  * @bits: element bit widths
--
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
