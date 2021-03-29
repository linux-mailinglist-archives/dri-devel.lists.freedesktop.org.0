Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804F34CF8D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 14:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6C36E3F9;
	Mon, 29 Mar 2021 12:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48516E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:01:00 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id o10so17980610lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=698miHjU8QPhMxdIPGrSpPRcB7+3WbXHAvlZkfluOik=;
 b=JX7qOGz4nkZ3ZR2P1A12dPwaRnK7Z96XKYj2kghAv5gksNFJBA2r/3AOGUSXL0m9Vw
 LvvFg4RIMkZZaeRw9KIVLvml2OT80eNHCLKfb2ZD/Bns4Gy1WgwtABXE+RAHaVmM4aQh
 +Y1Ma34HJhiYos+FpWGkj5h/F2u5dPBluAlEiDpFpUmBxci1Dk0P1u1DfR9MQsoK2o5d
 FawN080nMrYMI4XH6Yr4Veeq0Fh27vaVJjEVDhGfvN/KNlL4mrwXF6ldWqyD8T7Kpx2I
 fWUPb1ipcn/Ng6nwXjp2fpFaLcj+KG3DsC9S5u55n16oCppKhY5HC6JfBsycJAMV0CvQ
 lt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=698miHjU8QPhMxdIPGrSpPRcB7+3WbXHAvlZkfluOik=;
 b=gW1SHUrmcHDN8Vz0Uf3Gc6Dlf9+2ZJ1W2ax3J7+Xt74rDGGSuxTz1IE1bIs5kosDHI
 dsLUTZyJVC2rUCx/GklLC+0GSp/oip/2huJrR9ZNhncKbK+hDL6QPxO9wowPqV+BtGbs
 na534PVkOfWodsmlBrFgJP0GYMTyZuGDzW0vOr8UhEYjKpIXioE6fRh6C3EZD1Iva1BG
 V/yeUZIU031Wf6KVSJfwragRx+m54keqDYPYVDp0dG4G6PUCdpBd72ONx0m9oJ4YqxsP
 ckZ2SsSi65/Y+knKjrcpzBVp+DYM0VU2u4HllPM0sKwtauVq+9E3uDuYmXDFMwTzIc5g
 v+4w==
X-Gm-Message-State: AOAM531d2UEo9DEasP7vX23jGv2ksrhcUmd/XBDJs4tJ0n/9qnKqlUc0
 dIYlzAG3JUMqrvSPgVQCSBjl6g==
X-Google-Smtp-Source: ABdhPJxkbGirUfUXLXHbx1tMMrtYXyaTiDNA3VzlnSUVOzrnIafiD0+3ZIvqyBDxW0111g8SajWY1A==
X-Received: by 2002:a05:6512:ce:: with SMTP id
 c14mr16346063lfp.64.1617019258780; 
 Mon, 29 Mar 2021 05:00:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:00:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/4] arm64: dts: qcom: sm8250: fix display nodes
Date: Mon, 29 Mar 2021 15:00:47 +0300
Message-Id: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a series of patches developed by Jonathan Marek, and picked up
to split them, so that dts fixes can be picked up into stable branch

Add sm8150/sm8250 compatibles to drm/msm and fix the sm8250
display nodes.

v2: do not remove mmcx-supply from dispcc node
v3: remove references to dp_phy (missed this in v2, sorry for the spam)
v4: split patches to let fixes be picked up into stable branch

----------------------------------------------------------------
Jonathan Marek (4):
      arm64: dts: qcom: sm8250: fix display nodes
      dt-bindings: msm/disp: add compatibles for sm8150/sm8250 display
      drm/msm: add compatibles for sm8150/sm8250 display
      arm64: dts: qcom: sm8250: fix display nodes

 Documentation/devicetree/bindings/display/msm/dpu.txt |  4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi                  | 31 ++++++++-----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               |  2 ++
 drivers/gpu/drm/msm/msm_drv.c                         |  6 +++---
 4 files changed, 15 insertions(+), 28 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
