Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0853191E9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 19:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80BA6E491;
	Thu, 11 Feb 2021 18:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE9A6E48D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 18:11:00 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id c5so4851357qth.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p28ioQ+e9LHUnarIWjsDgJkyQXx4nxF9gGosol0T7po=;
 b=UwYtniy3iBeG53LcuIBx4wjxwoQHKPU4Rgm85/PHBTfohw6DR1WNz1AUBjcFHrv8o8
 5aHqWY1QUFKouKZNBF31XFBq6huTUxNT3ZWBGLWz1iq+e67yKhZCVuQkaKU25nTTXuuH
 PQKGNQFOGQw9gjLBXbstpBc0tYnm4HNA46wwOi6A0fCQU0/5fDOJrAzzHzl7M158yYeP
 0kll2nrz6zJ21fEHJmOEucqxuscULxP9wrO0PiVteogiepbqc51Ty8+Yfk18UfPb+n7B
 Pvt7mF9A+zzs9okPKsZSiAbqnO0zo1+Nk6pFjs21PZC26vRHduZD9m8qTsysHSojdLTu
 V77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p28ioQ+e9LHUnarIWjsDgJkyQXx4nxF9gGosol0T7po=;
 b=PNI8E+fyh4C7fOekxhFn8qtnBRMqxRl06jQ+iSH159+ol7KSxX1n17cQaVr8RnCNkL
 o5Do1/HmqVFQOjGSuMMQNZv0sCaGBeqgAVUnObKQ42O3qA0k9A6ztJCG8gRKqGRi0kMc
 OqndYNDWS4iTCFgn16HSGhrH8cwFZcsEkAovVf4R+reXR/BwLRACMqS6XMQoqkg3E5vd
 0+IMwjGrAlZh4C3TcMBuYoOvB5/bT30jJYdawssZbi3/bN9ib/69PiFZW9zyup7LfcZt
 a6hyMLVTaux57DhqSwGt0M28BI+ATCndgxy2RTksmlk/tdn3uzij6+pxMpDcSOfVQ/wV
 8/nw==
X-Gm-Message-State: AOAM530gssNhQ8yx/BjVZkhC8aUPJ0je1QitXm0BlgpSsgXEUWiAYHFY
 w2UAnuTZY43q/ifB0QHs6nui3Q==
X-Google-Smtp-Source: ABdhPJxmKNRv94AJ/XLaNW2w9nibweQfdsOQu8zjlxout63qljBv8i0xys4lG7QLNdpAy0qCg/HNlQ==
X-Received: by 2002:ac8:51c7:: with SMTP id d7mr8575626qtn.302.1613067058455; 
 Thu, 11 Feb 2021 10:10:58 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id 11sm4615412qkm.25.2021.02.11.10.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 10:10:57 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8250: fix display nodes
Date: Thu, 11 Feb 2021 13:09:57 -0500
Message-Id: <20210211181002.22922-1-jonathan@marek.ca>
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

Jonathan Marek (2):
  drm/msm: add compatibles for sm8150/sm8250 display
  arm64: dts: qcom: sm8250: fix display nodes

 .../devicetree/bindings/display/msm/dpu.txt   |  4 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 34 +++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                 |  6 ++--
 4 files changed, 16 insertions(+), 30 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
