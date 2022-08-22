Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A259C717
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE591125D0;
	Mon, 22 Aug 2022 18:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B84010EF9A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:49:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id s1so13757432lfp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=rsjsUi5j29pEEYwqLrOimHSSjS8I1Tzv9QAdiQT8qPo=;
 b=LQGklJCGzJGKHdWBkted5ByOVqUVC7J0izLl28gYCPluIn7L0Ez6NyrkxwrK2a8q8p
 Ktftb7A2PEroo6wEZIwBtcIIsxvDh2fMVcQv1waPpo0s1Jspg7npBdJLUG7y+h2MNCzN
 1oYGU7Rmveduyu1Rx+gFlFujMnRVyItJxagzMVfJAZb+kfiqUkHKQnPYR9bV+VkGTg7O
 3uFyHLmSr5XOsciaST3frULP/uFly4YD6sZd7ubkRkbfy5YX3IMBGsfC4I6Kn7Mq4KXl
 KUzV/QFF3ngPfyhbg1vuYJ6yRdVo28JJWd9Hr0P57j3KRWL0j44wAaeMWCAHeNwB8mNU
 mtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=rsjsUi5j29pEEYwqLrOimHSSjS8I1Tzv9QAdiQT8qPo=;
 b=axBalpQxI4udgRGST7E/COXZEKBZ1wjZB2aqFCOn7RJiS4hxv6iQGwHBkrXWDtepYc
 y0sH5ejlVMphnjR/v7oqvaScuAstofrsHgYJoUphbbsC7x484D6mwCtqv3EQJyc0dqac
 CkcL3SKkM6sE+bdmBjnJl6VfKm2A5f7YeBPTY4DEqR0sraSwm+alcqi9MDG/CGqXv9Ct
 B8FyubSy/cULH9bl64xhaQFQMcMKkI+lmFkEBS/j9ucVEJ7GSpUZv+ldZ+t7ghBJSI5T
 7y4S3aR6AIEAEHVyJyLrhE9o2evksdpmIk7++14eGP8J0kP1DQAU1GByl9RJpCS/HCeY
 WxJg==
X-Gm-Message-State: ACgBeo1gfdYMa12b9+xnhew64PnAwRw3YO2TnHZaw6aCcrMkiequf/Y1
 A6xj013sdNzGDYjjvktWLD8ZZA==
X-Google-Smtp-Source: AA6agR5DtSe4fBaOZwmnol1A/9xLdl1qZkv2nRAnVVepcoZn0MEJuGyfMi+XYztw6sZ5o48fs5c2NA==
X-Received: by 2002:a19:5f4f:0:b0:492:e5d9:a0eb with SMTP id
 a15-20020a195f4f000000b00492e5d9a0ebmr1992808lfj.377.1661194141378; 
 Mon, 22 Aug 2022 11:49:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 w11-20020a05651c118b00b00261bc05c461sm1672599ljo.50.2022.08.22.11.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:49:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/3] dt-bindings: msm/dp: cleanup Qualcomm DP and eDP
 bidndings
Date: Mon, 22 Aug 2022 21:48:57 +0300
Message-Id: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix several issues with the DP and eDP bindings on the Qualcomm
platforms. While we are at it, fix several small issues with platform
files declaring these controllers.

Changes since v2:
 - Fixed commit message for the patch 1 to mention proper commit IDs.
 - Dropped dts patches which were picked up by respective tree.

Changes since v1:
 - Reordered patches to cleanup dts first, to remove warnings from DP
   schema
 - Split DP register blocks in sc7180.dtsi and sc7280.dtsi
 - Cleaned up the p1 register block handling: marked it as required for DP
   and absent for eDP controllers
 - Dropped unused xo and ref clocks from sc7280-edp node, they belong to
   eDP PHY.

Dmitry Baryshkov (3):
  dt-bindings: msm/dp: mark vdda supplies as deprecated
  dt-bindings: msm/dp: add missing properties
  dt-bindings: msm/dp: handle DP vs eDP difference

 .../bindings/display/msm/dp-controller.yaml   | 47 ++++++++++++++++---
 1 file changed, 41 insertions(+), 6 deletions(-)

-- 
2.35.1

