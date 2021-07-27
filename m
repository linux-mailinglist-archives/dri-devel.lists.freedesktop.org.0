Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F59F3D7E7C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 21:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A80D6E9DA;
	Tue, 27 Jul 2021 19:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6920A6E802
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 19:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627413931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCcIAoLLgVkcxUqPKKOZeIp8QENc5ogrPw8x8EmlWyE=;
 b=Zh7s8iQUIjEMNziOwB5kCj9umgNEhvdyRT/8e3QX225SCxUynaPGTNvAF3iBiGZaH7joYH
 tnUBCUtxf39oaG66+msTqdFv957gA+cRu3qsZmjaIjje8uzLhJQ4QUTL58RlgVCO42jNqp
 ikHk4Sv2uSb6tH7vFtwtzrgylgb5kxM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-aC0oBDQbPj2_x54SjCk4nw-1; Tue, 27 Jul 2021 15:25:29 -0400
X-MC-Unique: aC0oBDQbPj2_x54SjCk4nw-1
Received: by mail-qt1-f198.google.com with SMTP id
 s14-20020ac8528e0000b029025f76cabdfcso6876276qtn.15
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 12:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=WCcIAoLLgVkcxUqPKKOZeIp8QENc5ogrPw8x8EmlWyE=;
 b=Ccwj2zWJ1SngWDZ7KbqLjWojgQj8uQCaIbwbaoSmIZ+BCKwNEsnrvE/sx++pfMIpSc
 XMPA28txekIX+C7TowfSJq6f2D9IvOe2maV+iGaeBcvX3pMIxtzQdmUZgV6rfAaRTSas
 x92CCjK89dz6obiBNOOABL2Rzh2+GsRKF66o3SmiRVSy7tHMAnmUGAtEVlpB6b34LJd4
 udtg0u58oVBvvLQFWU1XqbDBvkocQp8885qheoT+oaYBOpkJBR/GblkEYycsyStdA2Lk
 Ki21B94MvqBnFlfNMYz0HVU8VIHO4xo6IX+84v/ge7IMqIylhDnH2bgO5em79FrtoZjm
 3A4w==
X-Gm-Message-State: AOAM531ndR4cdDt7cqW+lW/wboY1Gyh1IREFZPBUKfTcMF7dOlN8pwii
 UTIW0+fN+xH9w7TtKMf359ImIfl02v21dOK8bdn+hpfAihF9MlTdcNo0BCANm7NF+z/5j3FYxJJ
 hB2tJu4/2ASxO8u5/7/n0P0l5LeIm
X-Received: by 2002:a05:620a:16cc:: with SMTP id
 a12mr23910665qkn.97.1627413929063; 
 Tue, 27 Jul 2021 12:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmCwqRTH5oOTEKnkJwEuGSq39savvt0K6d1vLl9O0BPtozX+Ajj86FlkgspyuEjgCqeGY8wQ==
X-Received: by 2002:a05:620a:16cc:: with SMTP id
 a12mr23910653qkn.97.1627413928910; 
 Tue, 27 Jul 2021 12:25:28 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id 12sm2149727qkr.10.2021.07.27.12.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 12:25:28 -0700 (PDT)
Message-ID: <9e41662e27c08c34685d32d424136c6c81f66a28.camel@redhat.com>
Subject: Re: [RESEND PATCH v6 11/14] drm/mst: Convert debug printers to
 debug category printers
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 ppaalanen@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de,  airlied@linux.ie, daniel.vetter@ffwll.ch
Date: Tue, 27 Jul 2021 15:25:26 -0400
In-Reply-To: <20210721175526.22020-12-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-12-sean@poorly.run>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-07-21 at 13:55 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The printers in dp_mst are meant to be gated on DRM_UT_DP, so use the
> debug category printer to avoid dumping mst transactions to the wrong
> place.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link:
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-12-sean@poorly.run
>  #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index ad0795afc21c..b1dddecad4c6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1356,7 +1356,8 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
>         }
>  out:
>         if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
> -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +               struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
> +                                                                
> DBG_PREFIX);
>  
>                 drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>         }
> @@ -2873,7 +2874,8 @@ static int process_single_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr,
>  
>         ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
>         if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +               struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
> +                                                                
> DBG_PREFIX);
>  
>                 drm_printf(&p, "sideband msg failed to send\n");
>                 drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> @@ -2917,7 +2919,8 @@ static void drm_dp_queue_down_tx(struct
> drm_dp_mst_topology_mgr *mgr,
>         list_add_tail(&txmsg->next, &mgr->tx_msg_downq);
>  
>         if (drm_debug_enabled(DRM_UT_DP)) {
> -               struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +               struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
> +                                                                
> DBG_PREFIX);
>  
>                 drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>         }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

