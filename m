Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE0C36D179
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 06:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADC86EA85;
	Wed, 28 Apr 2021 04:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4C6EA85
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 04:55:43 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c19so7008000pfv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=oXkcL1lHMS9/atp/1M+2S4oUJFLqrFv1wWQ5I09WWZB5DvznwYznRkUaU8SkfqTGEs
 UYeW43uZrTmQYfz++FpfwhzLxXJ4rtEN+on9zjE9ohFbgKvRHbzOENyfiyVyRz37eJiR
 BFTrFfuAi9YJzDjhgAmeckvfyV99TbMfYgsZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=l2E7USRXBjGI/pK5KzlJxhMXYVTz3IqoBRAf9MeLaTVoWo//0m8aXm8qD1uKemDd3x
 MYk/Mab1Noo4VpTbcD6eNzOBUAVZf4WA4xDPRG1SK7GjpJ5U8CdwXb7xOZffjB+0zwXS
 IDWdn6Nm2Am2E50QQiayqVJBRxsVAsoyvX49sfUeBJO8rfp6FuGSfrsyOFvdNTf1kKGp
 IhVwuU+x+ahDF7jAPVyfQnxptfbD4KzbtBjO4mF9Mgf3bxCBVJL5+MW34y/MlecRXoB6
 G82TjM6OZz4+2pPG1QP2eNMByu9nGyKXo+/S1TJRZMvkmROZqyCmDPWIatonPvigcPAT
 Xe3g==
X-Gm-Message-State: AOAM530m4YhtZn24S6RVw4RwjM9d2dG9CsPnQeuNGmAixosjbi9Ec9mZ
 A7Hpf9EOcKNwD8lYZYZhe69xQB1QVXDWFw==
X-Google-Smtp-Source: ABdhPJy6K5CdM/3nHF3p+/2eE4TdGymi9eYrEEqROe+kZTRJZLv9zhp0SI6/MmsV0uYFWsxTx8DpSg==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr26649171pfb.76.1619585743151; 
 Tue, 27 Apr 2021 21:55:43 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:8076:36e5:2db0:967])
 by smtp.gmail.com with ESMTPSA id x13sm1193170pgf.13.2021.04.27.21.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:55:42 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] arm64: dts: mt8183: Add panel rotation
Date: Wed, 28 Apr 2021 12:55:33 +0800
Message-Id: <20210428045533.564724-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428045533.564724-1-hsinyi@chromium.org>
References: <20210428045533.564724-1-hsinyi@chromium.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krane, kakadu, and kodama boards have a default panel rotation.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..793cc9501337 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -263,6 +263,7 @@ panel: panel@0 {
 		avee-supply = <&ppvarp_lcd>;
 		pp1800-supply = <&pp1800_lcd>;
 		backlight = <&backlight_lcd0>;
+		rotation = <270>;
 		port {
 			panel_in: endpoint {
 				remote-endpoint = <&dsi_out>;
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
