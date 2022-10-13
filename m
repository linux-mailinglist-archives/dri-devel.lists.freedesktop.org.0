Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51E5FDA78
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 15:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA5310E8C5;
	Thu, 13 Oct 2022 13:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DC610E8B4;
 Thu, 13 Oct 2022 13:19:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id B0593580351;
 Thu, 13 Oct 2022 09:19:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 13 Oct 2022 09:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665667166; x=
 1665674366; bh=HeTs54yGfJcuWDWpIXgjp2EtWnqzAACladqtoOYJ5Iw=; b=T
 IZ5q0fyGHOCvbE0/Zwnk+t4hWkrK5plQ6BC6YV0v0rkIPYq8wJanMT7Mfr7+PE0Y
 guB3roxFIqbfGKIjdD5090ZaIkkqDhTH9aXffiElS+ZJvVFhRjNkqAiqmbv/yT8R
 pTD796nSWytlPXXlKwkTnkCtG89WT/lOo/s+aSRouXPpo0o6Kexg7QTcJUF/CWAw
 ZJu/u/2f6f4YT3uSQhB8iWBDJrEJ/PLXZvvdx3GdSMVjBDF481dvamVMXWcejx1D
 cnJ6sUAfJWZlCQveA6H5hswv6jilGHrhyvX1+lPajTDODMBdjzfJHwCSj+/mZCk3
 2zBI3EzByHqIKRFY+7cYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665667166; x=
 1665674366; bh=HeTs54yGfJcuWDWpIXgjp2EtWnqzAACladqtoOYJ5Iw=; b=U
 mDeWlGJJ34Ge+UkTWONXYIZnnKMfQWoIQ4I1m3mRCpHQYZxgoyDk06svPnEK+XiZ
 dVP7Jm2ZvnqzGGFpRp+oUzNiTJztDxwAmoFZ1fs39vtfsbLbG2Hs904NQgySgwef
 Q5MQf5zfYcjDMPnh/ldX6Z4BrisKE/z8+s5nt1CpvJVkipPqBuZ8osv9eC2MD2b5
 Q8FwkrdNd4tcWThyCQviF9+ICwVSvOPlmHVvzfomQk1IVC7/ZUrmuhC+Z155Faa2
 TsTFkphd9v3F26lXwkRr3GPaEOIcicKmxDAMY5KyhzvB94s/HLIp1x2XMlEmLk37
 Z4N3OhM0U0P+unbXlH21Q==
X-ME-Sender: <xms:XhBIY-_FqRXhBBvQ3pYSFl8-NIfwuDj1s0DOQ_RipPpepJWU0ZpJkA>
 <xme:XhBIY-scaMMyBD3aX66KyYJHzmmJTxGDJr-Y0hqtsoKWBxgDbeQHDYClu8okl83c7
 d1spj06DKCFAPyyjb8>
X-ME-Received: <xmr:XhBIY0DKUydWC-iOpsK-qEsGUw-8dGGZ92sQB6GB9Jopgp-ZSE6GP2T-i_GD9d6BymWTpluTemonCr9VLyj25nMgO5LbkafYh9s1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:XhBIY2cJRj5sdi0S4Xpm7Ps8VeQGdQzpqIxzXdjmbFIL7rLMZCioLA>
 <xmx:XhBIYzNPfKlhn30RFkmlr_NEFsurGt4kK2cJ4TGpndSV7C8PwV42oQ>
 <xmx:XhBIYwknAJf5R4jHZl0QEzAf1Ppy-7WvmqSKVJGpZ5K8QtfTGdVERA>
 <xmx:XhBIYwb5-rPQrO1keI8-uwXJhqa2BlhBclxrhSXM0Z4SlL3Hpf0dRw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 09:19:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 15:18:54 +0200
Subject: [PATCH v5 10/22] drm/modes: Fill drm_cmdline mode from named modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v5-10-d841cc64fe4b@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
 Emma Anholt <emma@anholt.net>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, 
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=eK4mvg+/Vgt1Y5yuflrP/Rh+1orwahkzuADXYnjtlew=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkeAm4qujHMu7iqtrvt8LAL/6lSbRT49vL+A765aS/Za1ut
 zQ52lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCL+0owMG1zmafkr6U/uUm+fYZh85w
 7X6TedJy5lelpkfuGwEKyWZfgf2V3fWhQQ1rgj0OLjHw7NOS8+703nW/HQddauNxJJ+/W5AQ==
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code to deal with named modes will only set the mode name, and
then it's up to drivers to try to match that name to whatever mode or
configuration they see fit.

The plan is to remove that need and move the named mode handling out of
drivers and into the core, and only rely on modes and properties. Let's
start by properly filling drm_cmdline_mode from a named mode.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_modes.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 7ed3fb839db7..99453aca9a83 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -2226,11 +2226,22 @@ static int drm_mode_parse_cmdline_options(const char *str,
 
 struct drm_named_mode {
 	const char *name;
+	unsigned int xres;
+	unsigned int yres;
+	unsigned int flags;
 };
 
+#define NAMED_MODE(_name, _x, _y, _flags)		\
+	{						\
+		.name = _name,				\
+		.xres = _x,				\
+		.yres = _y,				\
+		.flags = _flags,			\
+	}
+
 static const struct drm_named_mode drm_named_modes[] = {
-	{ "NTSC", },
-	{ "PAL", },
+	NAMED_MODE("NTSC", 720, 480, DRM_MODE_FLAG_INTERLACE),
+	NAMED_MODE("PAL", 720, 576, DRM_MODE_FLAG_INTERLACE),
 };
 
 static int drm_mode_parse_cmdline_named_mode(const char *name,
@@ -2275,6 +2286,9 @@ static int drm_mode_parse_cmdline_named_mode(const char *name,
 			continue;
 
 		strcpy(cmdline_mode->name, mode->name);
+		cmdline_mode->xres = mode->xres;
+		cmdline_mode->yres = mode->yres;
+		cmdline_mode->interlace = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 		cmdline_mode->specified = true;
 
 		return 1;

-- 
b4 0.11.0-dev-7da52
