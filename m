Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DE2830D1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 09:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0256E120;
	Mon,  5 Oct 2020 07:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F7289D81
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 20:07:00 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id n25so5504511ljj.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Oct 2020 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/4EV+wL5qpugIXXyGUN4h13qKX7qr6NSXuZ62a9ozE=;
 b=HcYgzMDixECWWf1gc5PlDnKU1KJoFMxq/eo6bK+klFdcL+U263X7gvj4WJo183ok4U
 Kew4BHE59a705/4A3H17PNfNMYg7H3mL0cHdVcHhVGjqEzlv90kZzHAw2/GfplGHPeJm
 Fs062jm68SPF3RbfHgQWX8MzKZYishNHC18e5oafQnbzDjP4tBFgARxj4yqbCGLTgKQs
 fi2DfOjHaudv/4bgjh5uiu5d3uMRshZRIl2jODyuV0Y35Ldh19wSW/DCSVI70dJkdK4Z
 GpP7nQVM2Ijvbh7K48e1XX2/5VwNnLJy1Ixd3A/6aveQyZAPZqgIbqh4d0mQnBSULgao
 6UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p/4EV+wL5qpugIXXyGUN4h13qKX7qr6NSXuZ62a9ozE=;
 b=tTqAybKtGxyqG7+EUoVJgHztBGmt7O7eOVhcvGanmRzGypouCuPiFxeplEn5AzTmOP
 5AvuUdDYa6BPzQXc/2Fw/pnMrDe3m2wuTt7kJBZyJvyKVpBOtZYye66UT2bf4ScaGdEK
 18zMBzB0ekxu0nPZ9/Atnrfvsb1dfISn/T6KLsIMG26Mn+kdkF+Fd0yPMjibJrq9lKOY
 xBs5sHJeC6fyQoHD9TQtTM7IHw1pd8Iy5hKdyP7DBL2n3q2SM9Ac3MG1hbMBiAtjCOsc
 wljhttjwzqSHnNu2r4MilQuAF9cQfK8fT16zMfbVUGklM8Um6X5VaJfCMzsK/pU6B6Wx
 vGYg==
X-Gm-Message-State: AOAM533yIkmEduOAPIbvoFglfQZK4aP5K5Xaf9BSWtoNnmy7P3OjFUux
 yYvBaQag2eVb64Itr8Hk/HLjWF7FaDZ8JA==
X-Google-Smtp-Source: ABdhPJxlGGgPUBFrwh32PMLAPfMm1HSKe33/idBcUmIoq6/OvdbFL4kc05rFI8QDh8WUpG+jBUYJQQ==
X-Received: by 2002:a05:651c:549:: with SMTP id
 q9mr3102270ljp.399.1601842018350; 
 Sun, 04 Oct 2020 13:06:58 -0700 (PDT)
Received: from localhost.localdomain (h-155-4-221-232.NA.cust.bahnhof.se.
 [155.4.221.232])
 by smtp.gmail.com with ESMTPSA id x5sm2932781lff.280.2020.10.04.13.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 13:06:57 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: dw-hdmi: Constify dw_hdmi_i2s_ops
Date: Sun,  4 Oct 2020 22:06:53 +0200
Message-Id: <20201004200653.14702-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Oct 2020 07:22:30 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of dw_hdmi_i2s_ops is to assign its address to the ops
field in the hdmi_codec_pdata struct, which is a const pointer. Make it
const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 9fef6413741d..feb04f127b55 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -170,7 +170,7 @@ static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
 	return dw_hdmi_set_plugged_cb(hdmi, fn, codec_dev);
 }
 
-static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
+static const struct hdmi_codec_ops dw_hdmi_i2s_ops = {
 	.hw_params	= dw_hdmi_i2s_hw_params,
 	.audio_startup  = dw_hdmi_i2s_audio_startup,
 	.audio_shutdown	= dw_hdmi_i2s_audio_shutdown,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
