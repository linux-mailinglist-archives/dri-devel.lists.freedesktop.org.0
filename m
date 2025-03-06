Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7BA55308
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AA810EA3E;
	Thu,  6 Mar 2025 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ilWfZpve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E509B10EA3A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:28:45 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5498fd0bce9so238544e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741282122; x=1741886922;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcYLtQtFcJVERSEpil+pumE+zKeboAooomdKuemFYqs=;
 b=ilWfZpvefI5cKN8J2ry2qmjufldgiiU5tWA/cqyxHbW3KXUbW3s4YRrf8e05g5hRur
 Kwo+6b2WNSX990omLHuW7oheOcIjmNgrsfoNaq2l0RgY8TxnkD6dK3H3oawiUAbdVcN7
 1ZqffayOIBNjIsksRyPkdVlWbPiRyyHpx2wLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741282122; x=1741886922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mcYLtQtFcJVERSEpil+pumE+zKeboAooomdKuemFYqs=;
 b=FiJpu1XX4e8sWl3xsuKGnPAg/EzeuJ5I6sEGohuMT03DsKPoCt7Gl6hg4W9NVAlL03
 nrgxPfIrI/wYFmxNHwwtcAAKudAFgto04FW3fn+Z81zQhp9lhVRDREOWRwxA8q4+vc3u
 8BqK9XLsDrnaPA5JxBvSOpRRozHBYiP/1z/LY2TALvJgoRYnS5EonYr0YubGJY7xIOh/
 2eO1ku0g2jyMoSvUheujCmWYw2GqGK1Ti3X9Z3sDHjamhAFY4GwoAI7rFgIbBzpYmNfp
 WAd0Gr9ye+jWQm4Zsv8mlADoOyCUD9H8msjRfd3kgp10sOo4RuGyrFNOH17Cdi0xDKIs
 vVNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRW2IWQ8qR7nLyOlEtN/tI3bNuOWBqQi1UJ3mfv9mC/9aZGsZu0OBLSNho/CY4FmfHVDFTcoN7R/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIBtuxqJHSNHojF3zVEVi2b9rhQ8JABRQhQ5N4CYmGQpW8OTnt
 RaeyakEVOUxUqkZ8XInbe0m8CpTDs6kUuL0CQGINI4r0JxpF6wYxDXXaRkwogr280G8cNiLwTji
 +Kw==
X-Gm-Gg: ASbGncvxXZx9wncaAqzYC5usRKlWFgRfZ1MvQi9/0z8/hKBAsY4aYFu/dN8QLzio8kl
 YBO0zZrTO4rqhRcqo7pKEMRh9okA/mRox2Zd5x1xEdXcEFwnY8to3YxiRbf+Ha0SvsBRr58U0ZP
 Kiyr0yO0z+8u+m4DflRNAR5UB4u2Xiq5qQW8jvkUaLZiNnCzS+g31hS9tSFW+mnyqr2YO+hXR/s
 pmrwSRJmKtCHNAR6ppzN5RQoujRoHsJaaK5lXiey8maKwewt7RN46GyMkTjhdQyh1Xl1Rm3nHMi
 emeAtTZs67+glKEfpM6N2XxzGMZ5EIojTGn1QQxIl+KOo7/UQVtdfAv8DwlZp/+JQEH9J6zzJID
 +NVUuyRTZENzj
X-Google-Smtp-Source: AGHT+IGP+ok4ZaYPHm6HravbIWDDVTGnUaeAxNh2hEuvoaAaz2POygv6Mm6e35E7FNTP/MqLo8JBRg==
X-Received: by 2002:a19:2d04:0:b0:549:8809:ee32 with SMTP id
 2adb3069b0e04-5498809ef09mr1204837e87.22.1741282121811; 
 Thu, 06 Mar 2025 09:28:41 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98f2690sm2656231fa.41.2025.03.06.09.28.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 09:28:41 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30795988ebeso9917321fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:28:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU3HjtCGf7MKjJn7nYJyZkuk2Mh1aye3yg2WhEOU9chl4t7EWocZuB9puXO1do0F0dsoazQ6pWHv7U=@lists.freedesktop.org
X-Received: by 2002:a2e:a7ca:0:b0:30b:ec4d:e5df with SMTP id
 38308e7fff4ca-30bec4de914mr11851411fa.34.1741282119425; Thu, 06 Mar 2025
 09:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
In-Reply-To: <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Mar 2025 09:28:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VoW-Zm5wY6Y9sr=GqnvfMP4urGw_zW8NJRHpdC4=rHXQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr1-LLEB7JrjwWuYQdAGvG4JTZtH7uIFum92liwSSosme4aK6w5V5SVM8Q
Message-ID: <CAD=FV=VoW-Zm5wY6Y9sr=GqnvfMP4urGw_zW8NJRHpdC4=rHXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: neil.armstrong@linaro.org
Cc: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lujianhua000@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
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

On Thu, Mar 6, 2025 at 6:05=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 06/03/2025 14:43, Tejas Vipin wrote:
> > Changes the novatek-nt36523 panel to use multi style functions for
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++--------=
-
> >   1 file changed, 823 insertions(+), 860 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gp=
u/drm/panel/panel-novatek-nt36523.c
> > index 04f1d2676c78..922a225f6258 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > @@ -23,10 +23,12 @@
> >
> >   #define DSI_NUM_MIN 1
> >
> > -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
> > -             do {                                                 \
> > -                     mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > -                     mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, seq=
...)      \
> > +             do {                                                     =
       \
> > +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq)=
;      \
> > +                     dsi_ctx1.accum_err =3D dsi_ctx0.accum_err;       =
         \
> > +                     mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq)=
;      \
> > +                     dsi_ctx0.accum_err =3D dsi_ctx1.accum_err;       =
         \
>
> Just thinking out loud, but can't we do :
>
> struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D NULL };
>
> #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq..=
.)      \
>                 do {
>                         dsi_ctx.dsi =3D dsi0;                            =
         \
>                         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);=
       \
>                         dsi_ctx.dsi =3D dsi1;                            =
         \
>                         mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);=
       \
>
> ?
>
> So we have a single accum_err.

Even though the code you used was what I suggested in IRC, I like
Neil's suggestion better here. What do you think?

Other than that, it looks good to me.

-Doug
