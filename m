Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E9762E48A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC0210E12C;
	Thu, 17 Nov 2022 18:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17F810E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:40:49 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id e13so3863678edj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGgALic+DS30S9ojwPdceibK9s2MAtsj8xO33zz+Z+0=;
 b=N7v2MmJAOX3Kmxwd0jdOood/vNl6v21crSGC2mYfyU1BFBOaMCdfIqjKeYPA3RE1+q
 uPu3PDYPkhadmdoQuUDlVvIw1eOFBirFTHLq2MsfL0JjxvusJNCc2dvn2174kPre+Uqb
 tJxUq9Ce0hqAR7fkDjEZGmUtfVLx3JUnzl8iI9PbDY7NcJ7dmtHlpmKXDjq0xcDvzENc
 QOtOTMpPccGzZ6ScUnyNMLls09dACDKTSEJjifFV8x3MPx6CJOPx3BX8OBnZwZ1E8fp1
 YWHcB97GAXh9WAAWNCTpKl513LQkRJzatUZ+VTf+kPwb28BnexS72xWZkFgmPG0K6Iax
 tXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGgALic+DS30S9ojwPdceibK9s2MAtsj8xO33zz+Z+0=;
 b=ijQLQh/6FakuZSTArUGC0D3ELZs98WWeC8azt1GoqFTG4F6O/Kut+0/Z4khLs1g+ms
 fgPNLWSmIAQcLJooKZWbkZVILihSjlAIQUFe230UNZvx2+jY8kf81lLOF+K/aBLI3v+J
 oZF7DNsb9lBXe8Jrtkg32PVsW+wk/uGELC3LmwV/uANA321HnzL68+4ZjXQCe7dxT/F5
 p2KKzM7ZGPw5reRj3H1sVoGHIp/yRZ4kVI0RdNieGXggFWiRIIhWWAxlkiGI9a8ANd8f
 bQXp46aqTRVOoAUxuNYqu2/kbjaojdhEiVXIQ8GgWRFYZ1zsTiXnP+eNgb9on4OnL1M5
 f2sA==
X-Gm-Message-State: ANoB5plxM03x6UP6v6htuKyf6hZ3f/oS6WuapcjZ/ypStBB6ipbSnl+9
 JqfvXSq+5Y0MN97IMO5p4dA=
X-Google-Smtp-Source: AA0mqf6T53dT7P1u6RpvE4BnHTqtPV7QDbZHfM/zbVoHXOKBSCvcYjV8zXOiBCE4ZTH8FiwEafnEBQ==
X-Received: by 2002:a50:9fa7:0:b0:469:4e6:344f with SMTP id
 c36-20020a509fa7000000b0046904e6344fmr396962edf.226.1668710448409; 
 Thu, 17 Nov 2022 10:40:48 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ew20-20020a170907951400b0073d84a321c8sm680132ejc.166.2022.11.17.10.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:40:47 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 2/8] dt-bindings: display: simple-framebuffer: Document
 32-bit BGR format
Date: Thu, 17 Nov 2022 19:40:33 +0100
Message-Id: <20221117184039.2291937-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This is a variant of the 32-bit RGB format where the red and blue
components are swapped.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 3e9857eb002e..3c9f29e428a4 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -99,6 +99,7 @@ properties:
         * `x1r5g5b5` - 16-bit pixels, d[14:10]=r, d[9:5]=g, d[4:0]=b
         * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
         * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
+        * `x8b8g8r8` - 32-bit pixels, d[23:16]=b, d[15:8]=g, d[7:0]=r
     enum:
       - a1r5g5b5
       - a2r10g10b10
@@ -110,6 +111,7 @@ properties:
       - x1r5g5b5
       - x2r10g10b10
       - x8r8g8b8
+      - x8b8g8r8
 
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.38.1

