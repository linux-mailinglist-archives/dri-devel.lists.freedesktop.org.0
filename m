Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95434245D26
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A096E492;
	Mon, 17 Aug 2020 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A356E260
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 21:56:31 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id i19so3821205lfj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzeeHUlrLr61C7JvJ6pH3B5N/JEP/ZCyFmvXdO98Mgo=;
 b=u2CJnwQQkKvug28WtHist7QpT6JyKtfrPoAVYzZWavwMLdZG3LJ0Ij9Nz3caK+urbx
 urCap+pdkMAucM/w1WOVzxkD22GgGc+0oo/dxxd2E+K1sPAVikyYN6kGTbixi2v0lvQp
 zNX295YgwYUVovrZfucNUJ6JYdQYdejGkITMRCQ3nx0pv9PuLtpgfCWcpPQsVwnVG+7M
 R0wOv6t0A10GpqnlhfL3oSsE06E74HYPh3PsCL8xHvdSfk1guCz8LAxim0t2+V/ONog1
 P0B5DMfgOpAGWp6Fi7RIJ56+3q8zQtZt2WyNkLbh8ieGDfJmtTgY0TaNUCta2BdTceOD
 CIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PzeeHUlrLr61C7JvJ6pH3B5N/JEP/ZCyFmvXdO98Mgo=;
 b=TBaWAsWk28MCaygCWnCB/6oSxdNBPCG4JvuLFAqh7yeWa+4TT3pe8ep5DGWb9sRn4+
 lhMVoRoSIb33EpxxL1FdHpeiwj3CcDMm9mdI/NEM3dt9oVe7bjFrSQ0mkywUDRGBwmh5
 3IS3EnPA2tjqJTEZG3VExVQHBUFIgGhRlZTzOCtqudCFW+qPPBQzDFfp1F0LUAgs4iac
 PrEKd6nN/6noN8h8yvg0/ldoOe5oF/lhAdrmPcybQS/yJEWaxFPdLGPVEBRD/W8j8MIJ
 JH/aFIhNd0nmZzKPTM1sWiEsikSQUTq4SzgwCsB+TSo1ZS+56D2KU8KiTKrWKmzNbtrd
 RoJg==
X-Gm-Message-State: AOAM531yQWzpLDhhwdEFrlcyzt09gOn5OAHTlrZzv+xkM786hyFfuwkk
 7f32zPCIdQS2Ou8ZtYS+34M=
X-Google-Smtp-Source: ABdhPJxKcz4O1AEDWJ/fIGU/BkBFKp9jenhUiSsUX4BAhvj7gZaCikC5OYaSSo8/REOZJow3PFKVDQ==
X-Received: by 2002:a05:6512:2010:: with SMTP id
 a16mr3065769lfb.196.1597355789762; 
 Thu, 13 Aug 2020 14:56:29 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1349977ljk.97.2020.08.13.14.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 14:56:29 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: [PATCH RESEND v12 0/4] Panel rotation patches
Date: Fri, 14 Aug 2020 00:56:05 +0300
Message-Id: <20200813215609.28643-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

We need the rotation support for the Nexus 7 tablet device which is now
supported by the upstream kernel, the device has display panel mounted
upside-down and it uses panel-lvds [2].

[1] https://lkml.org/lkml/2020/3/5/1119
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi?#n1036

Changelog:

v12: - No code changes. The v11 missed v5.9 release, re-sending patches
       for the v5.10 kernel. Please review and apply patches to linux-next,
       thanks in advance!

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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
