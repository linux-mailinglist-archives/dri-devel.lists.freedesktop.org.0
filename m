Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0836E08F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 22:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988F86EC4D;
	Wed, 28 Apr 2021 20:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BEF6EC4B;
 Wed, 28 Apr 2021 20:49:51 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 u21-20020a0568301195b02902a2119f7613so12689234otq.10; 
 Wed, 28 Apr 2021 13:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MqCUqdTUpz/0d2ZgtmXkUaVvpN5t5eTZToY/1mGvfd4=;
 b=nZzkjSL0yvBwgqdUQn35tG4ABvenFx/Vw8zPTXZ3ObE+cXxlxyeLZEM7MaeI2QmF2H
 ICA69mB6sPkOQZbTrrMBR1GUGg41E4Kw1+woLUIfvPeX+iW95lkWv+RoBwfTndcNmbuF
 l3YVBeIBNtMI1pA3gLDj07YIX4P1yWfAgtlI+FtlekXxdXXZl8qYswlcxBvpF3gps6fO
 At17j6wWiCJGc5mse6QUbF8J7YWTvthGg3zxpJWGsXo7o7ohURqpc+HXCUHUHfEQmPTh
 N/HZpV1mGszxSZCLYzSW3NuPSTA+x/imQL311p1vHHsS19TRQgJRq6IajPSIiDnYX5i1
 fAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MqCUqdTUpz/0d2ZgtmXkUaVvpN5t5eTZToY/1mGvfd4=;
 b=BkZ7RyKdfbMbZK68xQS5+MCbSzMgCyuws4uqfskPknG6R0l4jVj+jziFcYqgC0R072
 944WrA0oQASv8FVWuNFY72qL6dS/yWvtx0Od+3agQMFUEzCp28u/OeFKYgK8orHCCvzX
 vkOePfXcj4/JKze32qdNg+yK72lCqAqPHKyf+KJKmR8QeCJimeEkOZyJpds3rAhk7In8
 XXRE9CFYZ05UzFgpQkPPVMRyFd+/41hhuC7KazjcjXMHsQlpLfQoMY0Tb+dfHUC06k5X
 x6MD6w73HWMUWI4j9zGtNoS63XE+AgPxPdHNQzs1n9NbiZ6oYVtL7A3Sh5Kzxu0vvlte
 Z1TQ==
X-Gm-Message-State: AOAM531k6ECoCNIFJMtun6fwFgJbCg8s87znE8UhlvjyzeIRpswdAhsp
 RxC7SYh6gjF/NAUjmw7aKYJsGlMNtr8hG4D6NEzhRva4B/061w==
X-Google-Smtp-Source: ABdhPJzbHCxgE4L71WoVcFSkfX0vULfOCgqNq2/wmDm6AjB+XJ47I3ucxSM2u00OOBwTeZxVBkGDGDzDIKPxIgqNeRc=
X-Received: by 2002:a9d:8d1:: with SMTP id 75mr7718182otf.23.1619642990344;
 Wed, 28 Apr 2021 13:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210428204406.1067318-1-nikola.cornij@amd.com>
 <20210428204406.1067318-2-nikola.cornij@amd.com>
In-Reply-To: <20210428204406.1067318-2-nikola.cornij@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Apr 2021 16:49:39 -0400
Message-ID: <CADnq5_OM5SDg2ioq5zMTS1_SHSgZs5WjN-UECcL4w1Gu6oB7GA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] drm/drm_mst: Use Extended Base Receiver Capability
 DPCD space
To: Nikola Cornij <nikola.cornij@amd.com>, 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, koba.ko@canonical.com,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, "Lipski,
 Mikita" <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel as well.

On Wed, Apr 28, 2021 at 4:44 PM Nikola Cornij <nikola.cornij@amd.com> wrote:
>
> [why]
> DP 1.4a spec madates that if DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is
> set, Extended Base Receiver Capability DPCD space must be used. Without
> doing that, the three DPCD values that differ will be wrong, leading to
> incorrect or limited functionality. MST link rate, for example, could
> have a lower value. Also, Synaptics quirk wouldn't work out well when
> Extended DPCD was not read, resulting in no DSC for such hubs.
>
> [how]
> Modify MST topology manager to use the values from Extended DPCD where
> applicable.
>
> To prevent regression on the sources that have a lower maximum link rate
> capability than MAX_LINK_RATE from Extended DPCD, have the drivers
> supply maximum lane count and rate at initialization time.
>
> This also reverts 'commit 2dcab875e763 ("Revert "drm/dp_mst: Retrieve
> extended DPCD caps for topology manager"")', brining the change back to
> the original 'commit ad44c03208e4 ("drm/dp_mst: Retrieve extended DPCD
> caps for topology manager")'.
>
> Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  5 +++
>  .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 18 +++++++++++
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |  2 ++
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 32 ++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  8 +++++
>  include/drm/drm_dp_mst_helper.h               | 12 ++++++-
>  8 files changed, 71 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 997567f6f0ba..b7e01b6fb328 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -429,6 +429,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>                                        struct amdgpu_dm_connector *aconnector,
>                                        int link_index)
>  {
> +       struct dc_link_settings max_link_enc_cap = {0};
> +
>         aconnector->dm_dp_aux.aux.name =
>                 kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d",
>                           link_index);
> @@ -443,6 +445,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>         if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
>                 return;
>
> +       dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>         aconnector->mst_mgr.cbs = &dm_mst_cbs;
>         drm_dp_mst_topology_mgr_init(
>                 &aconnector->mst_mgr,
> @@ -450,6 +453,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>                 &aconnector->dm_dp_aux.aux,
>                 16,
>                 4,
> +               max_link_enc_cap.lane_count,
> +               max_link_enc_cap.link_rate,
>                 aconnector->connector_id);
>
>         drm_connector_attach_dp_subconnector_property(&aconnector->base);
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 7d2e433c2275..6fe66b7ee53e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -1894,6 +1894,24 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
>         return true;
>  }
>
> +bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
> +{
> +       if (!max_link_enc_cap) {
> +               DC_LOG_ERROR("%s: Could not return max link encoder caps", __func__);
> +               return false;
> +       }
> +
> +       if (link->link_enc->funcs->get_max_link_cap) {
> +               link->link_enc->funcs->get_max_link_cap(link->link_enc, max_link_enc_cap);
> +               return true;
> +       }
> +
> +       DC_LOG_ERROR("%s: Max link encoder caps unknown", __func__);
> +       max_link_enc_cap->lane_count = 1;
> +       max_link_enc_cap->link_rate = 6;
> +       return false;
> +}
> +
>  static struct dc_link_settings get_max_link_cap(struct dc_link *link)
>  {
>         struct dc_link_settings max_link_cap = {0};
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
> index b0013e674864..cb6d0543d839 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> @@ -346,6 +346,8 @@ bool dc_link_dp_set_test_pattern(
>         const unsigned char *p_custom_pattern,
>         unsigned int cust_pattern_size);
>
> +bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap);
> +
>  void dc_link_enable_hpd_filter(struct dc_link *link, bool enable);
>
>  bool dc_link_is_dp_sink_present(struct dc_link *link);
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 5539a91b4031..b7869a1135bf 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3708,19 +3708,23 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
>         /* set the device into MST mode */
>         if (mst_state) {
>                 struct drm_dp_payload reset_pay;
> +               int lane_count;
> +               int link_rate;
>
>                 WARN_ON(mgr->mst_primary);
>
>                 /* get dpcd info */
> -               ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
> -               if (ret != DP_RECEIVER_CAP_SIZE) {
> -                       drm_dbg_kms(mgr->dev, "failed to read DPCD\n");
> +               ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> +               if (ret < 0) {
> +                       drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret %d\n",
> +                                   mgr->aux->name, ret);
>                         goto out_unlock;
>                 }
>
> +               lane_count = min_t(int, mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK, mgr->max_lane_count);
> +               link_rate = min_t(int, mgr->dpcd[1], mgr->max_link_rate);
>                 mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr,
> -                                                       drm_dp_bw_code_to_link_rate(mgr->dpcd[1]),
> -                                                       mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
> +                                       drm_dp_bw_code_to_link_rate(link_rate), lane_count);
>                 if (mgr->pbn_div == 0) {
>                         ret = -EINVAL;
>                         goto out_unlock;
> @@ -5448,14 +5452,17 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>   * @aux: DP helper aux channel to talk to this device
>   * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
>   * @max_payloads: maximum number of payloads this GPU can source
> + * @max_lane_count: maximum number of lanes this GPU supports
> + * @max_link_rate: maximum link rate this GPU supports, units as in DPCD
>   * @conn_base_id: the connector object ID the MST device is connected to.
>   *
>   * Return 0 for success, or negative error code on failure
>   */
>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>                                  struct drm_device *dev, struct drm_dp_aux *aux,
> -                                int max_dpcd_transaction_bytes,
> -                                int max_payloads, int conn_base_id)
> +                                int max_dpcd_transaction_bytes, int max_payloads,
> +                                int max_lane_count, int max_link_rate,
> +                                int conn_base_id)
>  {
>         struct drm_dp_mst_topology_state *mst_state;
>
> @@ -5490,6 +5497,8 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>         mgr->aux = aux;
>         mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
>         mgr->max_payloads = max_payloads;
> +       mgr->max_lane_count = max_lane_count;
> +       mgr->max_link_rate = max_link_rate;
>         mgr->conn_base_id = conn_base_id;
>         if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
>             max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
> @@ -5896,14 +5905,13 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>         if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
>             port->mgr->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
>             port->parent == port->mgr->mst_primary) {
> -               u8 downstreamport;
> +               u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
>
> -               if (drm_dp_dpcd_read(&port->aux, DP_DOWNSTREAMPORT_PRESENT,
> -                                    &downstreamport, 1) < 0)
> +               if (drm_dp_read_dpcd_caps(port->mgr->aux, dpcd_ext) < 0)
>                         return NULL;
>
> -               if ((downstreamport & DP_DWN_STRM_PORT_PRESENT) &&
> -                  ((downstreamport & DP_DWN_STRM_PORT_TYPE_MASK)
> +               if ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
> +                   ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)
>                      != DP_DWN_STRM_PORT_TYPE_ANALOG))
>                         return port->mgr->aux;
>         }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 860381d68d9d..a4245eb48ef4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -942,6 +942,7 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>         struct intel_dp *intel_dp = &dig_port->dp;
>         enum port port = dig_port->base.port;
>         int ret;
> +       int bios_max_link_rate;
>
>         if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
>                 return 0;
> @@ -956,8 +957,11 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
>
>         /* create encoders */
>         intel_dp_create_fake_mst_encoders(dig_port);
> +       bios_max_link_rate = intel_bios_dp_max_link_rate(&dig_port->base);
>         ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
> -                                          &intel_dp->aux, 16, 3, conn_base_id);
> +                                          &intel_dp->aux, 16, 3,
> +                                          dig_port->max_lanes,
> +                                          bios_max_link_rate / 27000, conn_base_id);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 1c9c0cdf85db..e02f9d2d74eb 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1617,7 +1617,8 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
>         mstm->mgr.cbs = &nv50_mstm;
>
>         ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
> -                                          max_payloads, conn_base_id);
> +                                          max_payloads, outp->dcb->dpconf.link_nr,
> +                                          outp->dcb->dpconf.link_bw, conn_base_id);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index 59cf1d288465..cf3be8b14676 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -629,13 +629,21 @@ int
>  radeon_dp_mst_init(struct radeon_connector *radeon_connector)
>  {
>         struct drm_device *dev = radeon_connector->base.dev;
> +       struct radeon_connector_atom_dig *dig_connector = radeon_connector->con_priv;
> +       int max_link_rate;
>
>         if (!radeon_connector->ddc_bus->has_aux)
>                 return 0;
>
> +       if (radeon_connector_is_dp12_capable(&radeon_connector->base))
> +               max_link_rate = 0x14;
> +       else
> +               max_link_rate = 0x0a;
> +
>         radeon_connector->mst_mgr.cbs = &mst_cbs;
>         return drm_dp_mst_topology_mgr_init(&radeon_connector->mst_mgr, dev,
>                                             &radeon_connector->ddc_bus->aux, 16, 6,
> +                                           4, max_link_rate,
>                                             radeon_connector->base.base.id);
>  }
>
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index 20dc705642bd..b5b0bf37813b 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -593,6 +593,14 @@ struct drm_dp_mst_topology_mgr {
>          * @max_payloads: maximum number of payloads the GPU can generate.
>          */
>         int max_payloads;
> +       /**
> +        * @max_lane_count: maximum number of lanes the GPU can drive.
> +        */
> +       int max_lane_count;
> +       /**
> +        * @max_link_rate: maximum link rate per lane GPU can output.
> +        */
> +       int max_link_rate;
>         /**
>          * @conn_base_id: DRM connector ID this mgr is connected to. Only used
>          * to build the MST connector path value.
> @@ -765,7 +773,9 @@ struct drm_dp_mst_topology_mgr {
>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>                                  struct drm_device *dev, struct drm_dp_aux *aux,
>                                  int max_dpcd_transaction_bytes,
> -                                int max_payloads, int conn_base_id);
> +                                int max_payloads,
> +                                int max_lane_count, int max_link_rate,
> +                                int conn_base_id);
>
>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
>
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
