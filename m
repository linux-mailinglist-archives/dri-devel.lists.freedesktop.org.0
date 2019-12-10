Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0C11919A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EB06E923;
	Tue, 10 Dec 2019 20:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 20:13:05 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76F46E923
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:13:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 12:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; d="scan'208";a="210545641"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 10 Dec 2019 12:05:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Dec 2019 22:05:55 +0200
Date: Tue, 10 Dec 2019 22:05:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tom Anderson <thomasanderson@google.com>
Subject: Re: [PATCH] drm/edid: Add modes from CTA-861-G
Message-ID: <20191210200555.GE1208@intel.com>
References: <20191123055053.154550-1-thomasanderson@google.com>
 <fcba3169-13a1-6368-60c6-bfc9d9ad62c1@amd.com>
 <c1870c44-466f-cbc3-25fa-47c3f4ec458d@amd.com>
 <20191202233246.GA49251@google.com>
 <20191203125312.GM1208@intel.com>
 <20191210191335.GA24292@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210191335.GA24292@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Sean Pau <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>,
 dri-devel@lists.freedesktop.org, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 11:13:35AM -0800, Tom Anderson wrote:
> On Tue, Dec 03, 2019 at 02:53:12PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Dec 02, 2019 at 03:32:46PM -0800, Tom Anderson wrote:
> > > On Mon, Nov 25, 2019 at 01:42:00PM -0500, Bhawanpreet Lakha wrote:
> > > > Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > > =

> > > Thank you for the review. +Ville has brought to my attention 978f6b06=
93c7 which
> > > added modes up to 128 which was part of a recent merge, so I didn't s=
een the
> > > changes until now.
> > > =

> > > Ville also pointed out [1] which achieves the same thing, but has bee=
n in limbo.
> > > At any rate, I'll be sending out a rebased v2 patch. I don't mind whi=
ch patch
> > > lands, all I want is for my 8K display to work :)
> > =

> > I'd just need someone to slap on a reviwed-by for the few patches
> > that are missing it. I'd rather not waste ~13 KiB of memory for
> > those 128-192 dummy modes, which is why I prefer my apporach.
> =

> Like I said, I'm fine with either patch landing. But in your patch, pleas=
e merge
> the drm_connector.h changes from here, otherwise there's a buffer overflo=
w.

Ouch. Good catch. Didn't even notice that one. Can you send that
hunk as a separate patch and review the remaining patches in my
series so I could just push it all?

> =

> > =

> > > =

> > > [1] https://patchwork.freedesktop.org/series/63555/
> > > =

> > > > =

> > > > On 2019-11-25 1:14 p.m., Harry Wentland wrote:
> > > > > +Bhawan who has been looking at this from our side.
> > > > > =

> > > > > Harry
> > > > > =

> > > > > On 2019-11-23 12:50 a.m., Thomas Anderson wrote:
> > > > > > The new modes are needed for exotic displays such as 8K. Verifi=
ed that
> > > > > > modes like 8K60 and 4K120 are properly obtained from a Samsung =
Q900R.
> > > > > > =

> > > > > > Signed-off-by: Thomas Anderson <thomasanderson@google.com>
> > > > > > ---
> > > > > >   drivers/gpu/drm/drm_edid.c  | 388 +++++++++++++++++++++++++++=
++++++++-
> > > > > >   include/drm/drm_connector.h |  16 +-
> > > > > >   2 files changed, 391 insertions(+), 13 deletions(-)
> > > > > > =

> > > > > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_e=
did.c
> > > > > > index 6b0177112e18..ff5c928516fb 100644
> > > > > > --- a/drivers/gpu/drm/drm_edid.c
> > > > > > +++ b/drivers/gpu/drm/drm_edid.c
> > > > > > @@ -1278,6 +1278,374 @@ static const struct drm_display_mode ed=
id_cea_modes[] =3D {
> > > > > >   		   4104, 4400, 0, 2160, 2168, 2178, 2250, 0,
> > > > > >   		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > >   	  .vrefresh =3D 60, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 108 - 1280x720@48Hz 16:9 */
> > > > > > +	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 90000, 1280, 224=
0,
> > > > > > +		   2280, 2500, 0, 720, 725, 730, 750, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 109 - 1280x720@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 90000, 1280, 224=
0,
> > > > > > +		   2280, 2500, 0, 720, 725, 730, 750, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 110 - 1680x720@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("1680x720", DRM_MODE_TYPE_DRIVER, 99000, 1680, 249=
0,
> > > > > > +		   2530, 2750, 0, 720, 725, 730, 750, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 111 - 1920x1080@48Hz 16:9 */
> > > > > > +	{ DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 148500, 1920, 2=
558,
> > > > > > +		   2602, 2750, 0, 1080, 1084, 1089, 1125, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 112 - 1920x1080@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("1920x1080", DRM_MODE_TYPE_DRIVER, 148500, 1920, 2=
558,
> > > > > > +		   2602, 2750, 0, 1080, 1084, 1089, 1125, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 113 - 2560x1080@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("2560x1080", DRM_MODE_TYPE_DRIVER, 198000, 2560, 3=
558,
> > > > > > +		   3602, 3750, 0, 1080, 1084, 1089, 1100, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 114 - 3840x2160@48Hz 16:9 */
> > > > > > +	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 594000, 3840, 5=
116,
> > > > > > +		   5204, 5500, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 115 - 4096x2160@48Hz 256:135 */
> > > > > > +	{ DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 594000, 4096, 5=
116,
> > > > > > +		   5204, 5500, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48,
> > > > > > +	  .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_256_135, },
> > > > > > +	/* 116 - 3840x2160@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 594000, 3840, 5=
116,
> > > > > > +		   5204, 5500, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 117 - 3840x2160@100Hz 16:9 */
> > > > > > +	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 1188000, 3840, =
4896,
> > > > > > +		   4984, 5280, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_16_9, },
> > > > > > +	/* 118 - 3840x2160@120Hz 16:9 */
> > > > > > +	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 1188000, 3840, =
4016,
> > > > > > +		   4104, 4400, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_16_9, },
> > > > > > +	/* 119 - 3840x2160@100Hz 64:27 */
> > > > > > +	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 1188000, 3840, =
4896,
> > > > > > +		   4984, 5280, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 120 - 3840x2160@120Hz 64:27 */
> > > > > > +	{ DRM_MODE("3840x2160", DRM_MODE_TYPE_DRIVER, 1188000, 3840, =
4016,
> > > > > > +		   4104, 4400, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 121 - 5120x2160@24Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 396000, 5120, 7=
116,
> > > > > > +		   7204, 7500, 0, 2160, 2168, 2178, 2200, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 24, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 122 - 5120x2160@25Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 396000, 5120, 6=
816,
> > > > > > +		   6904, 7200, 0, 2160, 2168, 2178, 2200, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 25, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 123 - 5120x2160@30Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 396000, 5120, 5=
784,
> > > > > > +		   5872, 6000, 0, 2160, 2168, 2178, 2200, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 30, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 124 - 5120x2160@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 742500, 5120, 5=
866,
> > > > > > +		   5954, 6250, 0, 2160, 2168, 2178, 2475, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 125 - 5120x2160@50Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 742500, 5120, 6=
216,
> > > > > > +		   6304, 6600, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 50, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 126 - 5120x2160@60Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 742500, 5120, 5=
284,
> > > > > > +		   5372, 5500, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 60, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 127 - 5120x2160@100Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 1485000, 5120, =
6216,
> > > > > > +		   6304, 6600, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 128 - dummy */
> > > > > > +	{ },
> > > > > > +	/* 129 - reserved for native timing 1 */
> > > > > > +	{ },
> > > > > > +	/* 130 - reserved for native timing 2 */
> > > > > > +	{ },
> > > > > > +	/* 131 - reserved for native timing 3 */
> > > > > > +	{ },
> > > > > > +	/* 132 - reserved for native timing 4 */
> > > > > > +	{ },
> > > > > > +	/* 133 - reserved for native timing 5 */
> > > > > > +	{ },
> > > > > > +	/* 134 - reserved for native timing 6 */
> > > > > > +	{ },
> > > > > > +	/* 135 - reserved for native timing 7 */
> > > > > > +	{ },
> > > > > > +	/* 136 - reserved for native timing 8 */
> > > > > > +	{ },
> > > > > > +	/* 137 - reserved for native timing 9 */
> > > > > > +	{ },
> > > > > > +	/* 138 - reserved for native timing 10 */
> > > > > > +	{ },
> > > > > > +	/* 139 - reserved for native timing 11 */
> > > > > > +	{ },
> > > > > > +	/* 140 - reserved for native timing 12 */
> > > > > > +	{ },
> > > > > > +	/* 141 - reserved for native timing 13 */
> > > > > > +	{ },
> > > > > > +	/* 142 - reserved for native timing 14 */
> > > > > > +	{ },
> > > > > > +	/* 143 - reserved for native timing 15 */
> > > > > > +	{ },
> > > > > > +	/* 144 - reserved for native timing 16 */
> > > > > > +	{ },
> > > > > > +	/* 145 - reserved for native timing 17 */
> > > > > > +	{ },
> > > > > > +	/* 146 - reserved for native timing 18 */
> > > > > > +	{ },
> > > > > > +	/* 147 - reserved for native timing 19 */
> > > > > > +	{ },
> > > > > > +	/* 148 - reserved for native timing 20 */
> > > > > > +	{ },
> > > > > > +	/* 149 - reserved for native timing 21 */
> > > > > > +	{ },
> > > > > > +	/* 150 - reserved for native timing 22 */
> > > > > > +	{ },
> > > > > > +	/* 151 - reserved for native timing 23 */
> > > > > > +	{ },
> > > > > > +	/* 152 - reserved for native timing 24 */
> > > > > > +	{ },
> > > > > > +	/* 153 - reserved for native timing 25 */
> > > > > > +	{ },
> > > > > > +	/* 154 - reserved for native timing 26 */
> > > > > > +	{ },
> > > > > > +	/* 155 - reserved for native timing 27 */
> > > > > > +	{ },
> > > > > > +	/* 156 - reserved for native timing 28 */
> > > > > > +	{ },
> > > > > > +	/* 157 - reserved for native timing 29 */
> > > > > > +	{ },
> > > > > > +	/* 158 - reserved for native timing 30 */
> > > > > > +	{ },
> > > > > > +	/* 159 - reserved for native timing 31 */
> > > > > > +	{ },
> > > > > > +	/* 160 - reserved for native timing 32 */
> > > > > > +	{ },
> > > > > > +	/* 161 - reserved for native timing 33 */
> > > > > > +	{ },
> > > > > > +	/* 162 - reserved for native timing 34 */
> > > > > > +	{ },
> > > > > > +	/* 163 - reserved for native timing 35 */
> > > > > > +	{ },
> > > > > > +	/* 164 - reserved for native timing 36 */
> > > > > > +	{ },
> > > > > > +	/* 165 - reserved for native timing 37 */
> > > > > > +	{ },
> > > > > > +	/* 166 - reserved for native timing 38 */
> > > > > > +	{ },
> > > > > > +	/* 167 - reserved for native timing 39 */
> > > > > > +	{ },
> > > > > > +	/* 168 - reserved for native timing 40 */
> > > > > > +	{ },
> > > > > > +	/* 169 - reserved for native timing 41 */
> > > > > > +	{ },
> > > > > > +	/* 170 - reserved for native timing 42 */
> > > > > > +	{ },
> > > > > > +	/* 171 - reserved for native timing 43 */
> > > > > > +	{ },
> > > > > > +	/* 172 - reserved for native timing 44 */
> > > > > > +	{ },
> > > > > > +	/* 173 - reserved for native timing 45 */
> > > > > > +	{ },
> > > > > > +	/* 174 - reserved for native timing 46 */
> > > > > > +	{ },
> > > > > > +	/* 175 - reserved for native timing 47 */
> > > > > > +	{ },
> > > > > > +	/* 176 - reserved for native timing 48 */
> > > > > > +	{ },
> > > > > > +	/* 177 - reserved for native timing 49 */
> > > > > > +	{ },
> > > > > > +	/* 178 - reserved for native timing 50 */
> > > > > > +	{ },
> > > > > > +	/* 179 - reserved for native timing 51 */
> > > > > > +	{ },
> > > > > > +	/* 180 - reserved for native timing 52 */
> > > > > > +	{ },
> > > > > > +	/* 181 - reserved for native timing 53 */
> > > > > > +	{ },
> > > > > > +	/* 182 - reserved for native timing 54 */
> > > > > > +	{ },
> > > > > > +	/* 183 - reserved for native timing 55 */
> > > > > > +	{ },
> > > > > > +	/* 184 - reserved for native timing 56 */
> > > > > > +	{ },
> > > > > > +	/* 185 - reserved for native timing 57 */
> > > > > > +	{ },
> > > > > > +	/* 186 - reserved for native timing 58 */
> > > > > > +	{ },
> > > > > > +	/* 187 - reserved for native timing 59 */
> > > > > > +	{ },
> > > > > > +	/* 188 - reserved for native timing 60 */
> > > > > > +	{ },
> > > > > > +	/* 189 - reserved for native timing 61 */
> > > > > > +	{ },
> > > > > > +	/* 190 - reserved for native timing 62 */
> > > > > > +	{ },
> > > > > > +	/* 191 - reserved for native timing 63 */
> > > > > > +	{ },
> > > > > > +	/* 192 - reserved for native timing 64 */
> > > > > > +	{ },
> > > > > > +	/* 193 - 5120x2160@120Hz 64:27 */
> > > > > > +	{ DRM_MODE("5120x2160", DRM_MODE_TYPE_DRIVER, 1485000, 5120, =
5284,
> > > > > > +		   5372, 5500, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 194 - 7680x4320@24Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, =
10232,
> > > > > > +		   10408, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 24, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 195 - 7680x4320@25Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, =
10032,
> > > > > > +		   10208, 10800, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 25, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 196 - 7680x4320@30Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, =
8232,
> > > > > > +		   8408, 9000, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 30, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 197 - 7680x4320@48Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 2376000, 7680, =
10232,
> > > > > > +		   10408, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 198 - 7680x4320@50Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 2376000, 7680, =
10032,
> > > > > > +		   10208, 10800, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 50, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 199 - 7680x4320@60Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 2376000, 7680, =
8232,
> > > > > > +		   8408, 9000, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 60, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_16_9, },
> > > > > > +	/* 200 - 7680x4320@100Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 4752000, 7680, =
9792,
> > > > > > +		   9968, 10560, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_16_9, },
> > > > > > +	/* 201 - 7680x4320@120Hz 16:9 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 4752000, 7680, =
8032,
> > > > > > +		   8208, 8800, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_16_9, },
> > > > > > +	/* 202 - 7680x4320@24Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, =
10232,
> > > > > > +		   10408, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 24, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 203 - 7680x4320@25Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, =
10032,
> > > > > > +		   10208, 10800, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 25, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 204 - 7680x4320@30Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 1188000, 7680, =
8232,
> > > > > > +		   8408, 9000, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 30, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 205 - 7680x4320@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 2376000, 7680, =
10232,
> > > > > > +		   10408, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 206 - 7680x4320@50Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 2376000, 7680, =
10032,
> > > > > > +		   10208, 10800, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 50, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 207 - 7680x4320@60Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 2376000, 7680, =
8232,
> > > > > > +		   8408, 9000, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 60, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 208 - 7680x4320@100Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 4752000, 7680, =
9792,
> > > > > > +		   9968, 10560, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 209 - 7680x4320@120Hz 64:27 */
> > > > > > +	{ DRM_MODE("7680x4320", DRM_MODE_TYPE_DRIVER, 4752000, 7680, =
8032,
> > > > > > +		   8208, 8800, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 210 - 10240x4320@24Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 1485000, 10240=
, 11732,
> > > > > > +		   11908, 12500, 0, 4320, 4336, 4356, 4950, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 24, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 211 - 10240x4320@25Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 1485000, 10240=
, 12732,
> > > > > > +		   12908, 13500, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 25, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 212 - 10240x4320@30Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 1485000, 10240=
, 10528,
> > > > > > +		   10704, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 30, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 213 - 10240x4320@48Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 2970000, 10240=
, 11732,
> > > > > > +		   11908, 12500, 0, 4320, 4336, 4356, 4950, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 48, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 214 - 10240x4320@50Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 2970000, 10240=
, 12732,
> > > > > > +		   12908, 13500, 0, 4320, 4336, 4356, 4400, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 50, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 215 - 10240x4320@60Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 2970000, 10240=
, 10528,
> > > > > > +		   10704, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 60, .picture_aspect_ratio =3D HDMI_PICTURE_AS=
PECT_64_27, },
> > > > > > +	/* 216 - 10240x4320@100Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 5940000, 10240=
, 12432,
> > > > > > +		   12608, 13200, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 217 - 10240x4320@120Hz 64:27 */
> > > > > > +	{ DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 5940000, 10240=
, 10528,
> > > > > > +		   10704, 11000, 0, 4320, 4336, 4356, 4500, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120, .picture_aspect_ratio =3D HDMI_PICTURE_A=
SPECT_64_27, },
> > > > > > +	/* 218 - 4096x2160@100Hz 256:135 */
> > > > > > +	{ DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 1188000, 4096, =
4896,
> > > > > > +		   4984, 5280, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 100,
> > > > > > +	  .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_256_135, },
> > > > > > +	/* 219 - 4096x2160@120Hz 256:135 */
> > > > > > +	{ DRM_MODE("4096x2160", DRM_MODE_TYPE_DRIVER, 1188000, 4096, =
4184,
> > > > > > +		   4272, 4400, 0, 2160, 2168, 2178, 2250, 0,
> > > > > > +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> > > > > > +	  .vrefresh =3D 120,
> > > > > > +	  .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_256_135, },
> > > > > >   };
> > > > > >   /*
> > > > > > @@ -3030,6 +3398,12 @@ cea_mode_alternate_timings(u8 vic, struc=
t drm_display_mode *mode)
> > > > > >   	return false;
> > > > > >   }
> > > > > > +static bool drm_valid_cea_vic(u8 vic)
> > > > > > +{
> > > > > > +	return (vic > 0 && vic < 128) ||
> > > > > > +	       (vic > 192 && vic < ARRAY_SIZE(edid_cea_modes));
> > > > > > +}
> > > > > > +
> > > > > >   static u8 drm_match_cea_mode_clock_tolerance(const struct drm=
_display_mode *to_match,
> > > > > >   					     unsigned int clock_tolerance)
> > > > > >   {
> > > > > > @@ -3046,6 +3420,9 @@ static u8 drm_match_cea_mode_clock_tolera=
nce(const struct drm_display_mode *to_m
> > > > > >   		struct drm_display_mode cea_mode =3D edid_cea_modes[vic];
> > > > > >   		unsigned int clock1, clock2;
> > > > > > +		if (!drm_valid_cea_vic(vic))
> > > > > > +			continue;
> > > > > > +
> > > > > >   		/* Check both 60Hz and 59.94Hz */
> > > > > >   		clock1 =3D cea_mode.clock;
> > > > > >   		clock2 =3D cea_mode_alternate_clock(&cea_mode);
> > > > > > @@ -3085,6 +3462,9 @@ u8 drm_match_cea_mode(const struct drm_di=
splay_mode *to_match)
> > > > > >   		struct drm_display_mode cea_mode =3D edid_cea_modes[vic];
> > > > > >   		unsigned int clock1, clock2;
> > > > > > +		if (!drm_valid_cea_vic(vic))
> > > > > > +			continue;
> > > > > > +
> > > > > >   		/* Check both 60Hz and 59.94Hz */
> > > > > >   		clock1 =3D cea_mode.clock;
> > > > > >   		clock2 =3D cea_mode_alternate_clock(&cea_mode);
> > > > > > @@ -3103,11 +3483,6 @@ u8 drm_match_cea_mode(const struct drm_d=
isplay_mode *to_match)
> > > > > >   }
> > > > > >   EXPORT_SYMBOL(drm_match_cea_mode);
> > > > > > -static bool drm_valid_cea_vic(u8 vic)
> > > > > > -{
> > > > > > -	return vic > 0 && vic < ARRAY_SIZE(edid_cea_modes);
> > > > > > -}
> > > > > > -
> > > > > >   /**
> > > > > >    * drm_get_cea_aspect_ratio - get the picture aspect ratio co=
rresponding to
> > > > > >    * the input VIC from the CEA mode list
> > > > > > @@ -3117,6 +3492,9 @@ static bool drm_valid_cea_vic(u8 vic)
> > > > > >    */
> > > > > >   enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 vi=
deo_code)
> > > > > >   {
> > > > > > +	if (!drm_valid_cea_vic(video_code))
> > > > > > +		return HDMI_PICTURE_ASPECT_NONE;
> > > > > > +
> > > > > >   	return edid_cea_modes[video_code].picture_aspect_ratio;
> > > > > >   }
> > > > > >   EXPORT_SYMBOL(drm_get_cea_aspect_ratio);
> > > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_conn=
ector.h
> > > > > > index 681cb590f952..0a90efa0246e 100644
> > > > > > --- a/include/drm/drm_connector.h
> > > > > > +++ b/include/drm/drm_connector.h
> > > > > > @@ -188,19 +188,19 @@ struct drm_hdmi_info {
> > > > > >   	/**
> > > > > >   	 * @y420_vdb_modes: bitmap of modes which can support ycbcr4=
20
> > > > > > -	 * output only (not normal RGB/YCBCR444/422 outputs). There a=
re total
> > > > > > -	 * 107 VICs defined by CEA-861-F spec, so the size is 128 bit=
s to map
> > > > > > -	 * upto 128 VICs;
> > > > > > +	 * output only (not normal RGB/YCBCR444/422 outputs). The max=
 VIC
> > > > > > +	 * defined by the CEA-861-G spec is 219, so the size is 256 b=
its to map
> > > > > > +	 * upto 256 VICs.
> > > > > >   	 */
> > > > > > -	unsigned long y420_vdb_modes[BITS_TO_LONGS(128)];
> > > > > > +	unsigned long y420_vdb_modes[BITS_TO_LONGS(256)];
> > > > > >   	/**
> > > > > >   	 * @y420_cmdb_modes: bitmap of modes which can support ycbcr=
420
> > > > > > -	 * output also, along with normal HDMI outputs. There are tot=
al 107
> > > > > > -	 * VICs defined by CEA-861-F spec, so the size is 128 bits to=
 map upto
> > > > > > -	 * 128 VICs;
> > > > > > +	 * output also, along with normal HDMI outputs. The max VIC d=
efined by
> > > > > > +	 * the CEA-861-G spec is 219, so the size is 256 bits to map =
upto 256
> > > > > > +	 * VICs.
> > > > > >   	 */
> > > > > > -	unsigned long y420_cmdb_modes[BITS_TO_LONGS(128)];
> > > > > > +	unsigned long y420_cmdb_modes[BITS_TO_LONGS(256)];
> > > > > >   	/** @y420_cmdb_map: bitmap of SVD index, to extraxt vcb mode=
s */
> > > > > >   	u64 y420_cmdb_map;
> > > > > > =

> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
