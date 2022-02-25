Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7C24C49DF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 16:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABE510E48A;
	Fri, 25 Feb 2022 15:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0310E48A;
 Fri, 25 Feb 2022 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645804705; x=1677340705;
 h=from:to:cc:subject:date:message-id;
 bh=E4XxBpQBXLuj4MbZ3LD7ymC2c81X3fk/VbDiDUlgP90=;
 b=dTLS5suPdi8g5/69qf++VvUkf8V9qwM4R4J9A7sWlXGbqNJDM1M7coSK
 ytjfZuCSv41gV/VCUf8o43//aQ02oPVEWkExOtCq+fwjMbuAWd4naAxMb
 Fn8LqcTHy+KRHNB/9sgju6rsjaXYMiBTGj7KgchQgnD1exUyAXxdC4QGy Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 25 Feb 2022 07:58:24 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Feb 2022 07:58:22 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg01-blr.qualcomm.com with ESMTP; 25 Feb 2022 21:28:10 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 3FD9D53E9; Fri, 25 Feb 2022 21:28:09 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Update mdp clk to max supported value to support
 higher refresh rates
Date: Fri, 25 Feb 2022 21:27:48 +0530
Message-Id: <1645804670-21898-1-git-send-email-quic_vpolimer@quicinc.com>
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

Vinod Polimera (2):
  arm64/dts/qcom/sc7280: remove assigned-clock-rate property for mdp clk
  drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table

 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 9 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
 2 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.7.4

