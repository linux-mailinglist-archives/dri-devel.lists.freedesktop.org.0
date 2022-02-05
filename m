Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089244AA4EC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 01:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4742710E1B5;
	Sat,  5 Feb 2022 00:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7375C10E1B5
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 00:14:08 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 y5-20020a17090aca8500b001b8127e3d3aso7575247pjt.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 16:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96SFyVQfbv/E/8NQyz3WLTVz461yfR2KLa0ZPZCtqDg=;
 b=IgKO/kM+ZjoHRFFP4hCXWCqNnbvj2TAjzdBKNPx82LhlBCVxOqy5DVhGwc1qu+2G9s
 jz147LFM9YpYPwlGTt3OMcFEO+GmtJUPTtuEL137l4L95KiMrLAYmrSIMuFpEXH7TOim
 u2JQ9Sj+1ruQBNcePfY+M4tDlzvVf2ueWWtxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96SFyVQfbv/E/8NQyz3WLTVz461yfR2KLa0ZPZCtqDg=;
 b=mhgOh20RsAeroHkdUrwUOTl4iWlrV7N9m6IlxOvMM0/xKR8X0QPnpwJmLRM2iH9FX1
 s9xI4im6sdpHMU6F0HnDdKYEpply8ogtxaEtqczGuynMboLys4EjOjtCRFN6bbP02XUL
 6z75D26O6LSrZJOsZNqq/eSH1I0nwdZJ2hXz+9RMdAVhnHFGaRvbm+G5ivu9RWvQUsEm
 m5rbd93rMx6aM0dVUsaHp4rtenonzX4sTAp+tANb2LUY1AeGeT58KqIlY3qsNdip/UF9
 cdJdi1pNHIkb+SCB9mgRGhu5inf4G1+EK/+lS4jmWmIB7ZD+YuUUcl14VnJrxh7iC+HA
 5LxQ==
X-Gm-Message-State: AOAM531dxZkjVk6AMMUBUO43FQLec3+7matytGnycjvpfcDXkYQAJzar
 WtUeUYUYDDpUbOfwpQOnQm0IZ8oX/h1PkQ==
X-Google-Smtp-Source: ABdhPJw9uTa9AOHSgwRNU6QqwbQftcU9rsyBtjV4lm4ZSQb3R6M6nncuQObIRAtbxuD7CEaiIYIXQw==
X-Received: by 2002:a17:90b:3ec4:: with SMTP id
 rm4mr6007176pjb.102.1644020047929; 
 Fri, 04 Feb 2022 16:14:07 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:d668:55ac:a465:88bf])
 by smtp.gmail.com with ESMTPSA id q13sm3720231pfj.44.2022.02.04.16.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:14:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/panel-edp: Debugfs for panel-edp
Date: Fri,  4 Feb 2022 16:13:39 -0800
Message-Id: <20220205001342.3155839-1-dianders@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>, robert.foss@linaro.org,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal of this series is the final patch in the series: to
allow test code to reliably find out if we ended up hitting the
"fallback" case of the generic edp-panel driver where we don't
recognize a panel and choose to use super conservative timing.

Version 1 of the patch actually landed but was quickly reverted since
it was pointed out that it should have been done in debugfs, not
sysfs.

As discussed on IRC [1], we want this support to be under the
"connector" directory of debugfs but there was no existing way to do
that. Thus patch #2 in the series was born to try to plumb this
through. It was asserted that it would be OK to rely on a fairly
modern display pipeline for this plumbing and perhaps fail to populate
the debugfs file if we're using older/deprecated pipelines.

Patch #1 in the series was born because the bridge chip I was using
was still using an older/deprecated pipeline. While this doesn't get
us fully to a modern pipeline for ti-sn65dsi86 (it still doesn't move
to "NO_CONNECTOR") it hopefully moves us in the right direction.

This was tested on sc7180-trogdor devices with _both_ the ti-sn65dsi86
and the parade-ps8640 bridge chips (since some devices have one, some
the other). The parade-ps8640 already uses supports "NO_CONNECTOR",
luckily.

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2022-02-02

Changes in v2:
- ("ti-sn65dsi86: Use drm_bridge_connector") new for v2.
- ("drm: Plumb debugfs_init through to panels") new for v2.
- Now using debugfs, not sysfs

Douglas Anderson (3):
  drm/bridge: ti-sn65dsi86: Use drm_bridge_connector
  drm: Plumb debugfs_init through to panels
  drm/panel-edp: Allow querying the detected panel via debugfs

 drivers/gpu/drm/bridge/panel.c         | 12 +++++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c  | 72 +++++---------------------
 drivers/gpu/drm/drm_bridge_connector.c | 15 ++++++
 drivers/gpu/drm/drm_debugfs.c          |  3 ++
 drivers/gpu/drm/panel/panel-edp.c      | 37 +++++++++++--
 include/drm/drm_bridge.h               |  7 +++
 include/drm/drm_connector.h            |  7 +++
 include/drm/drm_panel.h                |  8 +++
 8 files changed, 98 insertions(+), 63 deletions(-)

-- 
2.35.0.263.gb82422642f-goog

