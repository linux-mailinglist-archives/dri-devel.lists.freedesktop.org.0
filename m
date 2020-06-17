Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085BB1FEC34
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A386EAD9;
	Thu, 18 Jun 2020 07:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7384F6E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 23:20:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c17so4942559lji.11
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wYFXhzh5n3W0/+lsSdfHJjbCv4Q6beTMubTyt25bamU=;
 b=Ok19fZx0y2mHLKiAFpRmandHU0EoDjRfBaaPQEgbhcBR5HFtheqTZFCu67x3oKJEOr
 /u+YWV6c19XxE6Iha3+er0DYXVVlkgxVuYncg1OvFNYWz0oMDUd1TeUjNEA9QmqrY+Il
 3xzE0DNI027haL3l9sHmKQNS8ek0ZJpcpDVIiWYtQPYGUuI2DqieNWdTBLpzpKICon+N
 phAQFHbPaJI2VA2mFzM78W6f+qx1V6uKthNVC1uBSXbUlAThaFvTLCl3VEB/YHa5wKtG
 s8Ck65117L+Wb6cI5MivXM7pfxMYg+R7joJESSDY9/GYgy2gCoMwWlR8ixr+a3igZyZu
 ++8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wYFXhzh5n3W0/+lsSdfHJjbCv4Q6beTMubTyt25bamU=;
 b=CjfEKmgxC3an6AbQitfXELizGSZzF7uzHmbn/4Joyk0XwbP95nj7dluAijRX5OUBy7
 m1T/7nkC71TRerW0SBiHNNhc5sS2Q5PbvpbnDn/1nwNllRT8Bqfjjs+LLvfEPy5OKpR8
 KjykjKHSNSBRRceTaK02mHVpSKM8AewsBjKkW0PghQefBcw9IvLeUoS6ibP95kJw591x
 hndrU3vVF1CAS2vDBHPZ71ZBzif1r2/CzmUwN/QSdTPrJZEAe3pDtVPrNaScps+UI4iM
 TdqyQuXr1ZoL6L5X8zKM1UgAHWGskjDDzMdK5D3ASnfPkqC7MKQxYMJhi+U87ZUNWXiT
 VGPA==
X-Gm-Message-State: AOAM531JuW9MSF+VfQl+CXL/zucDMVBQT9q/HXMoZ16HfBikZIKD29aM
 U8jEGqxrXnGW1MQe7zP7FRo=
X-Google-Smtp-Source: ABdhPJy2asig9o4HQkeA6kr0/BZUFzr0Cw199sxDaJ65mXseg932jHDoFA0AVplbmsVwcK8/VX91vg==
X-Received: by 2002:a2e:1412:: with SMTP id u18mr833931ljd.309.1592436013810; 
 Wed, 17 Jun 2020 16:20:13 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id x3sm235100ljc.82.2020.06.17.16.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 16:20:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH v11 0/4] Panel rotation patches
Date: Thu, 18 Jun 2020 02:18:38 +0300
Message-Id: <20200617231842.30671-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This series adds support for display panel's DT rotation property. It's a
continuation of the work that was initially started by Derek Basehore for
the panel driver that is used by some Mediatek device [1]. I picked up the
Derek's patches and added my t-b and r-b tags to them, I also added
rotation support to the panel-lvds and panel-simple drivers.

We need the rotation support for the Nexus 7 tablet device which is pending
to become supported by upstream kernel, the device has display panel mounted
upside-down and it uses panel-lvds [2].

[1] https://lkml.org/lkml/2020/3/5/1119
[2] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200607154327.18589-3-digetx@gmail.com/

Changelog:

v11: - This series is factored out from this patchset [3] because these
       patches do not have hard dependency on the Tegra DRM patches and
       it should be nicer to review and apply the properly grouped patches.

     - Initially [3] only touched the panel-lvds driver and Emil Velikov
       suggested that it will be better to support more panels in the review
       comments to [3]. So I included the Derek's patch for the BOE panel
       and added rotation support to the panel-simple driver. I tested that
       panel-lvds and panel-simple work properly with the rotated panel using
       the Opentegra Xorg driver [4] and Wayland Weston [5].

     - The panel-lvds driver now prints a error message if rotation property
       fails to be parsed.

[3] https://lore.kernel.org/lkml/20200614200121.14147-1-digetx@gmail.com/
[4] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
[5] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315

Derek Basehore (2):
  drm/panel: Add helper for reading DT rotation
  drm/panel: Read panel orientation for BOE TV101WUM-NL6

Dmitry Osipenko (2):
  drm/panel: lvds: Read panel orientation
  drm/panel-simple: Read panel orientation

 drivers/gpu/drm/drm_panel.c                   | 43 +++++++++++++++++++
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  6 +++
 drivers/gpu/drm/panel/panel-lvds.c            | 10 +++++
 drivers/gpu/drm/panel/panel-simple.c          | 11 +++++
 include/drm/drm_panel.h                       |  9 ++++
 5 files changed, 79 insertions(+)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
