Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995E97E883
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6883610E3BF;
	Mon, 23 Sep 2024 09:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="l7YDooDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF3F10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:22:24 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-374b9c74aa9so280029f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727083342; x=1727688142;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwUQnypDxT6RDd7XTRy2WwxGmTerfWbVABZQVlkOeow=;
 b=l7YDooDYPFZyjBN60l76cjUAacEshIY54eKWSEU2M4uV4bDrdtxLuQ78Gt41T5jEGz
 vVcOBKU4VsmJ65A6WbBRW3WHaNy+U08BnuMlJarsH4wnrZiuRyaph2fUjIv8+8vZH1GE
 v2hHdaxtKAdk3cs6AJRO+dOkhRPVwLSmwt3LhRyjLTRRlwruJHYV10HpnvSnBZM2vUol
 2FU7HchZW3CUMcLORUM604PahNNg6ckie9gTMgBtmE4av0kniEPXG6ioJ1MLRBvRLDlY
 2uBLnr07UhlQtB3971yhahsjdE/B696SjDxLY134qgLny8mqIJkXZvzEM2uJ2f3OR+Vy
 mQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727083342; x=1727688142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwUQnypDxT6RDd7XTRy2WwxGmTerfWbVABZQVlkOeow=;
 b=e/EbFOX+Xs5DpsAtlMpuEnkI4dN8yD4GbklW2WqMUYkbSN1MeS8FxMcjgXz5w3yVuS
 HVu6slcZVT/VhNlnmX4frvu8BjgmiMom4mPbA0QBM+WJnpRdwZtfd8XEv6BsSirhosRT
 u6nfkNsu+JjiXg0aegcg/RxjKpwJFj0BgM45VrrS0cgSuQQy0vV8I0Tu7+DDJxZTsW11
 XuEeBrhuz1gwrkKBR8D1DRNaXZM0BUbyaKA60Pmn3cPSIDNUL3qSuIwZYAa59/dueJs+
 46yda6pfzzSS855q2A5OVjgrqlrqx2L0fJS7b9MjdGFloafnorm1pnNcKtS/G0Bx3IvZ
 egQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT4YPpvwaOSvb2bo9Loj0zdzB2KRYB+/nrQld2pDRsLaLv5rJ7otucdPI0GTJQuEzFB1gDmEx5ueA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0jWAJ8FdaFkAcHM2AImcmzN2T7x+2pO7rH16DD07V1+frAIBB
 tyLIjcp64DoZfF3LG32PUnVHQ7RMIjJu53AI5JCPPGOHfjzLiImZ3jIFY8j8S6ODV9lMhB1J5p/
 YelQ1+RjSKetJzIh13w1CP0+hyhK1ioq8KMbThg==
X-Google-Smtp-Source: AGHT+IHN+zF5hbvfwjDfpVDFE8mU4UUNZpEPJVu1r+2YULND9yymePJ6p+O10JtC+wjUV3/Ye5fBb6VyMI5kZIMZfJ0=
X-Received: by 2002:a05:6000:1a8b:b0:374:c796:4c3e with SMTP id
 ffacd0b85a97d-37a41fdc35amr2860089f8f.0.1727083342232; Mon, 23 Sep 2024
 02:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpp1ZHFFY9M3i47d658Q-m3ggJzhxSRUapX=tckgdAwcNg@mail.gmail.com>
In-Reply-To: <CAA8EJpp1ZHFFY9M3i47d658Q-m3ggJzhxSRUapX=tckgdAwcNg@mail.gmail.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Mon, 23 Sep 2024 17:22:11 +0800
Message-ID: <CA+6=WdS4i3tWei=zzfS_-OW8hs-tgnifOLbNCirGpTx61xEtCQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Sep 16, 2024 at 1:11=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 15 Sept 2024 at 10:10, Zhaoxiong Lv
> <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> >
> > In order to meet the timing, remove the delay between "backlight off"
> > and "display off"
> >
> > Removing variables: display_off_to_enter_sleep_delay_ms
>
> This is not enough. If this is a fix, then describe why the original
> commit is incorrect, provide necessary explanation, details, etc.
> Otherwise it looks as if you are removing the delay that was necessary
> for other panels
>
> Also if this is a fix, it should be properly notated with the Fixes
> tag, maybe cc:stable, etc.
>
> In its current state: NAK.

hi Dmitry

Our machine encountered an issue where, after entering S3 in the black
screen state, there is a probability that the screen remains black
after waking up. It seems that the DRM runtime resume has not yet
completed, but the system has already started the suspend process.
After reducing the delay for disable, this issue no longer occurs,
Therefore, under the premise of meeting the timing requirements, we
removed the delay between "backlight off" and "display off".

Previously,  "backlight_off_to_display_off_delay_ms" was added between
"backlight off" and "display off"  to prevent "display off" from being
executed when the backlight is not fully powered off, which may cause
a white screen. However, we removed this
"backlight_off_to_display_off_delay_ms" and found that this situation
did not occur. Therefore, in order to solve the problem mentioned
above, we removed this delay.

This is the timing specification for the two panels:
1.  Kingdisplay panel timing spec:
https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
2.  LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB

thanks

>
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers=
/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > index 44897e5218a6..2f8af86bc2a0 100644
> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > @@ -31,7 +31,6 @@ struct jadard_panel_desc {
> >         bool reset_before_power_off_vcioo;
> >         unsigned int vcioo_to_lp11_delay_ms;
> >         unsigned int lp11_to_reset_delay_ms;
> > -       unsigned int backlight_off_to_display_off_delay_ms;
> >         unsigned int display_off_to_enter_sleep_delay_ms;
> >         unsigned int enter_sleep_to_reset_down_delay_ms;
> >  };
> > @@ -69,9 +68,6 @@ static int jadard_disable(struct drm_panel *panel)
> >         struct jadard *jadard =3D panel_to_jadard(panel);
> >         struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->ds=
i };
> >
> > -       if (jadard->desc->backlight_off_to_display_off_delay_ms)
> > -               mipi_dsi_msleep(&dsi_ctx, jadard->desc->backlight_off_t=
o_display_off_delay_ms);
> > -
> >         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> >
> >         if (jadard->desc->display_off_to_enter_sleep_delay_ms)
> > @@ -858,7 +854,6 @@ static const struct jadard_panel_desc kingdisplay_k=
d101ne3_40ti_desc =3D {
> >         .reset_before_power_off_vcioo =3D true,
> >         .vcioo_to_lp11_delay_ms =3D 5,
> >         .lp11_to_reset_delay_ms =3D 10,
> > -       .backlight_off_to_display_off_delay_ms =3D 100,
> >         .display_off_to_enter_sleep_delay_ms =3D 50,
> >         .enter_sleep_to_reset_down_delay_ms =3D 100,
> >  };
> > @@ -1109,7 +1104,6 @@ static const struct jadard_panel_desc melfas_lmfb=
x101117480_desc =3D {
> >         .reset_before_power_off_vcioo =3D true,
> >         .vcioo_to_lp11_delay_ms =3D 5,
> >         .lp11_to_reset_delay_ms =3D 10,
> > -       .backlight_off_to_display_off_delay_ms =3D 100,
> >         .display_off_to_enter_sleep_delay_ms =3D 50,
> >         .enter_sleep_to_reset_down_delay_ms =3D 100,
> >  };
> > --
> > 2.17.1
> >
>
>
> --
> With best wishes
> Dmitry
