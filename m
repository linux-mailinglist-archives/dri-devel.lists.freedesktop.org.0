Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F089BC75
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F6B10F8A5;
	Mon,  8 Apr 2024 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X5PrIvnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF9E1123BA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:58:31 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d8129797fcso57364971fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712570309; x=1713175109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hOCibkj9n2YGDsJnfwHwezgEyxL9relr5LeEYsYkEw=;
 b=X5PrIvnWYqfRzkNak/7fWkWBdToC71Hq3Zz2ubCdtMIQf/EAdf0lZIUSI1hbFsxt45
 MnfSK9y5nZct4YfFzK7FmnO2yNMDDJ9+NqQlgZScYa8kgUanYPgCe1A7l0YfyO9Cpf+2
 igNBc9Ps1JLWx5JkaHFV6p39RaJYlGmGMDtXCLz7QsF3np3mlcIfg2SjrwEA8VyGV8Jp
 P4r+osIOfub6V1lVUzYjXhoDTGHe4Pue3VDT9LY+2TmoOY4DN8iwxn7L4CQoKi4fZYH9
 ppCQGpRR6u0JzqXSyXS5eM21i/wnl3zDMxZO1zox6dF89O4lrmzScI8vppuhqww3hD1c
 YX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712570309; x=1713175109;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hOCibkj9n2YGDsJnfwHwezgEyxL9relr5LeEYsYkEw=;
 b=Pbnt56JwHWXr3MXbAx7x511HvMKmQQEcAwHUIjrXWJK2NcjUYL13waCJGumk3FM4xL
 I4969t4eq7whTbVRh3qpwy3QU5OCzR4laP4QkGETo9SOtkCn7wYNGZSYTfFDKuVnUmCo
 lr51DwJS3MgwYzbFtuuqRZWv82QL5F+H8DGhewccnOgZsmqbfWPOrSCVmFus/jn8CNlw
 WuXKziOy1BsnewWtAELqP4AcjQ1jf9B+k4ugvWGSeND9gLRUMIdap8Kh/BqboNBK0naf
 syKx4qUJZ/siSidAuvEI7Cd1yN/wmNZALu0dJHYUnac/uSFuG7EpvqGl3RoMzPxThRHL
 Arwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZBTjhSBnZmvtVYsb+4Eaf3iZJh7u062+Od23wjsEs3i+Qc451xysXa3wDEVpSgBjhvpIoYuA4m97uK3XR1a6nqBcshRwZd0ve3aggyl7r
X-Gm-Message-State: AOJu0Yz8oe3NZLV2zSFf8vjC5q7h4oWN5yveYo0z97+hCwx3ckK6CEL6
 GK5uKvFeXWtktn16XaAJFNhtwKrlM1JdLiQJkIRl0l3JFPFVbteJ06Tif0x1TPhBFQe4cm6hmTg
 b30v96BwG9EzhRTeC905Z8XMC4+mcYRqZQF34WQ==
X-Google-Smtp-Source: AGHT+IF5c4jsXWpkr+/3vLya5n3g4BNibhFwlejcq2PyVJvdHniMxg/DIX5Gp4G6Yhf4NEEvzMeFaVsCDgpIQ9cZjiw=
X-Received: by 2002:a2e:97d6:0:b0:2d8:274a:db16 with SMTP id
 m22-20020a2e97d6000000b002d8274adb16mr5817920ljj.17.1712570309500; Mon, 08
 Apr 2024 02:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
 <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
In-Reply-To: <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 8 Apr 2024 17:58:29 +0800
Message-ID: <CABymUCODHQ=bobQNhttY-RqLDjEGf75yAm2YD--ZnfXjAtzNMw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=B8=89 17:41=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Add variable for slice number of a DSC compression bit stream packet.
> > Its value shall be specified in panel driver, or default value can be s=
et
> > in display controller driver if panel driver does not set it.
>
> This is not a part of the standard. Please justify it.

Right, I read the standard but did not find any details of packet descripti=
on.
Looks like msm silicon support tuning of number of slice packing per downst=
ream
code.
The slice_per_pkt can be set in the downstream msm device tree. And I test =
the
values 1 and 2 on vtdr6130 panel and both work. So I guess this is related =
to
performance or something like that. I will have more test with different pa=
nel
to check the impact.
drivers/gpu/drm/panel/panel-raydium-rm692e5.c also mentions to pass new val=
ue
to slice_per_pkt.

Hi Konrad,
Do you remember why value 2 is TODO for slice_per_pkt for panel rm692e5?

>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/display/drm_dsc.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_ds=
c.h
> > index bc90273d06a6..4fac0a2746ae 100644
> > --- a/include/drm/display/drm_dsc.h
> > +++ b/include/drm/display/drm_dsc.h
> > @@ -82,6 +82,10 @@ struct drm_dsc_config {
> >          * @bits_per_component: Bits per component to code (8/10/12)
> >          */
> >         u8 bits_per_component;
> > +       /**
> > +        * @slice_per_pkt: slice number per DSC bit stream packet
> > +        */
> > +       u8 slice_per_pkt;
> >         /**
> >          * @convert_rgb:
> >          * Flag to indicate if RGB - YCoCg conversion is needed
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry
