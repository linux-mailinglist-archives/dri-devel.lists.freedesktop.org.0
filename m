Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNiFD7uTo2lpHQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:17:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F5C1CA170
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD56210E2E4;
	Sun,  1 Mar 2026 01:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h0Z2SKvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2AE10E2E3;
 Sun,  1 Mar 2026 01:17:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E87604443C;
 Sun,  1 Mar 2026 01:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002C8C19424;
 Sun,  1 Mar 2026 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772327863;
 bh=Gpp3g3wntO4Qc0y0xYsd/8EEdtn7INOVjn/nknEVZ/k=;
 h=From:To:Cc:Subject:Date:From;
 b=h0Z2SKvhaNxkRT9+hd1eb332niUyBcV4DXCK40ZEzP/dlldwW1yMcJjl1cHkOAqXc
 ftLNHgIXItjsV9KUuITFQApQarM3ri0G+Fn4Kl9999OtXpW5lyvloFKt8NhUwShn+r
 MdmOLw6/iPZNvkYFOxZi8FOr68zHEJrl+Ei4iOiqKjYTMvjrHFkCvtaDIyCsl6g3M+
 wZbUXRPHoBmpMZomA7IL8FZoeTXMYfFeQPclyAEMEC7SH0XlMRxDTvItywtfxxCLvV
 HNObVfEV08PsPy2azIwQZYCp4gzOGRw8AIgqR6L/Oti5dPlf0aENWv+T5cZFh8W2LG
 oE+N4huj9yFDg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	imre.deak@intel.com
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "drm/i915/dp: Fix pipe BPP clamping due to HDR" failed
 to apply to 6.18-stable tree
Date: Sat, 28 Feb 2026 20:17:41 -0500
Message-ID: <20260301011741.1671698-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,msgid.link:url]
X-Rspamd-Queue-Id: A1F5C1CA170
X-Rspamd-Action: no action

The patch below does not apply to the 6.18-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From fe26ae6ac8b88fcdac5036b557c129a17fe520d2 Mon Sep 17 00:00:00 2001
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 9 Feb 2026 15:38:16 +0200
Subject: [PATCH] drm/i915/dp: Fix pipe BPP clamping due to HDR

The pipe BPP value shouldn't be set outside of the source's / sink's
valid pipe BPP range, ensure this when increasing the minimum pipe BPP
value to 30 due to HDR.

While at it debug print if the HDR mode was requested for a connector by
setting the corresponding HDR connector property. This indicates
if the requested HDR mode could not be enabled, since the selected
pipe BPP is below 30, due to a sink capability or link BW limit.

v2:
- Also handle the case where the sink could support the target 30 BPP
  only in DSC mode due to a BW limit, but the sink doesn't support DSC
  or 30 BPP as a DSC input BPP. (Chaitanya)
- Debug print the connector's HDR mode in the link config dump, to
  indicate if a BPP >= 30 required by HDR couldn't be reached. (Ankit)
- Add Closes: trailer. (Ankit)
- Don't print the 30 BPP-outside of valid BPP range debug message if
  the min BPP is already > 30 (and so a target BPP >= 30 required
  for HDR is ensured).

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7052
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15503
Fixes: ba49a4643cf53 ("drm/i915/dp: Set min_bpp limit to 30 in HDR mode")
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: <stable@vger.kernel.org> # v6.18+
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com> # v1
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Link: https://patch.msgid.link/20260209133817.395823-1-imre.deak@intel.com
(cherry picked from commit 08b7ef16b6a03e8c966e286ee1ac608a6ffb3d4a)
Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7e022c47e8ac2..e9f1ee1eafae7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2665,6 +2665,7 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 			       bool dsc,
 			       struct link_config_limits *limits)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
 	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
@@ -2677,8 +2678,7 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 	limits->min_lane_count = intel_dp_min_lane_count(intel_dp);
 	limits->max_lane_count = intel_dp_max_lane_count(intel_dp);
 
-	limits->pipe.min_bpp = intel_dp_in_hdr_mode(conn_state) ? 30 :
-				intel_dp_min_bpp(crtc_state->output_format);
+	limits->pipe.min_bpp = intel_dp_min_bpp(crtc_state->output_format);
 	if (is_mst) {
 		/*
 		 * FIXME: If all the streams can't fit into the link with their
@@ -2694,6 +2694,19 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 							respect_downstream_limits);
 	}
 
+	if (!dsc && intel_dp_in_hdr_mode(conn_state)) {
+		if (intel_dp_supports_dsc(intel_dp, connector, crtc_state) &&
+		    limits->pipe.max_bpp >= 30)
+			limits->pipe.min_bpp = max(limits->pipe.min_bpp, 30);
+		else
+			drm_dbg_kms(display->drm,
+				    "[CONNECTOR:%d:%s] Can't force 30 bpp for HDR (pipe bpp: %d-%d DSC-support: %s)\n",
+				    connector->base.base.id, connector->base.name,
+				    limits->pipe.min_bpp, limits->pipe.max_bpp,
+				    str_yes_no(intel_dp_supports_dsc(intel_dp, connector,
+								     crtc_state)));
+	}
+
 	if (dsc && !intel_dp_dsc_compute_pipe_bpp_limits(connector, limits))
 		return false;
 
@@ -2825,10 +2838,11 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 	}
 
 	drm_dbg_kms(display->drm,
-		    "DP lane count %d clock %d bpp input %d compressed " FXP_Q4_FMT " link rate required %d available %d\n",
+		    "DP lane count %d clock %d bpp input %d compressed " FXP_Q4_FMT " HDR %s link rate required %d available %d\n",
 		    pipe_config->lane_count, pipe_config->port_clock,
 		    pipe_config->pipe_bpp,
 		    FXP_Q4_ARGS(pipe_config->dsc.compressed_bpp_x16),
+		    str_yes_no(intel_dp_in_hdr_mode(conn_state)),
 		    intel_dp_config_required_rate(pipe_config),
 		    intel_dp_max_link_data_rate(intel_dp,
 						pipe_config->port_clock,
-- 
2.51.0




