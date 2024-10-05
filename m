Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92A991959
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 20:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C6F10E2C4;
	Sat,  5 Oct 2024 18:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.b="Uo7kWnRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from st43p00im-zteg10071901.me.com (st43p00im-zteg10071901.me.com
 [17.58.63.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC88D10E2C4
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 18:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1728151764; bh=Rb4uSMd3WuIyW+3aNpC7juKYGvVxUYO7LHjTErftlXk=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
 b=Uo7kWnRk3NXcfY0YVggAkw/8WRmpojcs6yFEEk+/LM5e8ZW3eIUcO0nmoh6zfec2i
 EJNoIumdgLiJ75d9g+abtY4jQnFP0+VOI7YhpZj+52BX65urnULb5INLR2HqZN6zBv
 zNuarv5gLeYho3ABUmDGYvb20OIawtNIpj40iCt4/0m+v3BQj60QIrM5kJ8fB3jT+I
 QVot+Kz3p4zUtngQoIGCLzwgdi2YzTFfSvVGwj46VIFVHQTT18R7Kvcj1HXXaSipCR
 axEc4XNxywNUndw/l5ObihaTL34Ca4lNK4XRCwOiEHacRmEo5D3pJVVRM8jk4pAV3w
 5VNNLBlX/vGWw==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-zteg10071901.me.com (Postfix) with ESMTPSA id
 BE410AA0227; Sat,  5 Oct 2024 18:09:19 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
Date: Sat, 05 Oct 2024 18:08:01 +0000
Subject: [PATCH 3/3] ARM: dts: st: enable the MALI gpu on the stih410-b2260
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-sti-gpu-v1-3-9bc11100b54b@me.com>
References: <20241005-sti-gpu-v1-0-9bc11100b54b@me.com>
In-Reply-To: <20241005-sti-gpu-v1-0-9bc11100b54b@me.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alain Volmat <avolmat@me.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: e0gSJDYpB3fg5-jlGs0tgSltEINQFDQO
X-Proofpoint-GUID: e0gSJDYpB3fg5-jlGs0tgSltEINQFDQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_17,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 mlxlogscore=438
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410050133
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
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

Enable the GPU on the stih410-b2260 board.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/st/stih410-b2260.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
index 240b62040000b8c0357d39504d3475186958bf31..736b1e059b0a8f122d1b824e1f4e5db0a668ec2c 100644
--- a/arch/arm/boot/dts/st/stih410-b2260.dts
+++ b/arch/arm/boot/dts/st/stih410-b2260.dts
@@ -206,5 +206,9 @@ hdmiddc: i2c@9541000 {
 		sata1: sata@9b28000 {
 			status = "okay";
 		};
+
+		gpu: gpu@9f00000 {
+			status = "okay";
+		};
 	};
 };

-- 
2.43.0

