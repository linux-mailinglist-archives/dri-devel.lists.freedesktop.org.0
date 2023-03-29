Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E346CEF57
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8BC10E4ED;
	Wed, 29 Mar 2023 16:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7275510E4ED
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 16:28:45 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id n17so11767533uaj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1680107324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/QljfKrLeruMdObpbuIH67x3LRicDKkhH+Rx+cuDIjE=;
 b=GuKD/QJaZpYoQ9SoDCPrgcXHYa2cB9t2jUTvuA5x4iKrn+fLxvlCbZSC5DaiyDfR2c
 DsO6lzais/ZUNqvgYhGVuElP0HEeDhnz6igR0dApWVnMEJtMOuDOf4DQ7LOm7uKqVFrb
 RYGi64C29Pw21Tm9RwJ5uhEOMhikXoSIwDzEy1m+QQGI9eVCwUB9Gu9s2qKRNHkVUb6L
 tf+ZHFXul38rEVbceiFCAQi2i7XT4MhqGqx41spx1Pnzs2vJN28OgHQMrkp4Jx5k6x0O
 IgsRsVjKAOEf+vGgW8sfsG2cCNFeaL//6n/uB8tdMEECd4H8pV6cztVJKXfMYY94U+8E
 20MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680107324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/QljfKrLeruMdObpbuIH67x3LRicDKkhH+Rx+cuDIjE=;
 b=4HQ/xJun0QpLUvay2NQsbdQdY5Us3vK/RIUAwcMKjm2TCBPf8zQFJZmbMDujIvwYWS
 WfX4MJZURfN3B9KTECArkdZQaEwwHi1F9N6EYnMaYtRKjLXoH9HMC2oEkvgCsgE9h6zW
 9eJzaDz9lK0vX4j6r6SEuETv4W3XNqR03k0PHH0gf7ZmXtq4SNGC+qOVTlphH7iWq/Ya
 kZhcLTe9YqhzqL6XxFeRCGtPeMEqs5JThXur9MBK+zILj9btWmf1Cr3QL5uIjA2NTNzZ
 X6RnLWiKHGwdr7Ux2sK1ayC2WTuJjNMsIYOUNBWrAM6H4qngoqMmsxD9hwFWwG3gyqQM
 nuQg==
X-Gm-Message-State: AAQBX9etO12qr3ryaoZpRGtv2CkbA4ECWGIUvd1GBmqFPdzA0nFuGciS
 b2qx6EfJ1s6A6rh829rQxkFFWm5wRxIjtinsG7/RcA==
X-Google-Smtp-Source: AKy350a9w64JHUimPNn/HaYU5DdEwAOJEAPdyW9mDxshDZ3vBSD7gdVp0M9ATAAApgXxbd1nabuTBAs/bFycVB32EAM=
X-Received: by 2002:ab0:3d89:0:b0:755:9b3:fef8 with SMTP id
 l9-20020ab03d89000000b0075509b3fef8mr15650792uac.2.1680107324352; Wed, 29 Mar
 2023 09:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
In-Reply-To: <20230329131929.1328612-1-jagan@amarulasolutions.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Mar 2023 17:28:28 +0100
Message-ID: <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> DSI sink devices typically send the MIPI-DCS commands to the DSI host
> via general MIPI_DSI_DCS read and write API.
>
> The classical DSI sequence mentioned that the DSI host receives MIPI-DCS
> commands from the DSI sink first in order to switch HS mode properly.
> Once the DSI host switches to HS mode any MIPI-DCS commands from the
> DSI sink are unfunctional.

That statement contradicts the spec.
The DSI spec section 8.11.1 Transmission Packet Sequences says that
during any BLLP (Blanking or Low Power) period the host can do any of:
- remain in LP-11
- transmit one or more non-video packets from host to peripheral in escape mode
- transmit one or more non-video packets from host to peripheral in
using HS mode
- receive one or more packets from peripheral to host using escape mode
- transmit data on a different virtual channel.

Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfer
will be in HS mode.

That makes me confused as to the need for this patch.

  Dave

> DSI sink uses the @enable function to send the MIPI-DCS commands. In a
> typical DSI host, sink pipeline the @enable call chain start with the
> DSI host, and then the DSI sink which is the "wrong" order as DSI host
> @enable is called and switched to HS mode before DSI sink @enable.
>
> If the DSI host enables with the @enable_next_first flag then the
> @enable for the DSI sink will be called first before the @enable of
> the DSI host. This alter bridge init order makes sure that the MIPI-DCS
> commands send first and then switch to the HS mode properly by DSI host.
>
> This new flag @enable_next_first that any bridg can set to swap the
> order of @enable (and #disable) for that and the immediately next bridge.
>
> [enable]
> If a bridge sets @enable_next_first, then the @enable for the next bridge
> will be called first before enable of this bridge.
>
> [disable]
> If a bridge sets @enable_next_first, then the @disable for the next bridge
> will be called first before @disable of this bridge to reverse the @enable
> calling direction.
>
> eg:
> - Panel
> - Bridge 1
> - Bridge 2 enable_next_first
> - Bridge 3
> - Bridge 4 enable_next_first
> - Bridge 5 enable_next_first
> - Bridge 6
> - Encoder
>
> Would result in enable's being called as Encoder, Bridge 6, Bridge 3,
> Bridge 4, Bridge 5, Bridge 1, Bridge 2, Panel.
>
> and the result in disable's being called as Panel, Bridge 2, Bridge 1,
> Bridge 5, Bridge 4, Bridge 3, Bridge 6, Encoder.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v7:
> - new patch
>
>  drivers/gpu/drm/drm_bridge.c | 171 ++++++++++++++++++++++++++++++-----
>  include/drm/drm_bridge.h     |   8 ++
>  2 files changed, 154 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index caf0f341e524..cdc2669b3512 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -577,6 +577,24 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>
> +static void drm_atomic_bridge_call_disable(struct drm_bridge *bridge,
> +                                          struct drm_atomic_state *old_state)
> +{
> +       if (old_state && bridge->funcs->atomic_disable) {
> +               struct drm_bridge_state *old_bridge_state;
> +
> +               old_bridge_state =
> +                       drm_atomic_get_old_bridge_state(old_state,
> +                                                       bridge);
> +               if (WARN_ON(!old_bridge_state))
> +                       return;
> +
> +               bridge->funcs->atomic_disable(bridge, old_bridge_state);
> +       } else if (bridge->funcs->disable) {
> +               bridge->funcs->disable(bridge);
> +       }
> +}
> +
>  /**
>   * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
>   * @bridge: bridge control structure
> @@ -587,33 +605,73 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>   * starting from the last bridge to the first. These are called before calling
>   * &drm_encoder_helper_funcs.atomic_disable
>   *
> + * If a bridge sets @enable_next_first, then the @disable for the next bridge
> + * will be called first before @disable of this bridge to reverse the @enable
> + * calling direction.
> + *
> + * Example:
> + * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
> + *
> + * With enable_next_first flag enable in Bridge A, C, D then the resulting
> + * @disable order would be,
> + * Bridge C, Bridge D, Bridge E, Bridge A, Bridge B.
> + *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>                                      struct drm_atomic_state *old_state)
>  {
>         struct drm_encoder *encoder;
> -       struct drm_bridge *iter;
> +       struct drm_bridge *iter, *next, *limit;
>
>         if (!bridge)
>                 return;
>
>         encoder = bridge->encoder;
> +
>         list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> -               if (iter->funcs->atomic_disable) {
> -                       struct drm_bridge_state *old_bridge_state;
> -
> -                       old_bridge_state =
> -                               drm_atomic_get_old_bridge_state(old_state,
> -                                                               iter);
> -                       if (WARN_ON(!old_bridge_state))
> -                               return;
> -
> -                       iter->funcs->atomic_disable(iter, old_bridge_state);
> -               } else if (iter->funcs->disable) {
> -                       iter->funcs->disable(iter);
> +               limit = NULL;
> +
> +               if (!list_is_first(&iter->chain_node, &encoder->bridge_chain)) {
> +                       next = list_prev_entry(iter, chain_node);
> +
> +                       if (next->enable_next_first) {
> +                               limit = bridge;
> +                               list_for_each_entry_from_reverse(next,
> +                                                        &encoder->bridge_chain,
> +                                                        chain_node) {
> +                                       if (next == bridge)
> +                                               break;
> +
> +                                       if (!next->enable_next_first) {
> +                                               /* Found first bridge that does NOT
> +                                                * request next to be enabled first
> +                                                */
> +                                               next = list_next_entry(next, chain_node);
> +                                               limit = next;
> +                                               break;
> +                                       }
> +                               }
> +
> +                               list_for_each_entry_from(next, &encoder->bridge_chain, chain_node) {
> +                                       /* Call requested next bridge enable in order */
> +                                       if (next == iter)
> +                                               /* At the first bridge to request next
> +                                                * bridges called first.
> +                                                */
> +                                               break;
> +
> +                                       drm_atomic_bridge_call_disable(next, old_state);
> +                               }
> +                       }
>                 }
>
> +               drm_atomic_bridge_call_disable(iter, old_state);
> +
> +               if (limit)
> +                       /* Jump all bridges that we have already disabled */
> +                       iter = limit;
> +
>                 if (iter == bridge)
>                         break;
>         }
> @@ -822,6 +880,24 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>
> +static void drm_atomic_bridge_call_enable(struct drm_bridge *bridge,
> +                                         struct drm_atomic_state *old_state)
> +{
> +       if (old_state && bridge->funcs->atomic_enable) {
> +               struct drm_bridge_state *old_bridge_state;
> +
> +               old_bridge_state =
> +                       drm_atomic_get_old_bridge_state(old_state,
> +                                                       bridge);
> +               if (WARN_ON(!old_bridge_state))
> +                       return;
> +
> +               bridge->funcs->atomic_enable(bridge, old_bridge_state);
> +       } else if (bridge->funcs->enable) {
> +               bridge->funcs->enable(bridge);
> +       }
> +}
> +
>  /**
>   * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
>   * @bridge: bridge control structure
> @@ -832,31 +908,76 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>   * starting from the first bridge to the last. These are called after completing
>   * &drm_encoder_helper_funcs.atomic_enable
>   *
> + * If a bridge sets @enable_next_first, then the @enable for the next bridge
> + * will be called first before enable of this bridge.
> + *
> + * Example:
> + * Bridge A ---> Bridge B ---> Bridge C ---> Bridge D ---> Bridge E
> + *
> + * With enable_next_first flag enable in Bridge A, C, D then the resulting
> + * @enable order would be,
> + * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
> + *
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>                                     struct drm_atomic_state *old_state)
>  {
>         struct drm_encoder *encoder;
> +       struct drm_bridge *next, *limit;
>
>         if (!bridge)
>                 return;
>
>         encoder = bridge->encoder;
> +
>         list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> -               if (bridge->funcs->atomic_enable) {
> -                       struct drm_bridge_state *old_bridge_state;
> -
> -                       old_bridge_state =
> -                               drm_atomic_get_old_bridge_state(old_state,
> -                                                               bridge);
> -                       if (WARN_ON(!old_bridge_state))
> -                               return;
> -
> -                       bridge->funcs->atomic_enable(bridge, old_bridge_state);
> -               } else if (bridge->funcs->enable) {
> -                       bridge->funcs->enable(bridge);
> +               limit = NULL;
> +
> +               if (!list_is_last(&bridge->chain_node, &encoder->bridge_chain)) {
> +                       if (bridge->enable_next_first) {
> +                               /* next bridge had requested that next
> +                                * was enabled first, so disabled last
> +                                */
> +                               next = list_next_entry(bridge, chain_node);
> +                               limit = next;
> +
> +                               list_for_each_entry_from(next, &encoder->bridge_chain,
> +                                                        chain_node) {
> +                                       /* Find the next bridge that has NOT requested
> +                                        * next to be enabled first / disabled last
> +                                        */
> +                                       if (!next->enable_next_first) {
> +                                               limit = next;
> +                                               break;
> +                                       }
> +
> +                                       /* Last bridge has requested next to be limit
> +                                        * otherwise the control move to end of chain
> +                                        */
> +                                       if (list_is_last(&next->chain_node,
> +                                                        &encoder->bridge_chain)) {
> +                                               limit = next;
> +                                               break;
> +                                       }
> +                               }
> +
> +                               /* Call these bridges in reverse order */
> +                               list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> +                                                                chain_node) {
> +                                       if (next == bridge)
> +                                               break;
> +
> +                                       drm_atomic_bridge_call_enable(next, old_state);
> +                               }
> +                       }
>                 }
> +
> +               drm_atomic_bridge_call_enable(bridge, old_state);
> +
> +               if (limit)
> +                       /* Jump all bridges that we have already enabled */
> +                       bridge = limit;
>         }
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index a1a31704b917..9879129047e4 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -752,6 +752,14 @@ struct drm_bridge {
>          * before the peripheral.
>          */
>         bool pre_enable_prev_first;
> +       /**
> +        * @enable_next_first: The bridge requires that the next bridge @enable
> +        * function is called first before its @enable, and conversely for
> +        * @disable. This is most frequently a requirement for a DSI host to
> +        * receive MIPI-DCS commands from DSI sink first in order to switch
> +        * HS mode properly.
> +        */
> +       bool enable_next_first;
>         /**
>          * @ddc: Associated I2C adapter for DDC access, if any.
>          */
> --
> 2.25.1
>
