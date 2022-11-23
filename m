Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049906363A3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB67A10E58B;
	Wed, 23 Nov 2022 15:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3010E585
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:29:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 871582B069B3;
 Wed, 23 Nov 2022 10:29:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Nov 2022 10:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669217365; x=
 1669224565; bh=XIe9ChVfep79HIV2ztecYqwJ5irN+RhpQRjGxmM94Pc=; b=S
 VQquPBRuWvd4mdEaUBj4qKYsAhzixCxJ768IZ0NPKxLqB/R04wQtbJle9k+HICsF
 AOOEOWMfoBmRp7Uo09GuF4EwQyrqWgDYIL4JDE/vhWqDcqnh+C7iDzbHGtp+eh3E
 +11/CeYAXwKqESPI9NOybRtKREBgF87jVlbNBWnCbrpvQSpGphheeRynYIdqKqmW
 t205l8OJZscjKMRFsvGXU8DsTm/45d1fxyrhjpY87EBpDKM8Z9gr+WcIxVnMAPeJ
 1Sazl2xRGsk8PTtAxuZ5zgqdLmJvJP3b3Xp96I9h5T+eEfsmjc4Nzgk7CfZxEW+2
 ssCCnEP/Eute1Suj0CMSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669217365; x=
 1669224565; bh=XIe9ChVfep79HIV2ztecYqwJ5irN+RhpQRjGxmM94Pc=; b=s
 GWy1G6SzQM5g89M7IJDS6PjQR2QWprsk8FxAMrNPqvwJAxcFwdyP+yj7QFQGR4wh
 017qxGxUmYAXhGjK12ow61CE+NK9hCSsawLLah2VnVpVZxnHR9iv5Au932NUB+xM
 VesdzFWjnIQ/omplnu6lBSgLfVLg3QLxsfna9D2y0V9KEtgZ90ZzLLcyEe296A9a
 jLw+Vy5f7prFzbrA7o1pQKucyWz+sDok8HYOQl0hkJ4NNl9KHR/NCITbYEjJEtJK
 ArhHpXPBAW2WSKpfSZGJsfLoxoAKmPOqsDD7ljMVrR5yQcw0lKwwsPBkYrz5F3zP
 4OWCQgQDNg9zljhGLb4Dg==
X-ME-Sender: <xms:VDx-Y5jUk-WIfa37ZD0QIxwULAPKKc2oHd3ky4SsIas8ionuBvwAHw>
 <xme:VDx-Y-AwCKWNPfNb9Gwcp3Oz-Q9c6wch1HOJEQjopYT6xo05qNIN17MovcQvrIgR4
 D2ElqvK1g5E1wgfwdY>
X-ME-Received: <xmr:VDx-Y5FnRuYKTHYI90L8_aFItvYnPU63crr8i3C_K58wL83HbTiDGBuSDAbFZkiF9_jkYR7rYwBVC4K7xNXJ8CQB0XEfmtsIYiY0Ys7AmXohqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VTx-Y-TKlcl6Vqiv1zp1yFuuHSsBONKs-b4e53-as01Fqy4ZVSocyQ>
 <xmx:VTx-Y2z_g2fADDt_EXt48rCvSBMzZ_vOl22Noaek05JPqcEUKBX-Vw>
 <xmx:VTx-Y05lJUsq9V24wLFk705usTp-y8dapKFAp57eGjQG5jaLLvR-4w>
 <xmx:VTx-Y3Sfb4dUcyqgGTXXVGTQZF_0nqeUKfy4ufa_iC8FZuLZoGUBbpHgTlM>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Nov 2022 10:29:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 23 Nov 2022 16:25:52 +0100
Subject: [PATCH 10/24] drm/vc4: kms: Sort the CRTCs by output before assigning
 them
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221123-rpi-kunit-tests-v1-10-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.11.0-dev-d416f
X-Developer-Signature: v=1; a=openpgp-sha256; l=7049; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Fhc9v1EUxdUe1v6nXkVnFJ5g1bTC5p8FGgV6Ra3SZus=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMl11tXLWl87LP3bPlXwcKeYndO9otbaygNrTKxNwlLev+P4
 OT+vo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPZZMXw36+gdD7v8UbPpyXJXwLOvD
 21ZJVEpluWxuNb+w6Uaiu3rWZkuCR0Z41bouVRvuave94Ef5HUOXln2WqrqDK3W0/qj/m3MgEA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Maíra Canal <mairacanal@riseup.net>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the vc4 devices (and later), the blending is done by a single device
called the HVS. The HVS has three FIFO that can operate in parallel, and
route their output to 6 CRTCs and 7 encoders on the BCM2711.

Each of these CRTCs and encoders have some contraints on which FIFO they
can feed from, so we need some code to take all those constraints into
account and assign FIFOs to CRTCs.

The problem can be simplified by assigning those FIFOs to CRTCs by
ascending output index number. We had a comment mentioning it already,
but we were never actually enforcing it.

It was working still in most situations because the probe order is
roughly equivalent, except for the (optional, and fairly rarely used on
the Pi4) VEC which was last in the probe order sequence, but one of the
earliest device to assign.

This resulted in configurations that were rejected by our code but were
still valid with a different assignment.

We can fix this by making sure we assign CRTCs to FIFOs by ordering
them by ascending HVS output index.

Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 109 +++++++++++++++++++++++++++++-------------
 1 file changed, 76 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 5c97642ed66a..17a28f9a2f31 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/sort.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -776,6 +777,20 @@ static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
 	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
 }
 
+static int cmp_vc4_crtc_hvs_output(const void *a, const void *b)
+{
+	const struct vc4_crtc *crtc_a =
+		to_vc4_crtc(*(const struct drm_crtc **)a);
+	const struct vc4_crtc_data *data_a =
+		vc4_crtc_to_vc4_crtc_data(crtc_a);
+	const struct vc4_crtc *crtc_b =
+		to_vc4_crtc(*(const struct drm_crtc **)b);
+	const struct vc4_crtc_data *data_b =
+		vc4_crtc_to_vc4_crtc_data(crtc_b);
+
+	return data_a->hvs_output - data_b->hvs_output;
+}
+
 /*
  * The BCM2711 HVS has up to 7 outputs connected to the pixelvalves and
  * the TXP (and therefore all the CRTCs found on that platform).
@@ -810,10 +825,11 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 				      struct drm_atomic_state *state)
 {
 	struct vc4_hvs_state *hvs_new_state;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc **sorted_crtcs;
 	struct drm_crtc *crtc;
 	unsigned int unassigned_channels = 0;
 	unsigned int i;
+	int ret;
 
 	hvs_new_state = vc4_hvs_get_global_state(state);
 	if (IS_ERR(hvs_new_state))
@@ -823,15 +839,59 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		if (!hvs_new_state->fifo_state[i].in_use)
 			unassigned_channels |= BIT(i);
 
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
-		struct vc4_crtc_state *old_vc4_crtc_state =
-			to_vc4_crtc_state(old_crtc_state);
-		struct vc4_crtc_state *new_vc4_crtc_state =
-			to_vc4_crtc_state(new_crtc_state);
-		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	/*
+	 * The problem we have to solve here is that we have up to 7
+	 * encoders, connected to up to 6 CRTCs.
+	 *
+	 * Those CRTCs, depending on the instance, can be routed to 1, 2
+	 * or 3 HVS FIFOs, and we need to set the change the muxing
+	 * between FIFOs and outputs in the HVS accordingly.
+	 *
+	 * It would be pretty hard to come up with an algorithm that
+	 * would generically solve this. However, the current routing
+	 * trees we support allow us to simplify a bit the problem.
+	 *
+	 * Indeed, with the current supported layouts, if we try to
+	 * assign in the ascending crtc index order the FIFOs, we can't
+	 * fall into the situation where an earlier CRTC that had
+	 * multiple routes is assigned one that was the only option for
+	 * a later CRTC.
+	 *
+	 * If the layout changes and doesn't give us that in the future,
+	 * we will need to have something smarter, but it works so far.
+	 */
+	sorted_crtcs = kmalloc_array(dev->num_crtcs, sizeof(*sorted_crtcs), GFP_KERNEL);
+	if (!sorted_crtcs)
+		return -ENOMEM;
+
+	i = 0;
+	drm_for_each_crtc(crtc, dev)
+		sorted_crtcs[i++] = crtc;
+
+	sort(sorted_crtcs, i, sizeof(*sorted_crtcs), cmp_vc4_crtc_hvs_output, NULL);
+
+	for (i = 0; i < dev->num_crtcs; i++) {
+		struct vc4_crtc_state *old_vc4_crtc_state, *new_vc4_crtc_state;
+		struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+		struct vc4_crtc *vc4_crtc;
 		unsigned int matching_channels;
 		unsigned int channel;
 
+		crtc = sorted_crtcs[i];
+		if (!crtc)
+			continue;
+		vc4_crtc = to_vc4_crtc(crtc);
+
+		old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
+		if (!old_crtc_state)
+			continue;
+		old_vc4_crtc_state = to_vc4_crtc_state(old_crtc_state);
+
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+		if (!new_crtc_state)
+			continue;
+		new_vc4_crtc_state = to_vc4_crtc_state(new_crtc_state);
+
 		drm_dbg(dev, "%s: Trying to find a channel.\n", crtc->name);
 
 		/* Nothing to do here, let's skip it */
@@ -860,33 +920,11 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 			continue;
 		}
 
-		/*
-		 * The problem we have to solve here is that we have
-		 * up to 7 encoders, connected to up to 6 CRTCs.
-		 *
-		 * Those CRTCs, depending on the instance, can be
-		 * routed to 1, 2 or 3 HVS FIFOs, and we need to set
-		 * the change the muxing between FIFOs and outputs in
-		 * the HVS accordingly.
-		 *
-		 * It would be pretty hard to come up with an
-		 * algorithm that would generically solve
-		 * this. However, the current routing trees we support
-		 * allow us to simplify a bit the problem.
-		 *
-		 * Indeed, with the current supported layouts, if we
-		 * try to assign in the ascending crtc index order the
-		 * FIFOs, we can't fall into the situation where an
-		 * earlier CRTC that had multiple routes is assigned
-		 * one that was the only option for a later CRTC.
-		 *
-		 * If the layout changes and doesn't give us that in
-		 * the future, we will need to have something smarter,
-		 * but it works so far.
-		 */
 		matching_channels = unassigned_channels & vc4_crtc->data->hvs_available_channels;
-		if (!matching_channels)
-			return -EINVAL;
+		if (!matching_channels) {
+			ret = -EINVAL;
+			goto err_free_crtc_array;
+		}
 
 		channel = ffs(matching_channels) - 1;
 
@@ -896,7 +934,12 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
 		hvs_new_state->fifo_state[channel].in_use = true;
 	}
 
+	kfree(sorted_crtcs);
 	return 0;
+
+err_free_crtc_array:
+	kfree(sorted_crtcs);
+	return ret;
 }
 
 static int

-- 
2.38.1-b4-0.11.0-dev-d416f
