Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54603928C5
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 09:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E196EE32;
	Thu, 27 May 2021 07:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E6A6EDED
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:42:16 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id q25so3014744pfn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrbVgIij7R8LbUOrOIBIv2OLNl+Ip/Kqs7kj9XlKJUk=;
 b=SQtH/jrOEE6kk88cKkvSxsBamCau/HA6LO+WkxXT2OKIUlRPbubDXoPKK/J84DK90z
 tViLy+vQKnLAJK2PRgLoPMSraWAe08TSrKhWQ84yPmrmIDgjwjiC5qveCCmsX3JtUhaM
 S3QI3SIPi49owjcScyBxFzBrkyDdvujgOkMaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrbVgIij7R8LbUOrOIBIv2OLNl+Ip/Kqs7kj9XlKJUk=;
 b=Y6Vp2L8Gc/OxRP5Izn1qX9cV7iKMn+ZA+LEwqaEfe/xjhS01WLOQi03/5d+PmY8/4r
 NEcqV9jiPvnvzyd7wTwoLUppQaX2GSQ67YPWGnOMgOApgIeWX/4RDqCrXMfRto4xZpB8
 wH2Gw3TOVXDp700Pjgeoyz+sWby8bElZcJsq/qVvYyZwNWb1emmgkh6vV7MdMgpc8Dk/
 rh4J6+RV4uVAOSTwK2Vg+25m+vZqKVBZKUWakwkis+AJKGjTp6oJK/QCF3ryCU4Grc/H
 jziWJBGM0Mh40+Ndk9OOamzMC5+ugoZIBksKDL6Kr5gkKAW3KL3w15vhFQOrE8VT9cjn
 hRhg==
X-Gm-Message-State: AOAM532ZX2AwZQrqOwBNcPjRUzWgg+Xgpf/s4HcyvoMENVhS9GUs7SZo
 9sOPVDHNnDpbcnOtJaJ65ltFLYLYZr8biA==
X-Google-Smtp-Source: ABdhPJxuVP5C820VQJBG/Cqe/LBzPydpiOkSUvB5K7U8neoHStr0iUEtdqLCANJ++y7pTtplnH8sHQ==
X-Received: by 2002:a65:6849:: with SMTP id q9mr2443138pgt.377.1622101335476; 
 Thu, 27 May 2021 00:42:15 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id h24sm1184857pfn.180.2021.05.27.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:42:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel rotation
Date: Thu, 27 May 2021 15:42:02 +0800
Message-Id: <20210527074202.1706724-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527074202.1706724-1-hsinyi@chromium.org>
References: <20210527074202.1706724-1-hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
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
2.31.1.818.g46aad6cb9e-goog

