Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03B35BE97A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 16:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF3710E6EC;
	Tue, 20 Sep 2022 14:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AA210E6E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 14:59:09 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id s125so4048339oie.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=i+/AF0s9oRAwx+DDD0l/SLvTIxJSl0QIYOWA8NZeNBU=;
 b=FgDxXH1IRgCikFXr2gmEkmqog2o+heVNP9nEV1rV0iIZ5L4YOY+ftOnGLZ57QV1KGh
 N7CwdjHUA4YtT/1O3fyq2V0mDovUblQvYGpHggBwTdjOTmbQ+BEjpGBRdlRB3ulX0Jm7
 b8EpikxWwrm4cUfA+KfXtA4utMNwbhtjBqFT9OCBjtUtS/m6Sh64kN3p8VMMlXEOKURY
 vtwGuhViV7jM9MLqKDS9hddpGbEX7Yp6CyvSfakVMoMZLD9mSx2bIwtzOo+MN0LJrYlj
 EAaKwUmge39mFogYq1gOTG07zu0lGflTfR4+a/6xhLXAbgWhB/AvdJ3LsKE1BUHFFJbk
 B7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=i+/AF0s9oRAwx+DDD0l/SLvTIxJSl0QIYOWA8NZeNBU=;
 b=mtBVWFYCUZIEEOwGPHisA6txX8V5y88Jq1n82KmHh3iC1IEYeL+cS1ojNMIx3cMxGm
 t580y6Vjfk1Ft+DBciXG4v1ByV07rGEr3H3Kb/dXaV+rfy8kGqwsEGG7NAvKuSZn0yz/
 KxCIIRxMYtt87XRTS409RLQGMxne8j/ZHVdEvFqwCuB5I2+b6aPBsFyOvrEj8DmTZebR
 wVmxLVDG5v/oGLFZgK5IuAM2G0NUVSHEURRqgV2nM+7O265E6WJcB0NSJOerQwOwMyC1
 B4LlVdZP4yHz51opttLc8hY3fz+3jqktF7A7Hslm1b1AaaSimbbvpjlgHquSbJ3/s/sC
 /Dwg==
X-Gm-Message-State: ACrzQf2FVArWF1cXxPvHKEKBqqSL7Ukp676GJhU8fB8FW5VmQJE8WP/5
 CFPHrxF3YdtdNWvj7VHFBSFIvuEg5O0=
X-Google-Smtp-Source: AMsMyM4NbEF64NLNZCjql0SwVeTu8yjtsI0jJ6SVOyxpiNIPNhZCyTlpigBJZ82Vvwb+cKt5Fq4U6w==
X-Received: by 2002:a05:6808:1242:b0:345:7e6b:9626 with SMTP id
 o2-20020a056808124200b003457e6b9626mr1743604oiv.39.1663685948869; 
 Tue, 20 Sep 2022 07:59:08 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05680803c400b0033e8629b323sm203156oie.35.2022.09.20.07.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 07:59:08 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/3] dt-bindings: vendor-prefixes: add NewVision vendor
 prefix
Date: Tue, 20 Sep 2022 09:59:03 -0500
Message-Id: <20220920145905.20595-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920145905.20595-1-macroalpha82@gmail.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

NewVision (also sometimes written as New Vision) is a company based in
Shenzen that manufactures ICs for controlling LCD panels.

https://www.newvisiondisplay.com/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..d9c38e214863 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Shenzhen Netxeon Technology CO., LTD
   "^neweast,.*":
     description: Guangdong Neweast Optoelectronics CO., LTD
+  "^newvision,.*":
+    description: New Vision Display (Shenzhen) Co., Ltd.
   "^nexbox,.*":
     description: Nexbox
   "^nextthing,.*":
-- 
2.25.1

