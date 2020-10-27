Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F729BD35
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681B76EB8F;
	Tue, 27 Oct 2020 16:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16446E1E6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:46:32 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id az3so1077668pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1454WDznDDB4HVIvN+ksGK2VxFOSrCXsfMI/gG/Yms=;
 b=oQJPpPIG4EaovjrBVzzsMnpryDFa6cLQiDvG730jBV7G1T19BJIabWlTnnwm6tnxlf
 wxaGcCC/RFSUQWdAUld+hhWK4M4QScQiVorHIHDJvNVBOvfO5Jn2adPf7wHc1Wksr0rC
 c/AFy6YdyjqctKqUGRTUlcZZhfLYWs8p5SQn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1454WDznDDB4HVIvN+ksGK2VxFOSrCXsfMI/gG/Yms=;
 b=rjEWd/wwNtyecTQ562cxxrLRLyltvXU3HzMMNuZ3n44XESRKlt8z7oJaEZkQD3beht
 pEWqsjJTOUIYqTfbh1/8IEChJkH/17vMjWrwB9oD4+B3FtxECB/sdV7by6bbjJZ/Z4hf
 KSZTBMI5oklLTXY8th89gImJroKlDVomrXHE3bkiXElqxQyIA+dl3bL0lFyMUoDh+Hi3
 sq53DSD18rz3GIcsOsltOEWLwyYbDu+N87W98VbAm32WPS419GlGKI66SsikAbT4LGvY
 RwUF7ZwmmRoz0vJcC4yD3XSCOW76EWSg9bIigLho+5Fa/xYcfkys+Wjoj/5jGAGBKR6n
 /zmw==
X-Gm-Message-State: AOAM531fXiIVqWNFPd9QQ0qldYb22Nq3+3HTqKMdypnHL1a3g5oCV+js
 FJhX15t9DXF0IsESUJp3CjeQHg==
X-Google-Smtp-Source: ABdhPJyTpzBwPzGSyUpO+81xeAo7gZN3jmfx8jUfWWRehiMcepTWOtraQ9wfdIcT5SHgrA95ky7pUA==
X-Received: by 2002:a17:902:8545:b029:d5:dbd4:4ab5 with SMTP id
 d5-20020a1709028545b02900d5dbd44ab5mr3459355plo.31.1603817191235; 
 Tue, 27 Oct 2020 09:46:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id c12sm3002688pgi.14.2020.10.27.09.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:46:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 3/3] dt-bindings: dt-bindings: display: simple: Add BOE
 NV110WTM-N61
Date: Tue, 27 Oct 2020 09:45:56 -0700
Message-Id: <20201027094553.3.I28d9e32b3cc0aae980ecc39d364263a3f9871298@changeid>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
In-Reply-To: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
References: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add yet another eDP panel.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index edb53ab0d9eb..93e244c67e8a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -76,6 +76,8 @@ properties:
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv110wtm-n61
+        # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
       - boe,nv133fhm-n61
         # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
       - boe,nv133fhm-n62
-- 
2.29.0.rc2.309.g374f81d7ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
