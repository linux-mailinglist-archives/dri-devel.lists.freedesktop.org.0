Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2C67E9B6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8DB10E16E;
	Fri, 27 Jan 2023 15:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D645110E16E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:41:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 51AEB3200488;
 Fri, 27 Jan 2023 10:40:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Jan 2023 10:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1674834055; x=1674920455; bh=jsatUeV5/0oLfTkS9GeGuCrs7
 S982tAG2mwccT2mwfQ=; b=Osycq7W0Td3wIjtn7/1SD5k5sZTQIt3X2yq0gIXtZ
 /wnDUfIb0yvHrFImXKbvW6rwcFIfYz9elJLTaqXLwZAEDgWRfUvocKxKCD9AQ65Z
 03pk2PcQ6BkRTz4BXv5GyX6Xo5rWFtn22C3X+STI3zn9UiY5Vhh+Lwcdl5R6oQj+
 Wlo8iaC2Cm9tPVqzp4Ly7h+Efc+Hv19R2ZEiCaRY+J+RiQcK7ZjtnVYd3tFgxPO8
 9QPCVENPPvwsUHZqwki04wqiai1XtE+LWbNDt+JY6/4uxRIxbcBnlURFZ7ChqnUE
 aylvFOCUcSrW3ALVjSIujIu9HA6n86PD04Qiqpwt55DYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1674834055; x=1674920455; bh=jsatUeV5/0oLfTkS9GeGuCrs7S982tAG2mw
 ccT2mwfQ=; b=D/6izsJPDpGbQe8pDe1ve952TszFfdFWAmwZM7R2EVZG7XC7Q5Z
 eB8syiNQu3RFzcPi2GaxRNhJjxd/X01Qm8H8wrZN05WgylKrqA8Hp9otk8CYcsff
 DBzk+ie9uWi10fhrZHE7D/RaKo37r8R+t2iq92ynKrMM6yRGDcUIQIEujaEcBPAk
 qrNt8qNMCcJETWhkvzdwKAz5D/pgDQ3qNAbtwRLxPRCHNJmSDi5RyiL0vp2rFWDz
 dzNvCd+galRQSH7GfaEqGaQjepiRhyqA2e/FKJZE6tpD4K8XmhjlUrOtKijAcQWe
 DSmumIS1LymHr3aieEbeO393Ttn+PWdVfmA==
X-ME-Sender: <xms:h_DTY0QXazSFQIRQItOiH1bksWyPd04_rxBgN2DX1DKa5EM-sTbC-w>
 <xme:h_DTYxwcJjtiAUexLWCJPTO0UdY2R6egt7xCpHSn1AKNrPx-mTukgutKpjbWW1bY3
 7r_snIWWgB8xJ6nXbM>
X-ME-Received: <xmr:h_DTYx14q5Xxx5L5T5C28-2A7B4aFFYYfqH6mXlPk1sh34KLgEvyFXOZPtu2_EgGOMJdEmkHIdIIfTXNcsHD6gkuCXUXp81dY2CiMYGo0UbOVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:h_DTY4Cei-3whzRCAkvr1NSd69KOF4I6lrBhGll5GaBaNrg03JLToQ>
 <xmx:h_DTY9hAHe-rWd9nqLq5YNXtVA-vfgoXCgjcE9a-xV3kZkdgV12AxQ>
 <xmx:h_DTY0pIva-By6RzvXNiuM7grb20pVmeIz4fAJUjc5pXptfklWkRYA>
 <xmx:h_DTY2YnS2tmAt1i0I3fm0POUyWF-sOLY3jobHENhYFcLg3K24q6Ag>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 10:40:54 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/probe-helper: Cancel previous job before starting new one
Date: Fri, 27 Jan 2023 16:40:52 +0100
Message-Id: <20230127154052.452524-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.39.1
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Currently we schedule a call to output_poll_execute from
drm_kms_helper_poll_enable for 10s in future. Later we try to replace
that in drm_helper_probe_single_connector_modes with a 0s schedule with
delayed_event set.

But as there is already a job in the queue this fails, and the immediate
job we wanted with delayed_event set doesn't occur until 10s later.

And that call acts as if connector state has changed, reprobing modes.
This has a side effect of waking up a display that has been blanked.

Make sure we cancel the old job before submitting the immediate one.

Fixes: 162b6a57ac50 ("drm/probe-helper: don't lose hotplug event")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_probe_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 8127be134c39..db954adb446a 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -589,9 +589,11 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		 * disable itself again.
 		 */
 		dev->mode_config.delayed_event = true;
-		if (dev->mode_config.poll_enabled)
+		if (dev->mode_config.poll_enabled) {
+			cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
 			schedule_delayed_work(&dev->mode_config.output_poll_work,
 					      0);
+		}
 	}
 
 	/* Re-enable polling in case the global poll config changed. */
-- 
2.39.1

