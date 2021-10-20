Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C84353CE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55D89C6B;
	Wed, 20 Oct 2021 19:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5F68931D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634758031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4F8BQ4Z3S47yimPeuvrRsg6xZy3BRTcj+KkzpTgoiag=;
 b=HpM6SL91nOU5DhFlIJKRkuLL3lNgwrC10wBlh48yX3smTDP0QSReZ+GQcHbYX6OiLj8zvV
 9dRfZoCCnGXo3ivBCrTfxjDaOIa7mwcKlqITI7LaPMeA3k/1n4PJWlWxDCnSeLBJKzBlDl
 e6FXZa/P2igXKKCGKfTgdeAVoi7dP74=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-489JGDZsMOmsyNt4fSTsyQ-1; Wed, 20 Oct 2021 15:27:07 -0400
X-MC-Unique: 489JGDZsMOmsyNt4fSTsyQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 b189-20020a3799c6000000b0045eb0c29072so2923103qke.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4F8BQ4Z3S47yimPeuvrRsg6xZy3BRTcj+KkzpTgoiag=;
 b=RyPeBSWFPYrlQwsPLZztLQLpZM8dG50NwCQUwe40h2EMZtjiXpELp0d12GXghUy9T+
 1kStBe4LiYocWF+ZY+u9Fih6zLGCrshx2M5pSyZuNaS1Jhb6KnTngLq88+ty0NBvPUkj
 Vcsn1Yx+FgFYuUsQVCL8pVQAect2rT/FNMudA7R8RoGxKT4PZjDfwVdNjYKKbPSjruyN
 yHYrig6jWh/ke50bbSg4N5YGNezP9uutDovomlCKsIgAY9jxNOcffFYwKijOixeonpnO
 JPLmhi4p6/wsFTKvNOTOWUXCcOV0uvGCQGbOGQT3PYp4/nJHUQtuZ5MRmKBHbFQuzlp5
 cTwA==
X-Gm-Message-State: AOAM533Ol8PpDrWS/w+tTnDDg3iIko4r9Gw3JQpCxMtOT1nQsukdzgVF
 io9J/M9ZfNjmSl6YgRJm3duILWAOINRcL45ku5YzD5d1CQcD8d5YiDSt3ygDirpHb5WSzxlgEDK
 1ZzdAVjRuSBNcKKwClHVuQvqY7U26
X-Received: by 2002:a05:6214:509a:: with SMTP id
 kk26mr854296qvb.65.1634758026711; 
 Wed, 20 Oct 2021 12:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUhNxHv5us1oFw+OY3HHPuDKbGf0F8bwCcP+tSEUILj58aq9cBsam0H+00x7TncE7vX7li+g==
X-Received: by 2002:a05:6214:509a:: with SMTP id
 kk26mr854277qvb.65.1634758026454; 
 Wed, 20 Oct 2021 12:27:06 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id bk13sm1486217qkb.58.2021.10.20.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:27:06 -0700 (PDT)
Message-ID: <21199b644cfa680f88e88dca0691dbe7ee51dccb.camel@redhat.com>
Subject: Re: [PATCH 2/4] drm: Update MST First Link Slot Information Based
 on Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com, 
 Mikita.Lipski@amd.com, intel-gfx@lists.freedesktop.org
Date: Wed, 20 Oct 2021 15:27:05 -0400
In-Reply-To: <20211020141603.19452-2-Bhawanpreet.Lakha@amd.com>
References: <20211020141603.19452-1-Bhawanpreet.Lakha@amd.com>
 <20211020141603.19452-2-Bhawanpreet.Lakha@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Awesome! So this all looks fine to me, just some formatting changes:

On Wed, 2021-10-20 at 10:16 -0400, Bhawanpreet Lakha wrote:
> 8b/10b encoding format requires to reserve the first slot for
> recording metadata. Real data transmission starts from the second slot,
> with a total of available 63 slots available.
> 
> In 128b/132b encoding format, metadata is transmitted separately
> in LLCP packet before MTP. Real data transmission starts from
> the first slot, with a total of 64 slots available.
> 
> v2:
> * Move total/start slots to mst_state, and copy it to mst_mgr in
> atomic_check
> 
> v3:
> * Only keep the slot info on the mst_state
> * add a start_slot parameter to the payload function, to facilitate non
>   atomic drivers (this is a temporary workaround and should be removed when
>   we are moving out the non atomic driver helpers)
> 
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 34 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  4 +--
>  include/drm/drm_dp_mst_helper.h               |  5 ++-
>  6 files changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index ff0f91c93ba4..6169488e2011 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -251,7 +251,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
>         }
>  
>         /* It's OK for this to fail */
> -       drm_dp_update_payload_part1(mst_mgr);
> +       drm_dp_update_payload_part1(mst_mgr, 1);
>  
>         /* mst_mgr->->payloads are VC payload notify MST branch using DPCD
> or
>          * AUX message. The sequence is slot 1-63 allocated sequence for
> each
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 5ab3b3a46e89..d188a5269070 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3353,6 +3353,9 @@ static int drm_dp_destroy_payload_step2(struct
> drm_dp_mst_topology_mgr *mgr,
>  /**
>   * drm_dp_update_payload_part1() - Execute payload update part 1
>   * @mgr: manager to use.
> + * @start_slot: this is the cur slot
> + *  NOTE: start_slot is a temporary workaround for non-atomic drivers,
> + *  this will be removed when non-atomic mst helpers are moved out of the
> helper

We should probably add a space right before NOTE, and reformat these comments
since there's a bit of an indent at the start (unfortunately, I don't think
kdoc is smart enough to retain the indent in the documentation it generates).

>   *
>   * This iterates over all proposed virtual channels, and tries to
>   * allocate space in the link for them. For 0->slots transitions,
> @@ -3363,12 +3366,12 @@ static int drm_dp_destroy_payload_step2(struct
> drm_dp_mst_topology_mgr *mgr,
>   * after calling this the driver should generate ACT and payload
>   * packets.
>   */
> -int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int
> start_slot)
>  {
>         struct drm_dp_payload req_payload;
>         struct drm_dp_mst_port *port;
>         int i, j;
> -       int cur_slots = 1;
> +       int cur_slots = start_slot;
>         bool skip;
>  
>         mutex_lock(&mgr->payload_lock);
> @@ -4503,6 +4506,26 @@ int drm_dp_atomic_release_vcpi_slots(struct
> drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>  
> +/**
> + * drm_dp_mst_update_slots() - updates the slot info depending on the DP
> ecoding format
> + * @mst_state: mst_state to update
> + * @link_ecoding_cap: the ecoding format on the link
> + */
> +void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state,
> uint8_t link_ecoding_cap)
> +{
> +       if (link_ecoding_cap == DP_CAP_ANSI_128B132B) {
> +               mst_state->total_avail_slots = 64;
> +               mst_state->start_slot = 0;
> +       } else {
> +               mst_state->total_avail_slots = 63;
> +               mst_state->start_slot = 1;
> +       }
> +
> +       DRM_DEBUG_KMS("%s ecoding format on mst_state 0x%p\n",
> +                       (link_ecoding_cap == DP_CAP_ANSI_128B132B) ?
> "128b/132b":"8b/10b", mst_state->mgr);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_update_slots);

Some typos (s/ecoding/encoding), and also this should be reformatted to a 100
character column limit.

Other then that, nice work! After making the formatting changes I mentioned
here, you can consider this:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Since this patch series touches multiple drivers, we may want to merge this
through drm-misc-next (or maybe just through the normal AMD repos, whatever
other driver maintainers think is the easiest). I imagine I'll probably be the
one pushing it in the drm-misc-next case, so I'll go and poke some folks to
see how we want to move forward. As well, you'll probably want to find someone
from AMD to help you out with reviewing the last two patches in this series (I
assume this shouldn't be too difficult though since you work there :).

> +
>  /**
>   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>   * @mgr: manager for this port
> @@ -5222,7 +5245,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> drm_dp_mst_topology_mgr *mgr,
>                                          struct drm_dp_mst_topology_state
> *mst_state)
>  {
>         struct drm_dp_vcpi_allocation *vcpi;
> -       int avail_slots = 63, payload_count = 0;
> +       int avail_slots = mst_state->total_avail_slots, payload_count = 0;
>  
>         list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>                 /* Releasing VCPI is always OK-even if the port is gone */
> @@ -5251,7 +5274,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> drm_dp_mst_topology_mgr *mgr,
>                 }
>         }
>         drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d
> used=%d\n",
> -                      mgr, mst_state, avail_slots, 63 - avail_slots);
> +                      mgr, mst_state, avail_slots, mst_state-
> >total_avail_slots - avail_slots);
>  
>         return 0;
>  }
> @@ -5528,6 +5551,9 @@ int drm_dp_mst_topology_mgr_init(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (mst_state == NULL)
>                 return -ENOMEM;
>  
> +       mst_state->total_avail_slots = 63;
> +       mst_state->start_slot = 1;
> +
>         mst_state->mgr = mgr;
>         INIT_LIST_HEAD(&mst_state->vcpis);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index b170e272bdee..d3a24189a12c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -368,7 +368,7 @@ static void intel_mst_disable_dp(struct
> intel_atomic_state *state,
>  
>         drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
>  
> -       ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> +       ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
>         if (ret) {
>                 drm_dbg_kms(&i915->drm, "failed to update payload %d\n",
> ret);
>         }
> @@ -516,7 +516,7 @@ static void intel_mst_pre_enable_dp(struct
> intel_atomic_state *state,
>  
>         intel_dp->active_mst_links++;
>  
> -       ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> +       ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
>  
>         /*
>          * Before Gen 12 this is not done as part of
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index f949767698fc..6c8c59c26dbf 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1413,7 +1413,7 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
>         int ret;
>  
>         NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
> -       ret = drm_dp_update_payload_part1(&mstm->mgr);
> +       ret = drm_dp_update_payload_part1(&mstm->mgr, 1);
>  
>         drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>                 if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index ec867fa880a4..751c2c075e09 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -423,7 +423,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int
> mode)
>                 drm_dp_mst_allocate_vcpi(&radeon_connector->mst_port-
> >mst_mgr,
>                                          radeon_connector->port,
>                                          mst_enc->pbn, slots);
> -               drm_dp_update_payload_part1(&radeon_connector->mst_port-
> >mst_mgr);
> +               drm_dp_update_payload_part1(&radeon_connector->mst_port-
> >mst_mgr, 1);
>  
>                 radeon_dp_mst_set_be_cntl(primary, mst_enc,
>                                           radeon_connector->mst_port-
> >hpd.hpd, true);
> @@ -452,7 +452,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int
> mode)
>                         return;
>  
>                 drm_dp_mst_reset_vcpi_slots(&radeon_connector->mst_port-
> >mst_mgr, mst_enc->port);
> -               drm_dp_update_payload_part1(&radeon_connector->mst_port-
> >mst_mgr);
> +               drm_dp_update_payload_part1(&radeon_connector->mst_port-
> >mst_mgr, 1);
>  
>                 drm_dp_check_act_status(&radeon_connector->mst_port-
> >mst_mgr);
>                 /* and this can also fail */
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index ddb9231d0309..3207b49586fc 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
>         struct drm_private_state base;
>         struct list_head vcpis;
>         struct drm_dp_mst_topology_mgr *mgr;
> +       u8 total_avail_slots;
> +       u8 start_slot;
>  };
>  
>  #define to_dp_mst_topology_mgr(x) container_of(x, struct
> drm_dp_mst_topology_mgr, base)
> @@ -806,6 +808,7 @@ int drm_dp_mst_get_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr, struct drm_dp
>  
>  void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> struct drm_dp_mst_port *port);
>  
> +void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state,
> uint8_t link_ecoding_cap);
>  
>  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>                                 struct drm_dp_mst_port *port);
> @@ -815,7 +818,7 @@ int drm_dp_find_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr,
>                            int pbn);
>  
>  
> -int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int
> start_slot);
>  
>  
>  int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

