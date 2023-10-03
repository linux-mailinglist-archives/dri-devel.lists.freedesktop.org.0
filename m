Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79857B6E9C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 18:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64E910E2EE;
	Tue,  3 Oct 2023 16:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3BA897D4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 16:34:02 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so788878fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696350842; x=1696955642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkSQMV5DOXzEuPzZAkyJmDQmhsgIBtNj/QL5D2gyLgo=;
 b=Ymf5ZpKylAjwzVqYymwT/Kq0qcVIhbs7vmmDJ4CkS84xh0vs+MuTxS2tnqCOLCQXh/
 1E2hlMSvljtETLItcJ61c5H7wQk6eanr3bekscNZgwbyoOII5jouTJk4IdbjOc5FigH1
 oZLJOnjARN868CZtLaotIq8gtw3e5xZFEsgLQw8kq3CZjIUzGhNzzUMy8MDgLlsciODf
 gO68NBBxgvl8Zr+o5cFWT4rEPL+hWBqk9wZw27wXl+BJWEyr46BHYCHKTd0DwCMCV1Bh
 33fNvgXzuDv3umYLAvGprkUQFjxNybccejSFKohhrbGkoz3/PITxClCVqQQjfCqqJww1
 TKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696350842; x=1696955642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkSQMV5DOXzEuPzZAkyJmDQmhsgIBtNj/QL5D2gyLgo=;
 b=Izzu+Kb0cb6TYDaUtwYliYq7864YjRNFa+i4DbOt5vLjvLrqc6X8wuxTykI8JbyjH9
 a/QpS9qq08Z1SYSLWALw4LHAo3qMlZi1tmoxcHmXdt9a1SibodY894vEJhyZsuy0jfRf
 FgAb8DL344pU9tArz9kpbjRQeZzx7Mh2YFL9Bxv0MTMZ8l+0XAakoV99aqScaTpfyQFK
 PsT+LQQIiF+yB6abapOIhzJ61rUZDkesFd9FZ9EYdq/5O02wtWGrUhY6xIHGT+SkhSuA
 nXfE/ITTDqr0xTTqKBmSfPJcDfOKnS8zU7T30Ylz7zIlWKTNlxw5MEM0TumsJerYwi8D
 kdJA==
X-Gm-Message-State: AOJu0YxDvkdZY0TwuK6dn/fdC5PGY15dKNTMmLU3X7SAGooUZUN4XBhM
 RcGAduwarvLjruyCdcOUPvDJC5CyCLQ=
X-Google-Smtp-Source: AGHT+IGz6tiIp4sfz51Ai/HmYnZnC5ywaM9M/Efm8xudL0UkYP1dfVu6ftBUjCpW8qG6NSE3iKY/MQ==
X-Received: by 2002:a05:6870:958b:b0:1bb:509a:824f with SMTP id
 k11-20020a056870958b00b001bb509a824fmr64092oao.55.1696350842018; 
 Tue, 03 Oct 2023 09:34:02 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a056830150600b006b74bea76c0sm198567otp.47.2023.10.03.09.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 09:34:01 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V4 1/2] dt-bindings: display: newvision,
 nv3051d: Add Anbernic  351V
Date: Tue,  3 Oct 2023 11:33:54 -0500
Message-Id: <20231003163355.143704-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003163355.143704-1-macroalpha82@gmail.com>
References: <20231003163355.143704-1-macroalpha82@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Document the Anbernic RG351V panel, which is identical to the panel
used in their 353 series except for in inclusion of an additional DSI
format flag.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index 116c1b6030a2..cce775a87f87 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -7,9 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NewVision NV3051D based LCD panel
 
 description: |
-  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
-  this driver only supports the 640x480 panels found in the Anbernic RG353
-  based devices.
+  The NewVision NV3051D is a driver chip used to drive DSI panels.
 
 maintainers:
   - Chris Morgan <macromorgan@hotmail.com>
@@ -21,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - anbernic,rg351v-panel
           - anbernic,rg353p-panel
           - anbernic,rg353v-panel
       - const: newvision,nv3051d
-- 
2.34.1

