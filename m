Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2395135C3F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 16:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99FD26E90B;
	Thu,  9 Jan 2020 15:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A58A6E90A;
 Thu,  9 Jan 2020 15:08:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so7823483wrq.0;
 Thu, 09 Jan 2020 07:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZNyRnDs4bQ5oS08SnnyfCTZUacXX/gkDZwvZvxgTJm8=;
 b=tsAP34sf6QIJK3BWzSNw4rT5N+w/yGMS2weA5O2LbB4jd4p9c92Axv/mxz146oCxWl
 2+A2RDYaX6yfpLN4Nt60x+L5WWZO8fIDjFGhPe9+0LaYi1HLSj7/Oi+9NNm7hPILgiRl
 JsjLnVkv9/udi7piXl3ShyM7qmRsSksJqN2uqmESBpzNWWTzpDTYGLm0+Df1WIwv76gm
 dXooxq2AS2KaftowLBAUM5HhuirCZdPtbxmf9Gw5Hyr3S4oEWFnFKTNWBh+93y+g2ict
 PiiRZhV9fD5gEzO4jdu+GF2WpvY0vOdc3OMvK8saTO0KpNu7iW/DuAP5r/gClTja8Bh8
 RVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZNyRnDs4bQ5oS08SnnyfCTZUacXX/gkDZwvZvxgTJm8=;
 b=cdC1zuovn2Uf1X4DwFYtG1Ss0R54+SKG9BJVvXEywB+HP6YfrQJ9J4feh5SLR6ZgUJ
 tJg/UmoVS40ecSNYQWIzuSrWm9ztzFNwnEdU05aEDkQxCltHwxFg/iskI45bmzuyyb1a
 xm1w6EFZLr2lvFLpp0wUtmWTNqAZdVvnOpG4DBmqL8CfH/DeOqXEBL3pUoqxLDkFoQEs
 3DA77gFcUTgwWtFJMHmpb1oDHyWMYakT9RELoGIFHMw5jKiYy6k+RTqODf+p2NYxX6IP
 Nb28ILiORBgiFGRkaoNQ6k7Q9LZaYtvMOeP5yFdRcZnSP5p6NTD3aBUbjPyxDvlkG1Di
 ttEg==
X-Gm-Message-State: APjAAAVYB6nhrH9MwCjM1KOtHv7D7hAR2Ddkl+UtYbPueumSZg0RfPVA
 E569CHoMwHkQ5qhgoMd7NukTeRF+
X-Google-Smtp-Source: APXvYqxNH30xrIaZAixCSKPVq93fROfPzPkHL6bEtQ8pbrV6+vhxrZhZpwr/EkVe+ssohu68OXPgDQ==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr11959956wro.105.1578582482609; 
 Thu, 09 Jan 2020 07:08:02 -0800 (PST)
Received: from twisty.localdomain ([2a01:c23:7c40:600:59fe:915f:cac1:6580])
 by smtp.gmail.com with ESMTPSA id k8sm8265886wrl.3.2020.01.09.07.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 07:08:02 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/dp: Add current maximum eDP link rate to sink_rate
 array.
Date: Thu,  9 Jan 2020 16:07:52 +0100
Message-Id: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: mario.kleiner.de@gmail.de, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the current eDP link rate, as read from hw, provides a
higher bandwidth than the standard link rates, then add the
current link rate to the link_rates array for consideration
in future mode-sets.

These initial current eDP link settings have been set up by
firmware during boot, so they should work on the eDP panel.
Therefore use them if the firmware thinks they are good and
they provide higher link bandwidth, e.g., to enable higher
resolutions / color depths.

This fixes a problem found on the MacBookPro 2017 Retina panel:

The panel reports 10 bpc color depth in its EDID, and the UEFI
firmware chooses link settings at boot which support enough
bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
so intel_dp_set_sink_rates() would cap at that. This restricts
achievable color depth to 8 bpc, not providing the full color
depth of the panel. With this commit, we can use firmware setting
and get the full 10 bpc advertised by the Retina panel.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2f31d226c6eb..aa3e0b5108c6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv =
 		to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
+	int max_rate;
+	u8 link_bw;
 
 	/* this function is meant to be called only once */
 	WARN_ON(intel_dp->dpcd[DP_DPCD_REV] != 0);
@@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
 	else
 		intel_dp_set_sink_rates(intel_dp);
 
+	/*
+	 * If the firmware programmed a rate higher than the standard sink rates
+	 * during boot, then add that rate as a valid sink rate, as fw knows
+	 * this is a good rate and we get extra bandwidth.
+	 *
+	 * Helps, e.g., on the Apple MacBookPro 2017 Retina panel, which is only
+	 * eDP 1.1, but supports the unusual rate of 324000 kHz at bootup, for
+	 * 10 bpc / 30 bit color depth.
+	 */
+	if (!intel_dp->use_rate_select &&
+	    (drm_dp_dpcd_read(&intel_dp->aux, DP_LINK_BW_SET, &link_bw, 1) == 1) &&
+	    (link_bw > 0) && (intel_dp->num_sink_rates < DP_MAX_SUPPORTED_RATES)) {
+		max_rate = drm_dp_bw_code_to_link_rate(link_bw);
+		if (max_rate > intel_dp->sink_rates[intel_dp->num_sink_rates - 1]) {
+			intel_dp->sink_rates[intel_dp->num_sink_rates] = max_rate;
+			intel_dp->num_sink_rates++;
+			DRM_DEBUG_KMS("Adding max bandwidth eDP rate %d kHz.\n",
+				      max_rate);
+		}
+	}
+
 	intel_dp_set_common_rates(intel_dp);
 
 	/* Read the eDP DSC DPCD registers */
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
