Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A373342F3D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 20:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714A76E0A5;
	Sat, 20 Mar 2021 19:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5AD6E0A5;
 Sat, 20 Mar 2021 19:28:14 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 30so6746527qva.9;
 Sat, 20 Mar 2021 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acrEGTvzSD98+ASlS2uMJi7waK+gVXOJD0BsXcBLrs0=;
 b=UyzkUHpZ/XLDiRsk7RAoZnJwyddY3cPqNRUKFWQ9zSR+h0++euNd9SJvMLPWg8iEsl
 oD1d07C3mdR8jc5L/rjfiTdof4jQGkkZleqESdmL3XJ+Px+9WqIdtlrby4B9VF7N/Ad2
 dGYmuvdDKW+cRnPghfUANIdBqH3QUFfRn2zE/1ymbjusQ/CMY10Rua5AMa81ljwz5Zx6
 NcjFxPqM99yEzCc6i7ONPszGAj/BC9ykbbQ9W8qX1bqoBa0/0uk4XclldByjKwwmCx+F
 tKAjpaAt/7F2DWROcLudTj5M/7yiLNwxTqeKddEZsxrupBE1XJRwiNXA7gaZsmAVeRb+
 GRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acrEGTvzSD98+ASlS2uMJi7waK+gVXOJD0BsXcBLrs0=;
 b=f+erD20o0XbaIwWDmAUqtydfY0UEbPuBO7NaQRKTgE3kPbP2VhU2t6XdyaX5Q0umco
 AVQ0ajf2u+LzDgBNW/kj5GiZXvwvwi3YLSB7vwagst1dtZk7em3HavAZV4VjlSby5JTC
 p4DuL7neh1dzYGK9ExsnJHvNUiXIIJAdluLdp87i2sMEE4lohVxaCGs14fFSvHINoLE1
 YBPxr+BkGR4+8A+95+PqfOnxlzyj+itNWjN68M9PM/mAUAehkV5cC1oAY9sKs2NPkZ6P
 Mg/f+C9EsYS4GVqBdWYKWYHRtFTq0B1NzzXhRCR5f7ibnWGkIO9DAE+UH31G/nqQeFq1
 +r2w==
X-Gm-Message-State: AOAM532tT5v7nFBffmmqs/EAPcubG7llzWxzgGhZ8pB3r+v1Fq9qAtf+
 GO+KYyKO4W5YNlgLBOI65J4=
X-Google-Smtp-Source: ABdhPJx1YjYwBBUcUchYxxDprbOY7HkafIbJ8dkq88NDiPrTTQ6xsLVs4yU77GwWLYI8G9aFFkj5HQ==
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr4542698qvo.20.1616268493851; 
 Sat, 20 Mar 2021 12:28:13 -0700 (PDT)
Received: from localhost.localdomain ([138.199.13.205])
 by smtp.gmail.com with ESMTPSA id p1sm7333733qkj.73.2021.03.20.12.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 12:28:13 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 dt@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: msm: Couple of spelling fixes
Date: Sun, 21 Mar 2021 00:55:53 +0530
Message-Id: <20210320192553.29922-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/Subsytem/Subsystem/
s/contoller/controller/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index 551ae26f60da..586e6eac5b08 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -2,14 +2,14 @@ Qualcomm Technologies, Inc. DPU KMS

 Description:

-Device tree bindings for MSM Mobile Display Subsytem(MDSS) that encapsulates
+Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
 sub-blocks like DPU display controller, DSI and DP interfaces etc.
 The DPU display controller is found in SDM845 SoC.

 MDSS:
 Required properties:
 - compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
-- reg: physical base address and length of contoller's registers.
+- reg: physical base address and length of controller's registers.
 - reg-names: register region names. The following region is required:
   * "mdss"
 - power-domains: a power domain consumer specifier according to
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
