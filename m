Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EBB99195D
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2024 20:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBBF10E2C7;
	Sat,  5 Oct 2024 18:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.b="UVzUTy9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from st43p00im-ztfb10073301.me.com (st43p00im-ztfb10073301.me.com
 [17.58.63.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9446A10E2C7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2024 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1728151743; bh=ZhPhTWXU0skZ/HI5SHs4S26BqfVlCdZwrR6/Jdzn/1o=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
 b=UVzUTy9J125gWcUUi36KbsFcgE0jnAAuaMXuR6pQwANwxQIP+huBV4igvtfIOR6Jw
 ZuEsjx3yU4KL40ivjJV6ydON5CRJrGnq+/Y3H/GapenBTbLKD+jG+uTB1tdhxGsJbi
 sTETT1ZwXxEyydOxOdRMDdbcSi9gzEy0V60kT0RfReLLQfZsnbSPiWMoqU8frYCCC7
 sOEF4/jYM/4pF4ZU4IVrB2vV343n7IQLbrbh9/jrEFRpviiJkMxFLMgFC+sSoU3ICL
 Ui9+QcONknIcbuRZXksNX3StH0YaoXtlu516iD0UbbgRwceLFLZSoMwPskmn9ro2FH
 bMGlFRveg4H1A==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-ztfb10073301.me.com (Postfix) with ESMTPSA id
 414A88001DC; Sat,  5 Oct 2024 18:09:01 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
Date: Sat, 05 Oct 2024 18:07:59 +0000
Subject: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add ST sti compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-sti-gpu-v1-1-9bc11100b54b@me.com>
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
X-Proofpoint-ORIG-GUID: lJDHjayoU8Hude1I6tz2rld_PMnry1X6
X-Proofpoint-GUID: lJDHjayoU8Hude1I6tz2rld_PMnry1X6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_17,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxlogscore=726 classifier=spam adjust=0 reason=mlx scancount=1
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

ST STi SoC family (stih410, stih418) has a Mali400.
Add a compatible for it.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index abd4aa335fbcebafc9164bd4963f9db60f0450c4..97a7ef0fea1a10df0ff485b9eb4468f44c92da39 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -33,6 +33,7 @@ properties:
               - rockchip,rk3188-mali
               - rockchip,rk3228-mali
               - samsung,exynos4210-mali
+              - st,sti-mali
               - stericsson,db8500-mali
               - xlnx,zynqmp-mali
           - const: arm,mali-400

-- 
2.43.0

