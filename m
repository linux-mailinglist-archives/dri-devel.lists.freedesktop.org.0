Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1AD822F18
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0B710E2DC;
	Wed,  3 Jan 2024 14:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F7110E2F2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 14:02:19 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5f07f9d57b9so30708297b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 06:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1704290539; x=1704895339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luUKiYhdMa+DSjWQpnDAurUJm/xFMM0nUDBelYSIQ7E=;
 b=Xyr7f2IG66xRRdiAIeA7t2g+6gevJ50ucD1EJhvgA94Z/0A3vFD4VPzOj4eNHO5Od6
 k19sciQobVavyFx0Q5c1SOzP2bIQa63AKZdtmezydiJD2lcnjv5bv4L473uAcwfmmN0T
 3EEG+RjkiPFTQALRcY/aAGUrv/rbb86Uf0iyEUdKNoPD+T/uHy/EzHwnN7/OdQpsI3RG
 MdPyn6Arxe2XEPPRKhgOoV8EtrG+eLhjcHsvm4E4pnTRpRmwgEhRYLSSDYsL7ZtALbQb
 Tr3dj4W8IoJTeGFvwSzGovRxA6GzYoh7+atENci0/fh5W9Dp+UTd14ScC2cfXQe/Bmhh
 N5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704290539; x=1704895339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=luUKiYhdMa+DSjWQpnDAurUJm/xFMM0nUDBelYSIQ7E=;
 b=mAFz5z/KPs22ggllb9gaxk5D7sB0ZYosrqp5gqMUnIbktp56xw3c9Z/mNp4n4QOv4c
 o+xE21ubzA2dc9ROWwI1w+EzfvQZ9UetWkYD4z1mOoGjAhS3bLlCAIgy9wWhU2ufJXIz
 BwCDnsjYm0f+3Toj3utZbvFBYSlGcyaf3yGLgxCtyhJNYQ/dcJNlsluC9tem3i2DihZl
 0kzIfNdGsV6W/vQM8dQUSVPdqE4hTnyeUbQdtlO1yumtAQFLzC6daz/SVJBqBOTd2Rey
 uzCCFIPYGFzqiIsON8ySw50PXOt7zCTdvE8ExD1DNH5Pa/4x+iolj9k8OX3UqgZNQXfx
 /t9A==
X-Gm-Message-State: AOJu0YwWaYT42yTMaX98zjX2iBKSHTRki4H7HiQ1AgZUoUV2Vi29sUTo
 W2CVR5x3wcyWEJd2hCSKBGT0I3nDNRnjPNW3i61m3mjUJ9zjxg==
X-Google-Smtp-Source: AGHT+IGQN8KrE+4xYkNUPGMZl2eRSEZ8ppFRb4MyA++6EMf+cQaNmC0TRsIWZJGgprSfIHpyRwTLIJDoYQmNgG1zX48=
X-Received: by 2002:a05:690c:2e84:b0:5ee:6164:5722 with SMTP id
 eu4-20020a05690c2e8400b005ee61645722mr6447462ywb.60.1704290538857; Wed, 03
 Jan 2024 06:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-9-24b168e5bcd5@cerno.tech>
 <CAPY8ntD4oz9A1H7Ek1YSLRicLprz1ev5YeAqP2Ah=DMPk84KRQ@mail.gmail.com>
 <z5mywwtyboycdoqhayfuqjobr53jajgaft5ikfdkt77tnm7bhg@d4gjmlqpnnrt>
In-Reply-To: <z5mywwtyboycdoqhayfuqjobr53jajgaft5ikfdkt77tnm7bhg@d4gjmlqpnnrt>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 3 Jan 2024 14:02:01 +0000
Message-ID: <CAPY8ntB0V2yRWVnr6HYby0g2seDL5P03iO+7E_TLa3niPGSfPw@mail.gmail.com>
Subject: Re: [PATCH v9 09/25] drm/modes: Move named modes parsing to a
 separate function
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 3 Jan 2024 at 13:33, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> Happy new year :)

And to you.

> On Tue, Jan 02, 2024 at 03:12:26PM +0000, Dave Stevenson wrote:
> > Hi Maxime
> >
> > On Mon, 14 Nov 2022 at 13:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The current construction of the named mode parsing doesn't allow to e=
xtend
> > > it easily. Let's move it to a separate function so we can add more
> > > parameters and modes.
> > >
> > > In order for the tests to still pass, some extra checks are needed, s=
o
> > > it's not a 1:1 move.
> > >
> > > Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > > Tested-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > ---
> > > Changes in v7:
> > > - Add Noralf Reviewed-by
> > >
> > > Changes in v6:
> > > - Simplify the test for connection status extras
> > > - Simplify the code path to call drm_mode_parse_cmdline_named_mode
> > >
> > > Changes in v4:
> > > - Fold down all the named mode patches that were split into a single
> > >   patch again to maintain bisectability
> > > ---
> > >  drivers/gpu/drm/drm_modes.c | 70 +++++++++++++++++++++++++++++++++++=
++--------
> > >  1 file changed, 58 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.=
c
> > > index 71c050c3ee6b..37542612912b 100644
> > > --- a/drivers/gpu/drm/drm_modes.c
> > > +++ b/drivers/gpu/drm/drm_modes.c
> > > @@ -2229,6 +2229,51 @@ static const char * const drm_named_modes_whit=
elist[] =3D {
> > >         "PAL",
> > >  };
> > >
> > > +static int drm_mode_parse_cmdline_named_mode(const char *name,
> > > +                                            unsigned int name_end,
> > > +                                            struct drm_cmdline_mode =
*cmdline_mode)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       if (!name_end)
> > > +               return 0;
> > > +
> > > +       /* If the name starts with a digit, it's not a named mode */
> > > +       if (isdigit(name[0]))
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * If there's an equal sign in the name, the command-line
> > > +        * contains only an option and no mode.
> > > +        */
> > > +       if (strnchr(name, name_end, '=3D'))
> > > +               return 0;
> > > +
> > > +       /* The connection status extras can be set without a mode. */
> > > +       if (name_end =3D=3D 1 &&
> > > +           (name[0] =3D=3D 'd' || name[0] =3D=3D 'D' || name[0] =3D=
=3D 'e'))
> > > +               return 0;
> > > +
> > > +       /*
> > > +        * We're sure we're a named mode at this point, iterate over =
the
> > > +        * list of modes we're aware of.
> > > +        */
> > > +       for (i =3D 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++)=
 {
> > > +               int ret;
> > > +
> > > +               ret =3D str_has_prefix(name, drm_named_modes_whitelis=
t[i]);
> > > +               if (ret !=3D name_end)
> > > +                       continue;
> > > +
> > > +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[=
i]);
> > > +               cmdline_mode->specified =3D true;
> > > +
> > > +               return 1;
> > > +       }
> > > +
> > > +       return -EINVAL;
> > > +}
> > > +
> > >  /**
> > >   * drm_mode_parse_command_line_for_connector - parse command line mo=
deline for connector
> > >   * @mode_option: optional per connector mode option
> > > @@ -2265,7 +2310,7 @@ bool drm_mode_parse_command_line_for_connector(=
const char *mode_option,
> > >         const char *bpp_ptr =3D NULL, *refresh_ptr =3D NULL, *extra_p=
tr =3D NULL;
> > >         const char *options_ptr =3D NULL;
> > >         char *bpp_end_ptr =3D NULL, *refresh_end_ptr =3D NULL;
> > > -       int i, len, ret;
> > > +       int len, ret;
> > >
> > >         memset(mode, 0, sizeof(*mode));
> > >         mode->panel_orientation =3D DRM_MODE_PANEL_ORIENTATION_UNKNOW=
N;
> > > @@ -2306,18 +2351,19 @@ bool drm_mode_parse_command_line_for_connecto=
r(const char *mode_option,
> > >                 parse_extras =3D true;
> > >         }
> > >
> > > -       /* First check for a named mode */
> > > -       for (i =3D 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++)=
 {
> > > -               ret =3D str_has_prefix(name, drm_named_modes_whitelis=
t[i]);
> > > -               if (ret =3D=3D mode_end) {
> > > -                       if (refresh_ptr)
> > > -                               return false; /* named + refresh is i=
nvalid */
> > > +       if (!mode_end)
> > > +               return false;
> >
> > I'm chasing down a change in behaviour between 6.1 and 6.6, and this
> > patch seems to be at least part of the cause.
> >
> > Since [1] we've had the emulated framebuffer on Pi being 16bpp to save
> > memory. All good.
> >
> > It used to be possible to use "video=3DHDMI-A-1:-32" on the kernel
> > command line to set it back to 32bpp.
> >
> > After this patch that is no longer possible. "mode_end =3D bpp_off", an=
d
> > "bpp_off =3D bpp_ptr - name", so with bpp_ptr =3D name we get mode_end
> > being 0. That fails this conditional.
> > drm_mode_parse_cmdline_named_mode already aborts early but with no
> > error if name_end / mode_end is 0, so this "if" clause seems
> > redundant, and is a change in behaviour.
> >
> > We do then get a second parsing failure due to the check if (bpp_ptr
> > || refresh_ptr) at [2].
> > Prior to this patch my video=3D line would get mode->specified set via
> > "if (ret =3D=3D mode_end)" removed above, as ret =3D mode_end =3D 0. We
> > therefore didn't evaluate the conditional that now fails.
> >
> > So I guess my question is whether my command line is valid or not, and
> > therefore is this a regression?
>
> It's a mess :)
>
> Documentation/fb/modedb.rst defines the video parameter syntax as:
>
> <xres>x<yres>[M][R][-<bpp>][@<refresh>][i][m][eDd]
>
> And thus mandates the x and y resolution. I guess that's what I use as a
> base, and thus -bpp alone would be invalid.
>
> But then it contradicts itself some time later by documenting that
> video=3DHDMI-1:D is ok.
>
> I guess what you experienced was just an oversight: it was not
> documented anywhere that it was valid, so we didn't really tested it
> either. We should add a unit test for it and fix it.

Does dropping this "if (!mode_end)" check, and at least the check for
bpp_ptr in the "No mode?" block below it, seem reasonable to you?

I guess there is also the question of whether a refresh rate without a
mode is valid. That one seems less useful, and all uses of
refresh_specified appear to be after some form of checking xres and
yres.

I can put a couple of patches together to deal with this if you're
happy with the principle.

Thanks
  Dave
