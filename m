Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76D7FF419
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60710E710;
	Thu, 30 Nov 2023 15:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41AF10E010
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:38 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6d858670630so698511a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359798; x=1701964598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkS0F614/zYSCaqFBeaQwkOCeCxZ+aA+0mnevTE93Gw=;
 b=EZKEh1auSMfcG+aFJB2ECDSMJ9CFcheyixcnr4HrId+QEZpy4BQgqfoeAB4syra/SM
 YaGuqEbz+Z3nGj8CMeS66hUC2LzhxEuDGXnaFZA20ZrTWq7t6PH/s6JmnbWAJOJFcQFl
 fni6IgbIRF1+l898+YA/4p4gXxMCnkwn8SkfINMbMz2K38SBsvQn59YKRnX325gQgTyO
 UMESeDeWLLhIYHnYRyymi3tzTAC69Jp4zJdO1ZifYGtl4L/1BeUJ5dp1MkDBZpZzMMs0
 PxrlpC4fCBMKkn9rCs9mMndZvR/ax/qv2xZABwcwg8rFmYohjuiXUHXs3vnMlzvsHA4f
 wN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359798; x=1701964598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkS0F614/zYSCaqFBeaQwkOCeCxZ+aA+0mnevTE93Gw=;
 b=Mq60CkAbROwQeyDL93jgWmRXtaVo4hOzNRppdMkPilNekz47gjVhz+OcZY4xJFZ2SS
 zKPsAKi6ZrAV8NeY2SX5EZpHHxqEqcRhMS/XUSvRRF1vIkMzLs1IARH2B9QWxOwHS+Wy
 Jx44xChqAyzY3V6VZ5YayK2SuTwUKavYQJBwCaiDBMRxg9K3LwvQNLLgcv7SemfU8hCT
 5SqVyF4ZyyTnpC6+9PMnXb1xYM7sWyAhTU/zyTuMRJnRG9eiGgQiTLPxr6+itDUtByeL
 oWqi1mxh3GrlQc0BB2+SFYKHN3/1wStlrN8+ewpDGtNlti+RFxz+IVAhVDAybPhm/K57
 dByQ==
X-Gm-Message-State: AOJu0YwMsMb9tmmO2pDC9MsfW1mXGMpyL13rozpSbE9CfI5xLV73hqak
 DBf5mmsIanvMgpFB/xRogms=
X-Google-Smtp-Source: AGHT+IGYwEDgb2oRRJdUhgFlR+f+8NClC5+pTm0V8TeeHR8MPP8qJH+kd/qwXxUEZ1fod/sk372crg==
X-Received: by 2002:a05:6830:4783:b0:6d4:726f:6899 with SMTP id
 df3-20020a056830478300b006d4726f6899mr21447899otb.1.1701359798063; 
 Thu, 30 Nov 2023 07:56:38 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 3/9] dt-bindings: display: Document Himax HX8394 panel rotation
Date: Thu, 30 Nov 2023 09:56:18 -0600
Message-Id: <20231130155624.405575-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document panel rotation for Himax HX8394 display panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index ffb35288ffbb..3096debca55c 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -31,6 +31,8 @@ properties:
 
   backlight: true
 
+  rotation: true
+
   port: true
 
   vcc-supply:
-- 
2.34.1

