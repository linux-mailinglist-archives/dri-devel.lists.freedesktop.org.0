Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CE20EF90
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE9E89DFB;
	Tue, 30 Jun 2020 07:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FF589CB9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:49:24 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g11so8506669qvs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kuWeoCHuc/prOGvBHvvx+Eyg6Z2nKOC6TsX81jgFqt4=;
 b=aak1v9uve4kyxwvd+x7Df+Wf6cXWmrmolKMAuKVWTghvCHOXv6e4A10ENI3HjVU0bP
 fdE32jJE9unnlHaqKcU1ukM5EDT5GxPEeE2Nu3XiiSlZfSZ7z+BPihLMAPzz4dvsC8Xs
 vYFOTsLonPjpRIBTdDDoAomMyt6GdC88yGQ+NnVK9UmVc3lr1WLljWoBoa/HFFeD9EFR
 PCZkK4UGPuPfstmsQnXvzjo9mF3J+cgKol/v0YghliTA8MZmdmeQZEss0NqM8FuPYf9Y
 vZBk10824u4vmj/sT7jLgKWasVPSVO3s7a4OdN7GUipsNh8XGS6nEEVRxzSsEfZ7CnAW
 qcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kuWeoCHuc/prOGvBHvvx+Eyg6Z2nKOC6TsX81jgFqt4=;
 b=TsDlchJ5G+t0INsv++3Qkt91EznXVN3pDLx8xotZupZMhCFbVINv6EsNl0o69R2eEW
 Y5ivN4QBs0nrcjY0WIkQurD/qhLE4w40exg9V+WTR2CzMO/1yXlHzecZGheaTy24GE1v
 Muj54AoOfi0iC4ll/XYOYeEIao/4jGgK6IhPBglywbHEj+5GHhEtignaE/LMhxIix6E5
 k7yBjUNQ+PElJiUDyRKlI+VFagCaFrVFvqeGk1/jSy2F/1sugagoIFkXGFrYVL4ctYHa
 eBiTDs1Hpd226DO4XiGT/XIWK0ZEQFfgHuuBd2zciLQFjcCPhvMO/dkBT5qVPwRZDSE+
 SAYw==
X-Gm-Message-State: AOAM531VK+xVgBGCaBrtqwueY9rp7U7mfZThWv+9nNDIjLfSaIspj+hN
 doVI+Rascd3Vl1AbUK9teqUfrQ==
X-Google-Smtp-Source: ABdhPJyJ2d0tCp5izifxJz64EqQHHdsaCCZq5JobW3wQx1DkNT/z73gSlzRnTXVU5Cqq6pptF4ym9w==
X-Received: by 2002:a0c:f788:: with SMTP id s8mr17077923qvn.169.1593474563286; 
 Mon, 29 Jun 2020 16:49:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n64sm1541076qke.77.2020.06.29.16.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:49:22 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/a6xx: add A640/A650 hwcg
Date: Mon, 29 Jun 2020 19:49:12 -0400
Message-Id: <20200629234921.3511-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:53 +0000
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize hardware clock-gating registers on A640 and A650 GPUs.

I put the hwcg tables in adreno_device.c, but maybe it makes more
sense to keep them in a6xx_gpu.c? (this would allow switching a5xx
to use the gpulist too.. it isn't possible to include both a6xx.xml.h
and a5xx.xml.h in adreno_device.c)

Jonathan Marek (2):
  drm/msm/a6xx: hwcg tables in gpulist
  drm/msm/a6xx: add A640/A650 hwcg

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 140 ++-----------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 219 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   7 +
 4 files changed, 251 insertions(+), 123 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
