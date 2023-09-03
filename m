Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B1790E39
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB1210E210;
	Sun,  3 Sep 2023 21:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4540210E208
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:29:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50091b91a83so1445022e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693776579; x=1694381379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aO7JcMbv/31Ao0IItAJcvJ97CXcaD4GQwRMPpX5ISig=;
 b=JW2LimA/z3g7TB1iXknJ+KCGqcuF981SzzLJZRh6qtRi1DcbqMm4BveHM5a5IWP8jE
 dPpuJSfw5NootJzfV67ZjH9fqVZCPYNx6zbilJZbUeC0Nmk9025VIEGxXJuYgAWak2E/
 4WCKN0qL/jliZ7vOZIwXuMay+Q7fo7OVjB1xjrl/29NDbabup0syF2IwFeKixpsAA1Oq
 sNJ8eOUi7TYtlZSTfWevkC5mi5IIjnMQOWiZckwGvr0qyXhXcPjT0B3ixnlhui92OZOm
 BIBwlF+2DTtwTftvNOzURjABFLvz7Gn10oWD+MFXCbdq1GaIJdEhj/ERcoelOaDmHrnp
 zf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693776579; x=1694381379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aO7JcMbv/31Ao0IItAJcvJ97CXcaD4GQwRMPpX5ISig=;
 b=lQbwPJxWb5vndpTEU67BGnp1Uij4jE0HLf+5hCmrWMuNx2P6ReX5LxDNhjxsXBoJ2o
 WxTo4+Bg5es6P3q507Ck9Vp+EwGtVbZcHGY5llZIHoULX3y0aPFwm6vXE7aqC0hvnelX
 ZRvkqVgi70MiHe/TjfJZa0ba+pzpNP8RIGdWU/MUPQ8+a8Q4RUSYbBBOlVibOfgkSmnh
 p0yhP73HQ5uPCe2KhXMGbJxhCGD/ClZbVEXvgqI9pfwvszw9kRSJX92aqWMumYFPXjyN
 dX6EssFSXYSqMi85aHp4wc0zmR5N+3gdO8aLUen+J9ok1KbDqVQ3OZrlmemPMOehW+f3
 ahWA==
X-Gm-Message-State: AOJu0Yy6kbwXIrDkoSN9F9rvNFJpAWv3htV3/mDrKyrJvMWYW22oz197
 biQaRU16Dg5IxU20fBnFymywUQ==
X-Google-Smtp-Source: AGHT+IE1TS5PmWbbxqldzYnmj04E5wJiAVQrziZm2fN2wTg0sXGtBtxHtmvZVFyK6YP6ZwgEHbm6eg==
X-Received: by 2002:a05:6512:230b:b0:500:96fc:129d with SMTP id
 o11-20020a056512230b00b0050096fc129dmr7034864lfu.14.1693776578713; 
 Sun, 03 Sep 2023 14:29:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 eq11-20020a056512488b00b004ff8d9ed368sm1412352lfb.258.2023.09.03.14.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:29:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 0/3] drm/bridge_connector: implement OOB HPD handling
Date: Mon,  4 Sep 2023 00:29:34 +0300
Message-Id: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note, numbering for this series starts from v5, since there were several
revisions for this patchset under a different series title ([1]).

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's
hpd_notify.

Merge strategy: since this series touches i915 code, it might make sense
to merge it through drm-intel.

[1] https://patchwork.freedesktop.org/series/103449/

Changes since v6:
- Fixed the fwnode refcount in drm/bridge-connector

Changes since v5:
- Fixed checkpatch warning in the first patch (noted by intel-gfx CI).

Changes since v4:
- Picked up the patchset
- Dropped msm-specific patches
- Changed drm_bridge_connector_oob_hotplug_event to call connector's HPD
  callback directly, rather than going through the last bridge's
  hpd_notify
- Added proper fwnode for the drm_bridge_connector

Bjorn Andersson (1):
  drm: Add HPD state to drm_connector_oob_hotplug_event()

Dmitry Baryshkov (2):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event

 drivers/gpu/drm/drm_bridge_connector.c        | 36 ++++++++++++++-----
 drivers/gpu/drm/drm_connector.c               |  6 ++--
 .../gpu/drm/i915/display/intel_display_core.h |  3 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 17 +++++++--
 drivers/usb/typec/altmodes/displayport.c      | 17 ++++-----
 include/drm/drm_connector.h                   |  6 ++--
 6 files changed, 62 insertions(+), 23 deletions(-)

-- 
2.39.2

