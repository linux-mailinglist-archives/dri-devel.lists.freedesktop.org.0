Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B735942F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 06:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C38D6E455;
	Fri,  9 Apr 2021 04:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537156E456
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 04:53:21 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id l76so2978067pga.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 21:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OS7lcaPxknITZLvovVkA4QPXgon3j/mJxiD24igJRqo=;
 b=h4zcLAdWfRJgihK2lfSX3Ypml2LDDqkOCQxP1jzvewO4jhVm55tUwaYfZcqvP2cxZG
 +p00cv2fniK5dn64pXL/DD4rWqhDqCXJA/Hy890kQH2cKfRb6uQHe8wlmXMWoHg65I/s
 0ddH48c2OC/fmk1+1JQ6/j6A3800tbq4+63TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OS7lcaPxknITZLvovVkA4QPXgon3j/mJxiD24igJRqo=;
 b=G3znR+3UDbak0G2vCehokIbFYB5RXZlduIzTd+2sYlNKLtmldDc14sIH/rrczHI8N6
 7TLtdmeDixCyRpbt67HAdE+tIpTxjiEEIoM5ujbwdfUYfdyLQx0+8g5Y/YGa0TpKEVDn
 fWd9t6Vi4M1+MHhtDlEEHLvA4K4kvCsCqX9U27pikPQzOZlYyHUvaz+/a9kR3XZU5v1L
 XSiMwpfQLZr2AbyDrbUqdQnKCssdHhDNlwhU6HqAZ08xuG1lXROdc4S1kzgx8eDTHy5c
 GOyM6t0TUW+lYa+US5GiPRCJdXTu9IS8Jfp+QPLQiDJBiG2qFTpoG3spkYg/vLplYIqr
 V0Ow==
X-Gm-Message-State: AOAM5318Jf9k9zxEFXhX1JZsP6OGYE0oCkL4FwpYX78kLltY8INxvxfs
 ZH3sJdSS3DEUJUtkNWCRemi6MQ==
X-Google-Smtp-Source: ABdhPJwvi9n1MpPr9EbApqw4tpal6rn4nFHgDRv5qpHpDXeyET2KUNc94sSla03g7YL6LJLDGwmMDw==
X-Received: by 2002:a05:6a00:1c77:b029:241:5c43:8cf5 with SMTP id
 s55-20020a056a001c77b02902415c438cf5mr10989642pfw.10.1617944000932; 
 Thu, 08 Apr 2021 21:53:20 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f9f6:696:a955:72e9])
 by smtp.gmail.com with ESMTPSA id p2sm900696pgm.24.2021.04.08.21.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 21:53:20 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Date: Fri,  9 Apr 2021 12:53:14 +0800
Message-Id: <20210409045314.3420733-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210409045314.3420733-1-hsinyi@chromium.org>
References: <20210409045314.3420733-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
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
2.31.1.295.g9ea45b61b8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
