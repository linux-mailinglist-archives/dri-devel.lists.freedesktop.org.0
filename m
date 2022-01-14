Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3E48F0CD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F09510E1B4;
	Fri, 14 Jan 2022 20:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869F810E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:17:10 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so23302487pja.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1KlPp5hV7fm0qq5cqvD5aoj0BfkxebgR6vlczP+kuR0=;
 b=hPBL7+GzXtx7Xy9BNRGobBHcJh3in4NXqnnYC06hntRlpfp/vjmD9i9XpuCMkppYe0
 KTPskbaS26eaCBp9BJJSJSoDjVC7Re+360GTMca2engSbymUQqzvGV7YvvxDdrJ6Auu1
 1qigxd68D5GnHmbXdB/NPhH0nNGBQ1nZC2LHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1KlPp5hV7fm0qq5cqvD5aoj0BfkxebgR6vlczP+kuR0=;
 b=fWWSfj4YvjlBmFgNcU/Ch2JfsJloj2ESeQx9k9xV4+OGYtJu5BkyPNV0FsqQo0WcNF
 atOPftSfF5LIs7fjqJ7j97g2bri6H0tOWWF73b45SWU7YA8Ah68U3MK6ZjG1AA/YtNbI
 Cc3SK2HdQ+70XgjuCqyTpE4zu8zfSSOsnng0qIVTpWfrPbI92aXxuNHcjkGAYK7VKnDq
 9yE0JUKGUEbkfxcKbwKqxQ94p+RIy87F0zWtMPJnMZ5utD6sxXiVTAKEwsH+CSHrVsWC
 UrlEQJDIaa+BjBFrvLl/WvF9tOHIJGIes9k4F+1+gnr1BFdska8AX1fjrcx/EejVyWml
 3tXg==
X-Gm-Message-State: AOAM530UNHHIcQDxlwy1sspxAL1nu1GqvzvtKKlqGiUIYemqXEzFQywi
 ykdgt8lqdmpRtRM3g2H4p70INw==
X-Google-Smtp-Source: ABdhPJyYDhYmzb1m8B5ltHSl6+g7+4DhFkP602unTzHjzxK1IseRAPUhU48jZq5jKbANYv16P6nwIQ==
X-Received: by 2002:a17:902:ea07:b0:14a:45c0:78a7 with SMTP id
 s7-20020a170902ea0700b0014a45c078a7mr11123208plg.92.1642191430200; 
 Fri, 14 Jan 2022 12:17:10 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id q12sm6599881pfk.136.2022.01.14.12.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:09 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] (Re)enable DP/HDMI audio for RK3399 Gru
Date: Fri, 14 Jan 2022 12:16:49 -0800
Message-Id: <20220114201652.3875838-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes DP/HDMI audio for RK3399 Gru systems.

First, there was a regression with the switch to SPDIF. Patch 1 can be
taken separately as a regression fix if desired. But it's not quite so
useful (at least on Chrome OS systems) without the second part.

Second, jack detection was never upstreamed, because the hdmi-codec
dependencies were still being worked out when this platform was first
supported.

Patches cover a few subsystems. Perhaps this is something for arm-soc?


Brian Norris (3):
  arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
  drm/rockchip: cdn-dp: Support HDMI codec plug-change callback
  ASoC: rk3399_gru_sound: Wire up DP jack detection

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 10 +++----
 drivers/gpu/drm/rockchip/cdn-dp-core.c       | 28 ++++++++++++++++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.h       |  4 +++
 sound/soc/rockchip/rk3399_gru_sound.c        | 20 ++++++++++++++
 4 files changed, 57 insertions(+), 5 deletions(-)

-- 
2.34.1.703.g22d0c6ccf7-goog

