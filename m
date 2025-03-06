Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C18A55333
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC18E10E056;
	Thu,  6 Mar 2025 17:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YUH6+jI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6210E056
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:37:39 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5498c742661so910225e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1741282655; x=1741887455;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hrmy4N2N6H45SCFx9m0r+IsEyPbwtHoe5bS5CVO84lo=;
 b=YUH6+jI6kypSABJL7OmVX7IxopXtj260x9PLFRCuqb8j25zR5p/COLMx+xMt8i5tBX
 gWT+L1OaojaFx6AKFxqwYDwqERb6vqfd7LgRDUhBQ0Ui4lbyWMV5SSZu54TkZOzYBDas
 nzsgSTNWY2mhb3lSCCSgDvvUZvpnzr2BVHzM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741282655; x=1741887455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hrmy4N2N6H45SCFx9m0r+IsEyPbwtHoe5bS5CVO84lo=;
 b=EifROfBOWtxtJ1trcaeYNMBJJXGx7QAFIC01ZXCmbFLbH2t+v/b8ZYtIn7wddT23WB
 f36ZUJw5kw37RCLmjrxYHOXU0e6Jj8gMB3ZedlaEKr1toYuO+DqD8DlriiivpN3/u2AL
 8IJtZmsCo1bMqmTLDGHWebtdqSrbOfKpsc0inm39zpKQcQEN0BgwWNq1gO6eO8Uk0OSe
 wqaywhQqrVsuvxJhpXsZKvmP73EOlREERZaEWgshPdQ1emoExEyHqJBPkpgLw0AHY2Dl
 cIFbTZFZlH42L9Wr759t73ggP2Y7EY5Cwp4IrbGoBDentQsVP+htu6PY11JRu1MLki5e
 F4cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2nNpD1K3wQzozOkjiZgTBGtrYp/kLzeFy/pFgEePVxQo9wqk0PuSGwMXXpsxoUWrmTyPQAnfVKFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmNKNyvVM3Ok7T8aKzTBI3ZTd9LoPmPzNbr68eJmAHOHwF4GTa
 Db16BOKMdCgAlyRSmwwYjTJz8r/KImYfiLrrjz8+omTs8b8MU3y0yU4htEXGMaye6kp4ENHDErv
 WXq+i
X-Gm-Gg: ASbGncsWgf4/pc4RyzV6Qm0iX+nJ3SiWops+PjWsK09uduNi4aM/AfHjAjkeQPODg7/
 BxWDa6IueYLY+A6ONJb3yBxBKAuFKjQUS8r3wOTTSGQZC6FgY1yx6U74ocx1hA0Mdnj0LyGMJI2
 FaM3zpaIVhh4aPYt0WVQn0C/vgchHMqJIZrYlvQlegrj7in9TGo9Lb9FAzfor+GOvgXgyMemVab
 cCvOHTA/NBZjR/fTLH9N8cUCICZg86FXQXZzErQ82AMyshLb3J5E4uzQoYIWaM7giuHZuypUicS
 zutS2UZ6L84VXk+oOm15WwR4qkP/RTo+cJaQ2fFeglSK6X1ImmFSFCnqbnmaCwfoj5GCN4cxnOS
 PwsjqpeBp
X-Google-Smtp-Source: AGHT+IGhbAXhaDnxPo2c/1U9piEB7t5lLJr7auuE3dXjZLHs7KH1rQFiOWv9N0aSoWh1RD0rC0qZ6Q==
X-Received: by 2002:a05:6512:114e:b0:549:7c13:e88a with SMTP id
 2adb3069b0e04-54990e5d488mr8004e87.17.1741282655066; 
 Thu, 06 Mar 2025 09:37:35 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae46601sm240498e87.1.2025.03.06.09.37.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 09:37:31 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5498c742661so910008e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 09:37:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7S0oQ9ZtAeR4/ZkfK3y9M1330AMNaiR1FilQi0GiLIjyn9j22NWb0vY2jF5EOn27fRla0XJiCZpo=@lists.freedesktop.org
X-Received: by 2002:a05:6512:ba3:b0:545:1d96:d702 with SMTP id
 2adb3069b0e04-5497d380ca6mr3503371e87.48.1741282650614; Thu, 06 Mar 2025
 09:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
 <p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb>
In-Reply-To: <p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Mar 2025 09:37:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XyOwoMmdvFA565AzGRUSNwonQ-5Ke2H6jc2ki9Sz+0Pg@mail.gmail.com>
X-Gm-Features: AQ5f1JrjbFVtoGA2nDwsNiD6Pg8ldMrCyTA0zDfBVytct4PwWSu2rnonE6kHuA0
Message-ID: <CAD=FV=XyOwoMmdvFA565AzGRUSNwonQ-5Ke2H6jc2ki9Sz+0Pg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, Tejas Vipin <tejasvipin76@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lujianhua000@gmail.com, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
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

On Thu, Mar 6, 2025 at 8:33=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Mar 06, 2025 at 03:05:10PM +0100, neil.armstrong@linaro.org wrote=
:
> > On 06/03/2025 14:43, Tejas Vipin wrote:
> > > Changes the novatek-nt36523 panel to use multi style functions for
> > > improved error handling.
> > >
> > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > ---
> > >   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++------=
---
> > >   1 file changed, 823 insertions(+), 860 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/=
gpu/drm/panel/panel-novatek-nt36523.c
> > > index 04f1d2676c78..922a225f6258 100644
> > > --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > > +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > > @@ -23,10 +23,12 @@
> > >   #define DSI_NUM_MIN 1
> > > -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        =
\
> > > -           do {                                                 \
> > > -                   mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > > -                   mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > > +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, s=
eq...)      \
> > > +           do {                                                     =
       \
> > > +                   mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq)=
;      \
> > > +                   dsi_ctx1.accum_err =3D dsi_ctx0.accum_err;       =
         \
> > > +                   mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq)=
;      \
> > > +                   dsi_ctx0.accum_err =3D dsi_ctx1.accum_err;       =
         \
> >
> > Just thinking out loud, but can't we do :
> >
> > struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D NULL };
> >
> > #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq=
...)      \
> >               do {
> >                       dsi_ctx.dsi =3D dsi0;                            =
         \
> >                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);=
       \
> >                       dsi_ctx.dsi =3D dsi1;                            =
         \
> >                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);=
       \
> >
> > ?
> >
> > So we have a single accum_err.
>
> I'd say that can be counter-prodactive. If only one of the links falls
> apart, then the second link still can be initialized (and by observing a
> half of the screen the user / devloper can make several assumptions).
> In case of using just one context the driver will fail on the first
> error and skip the rest of the init for both halves.
>
> I'd have a different suggestion though: what about passing two contexts
> to the init_sequence callback and letting nt36523_prepare() handle each
> of the error separately?

IMO that's a bit outside the scope of what Tejas is doing since it's a
functional change. Unless something is a super obvious bugfix it feels
like doing the conversions like we're doing here should not include
functionality changes and should be straight conversions.

Also: I don't have tons of experience with dual MIPI panels, but I'm
not totally sure how your suggestion would work in the end. Would you
expect that if one panel succeeded and the other didn't that the
prepare/enable calls in the panel should return "success"? If they
don't then higher levels will assume that the single "panel" that
they're aware of didn't initialize at all and won't continue to do
more. That means the user wouldn't have a chance to observe half the
screen working.

I could believe that, for all practical purposes, we could keep the
errors separate and then just return the if either panel got an error
in the end. It probably wouldn't make a huge difference and would
shrink the code side. ...but that I think that should probably be the
second patch in the series and not squahsed into the conversion.


Oh, also: Tejas, please make sure you CC Anusha on your patches. :-) Added =
here.
