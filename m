Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA26602676
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0232F10E9F4;
	Tue, 18 Oct 2022 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2AB10E9F4;
 Tue, 18 Oct 2022 08:08:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 0EDFD2B05993;
 Tue, 18 Oct 2022 04:08:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 18 Oct 2022 04:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666080489; x=1666087689; bh=QyIR2mU70I
 1YwkwOLa0CmZ/17qlaxKeUVXrXvltnm30=; b=GFjusIHgj8xz/yi7jFvMKNEQxw
 HZ7+9YtYcFDKPj4XhMSDNdoNg/sq2vcXZOu9JUJQNrnfSNhv3FzbuQxvyTe7zxv6
 HNmaCAy+x3F8INAsxCFyjYbN1zyXSznVuvbVd4WvSDSSfB22mp4BjmYOkJmMCop4
 c1zma+hOzfeHlhisprEz6BF7/WdlcDHPoui4ePgJ9+iTrBn7LuNWHOpfCyU43RMZ
 9MWeUivxIiVvXOW+9NvBgpukWnqglECw5oQu01fWdHAZtkMyAEHB6cdf76bEC7Uc
 fUq5aW+BidlQZg4CgEQ37ngnY/EzqNA1p95Hy5fsAV1QBg65BD9ITLEjG/AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666080489; x=1666087689; bh=QyIR2mU70I1YwkwOLa0CmZ/17qla
 xKeUVXrXvltnm30=; b=ZH1+1s4aJx7OrygMRTnrhV+LMcQ0Fl5Kp6pyvkYoBkNo
 GmwWfybSd1z+VI69F79wLXYaoim/Qfyfzn7n/MB2+IRbKrZ+/b0QOLeRsZgAb8Fd
 8PqGjo137EOY7CpjWJOeILZb5MjokJbqjUopRfiibgZuUB8FSPF0/jVkgsaLmZG8
 6n0wJBtTYqEA+1IaLVqwIbLsA2onk7csRjzUKB8isgB3AEspSi0yKiQX04nzOXNX
 QiiD4owR9mc4e3meKqg462agLHz3WMQCHWoqPbZ7itzrI8V5rg6/UmHyfqxXmP5G
 /cd+qux90phW4qVWeCFzCmteS3SOHvJV9HsRIxHA3w==
X-ME-Sender: <xms:6F5OY6HZgytdMm6Vqyzy8NxLARZpJWI_0b2lwYu5aLlpXTaMlsBOaQ>
 <xme:6F5OY7VrDINVe0nwa0Y4HWj0xhoc3U-yXZYYH5rqOEMWBepziDr6qryZMpsGL7G0i
 uwg_8bQZ_ldVY7eD3M>
X-ME-Received: <xmr:6F5OY0LSSi0uY7NN5F6JAO1Z9rY8338rOwxovMAxprRpD9x04i00D-JrrQI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeludcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffhvedu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6F5OY0E-ftftih6cOybLdHtpHMzyczz1Aqr_zQyRxv2j9OIzvIxqUg>
 <xmx:6F5OYwWs3iqVw9YFSBe8SVI8Gk47k1-kxwFyZmVaKn7vT-3wO295oQ>
 <xmx:6F5OY3NY3rp3gilKugt8Ne3JrajjqLSGe1BvCkrJkzzq1uqDWjql1A>
 <xmx:6V5OY304Z5gl1LgvOk3C5up8PynQd6xXAoo8YLHxpnj8yXiTGpcxLIvPyw4>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 04:08:08 -0400 (EDT)
Date: Tue, 18 Oct 2022 10:08:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH v5 06/22] drm/modes: Add a function to generate analog
 display modes
Message-ID: <20221018080806.mkw4zbzchlatxgwq@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-6-d841cc64fe4b@cerno.tech>
 <30dbbcc8-1d14-0fc8-ed7c-0c3f7d094ea3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bz2m37ekv7hmvzdb"
Content-Disposition: inline
In-Reply-To: <30dbbcc8-1d14-0fc8-ed7c-0c3f7d094ea3@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bz2m37ekv7hmvzdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 16, 2022 at 07:34:12PM +0200, Mateusz Kwiatkowski wrote:
> Hi Maxime & everyone,
>=20
> Sorry for being inactive in the discussions about this patchset for the l=
ast
> couple of weeks.
>=20
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
> > +			  16,
> > +			  PARAM_FIELD(3, 3),
> > +			  PARAM_FIELD(3, 3),
> > +			  PARAM_FIELD(16, 17)),
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
> > +			  12,
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
> > +			   * The back porch starts with post-equalizing
> > +			   * pulses, consisting in 5 short sync pulses
> > +			   * for the even field, 4 for the odd field. In
> > +			   * progressive, it's 5 short syncs.
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
> > +			   *
> > +			   * The entire blanking area is supposed to
> > +			   * take 25 lines, so we also need to account
> > +			   * for the rest of the blanking area that
> > +			   * can't be in either the front porch or sync
> > +			   * period.
> > +			   */
> > +			  PARAM_FIELD(19, 20)),
> > +};
>=20
> Nit: setting vbp limits like that makes it impossible to use
> drm_analog_tv_mode() to generate modes that include the VBI for e.g. emit=
ting
> teletext.
>=20
> This probably doesn't matter, as it can still be created as a custom mode=
 from
> userspace, hence I'm mentioning it as a nit.

Yeah, I think it's out of scope at least for now. Also, the compositor
should probably be aware of the margins being used to put the VBI data,
so expecting userspace to come up with the mode is probably best?

> > +		 * By convention, NSTC (aka 525/60) systems start with
>=20
> Typo: s/NSTC/NTSC/

Fixed, thanks
Maxime

--bz2m37ekv7hmvzdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY05e5QAKCRDj7w1vZxhR
xR8VAQC+375DtcagkAytZVeOEe9aSmsByYFfuLp2Bt0aRSrhEAD/SoTKGvPkbrp3
DYtTf34PAYs3gXueCuNbfrKzWk9/DgM=
=IY6U
-----END PGP SIGNATURE-----

--bz2m37ekv7hmvzdb--
