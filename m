Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D55174F0
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88A910F134;
	Mon,  2 May 2022 16:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8F10F139
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:51:31 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id q8so15335060oif.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qDbeIX3G7CAdlzYVZYrcGdjlGadN5/397vtFVJ5LGZ0=;
 b=XooHx68yyT3HJJvAvwlP32zNjixKBDR2DZX+foZ/QUBBANRiEilHqqKIyJMKqQF8l/
 USWW8mTYv0yD5WnhQ0199oxHJVfYZVVhMtab+xX+vTqWNRBVI827oWnXoJMh9n93ls2F
 nK8foxy6JPLfD6Nw+a3+4xbM+FHpQjSzk4OnF1T1AEAjbTwArmAnU2215ZyRtP6OZNkY
 VfkPJ6/gYjrj9tycLldB0fedH/O+ear22oankqOIHZjEeGz14YDpsbV+kvuEmjeijaLl
 emcOmA1hbgQyUmRUGEEL9AwyWm5TliinL6rXMxDelAdp3wYsyqvMA8t1HxV9X+0HGmEk
 77zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qDbeIX3G7CAdlzYVZYrcGdjlGadN5/397vtFVJ5LGZ0=;
 b=wkdRLbMEoQe22HJ2E9R4r5oMH4Xthn93dRvvKoP2wJnLrZbdirnz+iZhwRqLMN7a9g
 MR+/v9uccHP2c/t7210TtFvjK1owmkqWBfRNoTWhos1dTbI5RVZ7e+8Ui0Gapq+WiMfg
 84cG795YIn9EnzR3QoH8GP+gPfEW/72lIIkLzschlXpv+5PDWXQVaMKXU/IWIuA6ybZI
 de6c34qXpDTyJ/XmhJSd0yM75tQFSxJALmZl4WiT8g0ycyTivJw+5UltXTavjEWPT5tO
 1KwkZO1M9OA/WkbMISJ18pzj90lEtm8srVkfhCtWIOjJLH5T+6jep3jE8rS0j8c6Vviy
 MiiA==
X-Gm-Message-State: AOAM5328yGQyZJ2q5sZPG0yGrGeOkhcYn/FBxpWDFJ2rT+pdz62EQ8+v
 kEq9QEJHTkUW/3w+7wMESLhKOg==
X-Google-Smtp-Source: ABdhPJzBKz1yiIK2Jf2XUFNV3lOE1PeOdmDd6SS2he3gildxijlbqu95mdYr54pb4q4sU2bTKcztnQ==
X-Received: by 2002:aca:502:0:b0:2cd:c24:278f with SMTP id
 2-20020aca0502000000b002cd0c24278fmr33189oif.150.1651510290838; 
 Mon, 02 May 2022 09:51:30 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:51:29 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v4 0/5] drm/msm/dp: implement HPD notifications handling
Date: Mon,  2 May 2022 09:53:11 -0700
Message-Id: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

USB altmodes code would send OOB notifications to the drm_connector
specified in the device tree. However as the MSM DP driver uses
drm_bridge_connector, there is no way to receive these event directly.
Implement a bridge between oob_hotplug_event and drm_bridge's hpd_notify
and use it to deliver altmode messages to the MSM DP driver.

Note, I left the original 'bool connected' field to be used by the
notifiers. However I think that it should be replaced in favour of using
the dp->hpd_state properly.

Bjorn Andersson (2):
  drm: Add HPD state to drm_connector_oob_hotplug_event()
  drm/msm/dp: Implement hpd_notify()

Dmitry Baryshkov (3):
  drm/bridge_connector: stop filtering events in
    drm_bridge_connector_hpd_cb()
  drm/bridge_connector: implement oob_hotplug_event
  drm/msm/dp: remove most of usbpd-related remains

 drivers/gpu/drm/drm_bridge_connector.c   | 17 +++--
 drivers/gpu/drm/drm_connector.c          |  6 +-
 drivers/gpu/drm/i915/display/intel_dp.c  | 17 ++++-
 drivers/gpu/drm/i915/i915_drv.h          |  3 +
 drivers/gpu/drm/msm/Makefile             |  1 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h         |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c        |  6 +-
 drivers/gpu/drm/msm/dp/dp_debug.h        |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c      | 81 +++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h      |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c          |  3 +
 drivers/gpu/drm/msm/dp/dp_drm.h          |  2 +
 drivers/gpu/drm/msm/dp/dp_hpd.c          | 67 --------------------
 drivers/gpu/drm/msm/dp/dp_hpd.h          | 78 -----------------------
 drivers/gpu/drm/msm/dp/dp_panel.h        |  1 -
 drivers/gpu/drm/msm/dp/dp_power.c        |  2 +-
 drivers/gpu/drm/msm/dp/dp_power.h        |  3 +-
 drivers/usb/typec/altmodes/displayport.c | 10 +--
 include/drm/drm_connector.h              |  6 +-
 19 files changed, 88 insertions(+), 221 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h

-- 
2.35.1

