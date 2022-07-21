Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452357D6D8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 00:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791F514A5B8;
	Thu, 21 Jul 2022 22:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8595A14AA4D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 22:24:03 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id y9so2961903pff.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 15:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=deNvbs3qYKL1JRrzER9SspNMUOrIoxIui7ZX5V+JLIY=;
 b=e5rJiANtFt5gfhuP8SpDzFLRuphuqpFoj6Lu7gZl+xJY9yml8Aqdg46TPEZl5GBmas
 dX0+EQBxvL1vBjAZaUkJNovqgRUTPlICeTOTSR9IVyqIf7rzg+tk8e70egqb0AHpSj2C
 Bye7taMr00CtAqIfvlf+r0c4XN9cnckKaj0J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=deNvbs3qYKL1JRrzER9SspNMUOrIoxIui7ZX5V+JLIY=;
 b=FBAhI3r/UfYlmhPvzSIRur8lDwxuLBq0wjOr7bXLo26JkEkceaIdREmZdgtEmO+CI/
 sZrNUkpFLT/lGjkfKQPs5g2Fhsv1qeDc7Fd70e/SwbNN2l17sFV76ODuTX2/W6g/Dm1H
 D/Fc5n1febzDQJwvCz4Oxcv1nLcRZR5u6SOM1wtwUSl9zlYTweRSw4BydD0Jc2197mOC
 XGj/zs5qD3QU+nSZJPverxT87JAoDyN7j8F4IkXjW6ujHxgrbs0hCccmYXpxiiLEgah3
 4T9VoOFOpIDp9OSYq/eFeUxeBB2aryC61KpDZUdxdifIwOQB4abcQQdIJtIhxhN4KURD
 awhw==
X-Gm-Message-State: AJIora/CiKcm8i3iCWrfd2r1vY7kJkUD6GhMucpeiAHK4bsAXcuUxYBP
 01fAl5tZeUXzadxAuFJ7H8r5gLFIQDJQAmqE1go=
X-Google-Smtp-Source: AGRyM1ucmGbzlsf5miZykSaJZXCq20zaDUKzLsPufJXzF3FOBiGnHuUiUhGGwYQQmz3a3+Q96KwlRA==
X-Received: by 2002:a65:58cb:0:b0:415:ea6a:c535 with SMTP id
 e11-20020a6558cb000000b00415ea6ac535mr486685pgu.100.1658442242856; 
 Thu, 21 Jul 2022 15:24:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:29c7:7a23:197d:913d])
 by smtp.gmail.com with ESMTPSA id
 y189-20020a6264c6000000b0052594a3ba89sm2248779pfb.65.2022.07.21.15.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 15:24:02 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/edid: Make 144 Hz not preferred on Sharp LQ140M1JW46
Date: Thu, 21 Jul 2022 15:23:40 -0700
Message-Id: <20220721152314.RFC.1.Ie333b3e4aff6e4a5b58c4aa805e030e561be8773@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
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
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sharp LQ140M1JW46 panel is on the Qualcomm sc7280 CRD reference
board. This panel supports 144 Hz and 60 Hz. In the EDID, the 144 Hz
mode is listed first and thus is marked preferred. The EDID decode I
ran says:

  First detailed timing includes the native pixel format and preferred
  refresh rate.

  ...

  Detailed Timing Descriptors:
    DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz
                 Hfront   48 Hsync  32 Hback  80 Hpol N
                 Vfront    3 Vsync   5 Vback  69 Vpol N
    DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz
                 Hfront   48 Hsync  32 Hback  80 Hpol N
                 Vfront    3 Vsync   5 Vback  69 Vpol N

I'm proposing here that the above is actually a bug and that the 60 Hz
mode really should be considered preferred by Linux.

The argument here is that this is a laptop panel and on a laptop we
know power will always be a concern. Presumably even if someone using
this panel wanted to use 144 Hz for some use cases they would only do
so dynamically and would still want the default to be 60 Hz.

Let's change the default to 60 Hz using a standard quirk.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bbc25e3b7220..06ff8ba216af 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -160,6 +160,9 @@ static const struct edid_quirk {
 	EDID_QUIRK('S', 'A', 'M', 596, EDID_QUIRK_PREFER_LARGE_60),
 	EDID_QUIRK('S', 'A', 'M', 638, EDID_QUIRK_PREFER_LARGE_60),
 
+	/* 144 Hz should only be used when needed; it wastes power */
+	EDID_QUIRK('S', 'H', 'P', 0x1523, EDID_QUIRK_PREFER_LARGE_60),
+
 	/* Sony PVM-2541A does up to 12 bpc, but only reports max 8 bpc */
 	EDID_QUIRK('S', 'N', 'Y', 0x2541, EDID_QUIRK_FORCE_12BPC),
 
-- 
2.37.1.359.gd136c6c3e2-goog

