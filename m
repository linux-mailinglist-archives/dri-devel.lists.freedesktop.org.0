Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF61362293
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6F76EBAC;
	Fri, 16 Apr 2021 14:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DB96EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sd23so33833928ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gzOG9RqGeFaMEfdkziwldEXIinN2H0fHEk94mLiK7tM=;
 b=pvAQsbMS0eW0KSVhdZlIi1X65LCC3OZTA2uwvSiMbiRwXuPoT70I61NTob4CqqnnIb
 lEa9GWI4NMQrC+HHG/nuGleueQvy3e+Jk8RJiT0TTQjj1ApxXjponcsI8wFS0VxpJ98h
 +u6VmHrvghP3v0NzSKQWR4Ix58u42TgVqSjqmVnkka/vcy4dD4GiuoPyMju4ppTxZkxr
 aBuOAYddcXd0aNuT63USMCfL+9IDptqP3Ii9NR16nZX62hDXIOmcqR6z76h691lMgdeJ
 Tjsp+iSDNEboImnwJqAJkb14ZdxKCQ/oEt/Wuv5KiokWyEU7LOtJyjkm8latXZWFaZFv
 5dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gzOG9RqGeFaMEfdkziwldEXIinN2H0fHEk94mLiK7tM=;
 b=bXWra5Bb1C6ulzEJStuK8hlANuqJfRmsT5T4PqJlPzHoMvnS8m7NHnVTgepKMduxVG
 7bjoS3fbDvRyIJrlK8AjJE2sgB99lltswr79nn/r616MwM9bEhUIYs6hqfqY6lylfPv1
 BD/M3ckeCdQ/hSJFGGYZ1WpHnbgj45hd0v53E8UjujMnFAI/VlDAtkOmP0iYExzL3DaH
 LdBfrohAE10Jnrpt4E072aNK64KYxtcA/6QPASAk6m2u8JR+OoEPyu1DwDsn0CEJjrLu
 AQiX16SEwDvswDzR36nVzFU1yZNCgDhGh91b6FS6kTnLNpQdmQZFTL98CIPaIvnilemW
 xaCw==
X-Gm-Message-State: AOAM532BDgE4EkwvqpOXLZHDH15qMPaU/PkbLiYlvTN5Ovpn8rzO6hrr
 tRjZbxGgQQFwK4dxs0EPOqiLgg==
X-Google-Smtp-Source: ABdhPJzm8GoALfykrT/YM+LEqZWqIMBQKJbjiBfCQ6xfllh9OZhl5WNbELvnlVdZs8c8LD/IBpY0OA==
X-Received: by 2002:a17:906:724b:: with SMTP id
 n11mr8739341ejk.338.1618583872299; 
 Fri, 16 Apr 2021 07:37:52 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/40] drm/xlnx/zynqmp_dp: Fix a little potential doc-rot
Date: Fri, 16 Apr 2021 15:37:06 +0100
Message-Id: <20210416143725.2769053-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/xlnx/zynqmp_dp.c:806: warning: expecting prototype for zynqmp_dp_link_train(). Prototype was for zynqmp_dp_train() instead

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 59d1fb017da01..5ce96421acf40 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -797,7 +797,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
 }
 
 /**
- * zynqmp_dp_link_train - Train the link
+ * zynqmp_dp_train - Train the link
  * @dp: DisplayPort IP core structure
  *
  * Return: 0 if all trains are done successfully, or corresponding error code.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
