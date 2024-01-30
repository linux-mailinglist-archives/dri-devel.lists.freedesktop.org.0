Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ABF841EF0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 10:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0FD10F680;
	Tue, 30 Jan 2024 09:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F4510F680
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 09:13:07 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso3827964276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 01:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706605926; x=1707210726;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UjMzYiCsE7PaNmy35UnbQyvsqa5heiYDi1xRNMyjnas=;
 b=cLVxm1eQMpkJAzf+2RVAUBjcwXwLhF+/OjSN/5ZlXqArQdTViG5nWz21TDXObPNyyH
 cu/DJPEZAcz/0aKXmBYVdJZJBGUi3HYRTB2/BQtIT09O8dt7fmSrIfOIvJxZu7rrzKgF
 uAHkc774QICYOqNpNuZkjRMbm8UHNEhwzC8S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706605926; x=1707210726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UjMzYiCsE7PaNmy35UnbQyvsqa5heiYDi1xRNMyjnas=;
 b=WNSHGxVrJNIr9H8cs8W0RKeuV/LB4FwxnGcjQ+tFTkYRdhf+lwa7GefG0XkzlDTf31
 WX7AWEudjnLBfZpFHzzx3otoi1SbscLjK8xweEkvecYKWMdFWkQbEGjToWp8ZCNgyrMW
 nzCKnQsrEhNG1Kn8cXSXbHQsFe9evLLfMVmG23gYeGdHV6ypZNbzPGOEH1/WE+SxpR0O
 67VRFL7H9jHDifvThx1lwDTVYRZlGU5tmNxQHBYrgWx891aWHPdhMe15z5urSexVYwGO
 7v59XuX2pLxk2KXoYPaWtZj226MKmqKIswos9URIc8dBQKqVPDsrIvB7Sv1Row2JUefN
 x36w==
X-Gm-Message-State: AOJu0YymE6HW4yZdyaBQu3wkSxMAnKiY+DCxr0YYIRoMsO5lfS+wfX2u
 VkpPBkVwkmoLk5rImZNmx+FMw+p3mP02Spm0DuGp0Egm5m94vluROMQ/bO0INdRGC0dakkvAhQc
 ZLqpCEc429KsTlA1Tukcm19Nzv3ZBu0m5Te5QWA==
X-Google-Smtp-Source: AGHT+IE1Xtyo447bABZUIXxJVEHr3YoCy1sd7si+1fdu6stw64epBG2GA9tH9vg6XiVGO8+8xyGxBj+g/74LPW1Euz8=
X-Received: by 2002:a25:854b:0:b0:dc2:3608:2b24 with SMTP id
 f11-20020a25854b000000b00dc236082b24mr4210395ybn.25.1706605926248; Tue, 30
 Jan 2024 01:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
 <b18d88302acfca001a6693d78909bc2a@kernel.org>
 <31e1a38a1d012a32d6f7bc8372b6360e@kernel.org>
In-Reply-To: <31e1a38a1d012a32d6f7bc8372b6360e@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 30 Jan 2024 10:11:55 +0100
Message-ID: <CABGWkvp5Xx61h+sfKotb=jsQE3jPXP0bJfTtb1k9_OCH-TzTvQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
To: Michael Walle <mwalle@kernel.org>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Inki Dae <daeinki@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Dave Airlie <airlied@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Mon, Jan 29, 2024 at 5:06=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:
>
> >> Just FYI this conflictted pretty heavily with drm-misc-next changes in
> >> the same area, someone should check drm-tip has the correct
> >> resolution, I'm not really sure what is definitely should be.
> >
> > FWIW, this looks rather messy now. The drm-tip doesn't build.
> >
> > There was a new call to samsung_dsim_set_stop_state() introduced
> > in commit b2fe2292624ac (drm: bridge: samsung-dsim: enter display
> > mode in the enable() callback).
>
> I had a closer look at the latest linux-next (where somehow my patch
> made it into) and tried to apply commit b2fe2292624ac (drm: bridge:
> samsung-dsim: enter display mode in the enable() callback). It looks
> like only the following hunk is still needed from that patch. Everything
> else is covered by this fixes patch.
>
> Dario, could you rebase your commit onto this patch? I had a quick test
> with this change and it seems to work fine for our case.
>
> --snip--
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 63a1a0c88be4..92755c90e7d2 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1498,6 +1498,8 @@ static void samsung_dsim_atomic_disable(struct
> drm_bridge *bridge,
>          if (!(dsi->state & DSIM_STATE_ENABLED))
>                  return;
>
> +       samsung_dsim_set_display_enable(dsi, false);
> +
>          dsi->state &=3D ~DSIM_STATE_VIDOUT_AVAILABLE;
>   }
>
> @@ -1506,8 +1508,6 @@ static void
> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   {
>          struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
>
> -       samsung_dsim_set_display_enable(dsi, false);
> -
>          dsi->state &=3D ~DSIM_STATE_ENABLED;
>          pm_runtime_put_sync(dsi->dev);
>   }
> --snip--
>
> -michael

I'm sorry, but I didn't understand well what I have to do.
This is what I have done:

git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/lin=
ux-next.git
cd linux-next
# add your changes, the ones of the emails
git am --reject 0001-drm-bridge-samsung-dsim-enter-display-mode-in-the-en.p=
atch

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 92755c90e7d2..b47929072583 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1508,6 +1508,9 @@ static void
samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 {
        struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);

+       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
+               samsung_dsim_set_stop_state(dsi, true);
+
        dsi->state &=3D ~DSIM_STATE_ENABLED;
        pm_runtime_put_sync(dsi->dev);
 }

And then test the driver for my use case.

Is everything I wrote correct, or am I making a mistake?

Thanks and regards,
Dario

--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
