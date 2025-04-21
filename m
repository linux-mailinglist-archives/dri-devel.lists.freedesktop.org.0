Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE24A95042
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 13:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471DB10E379;
	Mon, 21 Apr 2025 11:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="nes3N4xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FBA10E379
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:36:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ff67f44fcaso935181a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 04:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745235404; x=1745840204; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qnhLCMCJX7x0yayfuWyZs6nn9tnfPutjl4IqAVcAEc=;
 b=nes3N4xitc+9maO4LeDNoL5jRY0V5zO4SUSfh5ssTBeuAVG0htODeceGFFGVM6KmsC
 27064xXtUBhusX7JN7h1gxGIopypQUteo2nqIV02u4WjR7edaO2drK3PKFAzq23+NTSe
 6mbsZExUDiIHhfu7t34Q9ubsC/C+3wls+B0P1ebLkIw56xhw1ODLaHqEXnK6r9AOAixO
 30DaWMiiEARYPunjcA8wpNlkh1kDIglFXuFNcpgIfaK0fGRt54fwvxOuRNbx1MrNfBrB
 PsibwuI5SLJvqjm+UG7JNRGa6PYjFDzx95tlNI315BVuX/ePrp1cRmTJFk+SEBHYZcX/
 o4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745235404; x=1745840204;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qnhLCMCJX7x0yayfuWyZs6nn9tnfPutjl4IqAVcAEc=;
 b=CNqhw6aX+vD9bxK8uhVVrfngc7cZsSi1DTRCRWEceH0swks50CHg9wdXoKgAkyb295
 XWRUwH0UWYBNVaETjiuKtMGGfipU+PpHiNFp+unZurE8E78mEBkVmA+0xa3f8JI0SfAS
 VilUitnCERHEEK2RSzek0J4vKYA/B9XqiJEdMgeR3Z6rfwZkbI/1oGkQotQLyh/wXdAW
 A1g5sCu8Zjmt917dd4uOcEEQfUgI3xTSIZRLfNaySMmGB3/n2DRQjLC4PV2qEJx7xG+s
 jd3wvyKC3wJGRAVq5xtD11fq7sjZJ+q6G2BIKc9jFMay5pXXLbkXdDwwT0+k7fqdzx28
 6F1A==
X-Gm-Message-State: AOJu0YzHfu/LThfixrHLv+a/6mgqOWHXKd+BjvYcJxrpYCOHkTiWkecY
 DkEmYYcqL7eR9SmntIHUVC/bdImmes0W18pSVA7RNz9ETz3pqDoUOBan0buB1SU=
X-Gm-Gg: ASbGncuRfTlw5nj7Z+F7CMh0iVKLBa2ktS6D1n+mxyCH7uGTwr1nS7iDYHmLrW+5CJJ
 slP0jkAYaWoXJlLebbN4GLFMA7wWNRobME32mnc15su1Gq+AJ6Ujno6Kzr9t5Ri2n5RgM6ywqRd
 LIXWQe3GoJoYoB+XS+8TPhDFXZWR5ZrdJe+0Jc3ZGLcmdczXueZZ4y0V6Vr//zcHqBhWfB9HVi9
 V2aeptkNXK6m5eY4cTDsmgCc2l+gyKBIgfiYQ8khZoWhoZibFet2loeufVpIRKpPbHJ8/l0ngp+
 CHKqiughu5kmgl4+cIJj8RkxxND4xrUDOvymhjYCkF9j5WZotrKjkTc9icDQzU3S88W+NxTQi82
 RcUReO0Chp1JA8GI=
X-Google-Smtp-Source: AGHT+IGI8DfRA5rnQJOOhTz6HCH/XgvR71Jo4tXJgPBGvvQI727+wnnOGr434IcQceoHYBylPeCl1Q==
X-Received: by 2002:a17:90b:1d06:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-3087bbc4f53mr6443408a91.5.1745235404427; 
 Mon, 21 Apr 2025 04:36:44 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 04:36:44 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/3] drm/panel-edp: Add support for several panels
Date: Mon, 21 Apr 2025 19:36:34 +0800
Message-Id: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

AUO B140QAN08.H
BOE NE140WUM-N6S
CSW MNE007QS3-8

Zhengqiao Xia (3):
  drm/panel-edp: Add support for AUO B140QAN08.H panel
  drm/panel-edp: Add support for BOE NE140WUM-N6S panel
  drm/panel-edp: Add support for CSW MNE007QS3-8 panel

 drivers/gpu/drm/panel/panel-edp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.17.1

