Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420768159E5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 15:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAED010E0D1;
	Sat, 16 Dec 2023 14:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1910E6E4;
 Sat, 16 Dec 2023 06:29:30 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5908a63a83fso1014344eaf.1; 
 Fri, 15 Dec 2023 22:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702708169; x=1703312969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2IJK4GaizgrLiis48CUXncVArYOoTGeQV2TlJ9v+4Jg=;
 b=kFMwGAzeRoeLQU7eJ6g4wYEBizPOVx99OUhBw+6CbX+QRF7MMqOQ52q9LcIAvWdrle
 oyfQyNo801eeKVXp0lXoIe5lR9srdhQTPk/JQdbPlGgCIJfz1p9XfZWiPyKxwCsRwTI2
 1+BHnXX7hSWBy87bBur8xDd/OELYQn0YsTVqN39wTQ0sbPuT65v7/1TCRxlFiAJxSrAV
 REsuabN/no/sZkEIcLnJMrE5grrqJ6a20eVAKIv9Ai8CeRJxkcUPDKAeQ4RxYFgaDWpF
 OROs/kbGIlJ+ouWi8yK6Y3JtNBzMR8HTbbhbl+uEWyIhjHefbe6ckXcaDXudeFM98+xW
 WOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702708169; x=1703312969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2IJK4GaizgrLiis48CUXncVArYOoTGeQV2TlJ9v+4Jg=;
 b=oqjn3XvbrZolIiK2MCSSZmKVlwc23uLrlZB+qF0Lo7AJpVMkV/qgBGj6YjEvq4FVrW
 UfLj6QLYf/iH+si82W3Zb6cRqztnugcKLNKyL705CLJkozjq3glM06fVShfeOV/N8u2I
 5LribKaOPIouVw7EnGDXHa1RJE22kIJg2fntiwPwgVbW7SdoLje9h+n7fJkXrD9KvKFe
 fsiT4hTbJm8gHK7hb+WwDgy2QaQ95rH6UFN1TsTURmFkPnQ/nwge7PRTkSAraooaX0tS
 AFAagROe7cxhkB9bhtMzC6k6GQ8rKKgTV7N1P9pqa375WPNr++8kh438sl6G0ysJ6qv0
 nCnA==
X-Gm-Message-State: AOJu0YzGMb7vz0GCn5OztiYnqfjWan4Ir+my9awyH/crR9LA4cNIPXfF
 zRa6I+tX+imF8Ue8W14oGi+m3Ff8VSAjucXaKYg=
X-Google-Smtp-Source: AGHT+IFVO5b/fxJ9lhSJ879XvFrsRuenl9hZQvW04aqgkEzF+07nwoSmElUj5FpYOGXztsvQGXg3h5RRceSXZ0MAdHw=
X-Received: by 2002:a05:6871:3a0b:b0:203:743e:37ef with SMTP id
 pu11-20020a0568713a0b00b00203743e37efmr2548588oac.33.1702708169397; Fri, 15
 Dec 2023 22:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20231215052033.550509-1-ghanshyam1898@gmail.com>
 <5a58e510-e5b4-42ae-95a3-257ca802212a@infradead.org>
 <CAG-Bmocu0nL-AW=nR7ZaTG4fzRvw4XSq5grk4N-wDRF0opMR4Q@mail.gmail.com>
 <CADnq5_P4CjkYvbbF=t++d6EDb45gvA7rWK8f5Dc1WBjYLOt6dQ@mail.gmail.com>
In-Reply-To: <CADnq5_P4CjkYvbbF=t++d6EDb45gvA7rWK8f5Dc1WBjYLOt6dQ@mail.gmail.com>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Sat, 16 Dec 2023 11:58:53 +0530
Message-ID: <CAG-Bmofw2rR34ov4YrYHx5wuq0YpnUNOayq9ZzWtoP2WSTRvZA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: fixed typos
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 16 Dec 2023 14:39:59 +0000
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org, lijo.lazar@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Le.Ma@amd.com,
 Randy Dunlap <rdunlap@infradead.org>, alexander.deucher@amd.com,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 9:28=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Fri, Dec 15, 2023 at 3:40=E2=80=AFAM Ghanshyam Agrawal
> <ghanshyam1898@gmail.com> wrote:
> >
> > On Fri, Dec 15, 2023 at 10:59=E2=80=AFAM Randy Dunlap <rdunlap@infradea=
d.org> wrote:
> > >
> > > Hi--
> > >
> > > On 12/14/23 21:20, Ghanshyam Agrawal wrote:
> > > > Fixed multiple typos in atomfirmware.h
> > > >
> > > > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/amd/include/atomfirmware.h | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/g=
pu/drm/amd/include/atomfirmware.h
> > > > index fa7d6ced786f..41d553921adf 100644
> > > > --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> > > > +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> > > > @@ -210,7 +210,7 @@ atom_bios_string          =3D "ATOM"
> > > >  };
> > > >  */
> > > >
> > > > -#pragma pack(1)                          /* BIOS data must use byt=
e aligment*/
> > > > +#pragma pack(1)                          /* BIOS data must use byt=
e alignment */
> > > >
> > > >  enum atombios_image_offset{
> > > >    OFFSET_TO_ATOM_ROM_HEADER_POINTER          =3D 0x00000048,
> > > > @@ -452,7 +452,7 @@ struct atom_dtd_format
> > > >    uint8_t   refreshrate;
> > > >  };
> > > >
> > > > -/* atom_dtd_format.modemiscinfo defintion */
> > > > +/* atom_dtd_format.modemiscinfo definition */
> > > >  enum atom_dtd_format_modemiscinfo{
> > > >    ATOM_HSYNC_POLARITY    =3D 0x0002,
> > > >    ATOM_VSYNC_POLARITY    =3D 0x0004,
> > > > @@ -645,7 +645,7 @@ struct lcd_info_v2_1
> > > >    uint32_t reserved1[8];
> > > >  };
> > > >
> > > > -/* lcd_info_v2_1.panel_misc defintion */
> > > > +/* lcd_info_v2_1.panel_misc definition */
> > > >  enum atom_lcd_info_panel_misc{
> > > >    ATOM_PANEL_MISC_FPDI            =3D0x0002,
> > > >  };
> > > > @@ -683,7 +683,7 @@ enum atom_gpio_pin_assignment_gpio_id {
> > > >    /* gpio_id pre-define id for multiple usage */
> > > >    /* GPIO use to control PCIE_VDDC in certain SLT board */
> > > >    PCIE_VDDC_CONTROL_GPIO_PINID =3D 56,
> > > > -  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swi=
thing feature is enable */
> > > > +  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swi=
tching feature is enable */
> > >
> > > s/enable/enabled/
> > >
> > > >    PP_AC_DC_SWITCH_GPIO_PINID =3D 60,
> > > >    /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot f=
eature is enable */
> > >
> > > Ditto.
> > > There may be a few more that need this same treatment.
> > >
> > > >    VDDC_VRHOT_GPIO_PINID =3D 61,
> > >
> > > The other changes look good as far as they go, but codespell reports
> > > a few more misspellings to consider:
> > >
> > > atomfirmware.h:213: aligment =3D=3D> alignment
> > > atomfirmware.h:257: Offest =3D=3D> Offset
> > > atomfirmware.h:258: Offest =3D=3D> Offset
> > > atomfirmware.h:390: Offest =3D=3D> Offset
> > > atomfirmware.h:455: defintion =3D=3D> definition
> > > atomfirmware.h:648: defintion =3D=3D> definition
> > > atomfirmware.h:686: swithing =3D=3D> switching
> > > atomfirmware.h:704: calcualted =3D=3D> calculated
> > > atomfirmware.h:967: compability =3D=3D> compatibility
> > > atomfirmware.h:981: intenal =3D=3D> internal
> > > atomfirmware.h:993: intenal =3D=3D> internal
> > > atomfirmware.h:3469: sequece =3D=3D> sequence
> > > atomfirmware.h:3507: indiate =3D=3D> indicate
> > > atomfirmware.h:4429: stucture =3D=3D> structure
> > > atomfirmware.h:4430: stucture =3D=3D> structure
> > > atomfirmware.h:4462: regiser =3D=3D> register
> > >
> > >
> > > thanks.
> > > --
> > > #Randy
> > > https://people.kernel.org/tglx/notes-about-netiquette
> > > https://subspace.kernel.org/etiquette.html
> >
> > Hi Randy,
> >
> > Thanks for your feedback. I will correct the grammatical errors.
> >
> > Regarding the other codespell suggestions, if I make the changes
> > then checkpatch script gives a lot of errors and warnings. Some
> > are related to usage of tabs, line lengths etc. Being a beginner
> > in the linux kernel development, I am not sure how to fix
> > (or whether to ignore) those warnings. Would it be okay if I
> > proceed with only the small number of changes I have suggested
> > with this patch itself?
>
> How concerned are you with fixing these?  This file is owned by
> firmware teams within AMD and shared across different OSes.  It
> defines the structures present in the ROM on the board.  I'm inclined
> to just leave it be to avoid churn when syncing it with the canonical
> source.  We can certainly try and push the fixes back up into the
> canonical code as well, but that may not be the easiest process.
>
> Alex

Hi Alex,

Thanks for your review. I wanted to fix the typos because it helps
someone while searching through the code using text/ code searching
tools. If it is causing trouble as you suggested, we may as well
leave it as is. Let the maintainers take a call on this.

Thanks & Regards,
Ghanshyam Agrawal
