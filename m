Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B00A9BF5FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 20:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9831310E768;
	Wed,  6 Nov 2024 19:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D860010E768
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 19:04:29 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e290222fdd0so135790276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 11:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730919869; x=1731524669;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4e1o9gH37JUKKkKM3MHF++tZxAk2RGqLpVN0xBxsA0=;
 b=f07B8q5qZXXVDAmVorSu29eXdnPQMTuW59oC08CSkMJZtDTd0oIxk1JITPIyspi4rv
 sS/CPAXSref9oV9eUarAyRDJQFrbKuzW1cO/cHDbBKH5YmBC11e2ewZ3N/lz6JvunNjt
 niu8Dctw1Rla7KdWMiuiaqe4GyY1ygAC2G1GPYwTjTPyTTG1YAzki+r6aw8t6sr3012N
 MrjvCCAg5CGWHvk15k1IYm7+nv15FruVXH7RyOt76aKwYWUTMCqa5NgDKIs6uflOclcm
 OwDVPBm2gh5JKECZ9C+hAVde/vvYWL25qy2WqpjnVwwk1YtmenfdImk6rFBhZ+T3iNEG
 KtRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGPjpIPZGQ+OxBhS/1AudE3aW3yCGH0z3X943tMjP+lSyHtVGSdLkkfy3jpD0TZmWa4yiLbwSg5yI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrYuxgK1xAF5zrJmxPrjnYRy/1mPMP4H31AV7uR6ZnjzVPCq7s
 1oyZ0wW4nXOIoUUYwHTPzSjf+9aQp66YZUso7CF+HAcfl56u3vFAn77fIAoV
X-Google-Smtp-Source: AGHT+IHbvPkp/syzjlTYnEZAxVNIRlHCn8oAEFHzJVA1qSmvNMfMfSUShH4JLgQcJzKtAvIi2PUw0Q==
X-Received: by 2002:a05:6902:2408:b0:e2b:d404:774e with SMTP id
 3f1490d57ef6-e3087b8510dmr37612868276.34.1730919868544; 
 Wed, 06 Nov 2024 11:04:28 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e3317944d9esm2289711276.18.2024.11.06.11.04.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 11:04:28 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e28fd8cdfb8so120534276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 11:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUowyAFb68NBbHjz1hG+M4M55uFyqFVWdETV3DW5fQH1hJOy1N0rwR54j2vO602XxnqIRXQAXH0vHI=@lists.freedesktop.org
X-Received: by 2002:a05:690c:6ac6:b0:6e2:43ea:552 with SMTP id
 00721157ae682-6e9d8939598mr463312207b3.16.1730919868139; Wed, 06 Nov 2024
 11:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 20:04:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
Message-ID: <CAMuHMdUgPax3B2nYfp5BN90uc4SFKND=fgHw3CaSsYab1K7WYw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, 
 linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
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

Hi Biju,

On Wed, Nov 6, 2024 at 7:49=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> The host_node pointer assigned and freed in adv7533_parse_dt()
> and later adv7533_attach_dsi() uses the same. Fix this issue
> by freeing the host_node in adv7533_attach_dsi() instead of
> adv7533_parse_dt().
>
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address

Thanks for the update!

> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -143,6 +143,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
>                                                  };
>
>         host =3D of_find_mipi_dsi_host_by_node(adv->host_node);
> +       of_node_put(adv->host_node);

This still looks fragile to me, as afterwards a pointer to a freed
node is left in struct adv7511.host_node. It would be safer to also
clear adv->host_node here.

However, taking a look from a distance, the code looks like:

    static int adv7511_probe(struct i2c_client *i2c)
    {
            ...
            adv7533_parse_dt(dev->of_node, adv7511);
            ...
            if (adv7511->info->has_dsi)
                    ret =3D adv7533_attach_dsi(adv7511);
            ...
    }

The only reason adv7511.host_node exists is to pass it from
adv7533_parse_dt() to adv7533_attach_dsi().
So what about making this explicit?
  1. Let adv7533_parse_dt() return the host_node or an error pointer,
  2. Pass the host_node as a parameter to adv7533_attach_dsi(),
  3. Call of_node_put() in adv7511_probe() after use.

>         if (!host)
>                 return dev_err_probe(dev, -EPROBE_DEFER,
>                                      "failed to find dsi host\n");
> @@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct a=
dv7511 *adv)
>         if (!adv->host_node)
>                 return -ENODEV;
>
> -       of_node_put(adv->host_node);
> -
>         adv->use_timing_gen =3D !of_property_read_bool(np,
>                                                 "adi,disable-timing-gener=
ator");

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
