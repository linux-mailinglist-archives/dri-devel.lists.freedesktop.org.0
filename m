Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57F5A5311
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0951B10E97F;
	Mon, 29 Aug 2022 17:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73410E97F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 17:23:43 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id l6so3089304ilk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 10:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9ng/QoMPZV7sTTnrg5WAOHlmn6itHCmlnE31tAyev1Q=;
 b=AcquUG/qVIxo6tZwDJuGD4L6OwE/aGAt18UzXWW2WRwfh2SqUWrHtqlcvp96EYbBwG
 lOPU+YDt0TTSt++07j+YqzXCtD9Q1n4Kq46YXnyceTSfimwa3Oab5TBRI5t61Q8AYdfE
 F8+qidBmuq82JXns6k29MkFNWht0UDpQxuXKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9ng/QoMPZV7sTTnrg5WAOHlmn6itHCmlnE31tAyev1Q=;
 b=hW2rN8Nn1m8aj2EWGgNVIqjiXq6PXjFPNufidLXoPT3TtiHb9S2A7cHoAFdyBBbh1Y
 yMQ8BI6tLbkMoShPIXc9CpXx/zQd+TJIH/C2QRQIqCXws9ySI885tzJ5ujIJnWw1Vzcl
 yvO8o6JmO44ede8VrdQXNkSsAcDBmTw9/Y0Ot4xKIpfuj6JOjxRpe3u8LitKKWGtkYeg
 oNbouKgTEkndDMSmAptuFoHpmCHVjveOJ3KFFb9vnpkjn746SjRry4VQ2ZqnsOCtprcg
 OlJGYI3Zu7jZRjy0sOnA1HOaBnonWBIbLzjLqfWJvQiuZssIECSxNzEmHwOHcIqp1CEZ
 oqJQ==
X-Gm-Message-State: ACgBeo159G14Zq6paqh/vvbdBN/cwr7NiphKQyhGQWfKhT/feeO+nfbB
 +y337+8hP8WMDwZZJMhZiZjO1ReweRSOeZUE
X-Google-Smtp-Source: AA6agR5l9c2JQHAAax1bePxIqNdGIouXGl5qE8vxtDYG7SV6PzJW1XkH9Qh8fhs3WHN4Z9qItdW+uw==
X-Received: by 2002:a05:6e02:8e2:b0:2ea:e76d:ef8a with SMTP id
 n2-20020a056e0208e200b002eae76def8amr4271030ilt.157.1661793822710; 
 Mon, 29 Aug 2022 10:23:42 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54]) by smtp.gmail.com with ESMTPSA id
 r29-20020a056638045d00b003435cef00eesm4437149jap.124.2022.08.29.10.23.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 10:23:40 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id r141so7127771iod.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 10:23:40 -0700 (PDT)
X-Received: by 2002:a05:6638:388e:b0:33c:b603:516 with SMTP id
 b14-20020a056638388e00b0033cb6030516mr10669371jav.133.1661793819928; Mon, 29
 Aug 2022 10:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Aug 2022 10:23:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
Message-ID: <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The blanking related registers are 8 bits, so reject any modes
> with larger blanking periods.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ba84215c1511..f085a037ff5b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>         if (mode->clock > 594000)
>                 return MODE_CLOCK_HIGH;
>
> +       /*
> +        * The blanking related registers are 8 bits, so reject any modes
> +        * with larger blanking periods.
> +        */
> +
> +       if ((mode->hsync_start - mode->hdisplay) > 0xff)
> +               return MODE_HBLANK_WIDE;
> +
> +       if ((mode->vsync_start - mode->vdisplay) > 0xff)
> +               return MODE_VBLANK_WIDE;
> +
> +       if ((mode->hsync_end - mode->hsync_start) > 0xff)
> +               return MODE_HSYNC_WIDE;

Please double-check your patch. Reading through
ti_sn_bridge_set_video_timings(), I see "mode->hsync_end -
mode->hsync_start" is allowed to be up to 0x7fff. The datasheet seems
to confirm. If I got that right it means you're rejecting valid modes.

I didn't validate any of your other checks, but at least that one seems wrong.

SInce this already had a Reviewed-by tag, being explicit:

Naked-by: Douglas Anderson <dianders@chromium.org>
