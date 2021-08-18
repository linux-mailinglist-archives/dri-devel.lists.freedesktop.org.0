Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2E3F0707
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD66E8FF;
	Wed, 18 Aug 2021 14:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B821E6E900
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 14:47:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q3so3561614edt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icsU2c4V7+U87qo1ckZmLrJ2sA4CpW/juiJiyR0EYQw=;
 b=H2nEEL9iAcu2bnwpcjo6Mdr4TgkXA/9QqMtfJmxcmUorajIrrx04PJdHlaY1mXVoQJ
 a2nZqCrMTRnagWFtxNqfsbuJvYzn2x37+Ilzi9BzFLvegYymkhEuIrlzuMgWe6V+Bwgh
 vBiDdDTbUgJ5PX57E3Tzl/pJJNVIY3pytq/G/MW0nZc+W5/qsKFlRo0ENDaWOFl6VAcD
 FhJFtzPRkVBL39IMSDZC/6Ts+Kqr6EvjPhu/+x1Dj70XMWYH7ObIBNb2ddnKcKnLXMPZ
 6H29wEsZ6CN4de8RBcqP3ixralaJ/5MwSJ/z4wSuVJu3Zy+aRgWqlKvGE/YkKzV93F6r
 kPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icsU2c4V7+U87qo1ckZmLrJ2sA4CpW/juiJiyR0EYQw=;
 b=nG5t7X0JsQ8YqvsOrX3Iq2Jm/V9uXKxSVbOCfQyLoA8sqoElV2F+8gL6w++61EOdTk
 ad/TemVCbARjzt7FiTGKeucDTAGBQsyEf/9nEvDSkC6oqpgRGQKQj2rCCDSEZLLlBElM
 B0dCz6J21mWIR8CeaqPsUdsOsETW9hpE0OCmYJ8Nn/V1FQU1bjUZGrznkv+e8C7iXIZ3
 GhBcJ89NQVnMZAre+vd5pUNdx1MCy9jjp9kNs8uom+SGtx2Y29/XljnXulCAL+UYCctK
 RY7wdaLscY3TteK/3oJGp1lAa3tF8Ld/lek/h+MvQXfnSN6HojlcrGJXe4NC63xERty9
 Vgmg==
X-Gm-Message-State: AOAM532PXQh422eeBKuCFzqkxKW090wu3XqmQpLuLyAB1A7/OcP1cvxV
 /kIrkrquJaZFP+i8FYuxurzQL4JYIVhR8Q==
X-Google-Smtp-Source: ABdhPJwM6xuEDtGMvk/m6OHHby1b74xL4bKzdUKxbakaO5bNUGtTJ4tBP98RfyG/vDG4sxVhN2Pddg==
X-Received: by 2002:aa7:d04c:: with SMTP id n12mr10646382edo.342.1629298026898; 
 Wed, 18 Aug 2021 07:47:06 -0700 (PDT)
Received: from localhost.localdomain (neth7.eastcode.net. [79.143.160.90])
 by smtp.googlemail.com with ESMTPSA id x17sm2152808ejj.58.2021.08.18.07.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:47:06 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH 3/3] dt-bindings: add vendor prefix for Vivax
Date: Wed, 18 Aug 2021 16:46:48 +0200
Message-Id: <20210818144648.72665-3-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818144648.72665-1-pavlica.nikola@gmail.com>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for the Vivax brand by M SAN Grupa d.o.o.

Source (in Croatian): https://www.vivax.com/hr/o-nama.aspx

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..c234c392538d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1206,6 +1206,8 @@ patternProperties:
     description: Vitesse Semiconductor Corporation
   "^vivante,.*":
     description: Vivante Corporation
+  "^vivax,.*":
+    description: Vivax brand by M SAN Grupa d.o.o.
   "^vocore,.*":
     description: VoCore Studio
   "^voipac,.*":
-- 
2.32.0

