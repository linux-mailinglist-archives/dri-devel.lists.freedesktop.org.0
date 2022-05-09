Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C5520848
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 01:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05F710E297;
	Mon,  9 May 2022 23:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286B510E297
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 23:18:34 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so654547pjh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 16:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3MsMPfbPAtt+LUx5QQOJPDQW/jqUKRczHTmbnCnNlo=;
 b=Lo3FcdLeWFTsfpLIEtHet1p83g9yEAUTRFUUlVA9jNybAnhR0ACD66qvwx/Sni7Xvr
 KOJFXQJJ8qK8OXYOYI4LF9vvQDnot8Nf0A1g/XQ2GznnKufeBlILgR3GcQlp7RGJ0Ebk
 clgZZ1EnekJLzRptH/+bl1z/QggljRTkX5di4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S3MsMPfbPAtt+LUx5QQOJPDQW/jqUKRczHTmbnCnNlo=;
 b=oEN2jlcEOtZ6UzCKPmY7gOxcevaHWfy5Ly+u670rZFjD9c9/TGBeRT4PmB0xnT728V
 uwFqKmkrPZ45k3CClSbmAtTonpg6hsAjW5iwIAOjOp+/mISpfvbesIn49m1GW+4GYIK+
 bmyIjbOjwFxDC9IrMlWCdtCtDRbM2fz0am65Buq3qdp/wMSwOX9uAhyXLPHnpR6WFj0a
 GkyHPbU6n8JnV22uXC3wYb7W3Aio7YCw4rLozKnKrIfAM361TPlydlaFIfDQX/Eb+nYI
 Uftoz0/sgD+cysP/lOPzJwP/dLJz49D2vLZfTZJEXgfWRViLYMEkp61SmfTgKdewgrrL
 Y2hg==
X-Gm-Message-State: AOAM530XbIbbSym7ONgICn/FmqcB2hgbDDy7iiJK4puQFPh/DtZ+ra5u
 1rPWnYqWJ92DLtOxS9CRCqAKxKI24c2BMWcGb9I=
X-Google-Smtp-Source: ABdhPJwQCABxWhyzWje58moI3QY+RTSGkK5L/8OY0DPvxKxKjVGkEKQ2u55xzo2aEXZeNm94nOeQKw==
X-Received: by 2002:a17:902:f708:b0:153:839f:bf2c with SMTP id
 h8-20020a170902f70800b00153839fbf2cmr18252580plo.113.1652138313471; 
 Mon, 09 May 2022 16:18:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:e0c:1ed:8d0b:2894])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a170902edcd00b0015ed003552fsm371045plk.293.2022.05.09.16.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 16:18:33 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: Document the power requirements for DP AUX transfers
Date: Mon,  9 May 2022 16:18:09 -0700
Message-Id: <20220509161733.v2.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Kees Cook <keescook@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When doing DP AUX transfers there are two actors that need to be
powered in order for the DP AUX transfer to work: the DP source and
the DP sink. Commit bacbab58f09d ("drm: Mention the power state
requirement on side-channel operations") added some documentation
saying that the DP source is required to power itself up (if needed)
to do AUX transfers. However, that commit doesn't talk anything about
the DP sink.

For full fledged DP the sink isn't really a problem. It's expected
that if an external DP monitor isn't plugged in that attempting to do
AUX transfers won't work. It's also expected that if a DP monitor is
plugged in (and thus asserting HPD) then AUX transfers will work.

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

NOTE: there was much discussion of all of this in response to v1 [1]
of this patch. A summary of that is:
* With the Intel i195 driver, apparently eDP panels do get powered
  up. We won't forbid this but it is expected that code that wants to
  run on a variety of platforms should ensure that the drm_panel's
  prepare() function has been called.
* There is at least a reasonable amount of agreement that the
  transfer() functions itself shouldn't be responsible for powering
  the panel. It's proposed that if we need the DP AUX dev nodes to be
  robust for eDP that the code handling the DP AUX dev nodes could
  handle powering the panel by ensuring that the panel's prepare()
  call was made. Potentially drm_dp_aux_dev_get_by_minor() could be a
  good place to do this. This is left as a future exercise. Until
  that's fixed the DP AUX dev nodes for eDP are probably best just
  used for debugging.
* If a panel could be in PSR and DP AUX via the dev node needs to be
  reliable then we need to be able to pull the panel out of PSR. On
  i915 this is also apparently handled as part of the transfer()
  function.

[1] https://lore.kernel.org/r/20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
Hopefully I've resolved everything here to everyone's
satisfaction. There's no crazy hurry here. I'll give this a week or so
and then land it on drm-misc if there is no additional discussion.

Changes in v2:
- Updated wording as per discussion on v1.
- Updated commit message as per discussion on v1.
- Add pointer to v1 discussion for future reference.

 include/drm/display/drm_dp_helper.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index dca40a045dd6..dc3c02225fcf 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -370,9 +370,19 @@ struct drm_dp_aux {
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
+	 * - If we're on eDP (using a drm_panel) and the panel is not in a
+	 *   state where it can respond (it's not powered or it's in a
+	 *   low power state) then this function may return an error, but
+	 *   not crash. It's up to the caller of this code to make sure that
+	 *   the panel is powered on if getting an error back is not OK. If a
+	 *   drm_panel driver is initiating a DP AUX transfer it may power
+	 *   itself up however it wants. All other code should ensure that
+	 *   the pre_enable() bridge chain (which eventually calls the
+	 *   drm_panel prepare function) has powered the panel.
 	 */
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
-- 
2.36.0.512.ge40c2bad7a-goog

