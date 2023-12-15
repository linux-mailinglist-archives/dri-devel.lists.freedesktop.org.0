Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3905A8143C6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 09:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3333510E334;
	Fri, 15 Dec 2023 08:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F24510E32A;
 Fri, 15 Dec 2023 06:55:13 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6cebcf8a48aso274356b3a.3; 
 Thu, 14 Dec 2023 22:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702623313; x=1703228113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wW3WF9+yE7Fm8DHl64+vajrAUnSKM81cqUzh0Jur8M8=;
 b=dUxcZAbVwoRKJdvdzbi5Kq0NkBqZNNiPDK8g13sArnK2nJeStEEdYgAct54BO2gaE3
 VHGlXqPsHStisXmlc0mdHOdjeapbyE40glRfF5Xl+vMPtNQn/ePWx/80k1IZgemg5eI/
 1QQbfQZOZ6oHDeTPxeL9ZObyQ6Vuga8bCzzdjzuHC61SI5yVbFDOtaXwipEO8C1jqBGm
 sRGZ9RLaB+tnkj8Zn4YzRmiLJoo9kh9GVS4450UOojXm68NiWSgAMZFIkyUYlVyZgoC6
 /5lH+CwM1+37ZiPZfJBnobvpK13UvWAXBWHyalFoY6AdB3SXSyVUINBsxv+0zeZx18Ni
 fq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702623313; x=1703228113;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wW3WF9+yE7Fm8DHl64+vajrAUnSKM81cqUzh0Jur8M8=;
 b=ID81PM5f2rYx4eJBuYZNLLZyZ8V6sNRqnKPmwqvERPiettJKnCSunqp0/3v0UctyKo
 fEWfItFWAJs+JdtQaqnR2GxUVHmf6aXd18C0I5cW9SkS8FHUp4CPjbwXlRNxVTmDCMfk
 N6RssEDs8WgsmPkBJohwE72imqVrKezAHfwKxPd1QD5iRTbt6GLDQ+QR6na4hkMlShPB
 h7SrMPF9XTCQxU1chXHhQ7B99mhjHB1VFJDLKBhwsf874YtBe79rjM+9rD5P0CX4dhO5
 U1iawVlfeYNyKMHKXHe+T2kIDR5VjdCBizQH5rv5HQI+HNDM9VNOESQddgXPupzy6MYK
 UNhw==
X-Gm-Message-State: AOJu0YyHBYRH2MhdRd4jd3k/LL5/FSMI/Hhljl93gyJUOZsG55M28Ntr
 JlwqBXHIfmpR/0EVk6qppSeFAlCxS5nmlA1TMog=
X-Google-Smtp-Source: AGHT+IGPkfV7hNbg63dlvmC9Me/aKmPpSuwzxEZdk0PYRCQAfXjtY5wCwqdgCiwgYgU1akmtIIUMwo4xZdFuEsr0N30=
X-Received: by 2002:a05:6a00:4653:b0:6ce:6f99:4ec4 with SMTP id
 kp19-20020a056a00465300b006ce6f994ec4mr14009886pfb.1.1702623313006; Thu, 14
 Dec 2023 22:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20231215052033.550509-1-ghanshyam1898@gmail.com>
 <5a58e510-e5b4-42ae-95a3-257ca802212a@infradead.org>
In-Reply-To: <5a58e510-e5b4-42ae-95a3-257ca802212a@infradead.org>
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Date: Fri, 15 Dec 2023 12:24:36 +0530
Message-ID: <CAG-Bmocu0nL-AW=nR7ZaTG4fzRvw4XSq5grk4N-wDRF0opMR4Q@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: fixed typos
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 15 Dec 2023 08:39:42 +0000
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
Cc: lijo.lazar@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le.Ma@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, candice.li@amd.com, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 10:59=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Hi--
>
> On 12/14/23 21:20, Ghanshyam Agrawal wrote:
> > Fixed multiple typos in atomfirmware.h
> >
> > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/include/atomfirmware.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/d=
rm/amd/include/atomfirmware.h
> > index fa7d6ced786f..41d553921adf 100644
> > --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> > +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> > @@ -210,7 +210,7 @@ atom_bios_string          =3D "ATOM"
> >  };
> >  */
> >
> > -#pragma pack(1)                          /* BIOS data must use byte al=
igment*/
> > +#pragma pack(1)                          /* BIOS data must use byte al=
ignment */
> >
> >  enum atombios_image_offset{
> >    OFFSET_TO_ATOM_ROM_HEADER_POINTER          =3D 0x00000048,
> > @@ -452,7 +452,7 @@ struct atom_dtd_format
> >    uint8_t   refreshrate;
> >  };
> >
> > -/* atom_dtd_format.modemiscinfo defintion */
> > +/* atom_dtd_format.modemiscinfo definition */
> >  enum atom_dtd_format_modemiscinfo{
> >    ATOM_HSYNC_POLARITY    =3D 0x0002,
> >    ATOM_VSYNC_POLARITY    =3D 0x0004,
> > @@ -645,7 +645,7 @@ struct lcd_info_v2_1
> >    uint32_t reserved1[8];
> >  };
> >
> > -/* lcd_info_v2_1.panel_misc defintion */
> > +/* lcd_info_v2_1.panel_misc definition */
> >  enum atom_lcd_info_panel_misc{
> >    ATOM_PANEL_MISC_FPDI            =3D0x0002,
> >  };
> > @@ -683,7 +683,7 @@ enum atom_gpio_pin_assignment_gpio_id {
> >    /* gpio_id pre-define id for multiple usage */
> >    /* GPIO use to control PCIE_VDDC in certain SLT board */
> >    PCIE_VDDC_CONTROL_GPIO_PINID =3D 56,
> > -  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swithin=
g feature is enable */
> > +  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC switchi=
ng feature is enable */
>
> s/enable/enabled/
>
> >    PP_AC_DC_SWITCH_GPIO_PINID =3D 60,
> >    /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot featu=
re is enable */
>
> Ditto.
> There may be a few more that need this same treatment.
>
> >    VDDC_VRHOT_GPIO_PINID =3D 61,
>
> The other changes look good as far as they go, but codespell reports
> a few more misspellings to consider:
>
> atomfirmware.h:213: aligment =3D=3D> alignment
> atomfirmware.h:257: Offest =3D=3D> Offset
> atomfirmware.h:258: Offest =3D=3D> Offset
> atomfirmware.h:390: Offest =3D=3D> Offset
> atomfirmware.h:455: defintion =3D=3D> definition
> atomfirmware.h:648: defintion =3D=3D> definition
> atomfirmware.h:686: swithing =3D=3D> switching
> atomfirmware.h:704: calcualted =3D=3D> calculated
> atomfirmware.h:967: compability =3D=3D> compatibility
> atomfirmware.h:981: intenal =3D=3D> internal
> atomfirmware.h:993: intenal =3D=3D> internal
> atomfirmware.h:3469: sequece =3D=3D> sequence
> atomfirmware.h:3507: indiate =3D=3D> indicate
> atomfirmware.h:4429: stucture =3D=3D> structure
> atomfirmware.h:4430: stucture =3D=3D> structure
> atomfirmware.h:4462: regiser =3D=3D> register
>
>
> thanks.
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html

Hi Randy,

Thanks for your feedback. I will correct the grammatical errors.

Regarding the other codespell suggestions, if I make the changes
then checkpatch script gives a lot of errors and warnings. Some
are related to usage of tabs, line lengths etc. Being a beginner
in the linux kernel development, I am not sure how to fix
(or whether to ignore) those warnings. Would it be okay if I
proceed with only the small number of changes I have suggested
with this patch itself?

Thanks & Regards,
Ghanshyam Agrawal
