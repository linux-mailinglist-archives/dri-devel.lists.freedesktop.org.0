Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB431BE94
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 17:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6776E8DD;
	Mon, 15 Feb 2021 16:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF686E8D5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 16:16:40 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m144so6793053qke.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zI/vme6L5zTS+JUbt3TZt+qvFZC6hwyCTXjo3SFjNA8=;
 b=W3+bs3TIbLKEKVEWyOaRzLE+XoqcTWdp6JgnNG0qAU2/I2jiTWbW2qMv0fEhHJ7gVd
 SunYU90VMDHHOKh4tbwdvJGlZiRzuj9wJ7F5Icnn3vK3B5cvUfS3jjxS4FE0BKIK5j5E
 PUhoBv9TFoTn+GqkMa1R1HT67bitkfgonQMe5PcWI7RoD83fFgY9XAUxzGg6yOZuvY8I
 /qXDL5ZkVJBSOT+epRlBYnDhJFaY4hlCeOjcV/efPXM4cbz3VIZHOLgaDNekTB01vVqx
 Chzw8DtLpscI1bqsXOdsIwWdP64ReLgId1RPU6Cqi7G+NIFec35WIWHQO5/Gy/StiP1t
 JhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zI/vme6L5zTS+JUbt3TZt+qvFZC6hwyCTXjo3SFjNA8=;
 b=DyYxY34ulNKLWMYDulU6tgo4/ohpxQRyGn4aEzOgn83B7l6j0TGlMp4kgbFgoC63X/
 IWY1Xqj3G77XPOBBHvSAPrJmqX8gFBQ1Vv7VVLNGWJgEan0ZLSpLafoc0LOyTQqdTPpZ
 joL8YvN/vqnRF1EJ7oRYjXRhYWcy5M1jSbfVgIcTBtzoYIc9R97ukYaJ9a0V/bAbt08m
 tE4GvmSLlYbURZqmseqv6xR3TAOCpH39WouYkOun1wXC/9ZZ3Ga6WM02bI6gkddviKDs
 scdOfW0WZoRzlYwc+LmbNU3GJe+J1Wlca6vT0fcNl6P7Ny8+qOMpyK8APDfFZaztI7r5
 lkYw==
X-Gm-Message-State: AOAM5300lyht7baiPZesoF6siOBlyxNUGTmJ8EuKBECe+a8y8FPxCrr3
 ZaLtC7BMXsAWZvXfum1BEkMmxA==
X-Google-Smtp-Source: ABdhPJxzjPCzJ7MLbj3Ud0yAixQXe48Db6t2j8gXRl6cQKt2VbaHWevVqB+Rx2F1g33Q69egieRChg==
X-Received: by 2002:a37:6ca:: with SMTP id 193mr15363303qkg.436.1613405799609; 
 Mon, 15 Feb 2021 08:16:39 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id j124sm12225227qkf.113.2021.02.15.08.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 08:16:38 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8250: fix display nodes
Date: Mon, 15 Feb 2021 11:15:32 -0500
Message-Id: <20210215161537.14696-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Drew Davenport <ddavenport@chromium.org>, Andy Gross <agross@kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 tongtiangen <tongtiangen@huawei.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add sm8150/sm8250 compatibles to drm/msm and fix the sm8250
display nodes.

v2: do not remove mmcx-supply from dispcc node

Jonathan Marek (2):
  drm/msm: add compatibles for sm8150/sm8250 display
  arm64: dts: qcom: sm8250: fix display nodes

 .../devicetree/bindings/display/msm/dpu.txt   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                 |  6 ++--
 4 files changed, 16 insertions(+), 29 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
