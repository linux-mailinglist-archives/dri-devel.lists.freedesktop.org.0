Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A672C15C915
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 18:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B616E375;
	Thu, 13 Feb 2020 17:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEFB6E375;
 Thu, 13 Feb 2020 17:03:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n10so5664584wrm.1;
 Thu, 13 Feb 2020 09:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BbuavqemwKwPozNZe/tmRxmgO5gBabDlsQUEZ7e9Jpc=;
 b=tzIDf274bS3YorK4iRz97IH/vQk2qz0O7LWN31Z3jC6rcODu8n3JxTncJIo2iikl+L
 bgl/Vqbxk2qpBa13OxbVUQrNtxL/9Zz/jLhANU7JadL+v0XdRxwXRjXvdr0ppazm8k2I
 iQqBiOhHQtap+ksOpPu7dRJDVCu8H3aOtyhiitRYVANT+7SeCWXgE7EVkISeZu/zE0UT
 1OU4dWBXFEYPvrgMYOhnsfqxEWSst0TkeUY/Azj7mPCM98MXJVEv5YiMemNWYAZ33jqY
 UT1Koqflv7oswX6N0Pmcrv9ir9ZMaDjRTloy9hNPUzsF5AVzHlwG5f1LvCDzSxiY83g4
 izhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbuavqemwKwPozNZe/tmRxmgO5gBabDlsQUEZ7e9Jpc=;
 b=jp+65WRLFwVEArmdVmir18ap36TtrHTeFcrctaeMGSf619jhEi/dm655zbgGeXltlu
 lu6gg1ZvuJRS0fTCU/UYEC1+RpgzKSFyn8U+FU2vqcnnrXESzYHzUi7rFV0+NczthnCG
 +YeSX+KZhm8/dKQnoGp9z13AHyH/66ou+NGdM9jtxtebHDEhDE+8sGavh8fvWbNqXuKJ
 9AKnyzBP82629C7EnC1Zbm/rtSTjD2To3ju4r8mdv2Y8K17AdD7mvWbjvysVcCt76Xn4
 7PCB1MZB0xLvIJll+8Fr4WZxhZI9pNATKWMSpS/eUmtLZRF6Y8qAAe0aJTDZ3j0uMwq+
 cozA==
X-Gm-Message-State: APjAAAVc8idglTtKsFgxina+B/1gxNgESg2O2QZp4trn5YPqwEQP+79P
 tBxe/geyj1aa2G7dMLAuVOkl5Dyym3QlL2peMBsEOw==
X-Google-Smtp-Source: APXvYqwqKHVydZkK7uyYDfS8cxPla0zDnz3lKUUc4p1xw5Pnig64P01WXIpWJHPqUXoLbzJj5RiC6vlozlKkQtWJQ0A=
X-Received: by 2002:a05:6000:1183:: with SMTP id
 g3mr23120740wrx.374.1581613433506; 
 Thu, 13 Feb 2020 09:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20200207211713.3870-1-alexander.deucher@amd.com>
In-Reply-To: <20200207211713.3870-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Feb 2020 12:03:41 -0500
Message-ID: <CADnq5_ON2Q7Yw5tsyLvZg5wFX0qVzQHkWba+8Us+r0FTS233VA@mail.gmail.com>
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

Anyone want to take a shot at this one?

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
