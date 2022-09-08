Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50925B1AF8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1216F10E61F;
	Thu,  8 Sep 2022 11:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763D10EA96;
 Thu,  8 Sep 2022 11:10:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8DD0C2B05E04;
 Thu,  8 Sep 2022 07:10:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 08 Sep 2022 07:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1662635436; x=
 1662642636; bh=pkjquimhwqmyCS+jHBWUz5fG78f183TLFuqlacXtEg0=; b=f
 nul7kOEg0lzSP6wu62cHlvCm4YJ79iiTaw3iwpSNdDrpRe8nwUTFG5j99dMslo8/
 QtBLRP3xqQ+6f1JxwLMKIkkMqs4l0gayO1B6YAXgc8PBpcbQVXHNS0l4gAUxcEbX
 44n/iYs+wfLhyYOM00zVFb5SH8B1twn/6f23G8NHkuzfJOrudfqPz0QavWZIb3Jw
 Rx6NqyW8bPhXsPLbf9j5Be7ceGLAnp1+gY0Ae3PrWGaDnUECNRkS3AMqav5dykD3
 YwKn3TIv9NoeHXCC1Lo1a00O8m0ESm5/HxNYtqUTQj9cnPifaVwx2CqkZvv/wkA+
 JGJ2767Tafyo7XWO97ORA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662635436; x=
 1662642636; bh=pkjquimhwqmyCS+jHBWUz5fG78f183TLFuqlacXtEg0=; b=W
 NS6Ik33OP7NHpVkm/NMuJzgOjVX6Aal72bzOdt4Qtn2tVh6t84KcyiQD68EfyDxo
 F7JN3OK5m5N5MpLssSUaVLqkus2x2iL5Uf6pXE7Ip2sNbRd+RoVvZDL0+Pt1/jgC
 VRApKXbCJITQujNxc5PXFjgr5u1Lkl86kuXewzdriT7ySwzIlDU/1Zz7si2pWLRT
 Co7fCAMMmsSeT5GF7AlkX80JUK71kZJ2tCzRGIBhX+58fibCK4gdCS/sA4nZEKeH
 xDjsTH7owNe02JATBkx0dRdt6x4hOM6oVRf7PdK7JArq77VKAJikvPFx/QIB27R0
 giBDmHNoHXSVk7/dvj2Xg==
X-ME-Sender: <xms:qs0ZY2zF-IqcFl5a787CIifSJYUybV4CYndhBZmC0M0HBu6asNYccA>
 <xme:qs0ZYyQz0ZykdrRBT2ox9TQ7IlXb92dOnCY2cV1gVVdlqISlF9Whk-kP4xiW1MECA
 U9zj0fMP3YK7gvnlWU>
X-ME-Received: <xmr:qs0ZY4V2lQ3MIVuJqDrrUuAVuIdXSdA2mfbuESu_FlYO-nwupMWZbO20ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtvddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhephedvkeefgfejueelveehkeettefgtdeikeduueejffevgeehieduvedu
 hedttddunecuffhomhgrihhnpegrrhgthhhivhgvrdhorhhgpdhkohhluhhmsghushdrfh
 hipdhhihhnnhgvrhdrihhnfhhopdgsrghtshhotghkshdrtghordhukhenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrh
 hnohdrthgvtghh
X-ME-Proxy: <xmx:q80ZY8hgnu5xx_-0HL899SvW0COUJfSmZcP8x12RgJMsf_NcCP58Uw>
 <xmx:q80ZY4CpBskW6Euz5HCOuVcwKDmC1v0-Fw_k8XT5jC97lb2S5-vKfg>
 <xmx:q80ZY9LHBVdosOygiuRrf0A5NRbWdM8M1fjIhrnfVYKgiqOC5Mhz2Q>
 <xmx:rM0ZYxtz_2IlP3ujyVkY3wiWNeu8DEuDbxp9d_UUDD_jLdP2mmd8q9QW_6s>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 07:10:34 -0400 (EDT)
Date: Thu, 8 Sep 2022 13:10:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20220908111031.ulhpspyzcddvzbna@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <485b38c1-517c-d3fd-c5c0-7136cbae25e2@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <485b38c1-517c-d3fd-c5c0-7136cbae25e2@riseup.net>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 30, 2022 at 10:01:11AM -0300, Ma=EDra Canal wrote:
> On 8/29/22 10:11, Maxime Ripard wrote:
> > Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> > 625-lines modes in their drivers.
> >=20
> > Since those modes are fairly standard, and that we'll need to use them
> > in more places in the future, it makes sense to move their definition
> > into the core framework.
> >=20
> > However, analog display usually have fairly loose timings requirements,
> > the only discrete parameters being the total number of lines and pixel
> > clock frequency. Thus, we created a function that will create a display
> > mode from the standard, the pixel frequency and the active area.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index 304004fb80aa..ee581ee17171 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -116,6 +116,459 @@ void drm_mode_probed_add(struct drm_connector *co=
nnector,
> >  }
> >  EXPORT_SYMBOL(drm_mode_probed_add);
> > =20
> > +enum drm_mode_analog {
> > +	DRM_MODE_ANALOG_NTSC,
> > +	DRM_MODE_ANALOG_PAL,
> > +};
> > +
> > +/*
> > + * The timings come from:
> > + * - https://web.archive.org/web/20220406232708/http://www.kolumbus.fi=
/pami1/video/pal_ntsc.html
> > + * - https://web.archive.org/web/20220406124914/http://martin.hinner.i=
nfo/vga/pal.html
> > + * - https://web.archive.org/web/20220609202433/http://www.batsocks.co=
=2Euk/readme/video_timing.htm
> > + */
> > +#define NTSC_LINE_DURATION_NS		63556U
> > +#define NTSC_LINES_NUMBER		525
> > +
> > +#define NTSC_HBLK_DURATION_TYP_NS	10900U
> > +#define NTSC_HBLK_DURATION_MIN_NS	(NTSC_HBLK_DURATION_TYP_NS - 200)
> > +#define NTSC_HBLK_DURATION_MAX_NS	(NTSC_HBLK_DURATION_TYP_NS + 200)
> > +
> > +#define NTSC_HACT_DURATION_TYP_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_D=
URATION_TYP_NS)
> > +#define NTSC_HACT_DURATION_MIN_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_D=
URATION_MAX_NS)
> > +#define NTSC_HACT_DURATION_MAX_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_D=
URATION_MIN_NS)
> > +
> > +#define NTSC_HFP_DURATION_TYP_NS	1500
> > +#define NTSC_HFP_DURATION_MIN_NS	1270
> > +#define NTSC_HFP_DURATION_MAX_NS	2220
> > +
> > +#define NTSC_HSLEN_DURATION_TYP_NS	4700
> > +#define NTSC_HSLEN_DURATION_MIN_NS	(NTSC_HSLEN_DURATION_TYP_NS - 100)
> > +#define NTSC_HSLEN_DURATION_MAX_NS	(NTSC_HSLEN_DURATION_TYP_NS + 100)
> > +
> > +#define NTSC_HBP_DURATION_TYP_NS	4700
> > +
> > +/*
> > + * I couldn't find the actual tolerance for the back porch, so let's
> > + * just reuse the sync length ones.
> > + */
> > +#define NTSC_HBP_DURATION_MIN_NS	(NTSC_HBP_DURATION_TYP_NS - 100)
> > +#define NTSC_HBP_DURATION_MAX_NS	(NTSC_HBP_DURATION_TYP_NS + 100)
> > +
> > +#define PAL_LINE_DURATION_NS		64000U
> > +#define PAL_LINES_NUMBER		625
> > +
> > +#define PAL_HACT_DURATION_TYP_NS	51950U
> > +#define PAL_HACT_DURATION_MIN_NS	(PAL_HACT_DURATION_TYP_NS - 100)
> > +#define PAL_HACT_DURATION_MAX_NS	(PAL_HACT_DURATION_TYP_NS + 400)
> > +
> > +#define PAL_HBLK_DURATION_TYP_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURA=
TION_TYP_NS)
> > +#define PAL_HBLK_DURATION_MIN_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURA=
TION_MAX_NS)
> > +#define PAL_HBLK_DURATION_MAX_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURA=
TION_MIN_NS)
> > +
> > +#define PAL_HFP_DURATION_TYP_NS		1650
> > +#define PAL_HFP_DURATION_MIN_NS		(PAL_HFP_DURATION_TYP_NS - 100)
> > +#define PAL_HFP_DURATION_MAX_NS		(PAL_HFP_DURATION_TYP_NS + 400)
> > +
> > +#define PAL_HSLEN_DURATION_TYP_NS	4700
> > +#define PAL_HSLEN_DURATION_MIN_NS	(PAL_HSLEN_DURATION_TYP_NS - 200)
> > +#define PAL_HSLEN_DURATION_MAX_NS	(PAL_HSLEN_DURATION_TYP_NS + 200)
> > +
> > +#define PAL_HBP_DURATION_TYP_NS		5700
> > +#define PAL_HBP_DURATION_MIN_NS		(PAL_HBP_DURATION_TYP_NS - 200)
> > +#define PAL_HBP_DURATION_MAX_NS		(PAL_HBP_DURATION_TYP_NS + 200)
> > +
> > +#define PAL_VFP_INTERLACE_LINES		5
> > +#define PAL_VSLEN_INTERLACE_LINES	5
> > +
> > +#define PAL_SHORT_SYNC_DURATION_NS	((2 + 30) * NSEC_PER_USEC)
> > +#define PAL_LONG_SYNC_DURATION_NS	((30 + 2) * NSEC_PER_USEC)
> > +
> > +struct analog_param_field {
> > +	unsigned int even, odd;
> > +};
> > +
> > +#define PARAM_FIELD(_odd, _even)		\
> > +	{ .even =3D _even, .odd =3D _odd }
> > +
> > +struct analog_param_range {
> > +	unsigned int	min, typ, max;
> > +};
> > +
> > +#define PARAM_RANGE(_min, _typ, _max)		\
> > +	{ .min =3D _min, .typ =3D _typ, .max =3D _max }
> > +
> > +struct analog_parameters {
> > +	unsigned int			num_lines;
> > +	unsigned int			line_duration_ns;
> > +
> > +	struct analog_param_range	hact_ns;
> > +	struct analog_param_range	hfp_ns;
> > +	struct analog_param_range	hslen_ns;
> > +	struct analog_param_range	hbp_ns;
> > +	struct analog_param_range	hblk_ns;
> > +
> > +	struct analog_param_field	vfp_lines;
> > +	struct analog_param_field	vslen_lines;
> > +	struct analog_param_field	vbp_lines;
> > +};
> > +
> > +#define TV_MODE_PARAMETER(_mode, _lines, _line_dur, _hact, _hfp, _hsle=
n, _hbp, _hblk, _vfp, _vslen, _vbp) \
> > +	[_mode] =3D {							\
> > +		.num_lines =3D _lines,					\
> > +		.line_duration_ns =3D _line_dur,				\
> > +		.hact_ns =3D _hact,					\
> > +		.hfp_ns =3D _hfp,						\
> > +		.hslen_ns =3D _hslen,					\
> > +		.hbp_ns =3D _hbp,						\
> > +		.hblk_ns =3D _hblk,					\
> > +		.vfp_lines =3D _vfp,					\
> > +		.vslen_lines =3D _vslen,					\
> > +		.vbp_lines =3D _vbp,					\
> > +	}
> > +
> > +const static struct analog_parameters tv_modes_parameters[] =3D {
> > +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_NTSC,
> > +			  NTSC_LINES_NUMBER,
> > +			  NTSC_LINE_DURATION_NS,
> > +			  PARAM_RANGE(NTSC_HACT_DURATION_MIN_NS,
> > +				      NTSC_HACT_DURATION_TYP_NS,
> > +				      NTSC_HACT_DURATION_MAX_NS),
> > +			  PARAM_RANGE(NTSC_HFP_DURATION_MIN_NS,
> > +				      NTSC_HFP_DURATION_TYP_NS,
> > +				      NTSC_HFP_DURATION_MAX_NS),
> > +			  PARAM_RANGE(NTSC_HSLEN_DURATION_MIN_NS,
> > +				      NTSC_HSLEN_DURATION_TYP_NS,
> > +				      NTSC_HSLEN_DURATION_MAX_NS),
> > +			  PARAM_RANGE(NTSC_HBP_DURATION_MIN_NS,
> > +				      NTSC_HBP_DURATION_TYP_NS,
> > +				      NTSC_HBP_DURATION_MAX_NS),
> > +			  PARAM_RANGE(NTSC_HBLK_DURATION_MIN_NS,
> > +				      NTSC_HBLK_DURATION_TYP_NS,
> > +				      NTSC_HBLK_DURATION_MAX_NS),
> > +			  PARAM_FIELD(3, 3),
> > +			  PARAM_FIELD(3, 3),
> > +			  PARAM_FIELD(3, 3)),
> > +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_PAL,
> > +			  PAL_LINES_NUMBER,
> > +			  PAL_LINE_DURATION_NS,
> > +			  PARAM_RANGE(PAL_HACT_DURATION_MIN_NS,
> > +				      PAL_HACT_DURATION_TYP_NS,
> > +				      PAL_HACT_DURATION_MAX_NS),
> > +			  PARAM_RANGE(PAL_HFP_DURATION_MIN_NS,
> > +				      PAL_HFP_DURATION_TYP_NS,
> > +				      PAL_HFP_DURATION_MAX_NS),
> > +			  PARAM_RANGE(PAL_HSLEN_DURATION_MIN_NS,
> > +				      PAL_HSLEN_DURATION_TYP_NS,
> > +				      PAL_HSLEN_DURATION_MAX_NS),
> > +			  PARAM_RANGE(PAL_HBP_DURATION_MIN_NS,
> > +				      PAL_HBP_DURATION_TYP_NS,
> > +				      PAL_HBP_DURATION_MAX_NS),
> > +			  PARAM_RANGE(PAL_HBLK_DURATION_MIN_NS,
> > +				      PAL_HBLK_DURATION_TYP_NS,
> > +				      PAL_HBLK_DURATION_MAX_NS),
> > +
> > +			  /*
> > +			   * The front porch is actually 6 short sync
> > +			   * pulses for the even field, and 5 for the
> > +			   * odd field. Each sync takes half a life so
> > +			   * the odd field front porch is shorter by
> > +			   * half a line.
> > +			   *
> > +			   * In progressive, we're supposed to use 6
> > +			   * pulses, so we're fine there
> > +			   */
> > +			  PARAM_FIELD(3, 2),
> > +
> > +			  /*
> > +			   * The vsync length is 5 long sync pulses,
> > +			   * each field taking half a line. We're
> > +			   * shorter for both fields by half a line.
> > +			   *
> > +			   * In progressive, we're supposed to use 5
> > +			   * pulses, so we're off by half
> > +			   * a line.
> > +			   *
> > +			   * In interlace, we're now off by half a line
> > +			   * for the even field and one line for the odd
> > +			   * field.
> > +			   */
> > +			  PARAM_FIELD(3, 3),
> > +
> > +			  /*
> > +			   * The back porch is actually 5 short sync
> > +			   * pulses for the even field, 4 for the odd
> > +			   * field. In progressive, it's 5 short syncs.
> > +			   *
> > +			   * In progressive, we thus have 2.5 lines,
> > +			   * plus the 0.5 line we were missing
> > +			   * previously, so we should use 3 lines.
> > +			   *
> > +			   * In interlace, the even field is in the
> > +			   * exact same case than progressive. For the
> > +			   * odd field, we should be using 2 lines but
> > +			   * we're one line short, so we'll make up for
> > +			   * it here by using 3.
> > +			   */
> > +			  PARAM_FIELD(3, 3)),
> > +};
> > +
> > +static int fill_analog_mode(struct drm_display_mode *mode,
> > +			    const struct analog_parameters *params,
> > +			    unsigned long pixel_clock_hz,
> > +			    unsigned int hactive,
> > +			    unsigned int vactive,
> > +			    bool interlace)
> > +{
> > +	unsigned long pixel_duration_ns =3D NSEC_PER_SEC / pixel_clock_hz;
> > +	unsigned long long htotal;
> > +	unsigned int vtotal;
> > +	unsigned int max_hact, hact_duration_ns;
> > +	unsigned int hblk, hblk_duration_ns;
> > +	unsigned int hfp, hfp_min, hfp_duration_ns;
> > +	unsigned int hslen, hslen_duration_ns;
> > +	unsigned int hbp, hbp_min, hbp_duration_ns;
> > +	unsigned int porches, porches_duration_ns;
> > +	unsigned int vfp, vfp_min;
> > +	unsigned int vbp, vbp_min;
> > +	unsigned int vslen;
> > +	int porches_rem;
> > +	bool strict =3D true;
> > +
> > +	max_hact =3D params->hact_ns.max / pixel_duration_ns;
> > +	if (pixel_clock_hz =3D=3D 13500000 && hactive > max_hact && hactive <=
=3D 720)
> > +		strict =3D false;
> > +
> > +	/*
> > +	 * Our pixel duration is going to be round down by the division,
> > +	 * so rounding up is probably going to introduce even more
> > +	 * deviation.
> > +	 */
> > +	htotal =3D params->line_duration_ns * pixel_clock_hz / NSEC_PER_SEC;
> > +
> > +	hact_duration_ns =3D hactive * pixel_duration_ns;
> > +	if (strict &&
> > +	    (hact_duration_ns < params->hact_ns.min ||
> > +	     hact_duration_ns > params->hact_ns.max)) {
> > +		DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, m=
ax %u)\n",
> > +			  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
> > +		return -EINVAL;
> > +	}
> > +
> > +	hblk =3D htotal - hactive;
> > +	hblk_duration_ns =3D hblk * pixel_duration_ns;
> > +	if (strict &&
> > +	    (hblk_duration_ns < params->hblk_ns.min ||
> > +	     hblk_duration_ns > params->hblk_ns.max)) {
> > +		DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max =
%u)\n",
> > +			  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
> > +		return -EINVAL;
> > +	}
> > +
> > +	hslen =3D DIV_ROUND_UP(params->hslen_ns.typ, pixel_duration_ns);
> > +	hslen_duration_ns =3D hslen * pixel_duration_ns;
> > +	if (strict &&
> > +	    (hslen_duration_ns < params->hslen_ns.min ||
> > +	     hslen_duration_ns > params->hslen_ns.max)) {
> > +		DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\=
n",
> > +			  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
> > +		return -EINVAL;
> > +	}
> > +
> > +	porches =3D hblk - hslen;
> > +	porches_duration_ns =3D porches * pixel_duration_ns;
> > +	if (strict &&
> > +	    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) =
||
> > +	     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))=
) {
> > +		DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_dur=
ation_ns);
> > +		return -EINVAL;
> > +	}
> > +
> > +	hfp_min =3D DIV_ROUND_UP(params->hfp_ns.min, pixel_duration_ns);
> > +	hbp_min =3D DIV_ROUND_UP(params->hbp_ns.min, pixel_duration_ns);
> > +	porches_rem =3D porches - hfp_min - hbp_min;
> > +
> > +	hfp =3D hfp_min + DIV_ROUND_UP(porches_rem, 2);
> > +	hfp_duration_ns =3D hfp * pixel_duration_ns;
> > +	if (strict &&
> > +	    (hfp_duration_ns < params->hfp_ns.min ||
> > +	     hfp_duration_ns > params->hfp_ns.max)) {
> > +		DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, m=
ax %u)\n",
> > +			  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
> > +		return -EINVAL;
> > +	}
> > +
> > +	hbp =3D porches - hfp;
> > +	hbp_duration_ns =3D hbp * pixel_duration_ns;
> > +	if (strict &&
> > +	    (hbp_duration_ns < params->hbp_ns.min ||
> > +	     hbp_duration_ns > params->hbp_ns.max)) {
> > +		DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, ma=
x %u)\n",
> > +			  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (htotal !=3D (hactive + hfp + hslen + hbp))
> > +		return -EINVAL;
> > +
> > +	mode->clock =3D pixel_clock_hz / 1000;
> > +	mode->hdisplay =3D hactive;
> > +	mode->hsync_start =3D hactive + hfp;
> > +	mode->hsync_end =3D hactive + hfp + hslen;
> > +	mode->htotal =3D hactive + hfp + hslen + hbp;
> > +
> > +	if (interlace) {
> > +		vfp_min =3D params->vfp_lines.even + params->vfp_lines.odd;
> > +		vbp_min =3D params->vbp_lines.even + params->vbp_lines.odd;
> > +		vslen =3D params->vslen_lines.even + params->vslen_lines.odd;
> > +	} else {
> > +		/*
> > +		 * By convention, NSTC (aka 525/60) systems start with
> > +		 * the even field, but PAL (aka 625/50) systems start
> > +		 * with the odd one.
> > +		 *
> > +		 * PAL systems also have asymetric timings between the
> > +		 * even and odd field, while NTSC is symetric.
> > +		 *
> > +		 * Moreover, if we want to create a progressive mode for
> > +		 * PAL, we need to use the odd field timings.
> > +		 *
> > +		 * Since odd =3D=3D even for NTSC, we can just use the odd
> > +		 * one all the time to simplify the code a bit.
> > +		 */
> > +		vfp_min =3D params->vfp_lines.odd;
> > +		vbp_min =3D params->vbp_lines.odd;
> > +		vslen =3D params->vslen_lines.odd;
> > +	}
> > +
> > +	porches =3D params->num_lines - vactive - vslen;
> > +	porches_rem =3D porches - vfp_min - vbp_min;
> > +
> > +	vfp =3D vfp_min + (porches_rem / 2);
> > +	vbp =3D porches - vfp;
> > +
> > +	vtotal =3D vactive + vfp + vslen + vbp;
> > +	if (params->num_lines !=3D vtotal) {
> > +		DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
> > +			  vtotal, params->num_lines);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mode->vdisplay =3D vactive;
> > +	mode->vsync_start =3D vactive + vfp;
> > +	mode->vsync_end =3D vactive + vfp + vslen;
> > +	mode->vtotal =3D vactive + vfp + vslen + vbp;
> > +
> > +	mode->type =3D DRM_MODE_TYPE_DRIVER;
> > +	mode->flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC;
> > +	if (interlace)
> > +		mode->flags |=3D DRM_MODE_FLAG_INTERLACE;
> > +
> > +	drm_mode_set_name(mode);
> > +
> > +	if (mode->vtotal !=3D params->num_lines)
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_analog_tv_mode - create a display mode for an analog TV
> > + * @dev: drm device
> > + * @tv_mode: TV Mode standard to create a mode for. See DRM_MODE_TV_MO=
DE_*.
> > + * @pixel_clock_hz: Pixel Clock Frequency, in Hertz
> > + * @hdisplay: hdisplay size
> > + * @vdisplay: vdisplay size
> > + * @interlace: whether to compute an interlaced mode
> > + *
> > + * This function creates a struct drm_display_mode instance suited for
> > + * an analog TV output, for one of the usual analog TV mode.
> > + *
> > + * Note that @hdisplay is larger than the usual constraints for the PAL
> > + * and NTSC timings, and we'll choose to ignore most timings constrain=
ts
> > + * to reach those resolutions.
> > + *
> > + * Returns:
> > + *
> > + * A pointer to the mode, allocated with drm_mode_create(). Returns NU=
LL
> > + * on error.
> > + */
> > +struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
> > +					    enum drm_connector_tv_mode tv_mode,
> > +					    unsigned long pixel_clock_hz,
> > +					    unsigned int hdisplay,
> > +					    unsigned int vdisplay,
> > +					    bool interlace)
> > +{
> > +	struct drm_display_mode *mode;
> > +	enum drm_mode_analog analog;
> > +	int ret;
> > +
> > +	switch (tv_mode) {
> > +	case DRM_MODE_TV_MODE_NTSC_443:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_NTSC_J:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_NTSC_M:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_60:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_M:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_60:
> > +		analog =3D DRM_MODE_ANALOG_NTSC;
> > +		break;
> > +
> > +	case DRM_MODE_TV_MODE_PAL_B:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_D:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_G:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_H:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_I:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_N:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_PAL_NC:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_B:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_D:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_G:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_K:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_K1:
> > +		fallthrough;
> > +	case DRM_MODE_TV_MODE_SECAM_L:
> > +		analog =3D DRM_MODE_ANALOG_PAL;
> > +		break;
> > +
> > +	default:
> > +		return NULL;
> > +	}
> > +
> > +	mode =3D drm_mode_create(dev);
> > +	if (!mode)
> > +		return NULL;
> > +
> > +	ret =3D fill_analog_mode(mode,
> > +			       &tv_modes_parameters[analog],
> > +			       pixel_clock_hz, hdisplay, vdisplay, interlace);
> > +	if (ret)
> > +		goto err_free_mode;
> > +
> > +	return mode;
> > +
> > +err_free_mode:
> > +	drm_mode_destroy(dev, mode);
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL(drm_analog_tv_mode);
> > +
> >  /**
> >   * drm_cvt_mode -create a modeline based on the CVT algorithm
> >   * @dev: drm device
> > diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Mak=
efile
> > index b29ef1085cad..b22ac96fdd65 100644
> > --- a/drivers/gpu/drm/tests/Makefile
> > +++ b/drivers/gpu/drm/tests/Makefile
> > @@ -10,5 +10,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
> >  	drm_framebuffer_test.o \
> >  	drm_kunit_helpers.o \
> >  	drm_mm_test.o \
> > +	drm_modes_test.o \
> >  	drm_plane_helper_test.o \
> >  	drm_rect_test.o
> > diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/t=
ests/drm_modes_test.c
> > new file mode 100644
> > index 000000000000..87d398fcb99e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tests/drm_modes_test.c
> > @@ -0,0 +1,131 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Kunit test for drm_modes functions
> > + */
> > +
> > +#include <kunit/test.h>
> > +
> > +#include <drm/drm_modes.h>
> > +
> > +#include "drm_kunit_helpers.h"
> > +
> > +struct drm_modes_test_priv {
> > +	struct drm_device *drm;
> > +};
> > +
> > +static int drm_modes_test_init(struct kunit *test)
> > +{
> > +	struct drm_modes_test_priv *priv;
> > +
> > +	priv =3D kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
>=20
> I believe it would be nicer to use KUNIT_ASSERT_NOT_NULL here, instead
> of returning a error.
>=20
> > +	test->priv =3D priv;
> > +
> > +	priv->drm =3D drm_kunit_device_init("drm-modes-test");
> > +	if (IS_ERR(priv->drm))
> > +		return PTR_ERR(priv->drm);
>=20
> Here you could use KUNIT_ASSERT_NOT_ERR_OR_NULL.
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static void drm_modes_test_exit(struct kunit *test)
> > +{
> > +	struct drm_modes_test_priv *priv =3D test->priv;
> > +
> > +	drm_kunit_device_exit(priv->drm);
> > +}
> > +
> > +static void drm_modes_analog_tv_ntsc_480i(struct kunit *test)
> > +{
> > +	struct drm_modes_test_priv *priv =3D test->priv;
> > +	struct drm_display_mode *mode;
> > +
> > +	mode =3D drm_analog_tv_mode(priv->drm,
> > +				  DRM_MODE_TV_MODE_NTSC_M,
> > +				  13500 * 1000, 720, 480,
> > +				  true);
> > +	KUNIT_ASSERT_NOT_NULL(test, mode);
> > +
> > +	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 60);
> > +	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> > +
> > +	/* 63.556us * 13.5MHz =3D 858 pixels */
> > +	KUNIT_EXPECT_EQ(test, mode->htotal, 858);
> > +	KUNIT_EXPECT_EQ(test, mode->vdisplay, 480);
> > +	KUNIT_EXPECT_EQ(test, mode->vtotal, 525);
> > +}
>=20
> I would be nice to see this test and drm_modes_analog_tv_pal_576i
> parametrized.

I'm not sure it's that useful here, the tests are trivial and there's
not much to share between the two tests, since pretty much all the data
are different.

I've changed the command line parsing to use a parameterized test though

Thanks!
Maxime
