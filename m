Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBA814C33
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 16:58:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5D310EA5A;
	Fri, 15 Dec 2023 15:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3C510EA40;
 Fri, 15 Dec 2023 15:58:42 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-20311257937so570558fac.0; 
 Fri, 15 Dec 2023 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702655921; x=1703260721; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMDmmtKyEjaK61NBtkr7gJU4IeLSBq2Hb033B/z2d3o=;
 b=Z8kOu5W+zSuZb+Q9OUNfzuO3WflHlKSWj78gbIGENI7a11VXadxE2tKARepARloRRU
 swEZBd6vdrJt1RMsJgtgKUAdn7W/WX+vEbItEzSzlyQCiWS7kProyJriAjhE+l1kl9X8
 XJA88l8G7bVp5uHXn5huec1ws8/Mf/edUZkxCMl5FRZ7iepeT4Qy6kA51X4yiCj20AmY
 ro+9o1HWfBoW/iSlIabKfcdZ3pkOADT2ahWCmxzuH+64QNVjQ6RA5+lrOwUhz9K78IIM
 i4qSlQ9qXZjJejZ7Q+K0PCqZt1ukruYzjARAV6fNYEA6az3CIoh4yRc3YMR7An3f+pSl
 ndyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702655921; x=1703260721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMDmmtKyEjaK61NBtkr7gJU4IeLSBq2Hb033B/z2d3o=;
 b=Q8uN3C+BITs9WMMcYntes1IPfj+RR+GHmHi8fllH9CmXXsjG6YDy9Aqcr82BlGWbH7
 C+rNXwqPI9gL4EP62fhaLYwHGoMiEXTkKoGYtjtTnKMKrnmOudRArZQu3npNCjWrY3yr
 YktHV7guNJsgLTUai/Z2YJoWPmGeQEtbT0OnluU6bItm1E0EnAb35lJieSMkw2rYZGOW
 g7QNcbWb1KBO/YNnF/AEnpgW2BROSqTGz8f06ahBybL68ixOalrHqQUOJtcEcLITxC7u
 PbM24dpqxOtk+eoMMvMjx+JsE+bIcwbiYzzGYOKpf4d9PinwU8O4+u8P4kgKNTNyFL1W
 40Pw==
X-Gm-Message-State: AOJu0YwUKC2gWhWIFWtyvxVsuFNJFccSj72AbZF3j5B/u4NaUgLv3O2R
 zrd2rTzeX3HOUSkxtVyxka+O35nRIjHmm5yli8s=
X-Google-Smtp-Source: AGHT+IFIi3S32z46SzFX1pWpqrOHerdi992+8y485w4cqmMH31HQdZY3ZXqLpXoY2w8aDsU/J4iXfeN2P9pJ+BkDG8M=
X-Received: by 2002:a05:6870:b07:b0:1fb:75b:12ec with SMTP id
 lh7-20020a0568700b0700b001fb075b12ecmr14937481oab.62.1702655921316; Fri, 15
 Dec 2023 07:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20231215052033.550509-1-ghanshyam1898@gmail.com>
 <5a58e510-e5b4-42ae-95a3-257ca802212a@infradead.org>
 <CAG-Bmocu0nL-AW=nR7ZaTG4fzRvw4XSq5grk4N-wDRF0opMR4Q@mail.gmail.com>
In-Reply-To: <CAG-Bmocu0nL-AW=nR7ZaTG4fzRvw4XSq5grk4N-wDRF0opMR4Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 15 Dec 2023 10:58:29 -0500
Message-ID: <CADnq5_P4CjkYvbbF=t++d6EDb45gvA7rWK8f5Dc1WBjYLOt6dQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: fixed typos
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org, lijo.lazar@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Le.Ma@amd.com,
 Randy Dunlap <rdunlap@infradead.org>, alexander.deucher@amd.com,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 3:40=E2=80=AFAM Ghanshyam Agrawal
<ghanshyam1898@gmail.com> wrote:
>
> On Fri, Dec 15, 2023 at 10:59=E2=80=AFAM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> > Hi--
> >
> > On 12/14/23 21:20, Ghanshyam Agrawal wrote:
> > > Fixed multiple typos in atomfirmware.h
> > >
> > > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > > ---
> > >  drivers/gpu/drm/amd/include/atomfirmware.h | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu=
/drm/amd/include/atomfirmware.h
> > > index fa7d6ced786f..41d553921adf 100644
> > > --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> > > +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> > > @@ -210,7 +210,7 @@ atom_bios_string          =3D "ATOM"
> > >  };
> > >  */
> > >
> > > -#pragma pack(1)                          /* BIOS data must use byte =
aligment*/
> > > +#pragma pack(1)                          /* BIOS data must use byte =
alignment */
> > >
> > >  enum atombios_image_offset{
> > >    OFFSET_TO_ATOM_ROM_HEADER_POINTER          =3D 0x00000048,
> > > @@ -452,7 +452,7 @@ struct atom_dtd_format
> > >    uint8_t   refreshrate;
> > >  };
> > >
> > > -/* atom_dtd_format.modemiscinfo defintion */
> > > +/* atom_dtd_format.modemiscinfo definition */
> > >  enum atom_dtd_format_modemiscinfo{
> > >    ATOM_HSYNC_POLARITY    =3D 0x0002,
> > >    ATOM_VSYNC_POLARITY    =3D 0x0004,
> > > @@ -645,7 +645,7 @@ struct lcd_info_v2_1
> > >    uint32_t reserved1[8];
> > >  };
> > >
> > > -/* lcd_info_v2_1.panel_misc defintion */
> > > +/* lcd_info_v2_1.panel_misc definition */
> > >  enum atom_lcd_info_panel_misc{
> > >    ATOM_PANEL_MISC_FPDI            =3D0x0002,
> > >  };
> > > @@ -683,7 +683,7 @@ enum atom_gpio_pin_assignment_gpio_id {
> > >    /* gpio_id pre-define id for multiple usage */
> > >    /* GPIO use to control PCIE_VDDC in certain SLT board */
> > >    PCIE_VDDC_CONTROL_GPIO_PINID =3D 56,
> > > -  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swith=
ing feature is enable */
> > > +  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC switc=
hing feature is enable */
> >
> > s/enable/enabled/
> >
> > >    PP_AC_DC_SWITCH_GPIO_PINID =3D 60,
> > >    /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot fea=
ture is enable */
> >
> > Ditto.
> > There may be a few more that need this same treatment.
> >
> > >    VDDC_VRHOT_GPIO_PINID =3D 61,
> >
> > The other changes look good as far as they go, but codespell reports
> > a few more misspellings to consider:
> >
> > atomfirmware.h:213: aligment =3D=3D> alignment
> > atomfirmware.h:257: Offest =3D=3D> Offset
> > atomfirmware.h:258: Offest =3D=3D> Offset
> > atomfirmware.h:390: Offest =3D=3D> Offset
> > atomfirmware.h:455: defintion =3D=3D> definition
> > atomfirmware.h:648: defintion =3D=3D> definition
> > atomfirmware.h:686: swithing =3D=3D> switching
> > atomfirmware.h:704: calcualted =3D=3D> calculated
> > atomfirmware.h:967: compability =3D=3D> compatibility
> > atomfirmware.h:981: intenal =3D=3D> internal
> > atomfirmware.h:993: intenal =3D=3D> internal
> > atomfirmware.h:3469: sequece =3D=3D> sequence
> > atomfirmware.h:3507: indiate =3D=3D> indicate
> > atomfirmware.h:4429: stucture =3D=3D> structure
> > atomfirmware.h:4430: stucture =3D=3D> structure
> > atomfirmware.h:4462: regiser =3D=3D> register
> >
> >
> > thanks.
> > --
> > #Randy
> > https://people.kernel.org/tglx/notes-about-netiquette
> > https://subspace.kernel.org/etiquette.html
>
> Hi Randy,
>
> Thanks for your feedback. I will correct the grammatical errors.
>
> Regarding the other codespell suggestions, if I make the changes
> then checkpatch script gives a lot of errors and warnings. Some
> are related to usage of tabs, line lengths etc. Being a beginner
> in the linux kernel development, I am not sure how to fix
> (or whether to ignore) those warnings. Would it be okay if I
> proceed with only the small number of changes I have suggested
> with this patch itself?

How concerned are you with fixing these?  This file is owned by
firmware teams within AMD and shared across different OSes.  It
defines the structures present in the ROM on the board.  I'm inclined
to just leave it be to avoid churn when syncing it with the canonical
source.  We can certainly try and push the fixes back up into the
canonical code as well, but that may not be the easiest process.

Alex
