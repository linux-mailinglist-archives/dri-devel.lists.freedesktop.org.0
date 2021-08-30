Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027243FBD3C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 22:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00DC89C7F;
	Mon, 30 Aug 2021 20:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36A689C7F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630353621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TclmamUQAg7Kq6o8IuapTdzVGFJV410iIkAqikExtck=;
 b=J3YwNlUXdOH4kX0BhAedErLPqorCQhhAr+hIJyGBd8EmXKk/q5iCbyzGy7WC2hGtQ3lAGx
 8gO6mk6WitPZJyx6CY/wm1ahCvuZbu2UHBSDCNlLjKgKNw2qpPXnLZ5eNSUdPLMjuNcyX8
 H43wKpCcjdHuAJjcICDcDXUuqG5fIaM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-_X_sFbWfNByCAt2zIfeLXA-1; Mon, 30 Aug 2021 16:00:20 -0400
X-MC-Unique: _X_sFbWfNByCAt2zIfeLXA-1
Received: by mail-qt1-f200.google.com with SMTP id
 b24-20020ac86798000000b0029eaa8c35d6so717539qtp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TclmamUQAg7Kq6o8IuapTdzVGFJV410iIkAqikExtck=;
 b=QOCNV02NCS+OPUWj1xD8KaPFrhNarhM8aRfZ755CRbMh32EHyMKkRoJYU6GS4A1Jdj
 9x117vEP8XpBV13o1aFLxkjJMTqEEWhPxzsVI3R8sMjISSLBsvhd/JGo5/mwkXIGNVuE
 0AEdiclVAFMhEw4WlxCxsN1nX9twhvve2qBYivfwTBmIR70N575v4A9SZHQRCbKDIjH9
 XZDAMd/ZYL1F77OcNS0e3YTCm+mMhlQWqXCE0dz7mZLwmPQGNiCaPTt36/AeOwwpWcFk
 ZA5VO4U86ljNzWJzGLhibeJgaY3vCA4Mn51uadFh7OFWpxAtws6rgZJ1AtV3W3RW7exs
 v6Ww==
X-Gm-Message-State: AOAM531ZFOd58+GoEmDcJtsB3kJaIyVgFsFFNBPJfH57ExylckWdryBx
 bglktUpKnz/U4ApHxG4clzXyn+2anugvKh+SLl79Kfcqa01VVMtF5hn+Ctmy+61nGMxlyib+pRL
 H3YY5Sf3SI8w99ldg93FfJ9VY00rz
X-Received: by 2002:a37:6447:: with SMTP id y68mr23699479qkb.296.1630353620202; 
 Mon, 30 Aug 2021 13:00:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydFi13FOuDGZdniWRzV4OwgUKdKZCE/V64t0fD6gyGqYBfla7yIlFmaAzmmif5JXxAaMiw2A==
X-Received: by 2002:a37:6447:: with SMTP id y68mr23699460qkb.296.1630353619949; 
 Mon, 30 Aug 2021 13:00:19 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v128sm12177119qkh.27.2021.08.30.13.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 13:00:19 -0700 (PDT)
Message-ID: <373e528ab10df8d95214f3bf961281e516da8469.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm: Update MST First Link Slot Information Based
 on Encoding Format
From: Lyude Paul <lyude@redhat.com>
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org
Cc: harry.wentland@amd.com, Nicholas.Kazlauskas@amd.com, wayne.lin@amd.com
Date: Mon, 30 Aug 2021 16:00:18 -0400
In-Reply-To: <20210827234322.2740301-2-Jerry.Zuo@amd.com>
References: <20210827234322.2740301-1-Jerry.Zuo@amd.com>
 <20210827234322.2740301-2-Jerry.Zuo@amd.com>
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

On Fri, 2021-08-27 at 19:43 -0400, Fangzhi Zuo wrote:
> 8b/10b encoding format requires to reserve the first slot for
> recording metadata. Real data transmission starts from the second slot,
> with a total of available 63 slots available.
> 
> In 128b/132b encoding format, metadata is transmitted separately
> in LLCP packet before MTP. Real data transmission starts from
> the first slot, with a total of 64 slots available.
> 
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 27 ++++++++++++++++++++-------
>  include/drm/drm_dp_mst_helper.h       |  9 +++++++++
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 86d13d6bc463..30544801d2b8 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3370,7 +3370,7 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>         struct drm_dp_payload req_payload;
>         struct drm_dp_mst_port *port;
>         int i, j;
> -       int cur_slots = 1;
> +       int cur_slots = mgr->start_slot;
>         bool skip;
>  
>         mutex_lock(&mgr->payload_lock);
> @@ -4323,7 +4323,7 @@ int drm_dp_find_vcpi_slots(struct
> drm_dp_mst_topology_mgr *mgr,
>         num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
>  
>         /* max. time slots - one slot for MTP header */
> -       if (num_slots > 63)
> +       if (num_slots > mgr->total_avail_slots)
>                 return -ENOSPC;
>         return num_slots;
>  }
> @@ -4335,7 +4335,7 @@ static int drm_dp_init_vcpi(struct
> drm_dp_mst_topology_mgr *mgr,
>         int ret;
>  
>         /* max. time slots - one slot for MTP header */
> -       if (slots > 63)
> +       if (slots > mgr->total_avail_slots)
>                 return -ENOSPC;
>  
>         vcpi->pbn = pbn;
> @@ -4509,6 +4509,17 @@ int drm_dp_atomic_release_vcpi_slots(struct
> drm_atomic_state *state,
>  }
>  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
>  
> +void drm_dp_mst_update_encoding_cap(struct drm_dp_mst_topology_mgr *mgr,
> uint8_t link_encoding_cap)
> +{
> +       if (link_encoding_cap == DP_CAP_ANSI_128B132B) {
> +               mgr->total_avail_slots = 64;
> +               mgr->start_slot = 0;
> +       }
> +       DRM_DEBUG_KMS("%s encoding format determined\n",
> +                     (link_encoding_cap == DP_CAP_ANSI_128B132B) ?
> "128b/132b" : "8b/10b");
> +}
> +EXPORT_SYMBOL(drm_dp_mst_update_encoding_cap);
> +

This seems to be missing kdocs, can you fix that?

Also - I'm not convinced this is all of the work we have to do, as there's no
locking taking place here in this function. If we're changing the number of
available VCPI slots that we have, we need to be able to factor that into the
atomic check logic which means that we can't rely on mgr->* for any kind of
data that isn't guaranteed to remain consistent throughout the lifetime of the
driver or topology. (Note that some of the old MST code didn't follow this
logic, so I wouldn't be surprised if there's still exceptions to this we need
to clean up).

Note that I still expect we'll have to keep some sort of track of the current
total slot count in the topology mgr, but that should be reflecting the
currently programmed state and not be relied on from our atomic check.

IMHO - the correct way we should go about adding support for this is to add
something into drm_dp_mst_topology_state and integrate this into the atomic
check helpers.

>  /**
>   * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
>   * @mgr: manager for this port
> @@ -4540,8 +4551,8 @@ bool drm_dp_mst_allocate_vcpi(struct
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
> @@ -5228,7 +5239,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
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
> @@ -5257,7 +5268,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct
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
> @@ -5529,6 +5540,8 @@ int drm_dp_mst_topology_mgr_init(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (!mgr->proposed_vcpis)
>                 return -ENOMEM;
>         set_bit(0, &mgr->payload_mask);
> +       mgr->total_avail_slots = 63;
> +       mgr->start_slot = 1;
>  
>         mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
>         if (mst_state == NULL)
> diff --git a/include/drm/drm_dp_mst_helper.h
> b/include/drm/drm_dp_mst_helper.h
> index ddb9231d0309..eac5ce48f214 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -661,6 +661,15 @@ struct drm_dp_mst_topology_mgr {
>          */
>         int pbn_div;
>  
> +       /**
> +        * @total_avail_slots: available slots for data transmission
> +        */
> +       u8 total_avail_slots;
> +       /**
> +        * @start_slot: first slot index for data transmission
> +        */
> +       u8 start_slot;
> +
>         /**
>          * @funcs: Atomic helper callbacks
>          */

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

