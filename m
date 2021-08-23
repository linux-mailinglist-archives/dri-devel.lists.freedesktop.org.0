Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB103F4A16
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 13:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA38D8975F;
	Mon, 23 Aug 2021 11:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311978975F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 11:51:32 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e1so3047325plt.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 04:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvKsmbaciKPF6OJQp+Jz6my20ifBtNKlhOi0gn+GEfw=;
 b=AUkDAh4oH7KblX9b/0RzNTOlSUvYksN0Ajzo1oW7jxcqnUlAeBsdNIU8tpUIerjn8/
 Bb0WDMBV7A2YhfPM9ixQ9wN/fWIiUoLpW2P+0t4NYKAvoQbK2u1yxPi3Jy3qNj7HYzZC
 qNIYk/J7VftRBTaTTvMJqPbeFjH6kVq/OFKevqlCV0REc8jqxCbHOTkQ4uGPpRNXky2B
 OOUV2liBS2W7P6rf5EUjv3hHemzXAHLT0p75BmGDSSkD5alVQxY5ikjxQXzfPje8sSBM
 6N2rx199++3BwXCamspviyIQkMCBbfePBtyFQwKz2X49Di6qeYJqMLwkYMl4lgiLmSLA
 o5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvKsmbaciKPF6OJQp+Jz6my20ifBtNKlhOi0gn+GEfw=;
 b=b6Kh8/g/Y7m+jX4SFvY1DjZHiZeWYDzFUtIVGpzCDvHTdKL/fMlDHkjUIOPyN91KEt
 CcEhPu4TgkwW/EOAWBVvz04SmVGhtq5LqrXYA2OvnoODPt1PA8bRjSa3V4V7cqFbcxdD
 3BoB7x1O7fM5ygCr9YKt8UsMmvR8OvsX4xDAkEc2MXm0EciMzSNqRsaQeMuzUufLEheV
 fKaM9YXQnc8Lsl+epNCxU3o5keaowtgZBHIiClHtEXFWNZVpKLL1BO6amhhhWVpocMpR
 5BUpxPSGsZXQGT5MKvxng6E4NlGu88HYGjTic8RIdMedW5QgaiSd7iVFCXAep80iYZMG
 yuDA==
X-Gm-Message-State: AOAM532mekuernQFPXZYYFJ5lA1IFPO9ZqyTijYQUvnAqb8RZBj+r14V
 xIk7JSBeTPFwNnpsJALYglvfOA==
X-Google-Smtp-Source: ABdhPJxZDFTnrHgyjazzbqpcPk1WuHlLBOLj87xdIyvkWV3fHn8cWZ7+1lfagT0uFvNFeG74/a2HrA==
X-Received: by 2002:a17:90b:a48:: with SMTP id
 gw8mr3269218pjb.145.1629719491839; 
 Mon, 23 Aug 2021 04:51:31 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id z19sm15985426pfn.94.2021.08.23.04.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 04:51:31 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 0/2] Add driver for BOE tv110c9m-ll3 panel
Date: Mon, 23 Aug 2021 19:51:23 +0800
Message-Id: <20210823115125.1070257-1-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
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

Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml:

Compared with v1, add a space in the required list.

yangcong (2):
  drm/panel: support for BOE tv1110c9m-ll3 wuxga dsi video mode panel
  dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel bindings

 .../display/panel/boe,tv110c9m-ll3.yaml       |   83 ++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-boe-tv110c9m.c    | 1303 +++++++++++++++++
 4 files changed, 1397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv110c9m.c

-- 
2.25.1

