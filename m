Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585507FF421
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8E510E71A;
	Thu, 30 Nov 2023 15:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212E810E710
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:40 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6d8029dae41so630931a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359799; x=1701964599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaHm7z9yY7JhEbhzyWmBl6MrUO4DRuFVOID91e7Rsas=;
 b=Q+OjzujSAiTrkjQ+GSpt01vdE5AaKphZckdXcieFRqH5vszwFS29lME5kvNOsDMXXt
 gPkI1vr9JmiF30ASPg0Bk+iMf9IzYXswjlg8ARWTSt16B7RF1pFjW/NPEEEwbcIPc+/L
 K9+TfuiP+cL5m246NsMSJAdiMqs9qvGO+Fma9Cxuiylxk8n6g9q2C4u1ivC0pap1Y/9t
 JUtq47CYy8/eciSmHG+2gRC4aDsfrSnEGuJ8ApyeFrI99s8zTEcRqsnSXAeJhmzwFKl2
 41lysYcomLjwFuG+Wwqn5w6f9JGCsBuxuPHR1W+0Zwvebp6NGyXq4rRWXu1TrasqLeIW
 LwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359799; x=1701964599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PaHm7z9yY7JhEbhzyWmBl6MrUO4DRuFVOID91e7Rsas=;
 b=imjuUEkTUSQsqzKtZIsa8/SMNtggWxepglH9qlBkKKXqA3oUNazcyUcqax8ik+jAFM
 7vMJXWodKnQ1mn9ZkAzdsCBaG0Q1pAFV9EYCobfys8JKVncBGPAlJpbIFnVtq+3w+GZB
 Rj/Lni6AwmeBOF6+F+5WUoE8YLhKot+02ocgeFX0nFwVC30Js7WAZzzqA6KJbWkRPvlN
 vb4l/fq366SB54PZBkQDeFeLSCpiPt2ilWdQzaoezEAICH27n9pu55OME7Q9C9vk8vHA
 Z0HoqRrTEVLT3VPpj+ysJKr0pjbuIdJCKWILkgqBqAuvWSRo5F9/M8Xp1Kwpco2zvQmj
 xeWw==
X-Gm-Message-State: AOJu0YzZzI9L2Pk6FScPGOcYsdGoOPrxSWiExYyW/4n8JIyGikjWAYk/
 gBhpQjZ/LQPUxOfUiWRJM64=
X-Google-Smtp-Source: AGHT+IHRrQ9qQNsi6yG3nqPiEdlso2YvHwKneV/qHu4W+YUFgHARSucqfgOTC/owBcTkL1lolpTTlA==
X-Received: by 2002:a9d:7c91:0:b0:6d8:5a35:ee16 with SMTP id
 q17-20020a9d7c91000000b006d85a35ee16mr3439943otn.27.1701359799460; 
 Thu, 30 Nov 2023 07:56:39 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 5/9] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
Date: Thu, 30 Nov 2023 09:56:20 -0600
Message-Id: <20231130155624.405575-6-macroalpha82@gmail.com>
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

Add compatible string for the Powkiddy X55 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 3096debca55c..916bb7f94206 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,7 @@ properties:
     items:
       - enum:
           - hannstar,hsd060bhw4
+          - powkiddy,x55-panel
       - const: himax,hx8394
 
   reg: true
-- 
2.34.1

