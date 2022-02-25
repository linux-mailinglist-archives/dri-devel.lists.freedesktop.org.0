Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7F4C4E89
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 20:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCB610E1DB;
	Fri, 25 Feb 2022 19:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACFD10E1DB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 19:21:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645816910; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tZD1ax3jsnPy6TzQA2DQRsI4QX4jijvlAnNWj4gYHnE=;
 b=PfseZ/NVU5EaCzhS/CaFUXRQNR6zN5y9wL/uLVV4OQSnuTFeeIx8FPu9yGc3A+/BE+aCkJ27
 m2gT3WS48UGUHhNyJMcIQvODn8AndVQPNBYkYesSftRjb5QJdyXbvIBjTnFtE6eKLAipRTry
 U0ljzlPa0/5IhEP+UG0Htx7rkwc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 62192c4c0f85aa2ea3daeab9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Feb 2022 19:21:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EACF6C43639; Fri, 25 Feb 2022 19:21:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 152C0C4338F;
 Fri, 25 Feb 2022 19:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 152C0C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/5] Support 7c3 gpu SKUs
Date: Sat, 26 Feb 2022 00:51:27 +0530
Message-Id: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Andy Gross <agross@kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series supercedes [1]. Major change in this series is that it is now
optional to include a gpu name in the gpu-list. This helps to avoid the
confusion when we have different SKUs with different gpu names. And also
I am pretty happy that the overall changes are smaller now.

[1] https://patchwork.freedesktop.org/series/99048/

Changes in v2:
- use devm_kasprintf() to generate gpu name (Rob)

Akhil P Oommen (5):
  drm/msm: Use generic name for gpu resources
  drm/msm/adreno: Generate name from chipid for 7c3
  drm/msm/a6xx: Add support for 7c3 SKUs
  drm/msm/adreno: Expose speedbin to userspace
  arm64: dts: qcom: sc7280: Support gpu speedbin

 arch/arm64/boot/dts/qcom/sc7280.dtsi       | 46 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 18 ++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 36 +++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  3 ++
 drivers/gpu/drm/msm/msm_gpu.c              |  4 +--
 6 files changed, 97 insertions(+), 11 deletions(-)

-- 
2.7.4

