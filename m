Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B97AD2ACB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 02:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323A310E449;
	Tue, 10 Jun 2025 00:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W96ERgot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F302C10E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:06:25 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-234bfe37cccso59435015ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749513982; x=1750118782;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9szjAXGTYm8mZ2efiHdEJmH2XWeTxRw2f2AU7GDu0Q=;
 b=W96ERgot8lmxGUXRIBnDOPEKhRHxy03iQSy8gpO8mB1ht0rl5Sul/8ujPTSBCwRnEN
 YrAUzR0p4dr38ljSiGe5MQXBR5tsmnqnWZ9P6s6fCWs8OPZgKNOqym0hoJ7W3VzgwCdb
 KMDd/PFORbuKcPNDJLkzLwpyImziCVu+8sH5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749513982; x=1750118782;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9szjAXGTYm8mZ2efiHdEJmH2XWeTxRw2f2AU7GDu0Q=;
 b=NaZbe/deNGtFecPrwNliGCWHjFzlPnTgmQZVZXQ0/9/42eKvx1OrrpUzRBVvzs0PX9
 CSW1PAzIoWaHMoG6kjtafUSQrDCDH0qQX4mVPu0XO1qWdhEz4CSLg4t1AP6ZgDnMq7/4
 N/Y/Sk+wB7vFypwYUcApOKanDeO/0rQmbm4g3JUVSyWPr0ViI962t6jY7J3FKXtWWSo+
 aojVsqd1dWJmmVvB6wzZoy0XZevChjY6ZyN6YylvWNfgR3c2qECbGSEQSiQyBm/+dhrD
 YDlEMT57sm+2Qm+yXB0WCfAKagPiNAK61z3fZJJXDKp0gQtDeRJ/VEfm89z6sqfSNsBK
 L8YQ==
X-Gm-Message-State: AOJu0YzL5odk2WdktFT8GM3qgfupfqeWXOlmDkJtDlzf1JM1TWUQqwQM
 QVctq5QK09ECFYwsXVyRf5FNJl8RqdxMxU2Xq85IBMMSnaan+st42j8RF0AHhij+GMzFLo7PsbV
 EEoE2nA==
X-Gm-Gg: ASbGnctc93vMztEB+fxChqwCcC+FhsHWPa1Qat+fL80QH3Y1hYI0Wq3yTc8jNiSpkzj
 cAbTxwOSjqRQOLYoWhJp5gKBMVc0ikJTasxUyFE60oneinsi8nUx0QZzHkJRnxBxiWR8QQe2cs9
 d4bo0osQTOH87n8P4KYimwpJNotFT59kZUFOoDpW/dTiDJXFERYDsZcUS1GEpR0OIDvmgcG0Q90
 Jhh7KCPeJXtTm9YaBNWF1GyTX4CgEd/pD1+UMNXtPyV55gE+XMkfQJFPg5uSr0r+ZZEKFBg66uU
 HRcO3nrYsqLR1kkiE5gtrl3qctgtu4v1I31ssLAqBj0GzzPpMZp8WmEor1ELQLaiuj+bOHAQXbb
 iZeyFYlmz1xnU8h9MzyzK0GL3MA==
X-Google-Smtp-Source: AGHT+IF9eLwf0qlgOzKRYWOLt49eTpXE9D2GVKcuCoizFmbGgiiwoSnTPpC1m0BJJm+p/qSqHr373A==
X-Received: by 2002:a17:902:e890:b0:234:e7bb:963b with SMTP id
 d9443c01a7336-23601d24722mr199268655ad.16.1749513982143; 
 Mon, 09 Jun 2025 17:06:22 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com.
 [209.85.216.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603406102sm60328395ad.178.2025.06.09.17.06.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 17:06:20 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-311bd8ce7e4so3897543a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 17:06:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1c08:b0:313:287e:f1e8 with SMTP id
 98e67ed59e1d1-313472e5d83mr20241033a91.8.1749513979339; Mon, 09 Jun 2025
 17:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749199013.git.jani.nikula@intel.com>
 <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 17:06:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uuim4rO+dT3Yn=h0Dm4oawiMe9qfZfWt6yYMid3Y-_2Q@mail.gmail.com>
X-Gm-Features: AX0GCFufPSMlD42_Fj7Ceof7c-3jjE7ncGbUStK-hA2kgWz6xtQg_ijM9varnUs
Message-ID: <CAD=FV=Uuim4rO+dT3Yn=h0Dm4oawiMe9qfZfWt6yYMid3Y-_2Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/panel: use fwnode based lookups for panel
 followers
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, 
 simon1.yang@intel.com, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
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

On Fri, Jun 6, 2025 at 2:06=E2=80=AFAM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> Use firmware node based lookups for panel followers, to make the code
> independent of OF and device tree, and make it work also for ACPI with
> an appropriate _DSD.
>
> ASL example:
>
>         Package (0x02)
>         {
>                 "panel", \_SB.PCI0.GFX0.LCD0
>         }
>
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 39 +++++++++++++++++++++++++++++--------
>  1 file changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index fee65dc65979..3eb0a615f7a9 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct devic=
e_node *np,
>  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>  #endif
>
> -static struct drm_panel *of_find_panel(struct device *follower_dev)
> +/* Find panel by fwnode */
> +static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle=
 *fwnode)

nit: It might be worth adding a comment that says it should be
identical to of_drm_find_panel() since that has a much richer
kerneldoc that talks about the corner cases.

>  {
> -       struct device_node *panel_np;
>         struct drm_panel *panel;
>
> -       panel_np =3D of_parse_phandle(follower_dev->of_node, "panel", 0);
> -       if (!panel_np)
> +       if (!fwnode_device_is_available(fwnode))
>                 return ERR_PTR(-ENODEV);
>
> -       panel =3D of_drm_find_panel(panel_np);
> -       of_node_put(panel_np);
> +       mutex_lock(&panel_lock);
> +
> +       list_for_each_entry(panel, &panel_list, list) {
> +               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> +                       mutex_unlock(&panel_lock);
> +                       return panel;
> +               }
> +       }
> +
> +       mutex_unlock(&panel_lock);
> +
> +       return ERR_PTR(-EPROBE_DEFER);
> +}
> +
> +/* Find panel by follower device */
> +static struct drm_panel *find_panel_by_dev(struct device *follower_dev)
> +{
> +       struct fwnode_handle *fwnode;
> +       struct drm_panel *panel;
> +
> +       fwnode =3D fwnode_find_reference(dev_fwnode(follower_dev), "panel=
", 0);
> +       if (IS_ERR_OR_NULL(fwnode))

nit: why IS_ERR_OR_NULL() instead of IS_ERR()? The kerneldoc for
fwnode_find_reference() doesn't mention anything about it returning a
NULL value in any cases...

Other than the nits, this looks reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I no longer have any easy access to hardware where panel-follower is
truly necessary, but I can at least see the panel-follower calls
getting made on sc7180-trogdor-lazor, so the of->fwnode conversion
stuff must be working.

Tested-by: Douglas Anderson <dianders@chromium.org>
