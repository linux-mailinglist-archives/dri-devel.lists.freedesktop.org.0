Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA6D4731A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B6910E7CE;
	Mon, 13 Dec 2021 16:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48B210E7CE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:25:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 13F66580231;
 Mon, 13 Dec 2021 11:25:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 13 Dec 2021 11:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LaqGq9k3e96Ss
 nfIaZzY6PvFcjX7UTH8jNMaasd9TiM=; b=a2F97ACCr1rd8lokc0EJ2Iehb3ubq
 ddBdKjkjCrwWjPhT4SQjvQOedyVy3bfBul+8Mv23KHOT1A+Nm63JYRJ9AwnZVl7q
 /+Sph7ufVo6FgF+9PVn6rv916l1ocK48978rFchB5l14usU27CxHMgaExcgR3+AM
 yoxog7OBZO4yL0W7RJ8cbEmyehSfyNhbHarDU/PDlWQcCMwfBVzLNjE1QlRZij6L
 yJ3jL3o1sEcg3m7lbE9nWAC4yADXFu/y2phTtpYq1geQq2ZUocQdYdkqfL9B3eMC
 a9j0Qq6W9a86awOzpDOFBOpQo0BBLx3/EKHYuDzdvqpBbk96wyW50enTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LaqGq9k3e96SsnfIaZzY6PvFcjX7UTH8jNMaasd9TiM=; b=mai/o/UZ
 jN13eF9UwlC6t7tKe1Nn0GFK0RkkQZmNyoPXIji8wDT7E/CFc+w24YLpTKLmJhju
 k8NXeqqcrXkMXX2VAHT7gcxwiyHpP/EH46TFAv1qVxcWnLIEX1HqqVsfJ/BB3hEF
 kOdhnjl1JpKsMrYU8n45biyrkmFZobormqBpSkhwxpElLOYxr1LliUDG6X7wrwQ4
 zV297sqbjtc4DX8kYo30kKaF+uIteQGjdFr07xe07lXwhkknJISLoGjgKV1uTQVf
 pbGw3xNTn2AlZAi7AnDeuNNnrtDEAcx+z5tTOtmfVgQqGQGyrIs3OWUD81CuAaQo
 VqLHPUIWU9Ujow==
X-ME-Sender: <xms:BXS3YfAT3fmdRBUdymuMuP5A1b0qAQ3xYIxPPL3qqwqUkftpVUF6xw>
 <xme:BXS3YVg5QcxwSs0KgSD5IsdrYKQ0anG9cOVJOvMyY8nsuEIzGMDGcunVib5trarIW
 bQQfuLbDBBP_OUyyxs>
X-ME-Received: <xmr:BXS3YanSyrVr8zjpBZdxDZUczbn7sVEGYeXCH_LzkCk-g_ysSMKjR75z7Q9OFevZln8dP2hqpuJMUCet7uAzY4GBCMk1q7DTzfmoW-Yr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BXS3YRz0TqeiiI7PMF6dJEwLspZ-MsaLXWHigbZhOXtmJDtU_NC0lg>
 <xmx:BXS3YUTcArofcElmx-wVpJsaPlFw8lkkDVvIOxRAPPLy0MRU1Ae1VQ>
 <xmx:BXS3YUZ9s0yv0Dyl2NdIv3eVsQK7t7sCOzNXUZkV0kPAjCIox77atA>
 <xmx:BnS3YVA9BRxBch2OSBYPzNz-UxwWmgG2N--0DMtFrJIHw28E8UoBNg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:25:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v4 0001/1584] dt-bindings: gpio: gpio-vf610: Add imx8ulp
 compatible string
Date: Mon, 13 Dec 2021 16:58:14 +0100
Message-Id: <20211213162437.248949-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213162437.248949-1-maxime@cerno.tech>
References: <20211213162437.248949-1-maxime@cerno.tech>
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
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Jacky Bai <ping.bai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jacky Bai <ping.bai@nxp.com>

Add the compatible string for i.MX8ULP.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 19738a457a58..e1359391d3a4 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: fsl,imx7ulp-gpio
           - const: fsl,vf610-gpio
+      - items:
+          - const: fsl,imx8ulp-gpio
+          - const: fsl,imx7ulp-gpio
 
   reg:
     description: The first reg tuple represents the PORT module, the second tuple
-- 
2.33.1

