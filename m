Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDBC765EE1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A094610E61F;
	Thu, 27 Jul 2023 22:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01071502.me.com (qs51p00im-qukt01071502.me.com
 [17.57.155.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182010E61F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494746; bh=+yMY0ohtegHsjd/hVfvS5lvwXcdsut+yxwy4BJPQo88=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=teVTo2CFfdpWb8jsL3Wll5BqBrXd1SGLPa1SQec5ZF8wvDTXshsC52ZpifSNWvuTa
 awHoGdcf3etmRrfVdt2G+AEyKuYdpQb3wNCZhLCfrtySAayKATJyxDKA/08MqJ9Id5
 luG2PM8p9kNYQlE6ZFufwParlwsUrZUoyjuSYdV1gcbOGG+k+fEo6bVvt186D0epCL
 Q+FNTvhnk8FPKTvpbLn0R9cNhlHzz5J5rtjRBLD7ina6DUTTO/aLTNFcGCVRPCiPUe
 /QIYmfx63kmFdt7GmG/RBRgc3O8y2GBTsiqy+E9m5TgsnbOQTcJTpK7gByNUyjghAT
 X3CV1JtsoPBxw==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01071502.me.com (Postfix) with ESMTPSA id
 5B59B668068A; Thu, 27 Jul 2023 21:52:25 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 02/14] dt-bindings: display: add st,
 stih418-vtg compatible for sti vtg
Date: Thu, 27 Jul 2023 21:51:26 +0000
Message-Id: <20230727215141.53910-3-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UWnD-uZ5rLJpWTxkueyAUge1OYUeBQyH
X-Proofpoint-ORIG-GUID: UWnD-uZ5rLJpWTxkueyAUge1OYUeBQyH
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=606 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270198
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new compatible in st,stih4xx.txt in order to support sti vtg on
stih418 platforms.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 Documentation/devicetree/bindings/display/st,stih4xx.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/st,stih4xx.txt b/Documentation/devicetree/bindings/display/st,stih4xx.txt
index 6778b3e7ad5b..5450e1db8b8d 100644
--- a/Documentation/devicetree/bindings/display/st,stih4xx.txt
+++ b/Documentation/devicetree/bindings/display/st,stih4xx.txt
@@ -2,7 +2,7 @@ STMicroelectronics stih4xx platforms
 
 - sti-vtg: video timing generator
   Required properties:
-  - compatible: "st,vtg"
+  - compatible: "st,vtg" or "st,stih418-vtg"
   - reg: Physical base address of the IP registers and length of memory mapped region.
   Optional properties:
   - interrupts : VTG interrupt number to the CPU.
-- 
2.34.1

