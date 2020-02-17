Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A391160D05
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC0C6E8A6;
	Mon, 17 Feb 2020 08:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31986E446
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 03:17:01 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id g5so7451014plq.17
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=95LDy22BpOxyIQvBk6FRPJlH91thVepwqVtwc6u1oGw=;
 b=nEeqMrk6uvG7rmPyXEGMSsIzelMz2dF99i37OZljcuo4oh7xZZoesAk4KrAQMOsWWY
 dTXreQy8BM9DKwR58wY7FRf4V9otbgQ2XYeTYDnHZE5mwrwLwuzImNlHIxOYMJTELfpn
 Oj3mN6jy/gx0BWtD1qG2u+X3A/guxcA70lSFPD9ekQq7rxSFDroFkBkLCEB23lH4+s+Q
 z9csLL3pxzo89k/O1pFjcwy9Wsr5bFBxD1GgMiWnQ4CKwXX9VjrgXroTSSEhWGrFgWCn
 A8/mcR4NzEWuyhlTwVoQ1RUK7TvfpCEUgR7ilK/luqlKNWo5sZacMLWsquJBcfmQt92V
 iirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=95LDy22BpOxyIQvBk6FRPJlH91thVepwqVtwc6u1oGw=;
 b=aRjFmb1/6rWn6d8zJEOOupPl+gXaetgkOCEo8GpAu1bHIuhM1us/bWLg3agRbCSuiA
 M1gVivv33L73+l0gJvZRDXVDDWy/62tWEh6iiA8iRuZeXjafLHumCjeQzwxyzvztRkQM
 KF3z4F+AVEWT70BOLQvXiXuJ0hwsNvGrkE44EGpyV9HfZDEdi7VSD6rPoVPp8zmenDyF
 XPRO/AvzYsrtWi/h/zAo4KjcjgWrtfZ/CTB796BB2A0LXm4g0j77/+Wz+Vg2cIvgRf7S
 ntwZIRMxR0hVGGvgU32c/1ru1So38+a+jU7uRAERGIaj44FRQYaJhkcdA/Z04hRtVGCB
 nWEA==
X-Gm-Message-State: APjAAAXCzCn7RmIlKfcKMG4mjizR2rJ4VWqdfMDCQNlCybtNaW4D3ZNr
 rD3YTySEbi2wn8qitRF2BskOBm1SrYA9
X-Google-Smtp-Source: APXvYqxBjslw8uxUiWz+4Eukc1k6XyGzGLU0KOA8j+kAfZKXNmE12yvV1aiYrnwpHrjkFRt+J4989fLX4IEC
X-Received: by 2002:a65:4c82:: with SMTP id m2mr15138678pgt.432.1581909421205; 
 Sun, 16 Feb 2020 19:17:01 -0800 (PST)
Date: Mon, 17 Feb 2020 11:16:51 +0800
Message-Id: <20200217031653.52345-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2 0/2] ASoC hdmi-codec: fix HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With proper unbinding audio components and inserting the HDMI external
display, kernel crashes as the following messages:

Unable to handle kernel NULL pointer dereference at virtual address ...
[snip]
Call trace:
 plugged_cb+0x1c/0x74
 mtk_hdmi_update_plugged_status+0x48/0x6c
 hdmi_conn_detect+0x1c/0x28
 drm_helper_probe_detect+0x110/0x170
 drm_helper_probe_single_connector_modes+0xd4/0x608
 drm_mode_getconnector+0x1e8/0x418

The 1st patch fixes the crash by notifying hdmi-codec's consumers to not
report jack status anymore when component removing.

The 2nd patch fixes race condition in mediatek/mtk_hdmi.c.

Changes from v1:
(https://patchwork.kernel.org/patch/11379979/)
- added the 1st patch
- use mutex to protect plugged_cb and codec_dev in 2nd patch

Tzung-Bi Shih (2):
  ASoC: hdmi-codec: set plugged_cb to NULL when component removing
  drm/mediatek: fix race condition for HDMI jack status reporting

 drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
 sound/soc/codecs/hdmi-codec.c       | 10 ++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
