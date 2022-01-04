Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF101484341
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C52E610E528;
	Tue,  4 Jan 2022 14:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF56C10E528
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:23:04 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id m1so32359334pfk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=16BCa8vmo/R1Nhv2OFH0NIv+n8wUvm3BXfP8bb/BoGM=;
 b=fuLzQV6Uwi3akPblo17SMWMdezrTUj9KlzsDiUIeTS7D3SmEnJK6MWe84mC3mMP5Zb
 gphbkezPqvortF+B/NNBNu27I0198v9ztUqAMBgyFnivZ49/CNV7D3h2qpB/Y7YiU/3q
 DIcjepf6RnVabqblVazivn+qX5dLqQLzfLlutCPJ+AlIDV+CXoWuxiqqw0sDJX3QS/MP
 CX0O+2v8uDQasIRhmnQTOsPaBPF0pBed0fcpmNJEuhBvfWitm8AxdynVjkG1ntjJhJ1L
 JWM1Liae6/l/oyP9wRANfPNnRqYtQxSNDSb7xI0onOmC2ZuF4C26wBToKuC4/cLhjeuh
 zM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16BCa8vmo/R1Nhv2OFH0NIv+n8wUvm3BXfP8bb/BoGM=;
 b=Z66x0TdQdwwo/xEgHCyRZGfH/3i65IqpHFFBB43r+EdG1oYdLd1KlzZ02A6gsLHdtJ
 k/SkWMQAJN2iCQ/BzRyuvfqTt3J8h9xFk0zuq62aE7cPlHrk1cJgkQlrslhupkhnbeJt
 myAoBZc7hVxrhArWuH9eWRhJchOmXtvEfiU9mJQ4wDlipIy17Bfi3qln5rbgxCO6ji+b
 PaCQo3BVTSWT86DHpqPDnc91EwEQvGgkBVTs+/9p/R3KzSwtrF2/H34ZqT6q3Wsq481B
 gZMXq05k9LI/R474y1MMyrdi8bA91MwynegXQ2b1acnFz4kHhpUiwjEvjKGFWDT1ZWlp
 5ShA==
X-Gm-Message-State: AOAM5308XWpnowiW2EwDrgyT2fPdjGeqnHe7WiQDytf3NodbVWVvRwII
 x92S+daddMjeM3jfVc1F2ex6ZFrL08rj/GCw1fhyk+CCWosSIw==
X-Google-Smtp-Source: ABdhPJxlbp0iiJUgRFs9x7jwIl0nsOxY7EM34iksnLwZtzwXXTwlxtRr5FwqsCLWkaK2jl4TOjkY8ZkQBHO0eIh9ex4=
X-Received: by 2002:a62:d044:0:b0:4ba:6f3b:ab08 with SMTP id
 p65-20020a62d044000000b004ba6f3bab08mr51280950pfg.29.1641306184521; Tue, 04
 Jan 2022 06:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20211102130428.444795-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20211102130428.444795-1-angelogioacchino.delregno@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 15:22:53 +0100
Message-ID: <CAG3jFys2Js0urfL9q3nk_KDweLcX+cOZeURCk8=gyps9h6TPcA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Link device to ensure
 suspend/resume order
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey AngeloGioacchino,

On Tue, 2 Nov 2021 at 14:08, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Entering suspend while the display attached to this bridge is still on
> makes the resume sequence to resume the bridge first, display last:
> when this happens, we get a timeout while resuming the bridge, as its
> MCU will get stuck due to the display being unpowered.
>
> On the other hand, on mt8173-elm, closing the lid makes the display to
> get powered off first, bridge last, so at resume time the sequence is
> swapped (compared to the first example) and everything just works
> as expected.
>
> Add a stateless device link to the DRM device that this bridge belongs
> to, ensuring a correct resume sequence and solving the unability to
> correctly resume bridge operation in the first mentioned example.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 45100edd745b..191cc196c9d1 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -100,6 +100,7 @@ struct ps8640 {
>         struct regulator_bulk_data supplies[2];
>         struct gpio_desc *gpio_reset;
>         struct gpio_desc *gpio_powerdown;
> +       struct device_link *link;
>         bool powered;
>  };
>
> @@ -460,10 +461,23 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>                 goto err_aux_register;
>         }
>
> +       ps_bridge->link = device_link_add(bridge->dev->dev, dev, DL_FLAG_STATELESS);
> +       if (!ps_bridge->link) {
> +               dev_err(dev, "failed to create device link");
> +               ret = -EINVAL;
> +               goto err_devlink;
> +       }
> +
>         /* Attach the panel-bridge to the dsi bridge */
> -       return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
> +       ret = drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
>                                  &ps_bridge->bridge, flags);
> +       if (ret)
> +               goto err_bridge_attach;
>
> +err_bridge_attach:
> +       device_link_del(ps_bridge->link);
> +err_devlink:
> +       drm_dp_aux_unregister(&ps_bridge->aux);
>  err_aux_register:
>         mipi_dsi_detach(dsi);
>  err_dsi_attach:
> @@ -473,7 +487,11 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>
>  static void ps8640_bridge_detach(struct drm_bridge *bridge)
>  {
> -       drm_dp_aux_unregister(&bridge_to_ps8640(bridge)->aux);
> +       struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +
> +       drm_dp_aux_unregister(&ps_bridge->aux);
> +       if (ps_bridge->link)
> +               device_link_del(ps_bridge->link);
>  }
>
>  static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
> --
> 2.33.1
>

This patch does not apply on drm-misc-next, could you rebase it on the
current branch?
