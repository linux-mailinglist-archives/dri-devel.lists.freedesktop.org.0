Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B4393CC52
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 03:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB5610E8DA;
	Fri, 26 Jul 2024 01:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jVZBZCEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E10910E838
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 01:18:04 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5a15692b6f6so2104243a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 18:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721956683; x=1722561483;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1Tm0qZROMdMNWyVkds+ya5ewxNbo9zl5sVp0ymnAU0=;
 b=jVZBZCEcfB/0qD7E43ogPz1jqhhPjY+fb9rh5KSOJtpljTb6PWsMQOmxw8BfpwuwUC
 XUMwYN7QmQaa2ekD0rwfbxY+GgGrLx6o8TSZrTRhIn9zqV7ZGz0TJWZ7nJkVnomWHSA9
 vh/rNeDcbFRuqwosVpmDGiJLFQklSA1ftjtbpUlLQzNly/aGgU21QInEQ7uIKQnPg13B
 AVnryPFxOIAgmolS+AmoUfFP9kAzeL4J3V/megvW8m/rpGrAP3iXo+Z5no0njiO+wlqG
 DGW+RyHT82p2s6NwVgT/XxwwVXAelCJRdEIhhHghPG+F1uKD+sGg9Cl+TsazN6YMksyp
 EGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721956683; x=1722561483;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1Tm0qZROMdMNWyVkds+ya5ewxNbo9zl5sVp0ymnAU0=;
 b=Lh1aQel3YPuUnobLA6Zl0puP8QrHUzaXHEI8WyPPb5pSHrwbbcipP6d673qJjqMwN3
 03+tOyLjDfThyyZukmpxYKVls8zMgMRSS8bJOT61AH6LnKkAGyZJfqS0ReFPzYVhkBff
 +pZ+MJKQMXJBOeszN7TMqls8nI4R/RtQBjz5cSmkj5IZoH1UdfFbG0ZFkjW+6R1AYk11
 7oz95e9PvBwEVfzZzJyf10HOX4E1Hjzfua8mAMrASLD54vpZe/AlUO/HS8vsaVKCeJk+
 GUUOA4fMdDOzsdmzeN+vfNDY8z4+Vejqaay51WyTC2xfJFELSWneb7FMMQ+O2lZZ6zkl
 u0zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUr5eRV9AXIeY8h0D2MRIy85guAt4KaK3K65xsuLOC0L7a930xZgz7vWrIxoQ9VKptS1aiNs48QB0KOEpG8f75cY4MgsastojJbKeOs3JG
X-Gm-Message-State: AOJu0YwMcuZSy45bhSy8aWSHPvahJw4q9lKCnlRjmWaVWH4XHRXDf28h
 1BUZbiLM/KpGXiJQE0FlHAJVi2Parp2yM46KJzMKYkui9rrJlEltPoC5hm88Wo035vn/0PhEK/Z
 TvZRKs9TJSYW17XhAjVB+CNNYBEKN+cZU+6xuNw==
X-Google-Smtp-Source: AGHT+IEAhtBKbkjoEDahdTXkBpr/w1906ckM/RBw1+l4MKKccSVUTrt/TnoqtC45S9qzABZcVv7K3HyOpvUi4prADh8=
X-Received: by 2002:a05:6402:3514:b0:5a2:b867:3bcc with SMTP id
 4fb4d7f45d1cf-5ac2c5a68a4mr3034549a12.38.1721956682633; Thu, 25 Jul 2024
 18:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240725083245.12253-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <87o76lzwvr.fsf@intel.com>
In-Reply-To: <87o76lzwvr.fsf@intel.com>
From: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Date: Fri, 26 Jul 2024 09:17:51 +0800
Message-ID: <CA+6=WdS5QKMVX2euxdeDqCoHrCpWuqB_cu5vzHGUNdUq4NnPZw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Move the sending location of
 the 11/29 command
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com, daniel@ffwll.ch, 
 jagan@edgeble.ai, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Thu, Jul 25, 2024 at 4:41=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 25 Jul 2024, Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google=
.com> wrote:
> > Move the 11/29 command from enable() to init() function
>
> OOC, what is the "11/29" command?
>
> BR,
> Jani.

hi Jani
Sorry, maybe I didn't describe it clearly. The 11/29 commands are sent
by these two functions.

mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);

MIPI_DCS_EXIT_SLEEP_MODE =3D 0x11,
MIPI_DCS_SET_DISPLAY_ON=3D 0x29,

BR,
>
> >
> > As mentioned in the patch:
> > https://lore.kernel.org/all/20240624141926.5250-2-lvzhaoxiong@huaqin.co=
rp-partner.google.com/
> >
> > Our DSI host has different modes in prepare() and enable()
> > functions. prepare() is in LP mode and enable() is in HS mode.
> > Since the 11/29 command must also be sent in LP mode,
> > so we also move 11/29 command to the init() function.
> >
> > After moving the 11/29 command to the init() function,
> > we no longer need additional delay judgment, so we delete
> > variables "exit_sleep_to_display_on_delay_ms" and
> > "display_on_delay_ms".
> >
> > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com=
>
> > ---
> >  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 59 ++++++++++---------
> >  1 file changed, 32 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers=
/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > index 04d315d96bff..ce73e8cb1db5 100644
> > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > @@ -31,8 +31,6 @@ struct jadard_panel_desc {
> >       bool reset_before_power_off_vcioo;
> >       unsigned int vcioo_to_lp11_delay_ms;
> >       unsigned int lp11_to_reset_delay_ms;
> > -     unsigned int exit_sleep_to_display_on_delay_ms;
> > -     unsigned int display_on_delay_ms;
> >       unsigned int backlight_off_to_display_off_delay_ms;
> >       unsigned int display_off_to_enter_sleep_delay_ms;
> >       unsigned int enter_sleep_to_reset_down_delay_ms;
> > @@ -66,26 +64,6 @@ static inline struct jadard *panel_to_jadard(struct =
drm_panel *panel)
> >       return container_of(panel, struct jadard, panel);
> >  }
> >
> > -static int jadard_enable(struct drm_panel *panel)
> > -{
> > -     struct jadard *jadard =3D panel_to_jadard(panel);
> > -     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->dsi =
};
> > -
> > -     msleep(120);
> > -
> > -     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > -
> > -     if (jadard->desc->exit_sleep_to_display_on_delay_ms)
> > -             mipi_dsi_msleep(&dsi_ctx, jadard->desc->exit_sleep_to_dis=
play_on_delay_ms);
> > -
> > -     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > -
> > -     if (jadard->desc->display_on_delay_ms)
> > -             mipi_dsi_msleep(&dsi_ctx, jadard->desc->display_on_delay_=
ms);
> > -
> > -     return dsi_ctx.accum_err;
> > -}
> > -
> >  static int jadard_disable(struct drm_panel *panel)
> >  {
> >       struct jadard *jadard =3D panel_to_jadard(panel);
> > @@ -202,7 +180,6 @@ static const struct drm_panel_funcs jadard_funcs =
=3D {
> >       .disable =3D jadard_disable,
> >       .unprepare =3D jadard_unprepare,
> >       .prepare =3D jadard_prepare,
> > -     .enable =3D jadard_enable,
> >       .get_modes =3D jadard_get_modes,
> >       .get_orientation =3D jadard_panel_get_orientation,
> >  };
> > @@ -382,6 +359,12 @@ static int radxa_display_8hd_ad002_init_cmds(struc=
t jadard *jadard)
> >
> >       jd9365da_switch_page(&dsi_ctx, 0x00);
> >
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> >       return dsi_ctx.accum_err;
> >  };
> >
> > @@ -608,6 +591,12 @@ static int cz101b4001_init_cmds(struct jadard *jad=
ard)
> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE6, 0x02);
> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xE7, 0x0C);
> >
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> >       return dsi_ctx.accum_err;
> >  };
> >
> > @@ -831,6 +820,16 @@ static int kingdisplay_kd101ne3_init_cmds(struct j=
adard *jadard)
> >
> >       jd9365da_switch_page(&dsi_ctx, 0x00);
> >
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 20);
> > +
> >       return dsi_ctx.accum_err;
> >  };
> >
> > @@ -859,8 +858,6 @@ static const struct jadard_panel_desc kingdisplay_k=
d101ne3_40ti_desc =3D {
> >       .reset_before_power_off_vcioo =3D true,
> >       .vcioo_to_lp11_delay_ms =3D 5,
> >       .lp11_to_reset_delay_ms =3D 10,
> > -     .exit_sleep_to_display_on_delay_ms =3D 120,
> > -     .display_on_delay_ms =3D 20,
> >       .backlight_off_to_display_off_delay_ms =3D 100,
> >       .display_off_to_enter_sleep_delay_ms =3D 50,
> >       .enter_sleep_to_reset_down_delay_ms =3D 100,
> > @@ -1074,6 +1071,16 @@ static int melfas_lmfbx101117480_init_cmds(struc=
t jadard *jadard)
> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
> >       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x06);
> >
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 120);
> > +
> > +     mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> > +
> > +     mipi_dsi_msleep(&dsi_ctx, 20);
> > +
> >       return dsi_ctx.accum_err;
> >  };
> >
> > @@ -1102,8 +1109,6 @@ static const struct jadard_panel_desc melfas_lmfb=
x101117480_desc =3D {
> >       .reset_before_power_off_vcioo =3D true,
> >       .vcioo_to_lp11_delay_ms =3D 5,
> >       .lp11_to_reset_delay_ms =3D 10,
> > -     .exit_sleep_to_display_on_delay_ms =3D 120,
> > -     .display_on_delay_ms =3D 20,
> >       .backlight_off_to_display_off_delay_ms =3D 100,
> >       .display_off_to_enter_sleep_delay_ms =3D 50,
> >       .enter_sleep_to_reset_down_delay_ms =3D 100,
>
> --
> Jani Nikula, Intel
