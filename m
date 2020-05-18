Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1D71D7C2A
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 17:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FAE6E41F;
	Mon, 18 May 2020 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5396E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 15:01:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w64so10830410wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 08:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C0sgMxM8g+4Waj9pVVISPABbj6jQe80C6L3EK7QWp84=;
 b=AAWs5bvhf12nEhdF43aZ04haPoD/HOjrKQXxIdS8XSoObNMLUPDQZltos2BF9ELKcS
 K/N1a3PP92Kn70oJkwyBhDC5WWfeeYSyNWGxggGAt6mjoeJUgSdQgdy9saDsV8uSQuL7
 /gRCybw8gZ4D2PfaW7QXlLdrBczWcg/PvbXnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C0sgMxM8g+4Waj9pVVISPABbj6jQe80C6L3EK7QWp84=;
 b=Be3DQe3zfR3AEeapVwVh7U7fBnE2mYfo1LkGYNOzH5PDEKzGAukZtaY7AsIRJbdmRC
 Qfg7w0Fkc4xQ+qnD/oTb4/A2SanFz+DoUah7gklLQRXWgScQhaJ1b5M2CH9Oje/bL0CT
 3aUWseXdvcF7vFMteRV6rr5nfbGYudukgDh8xEMXiy1laqf/a0wKyK7NX5A/dLQr6yR9
 NgvrGEBfw2EWSO7L5edMReNfmq9tZ1te5JhNwCtznHOuIJ2S3w22UChocGapUvnQRVoj
 7ZEv8BltEq3RyWVBmJUBpMKCch4dKG3m9uY0K0j0ANZ5G2R1tAFtrRcUo67iaEzRmGI2
 e4Cw==
X-Gm-Message-State: AOAM53169smDLgQnlzyr9dNJNabBjIYw+RybAnPa33Yj1yBe38lG+yee
 GgGafOSnz5RAKLU5TuZ9zYV1a/sy650=
X-Google-Smtp-Source: ABdhPJx6Bss3RCMyEm4YXy1Vnl5Qkp1Cr1+G6oGaE5EoZhYRpkfgj5sJ7lTJgcjcn1+FsYiGBo2v1Q==
X-Received: by 2002:a1c:46c2:: with SMTP id t185mr18957316wma.99.1589814112107; 
 Mon, 18 May 2020 08:01:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 8sm16676422wmb.15.2020.05.18.08.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:01:51 -0700 (PDT)
Date: Mon, 18 May 2020 17:01:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 4/4] drm: Match drm_dp_send_clear_payload_id_table
 definition to declaration
Message-ID: <20200518150149.GR206103@phenom.ffwll.local>
References: <20200516212330.13633-1-chris@chris-wilson.co.uk>
 <20200516212330.13633-4-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516212330.13633-4-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 16, 2020 at 10:23:30PM +0100, Chris Wilson wrote:
> drivers/gpu/drm/drm_dp_mst_topology.c:2898:6: warning: symbol 'drm_dp_send_clear_payload_id_table' was not declared. Should it be static?

Compiler seems a bit confused, because there is a static declaration a bit
further up. So should have complained about inconsistent decls, but then
my understanding of C is rather shoddy.

> drivers/gpu/drm/drm_dp_mst_topology.c:5451:37: warning: missing braces around initializer
> drivers/gpu/drm/drm_dp_mst_topology.c:5451:37: warning: missing braces around initializer
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 70455e304a26..1bdf3cfeeebb 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2895,8 +2895,9 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
>  	return ret < 0 ? ret : changed;
>  }
>  
> -void drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
> -					struct drm_dp_mst_branch *mstb)
> +static void
> +drm_dp_send_clear_payload_id_table(struct drm_dp_mst_topology_mgr *mgr,
> +				   struct drm_dp_mst_branch *mstb)
>  {
>  	struct drm_dp_sideband_msg_tx *txmsg;
>  	int ret;
> @@ -5448,7 +5449,7 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
>  {
>  	struct drm_dp_mst_port *immediate_upstream_port;
>  	struct drm_dp_mst_port *fec_port;
> -	struct drm_dp_desc desc = { 0 };
> +	struct drm_dp_desc desc = {};
>  	u8 endpoint_fec;
>  	u8 endpoint_dsc;
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
