Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F872A895A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 22:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBC46EDF0;
	Thu,  5 Nov 2020 21:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5F26EDF0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 21:58:06 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id t14so2314720pgg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 13:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2C9RwNHEEzntRHRC2/FatGdskUP1kHVzkLqXpbiboB8=;
 b=PFT3+0PatJKuPYB1chtX4wnurYFYnsTkZSjFZzbZIlZUrbjWqygKzClUHVVTbI4Jpg
 hgURVUNZM1FYPacsH+a8eCi5tVeuuVapm/G9vqavgnwFwa+R2/vlEu2/Hh1v98Z2fOEu
 fQf9HVXfStgowndj35ZlQthH5zvK98BkXHjNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2C9RwNHEEzntRHRC2/FatGdskUP1kHVzkLqXpbiboB8=;
 b=QlSNRTQUi5RguPNJ19WNCeiPdej9gnxNKNf9JkcfkgPL2sP2KOfI0sjETrL+gjZkXE
 22R/LylFB8P+iEoC8UFJSx4vcypH/6sJV8B5Ingqa7JOkAQSCgtop3F2pbCouxmrbAFa
 AtyQKe3iiHroJE7gxfB2dc8P9kdXlFo9fs0c6JSbRqaEBJd6YVgYzJBNCQNkt6NdKZWG
 wyu74KUooCnAYF0n/ilU0qqD4eZ0UGAjb54ZIvbkhSub5T1iAjKZquYaSEEzG2AQ/Amu
 LGZ36sVeVb94yMclNkCv2APqRQTK7oKnW/807YBBez2JVwN6Svl9MXuGUka3QqFhiyt8
 S4bA==
X-Gm-Message-State: AOAM5313pWAPDiYHjxvDk+OLn0mpYUpBn0bt4UgihGszOMgzOrfTi7f8
 D8TCF/O+wkW8RpUAHuIcExbpyw==
X-Google-Smtp-Source: ABdhPJxiXwT2dZs/H6MoJPes3fNW6/NBVLO8bmXlFqmTu9H1Yd0qzp+LtxSQvsnzXXg9NXSdjBi2DQ==
X-Received: by 2002:a63:d252:: with SMTP id t18mr3901954pgi.300.1604613486363; 
 Thu, 05 Nov 2020 13:58:06 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id k7sm3572890pfa.184.2020.11.05.13.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:58:05 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/3] dt-bindings: dt-bindings: display: simple: Add BOE
 NV110WTM-N61
Date: Thu,  5 Nov 2020 13:57:41 -0800
Message-Id: <20201105135639.v3.3.I28d9e32b3cc0aae980ecc39d364263a3f9871298@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201105135639.v3.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
References: <20201105135639.v3.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add yet another eDP panel.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---

(no changes since v1)

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index edb53ab0d9eb..93e244c67e8a 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -76,6 +76,8 @@ properties:
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
         # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv110wtm-n61
+        # BOE NV110WTM-N61 11.0" 2160x1440 TFT LCD Panel
       - boe,nv133fhm-n61
         # BOE NV133FHM-N62 13.3" FHD (1920x1080) TFT LCD Panel
       - boe,nv133fhm-n62
-- 
2.29.1.341.ge80a0c044ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
