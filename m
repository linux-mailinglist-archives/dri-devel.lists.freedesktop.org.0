Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55B858C633
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 12:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3D610E239;
	Mon,  8 Aug 2022 10:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F775112DCB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 10:16:24 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id r14so9308901ljp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9X5+OY9C1JUS8+hnV0IE5pgrose61H6CK2ZponbGyzQ=;
 b=EyfrmTnrDXlotODXx82gzFKRsGHHudSI5dBZz7dEPF+vwq5g/VpTEuVygENJLc9MYg
 jkSzsUqmuwtDhKuwCelC1wSm+xTxwXILTvPepVU6oZGefnUrElS8baaEtmnDnDQelyth
 kjoaoE4KmDDWxs28HadN8/MTqZUymyqjEe5+pzFlwYiog9sjBbIXIB3cKPIl+9fXoQvR
 3oyL9iT6JED3JMHn+WN9TMBRDonmkG8Jz6/HxVrmDIpNQMZIAeHoH7AYU8UPAQE2A15b
 0bH5uQiYftr4gt5wYQdr4Czjg73qkzDl/cmud2Ei+QHhZv5KxwRk0brHHV875fnsp3qk
 DQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9X5+OY9C1JUS8+hnV0IE5pgrose61H6CK2ZponbGyzQ=;
 b=1tNAtpXtdgQ6t7bu7n3MuJfl+wZgn+PVErHBqcGU8DtvAii3eLvdCKV7l9it2NDyIE
 VNejmKhyUHirUlLHwHqYiylsfCTQRbUe/Juk2WDEX5sb+3fa6fbPa1MW3kJP0qIZzrsI
 ZjqbxuBhRHXmUA9V8VA6E77DLswj7gYt7nsg4BXejUqBguibtAKQwGPmFX1uipsdYJSR
 Od9bF03N5O3YvVvR47F6VPO3kjg5BSKUiqR7hT+0/hiCWfsdJQPsdF4EJ1reSoJdBXOE
 lh7LVrtt0NJNQzpzi/88t+SkwiCERZN3+hniY40yw4LjE3dmEtnZX+k/bnrvcSNS/DC3
 YXkg==
X-Gm-Message-State: ACgBeo3mw7KgjfAtpxwLejnIUeAHqNGizNPLpljVFGls2icyLVq2cznn
 gFMQ4rEw1EZHjU4JtLsgefgd+w==
X-Google-Smtp-Source: AA6agR4tttRe6G0iEjjBNa15w2EGKbZLas/+/O7VoRN7jyC3KSWWrfglGpmZ0iCybcN82fFC9txRag==
X-Received: by 2002:a2e:9e17:0:b0:25d:78d8:407f with SMTP id
 e23-20020a2e9e17000000b0025d78d8407fmr5948114ljk.433.1659953782159; 
 Mon, 08 Aug 2022 03:16:22 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a056512070200b0048b193f677dsm1377489lfs.178.2022.08.08.03.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:16:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: display: simple-framebuffer: Drop Bartlomiej
 Zolnierkiewicz
Date: Mon,  8 Aug 2022 13:15:26 +0300
Message-Id: <20220808101526.46556-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bartlomiej's Samsung email address is not working since around last
year and there was no follow up patch take over of the drivers, so drop
the email from maintainers.

Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I assume that if other change was preferred, there was quite enough of
time to send a patch for this. :)
---
 .../devicetree/bindings/display/simple-framebuffer.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 27ba4323d221..1f905d85dd9c 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Simple Framebuffer Device Tree Bindings
 
 maintainers:
-  - Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
   - Hans de Goede <hdegoede@redhat.com>
 
 description: |+
-- 
2.34.1

