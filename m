Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1D53B448
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 09:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE3C10F1A4;
	Thu,  2 Jun 2022 07:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFC910F19C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 07:24:56 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 187so4034508pfu.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 00:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YoSWA1Sq6xwjcXF8UuvoubBZLHR/NvEwPKYiN0h0aMQ=;
 b=fV7MOLfytWke0XCthz4xyij9zZ3356Y0bfmWQxbjPRW8fgcNoTC734O1ig30roiuXO
 e708U0Sc6uTt6WddbXNStUxJmLqdqy+MVS5cb80N4Jy8RwxliZBqwxxiKtctsFLq12Iv
 DuYGtiJj9MpoWoi0XkHGF4EYEE2T87E+fY/hdF9AtE07++nHi4Gjbwl/NSeuBGlxBedp
 inZHQdWeHFDUkIRrxA0pf2j8uA1GiiDu/ztV2JS2CCZXetyEeava7eKM47O1afuRH6hz
 JXRJWB5KSFmb1Lslie20lTTqiFqIMNXRyjkjqVpG57TdmoffwFzYqPtABYpgC1e7VQ5q
 p3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YoSWA1Sq6xwjcXF8UuvoubBZLHR/NvEwPKYiN0h0aMQ=;
 b=0sl5VxQPAl/ZJ7NwiEb16DMcuo27/y5bSdMXTxXSudcWqpI6jKOBTpGFmMPnbgvwCl
 4Ie8lN4/He7qUvQRxx7+0D0hna375PlxR7N3DP12xICECk7ybhz7svRl351HWx+gATAw
 shADpYgSJ21VAP7j/sVAw81ZGiaOUtpr+EsMlkVidPemdi7zjQ6VyszWsAWPVSpXkfCI
 d3q1REfXvkoJornVF6redhAXw/4r8L/D0e7/HObyefxHZUFVqASPOUuav4w17Xw4jiB9
 dgPpt+f+5NPsYImHzpd5IOrEso064/RAM89ugZX7S9ft4GzPTdMNt4GaYMzuQ5LkOHS3
 5HUQ==
X-Gm-Message-State: AOAM530y8fT6uMxX2bFFjgCYEcDTs1huKzMrvtk7NRAoXwma9nm8W/6l
 ra4liLTA2OchR0/3XB6T+kQ7wMNQjDoa/hvpRNgVClW7Uh8=
X-Google-Smtp-Source: ABdhPJzE7XFTY4dLnYKTNf7IcEsA6s6WsTdplgnUjYP1CdsGloqXbR+2HD/QSONxo6HkHmp/3IWk2UDlKChw+HlNcuI=
X-Received: by 2002:aa7:82ca:0:b0:51b:cf43:d00a with SMTP id
 f10-20020aa782ca000000b0051bcf43d00amr536355pfn.58.1654154695856; Thu, 02 Jun
 2022 00:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220531111502.4470-1-tzimmermann@suse.de>
 <20220531111502.4470-3-tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-3-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 09:24:44 +0200
Message-ID: <CAMeQTsbfYsqM5V_HT6=SsqJ-Xiegz7R8ZDRdCV=GDDHXJbNBYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/ast: Fix updating the connector's EDID property
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Read the display modes from the connectors DDC helper, which also
> updates the connector's EDID property. The code for the connector's
> .get_modes helper is now shared between VGA and SIL164.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 57 ++--------------------------------
>  1 file changed, 2 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index e19dd2f9b3ce..4ff8ec1c8931 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -1302,37 +1302,19 @@ static int ast_crtc_init(struct drm_device *dev)
>
>  static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)

Since this function is now generic you could consider removing _vga
from the name.

Either way:
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


>  {
> -       struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
>         struct drm_device *dev = connector->dev;
>         struct ast_private *ast = to_ast_private(dev);
> -       struct edid *edid;
>         int count;
>
> -       if (!ast_vga_connector->i2c)
> -               goto err_drm_connector_update_edid_property;
> -
>         /*
>          * Protect access to I/O registers from concurrent modesetting
>          * by acquiring the I/O-register lock.
>          */
>         mutex_lock(&ast->ioregs_lock);
> -
> -       edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
> -       if (!edid)
> -               goto err_mutex_unlock;
> -
> +       count = drm_connector_helper_get_modes_from_ddc(connector);
>         mutex_unlock(&ast->ioregs_lock);
>
> -       count = drm_add_edid_modes(connector, edid);
> -       kfree(edid);
> -
>         return count;
> -
> -err_mutex_unlock:
> -       mutex_unlock(&ast->ioregs_lock);
> -err_drm_connector_update_edid_property:
> -       drm_connector_update_edid_property(connector, NULL);
> -       return 0;
>  }
>
>  static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
> @@ -1406,43 +1388,8 @@ static int ast_vga_output_init(struct ast_private *ast)
>   * SIL164 Connector
>   */
>
> -static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
> -{
> -       struct ast_sil164_connector *ast_sil164_connector = to_ast_sil164_connector(connector);
> -       struct drm_device *dev = connector->dev;
> -       struct ast_private *ast = to_ast_private(dev);
> -       struct edid *edid;
> -       int count;
> -
> -       if (!ast_sil164_connector->i2c)
> -               goto err_drm_connector_update_edid_property;
> -
> -       /*
> -        * Protect access to I/O registers from concurrent modesetting
> -        * by acquiring the I/O-register lock.
> -        */
> -       mutex_lock(&ast->ioregs_lock);
> -
> -       edid = drm_get_edid(connector, &ast_sil164_connector->i2c->adapter);
> -       if (!edid)
> -               goto err_mutex_unlock;
> -
> -       mutex_unlock(&ast->ioregs_lock);
> -
> -       count = drm_add_edid_modes(connector, edid);
> -       kfree(edid);
> -
> -       return count;
> -
> -err_mutex_unlock:
> -       mutex_unlock(&ast->ioregs_lock);
> -err_drm_connector_update_edid_property:
> -       drm_connector_update_edid_property(connector, NULL);
> -       return 0;
> -}
> -
>  static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
> -       .get_modes = ast_sil164_connector_helper_get_modes,
> +       .get_modes = ast_vga_connector_helper_get_modes, // same as VGA connector
>  };
>
>  static const struct drm_connector_funcs ast_sil164_connector_funcs = {
> --
> 2.36.1
>
