Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8904301FA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 12:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ECD6E435;
	Sat, 16 Oct 2021 10:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744C56E430
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:22:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t16so48260399eds.9
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L0Q4wbPx25npnHXSTuPpnP12kJs52O+N8TRBg77edyU=;
 b=Rk45p+n5dJliPHK1SQZkAydrXdOtBwuXZofnk138jmSEEe2XKqn8pKIv5S8IVdeWdn
 kTElIRRrsUKWHNcT0zapV9io+hzuuzzwgTHN2anhkxFVELox6trjx7SV/Dg9mt44Uvyr
 XMlDuPsOpUsCGm334yV//+kktPVMg8G5xa0to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L0Q4wbPx25npnHXSTuPpnP12kJs52O+N8TRBg77edyU=;
 b=IF38irDh7QiB6aChVPGSnvTQM283cRe3LAwTRMUgK1l7yZOY+IHbu8MzSdL2NgqZnH
 XQ3ZIAB7UeT8n2cnkCZbo8+zdpu6ugeiVxyicHXpkVjL9A8fvxJX3678TG6E4cpJvkKK
 VDVOHST+5OSo+OyBfLVjGyAy0GT5fyOW6PDZmBwsYUqV0H9smkkw4epnFnYyzR17Wacw
 70iYkYxGMjjfyzSweAnVA4tcPFBCtAe3bAjQGnmE3+j0jRxX0NGIji1uc2ZLCeXm095f
 lbp2Onpe8GKgUA5TVYDE3RwVAJ30LYl6pmFRdP6Yddnr9A5HjXNUZ/3RflhcFl+0WN5u
 I/og==
X-Gm-Message-State: AOAM531JKkUtQVJGfNYqlIqaA2aqymSom8vPFEO0dREak//l2BLF1on4
 tkLLF4sljleU8q5/UzJkfGP9KA==
X-Google-Smtp-Source: ABdhPJxrwkhAK72JOqkJ82YTTRvBONSKXSXXnA0GYp0UgFy52AlsWhvK4GP9sxru4Y3LWCL9L0gbdw==
X-Received: by 2002:a17:906:d979:: with SMTP id
 rp25mr13065511ejb.355.1634379758951; 
 Sat, 16 Oct 2021 03:22:38 -0700 (PDT)
Received: from panicking.lan (93-46-124-24.ip107.fastwebnet.it. [93.46.124.24])
 by smtp.gmail.com with ESMTPSA id la1sm6117361ejc.48.2021.10.16.03.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 03:22:38 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: ili9881c: add compatible string for
 Wanchanglong w552946aba
Date: Sat, 16 Oct 2021 10:22:30 +0000
Message-Id: <20211016102232.202119-4-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016102232.202119-1-michael@amarulasolutions.com>
References: <20211016102232.202119-1-michael@amarulasolutions.com>
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

It utilizes an Ilitek ILI9881D controller chip, but its
compatible with ili9881c so should be added to ilitek,ili9881c file.

Add the compatible string for it.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index b2fcec4f22fd..2d4a5643a785 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -15,6 +15,7 @@ properties:
       - enum:
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
   backlight: true
-- 
2.25.1

