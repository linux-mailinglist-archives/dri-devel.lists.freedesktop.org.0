Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D062A963AE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 11:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0580E10E176;
	Tue, 22 Apr 2025 09:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="sVS9S10j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0417A10E176
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yVVjU1q4Gvncr+x/yJzUJCGhn/FIQjGnskDSzOiBYcc=; b=sVS9S10j6owzl7LudS/CEBn7BO
 NwY/Lm65AjheqUfV94KS0L2h4B75H2Y6ToAhmR63V3JsWUVxlaQkFeeSl6bL4UvH72yR3KzUCFrZT
 yxgcbTbF7YjBskBwoHtw9nQbFqVFYLlQ0MacYmzDnugnk9B+K5V/oO31zwKT8j5noZGUuCQb0TdpE
 CebIkNPvEQHCbkkwgg60lABzZPTkkFpWkFPogqWtQwVyGeLdcsC+uq/2n+F9bzadSeBbQ2C+2Cud8
 uTWE0L9b9RGG/B9KVzhRozrMN5mecyukkrqmwwNlfY7LdiQUknCt00DRrjk/jy2NvIn4hchMuSyTn
 2Pikki0Q==;
Received: from [194.136.85.206] (port=42018 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1u79ew-000000005oa-3Nn3; Tue, 22 Apr 2025 12:11:18 +0300
Date: Tue, 22 Apr 2025 12:11:07 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Vishal Sagar <vishal.sagar@amd.com>, Anatoliy
 Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250422121107.572cb7ad@eldfell>
In-Reply-To: <20250421145039.GA19213@pendragon.ideasonboard.com>
References: <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
 <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell>
 <20250331082135.GB13690@pendragon.ideasonboard.com>
 <20250331135337.61934003@eldfell> <20250401162732.731ef774@eldfell>
 <73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
 <20250417111315.62a749e5@eldfell>
 <20250421145039.GA19213@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JG8Db_cv6M6tw/4neQoVwq6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/JG8Db_cv6M6tw/4neQoVwq6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Apr 2025 17:50:39 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Pekka,
>=20
> On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote:
> > On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote: =20
> > > On 01/04/2025 16:27, Pekka Paalanen wrote: =20
> > > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote: =20
> > > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote: =20
> > > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote: =
=20
> > > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wrote: =20
> > > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote: =20
> > > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrote: =20
> > > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote: =20
> > > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wrote: =20
> > > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote: =20
> > > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote: =20
> > > >>>>>>>>>>> Add greyscale Y8 format.
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboar=
d.com>   =20
> > > >>>>>>>>>>
> > > >>>>>>>>>> Thanks for your patch!
> > > >>>>>>>>>>          =20
> > > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', =
'2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', =
'2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> +/* Greyscale formats */
> > > >>>>>>>>>>> +
> > > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E'=
, 'Y')  /* 8-bit Y-only */   =20
> > > >>>>>>>>>>
> > > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > >>>>>>>>>> the number of bits in the FOURCC format. What do you envis=
ion
> > > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')? =
  =20
> > > >>>>>>>>>
> > > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. Strictly s=
peaking it's
> > > >>>>>>>>> not required, but different fourccs for the same formats do=
 confuse.
> > > >>>>>>>>>
> > > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc from v4=
l2 side if
> > > >>>>>>>>> possible, and if not, invent a new one.   =20
> > > >>>>>>>>
> > > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 and DRM_F=
ORMAT_Y8?
> > > >>>>>>>>
> > > >>>>>>>> Is the difference that when R8 gets expanded to RGB, it beco=
mes (R, 0,
> > > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c=
1..c3 are
> > > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > > >>>>>>>>
> > > >>>>>>>> That would be my intuitive assumption following how YCbCr is=
 handled.
> > > >>>>>>>> Is it obvious enough, or should there be a comment to that e=
ffect?   =20
> > > >>>>>>>
> > > >>>>>>> You raise an interesting point. Is it defined how a display d=
river, that
> > > >>>>>>> supports R8 as a format, shows R8 on screen? I came into this=
 in the
> > > >>>>>>> context of grayscale formats, so I thought R8 would be handle=
d as (R, R,
> > > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes sense. =
  =20
> > > >>>>>>
> > > >>>>>> That is a good question too. I based my assumption on OpenGL b=
ehavior
> > > >>>>>> of R8.
> > > >>>>>>
> > > >>>>>> Single channel displays do exist I believe, but being single-c=
hannel,
> > > >>>>>> expansion on the other channels is likely meaningless. Hm, but=
 for the
> > > >>>>>> KMS color pipeline, it would be meaningful, like with a CTM.
> > > >>>>>> Interesting.
> > > >>>>>>
> > > >>>>>> I don't know. Maybe Geert does?   =20
> > > >>>>>
> > > >>>>> I did some digging, and was a bit surprised that it was you who=
 told
> > > >>>>> me to use R8 instead of Y8?
> > > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell   =
=20
> > > >>>>
> > > >>>> Hi Geert,
> > > >>>>
> > > >>>> indeed I did. I never thought of the question of expansion to R,=
G,B
> > > >>>> before. Maybe that expansion is what spells R8 and Y8 apart?
> > > >>>>
> > > >>>> I do think that expansion needs to be specified, so that the KMS=
 color
> > > >>>> pipeline computations are defined. There is a big difference bet=
ween
> > > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > > >>>>
> > > >>>> - (R, 0, 0)
> > > >>>> - (R, R, R)
> > > >>>> - (c1 * Y, c2 * Y, c3 * Y)   =20
> > > >>>
> > > >>> I'd be very surprised by an YUV to RGB conversion matrix where th=
e first
> > > >>> column would contain different values. What we need to take into =
account
> > > >>> though is quantization (full vs. limited range).   =20
> > > >=20
> > > > Quantization range is indeed good to note. R8 would be always full
> > > > range, but Y8 would follow COLOR_RANGE property.
> > > >    =20
> > > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should=
 be
> > > >> (R, 0, 0), so we have both variants.
> > > >>
> > > >> Can we specify Y, R, G and B be nominal values in the range 0.0 - =
1.0
> > > >> in the KMS color processing?   =20
> > > >=20
> > > > I think this 0.0 - 1.0 nominal range definition for the abstract KMS
> > > > color processing is necessary.
> > > >=20
> > > > It also means that limited range Y8 data, when containing values 0-=
15
> > > > or 240-255, would produce negative and greater than 1.0 values,
> > > > respectively. They might get immediately clamped to 0.0 - 1.0 with =
the
> > > > first color operation they face, though, but the concept seems
> > > > important and carrying over to the new color pipelines UAPI which m=
ight
> > > > choose not to clamp.   =20
> > >=20
> > > Is the behavior of values outside the limited range something that ne=
eds=20
> > > to be defined? We can't know how each piece of HW behaves with=20
> > > "undefined" input, so should we not just define the behavior as platf=
orm=20
> > > specific? =20
> >=20
> > Hi Tomi,
> >=20
> > it's not undefined nor illegal input in general. The so-called
> > sub-black and super-white ranges exist for a reason, and they are
> > intended to be used in video processing to avoid clipping in
> > intermediate processing steps when a filter overshoots a bit. There are
> > also practices that depend on them, like PLUGE calibration with
> > traditional signals on a display: https://www.itu.int/rec/R-REC-BT.814
> >=20
> > I think it would be really good to have defined behaviour if at all
> > possible.
> >  =20
> > > In any case: I can't say I fully understood all the discussions wrt.=
=20
> > > color spaces. But my immediate interest is, of course, this series =
=3D).=20
> > > So is there something that you think should be improved here? =20
> >=20
> > Right, the range discussion is a tangent and applies to all YUV
> > formats, so it's not a new question.
> >  =20
> > > My understanding is that the Y-only pixel formats behave in a well=20
> > > defined way (or, as well defined as the YUV formats), and there's=20
> > > nothing more to add here. Is that right? =20
> >=20
> > There are two things:
> >=20
> > - Y8 follows COLOR_RANGE property, just like all other YUV formats.
> > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal values).
> >=20
> > I'd like these explicitly written down, so that they become obvious to
> > everyone. I suspect either one might be easy to forget when writing
> > code and taking shortcuts without thinking.
> >=20
> >=20
> > Laurent,
> >=20
> > I did find a case where (Y', neutral, neutral) does *not* seem to expand
> > to RGB=3D(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' does
> > produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> >=20
> > I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but I
> > wouldn't be surprised if it scrambled too.
> >=20
> > Of course, both of the above are not just one matrix. They require two
> > matrices and the transfer characteristic each to compute. KMS color
> > operations cannot implement those today, but with the colorop pipelines
> > they will if the hardware does it.
> >=20
> > That's why I think it's important to document the assumption of Cb and
> > Cr when not part of the pixel format, and not write down a specific
> > expansion to RGB like (Y, Y, Y). =20
>=20
> Every time I discuss color spaces, the scopes of "RGB" and "YUV" seem to
> expand more and more. This makes me wonder how we define those two
> concepts. Taking the conversion from RGB to ICtCp as an example, would
> you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
> format ?

Hi Laurent,

sorry for the confusion. In this specific context, my use of RGB and
YUV refers to the channels in DRM pixel formats. It might have been
better if all channels in all pixel formats were "anonymous" and merely
numbered because all formats can be used for any color model, but this
is what we have.

There is some disambiguation in
https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pixels_colo=
r.md
The doc is some years old, so nowadays I might phrase things
differently, but maybe it's easier to read for those new to things as I
wrote it when I was just learning things.

I would classify ICtCp in the YUV pixel format category, because the
CtCp plane can be sub-sampled (right?). I would classify LMS and L'M'S'
in the RGB pixel format category because they are not sub-sampled AFAIK
although they also do not actually appear as buffer contents, so the
relation to pixel formats is... theoretical.

IOW, we have a completely artificial split of DRM pixel formats to RGB
and YUV where the only essential difference is that YUV formats can have
sub-sampled variants and RGB formats do not.


Thanks,
pq

--Sig_/JG8Db_cv6M6tw/4neQoVwq6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgHXSsACgkQI1/ltBGq
qqeJlxAAokwojvJjcjOM/KRqNmokHMAFa/tEdpsKjL14tZXsFrqFhMr+kR+HZTYa
hgiwy+OOFkoxgJ/jHP0IzaBKDWFjed9SJim6MCGFWrp5I26nmfl4GrXp771gFuoh
sdkYjhOwXIGZrIwMNd31Rsk+DCA+9ZFnLVuzsgh+AWOtpY0rl0PzfQ/nF9qRf58F
GKTU5K4tJqZLTNmTul/wcoI3ZqctxObCpeFlSWNCbj5hzy/4Yzn+/YKFg7yfHKGO
rvckl/+85JVlBBsQq8pJN9IpEvw8Vzx14+bETvspSTcy09u3IXvRo9eTOYlZRp6u
yZUGxh8eObfCI9BYyehJh9BZSJjYqn76Mxio6pv2dBhFFkljJYz/q9XLl8KCareF
7jyMBRwT+T4aM8d/SRFdB3qK+8+D5Yrnp+/26WQkxgRcT9cgostVAghucRDcb3Es
j4l7ycYFFyl1pt1SecwDwkzau5FBzi+P49vXCMZ7qaUgPLrKOVjwtuD0m974o64V
EripvbUOe/8yn1/jRkYMQOU+PPDmTrcxLghIMWKVzEdHQBwZPoCKxUWAt0yluuFq
Y6MALJ3ak/HaXev7lOu675RKIXFkQW8kaw9TXYwSxOax/ODd1veOYEfzJzy1TPuk
u4Y+Is3FdrTj5C4CEyrUCVpOSRlbb+PJPM91wtQP6aHNB0pNUqI=
=WI+K
-----END PGP SIGNATURE-----

--Sig_/JG8Db_cv6M6tw/4neQoVwq6--
