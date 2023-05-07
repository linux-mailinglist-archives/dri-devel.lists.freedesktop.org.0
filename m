Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FCE6F9B1A
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 21:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F1110E2D1;
	Sun,  7 May 2023 19:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B3610E2C5
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 19:07:40 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f11d267d8bso4167775e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683486457; x=1686078457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ABYh65MiyXgMJl63EwNEzCBdTUVUiEBGqjwe8UOHeKM=;
 b=M982EYGuMsxmmYzxbSQtS8NJjohJSOLCLVfdiYxkXIab6wwd1RrTroB/7z/tZxHCpY
 eOAtxgNNWgkwcm8kWF2bewDJi8o7yVl5LVwwvGTM7HG5gUb/fnXvcGSP9OloTKDWQx01
 34orH3O0Ez6TkEh/rbnC2whWt7I7CrSrdUy2XFne37bkTrDYtewp4fCvMLEHUJCo5EF3
 MmTxdbg6MSXP6bHJHpxZ5GQEijWZtTx6Nxkgk6H86yq60/3ffwcAs+3AEVINMwmAmg54
 SMjtLK3/dmYEfc1nonHM5bgJ+xPZqORqVQovHGeDJPc8Xj+dYddTdVsT1ODK+5UXWCtH
 0/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683486457; x=1686078457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ABYh65MiyXgMJl63EwNEzCBdTUVUiEBGqjwe8UOHeKM=;
 b=llvCB4DvXKkvmSpepl0nHnm5xrcC5y2auAyW/GWZ2UdZzUh6hjya0mS4Gc0uZm1+nY
 2hPIa/cuhjcIcQ8NJd7XhLnJ+L35enOwMFR/Qkc9eMjB15fNWFGlFGXZUgRKVIXtVcw0
 ZRJyKxmzBtOgp952CHE9ge8hUfuKj2KNSiDMTjq74qHUfnmaarzvKHs6xENLRH3KLzp4
 U6UELlfMiRsKxN9Ba9armqLVQfW26DqgEFovJnwIBopaZAqtszQ+y4+0M+rPR9/5S85/
 y9F+isp0P/CsHL1Oc1YbUP9qJnTOqFMPrDuCQgDkx04w+RjsJFWXt4JyiBrk6GDDYOu6
 aS4g==
X-Gm-Message-State: AC+VfDzCOjtkuCHSnPVY6W2GCv7QB2o9kT16RwLSz4FmEMuXf9bvx0/9
 IPQL3/vAinuN7CB0hy0iDknQzA==
X-Google-Smtp-Source: ACHHUZ5XoFeyN2O3kCNUI3REy8stWt4PK64GzNK+eCFHUD3RmZWA0TwqgFWE5NXWZoItmKzKSeqEhg==
X-Received: by 2002:a05:6512:11e8:b0:4f1:1de7:1ab6 with SMTP id
 p8-20020a05651211e800b004f11de71ab6mr1985504lfs.20.1683486457160; 
 Sun, 07 May 2023 12:07:37 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 12:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/4] ARM: dts: qcom: apq8074-dragonboard enable DSI and
 remoteproc
Date: Sun,  7 May 2023 22:07:31 +0300
Message-Id: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable GPU, DSI panel and remoteprocs on the APQ8074 dragonboard device.

Dmitry Baryshkov (4):
  ARM: dts: qcom: msm8974: add ocmem clock to GPU
  ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
  ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
  ARM: dts: qcom: apq8074-dragonboard: enable DSI panel

 .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 83 +++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  3 +-
 2 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.39.2

