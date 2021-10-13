Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6857842CDE6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 00:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214786E1BD;
	Wed, 13 Oct 2021 22:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15C16E1BD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 22:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634163906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uWGOPFLeUFG9Ukt5Vn3RD2QUSrk7p78tTTuvrdPOlv4=;
 b=ZHzIegMwsljD2sHQSEE52+ezkwhPGz+21XaSk96YzoN6oefpLnA5F83QMV/So/jOEchrw5
 iJXkpFyAoEq1H71wTOqfh/eJJNBDi842Wq0Ap/87r3kQTGZDJcV5sGuIvSdVIdtQqhkfLV
 C7/f8IQfa9hm1OrSH4GQa9gh4TPSI7Q=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-jsISrEx3OtqsNOBOrQe29g-1; Wed, 13 Oct 2021 18:25:05 -0400
X-MC-Unique: jsISrEx3OtqsNOBOrQe29g-1
Received: by mail-qk1-f200.google.com with SMTP id
 z29-20020a05620a08dd00b0045fa369b83dso3008493qkz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 15:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=uWGOPFLeUFG9Ukt5Vn3RD2QUSrk7p78tTTuvrdPOlv4=;
 b=SG1naKSF6M5TWVvYXXH/oSBU6h+NJG6tw1hh+kCSzN34YcSylbAyCyNrsaeEouiR5d
 DCCmcSR1NixdBMGXeaH5KDL9lAhlGUsuoMUlkxhuco70GbnHqcqp722h6KL1Gzp2lzgm
 6tBIYt+2IDM8LYcqd9MTq6BtFea3HUEtBRC1Rpbhws2bM65rq5M9k2acyVZA1Lqi2qZc
 paFYHbPhHb2193YMQwPgVPLZWEX/p3z5eaPUCcrCMkonCWMht2SjWJ7+gbLy2EcIbEia
 LvlI/8aYWtD60pfvzNaodR3MQ/I3z3Y2eK/kkH9d12KTra+ErsUHvyd/JgSXdt6Euxg5
 XVmA==
X-Gm-Message-State: AOAM533mQem6q0uIGGQ2jp4XqZy7Aj0YwYcWeTUIYA897fL2Y7ugKOyV
 6KPeOI39WGDRIpdZ6HdSc19grdk6RWAc/z1WX64I4WVjmUSrCajjBbMu6xvWy6L5Lzv6ppHj1+r
 suEzj3/gszQ4dfNZnZI4oYS/bIN8d
X-Received: by 2002:ac8:5a49:: with SMTP id o9mr2342654qta.416.1634163904932; 
 Wed, 13 Oct 2021 15:25:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVgxJUWpCQMGV4WuSGq8DrdKJGQlAZME9TnGmRI5DLrTHo2aWapRpz3x53C9qH/JporkiWZA==
X-Received: by 2002:ac8:5a49:: with SMTP id o9mr2342617qta.416.1634163904570; 
 Wed, 13 Oct 2021 15:25:04 -0700 (PDT)
Received: from [192.168.8.206] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id 125sm483497qkf.95.2021.10.13.15.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 15:25:04 -0700 (PDT)
Message-ID: <3fbf786ee687e57cab02d71c745d01fb39819cba.camel@redhat.com>
Subject: Re: [PATCH] drm: Update MST First Link Slot Information Based on
 Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Jerry.Zuo@amd.com, 
 dri-devel@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, Wayne.Lin@amd.com, Nicholas.Kazlauskas@amd.com
Date: Wed, 13 Oct 2021 18:25:03 -0400
In-Reply-To: <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
References: <5e463fbc3d633eea1078e838ba5be0065ffbeb1e.camel@redhat.com>
 <20211012215848.1507023-1-Bhawanpreet.Lakha@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
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

Some comments below (also, sorry again for the mixup on the last review!)

On Tue, 2021-10-12 at 17:58 -0400, Bhawanpreet Lakha wrote:
> 8b/10b encoding format requires to reserve the first slot for
> recording metadata. Real data transmission starts from the second slot,
> with a total of available 63 slots available.
> 
> In 128b/132b encoding format, metadata is transmitted separately
> in LLCP packet before MTP. Real data transmission starts from
> the first slot, with a total of 64 slots available.
> 
> v2:
> * Remove get_mst_link_encoding_cap
> * Move total/start slots to mst_state, and copy it to mst_mgr in
> atomic_check
> 
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 35 +++++++++++++++----
>  include/drm/drm_dp_mst_helper.h               | 13 +++++++
>  3 files changed, 69 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5020f2d36fe1..4ad50eb0091a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10612,6 +10612,8 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>         struct dsc_mst_fairness_vars vars[MAX_PIPES];
>  #endif
> +       struct drm_dp_mst_topology_state *mst_state;
> +       struct drm_dp_mst_topology_mgr *mgr;
>  
>         trace_amdgpu_dm_atomic_check_begin(state);
>  
> @@ -10819,6 +10821,32 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>                 lock_and_validation_needed = true;
>         }
>  
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> +               struct amdgpu_dm_connector *aconnector;
> +               struct drm_connector *connector;
> +               struct drm_connector_list_iter iter;
> +               u8 link_coding_cap;
> +
> +               if (!mgr->mst_state )
> +                       continue;

extraneous space

> +
> +               drm_connector_list_iter_begin(dev, &iter);
> +               drm_for_each_connector_iter(connector, &iter) {
> +                       int id = connector->index;
> +
> +                       if (id == mst_state->mgr->conn_base_id) {
> +                               aconnector =
> to_amdgpu_dm_connector(connector);
> +                               link_coding_cap =
> dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
> +                               drm_dp_mst_update_coding_cap(mst_state,
> link_coding_cap);
> +
> +                               break;
> +                       }
> +               }
> +               drm_connector_list_iter_end(&iter);
> +
> +       }
> +#endif
>         /**
>          * Streams and planes are reset when there are changes that affect
>          * bandwidth. Anything that affects bandwidth needs to go through
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ad0795afc21c..fb5c47c4cb2e 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3368,7 +3368,7 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>         struct drm_dp_payload req_payload;
>         struct drm_dp_mst_port *port;
>         int i, j;
> -       int cur_slots = 1;
> +       int cur_slots = mgr->start_slot;
>         bool skip;
>  
>         mutex_lock(&mgr->payload_lock);
> @@ -4321,7 +4321,7 @@ int drm_dp_find_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr,
>         num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>  
>         /* max. time slots - one slot for MTP header */
> -       if (num_slots > 63)
> +       if (num_slots > mgr->total_avail_slots)
>                 return -ENOSPC;

For reasons I will explain a little further in this email, we might want to
drop this…

>         return num_slots;
>  }
> @@ -4333,7 +4333,7 @@ static int drm_dp_init_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>         int ret;
>  
>         /* max. time slots - one slot for MTP header */
> -       if (slots > 63)
> +       if (slots > mgr->total_avail_slots)

…and this

>                 return -ENOSPC;
>  
>         vcpi->pbn = pbn;
> @@ -4507,6 +4507,18 @@ int drm_dp_atomic_release_vcpi_slots(struct
> drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>  
> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> *mst_state, uint8_t link_coding_cap)

Need some kdocs here

> +{
> +       if (link_coding_cap == DP_CAP_ANSI_128B132B) {
> +               mst_state->total_avail_slots = 64;
> +               mst_state->start_slot = 0;
> +       }
> +
> +       DRM_DEBUG_KMS("%s coding format on mgr 0x%p\n",
> +                       (link_coding_cap == DP_CAP_ANSI_128B132B) ?
> "128b/132b":"8b/10b", mst_state->mgr);

need to fix indenting here, and wrap this to 100 chars

> +}
> +EXPORT_SYMBOL(drm_dp_mst_update_coding_cap);
> +
>  /**
>   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>   * @mgr: manager for this port
> @@ -4538,8 +4550,8 @@ bool drm_dp_mst_allocate_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>  
>         ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
>         if (ret) {
> -               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=63
> ret=%d\n",
> -                           DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> +               drm_dbg_kms(mgr->dev, "failed to init vcpi slots=%d max=%d
> ret=%d\n",
> +                           DIV_ROUND_UP(pbn, mgr->pbn_div), mgr-
> >total_avail_slots, ret);
>                 drm_dp_mst_topology_put_port(port);
>                 goto out;
>         }
> @@ -5226,7 +5238,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> drm_dp_mst_topology_mgr *mgr,
>                                          struct drm_dp_mst_topology_state
> *mst_state)
>  {
>         struct drm_dp_vcpi_allocation *vcpi;
> -       int avail_slots = 63, payload_count = 0;
> +       int avail_slots = mgr->total_avail_slots, payload_count = 0;
>  
>         list_for_each_entry(vcpi, &mst_state->vcpis, next) {
>                 /* Releasing VCPI is always OK-even if the port is gone */
> @@ -5255,7 +5267,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
> drm_dp_mst_topology_mgr *mgr,
>                 }
>         }
>         drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d
> used=%d\n",
> -                      mgr, mst_state, avail_slots, 63 - avail_slots);
> +                      mgr, mst_state, avail_slots, mgr->total_avail_slots -
> avail_slots);
>  
>         return 0;
>  }
> @@ -5421,6 +5433,10 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state
> *state)
>                         break;
>  
>                 mutex_lock(&mgr->lock);
> +
> +               mgr->start_slot = mst_state->start_slot;
> +               mgr->total_avail_slots = mst_state->total_avail_slots;
> +

this isn't correct - atomic checks aren't allowed to mutate anything besides
the atomic state structure that we're checking since we don't know whether or
not the display state is going to be committed when checking it. If we're
storing state in mgr, that state needs to be written to mgr during the atomic
commit instead of the atomic check.

...but, coming back to this MST code after being gone for a while, I think it
might be time for us to stop worrying about the non-atomic state. Especially
since there's only one driver using it; the legacy radeon.ko; and right now
the plan is either to just drop MST support on radeon.ko or move the MST code
it uses into radeon.ko.Which brings me to say - I think we can drop some of
the hunks I mentioned above (e.g. the changes to drm_dp_init_vcpi and
drm_dp_find_vcpi_slots I mentioned above). We can then just update the kdocs
for these functions in a separate patch to clarify that now in addition to
being deprecated, these functions are just broken and will eventually be
removed.

So - doing that allows us to get rid of mgr->total_avail_slots and mgr-
>start_slot entirely, just set the slot info in the atomic state during atomic
check, and then just rely on the atomic state for
drm_dp_atomic_find_vcpi_slots() and friends. Which seems much simpler to me,
does this sound alrght with you?

>                 ret = drm_dp_mst_atomic_check_mstb_bw_limit(mgr-
> >mst_primary,
>                                                             mst_state);
>                 mutex_unlock(&mgr->lock);
> @@ -5527,11 +5543,16 @@ int drm_dp_mst_topology_mgr_init(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (!mgr->proposed_vcpis)
>                 return -ENOMEM;
>         set_bit(0, &mgr->payload_mask);
> +       mgr->total_avail_slots = 63;
> +       mgr->start_slot = 1;
>  
>         mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>         if (mst_state == NULL)
>                 return -ENOMEM;
>  
> +       mst_state->total_avail_slots = 63;
> +       mst_state->start_slot = 1;
> +
>         mst_state->mgr = mgr;
>         INIT_LIST_HEAD(&mst_state->vcpis);
>  
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index ddb9231d0309..f8152dfb34ed 100644
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
> @@ -661,6 +663,16 @@ struct drm_dp_mst_topology_mgr {
>          */
>         int pbn_div;
>  
> +       /**
> +        * @total_avail_slots: 63 for 8b/10b, 64 for 128/132b
> +        */
> +       u8 total_avail_slots;
> +
> +       /**
> +        * @start_slot: 1 for 8b/10b, 0 for 128/132b
> +        */
> +       u8 start_slot;
> +
>         /**
>          * @funcs: Atomic helper callbacks
>          */
> @@ -806,6 +818,7 @@ int drm_dp_mst_get_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr, struct drm_dp
>  
>  void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> struct drm_dp_mst_port *port);
>  
> +void drm_dp_mst_update_coding_cap(struct drm_dp_mst_topology_state
> *mst_state, uint8_t link_coding_cap);
>  
>  void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
>                                 struct drm_dp_mst_port *port);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

