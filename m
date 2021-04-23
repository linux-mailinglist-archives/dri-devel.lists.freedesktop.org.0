Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A636984E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A96EC27;
	Fri, 23 Apr 2021 17:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0E36EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 17:28:10 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id f12so36947652qtf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzW8gw/lChay/rLNwhgwlXkUklC1imdiRu5IZJc3UKs=;
 b=LRP8c9RoAsA+Ug0WokdedrbQa2U05MvwsRm0dqesAWlibw2QdTtvxcvQdUdPS4/R7k
 Dzzgk/NVhLr39A0/Y+c0E1oIpASUsgWoW44wkizulOIUdGTXJf1TxYOcaOZaGjLiltw5
 RprsqwrB6ufVd6lQbc1PR4I1cP30CgXdaD1SMVUeTa+CWeuN8MVkcryjdYdsMhZSfvcW
 q/bEEWQp8ROwYU7YLpQPR3/29AuViizc0bR4USvz2GkjG5ENkcpzr+g9mFWjncMMjEdn
 cQ8BfK2rAUfr0wNUuQ6115cBIxw5mz2WlRL2LJkboEdvmPFdQjhkkvWM8XnePAToLPEi
 TZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AzW8gw/lChay/rLNwhgwlXkUklC1imdiRu5IZJc3UKs=;
 b=IzI8z9v7LDv4h8holwNxIkTYdzvRHBNIdrWbtOEMFZ4QA7yuBiEOpPbIInnSwUKEw1
 RtORmXWXe7yK5GL5jzRa/Q1jWTsq3RG9mG4p/WD01WazWeMvDGehBkQYXigPIGj9vcH0
 lSPzHlgNZWSut5cg9MMl9fmBoz6TIMAhCni/qwdYpc6FLxVfbmjuMGFJSPeJauf889ls
 OkqDE5ma+wuIKqJBSencze8h3TGqBIZv6pTwQqtFDMx/cj3yQmArcQ+QYqBO35wV740F
 CmMrk1a7wMJth+qoAP7jvAXshEhY5cV7ahsLzb21xvzzZBUAqtmsFD2A/E7MqncOdL0B
 N/NA==
X-Gm-Message-State: AOAM5337o6+yctHsRwtJJPVgNxwdZvcsREpYcDNnWihTVjLX43SXS55t
 MAoZOOYXZOkOsC9RwntXCg8BEg==
X-Google-Smtp-Source: ABdhPJxdsCxGFuhVZIOZpCiAsDpeoN9/VhBAMMWbtJ2u0oxLiMSQyFyiBW+kjeIGADoDSII06RkhTw==
X-Received: by 2002:ac8:4d43:: with SMTP id x3mr4954636qtv.326.1619198889461; 
 Fri, 23 Apr 2021 10:28:09 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id y23sm4782627qkb.47.2021.04.23.10.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:28:09 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Date: Fri, 23 Apr 2021 13:24:38 -0400
Message-Id: <20210423172450.4885-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the required changes to support 7nm pll/phy in CPHY mode.

This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
the CPHY mode.

v2:
 - rebased on DSI PHY reworks
 - reworked getting cphy_mode in dsi_host.c
 - documentation change in separate patch

Jonathan Marek (2):
  drm/msm/dsi: support CPHY mode for 7nm pll/phy
  dt-bindings: display: msm/dsi: add qcom,dsi-phy-cphy-mode option

 .../devicetree/bindings/display/msm/dsi.txt   |   1 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  47 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 147 ++++++++++++------
 6 files changed, 186 insertions(+), 48 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
