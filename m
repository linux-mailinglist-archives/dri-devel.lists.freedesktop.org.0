Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1369B6CED
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 20:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6510810E7F2;
	Wed, 30 Oct 2024 19:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dedHyQO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048F110E7F2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 19:33:46 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e290d5f83bcso168495276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 12:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1730316826; x=1730921626;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhmsmA2FnGb81grQ3R8WFDgWo+odUWhPVYZ39p/9D6E=;
 b=dedHyQO5FWsODVeszD3QQiPxUfEkxdPf3dVY6NYlSs7JVrCt6a+dstYyfNb/8Dp054
 jXIioEbMDDR0dAucLCyDR7PwGRxg6c+SuNfsKRXV2TW9mIOaJCHqJlAeRQdnjzguzRhc
 eKWQbVC0NU7m8rwHs3pVUgJOOZE6n9E0D2sHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730316826; x=1730921626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhmsmA2FnGb81grQ3R8WFDgWo+odUWhPVYZ39p/9D6E=;
 b=i3iQIvzdaoN55vMxBdm5aKnuzh67FUNqBehrQenkzd74jWxdo/s33kEwgFAJHrWa9r
 gADC8Ci3xJ78xbmmzAYLaDi3FN+Ch4hK8HYT1jbt4m3ZvIif0aaJVgcAZxFBbZUEcxo9
 A57R43OjnbQdzezhlmvtiOs5mWK/6wHh8Kk2VZ3rhplc5QEbeOcllGSIMSBufW9jzZ5l
 WCcOjsfHaHkBtWD2cJ0M+G2B3BDeMy9zTiqLRBC8ZDwA9u8raHw17B7UQJvpSAOwT+SX
 2JLP9qNTW6sGSgskN5e7mTQ95rsGdAsx4uAB3q5WtBfNk6sk0ZkmLVviEeTH6QhHo0ac
 bhvQ==
X-Gm-Message-State: AOJu0YzLO51H7D08zZZyhmZjrkHAo8C+VCA0IBUuFcwtOCCE3VfsJeSZ
 Tg1T6BslT4PfKwKfsQFRXhDp+sCpqQp9zCjbfBLrdVVXqfih3UwsGL0FG0mksWsACNhqpk/9Or8
 M8TmhLM36Rv8v6L93gFJEU1gxT0WBEDrq04vB
X-Google-Smtp-Source: AGHT+IFaVfOEyEsfCZNTqT3MTY2NIQ+Z6UHu/m0REHbYQrHMZhFrrSZyr2gJ9ST7g1An3lf7yW6lvhL7cxVuld3xbeM=
X-Received: by 2002:a05:6902:2607:b0:e30:cc81:1695 with SMTP id
 3f1490d57ef6-e30cc811738mr5615799276.42.1730316825837; Wed, 30 Oct 2024
 12:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241028201412.576163-1-ian.forbes@broadcom.com>
In-Reply-To: <20241028201412.576163-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 30 Oct 2024 15:33:34 -0400
Message-ID: <CABQX2QO0_7Qgrcy0wT_ncQdgs=g2t-z-YAbHDhEPJ4H=tqaXcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add common resolutions to the connector mode
 list
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Mon, Oct 28, 2024 at 4:14=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> We replaced our custom list of resolutions with the noedid list, which is
> based on the VESA DMT standard, in the referenced fixes commit. The reaso=
n
> for this was that the user can technically set any resolution they want b=
y
> using Autofit or the vmwgfxctl utility.
>
> Unfortunately the Autofit feature is a global setting that is applied to
> all VMs running in Workstation and some users preferred to set the mode
> manually on certain VMs. Additionally the DMT standard does not include a
> number of modern resolutions as it was last updated in 2013 and has since
> been superseded.
>
> This commit adds back some of the removed modes and adds some additional
> common ones.
>
> Fixes: 935f795045a6 ("drm/vmwgfx: Refactor drm connector probing for disp=
lay modes")
> Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2081803
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 31 ++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index f39bf992364d..879b78543dee 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2681,6 +2681,16 @@ enum drm_mode_status vmw_connector_mode_valid(stru=
ct drm_connector *connector,
>         return MODE_OK;
>  }
>
> +/*
> + * Common modes not present in the VESA DMT standard or assigned a VIC.
> + */
> +static struct {
> +       int width;
> +       int height;
> +} common_modes[] =3D {   {2560, 1440}, // QHD
> +                       {3440, 1440}, // UWQHD
> +                       {3840, 2400}}; // WQUXGA

"static const" and maybe a better name would be vmw_extra_modes.

> +
>  /**
>   * vmw_connector_get_modes - implements drm_connector_helper_funcs.get_m=
odes callback
>   *
> @@ -2725,7 +2735,26 @@ int vmw_connector_get_modes(struct drm_connector *=
connector)
>                 max_height =3D min(dev_priv->stdu_max_height, max_height)=
;
>         }
>
> -       num_modes =3D 1 + drm_add_modes_noedid(connector, max_width, max_=
height);
> +       num_modes =3D 1;

If you could move it either under the drm_mode_probed_add or just
assign it at declaration that'd be a little better than what looks
almost like a random assignment now. BTW, preferred mode it might make
sense to just remove vmw_guess_mode_timing and use drm_cvt_mode
instead.

> +
> +       mode =3D drm_display_mode_from_cea_vic(dev, 97); // 4K UHD 16:9
> +       if (mode) {
> +               drm_mode_probed_add(connector, mode);
> +               num_modes++;
> +       }
> +
> +       for (int i =3D 0; i < ARRAY_SIZE(common_modes); i++) {
> +               mode =3D drm_cvt_mode(dev, common_modes[i].width,
> +                                   common_modes[i].height,
> +                                   60, true, false, false);
> +               if (mode) {
> +                       mode->type |=3D DRM_MODE_TYPE_DRIVER;
> +                       drm_mode_probed_add(connector, mode);
> +                       num_modes++;
> +               }
> +       }

Apart from those minor things, it looks great. We should probably
update the drm_add_modes_noedid to include the newer modes, but that
list is already pretty long so it might make sense to just include the
modes we really care about like you have here.

z
