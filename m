Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F615F784F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB9710E159;
	Fri,  7 Oct 2022 12:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B4D10E0F8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:49:57 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x59so6886387ede.7
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBRkFBzTwr0Layx8yRFn/SH2RZGgfSe2fyII0Qe3/MM=;
 b=VJIgYJ/IoReLEy1bc3Rcmnyf0KVESE1k2s6upBKNnWGK0/OkkoEV+CCQRxl/02qvwP
 cpy0B/rotWFufIw72HjRUcPVPOGjXaVFbtjN54MGJu5bjXP3p5Rhk6k2QARA16TwgFh5
 pnfrG/LATajYizVBkN+/cK0kOf7FuWDw4Gp3PpfrwxtKQBB/KWmQE/flEziV9X7SZkUr
 IQOV6ExJGxbJhd2A+E4qtgIp8B5eMtkgzbxZFQEU7TsrMGAAaLZZFqxm/iT21bHFF/yB
 ygp9BX6lCOVghc7yCie1sb8s7zi4yEJ1c33iGSpI6CfTARpgl0sObBO9jxLm1+TfsPev
 MFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBRkFBzTwr0Layx8yRFn/SH2RZGgfSe2fyII0Qe3/MM=;
 b=pKjE7CgVcLRjkC3dAOAFYiCBjWMLnAdWIAwdT8ahrW1B915PUKq/LI73MvoAkLJZRT
 UcVVpH0/UTtwLgwOgQ7LZQkaiS9M1OS/RgX3I4L+7zRkcp/PTSKBGBxilHc1VXdec8MX
 vJsEO149Szish22zeIzmSetTIVdTOBmMS0fLxD3QYyZodh07l6f7F/cmPwkM+V/bop/l
 2tZGqL/7954Z3oNkey/afLR+5NmasSk2JF/fPRs+uBrUtx0Vp9Wmvb3aj1fLVbt94Yr9
 IqMMEsa3ejwsQXZwpB3zzR/SnyPX8Ta9xcOXvp+vW8irsSMxqeJ7qlxZ97SqRKU2THWb
 pkpQ==
X-Gm-Message-State: ACrzQf00AlmOquWq2jpOAMd2MeOLU1YC1b8LCP/Khu6Ti++liy/gsSAs
 +XogNHnFAUzdIFtZ3jro3fA=
X-Google-Smtp-Source: AMsMyM68uGoAncrYPa2ZIbBvO4lb6WPzAUIT3HdjPZjERzYotAUTG3j5fbLxYS+OV9H8g0QARa9EOQ==
X-Received: by 2002:a05:6402:26d4:b0:451:280d:3533 with SMTP id
 x20-20020a05640226d400b00451280d3533mr4330565edd.316.1665146995668; 
 Fri, 07 Oct 2022 05:49:55 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a17090632c800b007030c97ae62sm1153572ejk.191.2022.10.07.05.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:49:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/7] dt-bindings: display: simple-framebuffer: Document
 32-bit BGR format
Date: Fri,  7 Oct 2022 14:49:41 +0200
Message-Id: <20221007124946.406808-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This is a variant of the 32-bit RGB format where the red and blue
components are swapped.

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
2.37.3

