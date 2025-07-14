Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB0B049AF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 23:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20A910E4ED;
	Mon, 14 Jul 2025 21:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FUj1uFxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C1D10E4ED
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 21:46:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so3949863b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752529603; x=1753134403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nf6x+HhC3zd0NIuTq8d9fQYj/uBrB2VbMZ8az8HSz24=;
 b=FUj1uFxnzxrTVZE47IlKGKi2+8/NIX1aRn/OS25oZDoT7pC1aBErprdwHN7bDJ9tu3
 8tU9d9pljON8U5BGx8qEA9Iwysa1SonKDj7tA9BgGJFkoWwrbc9+VEYz0LHh4axr76Zv
 9ZerxZFbtXJTzN/qvLcDT6Yv1E5K5WGLeU0CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752529603; x=1753134403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nf6x+HhC3zd0NIuTq8d9fQYj/uBrB2VbMZ8az8HSz24=;
 b=ooXZLq/6lXesQJfALhhJSXuad7om+gC1I2LFZc5ooBCmwaWRDG0GL/1RyLJd3PLAiA
 qpH1B/MYv+UWcEcreE2IrlcK74wXs0lMIIlJ2H+p6GCAwQY40FJLHPibtiCv7NDHUSdJ
 9rV+Cv41TDCvjU4ZFfx4QmLwPfVfMHhKFfbsRnVoEUcHPXT89yHejfi0l7I/GhPiALe9
 0Iq5JrP7AkSewk3An5VkBy8EvO5jI/jOuwYO77muaLTw+77boYSVqzO70os88N6CBsCY
 NfovNLvM33MbyM5dx9wIZnZGasJ5/glYyAgMyevW4ZYc0Dsgb1YtN5QxeDwoy/vqLFr9
 OwrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWqqxK/8rOP0JbkyFBTFhdygfeN5LI5vQ9Yh+sVWj8y0YoY6CZOIbMKXGcuvYHfARonx7bT2u1dEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD6WexrBZOiq2uXcZs7VHS9fpceJWo3CxnXp+m+qE8smbhf5fW
 U2T4emGNacwqaveT9hAhCXwk1QK5TB8+1IjhvO0F05OHzFjsfa4g398oxaJpggzzp9MJvXgSQzW
 4ilw=
X-Gm-Gg: ASbGncs2iNtCw9IMb6Ne8VcD7dNbmJ4PtqG+Z22QR2po/h6Jrp8TDKQTJb14iMrIhko
 BC/IV+C8o5TXWs4Db1GbiWr/IDOvVVMQUp/cT9eQFuz1vHnzZhqw1WhPCbxlH2eFMjqcVoaJzes
 dSJcBiYUwF3CQzbmhiVVQ+EqKoJnmExcaWRMu8CymdOQN8xgWnmSTw+ih+Xso8KsLNnzwpCS9es
 HMI1uXGsS16qJcegY+jP6PLSFRkTFMGZQnfoNOU+lqNX4xfwGg5Vmxg2LAEKyQ2G1nJ8RicyUR6
 WeXwZRApx0KPELWXbgmKjbxzR/tsuxZ+Jmmc5SmWZcnA6jvCZw/T46cVQYp+UDTtPNgD5ULbQ7/
 OkG7wXf8AcDAOgUZOLQ55qTE3cC5aa202sz6CgRJBJDqVhJwTcpBHKnZ/jyHcg9fZpg==
X-Google-Smtp-Source: AGHT+IF5Ri6IjCRquGQ2b5ZcqbTGNnk6TJ7BKsJiRiXrI2kdtobVjjmzL7vG+J9s8TjDiRaLdAxWVA==
X-Received: by 2002:a05:6a21:6da5:b0:220:842f:2760 with SMTP id
 adf61e73a8af0-2311dc65197mr20911078637.4.1752529602697; 
 Mon, 14 Jul 2025 14:46:42 -0700 (PDT)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com.
 [209.85.215.178]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe6c5891sm10747441a12.41.2025.07.14.14.46.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b3be5c0eb99so1581862a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 14:46:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUV/LwW69dByMMnJ/jlc1X3A/XU99Rb9fyq4ZumzfwTMhbmWsv/NJYtjIEBBnSg7UYjCyLlQ7dBRzw=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5844:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-31c4ccceb76mr25097897a91.14.1752529600346; Mon, 14 Jul 2025
 14:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250708073901.90027-1-me@brighamcampbell.com>
 <20250708073901.90027-2-me@brighamcampbell.com>
In-Reply-To: <20250708073901.90027-2-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 14:46:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
X-Gm-Features: Ac12FXwEXFjZNLsblVCVjjFbPn_m7MCfT9M3S1y3Xdmbs1FX9LqidIJ3hvlhjnw
Message-ID: <CAD=FV=UaNsMRqv_ncr-Xr9pVQGAxUtwwQPmv7h=xqv6RtDUvmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: jdi-lpm102a188a: Update deprecated MIPI
 function calls
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Tue, Jul 8, 2025 at 12:39=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
> Update jdi-lpm102a188a panel driver to use the "multi" variant of MIPI
> functions in order to facilitate improved error handling and remove the
> panel's dependency on deprecated MIPI functions.
>
> This patch's usage of the mipi_dsi_multi_context struct is not
> idiomatic. Rightfully, the struct wasn't designed to cater to the needs
> of panels with multiple MIPI DSI interfaces. This panel is an oddity
> which requires swapping the dsi pointer between MIPI function calls in
> order to preserve the exact behavior implemented using the non-multi
> variant of the macro.

Right. We dealt with this before with "novatek-nt36523"...


> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 160 +++++++-----------
>  1 file changed, 59 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/=
drm/panel/panel-jdi-lpm102a188a.c
> index 5b5082efb282..5001bea1798f 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -81,25 +81,20 @@ static int jdi_panel_disable(struct drm_panel *panel)
>  static int jdi_panel_unprepare(struct drm_panel *panel)
>  {
>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> -       int ret;
> +       struct mipi_dsi_multi_context dsi_ctx;
>
> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link1);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to set display off: %d\n", re=
t);
> -
> -       ret =3D mipi_dsi_dcs_set_display_off(jdi->link2);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to set display off: %d\n", re=
t);
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>
>         /* Specified by JDI @ 50ms, subject to change */
>         msleep(50);

Needs to be mipi_dsi_msleep() to avoid the sleep in case the above
commands caused an error.


> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", r=
et);
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
> -       if (ret < 0)
> -               dev_err(panel->dev, "failed to enter sleep mode: %d\n", r=
et);
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);

I think you need this here:

if (dsi_ctx.accum_err)
  return dsi_ctx.accum_err;

...otherwise the code will do the sleeps, GPIO calls, and regulator
calls even in the case of an error. You don't want that. Then at the
end of the function you'd just have "return 0;"


>  static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
>                                        struct mipi_dsi_device *right,
>                                        const struct drm_display_mode *mod=
e)
>  {
> -       int err;
> +       struct mipi_dsi_multi_context dsi_ctx;

I think you should actually pass in the "dsi_ctx" to this function
since the caller already has one. Then you can change it to a "void"
function...


>  static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
>  {

I think you want to pass the context into this function too and make
it "void". Then the caller doesn't need to check for the error before
calling it...

Then the "msleep(150)" after calling this function can change to a
`mipi_dsi_msleep()` and you don't need to check the error until right
before the LPM flag is cleared...


> +       struct mipi_dsi_multi_context dsi_ctx;
> +
>         /* Clear the manufacturer command access protection */
> -       mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> +       dsi_ctx.dsi =3D jdi->link1;
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>                                    MCS_CMD_ACS_PROT_OFF);
> -       mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> +       dsi_ctx.dsi =3D jdi->link2;
> +       mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
>                                    MCS_CMD_ACS_PROT_OFF);

All the duplication is annoying. In "novatek-nt36523" I guess we only
needed to send _some_ of the commands to both panels and so we ended
up with a macro in just that C file just for
mipi_dsi_dual_dcs_write_seq_multi(). ...but here you seem to be
needing it for lots of functions.

Maybe the solution is to add something like this to "drm_mipi_dsi.h":

#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, _args...) \
  do { \
    (_ctx)->dsi =3D (_dsi1); \
    (_func)((_ctx), _args); \
    (_ctx)->dsi =3D (_dsi2); \
    (_func)((_ctx), _args); \
  } while (0)

Then you could have statements like:

mipi_dsi_dual(mipi_dsi_generic_write_seq_multi, jdi->link1,
jdi->link2, &dsi_ctx, ...);

I _think_ that will work? I at least prototyped it up with some simple
test code and it seemed to work... What do others think of that?

-Doug
