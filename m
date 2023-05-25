Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E007108ED
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 11:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AD210E893;
	Thu, 25 May 2023 09:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B539910E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 09:32:17 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64d293746e0so2238406b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1685007137; x=1687599137; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpwfMsZIM/RuZJMwhQTZ2UB3MwnIPR30emTjY22XhF0=;
 b=YODftMtCx9uwB5NjamP2TP5L2qJofq4MS1ZlFGhfW9lUXWd+dicouiuAHpZNoLfYIh
 bJ22CCVZaMsYs4/QIHz49ALzlCyBSCKBhHw6avwE4UERTCmh4fygGkquFTKK539VPIqM
 yudYF46RoaAEI8KAdpPQU6HhYxDUK5A9vpnsgiAAn0PkBV+y6+L06RNjoKvhlfMvLaEB
 BmtuqDPt85iXkAHhK4LeqEmIdaUsESbfvtbA58EVQeapArQlPEf3dLby0+9Zrd83OhEN
 bKxi7q4djuqlbG4yMFaSnAP9jK2/DkTa52KZMP/VsHRegALHpPPUR2pyXq/Oba32n2fR
 GHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685007137; x=1687599137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RpwfMsZIM/RuZJMwhQTZ2UB3MwnIPR30emTjY22XhF0=;
 b=kLQSKkaFBFBE35MisYOXGRihYmrX6OhsST8rOp/mIbAz+3m0DDFFQSdLiAoN1FQurw
 LNcMjh6mgqnGWwdV4lwndItpafQTsoG/+re9Rp18QOtj5XGn7QGRyuEw6PyGL7EwCj1f
 DXTeTA6v8yNUTwk9KG8phivwhPLRl9Ns457kSaKgPsQcOxjttIEs3NB55uJbK7regTE6
 4r3CqLNZuZPOtzn1aIZZINiD9KNjz0Oedb5r//th4KAmVMN7tkX8i+tsypYu7heQoXpq
 oeaI0+98Eei9zLbA7BE3je0NQBdcGSH4dVWey3etYPsle+AMT86Uh/9QuNkiHRt0pSAS
 g0UQ==
X-Gm-Message-State: AC+VfDwzGRXl1tiUGw1qzsIgWu5r3PVfrWhbYaJrXJJOE2k0hVBxsbgr
 3rQirLO6upqC+0AC1A+Du5Q63A==
X-Google-Smtp-Source: ACHHUZ4PsP1YhFzW1Rb8FuG3MDQwgJg2KBTAJfdbMXk08lNzo/GQzI8Arcj86IXuO2BBTtDIGK29GA==
X-Received: by 2002:a17:902:8498:b0:1af:bb99:d590 with SMTP id
 c24-20020a170902849800b001afbb99d590mr969735plo.7.1685007136825; 
 Thu, 25 May 2023 02:32:16 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001afa7040a70sm951039plf.276.2023.05.25.02.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 02:32:16 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@google.com, daniel@ffwll.ch, neil.armstrong@linaro.org,
 sam@ravnborg.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, hsinyi@google.com, conor+dt@kernel.org
Subject: [v4 1/4] dt-bindings: display: panel: Add compatible for Starry
 himax83102-j02
Date: Thu, 25 May 2023 17:31:48 +0800
Message-Id: <20230525093151.2338370-2-yangcong5@huaqin.corp-partner.google.com>
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

The STARRY himax83102-j02 is a 10.51" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index aed55608ebf6..28a7beeb8f92 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -32,6 +32,8 @@ properties:
       - innolux,hj110iz-01a
         # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
       - starry,2081101qfh032011-53g
+        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
+      - starry,himax83102-j02
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

