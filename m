Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B5243D77F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 01:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC5089B22;
	Wed, 27 Oct 2021 23:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D0F89B22
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635377250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQ2EX/iGlxfUkLSrXEN+pF97BYMN0m5HzyxRhk6Sil8=;
 b=eMSBGpfcWUmezQDY/jwpllrIfUSXtxjYhgDwv4vQw3QYj09NEPkpnXCzQN1vEhHPHLGiOt
 J5rWIr6awIlxdgyp6ZyRFK8m/Yfsl3RqAldd2vyxVk+9zCoPvJWOCu9Cxj3jJ3dkVngjKx
 s0soZA9sj/KHnOclahPPrTtZdRvt2xM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-qXyHqKXuOQCs-gr4GzrdMw-1; Wed, 27 Oct 2021 19:27:29 -0400
X-MC-Unique: qXyHqKXuOQCs-gr4GzrdMw-1
Received: by mail-qt1-f197.google.com with SMTP id
 c19-20020ac81e93000000b002a71180fd3dso3111321qtm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=NQ2EX/iGlxfUkLSrXEN+pF97BYMN0m5HzyxRhk6Sil8=;
 b=iCeftq/qWTquJlbMcR0OHynGMUv0NsYI+cNqiIQW+SYB+y2xUAppVJ7FuR7neZeyqB
 4OwDNyxHV0bZ4U9QJ82iIOQb66+EnaScL9/CmTpUwLrGjEN8eirOMBLp7tP14eQMf4Iy
 UgARqKwu121pzKNTQmeR9F7Lw9njZenffWVY5cQQPidWDwtur/Rt95O/xMfUYLQSAuw3
 4IY36Pxp5ydiA7ZHAFKSpiz957lXUb/Lnj7SnzmqZS97ttvrSLqr7PgshfWVqBsKtqpd
 UdcEOjNFcIWR+MMQ0LeiS3QnX5hOmqi36QZgJxS2qi0znc3fI6k5XnioJzG+Up+MPp7g
 /1VQ==
X-Gm-Message-State: AOAM533b2Ir5vxhSMVZoG+5YD4INX9qD2BTpG+UNKMOQVNO9XfeZpX7o
 PUe1o54Ov1jKQge2Ow9E6Bw7h6KVH3uES69hor8BEND8PZCKTRu+xqUMiY/gm7tExFMDeeCYKSD
 jx1nTjHxEcuqG5/IM6KqMtjyZFsyQ
X-Received: by 2002:ac8:7146:: with SMTP id h6mr876685qtp.293.1635377248562;
 Wed, 27 Oct 2021 16:27:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBkyy2RwimWfX7VxkNXauR8I71fABvtV9veMvEdqL9SGevyEryTrEq2bMb7UYbShHKL30RWA==
X-Received: by 2002:ac8:7146:: with SMTP id h6mr876657qtp.293.1635377248307;
 Wed, 27 Oct 2021 16:27:28 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id z30sm822186qtm.55.2021.10.27.16.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:27:27 -0700 (PDT)
Message-ID: <f3c83ab8498ebff3d1f9dc57d0118a72f1411cb1.camel@redhat.com>
Subject: Re: [PATCH] drm/amdgpu/display: fix build when
 CONFIG_DRM_AMD_DC_DCN is not set
From: Lyude Paul <lyude@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@gmail.com>
Date: Wed, 27 Oct 2021 19:27:26 -0400
In-Reply-To: <20211027223914.1776061-1-alexander.deucher@amd.com>
References: <20211027223914.1776061-1-alexander.deucher@amd.com>
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will add to the topic branch right now

On Wed, 2021-10-27 at 18:39 -0400, Alex Deucher wrote:
> Need to guard some things with CONFIG_DRM_AMD_DC_DCN.
> 
> Fixes: 41724ea273cdda ("drm/amd/display: Add DP 2.0 MST DM Support")
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Dave Airlie <airlied@gmail.com>
> ---
> 
> Lyude, can you apply this to topic/amdgpu-dp2.0-mst? or Dave, if it's
> already pulled can you apply this to drm-next?
> 
> Thanks!
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         | 2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a02ca525610c..3f36dbb2c663 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10723,9 +10723,9 @@ static int amdgpu_dm_atomic_check(struct drm_device
> *dev,
>         struct dm_crtc_state *dm_old_crtc_state;
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>         struct dsc_mst_fairness_vars vars[MAX_PIPES];
> -#endif
>         struct drm_dp_mst_topology_state *mst_state;
>         struct drm_dp_mst_topology_mgr *mgr;
> +#endif
>  
>         trace_amdgpu_dm_atomic_check_begin(state);
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 719cbec4c45e..c200e07d2fb2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -219,7 +219,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
>         struct drm_dp_mst_topology_mgr *mst_mgr;
>         struct drm_dp_mst_port *mst_port;
>         bool ret;
> -       u8 link_encoding_cap;
> +       u8 link_encoding_cap = DP_8b_10b_ENCODING;
>  
>         aconnector = (struct amdgpu_dm_connector *)stream-
> >dm_stream_context;
>         /* Accessing the connector state is required for vcpi_slots
> allocation
> @@ -239,7 +239,9 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
>  
>         mst_port = aconnector->port;
>  
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>         link_encoding_cap =
> dc_link_dp_mst_decide_link_encoding_format(aconnector->dc_link);
> +#endif
>  
>         if (enable) {
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

