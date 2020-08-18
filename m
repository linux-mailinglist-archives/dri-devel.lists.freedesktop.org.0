Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA1249149
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 01:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F386E195;
	Tue, 18 Aug 2020 23:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4469B6E19C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597791606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XH1ffus/oTUp5WHBaBeT/m4fOXd0B7U6fSWc3CZi/cE=;
 b=fToDkPisyuFOeDCZa4EsYaWRhhr7bKiEffw2sRG8jstKfFO5NfEN1vsr/DiF4bTP/sTRXj
 pTVMzYr0SHcef0NhWOiVuHSsL/uTyL2+GvU0H76Vo9eYMZYJAVvNmJ5oXQ/PUowFE0d8r+
 HkZxCOuxPmve3qSPQ0vVmFsUwMTYuLg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-PIQ3CotlM7GCbi7D6dmKlQ-1; Tue, 18 Aug 2020 18:59:59 -0400
X-MC-Unique: PIQ3CotlM7GCbi7D6dmKlQ-1
Received: by mail-qv1-f71.google.com with SMTP id n5so14415828qvx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=XH1ffus/oTUp5WHBaBeT/m4fOXd0B7U6fSWc3CZi/cE=;
 b=faed7vFUTWDmpreMW8Oyt13tIXpWCSblkWc3ft9oLI7J9V+IJ0EsSEC2iWuvvSsIl5
 aK8GNH5PocI0IzKTLdkw7+/5osjMti0rIJMH5VHj3xEpMx4DO2zOQu+Z6+UNlI9qoDqT
 H5nWqyiGW64dVExe/PkAj1iJsYcLj1o2hWa8p03CsVX6dBnrloQUvc99I5qQBti1tRD5
 UbbRrFw9uh2Gf9BkQzVvyA3a3Ft0qXWwLNOI2a1AjY5sM1Ua21W5yvHyiTwjZ8Gud2YI
 gGVtxhLZW+tUeZvoulV0WlUWDAJWbMGxvwnMZJDb7ugfPaj2NsvURwuTbG+JFx9VVAUY
 6+tQ==
X-Gm-Message-State: AOAM533E8w60Tr6sLcHvjI/CRMNVBI8kjoKhOoxRrjR6/PKaTzijGiQA
 496x6a5z8t4kg4OeXjd93x307UVqxja4VkQt3soA/GnNVq/TNLn3QX9xJtpoALG3+v51+UcRhEE
 V8LE1Oaut93WDqkcpFtQxki+Vf8NS
X-Received: by 2002:a37:a982:: with SMTP id
 s124mr19292483qke.171.1597791599454; 
 Tue, 18 Aug 2020 15:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUtTsi0D7blN9eNOMHdhNiCGmxmAuOyuJt8csP3lvSaHZjYsVe6qS1LGziIguwb+pW/tWrVA==
X-Received: by 2002:a37:a982:: with SMTP id
 s124mr19292468qke.171.1597791599204; 
 Tue, 18 Aug 2020 15:59:59 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id w1sm22786311qkj.90.2020.08.18.15.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 15:59:58 -0700 (PDT)
Message-ID: <eaeaeeeff771e2d69976e67d763946b276a0b9fd.camel@redhat.com>
Subject: Re: [PATCH v6 11/14] drm/mst: Convert debug printers to debug
 category printers
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 ppaalanen@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, seanpaul@chromium.org, airlied@linux.ie
Date: Tue, 18 Aug 2020 18:59:57 -0400
In-Reply-To: <20200818210510.49730-12-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
 <20200818210510.49730-12-sean@poorly.run>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2020-08-18 at 17:05 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The printers in dp_mst are meant to be gated on DRM_UT_DP, so use the
> debug category printer to avoid dumping mst transactions to the wrong
> place.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: 
> https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-12-sean@poorly.run
> #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 67dd72ea200e..127120b60580 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1242,7 +1242,8 @@ static int drm_dp_mst_wait_tx_reply(struct
> drm_dp_mst_branch *mstb,
>  	}
>  out:
>  	if (unlikely(ret == -EIO) && drm_debug_enabled(DRM_UT_DP)) {
> -		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
> +								  DBG_PREFIX);
>  
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
> @@ -2781,7 +2782,8 @@ static int process_single_tx_qlock(struct
> drm_dp_mst_topology_mgr *mgr,
>  
>  	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
>  	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> -		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
> +								  DBG_PREFIX);
>  
>  		drm_printf(&p, "sideband msg failed to send\n");
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> @@ -2825,7 +2827,8 @@ static void drm_dp_queue_down_tx(struct
> drm_dp_mst_topology_mgr *mgr,
>  	list_add_tail(&txmsg->next, &mgr->tx_msg_downq);
>  
>  	if (drm_debug_enabled(DRM_UT_DP)) {
> -		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +		struct drm_printer p = drm_debug_category_printer(DRM_UT_DP,
> +								  DBG_PREFIX);
>  
>  		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>  	}
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
