Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F6F3AA48C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 21:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403F96E07B;
	Wed, 16 Jun 2021 19:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35EB6E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623872849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuBZSqko5Wg5MjHG2EzME1ka0sMbkGR6g1xPzacnHGU=;
 b=O65hlarojNayqO8JITF8vyx0/6iaY1dYQAJFTXxozFcJKyRjvlFqY+lPY9NkSHy8vG5niS
 8Zlf8MBVks/CrcZRIEhy2wxv4c76zMTqfOyDsTVUhWAA31q2ajElBsozCGxa88h2f7OQBw
 Z0TzWVItde6FGogpz2aPd0WHv5ZSu7Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-2unbeAg4PzmEcipS0v_Dsw-1; Wed, 16 Jun 2021 15:47:28 -0400
X-MC-Unique: 2unbeAg4PzmEcipS0v_Dsw-1
Received: by mail-qk1-f197.google.com with SMTP id
 e13-20020a37e50d0000b02903ad5730c883so365751qkg.22
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 12:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=LuBZSqko5Wg5MjHG2EzME1ka0sMbkGR6g1xPzacnHGU=;
 b=aOpQWvnkId2xKqblCL4Ldcuc6flE6wBzHGmuiUPNiqVBiFYE+JL41kLYMuBH3zpEml
 DA1VDUcX9a+4BENbrDz6Hl/Tmwe5VhebOFaSeRiD+AQw+VHzfJ1YgYNGT3tftIZUrlYl
 GNRV1aaFWtcUahRURPRusQOENa51D4aTRq+4sD6yz8+QoARll0GTzi0NuCIbzhJgfEXz
 pUsyXHW+UGEoxYVHgh8oWP3hRbslWEXw7FTK/7W+KP/eUUwZQuu4tLgkzNPHFYPELaQq
 WgTAbULADAD8wwWM2XlfgngjUobKwkyJEYAO/upKvqH40m5nB0p4UPkBxYP0sDXolSZ8
 8MgA==
X-Gm-Message-State: AOAM533zBwbYCR6wXsIdVvJZtJbI/lZ5NWMKP9a20yxh8GytGOiV8gYo
 fHPIwLwuFkO0yB53zx3xq6E93hoiosJYjw9xNzFg3OlwVh4gUEokCiQRi0dcfDzJFWDiizCMg5m
 1w47/++BL+E2kdzbzFnfCTMxbJq/E
X-Received: by 2002:ad4:5561:: with SMTP id w1mr1745609qvy.47.1623872847809;
 Wed, 16 Jun 2021 12:47:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWcIYQKYsFWAuXGbK2jNa9W+sx7lKlI6iTJv9x/60P+QU2mk5SGDgr/O3Z4JCaLErsQ5BRrQ==
X-Received: by 2002:ad4:5561:: with SMTP id w1mr1745585qvy.47.1623872847576;
 Wed, 16 Jun 2021 12:47:27 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id o21sm201003qkp.51.2021.06.16.12.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:47:27 -0700 (PDT)
Message-ID: <6b5b8d478b3ecb33858c3f55f432178c0917ffb4.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Add missing drm parameters to recently
 added call to drm_dbg_kms()
From: Lyude Paul <lyude@redhat.com>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 intel-gfx@lists.freedesktop.org
Date: Wed, 16 Jun 2021 15:47:26 -0400
In-Reply-To: <20210616194415.36926-1-jose.souza@intel.com>
References: <20210616194415.36926-1-jose.souza@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will go ahead and push this to drm-misc-next-fixes, thanks

On Wed, 2021-06-16 at 12:44 -0700, José Roberto de Souza wrote:
> Commit 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by
> ports in stale topology") added to calls to drm_dbg_kms() but it
> missed the first parameter, the drm device breaking the build.
> 
> Fixes: 3769e4c0af5b ("drm/dp_mst: Avoid to mess up payload table by ports in
> stale topology")
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 9ac148efd9e43..ad0795afc21cf 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3389,7 +3389,9 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>                         mutex_unlock(&mgr->lock);
>  
>                         if (skip) {
> -                               drm_dbg_kms("Virtual channel %d is not in
> current topology\n", i);
> +                               drm_dbg_kms(mgr->dev,
> +                                           "Virtual channel %d is not in
> current topology\n",
> +                                           i);
>                                 continue;
>                         }
>                         /* Validated ports don't matter if we're releasing
> @@ -3404,7 +3406,8 @@ int drm_dp_update_payload_part1(struct
> drm_dp_mst_topology_mgr *mgr)
>                                                 payload->start_slot =
> req_payload.start_slot;
>                                                 continue;
>                                         } else {
> -                                               drm_dbg_kms("Fail:set
> payload to invalid sink");
> +                                               drm_dbg_kms(mgr->dev,
> +                                                           "Fail:set
> payload to invalid sink");
>                                                 mutex_unlock(&mgr-
> >payload_lock);
>                                                 return -EINVAL;
>                                         }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

