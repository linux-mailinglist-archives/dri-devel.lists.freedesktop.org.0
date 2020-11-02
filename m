Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F52A25D5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D53B6E426;
	Mon,  2 Nov 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2736E101
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 01:14:48 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 184so15281003lfd.6
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 17:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D3qK0eMfgjtMBd7j8FvFD/NLuDeADd/n94mpG4jKjqU=;
 b=gabMc+bvYdsA/guaHCPW8iTHSohpSpQxwXmOwm8Sa/iz/b0BCzx96h3ugHOsdfGd98
 Dp73do/szfQNeKj66Mj8Fw1qWQR8hRvRm+wtj7tHGYx7ocv2MJZxZkoTmft6h7NSp2QW
 58jwVu9UfqgxBi04S7q47zGEO65rr5/YeNAbWFJuxB3N3yHqVXAkPlfGKQkkPVCL4eK4
 V+wSc9zURScyQNnjL/hC8WU9VkZ41w1u+PDPF3nzemLsFrCqZQFyd8fSZoUFVEDORef0
 oqL/YhzdfoXTaUtk7HQyB0Vilf6ji1PwCQBxxpAJ+WJwSshJwiquSuWWpqjTHGJ20mCb
 mrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3qK0eMfgjtMBd7j8FvFD/NLuDeADd/n94mpG4jKjqU=;
 b=X1IUSn8Hm+HEOlHVMqVR5DHJW2+fKv4GckmzNLj210ufvDKh1l+0lbbDGnK+PzesgX
 jRTFoQ12ixiIAhBb+79DCRbNs2PH/27zoLtXrBeWR0ap9jHKp0nS/MgjqEcCqlNs9iRF
 vbOIWCvJ0tO6NPNUG90Qza9dFpHmA3XlzEINea3/uD458boEQJeya2J/MNB3GAxZ8D/f
 fRCL9SuVxIUb2Tt179ixVKx+g7C+ox1ubqgZ5GwKNSEhBYfZyBgZ9lNUAjLL7NLosK6d
 QPum3irEluGl5xYfUDiZQZqy5pXX+xGjorlj//jOiPDejOeczG++Om4fSCoYYJEZtfl7
 d0Rw==
X-Gm-Message-State: AOAM533lW9YD+vHZ5ZFKHResuPj0HrDJr9p1vOM7SPAfLSzz3l876iLv
 U5scKfOWhMFMaxWg95uIhGi0pQ==
X-Google-Smtp-Source: ABdhPJz0FBh9/6eNoYPd23mYiafWiCwQNP3smH541lnwegB+AZnnzupLy0eBlBQc/OMWzpg3eTyXbA==
X-Received: by 2002:ac2:5e64:: with SMTP id a4mr5197210lfr.109.1604279686940; 
 Sun, 01 Nov 2020 17:14:46 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
 by smtp.gmail.com with ESMTPSA id 127sm2101004ljf.118.2020.11.01.17.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 17:14:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: bridge: Add documentation for
 LT9611UXC
Date: Mon,  2 Nov 2020 04:14:34 +0300
Message-Id: <20201102011435.1100930-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
References: <20201102011435.1100930-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Nov 2020 08:08:52 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output. The LT9611UXC chip is
handled by a separate driver, but the bindings used are fully compatible
with the LT9611 chip, so let's reuse the lt9611.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index d60208359234..7a1c89b995e2 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 is a bridge device which converts DSI to HDMI
+  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
+      - lontium,lt9611uxc
 
   reg:
     maxItems: 1
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
