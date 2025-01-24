Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74613A1B47B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 12:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8616210E856;
	Fri, 24 Jan 2025 11:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CXlX64aK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E77510E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 11:14:34 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30737db1ab1so17874281fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737717273; x=1738322073; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KQumNHb0czdV26nphZSgSBzfVIc/sINg5yBNO6XQGak=;
 b=CXlX64aK1PJ/exTrnzwiYCyuW1A89/84PsfeSUZXn8AWR7ulmYU0lMiU2U48tydsPq
 XZpcoI6fZd8SjiRL0gdnqm4mVPXKA9KfrK02Mc6QPUaWwbAU6CMiQSe4z9BxCYwvd6Gs
 2Pc1BagxD1Z4J6AJYOYSL3Rk8dVqi3XYoumE5ySgbZzgmaeEMEmAaw2A2wHxXVz/dx/u
 KKwRjzotnPlJUOrOF37Hp88K1zkJ4ST5nb4axNrlYTDXQUn7U50yjCc4vEpSU+FMRnRP
 /NRRiV7+SDsP9RQtGj1QSo14HjyTIWU+R/sXnXR6WSkKuYF8gNkjgO3HN7yA28oUpD8V
 2cOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737717273; x=1738322073;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQumNHb0czdV26nphZSgSBzfVIc/sINg5yBNO6XQGak=;
 b=POIFT+y59ZxYjAZqmNw0f+qv6Cnh7MlttSfH5wm0dF5Zr8wZZ9y+4rTgo3IJohdrQ4
 mJNA8lu/3AChxw371xNWOx7/o/xeN+7d0Vo0ydJiZHrxTjKsPLe/XjT7VSymFYyMb7Dh
 zhhUGm12fLFzNvQD4Ti32QgY4yNN/itrkRzWRQ1XhcdjSTZiR2y7tQBWxRj8kidjYN6z
 twx+ULkVqOi+Me+KHN+sBwrc2c2kSrRpbEVfZ+nfG/HuMpesfELDSt462+l3a6sDzU4X
 xIp3bziO3UohzR/Sd7bb7wFM/4DlOxWQ2ugV9mjBS1l8oh2krah+1wniq6bua4YBuq8z
 MCDQ==
X-Gm-Message-State: AOJu0YxiuCllj3f+vEorX6QRHkmBNZ/zYFGSB8ogkC4ipyiMcZB5UBgO
 yRMbJA3XzQ/S1Qi45KscDXbWPVAkEvXLCZ88fM/twTWNvo24xp1RAYlOBNA9YBA=
X-Gm-Gg: ASbGncuPEwV1q2ZWdbsAIfP8xwUzex1W3x0XbrH99gAyey2dVDzfq7i3GBZye4L6jS0
 OH0PCiYoWTwZOGA24zbq3J1hc37ghWvUXR1Q0ArcyndCS+9hrrXBQtE+cOw+1ef2i7IDt1DGbOm
 VgFHaKkVTEZg6+RBMBmvjnsOTy9+jkBTkYf/WI89v68/t1MpvQG7bH+JSwkcza6XnLco5TkSRi1
 ig+6SU+3qxQPKkWYm/Kp+fILA9TD+WwzxpTqPSBZuIHarPfGRxGladXVcVoGIHW9ZwqtOMdoUf+
 zmasTSpRiMBs
X-Google-Smtp-Source: AGHT+IGY2wva+MkPCdRgK1/XNjI/82GaXQEwsVxES2OrmcmMYbeyl0REkjsBdSaqM3fqWG9eRyRhsw==
X-Received: by 2002:a05:651c:1611:b0:300:3778:4dbb with SMTP id
 38308e7fff4ca-3072ca60c5emr122341211fa.1.1737717272797; 
 Fri, 24 Jan 2025 03:14:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:14:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:19 +0200
Subject: [PATCH 1/6] drm/atomic-helper: add atomic_needs_modeset callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-1-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4R2TAjvRhPbl5nWb6SOSqQ5SIwkmWTVcXua85X57qZA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rkMpFJsYka4Z9WvN3MmWi9d9k0jT2adv2u66NZTtzdx
 d5gL1XbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJaKSx/0+1thHwuKvL9dnl
 NGtW2dNH9QzqLSIXYg5lB8uvOWL2+rlhg9nFLQ2hNs2cecLzM5NUl/J/0m0O5vcOE46d86Du/yG
 BP1e3+JoZrg4XTMw8tqnlk/XLut33DN91X93L67NXRZxB7bnvxCvW+8Scq1//tdLVvWUrpDR/72
 ujQpEJYQeMONOPLronJbxUtu8gk1jMNftvsS+dQu5PskyakdXSuyUx2/ls39XklafOl2QWXLRuP
 O+rlBrG3fw4bLmlNlPFLeMJ796t2jRr5r6dS24e8ZrwX4SPO9Hy5fauaE6+06UzXbzulss5mF8s
 cu06tGNq0nelhOkzNdQd9RjfcEXMbeWWt5SQmsQ5za8WAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Despite drm_atomic_helper_check_modeset() and drm_atomic_helper_check()
documenting that the function should be run again if atomic_check()
callback changes drm_crtc_state.mode_changed some drivers ignore it and
don't rerun the helpers. To simplify such drivers and remove the need to
rerun the helper functions provide additional set of callbacks,
atomic_needs_modeset(). These callbacks are executed at a proper time,
they return a boolean which signifies that corresponding CRTC should
undergo a full modeset. This way the atomic_check() callbacks can stop
updating the drm_crtc_state.mode_changed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 59 ++++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 92 ++++++++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 3034ba09c0ee5791ffd2f4130bd84b4cc4676fae..1f689ccd9b0d7f655c6a49e642d652b815a0e8e1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -649,6 +649,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *old_connector_state, *new_connector_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state, *old_plane_state;
 	int i, ret;
 	unsigned int connectors_mask = 0, user_connectors_mask = 0;
 
@@ -708,6 +710,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
 		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+		struct drm_encoder *encoder = new_connector_state->best_encoder;
+		const struct drm_encoder_helper_funcs *enc_funcs =
+			encoder ? encoder->helper_private : NULL;
 
 		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 
@@ -734,6 +739,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 				new_crtc_state->connectors_changed = true;
 		}
 
+		if ((funcs->atomic_needs_modeset &&
+		     funcs->atomic_needs_modeset(connector, state)) ||
+		    (enc_funcs && enc_funcs->atomic_needs_modeset &&
+		     enc_funcs->atomic_needs_modeset(encoder, state))) {
+			if (new_connector_state->crtc) {
+				new_crtc_state =
+					drm_atomic_get_new_crtc_state(state,
+								      new_connector_state->crtc);
+				new_crtc_state->mode_changed = true;
+			}
+
+			if (old_connector_state->crtc) {
+				new_crtc_state =
+					drm_atomic_get_new_crtc_state(state,
+								      old_connector_state->crtc);
+				new_crtc_state->mode_changed = true;
+			}
+		}
+
 		if (funcs->atomic_check)
 			ret = funcs->atomic_check(connector, state);
 		if (ret) {
@@ -746,6 +770,29 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		connectors_mask |= BIT(i);
 	}
 
+	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs;
+
+		funcs = plane->helper_private;
+		if (!funcs || !funcs->atomic_needs_modeset)
+			continue;
+
+		if (!funcs->atomic_needs_modeset(plane, state))
+			continue;
+
+		if (new_plane_state->crtc) {
+			new_crtc_state = drm_atomic_get_new_crtc_state(state,
+								       new_plane_state->crtc);
+			new_crtc_state->mode_changed = true;
+		}
+
+		if (old_plane_state->crtc) {
+			new_crtc_state = drm_atomic_get_new_crtc_state(state,
+								       old_plane_state->crtc);
+			new_crtc_state->mode_changed = true;
+		}
+	}
+
 	/*
 	 * After all the routing has been prepared we need to add in any
 	 * connector which is itself unchanged, but whose CRTC changes its
@@ -753,6 +800,18 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	 * crtc only changed its mode but has the same set of connectors.
 	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		if (!new_crtc_state->crtc)
+			continue;
+
+		funcs = crtc->helper_private;
+		if (!funcs || !funcs->atomic_needs_modeset)
+			continue;
+
+		if (funcs->atomic_needs_modeset(crtc, state))
+			new_crtc_state->mode_changed = true;
+
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index b62f41f489625e5177bdc05eef950e6c18c219fd..a83999109a49321536956c8b1b93fb4b0d0f7ce2 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -304,6 +304,29 @@ struct drm_crtc_helper_funcs {
 	 */
 	void (*disable)(struct drm_crtc *crtc);
 
+	/**
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the CRTC needs a
+	 * full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -800,6 +823,29 @@ struct drm_encoder_helper_funcs {
 	 */
 	void (*enable)(struct drm_encoder *encoder);
 
+	/*
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the connected
+	 * CRTC needs a full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_encoder *encoder,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -1067,6 +1113,29 @@ struct drm_connector_helper_funcs {
 	struct drm_encoder *(*atomic_best_encoder)(struct drm_connector *connector,
 						   struct drm_atomic_state *state);
 
+	/**
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the connected
+	 * CRTC needs a full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_connector *connector,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -1284,6 +1353,29 @@ struct drm_plane_helper_funcs {
 	 */
 	void (*end_fb_access)(struct drm_plane *plane, struct drm_plane_state *new_plane_state);
 
+	/**
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the connected
+	 * CRTC needs a full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_plane *plane,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *

-- 
2.39.5

