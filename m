Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4029D9A3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 23:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D6E6E7F1;
	Wed, 28 Oct 2020 22:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83DC6E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 22:58:30 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id p17so346188pli.13
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHzSigbV/JOyfbEwYkWBCndr5m2zp1xIjqS7IrkBvzA=;
 b=GpTrl91L3KD7Gr90gj8a7l0rvJe1X2jHQtuCFQLfsw22xq4Agzn7dK/J9hXGR/5w3v
 I/MSIETrvTEM/q209qUCvzj7mNK+4XlEqHQBnZoEmyZKnC2RP9toT2wCw7Z6jT11tYy1
 chNcVb3UKPF4au50BKJ7FiElgJuSMzrSaG6vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHzSigbV/JOyfbEwYkWBCndr5m2zp1xIjqS7IrkBvzA=;
 b=ZWAe0Ff7KmOwG2rrAOzPH/MKhoWbqGW1uDQVmnCXmhh4BkaAdlnSVcHhPYAAdK1t3Z
 /GTIUY8vMdy711ulHZq5ozq6RiyhsO/eh/2waFr+NEPMRy0jav+DcLdTaTgS1+QttEur
 XXpRy/9+TmmEoPR4knFfjePbF1t2Tm1a9EBEEK9R8KsAt7nNQSlA85ZrA9gt/wHQfjLD
 b/g09hq9t1YImarwHaf5l1wRkS/lxm+f2S+xWTc5tYujFRvz0tSlnmEYS1JFHEcLpNYn
 Aj89xcS4dX3UVm+6hKQheeo/PvqIFobS+s5xX64zllKia25asOK9CcQuvvpyiNVkmgis
 n5cw==
X-Gm-Message-State: AOAM533ydgOGZv723qdnT3kNUBjCH94jDbANSt++ypZE9RCRv8p6gv2o
 dw8OTM+qpe4sUzX1/BnspzNEsQ==
X-Google-Smtp-Source: ABdhPJxbrjrClcGm6KxlSxyjy6eM4uVyOkacCXkN7gEI6nLyjMmuprf+Mw+5/soBo1oXHAou/yYg2Q==
X-Received: by 2002:a17:902:8a97:b029:d4:d3f4:d209 with SMTP id
 p23-20020a1709028a97b02900d4d3f4d209mr1227225plo.35.1603925910429; 
 Wed, 28 Oct 2020 15:58:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id b185sm394364pgc.68.2020.10.28.15.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 15:58:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 3/3] dt-bindings: dt-bindings: display: simple: Add BOE
 NV110WTM-N61
Date: Wed, 28 Oct 2020 15:58:03 -0700
Message-Id: <20201028155617.v2.3.I28d9e32b3cc0aae980ecc39d364263a3f9871298@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201028155617.v2.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
References: <20201028155617.v2.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
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

(no changes since v1)

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
2.29.1.341.ge80a0c044ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
