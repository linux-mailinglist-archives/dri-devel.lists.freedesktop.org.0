Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC3983B18
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 04:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7445310E147;
	Tue, 24 Sep 2024 02:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="I7LdQuEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23A910E147
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:14:08 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5c42bad4eb9so814070a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 19:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727144047; x=1727748847;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHGa8y2VhRd72zW7L36g52sjrLqwpkTp1KwyDot54wI=;
 b=I7LdQuErDKGI7bvLLzDhdTnyQ1btJOBrKLFjyjwsOa3JUrrTUj4EMWblUlZtrgXkC8
 szIm+cZPrDbO0X6knnzY9kdsU7FJj27GKIMlXxqVldLgvNgTM1EIXOS3sKsTM2fZgMpx
 fTe4oLT0QdIvKzLcDhiIBdihIlyZ17DIz6B6+Chi863JYqvhF48kxIRVelYB+7MiZsae
 6uRRCpbBoD3EN+RaNFm6al9yNgZKdWswibdh8uHXmnIrck1T3PyWj4kuPD2J8Hf7SS4k
 B958cHPQfFqNZ+YC24p3scdBzkfhcRB20MEidM9GYP7FvqoysJ1xtLaBeFIexxQkGf0q
 Cmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727144047; x=1727748847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHGa8y2VhRd72zW7L36g52sjrLqwpkTp1KwyDot54wI=;
 b=jyupDuudhbGmTTEl9qU6YO7/UaVAHw6WAZUuOUZfSjcwjnqXzSquRjXNMghVJbx2QL
 k0/eBYhvwawrHZTTX8qu9zYZCqvPWur5CbVAMBtKgB5iUydUc3PFQe0IQWbswIXqp759
 gx4caVWeBm4kbzvWULsaDaYrOV/I7melte4PMAhODQYjV6OO7CnsFB8SpqPMPN97bA9B
 yU5GF2i4VTrvZBXG6cRNhGbXTLGng6i5yHPGwBAks1qYWwWFjF/qvI7CZMhnBf08Sqgf
 No794v1q07k+/N/IJzvEnG4CpQacbXZGHwIKYaAcIXJURW79M+m4CzRIbQmLaCByxkp0
 ivqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiEtku9blWSUfaTVwnRz3DRuYfxdm2d9CCilTKXom0ZGYhKxCHe/TQs4HQUYPYqVB1zGeoa/YLLY4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3IsSvRSZ08IijQdvvNgxeogeOk33+o/6GHnMtJw9H2Mwaihll
 0rJ3+Dr5p1mqExgPYCXM3OAIipNKoN0dxfarGbtR3j7uAU5DjSc8z6Auo7jnZJak9Aqve41uFs6
 aV/7Rgespjx6pEHCdJ/xtErZctrv0ZZH+tWmCzg==
X-Google-Smtp-Source: AGHT+IEWexrAWcLd5Kk6Du4k9VuNbICCIYtYv65qqeyQO5VSQJMXHQt4/FdwVNhoCm8tqnTs34sksg+7Maa4PDHuXuU=
X-Received: by 2002:a05:6402:520a:b0:5c4:2ad3:b8c2 with SMTP id
 4fb4d7f45d1cf-5c5cec2ab48mr304952a12.3.1727144046959; Mon, 23 Sep 2024
 19:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240923134227.11383-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240923134227.11383-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <42f0b4b1-87c7-4ebe-94a1-e2ad1a759dd7@quicinc.com>
In-Reply-To: <42f0b4b1-87c7-4ebe-94a1-e2ad1a759dd7@quicinc.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Tue, 24 Sep 2024 10:13:55 +0800
Message-ID: <CA+6=WdTTwXSyqGFGM6mqG3djDBH28mAzBUxUEUdr6z7W2g-A7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Sep 24, 2024 at 5:14=E2=80=AFAM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
>
>
> On 9/23/2024 6:42 AM, Zhaoxiong Lv wrote:
> > In MTK chips, if the system starts suspending before the DRM runtime
> > resume has not completed, there is a possibility of a black screen
> > after waking the machine. Reduce the disable delay resolves this issue,
>
> Hi Zhaoxiong,
>
> Do you mean "if the system starts suspending before the DRM runtime
> resume *has* completed" here?

Hi Jessica

Sorry, my description may not be clear enough. It should be when the
DRM runtime resume has not yet completed and the system enters sleep
mode at the same time.


>
> >
> > The "backlight_off_to_display_off_delay_ms" was added between
> > "backlight off" and "display off"  to prevent "display off" from being
> > executed when the backlight is not fully powered off, which may cause
> > a white screen. However, we removed this
> > "backlight_off_to_display_off_delay_ms" and found that this situation
> > did not occur. Therefore, in order to solve the problem mentioned
> > above, we We reduced it from 100ms to 3ms (tCMD_OFF >=3D 1ms).
>
> So from my understanding of this paragraph,
> `backlight_off_to_display_off_delay_ms` was added to prevent the display
> powering off before backlight is fully powered off. You recently tested
> dropping this completely and saw no issue with this.
>
> If that's the case, why not drop this delay completely?
>
> Thanks,
>
> Jessica Zhang

Yes, there are currently no other issue after removing this delay.
The reason why I didn't completely remove this delay is because the
panel spec states that a delay of more than 1ms  (tCMD_OFF >=3D 1ms) is
required when entering diaplay_off (0x28H), so I reserved 3ms.

>
> >
> > This is the timing specification for the two panels:
> > 1. Kingdisplay panel timing spec:
> > https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
> > 2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LI=
B
> >
> >
> > Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MI=
PI-DSI panel")
> > Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx1011=
17480 MIPI-DSI panel")
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> > Changes between V2 and V1:
> > -  1. Modify the commit message
> > -  2. Modify the value of backlight_off_to_display_off_delay_ms.
> > v1: https://lore.kernel.org/all/20240915080830.11318-2-lvzhaoxiong@huaq=
in.corp-partner.google.com/
> > ---
> >   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers=
/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > index 44897e5218a6..486aa20e5518 100644
> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > @@ -858,7 +858,7 @@ static const struct jadard_panel_desc kingdisplay_k=
d101ne3_40ti_desc =3D {
> >       .reset_before_power_off_vcioo =3D true,
> >       .vcioo_to_lp11_delay_ms =3D 5,
> >       .lp11_to_reset_delay_ms =3D 10,
> > -     .backlight_off_to_display_off_delay_ms =3D 100,
> > +     .backlight_off_to_display_off_delay_ms =3D 3,
> >       .display_off_to_enter_sleep_delay_ms =3D 50,
> >       .enter_sleep_to_reset_down_delay_ms =3D 100,
> >   };
> > @@ -1109,7 +1109,7 @@ static const struct jadard_panel_desc melfas_lmfb=
x101117480_desc =3D {
> >       .reset_before_power_off_vcioo =3D true,
> >       .vcioo_to_lp11_delay_ms =3D 5,
> >       .lp11_to_reset_delay_ms =3D 10,
> > -     .backlight_off_to_display_off_delay_ms =3D 100,
> > +     .backlight_off_to_display_off_delay_ms =3D 3,
> >       .display_off_to_enter_sleep_delay_ms =3D 50,
> >       .enter_sleep_to_reset_down_delay_ms =3D 100,
> >   };
> > --
> > 2.17.1
> >
>
