Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE689FEE86
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32D10E626;
	Tue, 31 Dec 2024 09:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="CBl7s6Mx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87EE810E626
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=pg0Uf
 V4prOtW7FOVVRBO2lYE1N8dbmghRAassomDga4=; b=CBl7s6Mx6gtwsmDOtiqAZ
 2s0SKfQ8p9At50xZ+X7JTIA6D6uFFBZeT+59xcyptwKwR32TsTb4NFmJMPsjmvMt
 abWdDyQYED3EvS5JNIviDVyhyylyghqAjeDjdayRYQkV5nfe84F3ZzpakPaI4g1R
 CrSCh4gHXn4gwK1YUqLzU4=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3v8P6vHNnCZWrCw--.29543S4; 
 Tue, 31 Dec 2024 17:44:31 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org, mripard@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 2/3] dt-bindings: display: rockchip: Add rk3576 hdmi
 controller
Date: Tue, 31 Dec 2024 17:44:18 +0800
Message-ID: <20241231094425.253398-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231094425.253398-1-andyshrk@163.com>
References: <20241231094425.253398-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v8P6vHNnCZWrCw--.29543S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW3Kr4UZr1UWF4UKF1ftFb_yoWDXrbEqa
 4xZ3Z8ZFs5Zr1Y9w1DJ397Wws8Ja17KF4kGa1UAF4DJa4kKrZYqr95G343KFykAF17uFyx
 CFn5XrWUG3ZxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8OTmDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hnGXmdzt4WQFgABsy
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

From: Andy Yan <andy.yan@rock-chips.com>

RK3576 HDMI TX Controller is very similar to that of RK3588, but
with some control bits for IO and interrupts status scattered across
different GRF.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index d8e761865f27..b838b5ec2dca 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -29,6 +29,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - rockchip,rk3576-dw-hdmi-qp
       - rockchip,rk3588-dw-hdmi-qp
 
   reg:
-- 
2.34.1

