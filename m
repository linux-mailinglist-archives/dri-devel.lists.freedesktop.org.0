Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995996B98C2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8196610E82A;
	Tue, 14 Mar 2023 15:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB7810E16B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:51:05 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id h12so324744pfh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 01:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 t=1678783865; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQPhsRPwIBJSw8lw9/twam5VTJIrUkvEv5SN14Y29N4=;
 b=6B84mYPTC1ctAxlQ/eWFnqMKDh5XbHqHG2MgCjXBK9diGVC4E9G9CLVUlrPgpt1jk2
 20sTZ7k+76uAGEkxkMudOPUVilOdjmwYbVCoBdG8WlWH9IcA2pRnMrForTVG1Ua0XHNH
 2v9UdKK8LAVPvOySJVcRzL3LWNIUMmBIztBQ6I4Kmf/fs/tHMuIvqzFxSU7avFwTYZD6
 Kw3yf0io7oC20hhq5Fxhm9p5eCBUdLQFQj/MQv1DRuuCq+oBWMf+0Dk3KT8N81jw6STB
 IQHEW9LgRaBAZ8inqnbZNrkU+wo3G+qqwpGqVXsJtVB9HiISnJqbKS8P8YneDdjDBV9R
 a+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678783865;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQPhsRPwIBJSw8lw9/twam5VTJIrUkvEv5SN14Y29N4=;
 b=dYd5H/CEJT9bF97Ig9xTvQ/dafaIPJbf3Dt9Zx8wZcS7eWPFcbwScQAdtSq2YRFy2i
 r1WBxh/3VkSSVo7b03D7W6bMR3hRMYP/UTfV99sN3via5PGuGOL4BLvFs/u8VIb+Zthc
 ML1h/5LPFJ89D/a1ZywH3+EhILhSGDV+xsYMJSMKTpK2VJtoja2DyJfTnHkD8NxI9CIv
 oy4eOz7iyr1Y4+mUtcThYEgJ3qruxmehq8MeD6BzMoPAzxDkz7yScAo6vdg3vLfpTWNF
 Cm/95G31wh+uS80iD1/+IniOFlVbIvD+JqCPQHTh6lqbwKdFwgQyJRgVj5SiOps0gO2t
 MiiA==
X-Gm-Message-State: AO0yUKW/7wfC5E1F4KpWBygMwc4Jyr8wpvHxv9SDze889YE9haiDvSTv
 DIcjgy5sklmjcrbrlgQFEZw9Rw==
X-Google-Smtp-Source: AK7set/msSKdiefdhGB9noxU+oedCQ6Qiq/waQhXwIqseVPcRRTkC/MtnzcJu4d4Nf+an3yT0p/tfQ==
X-Received: by 2002:aa7:9835:0:b0:624:b4f3:398f with SMTP id
 q21-20020aa79835000000b00624b4f3398fmr4481754pfl.0.1678783864739; 
 Tue, 14 Mar 2023 01:51:04 -0700 (PDT)
Received: from chromeos.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a63f103000000b004eecc3080f8sm1080637pgi.29.2023.03.14.01.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 01:51:04 -0700 (PDT)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com
Subject: [PATCH 1/2] dt-bindings: display: panel: Add compatible for Starry
 2081101QFH032011-53G
Date: Tue, 14 Mar 2023 16:50:34 +0800
Message-Id: <20230314085034.6380-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 14 Mar 2023 15:15:45 +0000
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
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STARRY 2081101QFH032011-53G is a 10.1" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index a2384bd74cf2..f98ed588c750 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -30,6 +30,8 @@ properties:
       - boe,tv110c9m-ll3
         # INX HJ110IZ-01A 10.95" WUXGA TFT LCD panel
       - innolux,hj110iz-01a
+        # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
+      - starry,2081101qfh032011-53g
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.17.1

