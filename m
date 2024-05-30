Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0368D561A
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A5510E698;
	Thu, 30 May 2024 23:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mN2ytl0e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F84710E698
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:13:01 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52b86cfcbcaso490662e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717110779; x=1717715579; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V+qOoN0EVfQIJq5I0wkGIsN6OuhlGgSySEsUl1KmSJE=;
 b=mN2ytl0e98hgmDS7VWb23fggRBbY/mEtcs8cdVPeSJHltmujOqYM/08NihKC89+kVL
 QW0yEiR5YnvRrdIRJfXOruRxwS9yOOYLw1UegWIoYZj06LRSXfXpTYNB3oW7h8uWRHJM
 lYea6ESVutzaC1ee0GBWhGM5ukWnaIMhoreMx9uxkzjBqxIsNcgj3alVRT594/LoGHdo
 toyvppwctjQ955jbPf+ZH2ALSoTjFq8MZX3YMefSnypYQiiqGuKRyOY8w5MAEwX+t6gA
 ceyNIhldKA2Y/dXKTh8yq+mgO8fbVbuQjA7neNoP3K8Nh1Oelhg+HtypiBtbMVKMSuq8
 svMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717110779; x=1717715579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+qOoN0EVfQIJq5I0wkGIsN6OuhlGgSySEsUl1KmSJE=;
 b=tDEeucdEvhbJ29S9F6d1nVYHTnZKvfG9m74XgusrfisduVm+XNHaiUzBJJJDlxp8K7
 I0kRIdAbMArYZh/XqcYWPmVSAgVYtPzDo4v4qmrUb4SxQKRUxz1GzRvJE3Sl8mvHCb+v
 ta0Q150T9w+UK17DjFse5Ae85nHdEVG7YpgM35xkrSb4qJTs31gFuvdtixhMvBzP0N1W
 tAbeHnjE2bEqZqWcWIDZtLD8RU7M22PR061GryONECbmWlhnCLDxdOPzqdMByS4Bsu84
 virjcELjAQXZ0nl762DR+JGr6LNfnmThnhoPa0ntEdG/R6bc3374wUghlwLqI36EV7If
 Mlfw==
X-Gm-Message-State: AOJu0Yw2PKpCPmH2LtL/06YE2qXBVtkW2b69gTPqpLkbLupW221z1nqH
 BsFkwaTlbJxqRjlk+FMRWDfDmkxfNJ+hKrfep0AIDwQFRj5/bLE0ajAacj4QyfdCDavnWUxiiuE
 i
X-Google-Smtp-Source: AGHT+IEV/5BqrG4ACKM6rhd7dA3ytRF7wYyFY6D69GLmeOZ4hii09yG9fwmlf9CX59XVNOOJna1jFA==
X-Received: by 2002:a05:6512:3447:b0:51e:f79e:15d9 with SMTP id
 2adb3069b0e04-52b8954e8ffmr60363e87.21.1717110778649; 
 Thu, 30 May 2024 16:12:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75d96sm119005e87.120.2024.05.30.16.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:12:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 02:12:56 +0300
Subject: [PATCH v3 2/3] dt-bindings: display: panel-simple: drop several
 eDP panels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-edp-panel-drop-v3-2-4c98b2b95e3a@linaro.org>
References: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
In-Reply-To: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2746;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XBZ6fSg++oMZimfKiEFT9ckJ+C8xAqyph6b+iI0KMKk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWQf4cuAqciw3f/0F3C1tf9A7KINZ9JPXqdn3p
 YO10u953OiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlkH+AAKCRCLPIo+Aiko
 1bdNB/9oeC31aBN0EKZTkF+/ih9KAMVShpEp7KjdxBoSJbJItjSwt6o6FBbFlv1NlAgxGUFl+0n
 4KWeXZHdQhzi2cfB30K0+oVQOEoBbqnanqT+4kmUhdiB09rvzDlZQzdQ2B5su4DwgoAFprBzhPl
 RwYWjW0iwP4VfWLfsuOH05fXLCmELpXi83PpLslolrZJhnc59BRcJDb4/rWBXi6m8UBm6vQ5EE8
 lkJWfJd0OACREKHyVI3Teow1+1SNcKf+dbDlIyy2jmK3W0WqN24qym1ttA2zm5wq2ckLwVWe7sD
 Gg1TRRMU9QUJpt3nArfOx2aGui4dfySrA3cu1m++io6m47Xg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The panel-simple.yaml includes legacy bindings for several eDP panels
which were never used in DT files present in Linux tree and most likely
have never been used with the upstream kernel. Drop compatibles for
these panels in favour of using a generic "edp-panel" device on the AUX
bus.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml        | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5067f5c0a272..e5ed51226433 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -50,13 +50,9 @@ properties:
         # AU Optronics Corporation 11.6" HD (1366x768) color TFT-LCD panel
       - auo,b116xw03
         # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
-      - auo,b133han05
-        # AU Optronics Corporation 13.3" FHD (1920x1080) color TFT-LCD panel
       - auo,b133htn01
         # AU Optronics Corporation 13.3" WXGA (1366x768) TFT LCD panel
       - auo,b133xtn01
-        # AU Optronics Corporation 14.0" FHD (1920x1080) color TFT-LCD panel
-      - auo,b140han06
         # AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
       - auo,g070vvn01
         # AU Optronics Corporation 10.1" (1280x800) color TFT LCD panel
@@ -172,8 +168,6 @@ properties:
       - hannstar,hsd100pxn1
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
-        # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-      - ivo,m133nwf4-r0
         # Innolux AT043TN24 4.3" WQVGA TFT LCD panel
       - innolux,at043tn24
         # Innolux AT070TN92 7.0" WQVGA TFT LCD panel
@@ -310,16 +304,12 @@ properties:
       - sharp,lq101k1ly04
         # Sharp 12.3" (2400x1600 pixels) TFT LCD panel
       - sharp,lq123p1jx31
-        # Sharp 14" (1920x1080 pixels) TFT LCD panel
-      - sharp,lq140m1jw46
         # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
       - sharp,ls020b1dd01d
         # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
       - shelly,sca07010-bfn-lnn
         # Starry KR070PE2T 7" WVGA TFT LCD panel
       - starry,kr070pe2t
-        # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-      - starry,kr122ea0sra
         # Startek KD070WVFPA043-C069A 7" TFT LCD panel
       - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel

-- 
2.39.2

