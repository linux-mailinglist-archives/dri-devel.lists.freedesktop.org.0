Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A0546FC4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 00:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E37610E353;
	Fri, 10 Jun 2022 22:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F19610E353;
 Fri, 10 Jun 2022 22:53:45 +0000 (UTC)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id AE08DCD391;
 Fri, 10 Jun 2022 22:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1654901593; bh=88+qj1kVLsROnvBzdihA9DB1rFfJnLoQ5W2nf9uKvFQ=;
 h=From:To:Cc:Subject:Date;
 b=EE+jhgrFAT0mU76Udy+p+jgMSf1oqrket44WRuxIxT4m2y70RYXK7zmbCz5mV3Ew0
 NRMR0DfQD4uQgdMTn8UM4j3kqjZDWwi+Qxp9/aHpLDODjVCNrFZfgKocZKUMSupSxf
 JCIKBgOnBj5uvBy7+puEKXrRNBI8xCn6oo6ugDb0=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/mdp5: Add perf data for MDP v1.16
Date: Sat, 11 Jun 2022 00:53:02 +0200
Message-Id: <20220610225304.267508-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
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
Cc: James Willcox <jwillcox@squareup.com>,
 Sireesh Kodali <sireeshkodali1@gmail.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add the perf data for the mdp found in msm8953.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 1bf9ff5dbabc..b17f868ffca8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -837,6 +837,11 @@ static const struct mdp5_cfg_hw msm8x53_config = {
 			[2] = INTF_DSI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 400000000,
 };
 
-- 
2.36.1

