Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4D3BE495
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE206E03B;
	Wed,  7 Jul 2021 08:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7962D6E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E11F02B0093A;
 Wed,  7 Jul 2021 04:47:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 04:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Ie/mX7HEK2cUC
 fZtMo9XUG39ZOt0Gj3AIORpUCW7nQg=; b=jyx/V3fenHQeqLj0y/x2R1ivYWc4D
 L+P/H++XwBpwUIWNIwtM5K9nnYrmWQkg6yXaaYoD3dqiSBNn8OYNsCdfoQ8SG5j5
 4zNpt5jzbYXMXzmVhHyFCecQaEdeJWuqLzg/gu7P0+WDIyR3JU29+URmuFE/6uL7
 V02lJib+rS1MpdpI6L3OSr4/XLH46VGV4qH2WEuX8jrL72rQ5pq5z1a51u0XYlca
 XtlEz6zf6OSKF22ypMLud0r8tDil1m+bSbU+xrVKz3Sj9R0sVSLpOEdIzvCDvQoj
 CYxrh5QL9bhgYNgV1d9kPgnD1o/0/Xw/pU+tAS8K5OYaJ1Gz5bxVXUQuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Ie/mX7HEK2cUCfZtMo9XUG39ZOt0Gj3AIORpUCW7nQg=; b=MqIM2T/s
 01tD8/5SIEEBZfFS2e1bxsUI3akQoQUmsupEqkKJq07M9/O73dsi5nFdVC+4L1tm
 y8OfVKXcSIRV0C0ubQKtzo4AjXuWSX3zF9AfSfOPEjBec+HrWBhLd3QK3FkeRdeh
 5s/Zsv/TjNNBUjEXO19ygaRW+vjI45LvHlrncWE+Pl0qPkEU5TcJEWSgv4y76mD4
 1rw21NKvujZ31pOwRKEPtJs5HEn+oYrwhOZkeV1gp+MfZEHScUDRuwdT1GVr8Aiw
 4uP5FJ4PNoeBP0510CMHq8g0qh6a2hWGwPf5kVRVdvlpaFJw5lWcj31fqnQcbyaO
 uOU/fex5Vu4AMg==
X-ME-Sender: <xms:PWrlYFtMvGYTSeMcoXgtMxXKwfTsJn-B3MfwBexz0Y1L_ci5xgwN4A>
 <xme:PWrlYOdgoID7WFraOAyVJQjifGDvcvG6A9uFBNAsd0GD5c00PUHYM1IzriQAYvF5S
 7g5cLuc7PodXOa5qGo>
X-ME-Received: <xmr:PWrlYIwkrXlMXLdgVYUSshnDHSQE_LHYfAKh62GZ-kCK-laTBrfl5hudihVbWWm331DZY4Tj8sytMDjSPqlHN28wqzbca2D3aXwz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PWrlYMPDgbtFNho6Ba6tyzHGSHDKw70I-6MyTo4yxUz6bN6AoEkhhA>
 <xmx:PWrlYF9QKTpaCV3woVIA2QKwoXeIgUHWHhbYPp6voGKscrRTINyibQ>
 <xmx:PWrlYMUuR9z2fiZdghhOdD0ut_pTFBQZp5ofun7RWX_GhnTbFk0LrQ>
 <xmx:PmrlYJVV-8d9QEQnNy17RtRoXXudnKiM68TCzyXXq47cHk3eL32zOrkWAbU>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:47:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 02/10] drm/vc4: hdmi: Fix HPD GPIO detection
Date: Wed,  7 Jul 2021 10:47:37 +0200
Message-Id: <20210707084745.1365390-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prior to commit 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod"), in the
detect hook, if we had an HPD GPIO we would only rely on it and return
whatever state it was in.

However, that commit changed that by mistake to only consider the case
where we have a GPIO and it returns a logical high, and would fall back
to the other methods otherwise.

Since we can read the EDIDs when the HPD signal is low on some displays,
we changed the detection status from disconnected to connected, and we
would ignore an HPD pulse.

Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 8779cef13f52..eada68b65402 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -166,9 +166,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	bool connected = false;
 
-	if (vc4_hdmi->hpd_gpio &&
-	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
-		connected = true;
+	if (vc4_hdmi->hpd_gpio) {
+		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
+			connected = true;
 	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
 		connected = true;
 	}
-- 
2.31.1

