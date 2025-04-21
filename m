Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304EA94B64
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 05:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E410E295;
	Mon, 21 Apr 2025 03:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="ZhqEXXby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (unknown [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4B310E1CF;
 Mon, 21 Apr 2025 03:09:45 +0000 (UTC)
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
 by mail.mainlining.org (Postfix) with ESMTPSA id C66E2BBAD3;
 Mon, 21 Apr 2025 03:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1745204966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=upc2Z9fNOesc767S0bVo32jvZMookaLGNX2YH6V7peE=;
 b=ZhqEXXbyiKMc568CgSt9qOAEbmV1gJxaCuiqa9Jk+6EdjHnquXp4+/2XSMjkjRwy33XJ2u
 JcF/0mOp1vM2nVQYlZJS3CfkDYhV5Eaj/xNHeyjjPXGiTRMy9Ht3ZkHBASXiVghJNEkQiG
 3IgqWbtnThvpGNGCJqx7LvAFKMpM6IJbPsk5UL5VCMwh00Ocg3eJCpai6cnLeMULDD1ITc
 btBiPL9Dkc6JJflNiyEUSC1sCxmLaNnGwXS+Ij0DxUVhzxZQKSqHh9q4sXH/lQGYnkiZKd
 GsfBCaL62i12flaTQxEcnMHyzuqfNFObid1HuuW0Oo0Bg6FRUcj7WkSb9NubxA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/3] Document clocks of Adreno 505/506/510
Date: Mon, 21 Apr 2025 05:09:20 +0200
Message-Id: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOC2BWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyND3UTTigrd4uSM1NxE3UTLJDMTy6RkixTTVCWgjoKi1LTMCrBp0bG
 1tQDv0iQJXQAAAA==
X-Change-ID: 20250421-a5xx-schema-a9b649bc8d5e
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=835;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=udvxFOdL1d8Pc5hkXWwwmhNUJU7Z9gB45D344Dqsgnc=;
 b=XQxscjx86DEwyCIYjFi0UMlJYf0J5p1deNHt1PhSjkWian1grQ0/X8Y+zsx5bySwCVGH+QtFS
 2TaSeA8qtV5A4E47uFPxz2Z8qm7OkXXOYdaQelGORsHYaG5nYMdpz/x
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch set documents Adreno 505/506/510 clocks
with the missing alwayson clock and enforce their order.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (3):
      dt-bindings: display/msm/gpu: Document clocks of Adreno 505/506/510
      arm64: dts: qcom: msm8953: sort adreno clocks
      arm64: dts: qcom: msm8976: sort adreno clocks

 .../devicetree/bindings/display/msm/gpu.yaml       | 83 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              | 16 ++---
 arch/arm64/boot/dts/qcom/msm8976.dtsi              | 12 ++--
 3 files changed, 96 insertions(+), 15 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250421-a5xx-schema-a9b649bc8d5e

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>

