Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893D81C821
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 11:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2770B10E771;
	Fri, 22 Dec 2023 10:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E5310E771
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:29:33 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-35fcd6f8accso6361265ab.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703240973; x=1703845773;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brq1T/lyerRADPyPeuRz+yr9zN9tHk+LiXSNCxx5F14=;
 b=GujvNEzonmoonCXynlsnDUUH1ZdyAvFk+ttbemxas6i3o4smYijFP03jvi9pYmpesY
 AZ/O/WIjCV75D1caMm5r0ft3NsDsFuyHBLp9nEIfvzzWoilnjl8AbXGp92Idumdz69FA
 d9NGf5KykTU2ZLYPgjcJAtb35TMHKmnL+A/Nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703240973; x=1703845773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brq1T/lyerRADPyPeuRz+yr9zN9tHk+LiXSNCxx5F14=;
 b=wee0elajn55S0rq7FGh3PRAUJLmJK1yO/t81Gi6RVWJeFzikQOhBtR1RtNXgYutqIB
 RWnbXWh/2tLkATutYOgbQNuIHBvO7RtAq/wrCkMmc97L1WDZvkWDb8jPFzLDHJTg1JFF
 wr9689wq0xACA/BQJdhGKztXXxyMN/HW44DErtgSB1if9a7mYi70omh9VtKydR6IH2Qm
 NiN0tDwP2tZym+ZtxR/t9Qa3PR2EK0Se5NFWTRfYIetqKV0Ds+FJmmeyg+0/gxCXSerY
 7Y5ZiCJ0Ry5tBs/Ew3kcErsiy/3yetXd+pojjdD0O5ckH9IVW9wfvVrOGL9wKdt8JWsW
 nwcA==
X-Gm-Message-State: AOJu0Yz+ctq8OWjENhPbGo9G007MoY3V9RqRXIrPhVGI0H9xjqxdoY/C
 /mqGdENxw9yFI+dpjZpzGCho05RbqUr30fC3ryVWrftOJgAF
X-Google-Smtp-Source: AGHT+IGvrKFDeGj25WNuCS4lB0+NQrxaQYKp7xXqCv5+JXzuRUdQd0UcrSJMJKObEXgx5sd0qBDQHdtXf67CF1+t2Bg=
X-Received: by 2002:a05:6e02:1a09:b0:35f:b3d8:4568 with SMTP id
 s9-20020a056e021a0900b0035fb3d84568mr1279180ild.20.1703240973184; Fri, 22 Dec
 2023 02:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20231221135548.1.I10f326a9305d57ad32cee7f8d9c60518c8be20fb@changeid>
In-Reply-To: <20231221135548.1.I10f326a9305d57ad32cee7f8d9c60518c8be20fb@changeid>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 22 Dec 2023 18:29:22 +0800
Message-ID: <CAEXTbpdUjCvLE+m3d1vSvsE2njRSk1Ou3bZZGEvD_7oYt4+k4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Wait for HPD when doing an AUX
 transfer
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 hsinyi@chromium.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Fri, Dec 22, 2023 at 5:56=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Unlike what is claimed in commit f5aa7d46b0ee ("drm/bridge:
> parade-ps8640: Provide wait_hpd_asserted() in struct drm_dp_aux"), if
> someone manually tries to do an AUX transfer (like via `i2cdump ${bus}
> 0x50 i`) while the panel is off we don't just get a simple transfer
> error. Instead, the whole ps8640 gets thrown for a loop and goes into
> a bad state.
>
> Let's put the function to wait for the HPD (and the magical 50 ms
> after first reset) back in when we're doing an AUX transfer. This
> shouldn't actually make things much slower (assuming the panel is on)
> because we should immediately poll and see the HPD high. Mostly this
> is just an extra i2c transfer to the bridge.
>
> Fixes: f5aa7d46b0ee ("drm/bridge: parade-ps8640: Provide wait_hpd_asserte=
d() in struct drm_dp_aux")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 541e4f5afc4c..fb5e9ae9ad81 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -346,6 +346,11 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux=
 *aux,
>         int ret;
>
>         pm_runtime_get_sync(dev);
> +       ret =3D _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
> +       if (ret) {
> +               pm_runtime_put_sync_suspend(dev);
> +               return ret;
> +       }
>         ret =3D ps8640_aux_transfer_msg(aux, msg);
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
> --
> 2.43.0.472.g3155946c3a-goog
>

I think commit 9294914dd550 ("drm/bridge: parade-ps8640: Link device
to ensure suspend/resume order")  is trying to address the same
problem, but we see this issue here because the device link is missing
DL_FLAG_PM_RUNTIME. I prefer to add DL_FLAG_PM_RUNTIME here so we
don't need to add a _ps8640_wait_hpd_asserted() after every
pm_runtime_get_*() call.

As a side note, I've verified both this patch and DL_FLAG_PM_RUNTIME
in our downstream v5.15 kernel and panel-edp driver. Both of them
successfully wait for HPD asserted when the timeout used to happen,
but the panel is black in that situation. That being said, this patch
still brings us to a better state. Originally, panel_edp_resume()
would return an error when the timeout occurs, so the panel-edp driver
is stuck at an unexpected state. With this patch or
DL_FLAG_PM_RUNTIME, the runtime PM callbacks won't fail and a system
suspend/resume brings the panel back.

Regards,
Pin-yen
