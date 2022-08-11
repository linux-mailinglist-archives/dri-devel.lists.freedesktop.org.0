Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4258F951
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EB8A6C39;
	Thu, 11 Aug 2022 08:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3F0A3DA1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:43:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z20so18637424ljq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NrZYSX3ODzXpebRjPy8XkH0oC+vo00qnzndpmnYi1I4=;
 b=m/bMng6FLs+7CY7pNO/OXjLamFk5vNDVIYCWtUPKj/IkXQzBoV6anAhzutPnrJRFaZ
 HeBjbhXlzaLqXzaPoXjxuRHANKJ6CakE+EI+DM2biMX6tmgK2fBBK7BDU0PEsmPjDf13
 D5tHCuds81IC08ZxRPyiX+gal6ahW1Ax2qm1yYNAY3fIYtGNyRxLckxRL9tz3bPLukwx
 7WRwQKHV+VRBNEdLcNPnOohmhFheYf/P6hcxgRlUCcX/9ZoqmBhrRx5vzZzYTxOt0IMm
 qBKyPtX1sWOIQO6uEWsu2AIt8IalZpmBZUkMNxw0EXH4zfYTsH72+O8OmbA3Kdl80UUq
 ZrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NrZYSX3ODzXpebRjPy8XkH0oC+vo00qnzndpmnYi1I4=;
 b=ttqbUGfz45368hSktQuVL4fXM/mx7PJuNkmm6gcy14BvXfNx8CaIIhbfRYUDR18upj
 7nSBb+Ul5++jbliBeBuCTgxbwhnpvzHZIzZDl7mLe4IXhKyGHLgMMA5ckenaNbYBhFXF
 B0lO1aU+HlDRzqsfXWI+KSkI3aV6ov2a4FlcauJG6jAfLg8yydG3oYfEmeRXpZ473Tdp
 PMukNVgSSaASL1tCmJTUi/Qel3noKRRAco25GYtGmGJFxgceDOPQ/OGu/wIdrT2AvHJD
 7+q+lsD1QhXZQjsCcQUxIACGab5j2vx/r15l0Nm5b2B6/wnv++olciF5KZcdnPhVkgbo
 ADsQ==
X-Gm-Message-State: ACgBeo3MXjuFjubZtgugFQj2pM9dNqntXenPumJLHkdrm9vlgK/uizcm
 +hAYgH2CFibgWhVtNskBbI0wSw==
X-Google-Smtp-Source: AA6agR7Zr+6RGGNJ3TJfgUxJlv4C80I+M+wAqypsOzqPCjDyqyfXzIF+2P0VGvZu1oKh1YSgGOQsKQ==
X-Received: by 2002:a2e:9056:0:b0:25d:64c0:27b1 with SMTP id
 n22-20020a2e9056000000b0025d64c027b1mr214976ljg.396.1660207415823; 
 Thu, 11 Aug 2022 01:43:35 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:43:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] dt-bindings: display/msm: dpu: opp-table fixes
Date: Thu, 11 Aug 2022 11:43:26 +0300
Message-Id: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

There is a conflicting series of
https://lore.kernel.org/all/20220710090040.35193-1-dmitry.baryshkov@linaro.org/
but I think this one here should go before to fix the issue before the
refactoring.

Best regards,
Krzysztof

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>

Krzysztof Kozlowski (5):
  dt-bindings: display/msm: dpu-msm8998: add missing DPU opp-table
  dt-bindings: display/msm: dpu-qcm2290: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sc7180: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sc7280: add missing DPU opp-table
  dt-bindings: display/msm: dpu-sdm845: add missing DPU opp-table

 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml | 3 +++
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 2 ++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml  | 2 ++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml  | 2 ++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml  | 3 +++
 5 files changed, 12 insertions(+)

-- 
2.34.1

