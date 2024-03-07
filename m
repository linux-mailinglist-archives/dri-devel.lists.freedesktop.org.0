Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24A87563F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 19:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1238C1137FD;
	Thu,  7 Mar 2024 18:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rT9w9yML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7E113802
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 18:43:28 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso1380138276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 10:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709837007; x=1710441807; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T9LXUyShlkZ7roaprFymWdneF69b+LAWxfFA/794s5U=;
 b=rT9w9yMLuDEnE3WE0v0Hbwr9VZyobORpwSjgV4QfguxKH6rMEqGyYk+bMgcN1Qkz9C
 zMPj1VrE/gO05NfnXVOrWzdOlI7sFrh2TtbcdIVM7pU9j1kS8mldK/SA8l6ScOMmtUEa
 pTulYa17yjacuKiiz7gdXCIcZJrvdgguMVxPUK65ZA1gFZcABExELeZ5GEfTPxnuT74v
 s+nOFVoKCzWhINzAWY6hxhXTlO+EdYQP/QatyorjUBjavWTvrWS7yuGwtZ00eOPZKsR2
 Qu+iaAgFxo+pbVKvehP9lK2OUkanIhL4gRyzlWC6muKQdXYO/1nz9OeDdLRT9CtIhUSF
 DWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709837007; x=1710441807;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T9LXUyShlkZ7roaprFymWdneF69b+LAWxfFA/794s5U=;
 b=JDK819KfXqNjcyoaBynOEThht3hEseB68A3/Bb3zkdHRdG5jQxLcwg0yy6eAvspWIJ
 JQ1d2wkgoOudrgj1QTDg+VLVDZBW5NftNdAEcZcOiyKSKj5Vzrx00yZiRlSoXt4CHFzZ
 jRTtszAe89itEtrh1ZDQg5kRKronXbr1AUbnklUSZFk86s8FNKKhYSU6HNH0DDSSBx6z
 FxXxLPzrvXk4DdP4V70lQJDZs3TywlSBXzssX6O4vjBc3cKKISa9HFbo4/+HkZdPLJ9X
 L/KvjdlH8JacM1asbT4sHMp+2Xketmtp2e/7RJvPKNJcpvw8bpbiDKUssqTksGvMJVxh
 rU7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh03KDgQ90cuKQK9ds58jDUSv/7XiNnfiNn+TrtNq4Vl91HuBGE5VMZell1iMPu6aAk2+3y4KrGs2cZ3gaIizJWJY/0pDwLBQzGF9i+CRm
X-Gm-Message-State: AOJu0Yz5xrlCfbj14kSPL+YgvehSIeZBGWYJNxyZg4YHforuTupKwuKZ
 vYbfQe2UeHdoaeWDSH5Fq564lK6wY5FBurnECkyMjZIre2ue0rqtBZjcV3sanWltzjkxl2vBF4t
 /pq51bEgvBrg78YSEetFVVw9K7wNZbLkqmzlkfw==
X-Google-Smtp-Source: AGHT+IHla4pMRGQJ6X+PZKNW1ZUlATLZh7Z9JkCfgsqQjy7N83+BwMiNotl2Lwnw43Tw/TrfNMgzJdXHnO/QyjQ6JEY=
X-Received: by 2002:a05:6902:1347:b0:dcc:2bc:652 with SMTP id
 g7-20020a056902134700b00dcc02bc0652mr14839603ybu.60.1709837006977; Thu, 07
 Mar 2024 10:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20240307172334.1753343-1-sui.jingfeng@linux.dev>
 <20240307172334.1753343-2-sui.jingfeng@linux.dev>
In-Reply-To: <20240307172334.1753343-2-sui.jingfeng@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Mar 2024 20:43:15 +0200
Message-ID: <CAA8EJpp8tsHi0RhsJXG+r6nOsV3AUC_n6jNHL0Cr6Ku2h3NMog@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: Add fwnode based helpers to get the
 next bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Phong LE <ple@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Mar 2024 at 19:23, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Currently, the various drm bridge drivers relay on OF infrastructures to
> works very well. Yet there are platforms and/or don not has OF support.
> Such as virtual display drivers, USB display apapters and ACPI based
> systems etc. Add fwnode based helpers to fill the niche, this may allows
> part of the drm display bridge drivers to work across systems. As the
> fwnode based API has wider coverage than DT, it can be used on all systems
> in theory. Assumed that the system has valid fwnode graphs established
> before drm bridge driver is probed, the fwnode graphs are compatible with
> the OF graph.
>
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/drm_bridge.c | 68 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     | 16 +++++++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 521a71c61b16..1b2d3b89a61d 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1348,6 +1348,74 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_bridge);
>  #endif
>
> +/**
> + * drm_bridge_find_by_fwnode - Find the bridge corresponding to the associated fwnode
> + *
> + * @fwnode: fwnode for which to find the matching drm_bridge
> + *
> + * This function looks up a drm_bridge based on its associated fwnode.
> + *
> + * RETURNS:
> + * A reference to the drm_bridge if found, otherwise return NULL.
> + */

Please take a look at Documentation/doc-guide/kernel-doc.rst.

> +struct drm_bridge *drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode)
> +{
> +       struct drm_bridge *ret = NULL;
> +       struct drm_bridge *bridge;
> +
> +       if (!fwnode)
> +               return NULL;
> +
> +       mutex_lock(&bridge_lock);
> +
> +       list_for_each_entry(bridge, &bridge_list, list) {
> +               if (bridge->fwnode == fwnode) {
> +                       ret = bridge;
> +                       break;
> +               }
> +       }
> +
> +       mutex_unlock(&bridge_lock);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_bridge_find_by_fwnode);

EXPORT_SYMBOL_GPL

> +
> +/**
> + * drm_bridge_find_next_bridge_by_fwnode - get the next bridge by fwnode
> + * @fwnode: fwnode pointer to the current bridge.
> + * @port: identifier of the port node of the next bridge is connected.
> + *
> + * This function find the next bridge at the current bridge node, assumed
> + * that there has valid fwnode graph established.
> + *
> + * RETURNS:
> + * A reference to the drm_bridge if found, %NULL if not found.
> + * Otherwise return a negative error code.
> + */
> +struct drm_bridge *
> +drm_bridge_find_next_bridge_by_fwnode(struct fwnode_handle *fwnode, u32 port)
> +{
> +       struct drm_bridge *bridge;
> +       struct fwnode_handle *ep;
> +       struct fwnode_handle *remote;
> +
> +       ep = fwnode_graph_get_endpoint_by_id(fwnode, port, 0, 0);
> +       if (!ep)
> +               return ERR_PTR(-EINVAL);
> +
> +       remote = fwnode_graph_get_remote_port_parent(ep);
> +       fwnode_handle_put(ep);
> +       if (!remote)
> +               return ERR_PTR(-ENODEV);
> +
> +       bridge = drm_bridge_find_by_fwnode(remote);
> +       fwnode_handle_put(remote);
> +
> +       return bridge;
> +}
> +EXPORT_SYMBOL(drm_bridge_find_next_bridge_by_fwnode);

EXPORT_SYMBOL_GPL

> +
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>  MODULE_DESCRIPTION("DRM bridge infrastructure");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 3606e1a7f965..d4c95afdd662 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -26,6 +26,7 @@
>  #include <linux/ctype.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_encoder.h>
> @@ -721,6 +722,8 @@ struct drm_bridge {
>         struct list_head chain_node;
>         /** @of_node: device node pointer to the bridge */
>         struct device_node *of_node;

In my opinion, if you are adding fwnode, we can drop of_node
completely. There is no need to keep both of them.

> +       /** @fwnode: fwnode pointer to the bridge */
> +       struct fwnode_handle *fwnode;
>         /** @list: to keep track of all added bridges */
>         struct list_head list;
>         /**
> @@ -788,6 +791,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>                       struct drm_bridge *previous,
>                       enum drm_bridge_attach_flags flags);
>
> +static inline void
> +drm_bridge_set_node(struct drm_bridge *bridge, struct fwnode_handle *fwnode)
> +{
> +       bridge->fwnode = fwnode;
> +       bridge->of_node = to_of_node(fwnode);
> +}
> +
>  #ifdef CONFIG_OF
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>  #else
> @@ -797,6 +807,12 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  }
>  #endif
>
> +struct drm_bridge *
> +drm_bridge_find_by_fwnode(struct fwnode_handle *fwnode);
> +
> +struct drm_bridge *
> +drm_bridge_find_next_bridge_by_fwnode(struct fwnode_handle *fwnode, u32 port);
> +
>  /**
>   * drm_bridge_get_next_bridge() - Get the next bridge in the chain
>   * @bridge: bridge object
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
