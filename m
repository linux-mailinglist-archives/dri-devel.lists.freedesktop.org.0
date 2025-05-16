Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841BABA14A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E289C10EB36;
	Fri, 16 May 2025 16:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IMIICsw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05C710EB2A;
 Fri, 16 May 2025 16:56:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-231ba912ba1so1971735ad.2; 
 Fri, 16 May 2025 09:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747414572; x=1748019372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L3zjIN44WdrgRJ0p45DFbKQteVUcMZJqboan4WrhKoI=;
 b=IMIICsw2x66BZWtbOjKFtFdFtjsDq0GMhJ9i9VkdhgYLYPu83Uj46pSqBYhxGmsQQt
 Pyv27pBjSGlu9Oi8QlXXmLw+RwN3lbXoisS/uDNCkQPHpUGCNjWR3MGZcxoYx/rrvvhm
 LZZPlj2dlW3e0a7Ah5omCDvD8yb0DMQRyFm3yMD4LKlQsl5+6NAHB8FCki2Ul78/kBak
 JSPgIZNVUrzbTUHWFROLGbGHxTuNAmc7SxgTnCHSq6frl9XuIweoq3t7986AmRIllrkI
 v4qOQa5uiBW1BgafUfvNuwI9OVdX/jEJ0uDmN7YLIxFZl/mtsKlAJuOPU8sCq053dzG3
 7lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414572; x=1748019372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3zjIN44WdrgRJ0p45DFbKQteVUcMZJqboan4WrhKoI=;
 b=wA9fdzak+vYccxq9OWzlITxofWBHCJcSw3iAa+oX35Ca8/KlH0iuhqmZcdZF7p+Vnp
 OAqUr8M+3d0DHvRvuasTI95wg8DiLUQw5iXxZ5xGENnbtBJ+tEqF0dj1kvSmznbjMxSK
 qerhMkrpHU1LgQQxBCRfZPgWiL21SNNShQXONrROR/xL/SZLgw9efkSxkPD9VRxnIIsd
 8G2F7T5L6sgPz5Om/M7qQ+maz0rceUe9O80MVfDRDLSgvNL18V+MxRw4IiAUgfIaQPVY
 LpoynBtyW8nRSsxhnB3Co4cszoflpMtbiDspZr/KdY97T80mQqmc4Bmqe3XyWiF8PhWA
 /vjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFbB9LOcuKfY1FUhpy0eLolx+xTD8DtSnRG+XGgPrLmClQOOx8fl4J/tbSLRxpJ00zkNJHKg/L5CxE@lists.freedesktop.org,
 AJvYcCX1FKJWfGpUiLBL38j3NdmN/CoYJJ65TgF8OcX9fLevdoW+W7+kuhkSOe9CFqKjyanpEketEz5s@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRja6HeKObz73kIa4lt98lml9HmoHRW51lvnKoqZ6Ts5cEGaXH
 K3q6Afh9cYbr/IShmuQBVOG99SF+hu+G79ELx0pe79i/aPgJ5csKxH1/hFDVrsLTaGDxm4F3uy9
 gnklm4EmmJd76oBS7YWBSTd/Xrtifapxv9A==
X-Gm-Gg: ASbGncuRexSrkS/iaZYDEuhsTDYoLOZvny4dhu1HMMW56IHt2WEMrxz7GXT1r/go0CF
 8iF8xL/pUoWRLSXfnJTlDofJgn5puFJPlutpU5x3jLemhsSSA4NxiNAa9ITOc94XU/ngfL4ICcp
 CWwvK3Pwq7UlNrChyHkMqEHwk7cLon1lWlzQ==
X-Google-Smtp-Source: AGHT+IEWlWBmVIodl6llwj4Bj+K/fNf77PKDKqvaxTt6U89Q80b+JhFpTXaO68RpWBDsmlFdo7+vtIbfmGy656k1DBQ=
X-Received: by 2002:a17:903:41d0:b0:22f:d4e7:e7ca with SMTP id
 d9443c01a7336-231d43b2377mr21507425ad.6.1747414571854; Fri, 16 May 2025
 09:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250514174306.82693-1-leonardodasigomes@gmail.com>
 <CADnq5_OEdpRvpfL9+aCQOfRGUW-vOGzXq3ts5buWXoOTxtHr6Q@mail.gmail.com>
 <CABtyycTNz7dmir5Ydc=VDiTUsLy0tryBgGmtWCJQZSauuaSJwg@mail.gmail.com>
In-Reply-To: <CABtyycTNz7dmir5Ydc=VDiTUsLy0tryBgGmtWCJQZSauuaSJwg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 May 2025 12:56:00 -0400
X-Gm-Features: AX0GCFsTGKrT9PhcWdiE08jFRAeRukVdsqXEoFc-fFm5wIZ90cJJ3z96Mq-p87U
Message-ID: <CADnq5_P7m_a2CToL5JAkDSZDvUgx1LWGaS158CLMBr8xyGtVkw@mail.gmail.com>
Subject: Re: [PATCH 1/2 RESEND] drm/amd/display: Adjust get_value function
 with prefix to help in ftrace
To: Leonardo Gomes <leonardodasigomes@gmail.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 derick.william.moraes@gmail.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Thu, May 15, 2025 at 9:23=E2=80=AFPM Leonardo Gomes
<leonardodasigomes@gmail.com> wrote:
>
> Thanks for your reply Alex,
>
> I just realize with your comment that drivers/gpu/drm/amd/display/dc/gpio=
/hw_gpio.c import dal_hw_gpio_get_value and dal_hw_gpio_set_value.
> So to make those functions inside drivers/gpu/drm/amd/display/dc/gpio/hw_=
hpd.c  more clear what do you think to change them to dal_hw_hpd_get_config=
 and dal_hw_hpd_set_config, making clear that this is a function from the f=
ile hw_hpd?
>

Right.  It needs a different name to avoid the conflict with the other func=
tion.

Alex

> Leonardo Gomes
>
> Em qua., 14 de mai. de 2025 =C3=A0s 18:08, Alex Deucher <alexdeucher@gmai=
l.com> escreveu:
>>
>> On Wed, May 14, 2025 at 4:48=E2=80=AFPM Leonardo Gomes
>> <leonardodasigomes@gmail.com> wrote:
>> >
>> > Adjust get_value function in hw_hpd.c file to have
>> > prefix to help in ftrace, the name change from
>> > 'get_value' to 'dal_hw_gpio_get_value'
>>
>> This won't compile.  dal_hw_gpio_get_value is already defined in
>> drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c.
>>
>> Alex
>>
>> >
>> > Signed-off-by: Leonardo da Silva Gomes <leonardodasigomes@gmail.com>
>> > Co-developed-by: Derick Frias <derick.william.moraes@gmail.com>
>> > Signed-off-by: Derick Frias <derick.william.moraes@gmail.com>
>> > ---
>> >  drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c b/drivers/gp=
u/drm/amd/display/dc/gpio/hw_hpd.c
>> > index 3f13a744d07d..b11ed1089589 100644
>> > --- a/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
>> > +++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_hpd.c
>> > @@ -62,7 +62,7 @@ static void dal_hw_hpd_destroy(
>> >         *ptr =3D NULL;
>> >  }
>> >
>> > -static enum gpio_result get_value(
>> > +static enum gpio_result dal_hw_gpio_get_value(
>> >         const struct hw_gpio_pin *ptr,
>> >         uint32_t *value)
>> >  {
>> > @@ -104,7 +104,7 @@ static enum gpio_result set_config(
>> >  static const struct hw_gpio_pin_funcs funcs =3D {
>> >         .destroy =3D dal_hw_hpd_destroy,
>> >         .open =3D dal_hw_gpio_open,
>> > -       .get_value =3D get_value,
>> > +       .get_value =3D dal_hw_gpio_get_value,
>> >         .set_value =3D dal_hw_gpio_set_value,
>> >         .set_config =3D set_config,
>> >         .change_mode =3D dal_hw_gpio_change_mode,
>> > --
>> > 2.43.0
>> >
