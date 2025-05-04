Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E435AA8961
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 23:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFC410E02F;
	Sun,  4 May 2025 21:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="LQho+USA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2141F10E02F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 21:06:17 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-225477548e1so38329275ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1746392777; x=1746997577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
 b=LQho+USAo9AfJE7bYaaTcRfvmX4FyX6qX+DHgI2nJc7+DrwdW7hWpmCmR9qEB3b7eJ
 gd9xWc5mMUyI7j3bWwiE4s98gfBPHGTLTp8C/Tj6aQ/5xCGRNWdB2sefitWgSyfa76OX
 ujN3wduS0/noRsXvCka6XZrYGNFRbvgmQpbfCv3RvlY1MdPnlGhFPADy9fY5jWJNbBhg
 bqYL23p3HpdzLc/czIXQXFrjgGwPZ/yxvSUvNBBIhn73syBX1z7pOgaYpPqyTfGvydl/
 F6x6tdD4vqS3YDSHEEnjjHEq8gO0jM7Q4CnEn9t075X62v5pstRI4nXIL9rsmZD16uWm
 nHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746392777; x=1746997577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
 b=HU7RLqiHSN5l49rM/ps2MCry2vIqE39U7Q+/Vs3Llr2I10bRnbL038435h44DrM4WN
 UCB16wHeqE7DL8cJ4sqwWOcPpLlTIi970FkU14/PjOTb0Eobs3Jh7Z4m/S7LB0LzdEiM
 Odet6V17/7dRF+SwHj+noIY/3CVPXETAgthby+XaST9I5X9bi8JDxvRWBhHXSB2vD/CF
 c+Y8GMoHw4eC5UKqgrr06HFPQfFjILyaNyHiB5WE8k+tyA9iSwjVOh7Oq+406N/QV9J+
 CMK/QqODZQUza4Muf8yDIrkNWaokx2HiDN7zQslrYGDFB1dHshJbHqu3oqFSCSB7j0XB
 aoVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQJJyG5QkACim7BQjjm91F9oYchrUiFR8WbrBB+kFUXftbz0g6zJjTV6LLsI+19Rcblsoft0wA9v4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYi1S0lyDdboEsg+ljQ9fpI6EizuvPOowj363N3q7Tel+z+zCP
 X/UEFtvmOCPZVn/AS/jYXhaqwWPyXpSSzePWZNHjjHHAqWoy29684LYbCRa1TtuAAFfG8Frdo0A
 KoRVoDBAKGXZxeIGBXUWKh5pe2Gs=
X-Gm-Gg: ASbGnctAbKP5xZu+2IFas2tsVxAkSkzfO2ppef9ObNC53GlxyDSD+mkkfVMoDb7ZNqi
 9ZdRv1H8hJ8M73R+EIHKkZwNOU2Re5VNt5pH3kwAz6xtd81xTknLyJNOhcXfC3GwspRr0e7JkiE
 UcpnHXwNLBtT67bwzxp/uil6LVYBdjEWvY6XvLtbxdEs/5v+BEC8Evtn0=
X-Google-Smtp-Source: AGHT+IH+MEVsPdqEqxaolEpzZxyQFPKcfV4Aif9uF/lMz5vcLwENh3usDnJAXYsU/xVN5tXD/rnnCYtU/paPqSYdvtk=
X-Received: by 2002:a17:903:1b6b:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22e1e8e702dmr87722535ad.12.1746392776924; Sun, 04 May 2025
 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250429190724.330883-1-richard120310@gmail.com>
 <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
In-Reply-To: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:06:06 +0200
X-Gm-Features: ATxdqUEZVaon0qrNN_2-3htZD6nCAzznTNUIlmtX8rkJYKBTJ9BhwXmOhJS40AA
Message-ID: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com, 
 jbrunet@baylibre.com, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
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

On Tue, Apr 29, 2025 at 11:00=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 29/04/2025 =C3=A0 21:07, I Hsin Cheng a =C3=A9crit :
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Cast the type of "mode->clock" to "unsigned long long=
"
> > when utilizing it to avoid potential integer overflow issue.
> >
> > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?select=
edIssue=3D1646759
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/d=
rm/meson/meson_encoder_hdmi.c
> > index 7752d8ac85f0..fe3d3ff7c432 100644
> > --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_=
encoder_hdmi *encoder_hdmi,
> >       unsigned long long venc_freq;
> >       unsigned long long hdmi_freq;
> >
> > -     vclk_freq =3D mode->clock * 1000;
> > +     vclk_freq =3D (unsigned long long) mode->clock * 1000;
>
> Hi,
>
> maybe, using 1000ULL instead would do the same, but would be less verbose=
?
Agreed, that would make the code more similar to drm_hdmi_compute_mode_cloc=
k().
The goal is to switch to drm_hdmi_compute_mode_clock() mid-term anyways.
