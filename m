Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA2C38CF2
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D148F10E7E5;
	Thu,  6 Nov 2025 02:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="eAVNbjfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC6110E7E5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394952;
 bh=x0b6nYcdg7hiAcKdA4JhGlxHiilGQ3K7Dert+al7aoA=;
 h=From:To:Subject:Date:Message-Id;
 b=eAVNbjfYg0CL4Supsc+pa9TpjKXzERu2cVXtKnWZG4aAbb0OHjsEP9JqzWfYBFWV4
 Tlk3Bcxzdu0FrL8ZFGjE5nEak0UJQZDpLMHGn3uRtU85XAWBO0xLGCy97cbOZRLVNb
 NPPTeuceIWEl/q9TrMlLvhD0qhQ54HxHGjpXBh+o=
X-QQ-mid: esmtpgz15t1762394808tb962b6a1
X-QQ-Originating-IP: Kxt++LRpNywAhVRcx54Iw5qydXwjg4t+r/VQWDBNVZU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:06:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3992485569025743558
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 1/9] dt-bindings: ili9881c: Add compatible string for
 Wanchanglong w552946aaa
Date: Thu,  6 Nov 2025 10:06:24 +0800
Message-Id: <20251106020632.92-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N1UDvtkj1jv29kmTaVLc2WfWhigXiY2453h1mZCCKc8HgMbhn3zXe0dh
 tHivpSIaeas+BAT+khDY5nM6HwK4YSLRi6fI2x7ftD86xsfkFYpJZxadqCPKAas9VAs39a+
 kriFKGl1gejYEjw34DoPTEvM9ktcJyYQqrx3bwx9xfFVkH131QLA5lshOlZpanA6kv7fOxB
 x+HOvh01E98syyMmh/RY2LGKCHLxJwpOolrp5vp4qUdVzYA2w9plSj8wwk/q3wqPT45NSoh
 lJrxRz3MyjDBtAJr2gSXHEDsF6JonxfIV6z8EqjCPtWQJ6AXKDndzCCKSrFAvF29WEZS105
 BmdPbY2Qwp/d0b20EkGJmRV+UxeZP0voMesNvX9oZFr2TAoP1vBVeQJP9WtyU2J0URJTD6l
 5m9OGLrpkCs69rzYcc4W+E0pm1FrrOj4Q1RzwgrDE2PKGjNgKIIE7J0pcvMqOKNDiTqe2et
 Z3NDy7TWWYYWEWfSkDPRjW83tJYaP9i/Ns+BI6OReyg2V6zEMLr7ZYrJSm/Gq0hnyKTbo7R
 0tA8zyRWmR02aefjubYobV9nGb46jQX4jbQMEz/7xN6l213f6TqSFMTwXsYcvmkd/bAPKll
 C6hUEXUdD/wH07EtyQ59ArUbqF1H+MB3h/SjYdCnEIWESjTvXkaJpqqD4xhiAZJk5/2XuFV
 y1r80zi1jx5YZLJZYeOVJNW4hkJ58qVpWAurA7bI39hXiy4JCm/WNtVUpQ4L63dQ7tQHErG
 9H2ajqH0QJFvoT+V++m3mHgvWVIPqIV8Ln1kkWCtVAwE2hlJYMFBYPrSeV6Loy/Tp8XOx9G
 WCYP2WsO3H6CVXSBQaGiO6PO83FqUTGCpkQSmAJqpqwVMjCa8OsvxgrVKunU8a21PXnkCzM
 Vpt1N7Nn+NeMdDheQL9GT5Qse3uGWty3gIPm+IXIRau3dLN7zpxqqB+gA8jEgfGSHrFWnwA
 kfN1hFt/RQ1Dkfs4XYJSkNk98QW3CiqTL1WpH4GsVNkKg2fQ9t9JfQ8IpSRuvljOcyM54Xo
 unHZQsTTTD6BcXsMUW0yKWomSZhwChgQlIGL7r/g==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Like w552946aba, w552946aaa uses the Ilitek ILI9881D controller chip,
and it supports up to 2 lanes.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 434cc6af9c95..f331a47cc759 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -23,6 +23,7 @@ properties:
           - raspberrypi,dsi-7inch
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - wanchanglong,w552946aaa
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
-- 
2.51.1

