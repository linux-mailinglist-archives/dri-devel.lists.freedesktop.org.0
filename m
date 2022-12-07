Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AAE645E65
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0F210E3E6;
	Wed,  7 Dec 2022 16:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40B310E3D9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 57F075C00A6;
 Wed,  7 Dec 2022 11:09:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Dec 2022 11:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1670429350; x=
 1670515750; bh=px2+MbhbeI+jrnsZ/vqUEifAPSMXpR4NGEBEX3i+hsw=; b=Y
 CaxLUsx7sbkNkpYxwbVV5dtH3TbJG0pr0L1judfcJdwMCQJzJCnZiIavSMV0g7Ks
 YyF0gdwyjwrG8q2N12xJsmPVQokQJsajMUdflALXTZKRVAnyeFpcGV2SCDnoFvEq
 V79ab1iMFu0eCrT6zMrjypZoNueZBiBvenCg7nmpEClMlFr/BmbujZxd8E3VnC3x
 u3Dn0QB5/qszbtHKgTdimHbu2gbvoNKcibQV9UMz6OigNVMxIrswoqqXyLBRqJ2h
 vaKQWFvb7Z3XIXoYVYeGTTnzM6rFfhw1XTCEd3NM1j0wEGxOh0+sKJGwuZxHKuAV
 NIa+wcCDnwzADN9rZQ0LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1670429350; x=
 1670515750; bh=px2+MbhbeI+jrnsZ/vqUEifAPSMXpR4NGEBEX3i+hsw=; b=l
 anFwiR4bWUyMdKHuFjfIMQCTitktsAklfKzRoMPcyJXuMmRlc7VZKWoKmTiPGQB+
 dLSNYHA38TqvPt7u1jFmf7hWoASTn0ndYdI5GdGSwLA8F8wNiuzWEI5Q56Rh/f8O
 8xvGrVJZYncHbJJFZcCso28KaXesRnt24L1lzCs4579Znz1RG/2XzghORO0cJee9
 FMJIuJrclpggKINshV+qLTfYNKYOedP/miEgzm9G+ocvnxii9cUgqUBs130ifRuN
 gCVoVq3BxWRXZWpK6dNOBRgyXAAXdgMyCsRhvbbCiXXRiOOZD1I6pxHXvGxYr8d+
 fhsjsSZXDHWVlBpoP1qBA==
X-ME-Sender: <xms:prqQY-zk18ih-Jl0BxGj8OV50gA5djEjNR7iNaB8Rc-ZGrFJNVApVg>
 <xme:prqQY6ScHnWUEdwRtAwB2YSP5GikB-P74ArYHuqLy5yxLt3T8aYGtSEi-MJ9jInMg
 6aXmSqrQoA6A9tQB74>
X-ME-Received: <xmr:prqQYwViVPXrcZni0pnyNkTrjew4Ag5q_y711CxYwvxY1xqR21qu4TtnKkGOwmLNPPYAqmCR6yoK7LJsD6VPKpbAWO-nMoiTt2uS8cmZniYdxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevvdelieejgedvkeffheekheeilefhgefgffehteekueelvddtueffheet
 ledtffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:prqQY0imfTyDtG9wRyhIlVIGanSaQEy0giwSys4NiI0A4WuDpi_tgw>
 <xmx:prqQYwBBiJt4tapmIYS6NogJ5nLPfPovHvcSmvutwtiWoOo89vxYwg>
 <xmx:prqQY1JJUBCHz9WBmnk66eyTwMx5kbU-T_4DZLm7-q6rb5mgRCeBow>
 <xmx:prqQY4bdVg50Duvc-gFYpFCPuC4mRjNoL0NlyNBlPmf3N7G4174Liw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:46 +0100
Subject: [PATCH 2/9] drm/vc4: hdmi: Constify container_of wrappers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221207-rpi-hdmi-improvements-v1-2-6b15f774c13a@cerno.tech>
References: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
In-Reply-To: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=dCH6llKR5UwxqNbbxar32+yc+y4RRk/F+4gf1CbtXyE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgV1SruruN33CH23+ET6vpLqMvtVofxOG6dtXczKW7FN
 Uq+to5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMRVWVkeCSoY/rAvPPKJk29p7d+3h
 VrrQ38mDPROPXpxY9ma43PTGD47zP35PuuwqorzNf7lJSuTX4YvHnBq8u/rnI3RcTFq1+dzgEA
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

None of our wrappers around container_of to access our objects from the
DRM object pointer actually modify the latter.

Let's make them const.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index dc3ccd8002a0..023ea64ef006 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -224,13 +224,13 @@ struct vc4_hdmi {
 };
 
 static inline struct vc4_hdmi *
-connector_to_vc4_hdmi(struct drm_connector *connector)
+connector_to_vc4_hdmi(const struct drm_connector *connector)
 {
 	return container_of(connector, struct vc4_hdmi, connector);
 }
 
 static inline struct vc4_hdmi *
-encoder_to_vc4_hdmi(struct drm_encoder *encoder)
+encoder_to_vc4_hdmi(const struct drm_encoder *encoder)
 {
 	struct vc4_encoder *_encoder = to_vc4_encoder(encoder);
 	return container_of(_encoder, struct vc4_hdmi, encoder);
@@ -244,7 +244,7 @@ struct vc4_hdmi_connector_state {
 };
 
 static inline struct vc4_hdmi_connector_state *
-conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
+conn_state_to_vc4_hdmi_conn_state(const struct drm_connector_state *conn_state)
 {
 	return container_of(conn_state, struct vc4_hdmi_connector_state, base);
 }

-- 
2.38.1
