Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237717DFC0A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 22:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA22910E031;
	Thu,  2 Nov 2023 21:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1A410E0A9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 21:34:41 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6ce2d4567caso741134a34.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 14:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698960881; x=1699565681;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIwpZ0lZxQMWwQetDJPdxMJUm6+srF8KlCiuJbjCW6E=;
 b=XK8eyrx2Ag0Al0Na1Tpe207l4NyMFAb894dB0MsqJaMXfrrfDyegJFnF6Ks9Z56lgU
 qxnDpyjXwd+ZysJQEFGPYYtLojiDfwvRuib8m2SPlC9gaf+bBFiX0sKj2bjuCXNHnFDO
 IHZ3jMB2eQYLK5Rd12VJHL75i7UtZmKUGd+9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698960881; x=1699565681;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIwpZ0lZxQMWwQetDJPdxMJUm6+srF8KlCiuJbjCW6E=;
 b=VdvaYK4Z/S8cn2TQ9v472UL+kjJZxRQZaJA963pf6KhtyylwoSfiPE5vmHdHUuBXb0
 eTVGDragoJinS0unNt9DOJ17npFEH6PpHgNs4R0YA/yCjRtG7ooR9BFrmt5nOoJZ4TsB
 /Q16vhht6pGWUov/ZYxQsUH9Nwg6qMsuDZNF3x8Flhnc7sqAFoLJknOd97Uj86y8/0k3
 HM0rRp7FjVfEBl4ufNY9hF8cH0hqbgLFnWp7v8CBggwwx11BbKzJssBKVLd87VPTAdkI
 sN40Z0g7Zay00X3nwvpNY1SOjt0sjsOnahmpTJ1ABZ0JEKt8OX/1tphJ0Noq9giYFbQv
 6URw==
X-Gm-Message-State: AOJu0YwdPKkEeUwdIKGDIRhuO2YcQS0Dl+Y+iCsFjPenH74MR6xp3lNK
 CXbiuKwMLNj3rMqA2E2wiR0lfffFhzTUL0MyAyxKRw==
X-Google-Smtp-Source: AGHT+IEnfNmXM9E6t5otMJC4GFfDUYkR29i+py7g7gnp016g9iC8ZR+DHpD2kB7JOKrpX+grr7FDYqbf4XBjghB2V7E=
X-Received: by 2002:a05:6830:3494:b0:6d2:eb63:e47b with SMTP id
 c20-20020a056830349400b006d2eb63e47bmr20005594otu.2.1698960880690; Thu, 02
 Nov 2023 14:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-2-hsinyi@chromium.org>
 <CAD=FV=UArV6uF7Q6=Z0D6u30BGEPLjNiBeZMiDMjpneAKnSTcw@mail.gmail.com>
In-Reply-To: <CAD=FV=UArV6uF7Q6=Z0D6u30BGEPLjNiBeZMiDMjpneAKnSTcw@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Nov 2023 14:34:14 -0700
Message-ID: <CAJMQK-hGrNAu-kf6sf_oF+B+63JtDz57+JXSd_w87LqSER+hhw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add several generic edp panels
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 2, 2023 at 9:54=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Nov 1, 2023 at 2:26=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
> >
> > Add a few generic edp panels used by mt8186 chromebooks.
> > Besides, modify the following panel:
> > - AUO 0x235c B116XTN02 renamed to B116XTN02.3.
> > - AUO 0x405c B116XAK01 adjust the timing to delay_200_500_e50. Accordin=
g
> > to the datasheet: T3=3D200, T12=3D500, T7_max =3D 50.
>
> Can you modify this in the `auo_b116xak01` structure? That should make
> timing work more correctly for anyone directly specifying this panel.
> The reason I had it point to the other structure was so we didn't
> treat anyone specifying this panel directly differently than anyone
> autodetecting it...
>
Will modify in v2.
>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 62 ++++++++++++++++++++++++++++++-
> >  1 file changed, 60 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 9dce4c702414..06ce3a73d740 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1830,6 +1830,12 @@ static const struct panel_delay delay_200_500_e5=
0 =3D {
> >         .enable =3D 50,
> >  };
> >
> > +static const struct panel_delay delay_200_500_e80 =3D {
> > +       .hpd_absent =3D 200,
> > +       .unprepare =3D 500,
> > +       .enable =3D 80,
> > +};
> > +
> >  static const struct panel_delay delay_200_500_e80_d50 =3D {
> >         .hpd_absent =3D 200,
> >         .unprepare =3D 500,
> > @@ -1849,6 +1855,25 @@ static const struct panel_delay delay_200_500_e2=
00 =3D {
> >         .enable =3D 200,
> >  };
> >
> > +static const struct panel_delay delay_200_500_e200_d10 =3D {
> > +       .hpd_absent =3D 200,
> > +       .unprepare =3D 500,
> > +       .enable =3D 200,
> > +       .disable =3D 10,
> > +};
> > +
> > +static const struct panel_delay delay_200_150_e50 =3D {
> > +       .hpd_absent =3D 200,
> > +       .unprepare =3D 150,
>
> I worry a little bit about seeing "unprepare" of 150. It doesn't mean
> it's wrong, but it's been so consistent for me to see .500 here that
> it's good to double-confirm. It looks like you use this one on
> "KD116N2930A15". From the datasheet I see that T12 has a min of 150 ms
> and a max of 500 ms. Is that the same thing you see?
>
> Specifying a "max" for T12 makes no sense. That's saying that it
> violates timing specs to ever turn the panel off for more than half a
> second which is nonsense.
>
> Given that:
> * The spec is obviously nonsense for this number.
> * The 500 ms number is present in the spec and somewhat standard for eDP =
panels.
> * Having a larger number is safer.
> * 500 ms usually won't have a real world impact since it just prevents
> turning on the panel again right after turning it off (and we use
> autosuspend to avoid this in most cases).
>
> Maybe it's better to just use 500 here?
>
The spec said min =3D 150 and max =3D 500.
I'll modify to 500 in v2.

>
> > +       .enable =3D 50,
> > +};
> > +
> > +static const struct panel_delay delay_200_150_e200 =3D {
> > +       .hpd_absent =3D 200,
> > +       .unprepare =3D 150,
> > +       .enable =3D 200,
>
> Let's look at this unprepare of 150 too. I guess it's used for two panels=
.
>
> NT116WHM-N21: Wow, there sure are a lot of panels that call themselves
> "NT116WHM-N21" but have different IDs. :-P If you're sure that this is
> 150 this is fine, but if there's any doubt (like above) then 500 is
> safer.
>
> R140NWFM R1: I think I found this spec and yeah, it's super clear. 150 ms=
.
>
>
> NOTE: I didn't try to double-check any of the other timings, mostly I
> just looked at the unprepare since it stood out. ;-)
>
0x0715 NT116WHM-N21 mentioned T12 >=3D 150  (no upper bound mentioned).

>
> > +};
> > +
> >  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id=
, _delay, _name) \
> >  { \
> >         .name =3D _name, \
> > @@ -1869,38 +1894,71 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B11=
6XAB01.4"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B13=
3UAN02.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B11=
6XAK01.6"),
> > -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B11=
6XTN02"),
> > -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B=
116XAK01"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B14=
0HTN02.1"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B11=
6XTN02.3"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B11=
6XAN06.1"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B11=
6XTN02.5"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B14=
0HAN04.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &delay_200_500_e50, "B11=
6XAK01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B13=
3UAN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B11=
6XAN06.1"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B11=
6XAN06.3"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B14=
0HAK02.7"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B13=
3UAN01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B14=
0XTN07.7"),
> >
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0715, &delay_200_150_e200, "NT=
116WHM-N21"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0731, &delay_200_500_e80, "NT1=
16WHM-N42"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0741, &delay_200_500_e200, "NT=
116WHM-N44"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "N=
V116WHM-T01"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay,=
 "NV133FHM-N61"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f6, &delay_200_500_e200, "NT=
140FHM-N44"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay,=
 "NV133FHM-N62"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x08b2, &delay_200_500_e200, "NT=
140WHM-N49"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT1=
16WHM-N21,836X2"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT1=
16WHM-N21"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE1=
35FBM-N41 v8.1"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV1=
16WHM-N49 V8.0"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT1=
16WHM-N21"),
>
> 0x904b is already specified above and this is in the wrong sort order.
>
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV1=
16WHM-N47"),
>
> Please sort 0x0951 before 0x0979.
>
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay,=
 "NV110WTM-N61"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x09ae, &delay_200_500_e200, "NT=
140FHM-N45"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT1=
16WHM-N21"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV1=
16WHM-N45"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV1=
16WHM-N4C"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV=
140FHM-T09"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT1=
40FHM-N47"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT1=
40FHM-N47"),
> >
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, =
"N116BGE-EA2"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.del=
ay, "N116BCA-EA1-RC4"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, =
"N116BGE-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.del=
ay, "N116BCA-EA1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1145, &delay_200_500_e80_d50, =
"N116BCN-EB1"),
>
> Please sort 0x1145 above 0x114c
>
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, =
"N116BCN-EA1"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, =
"N116BGE-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, =
"N116BCA-EA2"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, =
"N116BGE-EA2"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, =
"N116BCN-EB1"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, =
"N120ACA-EA1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, =
"N140HCA-EAC"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, =
"N140HGA-EA1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N14=
0HGA-EA1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, =
"N140HGA-EA1"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, =
"N140HCA-EAC"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, =
"N140BGA-EA4"),
> > +
> > +       EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB=
116AN01-2"),
> >
> > +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x048e, &delay_200_500_e200_d10,=
 "M116NWR6 R5"),
> >         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R1=
40NWF5 RH"),
> >         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "=
M133NW4J"),
> >         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "=
R133NW4K-R0"),
> > +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R1=
40NWFM R1"),
> >
> >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30=
nv_a010.delay, "116N21-30NV-A010"),
> >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, =
"116N29-30NK-C007"),
> > +       EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_150_e50, "KD1=
16N2930A15"),
>
> Please sort 0x0809 above 0x1120.
