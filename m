Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DE519241
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 01:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585D410FFAF;
	Tue,  3 May 2022 23:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C966510FFAF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 23:21:35 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id i17so7084087pla.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCyuL8rj9y1A8bDYJ8Ok6fBVOndsrzjav6d8Lz8t4jk=;
 b=YVlF//VOfLdFfTHNcRkc8XnlCRMWvCRgRFOyO0OlWHfVA/1hmWIyQ24dRLBvLTt/09
 RixtWaNqCQvHR/DAubbDesLZC/lrn90ebAgeglGtOHCwyOkla9KZHMkdEOVb0RCDldeW
 Lc+nC8AdLpuEBt9M3EzTa/k7Hb47M7gokTp/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCyuL8rj9y1A8bDYJ8Ok6fBVOndsrzjav6d8Lz8t4jk=;
 b=e2pFq1x2yPPuZn1ve2QAdXZl65ksYVVeev0O9CD/UPW0uu207W4bOSCh2ZNhbn3P6T
 y+CbOQxsPdGilV0zU24xXRxOBwZd6SrH5+D5Jbb6Dx7X4NOSOZSigqGH69PLNS7RahpJ
 kDSjWyoeDB+m2fo7zmTZH5aYC3gGuCVLWP9mnKoZETGgcboLsGtcnqFBamYaQwQ8Uypl
 dobtUTig+BLyroeuMLySsEWGB4rwweZtgYTj5lcsbJm4/ZShBQHunHRjbAgI8PCrTRP3
 c53kW5qVJPrnq76SJ1f1zDL/Wararx4op4WufDGUNheunyvCeJ4nHYY4F86v5yjstGqu
 xzvQ==
X-Gm-Message-State: AOAM533uisuzXYEhTQWL5XQJvp5Ac3R1GKCiVu/wuvOwT9dLXnv85T8E
 Oi9gtPuHYZXUoajFhBmajh7Y6NAjgZTc73C1T6w=
X-Google-Smtp-Source: ABdhPJya1M18CBF7DP0IaMvzRvqWs1ZQknQS2KXlRom+8Op79bVXXJtl3EZCPPX8Tq6isGWo5p1MvQ==
X-Received: by 2002:a17:90a:1944:b0:1d9:7cf8:5457 with SMTP id
 4-20020a17090a194400b001d97cf85457mr7232685pjh.112.1651620095171; 
 Tue, 03 May 2022 16:21:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:93ca:84cb:c452:c0a3])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090302cc00b0015e8d4eb2e2sm6872180plk.300.2022.05.03.16.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 16:21:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Document that power requirements for DP AUX transfers
Date: Tue,  3 May 2022 16:21:08 -0700
Message-Id: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When doing DP AUX transfers there are two actors that need to be
powered in order for the DP AUX transfer to work: the DP source and
the DP sync. Commit bacbab58f09d ("drm: Mention the power state
requirement on side-channel operations") added some documentation
saying that the DP source is required to power itself up (if needed)
to do AUX transfers. However, that commit doesn't talk anything about
the DP sink.

For full fledged DP the sink isn't really a problem. It's expected
that if an external DP monitor isn't plugged in that attempting to do
AUX transfers won't work. It's also expected that if a DP monitor is
plugged in (and thus asserting HPD) that it AUX transfers will work.

When we're looking at eDP, however, things are less obvious. Let's add
some documentation about expectations. Here's what we'll say:

1. We don't expect the DP AUX transfer function to power on an eDP
panel. If an eDP panel is physically connected but powered off then it
makes sense for the transfer to fail.

2. We'll document that the official way to power on a panel is via the
bridge chain, specifically by making sure that the panel's prepare
function has been called (which is called by
panel_bridge_pre_enable()). It's already specified in the kernel doc
of drm_panel_prepare() that this is the way to power the panel on and
also that after this call "it is possible to communicate with any
integrated circuitry via a command bus."

3. We'll also document that for code running in the panel driver
itself that it is legal for the panel driver to power itself up
however it wants (it doesn't need to officially call
drm_panel_pre_enable()) and then it can do AUX bus transfers. This is
currently the way that edp-panel works when it's running atop the DP
AUX bus.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/display/drm_dp_helper.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index dca40a045dd6..e5165b708a40 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -370,9 +370,17 @@ struct drm_dp_aux {
 	 * helpers assume this is the case.
 	 *
 	 * Also note that this callback can be called no matter the
-	 * state @dev is in. Drivers that need that device to be powered
-	 * to perform this operation will first need to make sure it's
-	 * been properly enabled.
+	 * state @dev is in and also no matter what state the panel is
+	 * in. It's expected:
+	 * - If the @dev providing the AUX bus is currently unpowered then
+	 *   it will power itself up for the transfer.
+	 * - If we're on eDP and the panel is not in a state where it can
+	 *   respond (it's not powered or it's in a low power state) then this
+	 *   function will return an error (but not crash). Note that if a
+	 *   panel driver is initiating a DP AUX transfer it may power itself
+	 *   up however it wants. All other code should ensure that the
+	 *   pre_enable() bridge chain (which eventually calls the panel
+	 *   prepare function) has powered the panel.
 	 */
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
-- 
2.36.0.464.gb9c8b46e94-goog

