Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF60787C2D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 01:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D9E10E32B;
	Thu, 24 Aug 2023 23:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E9410E5B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 23:56:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50098cc8967so542136e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 16:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692921398; x=1693526198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TD8UWO92SORs7p32tv6N7DK3UyRUfiGcxfa7tlZpBYw=;
 b=a8pCukFl7eG+Vb/nwewp2va+m5wRrJ5s8ShbgWtMpDGO4LuNWAOG8ItA+Zrbbd4wNH
 xdxRobZnNPaXaWbxm9ULMJIrjQ6SNQ/oVGmOH5EBK7XJ9JNynG8VTaWEwkk2Tlg08qNx
 RzQRWLyXW7qf/10rNgEQ5S5XG+8SRvPrubMoSbbD2xJYcHB5badu2XTfz9NKVoHI/u5w
 Bz3GHP8M6sYlRcwEWIrJwPS3WkpjHuOOad0SYySKKquBEwxBBNww1hQIxmtRp8RWlH+A
 oXJWn+eNRY8+9afu2w/ohRQsPRUn6gETC96UHegdzj0RtvGeB3hNsKRQpRYrfzoOCAJh
 TYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692921398; x=1693526198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TD8UWO92SORs7p32tv6N7DK3UyRUfiGcxfa7tlZpBYw=;
 b=aSxIyHgPghYdYc+paeIfGuWwMzuW9yBGrAwhoZkwFIWmCscEYQXbuzr6x264ievJfb
 3Md6/YkXoBYrafo4vvfoDgZOoQtnSDzTlj73X/D70eq+sL6MmgvYj6ZSFEw0iqWSOyJR
 sYIh1ED4eRyw/gEUJ+vIykiO/mXKcjU2bho6vuf/38TOGz3lUWy93bq1vYo2hdmpH1qL
 douL99eXUXExvXaMmQ1sx6nGlCmbbW4u9OtxhRHQhrv95DAz3BTvOPXQA5NF0HQgLkiZ
 PNnunKdrcemfWUzgZYayEy8R7pJSRJtxM7Dr6cj3VhJ81fsjDESfUQFuU7+kJ5ZQIueh
 dVZg==
X-Gm-Message-State: AOJu0YxtK2lI4Ti0Rb7jZ67WEAfn/f/VuAejgrg6XajtEcQcKNwtgRWL
 YNq18j7UFbRGz3gn63NDGorzODhCY5g1Vp9L3D4=
X-Google-Smtp-Source: AGHT+IGyk/WN0XsmZwuvxJEVmOV2xPJ/f/SBynzEJljKTG/YFpOiRWHseqihocuDideMtROIEoTV6A==
X-Received: by 2002:a05:6512:12d6:b0:4f9:6842:afc with SMTP id
 p22-20020a05651212d600b004f968420afcmr15403132lfg.64.1692921397540; 
 Thu, 24 Aug 2023 16:56:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j15-20020ac2454f000000b004fe5688b5dcsm57900lfm.150.2023.08.24.16.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 16:56:37 -0700 (PDT)
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
Date: Fri, 25 Aug 2023 02:56:33 +0300
Message-Id: <20230824235636.1436665-1-dmitry.baryshkov@linaro.org>
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
to merge all three patches through drm-intel.

[1] https://patchwork.freedesktop.org/series/103449/

Changes since v6:
- Rebased on top of linux-next. Fixed the freshly added
  new drm_connector_oob_hotplug_event() call.

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

 drivers/gpu/drm/drm_bridge_connector.c        | 34 ++++++++++++++-----
 drivers/gpu/drm/drm_connector.c               |  6 ++--
 .../gpu/drm/i915/display/intel_display_core.h |  3 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 17 ++++++++--
 drivers/usb/typec/altmodes/displayport.c      | 17 +++++-----
 include/drm/drm_connector.h                   |  6 ++--
 6 files changed, 60 insertions(+), 23 deletions(-)

-- 
2.39.2

