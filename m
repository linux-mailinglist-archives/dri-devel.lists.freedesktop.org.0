Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D14A9654C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A62910E16E;
	Tue, 22 Apr 2025 10:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IRRh1PKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978F310E16E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 10:01:50 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54b166fa41bso5470676e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745316109; x=1745920909; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=lFg2E5TdC6tWZ0EmL0XbyzLDwFhRtVTh44iqbHEh8o4=;
 b=IRRh1PKiZPcZkDs+BNhPsT37r13vBfwL0V3qKlk1hps79+RKsNN9GWmWcF1oBA9l0J
 DDA4pn1ACYWGD5sdTpngjuN7hLCL0YJeIgFv3Ap+zkn41BAzMGmHnEdvDiqNNV8QEyyU
 XbhFZgWIH7ao0rfja0ZSsyWizEeQKu8MrvCDdIuNqxUXkVNs7ZSCnjFAZcxPqGD2YSvk
 IZ+xxpelSUJHdiEZRT/O6pS9/K4jCike7bF0uXKiy8pxPvfwQF57rdNdgDvLCAtGDgvm
 nBuweW+E9G13WokHC4dQaHia3G1gnXi9WK2ddKj6PMeVO69T96RCEPOOgMNrr4g6MXeC
 vpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745316109; x=1745920909;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFg2E5TdC6tWZ0EmL0XbyzLDwFhRtVTh44iqbHEh8o4=;
 b=AEgfmu74uT4q/wZkTktYz2WxIsggqGCJN005FvR+1jCy0BUwm5kCr9fgIcJbWfPhdh
 WdeY1FCdP4n39ytrQwzs3gejBqzNcxNKj/MASdTo/8ffstyZI8Sp7w9XWlhxT8beFeXl
 iiDS1WE3GWSoqvUbCuXr0XGuFsEMo24Ck1HXI+OhoQvzMzKqXnLbiaNMhj142HUv2kdJ
 eWsTYHffNqJnLh12Bm+O/wQrGpRQyzpwcxHLs4yxSlX8V/odjPbeOxhqWbvPAtmoVMZK
 EANUGzfPouB7WuNi8+UxbTUf5QSeRkIipna+snFeyPINoBXMpSHJWssRSwNLzTip17v4
 qV9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh+zZyQkY9JQFW6rD0xGa4bUaNFu9l+j0v305Mt0W3Ub8sR47jOYsHDMmP8rMqwRjlDSmjWXZxbWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5dpGWXAz7wmMsz52LGERdi+uiT63Er75Br2LlRU6YSaIcjC8h
 G2mksJVVAmx2DeCtkMno8t3kjEERS5lMGCInsPo+h8vnHIPLexN7
X-Gm-Gg: ASbGncuI4xqjqs5ItSdC4/bG53O238mWgg2yjBjIL+jlQwF6sh36BvalPIshaYzbO6S
 0a9XsHieNY98Frh5SsYV+eRNfASRpReIs/aLDbn2WJIFPi+/ETUUAOf4gJthf4AR/0kI8sTKimm
 lsTPy+I9oXJhaJs+C1sU4mcTUsCy4/PVYfLNLpehS5ICDudIf0P3r1CSrk/R4+APYJ8sH1Y/kX8
 uNNz3amF/MYBE7RCTuYdPhgUVPlUoGcANmRmufEGRwFCqg3MhPtwC0WTdh4UWpSlbDoSbcglB+L
 BcRXJHP3MsKh0v94lIt8utV04sZQcYpgx18=
X-Google-Smtp-Source: AGHT+IEsOulovSz/4gGmxLfCd8vEY2bWoVbyQ0FESQaD8DTImRBWAih16pup9gMc3XBh5tW+5f2BTg==
X-Received: by 2002:a05:6512:2306:b0:54a:c835:cc58 with SMTP id
 2adb3069b0e04-54d6e662998mr3748230e87.50.1745316108305; 
 Tue, 22 Apr 2025 03:01:48 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e540decsm1184659e87.73.2025.04.22.03.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 03:01:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:01:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250422130137.2658c646@eldfell>
In-Reply-To: <CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com>
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
 <20250422121107.572cb7ad@eldfell>
 <CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_OlrXcyznLMA5OZ663uil/j";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/_OlrXcyznLMA5OZ663uil/j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Apr 2025 11:41:29 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Tue, 22 Apr 2025 at 11:11, Pekka Paalanen
> <pekka.paalanen@haloniitty.fi> wrote:
> > On Mon, 21 Apr 2025 17:50:39 +0300
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote: =20
> > > On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote: =20
> > > > On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote: =20
> > > > > On 01/04/2025 16:27, Pekka Paalanen wrote: =20
> > > > > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote: =20
> > > > > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote: =20
> > > > > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrot=
e: =20
> > > > > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wrote:=
 =20
> > > > > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote: =20
> > > > > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrote: =
=20
> > > > > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote: =20
> > > > > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wrote:=
 =20
> > > > > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote: =20
> > > > > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote: =20
> > > > > >>>>>>>>>>> Add greyscale Y8 format.
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.o=
rg>
> > > > > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideason=
board.com> =20
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>> Thanks for your patch!
> > > > > >>>>>>>>>> =20
> > > > > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y', '=
U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y', '=
V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > >>>>>>>>>>>
> > > > > >>>>>>>>>>> +/* Greyscale formats */
> > > > > >>>>>>>>>>> +
> > > > > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R',=
 'E', 'Y')  /* 8-bit Y-only */ =20
> > > > > >>>>>>>>>>
> > > > > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which enc=
odes
> > > > > >>>>>>>>>> the number of bits in the FOURCC format. What do you e=
nvision
> > > > > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6=
')? =20
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. Strict=
ly speaking it's
> > > > > >>>>>>>>> not required, but different fourccs for the same format=
s do confuse.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc fro=
m v4l2 side if
> > > > > >>>>>>>>> possible, and if not, invent a new one. =20
> > > > > >>>>>>>>
> > > > > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 and D=
RM_FORMAT_Y8?
> > > > > >>>>>>>>
> > > > > >>>>>>>> Is the difference that when R8 gets expanded to RGB, it =
becomes (R, 0,
> > > > > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) whe=
re c1..c3 are
> > > > > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > > > > >>>>>>>>
> > > > > >>>>>>>> That would be my intuitive assumption following how YCbC=
r is handled.
> > > > > >>>>>>>> Is it obvious enough, or should there be a comment to th=
at effect? =20
> > > > > >>>>>>>
> > > > > >>>>>>> You raise an interesting point. Is it defined how a displ=
ay driver, that
> > > > > >>>>>>> supports R8 as a format, shows R8 on screen? I came into =
this in the
> > > > > >>>>>>> context of grayscale formats, so I thought R8 would be ha=
ndled as (R, R,
> > > > > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes sen=
se. =20
> > > > > >>>>>>
> > > > > >>>>>> That is a good question too. I based my assumption on Open=
GL behavior
> > > > > >>>>>> of R8.
> > > > > >>>>>>
> > > > > >>>>>> Single channel displays do exist I believe, but being sing=
le-channel,
> > > > > >>>>>> expansion on the other channels is likely meaningless. Hm,=
 but for the
> > > > > >>>>>> KMS color pipeline, it would be meaningful, like with a CT=
M.
> > > > > >>>>>> Interesting.
> > > > > >>>>>>
> > > > > >>>>>> I don't know. Maybe Geert does? =20
> > > > > >>>>>
> > > > > >>>>> I did some digging, and was a bit surprised that it was you=
 who told
> > > > > >>>>> me to use R8 instead of Y8?
> > > > > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell=
 =20
> > > > > >>>>
> > > > > >>>> Hi Geert,
> > > > > >>>>
> > > > > >>>> indeed I did. I never thought of the question of expansion t=
o R,G,B
> > > > > >>>> before. Maybe that expansion is what spells R8 and Y8 apart?
> > > > > >>>>
> > > > > >>>> I do think that expansion needs to be specified, so that the=
 KMS color
> > > > > >>>> pipeline computations are defined. There is a big difference=
 between
> > > > > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > > > > >>>>
> > > > > >>>> - (R, 0, 0)
> > > > > >>>> - (R, R, R)
> > > > > >>>> - (c1 * Y, c2 * Y, c3 * Y) =20
> > > > > >>>
> > > > > >>> I'd be very surprised by an YUV to RGB conversion matrix wher=
e the first
> > > > > >>> column would contain different values. What we need to take i=
nto account
> > > > > >>> though is quantization (full vs. limited range). =20
> > > > > >
> > > > > > Quantization range is indeed good to note. R8 would be always f=
ull
> > > > > > range, but Y8 would follow COLOR_RANGE property.
> > > > > > =20
> > > > > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 sh=
ould be
> > > > > >> (R, 0, 0), so we have both variants.
> > > > > >>
> > > > > >> Can we specify Y, R, G and B be nominal values in the range 0.=
0 - 1.0
> > > > > >> in the KMS color processing? =20
> > > > > >
> > > > > > I think this 0.0 - 1.0 nominal range definition for the abstrac=
t KMS
> > > > > > color processing is necessary.
> > > > > >
> > > > > > It also means that limited range Y8 data, when containing value=
s 0-15
> > > > > > or 240-255, would produce negative and greater than 1.0 values,
> > > > > > respectively. They might get immediately clamped to 0.0 - 1.0 w=
ith the
> > > > > > first color operation they face, though, but the concept seems
> > > > > > important and carrying over to the new color pipelines UAPI whi=
ch might
> > > > > > choose not to clamp. =20
> > > > >
> > > > > Is the behavior of values outside the limited range something tha=
t needs
> > > > > to be defined? We can't know how each piece of HW behaves with
> > > > > "undefined" input, so should we not just define the behavior as p=
latform
> > > > > specific? =20
> > > >
> > > > Hi Tomi,
> > > >
> > > > it's not undefined nor illegal input in general. The so-called
> > > > sub-black and super-white ranges exist for a reason, and they are
> > > > intended to be used in video processing to avoid clipping in
> > > > intermediate processing steps when a filter overshoots a bit. There=
 are
> > > > also practices that depend on them, like PLUGE calibration with
> > > > traditional signals on a display: https://www.itu.int/rec/R-REC-BT.=
814
> > > >
> > > > I think it would be really good to have defined behaviour if at all
> > > > possible.
> > > > =20
> > > > > In any case: I can't say I fully understood all the discussions w=
rt.
> > > > > color spaces. But my immediate interest is, of course, this serie=
s =3D).
> > > > > So is there something that you think should be improved here? =20
> > > >
> > > > Right, the range discussion is a tangent and applies to all YUV
> > > > formats, so it's not a new question.
> > > > =20
> > > > > My understanding is that the Y-only pixel formats behave in a well
> > > > > defined way (or, as well defined as the YUV formats), and there's
> > > > > nothing more to add here. Is that right? =20
> > > >
> > > > There are two things:
> > > >
> > > > - Y8 follows COLOR_RANGE property, just like all other YUV formats.
> > > > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal values=
).
> > > >
> > > > I'd like these explicitly written down, so that they become obvious=
 to
> > > > everyone. I suspect either one might be easy to forget when writing
> > > > code and taking shortcuts without thinking.
> > > >
> > > >
> > > > Laurent,
> > > >
> > > > I did find a case where (Y', neutral, neutral) does *not* seem to e=
xpand
> > > > to RGB=3D(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' does
> > > > produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> > > >
> > > > I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but I
> > > > wouldn't be surprised if it scrambled too.
> > > >
> > > > Of course, both of the above are not just one matrix. They require =
two
> > > > matrices and the transfer characteristic each to compute. KMS color
> > > > operations cannot implement those today, but with the colorop pipel=
ines
> > > > they will if the hardware does it.
> > > >
> > > > That's why I think it's important to document the assumption of Cb =
and
> > > > Cr when not part of the pixel format, and not write down a specific
> > > > expansion to RGB like (Y, Y, Y). =20
> > >
> > > Every time I discuss color spaces, the scopes of "RGB" and "YUV" seem=
 to
> > > expand more and more. This makes me wonder how we define those two
> > > concepts. Taking the conversion from RGB to ICtCp as an example, would
> > > you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
> > > format ? =20
> >
> > sorry for the confusion. In this specific context, my use of RGB and
> > YUV refers to the channels in DRM pixel formats. It might have been
> > better if all channels in all pixel formats were "anonymous" and merely
> > numbered because all formats can be used for any color model, but this
> > is what we have.
> >
> > There is some disambiguation in
> > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pixels_=
color.md
> > The doc is some years old, so nowadays I might phrase things
> > differently, but maybe it's easier to read for those new to things as I
> > wrote it when I was just learning things.
> >
> > I would classify ICtCp in the YUV pixel format category, because the
> > CtCp plane can be sub-sampled (right?). I would classify LMS and L'M'S'
> > in the RGB pixel format category because they are not sub-sampled AFAIK
> > although they also do not actually appear as buffer contents, so the
> > relation to pixel formats is... theoretical.
> >
> > IOW, we have a completely artificial split of DRM pixel formats to RGB
> > and YUV where the only essential difference is that YUV formats can have
> > sub-sampled variants and RGB formats do not. =20
>=20
> RGB can be subsampled, too...
> https://en.wikipedia.org/wiki/Bayer_filter

That's true. What difference are we left with, then?

We have DRM pixel formats which imply some color model, but do not
define the variant of each color model (e.g. the Y'CbCr-to-RGB matrix).

I guess the implied color model then implies which API, e.g. KMS plane
property, is responsible for defining the variant.


Thanks,
pq

--Sig_/_OlrXcyznLMA5OZ663uil/j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgHaQEACgkQI1/ltBGq
qqfVcRAAoo5YV89aALpPpZvwZANVqT8pe4rqu50lnfJNoqRA9Z0RmU9TB2nGL9Dr
BCQbqwstI0v/E9nngUvmu5Rzty0pf6o8YlqH+yV7bsA+SRxDUG71JGwuq0X/GX7Y
ocnUcWdwMPVCGViPW/gjvCDk6B2C2Mso28o0E34eL2AuS4knZrHUD5/xSt4kiRw9
lGLuRKnQp9ukN64gXbGqG8ymD68beQftgo5fQbkSxepdajwtGvhewM7gLrpnG6g6
zF34803RvigPreDZlJVAY8oi/2GHe4FOlg5Qg4AC9aZ8fC633D6awpmKIQYkfuT3
aVk9e28dxSWNTWakNK4uqZLMU1UySYJiCjWGK/NDuQYdWRQ6dvMs6+1lKFoKubND
zPkVqf8kksc8XV+/z5Y15lRYzdYOpGfKqFt8wPiya8U/4Ka9VsYwfOj0BNXvP85I
fd6V1Cfd48Wrv/bE1sULdHKEIlSwfBUMKF7+9Kpxx21H2GBUKdkF5GP7ElBmhygs
eVx1tcrdDLC0VImhedciGoM3l2KGwFQ+z235G0hc5G6Nq0g+lRHS/ORIQL6E+rrY
93qw3FHqtJ6WXBaqEqCfeKRQoSGdGH/aZQkPanTNMLkttH9lsB3vsriUEgrUT/Od
JxHuk2uBmS8969t2KwGTXVVo6c+9uBjnftPvVzO4txxxUG6aXMk=
=pGBv
-----END PGP SIGNATURE-----

--Sig_/_OlrXcyznLMA5OZ663uil/j--
