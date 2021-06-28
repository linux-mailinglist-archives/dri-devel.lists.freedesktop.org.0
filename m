Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AA3B5E39
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C36A6E44C;
	Mon, 28 Jun 2021 12:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADB96E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7CADE580502;
 Mon, 28 Jun 2021 08:43:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 28 Jun 2021 08:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=XbeJXieX961jY
 l/mtFMEcSGfZU89aIbI2/qpM1vzLmU=; b=GEKine4QE74BJXMm92Ef+PoQZNZmR
 2fOIbqlJVSDJxEGg2VQEDNDA04ip/lmNe4ec9oGymrCxvEXDnp8NIOSgckgjD3vD
 MBYYYSw+s1hjyErAMFlP/MlYz+rNW/pcq6rcW+gI46eq6g9iev8+UlBb4tmj7jyK
 ACIlzfGmlpF1aeN9T1Ae78g6ieM+Sc7b74H6FnUip1XPW95DrFpiGeOlpewUvbmb
 mudglKOF15QIFzM5GPG5tghd4prQsM3PW/lT7hbv4+yam3jl3dzgaADoROmJqJLJ
 eaoE7QIY1kdNPMBygQ+3vX8gRE6nqCgeckuPQrqypRB7TobSQRu7mD/7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XbeJXieX961jYl/mtFMEcSGfZU89aIbI2/qpM1vzLmU=; b=wUUbU8k9
 0PeEIFV4eaUTzxvg/fEd0uzknfcZCrgRinpDtjx/2/wnz338T6no5SmDkU/MmhDw
 sJ2XkGkwUPcbUez9h/zqlYDJsn2WPc17T/gHAG+auZTOtshJ0ccULE13CQhLmKI5
 +1e2VNL77rrrfSFPHgzerl1GdHU7HA+i0hDBnZIvGq7q7y/Ql5OTx5eudp/bfRKJ
 KCeIihqxAQ2D+INtP2VrUfv1InTVVC0MJbmcNWkhrxAVUZJ2JptKnsBRm6sePMI+
 tToaoCMBx5beWreUEtF2C0JgGVB43yHSvkvGG/DUoKsPS0GZtDuLEmBF/Sfo+cLo
 FB85PW6w6a3nLg==
X-ME-Sender: <xms:2cPZYDKk8vBmPFhg2WoOiIDVwbxZiJECokpU1RLeBThr8FsaTt8UeA>
 <xme:2cPZYHLx4piGn-wdVctXyWW-3fhwlHi6noTp344Cnk8XyPRJIm-ggQiKrQVULpZzb
 Xo_O_0kiUS1dH0K3MI>
X-ME-Received: <xmr:2cPZYLuRBWacOY_dIyw6fYbuAXet-tJEefdn36ZIMYkT8bvn0Jb8WhCJOEWB_OuLIxBxxkXJ5VPYclJbf0LTYM9k9aJXFcrhtTtJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2cPZYMZ6lDiv7txC9hsWepbCWB6wD1NETWoqJAnOlCqNIJR4giRyFA>
 <xmx:2cPZYKbuUZwdI_UsuDUsqD69TkidQj4cTod45Oikq-QYog9ZpfRtLQ>
 <xmx:2cPZYABdOqEyLi3-ItBSJOVLObFDe0qaMyKAOEosfQnIrpvF6nfs2Q>
 <xmx:2cPZYPLfb3KcCD1z96ZoyWR4r9z9xKptAtCJC6geSSNdxmPjLz-H1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:43:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 02/10] drm/vc4: hdmi: Fix HPD GPIO detection
Date: Mon, 28 Jun 2021 14:42:49 +0200
Message-Id: <20210628124257.140453-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628124257.140453-1-maxime@cerno.tech>
References: <20210628124257.140453-1-maxime@cerno.tech>
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
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
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
index b8b371abf3d7..e7fdda8a1bfa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -167,9 +167,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
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

