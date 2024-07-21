Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A08993B1D8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942B910E4E6;
	Wed, 24 Jul 2024 13:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HTVck0/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0220710E0D3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 11:00:01 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5b97a9a9b4bso1465305eaf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 04:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721559601; x=1722164401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F4d9hcKyq7mfsinkWFd6mNdwGA6zkLrtbOX7X7kLTzs=;
 b=HTVck0/qWswO5NffU+5bD6Kyl3KbddZaAkCSzluMymtaXXEJqWE+2FIuBh18BoLu7D
 uw7LRbE2T6i/zsDHcK63QXwYCMNvM3JM5Q+7SJaJ5HTB/crk6D4N7UZqrUnh1kebLgaz
 afnBrh2XCra50k6hijnoMZeJIbRCtW842HcPJPDBgo7Yo34i6Ip9zvYWbjnnyjhmdLjo
 DhT0gRBoSObNQ+jjQdyh48f0ekHfpvBRa0fIe1C2ihaYyJ4bqKHUSrpopt0xD3wpwMAE
 dhNUSZgVWE3KADj5/SUnbSdzoVL/k0MBwXf1rS5fDYByv6h9uzXCvos5prJmV7eeT8gX
 NS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721559601; x=1722164401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4d9hcKyq7mfsinkWFd6mNdwGA6zkLrtbOX7X7kLTzs=;
 b=U1aJO9JCsjCjCneHriS1nUzkSg1/H9ON9P+o86dsVNgN8YzraBOPDcMgqiZBq2HVTP
 IgFd0VqV0e2W3zgfDqYF2SJNsS4AmCNA8taltSiJzxN64iZ3ZIS2JazshwSMebjyaHmd
 aI1z8/sX34m3lbg0PAiuuUBdt3brt8mIgiuMP83ywkU70F63b+SdRxE0yngsdBVEXn9M
 lVj5nqnKmDqGRsorBFR3dUcPCGTuvXPAtDL1AP4N+8zNR2yb8RadeZlhkBFT5woDdJP7
 uEZ9RGBLiazjB0hkr1OHllhnj7bwAHUdf9VzhqYDsYfBaIKVaYLvSOBQJCtsVfoRzB/b
 C4xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTSsduxEV0MDiC1cRInmmwO33zigXqFif1xE8vc9B8tMbcXEswbKssJvVHPhnQU1mFR5C9Tmz6VQmLDKkOLWIu/LlpQy5h5BWsIxOh8tPe
X-Gm-Message-State: AOJu0Yxctyqs0ensPv8cHNFOceLC3bUXGlAEPIvKxIRnErV03BnGqYNp
 KSVzaVZF5q8i8TaiH+2ledcROjKLTgCX7VcjOj8bdZF/H+DjXb/4auk8TgZwakKMY0dcsPOdQ6H
 RiepHV8l31TYiJV0CuLEdIRQh9Sfk1zPZbBKjKw==
X-Google-Smtp-Source: AGHT+IE4j9WP73i9CWB+IGTcHxkw4R080UwOV/uMJoCT3nUr8mMGASmr4CZyeUGTEVkb/tTv/1AOy0tX12CY2amV0EU=
X-Received: by 2002:a4a:e901:0:b0:5c4:e8d:58be with SMTP id
 006d021491bc7-5d564f6409bmr7562481eaf.3.1721559600858; Sun, 21 Jul 2024
 04:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240717093925.3017-1-terry_hsiao@compal.corp-partner.google.com>
 <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
In-Reply-To: <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Date: Sun, 21 Jul 2024 18:59:50 +0800
Message-ID: <CA+hhT3-77s+jjoBGw_fWWjsvO1kDu_JTDHgj=q-pEXcrkzPkLQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add panels with conservative timings
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:48 +0000
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

Hi Doug,

Thank you for your reply.
The patch has been modified and will be sent to you shortly.

The timings are set based on the panel datasheets in IssueTracker
(https://partnerissuetracker.corp.google.com/issues/348109270)
B116XTN02.3: B116XTN02.3(HW 9A)_HP_ Functional Spec_0617Y24.pdf
B116XAN06.1: B116XAN06.1_7A_HP_ Final Functional Spec 0617Y24.pdf
B116XAT04.1: B116XAT04.1 HW 0 A(HH)_ Pre Functional Spec_HP_ 0425Y24.pdf
NV116WHM-A4D: NV116WHM-A4D V8.0 Teacake  Product Specification-20240416.pdf
N116BCA-EA2: Approval Specification N116BCA-EA2_C3_20231212.pdf
N116BCP-EA2: TFT-LCD Tentative N116BCP-EA2 C2 for HP Ver 0.2-240502.pdf

On page 24 of the N116BCP-EA2
datasheet(https://partnerissuetracker.corp.google.com/action/issues/3481092=
70/attachments/57530666?download=3Dfalse),
the value for t9 as disable is "null".

If I have misunderstood what you mean, please correct me.

Thank you,

On Wed, Jul 17, 2024 at 10:58=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Wed, Jul 17, 2024 at 2:39=E2=80=AFAM Terry Hsiao
> <terry_hsiao@compal.corp-partner.google.com> wrote:
> >
> > The 6 panels are used on Mediatek MT8186 Chromebooks
> > - B116XAT04.1  (06AF/B4C4)
> > - NV116WHM-A4D (09E5/FA0C)
> > - N116BCP-EA2  (0DAE/6111)
> > - B116XTN02.3  (06AF/AA73)
> > - B116XAN06.1  (06AF/99A1)
> > - N116BCA-EA2  (0DAE/5D11)
> >
> > Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Please resend with a better patch subject, like "drm/panel-edp: Add 6
> panels used by MT8186 Chromebooks".
>
> Also: are you adding timings based on the datasheets, or are you just
> guessing here? The previous patches that added "conservative" timings
> were because the Chromebooks involved were really old and couldn't be
> tracked down and folks couldn't find the relevant datasheets. In the
> case of MT8188 I'd expect you to be adding timings based on the
> datasheets. Please confirm that you are.
>
> If possible, it's really nice to have the raw EDIDs for the panels in
> the commit message in case someone needs it later.
>
>
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index f85a6404ba58..ac280607998f 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1845,8 +1845,11 @@ static const struct edp_panel_entry edp_panels[]=
 =3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B11=
6XAN06.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B14=
0HAK02.7"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B14=
0XTN07.2"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B11=
6XTN02.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B13=
3UAN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B12=
0XAN01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B11=
6XAN06.1"),
>
> Please keep this sorted. For instance, 0xa199 should come _before_
> 0xd497, right?
>
>
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B11=
6XAT04.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B14=
0XTN07.7"),
> >
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Un=
known"),
> > @@ -1901,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT1=
40FHM-N47"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT1=
40FHM-N47"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT=
116WHM-N44"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV1=
16WHM-A4D"),
> >
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N11=
6BGE-EB2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, =
"N116BGE-EA2"),
> > @@ -1916,8 +1920,10 @@ static const struct edp_panel_entry edp_panels[]=
 =3D {
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1156, &delay_200_500_e80_d50, =
"Unknown"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, =
"N116BGE-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, =
"N116BCN-EB1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x115d, &delay_200_500_e80_d50, =
"N116BCA-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, =
"N116BCA-EA1"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, =
"N116BCJ-EAK"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N11=
6BCP-EA2"),
>
> It looks suspicious that all the panels around this one need 50 ms for
> disable but yours doesn't. While it's certainly possible that things
> changed for this panel, it's worth double-checking.
>
> -Doug
