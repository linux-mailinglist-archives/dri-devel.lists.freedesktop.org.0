Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F84CB85E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1681D10EE9E;
	Thu,  3 Mar 2022 08:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5243A10EE9E;
 Thu,  3 Mar 2022 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646294923; x=1677830923;
 h=from:to:cc:subject:date:message-id;
 bh=+bYsDhgswS3zG/uB6uGZaEGIcMgyRUKoKz7L41FkkoU=;
 b=eBd+JUU/IFx27mV61HRhVB1S1O1NYmYrWWhgP7RZHgaiUanCsPQrf5D+
 qnqjkac1cXfKMEoxnl6vrfGBtVkMgnQwlwDKcO5+7nLW1+OBtgpcoH58Z
 /F48J7OwkOvSahSFVTYQDZs91KSVGUn4jqCZah7lbil+P52GY1SQE46oC g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 03 Mar 2022 00:08:43 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Mar 2022 00:08:41 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 03 Mar 2022 13:38:29 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 166B64E1B; Thu,  3 Mar 2022 13:38:28 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/3] Update mdp clk to max supported value to support
 higher refresh rates
Date: Thu,  3 Mar 2022 13:38:21 +0530
Message-Id: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

*** BLURB HERE ***

Vinod Polimera (3):
  arm64/dts/qcom/sc7280: remove assigned-clock-rate property for mdp clk
  arm64/dts/qcom/sc7180: remove assigned-clock-rate property for mdp clk
  arm64/dts/qcom/sdm845: remove assigned-clock-rate property for mdp clk

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
 3 files changed, 6 insertions(+), 21 deletions(-)

-- 
2.7.4

