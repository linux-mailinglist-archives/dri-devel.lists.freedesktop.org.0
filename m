Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949125476A5
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 18:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D8910EAFA;
	Sat, 11 Jun 2022 16:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F3110EAFA
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 16:55:27 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id q140so1921469pgq.6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2zoTb5k5EV/NF02gzMw6UTCx2uR15xgLzy53hNpxo78=;
 b=VgDv7nn4q0/TTWEqYvRIch9uffEkgT/6W7sM+ndk4pwN9b7GzTpFq9HuDDGUmal2A0
 d2+D7jx090DtcDd/IuWHBJxCjj5hD71h+ZaclAl3jDtzqC0CICpuCMqlX5SSlR2EZZN+
 r9NWcCs1Yj95xStZDSO8gkkT0yvX2DIiiS0hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2zoTb5k5EV/NF02gzMw6UTCx2uR15xgLzy53hNpxo78=;
 b=yvp4hfLLRCUqx5r764+lRvXbVbWfEgY5MA3GnspE52XuWgeKJQu5m2WbCcYIrs5f7V
 Id236wRPzbOX5/wV/RhJXB7PLscBPCPyhqbi5+uTGgw91ZQGCGcVU0/WhJrmr+BSNv1S
 QE9gX4DInCqMbZ0nPBAhpz1IqMqhMhRn2cGWkxcQlMsnyhlCzTEXHaRoFdpV3txADEgZ
 Awz0GvaMh6/3xKVvOVXqeMlLTjICjeAvgAerbsG9z4zZgrf+MDeTCNd01WRxs6Kt/PqA
 TCr7SrRXgRRJKjWG1JUAzMvFVkorvOC7M/K1dERjzOSEjPYexHNDzmERPUcz5cS8G6Wj
 o4kQ==
X-Gm-Message-State: AOAM530Yd9OLHeSNUWqoRTdDIJYicGn/i8Ich0Fdfn9vRONgTYJVHD3/
 Em2aW38Gn3vmTkUazn7B1g3WWEhCr/U9OfCh0N8=
X-Google-Smtp-Source: ABdhPJxyOIJIVHsi9TiIYxc/i6gBtrPGAM+dWl536891vIHEVw5CCtAWjYJBtI28CFbRzjy/cjL4NQ==
X-Received: by 2002:a62:4e92:0:b0:520:6870:fc38 with SMTP id
 c140-20020a624e92000000b005206870fc38mr8415682pfb.8.1654966527300; 
 Sat, 11 Jun 2022 09:55:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:1400:c3e5:17df:f636])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170902654800b0015e8d4eb2ccsm1726604pln.278.2022.06.11.09.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 09:55:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm: Fix htmldocs indentation warning w/ DP AUX power
 requirements
Date: Sat, 11 Jun 2022 09:55:04 -0700
Message-Id: <20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two blank lines are needed to make the rst valid.

Fixes: 69ef4a192bba ("drm: Document the power requirements for DP AUX transfers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/display/drm_dp_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index dc3c02225fcf..c5f8f45511ed 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -372,8 +372,10 @@ struct drm_dp_aux {
 	 * Also note that this callback can be called no matter the
 	 * state @dev is in and also no matter what state the panel is
 	 * in. It's expected:
+	 *
 	 * - If the @dev providing the AUX bus is currently unpowered then
 	 *   it will power itself up for the transfer.
+	 *
 	 * - If we're on eDP (using a drm_panel) and the panel is not in a
 	 *   state where it can respond (it's not powered or it's in a
 	 *   low power state) then this function may return an error, but
-- 
2.36.1.476.g0c4daa206d-goog

