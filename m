Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE75A4D34
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365FB10F20E;
	Mon, 29 Aug 2022 13:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A882E10F20E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:13:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 7F4DD2B06053;
 Mon, 29 Aug 2022 09:13:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 29 Aug 2022 09:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1661778789; x=
 1661785989; bh=sHJoW4kxoDFCYcawvDpLOhSkPseUWosDT9lxsntMrMg=; b=o
 +eRFAwn1/QOg7ZYV3PsSPF8mDZ5IGmxlyDZEJb13k5qrkVq2TD2DzdvzrTrZbG/N
 GqX2374pGGod+GCfXlkZKRtXXlEx/yejsBXJX0WoMDAFtlGlfIDsn+WzIKJTVZ4K
 x/LJW3OvJHwYdkDT3P3c3bNnmxPsa1dmdN63QXmHdKNnxpOjgXYcpzEL+cMRJbXm
 Bc7srCN6WJ2OrIEqwRwt7Ol4qSqTCAoVFQXKXPh2VTttouwVuAHA3W7fIx0npndr
 Xhojm5DFhb5Kb6DdE0qsT310rb0tWrsvQvJ9np/PdrEavya7yP9reyPwWvQxQZIs
 hodHGQPeaK8HtcmR7mrKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661778789; x=
 1661785989; bh=sHJoW4kxoDFCYcawvDpLOhSkPseUWosDT9lxsntMrMg=; b=H
 FJ/xKu18XpMb3WL1AvwZoSX4msm3uUKHg7BrY03AlQsetct6zMTQGZlHrMpfXu0d
 K8HoObnNHBc74zhZRMyU5U2GCHdkpn4eUqwK/grcFG90piJhGFxd56dPCoY2nQpl
 vw0nLOblH0HhD24Qht3lQ3cFN9Ff2alPiItbmk5P2rN5qOPotDqCxa+hZFBt8B6w
 Qn2eJxsAxQ4V3IrjmBE78k4FLzTZXjdZOQhUigAZxofGCcmkeHDx79lKwjrwjzGu
 L7wT04YhIo/c7EYqEQX3/4NKRUuqOC31na2CboiUeu4VHFg42Xf51bHsvTGFdUAI
 T1lBEwInbW6iODLvEB1sg==
X-ME-Sender: <xms:ZLsMYxFAn7LSVmoiNiSk1g8ZeOomSifNEk8dZDcrkHgGy2wYUqi46Q>
 <xme:ZLsMY2Wp_zbUZId7MJorsgfXMjo6VmhEnz-Xwsek4IwZrMLGjv0LnjPmUOPSm4Ti7
 S_M89Ois9rRAXVjx1k>
X-ME-Received: <xmr:ZLsMYzI2iNMzUJMosijOzAiTUVItIYjPbLAWaONzk1k04SabLdNi05xg5LJl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthhqredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeeuffdtffduleffkeeugedvgfejvdeftdefheeijefhveekgeeuteeg
 geekhefhgeenucffohhmrghinheprghrtghhihhvvgdrohhrghdpkhholhhumhgsuhhsrd
 hfihdphhhinhhnvghrrdhinhhfohdpsggrthhsohgtkhhsrdgtohdruhhknecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvg
 hrnhhordhtvggthh
X-ME-Proxy: <xmx:ZLsMY3FrqwjMp9bsFN5ikr2g79N4t5lCo3kuIYw_TJYQezDjlumPmg>
 <xmx:ZLsMY3UJ9PlPU_h4RAnRKmh0pDGmkga-jJpePYvRRT3MjmCqucLszQ>
 <xmx:ZLsMYyPBKVzb9P8RAznDudVW77YLL9CqgODglWutSjEbEauS4XqgZQ>
 <xmx:ZbsMY-ebI-hobNZLAm0VKqh5k9fNnvZw69_pAzBJOsuVw0p-vIc7tfEwpxU>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 09:13:07 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 10/41] drm/modes: Add a function to generate analog display
 modes
Date: Mon, 29 Aug 2022 15:11:24 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-65ba7
X-Developer-Signature: v=1; a=openpgp-sha256; l=21417; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0Lj8QojJNaPOnib+aAarYKqf+VDM+SKzk/6SDFpneiA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMk8u+QPBlh6HK5LFF+/rtCoX+zVZ1cpTquvXguPH5F8eEJ1
 h0p1RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbyfj3DP/2N319fSan6vH3Sy2Mmm1
 ZWP/fT2PZj++GnW77VnkgIjuNn+MUUdGSrsO3quPifrcpPtqx7V3A6OWuF5SaOUsH0rIv7XvICAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Content-Transfer-Encoding: quoted-printable
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and=0D
625-lines modes in their drivers.=0D
=0D
Since those modes are fairly standard, and that we'll need to use them=0D
in more places in the future, it makes sense to move their definition=0D
into the core framework.=0D
=0D
However, analog display usually have fairly loose timings requirements,=0D
the only discrete parameters being the total number of lines and pixel=0D
clock frequency. Thus, we created a function that will create a display=0D
mode from the standard, the pixel frequency and the active area.=0D
=0D
Signed-off-by: Maxime Ripard <maxime@cerno.tech>=0D
=0D
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c=0D
index 304004fb80aa..ee581ee17171 100644=0D
--- a/drivers/gpu/drm/drm_modes.c=0D
+++ b/drivers/gpu/drm/drm_modes.c=0D
@@ -116,6 +116,459 @@ void drm_mode_probed_add(struct drm_connector *connec=
tor,=0D
 }=0D
 EXPORT_SYMBOL(drm_mode_probed_add);=0D
 =0D
+enum drm_mode_analog {=0D
+	DRM_MODE_ANALOG_NTSC,=0D
+	DRM_MODE_ANALOG_PAL,=0D
+};=0D
+=0D
+/*=0D
+ * The timings come from:=0D
+ * - https://web.archive.org/web/20220406232708/http://www.kolumbus.fi/pam=
i1/video/pal_ntsc.html=0D
+ * - https://web.archive.org/web/20220406124914/http://martin.hinner.info/=
vga/pal.html=0D
+ * - https://web.archive.org/web/20220609202433/http://www.batsocks.co.uk/=
readme/video_timing.htm=0D
+ */=0D
+#define NTSC_LINE_DURATION_NS		63556U=0D
+#define NTSC_LINES_NUMBER		525=0D
+=0D
+#define NTSC_HBLK_DURATION_TYP_NS	10900U=0D
+#define NTSC_HBLK_DURATION_MIN_NS	(NTSC_HBLK_DURATION_TYP_NS - 200)=0D
+#define NTSC_HBLK_DURATION_MAX_NS	(NTSC_HBLK_DURATION_TYP_NS + 200)=0D
+=0D
+#define NTSC_HACT_DURATION_TYP_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_DURAT=
ION_TYP_NS)=0D
+#define NTSC_HACT_DURATION_MIN_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_DURAT=
ION_MAX_NS)=0D
+#define NTSC_HACT_DURATION_MAX_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_DURAT=
ION_MIN_NS)=0D
+=0D
+#define NTSC_HFP_DURATION_TYP_NS	1500=0D
+#define NTSC_HFP_DURATION_MIN_NS	1270=0D
+#define NTSC_HFP_DURATION_MAX_NS	2220=0D
+=0D
+#define NTSC_HSLEN_DURATION_TYP_NS	4700=0D
+#define NTSC_HSLEN_DURATION_MIN_NS	(NTSC_HSLEN_DURATION_TYP_NS - 100)=0D
+#define NTSC_HSLEN_DURATION_MAX_NS	(NTSC_HSLEN_DURATION_TYP_NS + 100)=0D
+=0D
+#define NTSC_HBP_DURATION_TYP_NS	4700=0D
+=0D
+/*=0D
+ * I couldn't find the actual tolerance for the back porch, so let's=0D
+ * just reuse the sync length ones.=0D
+ */=0D
+#define NTSC_HBP_DURATION_MIN_NS	(NTSC_HBP_DURATION_TYP_NS - 100)=0D
+#define NTSC_HBP_DURATION_MAX_NS	(NTSC_HBP_DURATION_TYP_NS + 100)=0D
+=0D
+#define PAL_LINE_DURATION_NS		64000U=0D
+#define PAL_LINES_NUMBER		625=0D
+=0D
+#define PAL_HACT_DURATION_TYP_NS	51950U=0D
+#define PAL_HACT_DURATION_MIN_NS	(PAL_HACT_DURATION_TYP_NS - 100)=0D
+#define PAL_HACT_DURATION_MAX_NS	(PAL_HACT_DURATION_TYP_NS + 400)=0D
+=0D
+#define PAL_HBLK_DURATION_TYP_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURATION=
_TYP_NS)=0D
+#define PAL_HBLK_DURATION_MIN_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURATION=
_MAX_NS)=0D
+#define PAL_HBLK_DURATION_MAX_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURATION=
_MIN_NS)=0D
+=0D
+#define PAL_HFP_DURATION_TYP_NS		1650=0D
+#define PAL_HFP_DURATION_MIN_NS		(PAL_HFP_DURATION_TYP_NS - 100)=0D
+#define PAL_HFP_DURATION_MAX_NS		(PAL_HFP_DURATION_TYP_NS + 400)=0D
+=0D
+#define PAL_HSLEN_DURATION_TYP_NS	4700=0D
+#define PAL_HSLEN_DURATION_MIN_NS	(PAL_HSLEN_DURATION_TYP_NS - 200)=0D
+#define PAL_HSLEN_DURATION_MAX_NS	(PAL_HSLEN_DURATION_TYP_NS + 200)=0D
+=0D
+#define PAL_HBP_DURATION_TYP_NS		5700=0D
+#define PAL_HBP_DURATION_MIN_NS		(PAL_HBP_DURATION_TYP_NS - 200)=0D
+#define PAL_HBP_DURATION_MAX_NS		(PAL_HBP_DURATION_TYP_NS + 200)=0D
+=0D
+#define PAL_VFP_INTERLACE_LINES		5=0D
+#define PAL_VSLEN_INTERLACE_LINES	5=0D
+=0D
+#define PAL_SHORT_SYNC_DURATION_NS	((2 + 30) * NSEC_PER_USEC)=0D
+#define PAL_LONG_SYNC_DURATION_NS	((30 + 2) * NSEC_PER_USEC)=0D
+=0D
+struct analog_param_field {=0D
+	unsigned int even, odd;=0D
+};=0D
+=0D
+#define PARAM_FIELD(_odd, _even)		\=0D
+	{ .even =3D _even, .odd =3D _odd }=0D
+=0D
+struct analog_param_range {=0D
+	unsigned int	min, typ, max;=0D
+};=0D
+=0D
+#define PARAM_RANGE(_min, _typ, _max)		\=0D
+	{ .min =3D _min, .typ =3D _typ, .max =3D _max }=0D
+=0D
+struct analog_parameters {=0D
+	unsigned int			num_lines;=0D
+	unsigned int			line_duration_ns;=0D
+=0D
+	struct analog_param_range	hact_ns;=0D
+	struct analog_param_range	hfp_ns;=0D
+	struct analog_param_range	hslen_ns;=0D
+	struct analog_param_range	hbp_ns;=0D
+	struct analog_param_range	hblk_ns;=0D
+=0D
+	struct analog_param_field	vfp_lines;=0D
+	struct analog_param_field	vslen_lines;=0D
+	struct analog_param_field	vbp_lines;=0D
+};=0D
+=0D
+#define TV_MODE_PARAMETER(_mode, _lines, _line_dur, _hact, _hfp, _hslen, _=
hbp, _hblk, _vfp, _vslen, _vbp) \=0D
+	[_mode] =3D {							\=0D
+		.num_lines =3D _lines,					\=0D
+		.line_duration_ns =3D _line_dur,				\=0D
+		.hact_ns =3D _hact,					\=0D
+		.hfp_ns =3D _hfp,						\=0D
+		.hslen_ns =3D _hslen,					\=0D
+		.hbp_ns =3D _hbp,						\=0D
+		.hblk_ns =3D _hblk,					\=0D
+		.vfp_lines =3D _vfp,					\=0D
+		.vslen_lines =3D _vslen,					\=0D
+		.vbp_lines =3D _vbp,					\=0D
+	}=0D
+=0D
+const static struct analog_parameters tv_modes_parameters[] =3D {=0D
+	TV_MODE_PARAMETER(DRM_MODE_ANALOG_NTSC,=0D
+			  NTSC_LINES_NUMBER,=0D
+			  NTSC_LINE_DURATION_NS,=0D
+			  PARAM_RANGE(NTSC_HACT_DURATION_MIN_NS,=0D
+				      NTSC_HACT_DURATION_TYP_NS,=0D
+				      NTSC_HACT_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(NTSC_HFP_DURATION_MIN_NS,=0D
+				      NTSC_HFP_DURATION_TYP_NS,=0D
+				      NTSC_HFP_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(NTSC_HSLEN_DURATION_MIN_NS,=0D
+				      NTSC_HSLEN_DURATION_TYP_NS,=0D
+				      NTSC_HSLEN_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(NTSC_HBP_DURATION_MIN_NS,=0D
+				      NTSC_HBP_DURATION_TYP_NS,=0D
+				      NTSC_HBP_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(NTSC_HBLK_DURATION_MIN_NS,=0D
+				      NTSC_HBLK_DURATION_TYP_NS,=0D
+				      NTSC_HBLK_DURATION_MAX_NS),=0D
+			  PARAM_FIELD(3, 3),=0D
+			  PARAM_FIELD(3, 3),=0D
+			  PARAM_FIELD(3, 3)),=0D
+	TV_MODE_PARAMETER(DRM_MODE_ANALOG_PAL,=0D
+			  PAL_LINES_NUMBER,=0D
+			  PAL_LINE_DURATION_NS,=0D
+			  PARAM_RANGE(PAL_HACT_DURATION_MIN_NS,=0D
+				      PAL_HACT_DURATION_TYP_NS,=0D
+				      PAL_HACT_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(PAL_HFP_DURATION_MIN_NS,=0D
+				      PAL_HFP_DURATION_TYP_NS,=0D
+				      PAL_HFP_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(PAL_HSLEN_DURATION_MIN_NS,=0D
+				      PAL_HSLEN_DURATION_TYP_NS,=0D
+				      PAL_HSLEN_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(PAL_HBP_DURATION_MIN_NS,=0D
+				      PAL_HBP_DURATION_TYP_NS,=0D
+				      PAL_HBP_DURATION_MAX_NS),=0D
+			  PARAM_RANGE(PAL_HBLK_DURATION_MIN_NS,=0D
+				      PAL_HBLK_DURATION_TYP_NS,=0D
+				      PAL_HBLK_DURATION_MAX_NS),=0D
+=0D
+			  /*=0D
+			   * The front porch is actually 6 short sync=0D
+			   * pulses for the even field, and 5 for the=0D
+			   * odd field. Each sync takes half a life so=0D
+			   * the odd field front porch is shorter by=0D
+			   * half a line.=0D
+			   *=0D
+			   * In progressive, we're supposed to use 6=0D
+			   * pulses, so we're fine there=0D
+			   */=0D
+			  PARAM_FIELD(3, 2),=0D
+=0D
+			  /*=0D
+			   * The vsync length is 5 long sync pulses,=0D
+			   * each field taking half a line. We're=0D
+			   * shorter for both fields by half a line.=0D
+			   *=0D
+			   * In progressive, we're supposed to use 5=0D
+			   * pulses, so we're off by half=0D
+			   * a line.=0D
+			   *=0D
+			   * In interlace, we're now off by half a line=0D
+			   * for the even field and one line for the odd=0D
+			   * field.=0D
+			   */=0D
+			  PARAM_FIELD(3, 3),=0D
+=0D
+			  /*=0D
+			   * The back porch is actually 5 short sync=0D
+			   * pulses for the even field, 4 for the odd=0D
+			   * field. In progressive, it's 5 short syncs.=0D
+			   *=0D
+			   * In progressive, we thus have 2.5 lines,=0D
+			   * plus the 0.5 line we were missing=0D
+			   * previously, so we should use 3 lines.=0D
+			   *=0D
+			   * In interlace, the even field is in the=0D
+			   * exact same case than progressive. For the=0D
+			   * odd field, we should be using 2 lines but=0D
+			   * we're one line short, so we'll make up for=0D
+			   * it here by using 3.=0D
+			   */=0D
+			  PARAM_FIELD(3, 3)),=0D
+};=0D
+=0D
+static int fill_analog_mode(struct drm_display_mode *mode,=0D
+			    const struct analog_parameters *params,=0D
+			    unsigned long pixel_clock_hz,=0D
+			    unsigned int hactive,=0D
+			    unsigned int vactive,=0D
+			    bool interlace)=0D
+{=0D
+	unsigned long pixel_duration_ns =3D NSEC_PER_SEC / pixel_clock_hz;=0D
+	unsigned long long htotal;=0D
+	unsigned int vtotal;=0D
+	unsigned int max_hact, hact_duration_ns;=0D
+	unsigned int hblk, hblk_duration_ns;=0D
+	unsigned int hfp, hfp_min, hfp_duration_ns;=0D
+	unsigned int hslen, hslen_duration_ns;=0D
+	unsigned int hbp, hbp_min, hbp_duration_ns;=0D
+	unsigned int porches, porches_duration_ns;=0D
+	unsigned int vfp, vfp_min;=0D
+	unsigned int vbp, vbp_min;=0D
+	unsigned int vslen;=0D
+	int porches_rem;=0D
+	bool strict =3D true;=0D
+=0D
+	max_hact =3D params->hact_ns.max / pixel_duration_ns;=0D
+	if (pixel_clock_hz =3D=3D 13500000 && hactive > max_hact && hactive <=3D =
720)=0D
+		strict =3D false;=0D
+=0D
+	/*=0D
+	 * Our pixel duration is going to be round down by the division,=0D
+	 * so rounding up is probably going to introduce even more=0D
+	 * deviation.=0D
+	 */=0D
+	htotal =3D params->line_duration_ns * pixel_clock_hz / NSEC_PER_SEC;=0D
+=0D
+	hact_duration_ns =3D hactive * pixel_duration_ns;=0D
+	if (strict &&=0D
+	    (hact_duration_ns < params->hact_ns.min ||=0D
+	     hact_duration_ns > params->hact_ns.max)) {=0D
+		DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, max %=
u)\n",=0D
+			  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	hblk =3D htotal - hactive;=0D
+	hblk_duration_ns =3D hblk * pixel_duration_ns;=0D
+	if (strict &&=0D
+	    (hblk_duration_ns < params->hblk_ns.min ||=0D
+	     hblk_duration_ns > params->hblk_ns.max)) {=0D
+		DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max %u)\=
n",=0D
+			  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	hslen =3D DIV_ROUND_UP(params->hslen_ns.typ, pixel_duration_ns);=0D
+	hslen_duration_ns =3D hslen * pixel_duration_ns;=0D
+	if (strict &&=0D
+	    (hslen_duration_ns < params->hslen_ns.min ||=0D
+	     hslen_duration_ns > params->hslen_ns.max)) {=0D
+		DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\n",=
=0D
+			  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	porches =3D hblk - hslen;=0D
+	porches_duration_ns =3D porches * pixel_duration_ns;=0D
+	if (strict &&=0D
+	    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) ||=0D
+	     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))) {=
=0D
+		DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_duratio=
n_ns);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	hfp_min =3D DIV_ROUND_UP(params->hfp_ns.min, pixel_duration_ns);=0D
+	hbp_min =3D DIV_ROUND_UP(params->hbp_ns.min, pixel_duration_ns);=0D
+	porches_rem =3D porches - hfp_min - hbp_min;=0D
+=0D
+	hfp =3D hfp_min + DIV_ROUND_UP(porches_rem, 2);=0D
+	hfp_duration_ns =3D hfp * pixel_duration_ns;=0D
+	if (strict &&=0D
+	    (hfp_duration_ns < params->hfp_ns.min ||=0D
+	     hfp_duration_ns > params->hfp_ns.max)) {=0D
+		DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, max %=
u)\n",=0D
+			  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	hbp =3D porches - hfp;=0D
+	hbp_duration_ns =3D hbp * pixel_duration_ns;=0D
+	if (strict &&=0D
+	    (hbp_duration_ns < params->hbp_ns.min ||=0D
+	     hbp_duration_ns > params->hbp_ns.max)) {=0D
+		DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, max %u=
)\n",=0D
+			  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	if (htotal !=3D (hactive + hfp + hslen + hbp))=0D
+		return -EINVAL;=0D
+=0D
+	mode->clock =3D pixel_clock_hz / 1000;=0D
+	mode->hdisplay =3D hactive;=0D
+	mode->hsync_start =3D hactive + hfp;=0D
+	mode->hsync_end =3D hactive + hfp + hslen;=0D
+	mode->htotal =3D hactive + hfp + hslen + hbp;=0D
+=0D
+	if (interlace) {=0D
+		vfp_min =3D params->vfp_lines.even + params->vfp_lines.odd;=0D
+		vbp_min =3D params->vbp_lines.even + params->vbp_lines.odd;=0D
+		vslen =3D params->vslen_lines.even + params->vslen_lines.odd;=0D
+	} else {=0D
+		/*=0D
+		 * By convention, NSTC (aka 525/60) systems start with=0D
+		 * the even field, but PAL (aka 625/50) systems start=0D
+		 * with the odd one.=0D
+		 *=0D
+		 * PAL systems also have asymetric timings between the=0D
+		 * even and odd field, while NTSC is symetric.=0D
+		 *=0D
+		 * Moreover, if we want to create a progressive mode for=0D
+		 * PAL, we need to use the odd field timings.=0D
+		 *=0D
+		 * Since odd =3D=3D even for NTSC, we can just use the odd=0D
+		 * one all the time to simplify the code a bit.=0D
+		 */=0D
+		vfp_min =3D params->vfp_lines.odd;=0D
+		vbp_min =3D params->vbp_lines.odd;=0D
+		vslen =3D params->vslen_lines.odd;=0D
+	}=0D
+=0D
+	porches =3D params->num_lines - vactive - vslen;=0D
+	porches_rem =3D porches - vfp_min - vbp_min;=0D
+=0D
+	vfp =3D vfp_min + (porches_rem / 2);=0D
+	vbp =3D porches - vfp;=0D
+=0D
+	vtotal =3D vactive + vfp + vslen + vbp;=0D
+	if (params->num_lines !=3D vtotal) {=0D
+		DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",=0D
+			  vtotal, params->num_lines);=0D
+		return -EINVAL;=0D
+	}=0D
+=0D
+	mode->vdisplay =3D vactive;=0D
+	mode->vsync_start =3D vactive + vfp;=0D
+	mode->vsync_end =3D vactive + vfp + vslen;=0D
+	mode->vtotal =3D vactive + vfp + vslen + vbp;=0D
+=0D
+	mode->type =3D DRM_MODE_TYPE_DRIVER;=0D
+	mode->flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC;=0D
+	if (interlace)=0D
+		mode->flags |=3D DRM_MODE_FLAG_INTERLACE;=0D
+=0D
+	drm_mode_set_name(mode);=0D
+=0D
+	if (mode->vtotal !=3D params->num_lines)=0D
+		return -EINVAL;=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+/**=0D
+ * drm_analog_tv_mode - create a display mode for an analog TV=0D
+ * @dev: drm device=0D
+ * @tv_mode: TV Mode standard to create a mode for. See DRM_MODE_TV_MODE_*=
.=0D
+ * @pixel_clock_hz: Pixel Clock Frequency, in Hertz=0D
+ * @hdisplay: hdisplay size=0D
+ * @vdisplay: vdisplay size=0D
+ * @interlace: whether to compute an interlaced mode=0D
+ *=0D
+ * This function creates a struct drm_display_mode instance suited for=0D
+ * an analog TV output, for one of the usual analog TV mode.=0D
+ *=0D
+ * Note that @hdisplay is larger than the usual constraints for the PAL=0D
+ * and NTSC timings, and we'll choose to ignore most timings constraints=0D
+ * to reach those resolutions.=0D
+ *=0D
+ * Returns:=0D
+ *=0D
+ * A pointer to the mode, allocated with drm_mode_create(). Returns NULL=0D
+ * on error.=0D
+ */=0D
+struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,=0D
+					    enum drm_connector_tv_mode tv_mode,=0D
+					    unsigned long pixel_clock_hz,=0D
+					    unsigned int hdisplay,=0D
+					    unsigned int vdisplay,=0D
+					    bool interlace)=0D
+{=0D
+	struct drm_display_mode *mode;=0D
+	enum drm_mode_analog analog;=0D
+	int ret;=0D
+=0D
+	switch (tv_mode) {=0D
+	case DRM_MODE_TV_MODE_NTSC_443:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_NTSC_J:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_NTSC_M:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_60:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_M:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_60:=0D
+		analog =3D DRM_MODE_ANALOG_NTSC;=0D
+		break;=0D
+=0D
+	case DRM_MODE_TV_MODE_PAL_B:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_D:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_G:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_H:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_I:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_N:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_PAL_NC:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_B:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_D:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_G:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_K:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_K1:=0D
+		fallthrough;=0D
+	case DRM_MODE_TV_MODE_SECAM_L:=0D
+		analog =3D DRM_MODE_ANALOG_PAL;=0D
+		break;=0D
+=0D
+	default:=0D
+		return NULL;=0D
+	}=0D
+=0D
+	mode =3D drm_mode_create(dev);=0D
+	if (!mode)=0D
+		return NULL;=0D
+=0D
+	ret =3D fill_analog_mode(mode,=0D
+			       &tv_modes_parameters[analog],=0D
+			       pixel_clock_hz, hdisplay, vdisplay, interlace);=0D
+	if (ret)=0D
+		goto err_free_mode;=0D
+=0D
+	return mode;=0D
+=0D
+err_free_mode:=0D
+	drm_mode_destroy(dev, mode);=0D
+	return NULL;=0D
+}=0D
+EXPORT_SYMBOL(drm_analog_tv_mode);=0D
+=0D
 /**=0D
  * drm_cvt_mode -create a modeline based on the CVT algorithm=0D
  * @dev: drm device=0D
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefil=
e=0D
index b29ef1085cad..b22ac96fdd65 100644=0D
--- a/drivers/gpu/drm/tests/Makefile=0D
+++ b/drivers/gpu/drm/tests/Makefile=0D
@@ -10,5 +10,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \=0D
 	drm_framebuffer_test.o \=0D
 	drm_kunit_helpers.o \=0D
 	drm_mm_test.o \=0D
+	drm_modes_test.o \=0D
 	drm_plane_helper_test.o \=0D
 	drm_rect_test.o=0D
diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests=
/drm_modes_test.c=0D
new file mode 100644=0D
index 000000000000..87d398fcb99e=0D
--- /dev/null=0D
+++ b/drivers/gpu/drm/tests/drm_modes_test.c=0D
@@ -0,0 +1,131 @@=0D
+// SPDX-License-Identifier: GPL-2.0=0D
+/*=0D
+ * Kunit test for drm_modes functions=0D
+ */=0D
+=0D
+#include <kunit/test.h>=0D
+=0D
+#include <drm/drm_modes.h>=0D
+=0D
+#include "drm_kunit_helpers.h"=0D
+=0D
+struct drm_modes_test_priv {=0D
+	struct drm_device *drm;=0D
+};=0D
+=0D
+static int drm_modes_test_init(struct kunit *test)=0D
+{=0D
+	struct drm_modes_test_priv *priv;=0D
+=0D
+	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);=0D
+	if (!priv)=0D
+		return -ENOMEM;=0D
+	test->priv =3D priv;=0D
+=0D
+	priv->drm =3D drm_kunit_device_init("drm-modes-test");=0D
+	if (IS_ERR(priv->drm))=0D
+		return PTR_ERR(priv->drm);=0D
+=0D
+	return 0;=0D
+}=0D
+=0D
+static void drm_modes_test_exit(struct kunit *test)=0D
+{=0D
+	struct drm_modes_test_priv *priv =3D test->priv;=0D
+=0D
+	drm_kunit_device_exit(priv->drm);=0D
+}=0D
+=0D
+static void drm_modes_analog_tv_ntsc_480i(struct kunit *test)=0D
+{=0D
+	struct drm_modes_test_priv *priv =3D test->priv;=0D
+	struct drm_display_mode *mode;=0D
+=0D
+	mode =3D drm_analog_tv_mode(priv->drm,=0D
+				  DRM_MODE_TV_MODE_NTSC_M,=0D
+				  13500 * 1000, 720, 480,=0D
+				  true);=0D
+	KUNIT_ASSERT_NOT_NULL(test, mode);=0D
+=0D
+	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 60);=0D
+	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);=0D
+=0D
+	/* 63.556us * 13.5MHz =3D 858 pixels */=0D
+	KUNIT_EXPECT_EQ(test, mode->htotal, 858);=0D
+	KUNIT_EXPECT_EQ(test, mode->vdisplay, 480);=0D
+	KUNIT_EXPECT_EQ(test, mode->vtotal, 525);=0D
+}=0D
+=0D
+static void drm_modes_analog_tv_ntsc_480i_inlined(struct kunit *test)=0D
+{=0D
+	struct drm_modes_test_priv *priv =3D test->priv;=0D
+	struct drm_display_mode *expected, *mode;=0D
+=0D
+	expected =3D drm_analog_tv_mode(priv->drm,=0D
+				      DRM_MODE_TV_MODE_NTSC_M,=0D
+				      13500 * 1000, 720, 480,=0D
+				      true);=0D
+	KUNIT_ASSERT_NOT_NULL(test, expected);=0D
+=0D
+	mode =3D drm_mode_analog_ntsc_480i(priv->drm);=0D
+	KUNIT_ASSERT_NOT_NULL(test, mode);=0D
+=0D
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));=0D
+}=0D
+=0D
+static void drm_modes_analog_tv_pal_576i(struct kunit *test)=0D
+{=0D
+	struct drm_modes_test_priv *priv =3D test->priv;=0D
+	struct drm_display_mode *mode;=0D
+=0D
+	mode =3D drm_analog_tv_mode(priv->drm,=0D
+				  DRM_MODE_TV_MODE_PAL_B,=0D
+				  13500 * 1000, 720, 576,=0D
+				  true);=0D
+	KUNIT_ASSERT_NOT_NULL(test, mode);=0D
+=0D
+	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);=0D
+	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);=0D
+=0D
+	/* 64us * 13.5MHz =3D 864 pixels */=0D
+	KUNIT_EXPECT_EQ(test, mode->htotal, 864);=0D
+	KUNIT_EXPECT_EQ(test, mode->vdisplay, 576);=0D
+	KUNIT_EXPECT_EQ(test, mode->vtotal, 625);=0D
+}=0D
+=0D
+static void drm_modes_analog_tv_pal_576i_inlined(struct kunit *test)=0D
+{=0D
+	struct drm_modes_test_priv *priv =3D test->priv;=0D
+	struct drm_display_mode *expected, *mode;=0D
+=0D
+	expected =3D drm_analog_tv_mode(priv->drm,=0D
+				      DRM_MODE_TV_MODE_PAL_B,=0D
+				      13500 * 1000, 720, 576,=0D
+				      true);=0D
+	KUNIT_ASSERT_NOT_NULL(test, expected);=0D
+=0D
+	mode =3D drm_mode_analog_pal_576i(priv->drm);=0D
+	KUNIT_ASSERT_NOT_NULL(test, mode);=0D
+=0D
+	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));=0D
+}=0D
+=0D
+static struct kunit_case drm_modes_analog_tv_tests[] =3D {=0D
+	KUNIT_CASE(drm_modes_analog_tv_ntsc_480i),=0D
+	KUNIT_CASE(drm_modes_analog_tv_ntsc_480i_inlined),=0D
+	KUNIT_CASE(drm_modes_analog_tv_pal_576i),=0D
+	KUNIT_CASE(drm_modes_analog_tv_pal_576i_inlined),=0D
+	{ }=0D
+};=0D
+=0D
+static struct kunit_suite drm_modes_analog_tv_test_suite =3D {=0D
+	.name =3D "drm_modes_analog_tv",=0D
+	.init =3D drm_modes_test_init,=0D
+	.exit =3D drm_modes_test_exit,=0D
+	.test_cases =3D drm_modes_analog_tv_tests,=0D
+};=0D
+=0D
+kunit_test_suites(=0D
+	&drm_modes_analog_tv_test_suite=0D
+);=0D
+MODULE_LICENSE("GPL v2");=0D
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h=0D
index a80ae9639e96..5ccf3d51d313 100644=0D
--- a/include/drm/drm_modes.h=0D
+++ b/include/drm/drm_modes.h=0D
@@ -443,6 +443,23 @@ bool drm_mode_is_420_also(const struct drm_display_inf=
o *display,=0D
 bool drm_mode_is_420(const struct drm_display_info *display,=0D
 		     const struct drm_display_mode *mode);=0D
 =0D
+struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,=0D
+					    enum drm_connector_tv_mode mode,=0D
+					    unsigned long pixel_clock_hz,=0D
+					    unsigned int hdisplay,=0D
+					    unsigned int vdisplay,=0D
+					    bool interlace);=0D
+=0D
+static inline struct drm_display_mode *drm_mode_analog_ntsc_480i(struct dr=
m_device *dev)=0D
+{=0D
+	return drm_analog_tv_mode(dev, DRM_MODE_TV_MODE_NTSC_M, 13500000, 720, 48=
0, true);=0D
+}=0D
+=0D
+static inline struct drm_display_mode *drm_mode_analog_pal_576i(struct drm=
_device *dev)=0D
+{=0D
+	return drm_analog_tv_mode(dev, DRM_MODE_TV_MODE_PAL_B, 13500000, 720, 576=
, true);=0D
+}=0D
+=0D
 struct drm_display_mode *drm_cvt_mode(struct drm_device *dev,=0D
 				      int hdisplay, int vdisplay, int vrefresh,=0D
 				      bool reduced, bool interlaced,=0D
=0D
-- =0D
b4 0.10.0-dev-65ba7=0D
