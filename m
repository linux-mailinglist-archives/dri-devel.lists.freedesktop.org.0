Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0671B1F1B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D82F6E8BE;
	Tue, 21 Apr 2020 06:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F456E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:57:18 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y25so5614747pfn.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NrTIGfIIMpJ/CNe125wA13W3OdRcgnbEi+8exEuNX+0=;
 b=c4dOiAhj7WKuRROmTvZUIggJYFStbr93zDKyoIo4mrZUZ7Dg0w0KzGPAqwZq6aHbE/
 pEWv+AQ/0f4aTdwmFkHYFgA2pmNLICB3fJ5bvS5og3alGEZIR7gcLUHnn3OLMrfTEYO3
 tRdz/XGvdb0TlZGlfEnXBDtrCa8wIIIcHaigWXxDve6A+8jL9FZ+SyRGgj1j9rm3/drh
 6JPd928o1fbfm2N3hcOsNJKsCdlTMgzv5X6YKwnoi29NHuD+BJhL0Q+Tff58Hd1q2OHe
 5pHVWhp2Y2bk2BLYUnjPIvhaEVoW5L+NcKVPegmXsfphEBHb7lIfVPrtAYR29t0Et9rb
 wyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NrTIGfIIMpJ/CNe125wA13W3OdRcgnbEi+8exEuNX+0=;
 b=Rq74uxfHKtKpEemmtwrpppLuJal13zrotWQG4ZTD0rXLGipXXovkwZ3SKhXEjJLASr
 70D/j6RJAIqXKYQXDKVk+kSn7xgcODtMDk9AOgmrEJvypZEeHrpNNp/hoO+MkWmL8O/u
 4ZN1P6bDXvicrscDkMOwwtr3L55lVPGDlLtNFOUWwqAvm0CdEHCWsvAt/6APl50m7UwR
 uXpSsR/r/W1xioi/x4TSCO6mCZ8DCl8ZUqem1A7fUZZBvE7SHvZiL7VFVMqD0zt54FCN
 CGznLoOIF1SUpEmFKt4qqnJFgeLbnCSdG7pxe+l/RdKkMxlKHwQQHtdNqxuhrXUh5z4A
 OSCg==
X-Gm-Message-State: AGi0PuYlgU1obVezZuMZyQG4SwylYFiMaWbOAz9T0xHsxJeGfmKS9UJ8
 Zps5UmVWSXs/hZrAqLOkDSUFmw==
X-Google-Smtp-Source: APiQypJkcauE8WYj/wEOtxvtf/dp5pe0DcnKKp0GqhsvfSTlhq2o/cL8mXcrJ3FrznI2EiXkU2dXVQ==
X-Received: by 2002:a62:4d43:: with SMTP id a64mr20050370pfb.156.1587419838263; 
 Mon, 20 Apr 2020 14:57:18 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 62sm455565pfu.181.2020.04.20.14.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:57:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add BOE NV133FHM-N61
Date: Mon, 20 Apr 2020 14:57:41 -0700
Message-Id: <20200420215742.1927498-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel to the
compatible list of panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 393ffc6acbba..daf86ba18f47 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -69,6 +69,8 @@ properties:
       - boe,hv070wsa-100
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
+        # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv133fhm-n61
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
         # Boe Corporation 8.0" WUXGA TFT LCD panel
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
