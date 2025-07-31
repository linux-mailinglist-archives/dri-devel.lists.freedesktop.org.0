Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCCB16C7A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9171D10E254;
	Thu, 31 Jul 2025 07:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NQoh6Pe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B716F10E254
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 07:15:11 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-749068b9b63so389427b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753946111; x=1754550911;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebIwp+3F9+NHey8VVOff1SO0dtsb8JA0khxWTB2N6sU=;
 b=NQoh6Pe6RdhjwTiu9jek10UWQdr8vyH5gKooK+NbbtIHtHxkGXL/6pN5vbkd2zOEj3
 yg18NJgQWdd3ZVX3rXypjIVfPB/1r+WBs0Ch3l0B0n4kSu1klDgJGTNkzvt9cvD2/K81
 EGd0g/xvT8Ss3AdaH5OF+ipH2kT8mkWS3TJTCGdJl1RfcuwW83MJvJBqdVeQ8hzp3sDM
 9Tn000tUt6A3Zaxk4DHg3gmwTzFjNefY9puvNEL4iXZ0AYNgH3XmMlp2zB8e9ouAkG6X
 41wLK9SGntD8BXvSVqBM33eER8ZuRi81e2/A7wxPG9VJtPZRVwRmEELISbfzlvo6GDNX
 Vs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753946111; x=1754550911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ebIwp+3F9+NHey8VVOff1SO0dtsb8JA0khxWTB2N6sU=;
 b=Q4RTbE44NlbVSoDJQLhlJGja9ZkwOYaDNVuRuJo0JH7UONfGrnFaQWvgKYEi+G8OHq
 x3rrmf16P5V6kjgZy3dSURyIPqDd5+gHcT0zEGqBD9RpKJYwRt24lU7LEwyXgC2lQwpN
 yew0q3WsJIqK31T7b7ZZveScEXH6uVCPiaWcESN+ApABb18CkvOeQe6bHT6hKyqj8x61
 n2EBbOzga4d2NWEaFzqliePA3mnXLslN+L18O5VDZRqck5jSzqf3FWC7SGpd0UyCP/5u
 +cTIQJL6ehAb1CPv6fEaBMjqmN2TytUNTV5KtjY3vCXdW1pwxEL9TRyxpA+nCdUJyoAW
 R8hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCbpSs/H4R6CP06oH/imcAWt16I8Hg0pB/FpLPvjKvSX+wH1GyO5JQMhHgDNl7L4KDoI+SsdsZCdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygDBwauhKQRQC8dtp34qJUZwz+6KGx1eZ1/YYyWkzNX0epSvWX
 9hg96Wb0f9v3GDiHZSIOURWBMuYf4RnljP3SMrOfTr2pytzA+ibEbIJXoE60ZVhn42ftva1thhQ
 4QrLm5Z3B1Ef02M0M18efYzkHID5W55XqXMB60g8AUQ==
X-Gm-Gg: ASbGncs5pu5W9U6lNBhtRabmFYr/Jm5AYRR1qKI3NZoJJkCAkHgDn2EG8SDQIoyvQZt
 SaC/N3LA37ZljvzpoQuSoJUXAMVXRUwncf7YWDc4jz1DkuciB7LKkHa7qYr+t/yaPlRS4xEWslC
 8Ed3+mAIOUUApnD/A0I6pDk73y32FANrUb+SPDpQDhFzgxTJ9gcQtUt9mVyv/RDxrHl9x3Rx0Qf
 8OfNmKWzP0ydY7en5s=
X-Google-Smtp-Source: AGHT+IFxCb3ARGfnETbTMRgPvvmnockXkwo+EiwvwDtTxMifOrAfoOVw0QE01/bhkomwOXauA6I5K//DbPK1RBEnXLY=
X-Received: by 2002:a05:6a00:4b0c:b0:740:b394:3ebd with SMTP id
 d2e1a72fcca58-76ab092312amr9210141b3a.7.1753946111170; Thu, 31 Jul 2025
 00:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250730071629.495840-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=XThBbAwQcuR8Po6KfR0LwsfwR0HCr7j0Pk57n5XeQu9g@mail.gmail.com>
In-Reply-To: <CAD=FV=XThBbAwQcuR8Po6KfR0LwsfwR0HCr7j0Pk57n5XeQu9g@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 31 Jul 2025 15:14:59 +0800
X-Gm-Features: Ac12FXxI0TJh030Bm5HklbALhYKAI_pWpuJqLomZkTDF9e-W0HFnUtTz4czMwQg
Message-ID: <CAHwB_NJ3yQxf9fTMT_cQv50z8X_NKyQMOJEuqDqY-BfKX8QzXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add several generic edp panels
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Doug Anderson <dianders@chromium.org> =E4=BA=8E2025=E5=B9=B47=E6=9C=8831=E6=
=97=A5=E5=91=A8=E5=9B=9B 01:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Wed, Jul 30, 2025 at 12:16=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Add a few generic edp panels used by mt8189 chromebooks, most of them u=
se
> > the same general timing. For CMN-N116BCA-EAK, the enable timing should =
be
> > 200ms. For TMA-TL140VDMS03-01, the enable timing should be 80ms and the
> > disable timing should be 100ms.
> >
> > 1. AUO B122UAN01.0
> > 2. AUO B116XAK02.0
> > 3. AUO B140UAN08.5
> > 4. AUO B140UAX01.2
> > 5. BOE NV116WHM-N4B
> > 6. BOE NV116WHM-T01
> > 7. CMN N122JCA-ENK
> > 8. CMN N140JCA-ELP
> > 9. CMN N116BCA-EAK
> > 10. CSW MNE007QS5-2
> > 11. SCW MNE007QB2-2
>
> nit: CSW, not SCW.

Fix next version, thanks.

>
>
> > 12. TMA TM140VDXP01-04
> > 13. TMA TL140VDMS03-01
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
>
> Please make the subject line a little less generic so we can tell one
> change for the next. If all changes just say "add more panels" then
> when cherry-picking and looking at patch subject lines it's hard to
> tell which patches have been picked and which haven't.
>
> In this case you could mention that the panels are used by mt8180
> Chromebooks, like:
>
> drm/panel-edp: Add edp panels used by mt8180 Chromebooks
>
> Also: even though it's a bit of a pain, can you please include the
> EDIDs in your commit message? I know there are 13 panels and that can
> make a long commit message, but I'd still rather see it here just in
> case we have to later go back and reference exactly what panel you
> were working with in case some manufacturer re-uses panel IDs (it's
> happened in the past).

Got it, fix next version, thanks.

>
>
> > @@ -1865,6 +1880,7 @@ static const struct panel_delay delay_200_500_e50=
_d100 =3D {
> >   * Sort first by vendor, then by product ID.
> >   */
> >  static const struct edp_panel_entry edp_panels[] =3D {
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x04a4, &delay_200_500_e50, "B12=
2UAN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x105c, &delay_200_500_e50, "B11=
6XTN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B12=
0XAN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x125c, &delay_200_500_e50, "Unk=
nown"),
> > @@ -1883,6 +1899,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "=
B116XAK01.0",
> >                          &auo_b116xa3_mode),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unk=
nown"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x52b0, &delay_200_500_e80_d50, =
"B116XAK02.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B13=
3UAN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B11=
6XAN06.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B11=
6XAN06.3"),
> > @@ -1890,10 +1907,12 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B14=
0XTN07.2"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B11=
6XTN02.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B13=
3UAN01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x8bba, &delay_200_500_e80_d50, =
"B140UAN08.5"),
>
> All the old AUX panels seem to use just "e50" but all the new ones
> you're adding use "e80_d50". That looks really suspicious. Are you
> sure that these new panels need "e80_d50"? Were the old definitions
> wrong?

I checked all the panel specs again, most of them require "e50", only
a few require "e80_d50".
Sorry, I took the maximum value, will fix it in the next version. Thanks.
