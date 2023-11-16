Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E297ED86E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E12910E2B4;
	Thu, 16 Nov 2023 00:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590D510E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:17:49 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ce327458a6so131493a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700093868; x=1700698668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0mEsiNdPfHU/4JTiWw+15A4V1CJWyMXbRELX83ScM4=;
 b=mIpNHtvsr+NpJixwJDe2bt5sCu4ynp9OQSdgffmbbWZ+8geHUAtsbSjicvH/N8o7Hv
 Vi5lNdPvQzdDyStHcezTBnXh8L1bzbqYP9Nv8VnbMVN6vIP+zsXDx7AzhXZnzmycRduU
 ZWhW9a8p25krpPWo6EOlqUU7HHhY83kMLUXbWSVy79nZtILgypTSSsakTodeHBrguyuz
 b2/oOGgBSlMiSyKjrT+HCZstW+C327fgl68IPVQAwgXFt1Fj37hW+s0kI3GUOU/k+O08
 QhuMNSoN6yJ1+989wCjm/VJM552kZQTEJgJxJ0KrmrXQQmTcwZtT9VdyYCxIfKDtHYMZ
 ntGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700093868; x=1700698668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0mEsiNdPfHU/4JTiWw+15A4V1CJWyMXbRELX83ScM4=;
 b=vjvG7L0QXKFVeyK+xFnhW+eNrNgoja99DQDC0kG5SKANlx94OwqSZ4PF8bDsTrUUr1
 SZZQcfM5O29d61bCMbLDH5+tJ7taEcNn0eP+hD0DJIM0hWrdjopBcnsagj7K9pe4kNu2
 Noxx1OqNZxvTY+IW+9TooBIR+3UMZ80FJeFYhCgDAJrgpUuvKZqFMpZ047/DFR0OYGoL
 jxOPkIpGCP5iBGHHmsFx0n0brJStOmxCqc+HmWNNZ/edM+scekEd9WYsDBj4cHlflkYx
 AtLQfC+9fNE15jN1kVYQsyVLzkgu4K/qh4FPAFHdV0a0aO/VTLO/sbTRDUh4NUzvyHsT
 f4kQ==
X-Gm-Message-State: AOJu0YzF3i/aiqox8fP1ltmvyxnuEBuryHUitbw21spugMEz2hA8RNED
 9iAqmpVgNsGdDDAkelfvlmY=
X-Google-Smtp-Source: AGHT+IEWe51vXJ2DhIHJ7URCfodlJcoGklKewxeM5wtzw2YWENnAh582QPOTBc2Ex3kEBpeQszEIcw==
X-Received: by 2002:a05:6830:43a4:b0:6bd:335e:1eda with SMTP id
 s36-20020a05683043a400b006bd335e1edamr66302otv.11.1700093868511; 
 Wed, 15 Nov 2023 16:17:48 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a9d7d92000000b006c619f17669sm727117otn.74.2023.11.15.16.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 16:17:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V3 1/6] dt-bindings: display: panel: Update NewVision NV3051D
 compatibles
Date: Wed, 15 Nov 2023 18:17:37 -0600
Message-Id: <20231116001742.2340646-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116001742.2340646-1-macroalpha82@gmail.com>
References: <20231116001742.2340646-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Update the NewVision NV3051D compatible strings by adding a new panel,
the powkiddy,rk2023-panel, and removing another entry, the
anbernic,rg353v-panel.

The rk2023-panel is similar to the rg353p-panel but has slightly
different timings so it needs a new string.

The rg353v-panel is duplicate to the rg353p-panel, so remove it. No
current devices use it and changes to the driver mean it is no longer
valid as a compatible string.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index cce775a87f87..7a634fbc465e 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -21,7 +21,7 @@ properties:
       - enum:
           - anbernic,rg351v-panel
           - anbernic,rg353p-panel
-          - anbernic,rg353v-panel
+          - powkiddy,rk2023-panel
       - const: newvision,nv3051d
 
   reg: true
-- 
2.34.1

