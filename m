Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C4159496
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4ED6EE9C;
	Tue, 11 Feb 2020 16:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3F76E507;
 Tue, 11 Feb 2020 16:13:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so4269601wmi.5;
 Tue, 11 Feb 2020 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5qXSJffspK0gIHV4j3zfjqzd3AYpeWH5pDi5Wk3Aug=;
 b=kZSU2Qe9ZnQJMNlp+m51s3hOluX5r2mw80qgV9RBzqi/blWLRZcA22G+r4W7P9Evvg
 pQUHLVCl/v4tRpF2dzhXT17adJVzVoLDmxv2uH84Aajjn0RNBiEFuiD6cTCPPXv8dBj0
 WlVor9sM+eIAjn0n7q8QT3eq4F5XKmwT5werlNkmIPPFes2lFNvXlBEV1kWwF+CumgYM
 HU5xFrem9sab+A1ztd1nGIwZYResHH7hgVLOL3sp3ytJf4tFyGdG0FqiiPHMDoa40lG7
 Vvn1D/cXZ8gKXM3a1Dnaf2hVqGiNKw9HpovoZzbe+IofL73GJ8fS4CTDB6bh/5W5EjB3
 n0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5qXSJffspK0gIHV4j3zfjqzd3AYpeWH5pDi5Wk3Aug=;
 b=JANehjcgZA+3DnaHKArz/qAjgB29kpMlhOWLhpn6RaZ1a3trW9t5rIZEienuEQ34/g
 3IImuXeJEWDPV+2q3J598REA6/hXWCktNB5pkmLFY2a3RkY0AAbSl51Zw4xk9a09iu63
 IkxIC2c6pbLLOJcgKJDN1g3Blp5o16NtWjWq76kEhXSzLT7JDiMgTbm0vZRDd95Up5vj
 sPjFl8J812BShw6I/b2vdKVmLGYQ9NWDYSBJah4X8GkkFdZqwce0BL8CEFROmmmiiBBC
 pCeiTqWfoPi9HAMPmCpHgc3On5jrR/c22hHcR9kMSYl3NQ576t5MAN93sAGMrDHK0187
 4qUw==
X-Gm-Message-State: APjAAAXS+Ohpj4bHpttHbNLQRi6nI2YeB5eaiw/73v+TkqPbi2vNEr2F
 l06tAosnUSrXcvgvg6kv9PxLDRJazhjBtnUPcJ6Qlg==
X-Google-Smtp-Source: APXvYqz4l/5oPRJk3RZwcpBAgXd/dQa7gZbGaffqPRR4ydtRluAXn116c16dNGtuCpeIMvH0jdsIDpAbF4iMzSarLm4=
X-Received: by 2002:a7b:c152:: with SMTP id z18mr6256582wmi.70.1581437631848; 
 Tue, 11 Feb 2020 08:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
In-Reply-To: <20200207211713.3870-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Feb 2020 11:13:40 -0500
Message-ID: <CADnq5_NxooERCdT3N59Z4OSao6Jx7rDnqhOfFa3mtjEmFysOqg@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector registration
 (v3)
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping?

Alex

On Fri, Feb 7, 2020 at 4:17 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Split into init and register functions to avoid a segfault
> in some configs when the load/unload callbacks are removed.
>
> v2:
> - add back accidently dropped has_aux setting
> - set dev in late_register
>
> v3:
> - fix dp cec ordering
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
>  3 files changed, 24 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index ec1501e3a63a..f355d9a752d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
>         return MODE_OK;
>  }
>
> +static int
> +amdgpu_connector_late_register(struct drm_connector *connector)
> +{
> +       struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> +       int r = 0;
> +
> +       if (amdgpu_connector->ddc_bus->has_aux) {
> +               amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> +               r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> +       }
> +
> +       return r;
> +}
> +
>  static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
>         .get_modes = amdgpu_connector_dp_get_modes,
>         .mode_valid = amdgpu_connector_dp_mode_valid,
> @@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
>         .early_unregister = amdgpu_connector_unregister,
>         .destroy = amdgpu_connector_destroy,
>         .force = amdgpu_connector_dvi_force,
> +       .late_register = amdgpu_connector_late_register,
>  };
>
>  static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
>         .early_unregister = amdgpu_connector_unregister,
>         .destroy = amdgpu_connector_destroy,
>         .force = amdgpu_connector_dvi_force,
> +       .late_register = amdgpu_connector_late_register,
>  };
>
>  void
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index ea702a64f807..9b74cfdba7b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
>
>  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
>  {
> -       int ret;
> -
>         amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> -       amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
>         amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> -       ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> -       if (!ret)
> -               amdgpu_connector->ddc_bus->has_aux = true;
> -
> -       WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
> +       drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> +       amdgpu_connector->ddc_bus->has_aux = true;
>  }
>
>  /***** general DP utility functions *****/
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 3959c942c88b..d5b9e72f2649 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
>         struct amdgpu_dm_connector *amdgpu_dm_connector =
>                 to_amdgpu_dm_connector(connector);
>         struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> +       int r;
> +
> +       r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> +       if (r)
> +               return r;
>
>  #if defined(CONFIG_DEBUG_FS)
>         connector_debugfs_init(amdgpu_dm_connector);
> @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>         aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
>         aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
>
> -       drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> +       drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
>         drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>                                       &aconnector->base);
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
