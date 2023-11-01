Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC8E7DE75A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2670610E7AE;
	Wed,  1 Nov 2023 21:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E581610E7AE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 21:26:08 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5aa481d53e5so193416a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698873968; x=1699478768;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RaBR3pdZUAMcYqGQ5rjk3BKUdj96ofVF3tOiVxQkxxA=;
 b=b6KktRpDzrxTYLPbb8CXyQ8B8XB9f7tpv7blv3lbG/cocRpEcBog0pr56lEX38CqCU
 XwSg1b0mADBuGCF/jGBPeEDR1boxKo3Ep51yOLRxxDFB+hvqCIjzI+0TvjuU14Q2f6K0
 JS7FhXocPA2SKoGc/9As7U/qksNNXiVJEvobw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698873968; x=1699478768;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RaBR3pdZUAMcYqGQ5rjk3BKUdj96ofVF3tOiVxQkxxA=;
 b=vyBAhU+3vqVedCjnJXMiSfZ9UlvUf/ikSA8JpQF4nqnkzRCAj5V3Lw8nYy2QXDd/6e
 ZnZAjwmsrnWMBoovFMzAe++BnB00nwqJ+C55xNx/GjCRh+7oHHOvTvoEFXZjFFXI4jLM
 PF044rEE0LvX41O/dWw7sRq3j4WJNVtjh4lYQnYMnuTLP+K1EeDlGM1WgmjlfnwmACXj
 2i3f7QjH8nXmyW4j0RpnOSsSj0BGsEPMct5gMdTjMlkpxd1AEI1vtUqzBtm6Ihib+s0w
 TYmee5WPPhMHgVaCUuP6paNqSwG7XkEAWKWUnImU4AmEXQzMXQNZs6/VZXH6qzoeIsRb
 PoRA==
X-Gm-Message-State: AOJu0YwYWXhgY363VWWITY6DDjhbGSz8sjeejY4WhPgbMabp2C2dok7K
 HWMHQ8vA6xoZJgusnSwEZmfPvA==
X-Google-Smtp-Source: AGHT+IGgARV5iLsJRlXNajtZlYEyZPKvJyobhwMJcQbUtPb3iVyOs339FAejB7L/BwYZAqms9kTZZQ==
X-Received: by 2002:a17:90b:904:b0:280:2652:d4c with SMTP id
 bo4-20020a17090b090400b0028026520d4cmr10217498pjb.13.1698873968459; 
 Wed, 01 Nov 2023 14:26:08 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:b410:473c:2b92:2e2e])
 by smtp.gmail.com with ESMTPSA id
 ds21-20020a17090b08d500b00274262bcf8dsm1212976pjb.41.2023.11.01.14.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 14:26:08 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/3] Add a few panels and use correct modes
Date: Wed,  1 Nov 2023 14:20:08 -0700
Message-ID: <20231101212604.1636517-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 3 patches:
1. Add a few new generic edp panels.
2. Support a new quirk to override the mode read from edid
3. Unset preferred mode from edid if hard-coded mode presents.

Hsin-Yi Wang (3):
  drm/panel-edp: Add several generic edp panels
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/panel-edp: Choose correct preferred mode

 drivers/gpu/drm/drm_modes.c       |  16 ++++
 drivers/gpu/drm/panel/panel-edp.c | 135 ++++++++++++++++++++++++++++--
 include/drm/drm_modes.h           |   1 +
 3 files changed, 144 insertions(+), 8 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

