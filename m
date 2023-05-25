Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F87108F1
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 11:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CB310E86E;
	Thu, 25 May 2023 09:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C208310E870
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:32:34 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d293746e0so2238780b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1685007154; x=1687599154; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEBP16jDdKfZXyVFFhpDGWBgOGBnuO/n8Kvdd4MlHEQ=;
 b=E1lchoRKqh4f4ZUFki4pw8mfo4rMNua5RcMc+MWnevA9YtkkXpVROTwrUDZEiDtWeL
 tNcqrCl4iJASRQsW1+cFXPNBcjEEGggzuMRLNyV5CEJYCbKw/0IFxiWamCVf2vSM7yf6
 NJtchNkfCgyJTR8+/aHW5GlWZyGB6nDpVS2H9HdHMUtA75U5x/7qRGvY29qLwoS0+dlN
 fVZeIt8zr7mnPnpqd+p5KebMsub1YfvhiZLSesFrHb8i7xv/gjaDHa2dQRLL1odWPkbm
 g3Q5e54KFaYcKfxHqODK1fssSkA70tEGh6cXb/4nK0mR55BHD5Xp9QCY+kB6tl1LFRGU
 Awgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685007154; x=1687599154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEBP16jDdKfZXyVFFhpDGWBgOGBnuO/n8Kvdd4MlHEQ=;
 b=MgXYqp+JIusHuiitFJM5YuHMWYDTtI4Q5BXA8n1udO0Dx5lc1YGGXLAo/d2dS7E54h
 DFGZL6LvFmobpakTz6n7L/o8kgZrqWjLdQiIyHABWS44GtXbzoy5BBlxNRtQFaju/f4b
 dMfjKf5II8b20Oo7W+L+OyE522n6OyZx3A90u70wpQltlXP+zlgL3Z9pYobCMO7cOoQx
 lxEPq61HmrHzOhQ1pyl5eKb/FRm5uSI3EZGA27pfXi5SBSKlmuQlwO3fWxqejnd/T8is
 PdRAOtqzr2+WooM+My1F7JQoryMNyDwME0x/6seZSG4I0gy5AAevJ6rRNFSaICm/IoRz
 mSww==
X-Gm-Message-State: AC+VfDw+ezt0qG8UY7ZfZSLCmOxpPVjsR4dvHh/IbGoh4Ne4/CutL535
 jeEhyseELAE+PebXkfih+JuloQ==
X-Google-Smtp-Source: ACHHUZ7Wknhza6eW2w0FdEJ/4YWXU217OHtYXIc5S28EmaL+HE3+gflmnDcvtOMV9Pa1H7Pz5BJKZw==
X-Received: by 2002:a17:903:1c7:b0:1ae:1a33:6c with SMTP id
 e7-20020a17090301c700b001ae1a33006cmr1108130plh.31.1685007154520; 
 Thu, 25 May 2023 02:32:34 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001afa7040a70sm951039plf.276.2023.05.25.02.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 02:32:34 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v4 3/4] dt-bindings: display: panel: Add compatible for Starry
 ili9882t
Date: Thu, 25 May 2023 17:31:50 +0800
Message-Id: <20230525093151.2338370-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
References: <1adda828-cf35-fb2c-6db5-f9ca91b5b62a@linaro.org>
 <20230525093151.2338370-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Conor Dooley <conor.dooley@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STARRY ili9882t is a 10.51" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 28a7beeb8f92..906ef62709b8 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -34,6 +34,8 @@ properties:
       - starry,2081101qfh032011-53g
         # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
       - starry,himax83102-j02
+        # STARRY ili9882t 10.51" WUXGA TFT LCD panel
+      - starry,ili9882t
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

