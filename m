Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980C36ABCA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 07:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C6A6E038;
	Mon, 26 Apr 2021 05:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0AD6E062
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 05:18:56 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id p2so23856264pgh.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=PLSD7jhKImFPl98DBSFMj8R/b5Ul4bbE+BoQg9DsV2ma3TcmldaXG7B0oHdDFuM1lD
 /HVqkDvzFawztE9+VgbeJojJAMZvcfkOkTS7KH/HG+p21hPsekQVIJpXS07mWJHskcY4
 rEnzo0eFpJwFbTCLUYHx9TOYDAeOD6D9JpLVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gt4pb5bT5mW/MToENIuo4Jt8VqUlSnyGRgKvmw6yKp0=;
 b=FUYYBgGMg5ApyxOqFYLQyyza0ptxdWimt1hyXt0JXWXCifveV0NsMOvctMKTAIX4LO
 +cYXUrpmmdYUzQVWcGNPUH6ZQ4VBq/Tv4Z/+egO56F4J6QT6W4gK3tIyFw5tX3tcIBW4
 UV6DByfZ/s37PJncUducgpKYyjS7tmdssIf/+emcpckQ52sEJpmn+oacIGM8HLV5XOVX
 nL1TuJ3qyMJgU0TLwUVzSzwK9Ek3OXXPkMB70+MvJTwZrDjKJ4DcwhDpUamO2GL/GhJ5
 vqhf3z7AWD2YeyFcULPsXJtJQx0Lgiz42HBvkpLPCH8+FHjsdF4m32+ez+0RtFr1dFC5
 kgEg==
X-Gm-Message-State: AOAM531JAMz0TOkQV5V0ipNdC8GWgwZXoVH3BY9AnfDx12Y5nzGmt9JC
 CoNpwDT9Kr4oTOp3OmgX56jvzU8un2psGg==
X-Google-Smtp-Source: ABdhPJwhzSFNys1E+rEQpwqHLs4DcKy+qdcvTtSweq5ZIYRg4MfS83Z6E4sOu0fwV5TrQEfwqkVuOQ==
X-Received: by 2002:a63:6b4a:: with SMTP id g71mr15306124pgc.274.1619414336303; 
 Sun, 25 Apr 2021 22:18:56 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:49dc:8519:4648:67e])
 by smtp.gmail.com with ESMTPSA id h9sm9928420pgl.67.2021.04.25.22.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 22:18:56 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] arm64: dts: mt8183: Add panel rotation
Date: Mon, 26 Apr 2021 13:18:48 +0800
Message-Id: <20210426051848.2600890-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210426051848.2600890-1-hsinyi@chromium.org>
References: <20210426051848.2600890-1-hsinyi@chromium.org>
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
