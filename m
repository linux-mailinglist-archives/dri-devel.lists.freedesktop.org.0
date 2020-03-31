Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E219A059
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 22:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B440D6E890;
	Tue, 31 Mar 2020 20:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB8A6E890
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585688382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4YVDPR21FGqCPWXR9SrEVqjm1WqP0KZpWMtMfgg6Wc=;
 b=WOV0xcu4IdToG2NJ+mre3yaN0yLb2hrLCDCxjyn1prDw7BMfrlXYGRwq4o9cZqQW5R1Emx
 HREIrGkNLWqOBRuQ6MokfxLFCmMUNFjxCdC9fR/hfmIef1rhTb5BvD19Wh6e93bAgQYxXp
 EGIlJOPNXvPKbKhQ1RiGqdJOmmMz3+E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-9Kxz3CQ0Mu6bejSnMXXXVQ-1; Tue, 31 Mar 2020 16:59:41 -0400
X-MC-Unique: 9Kxz3CQ0Mu6bejSnMXXXVQ-1
Received: by mail-qt1-f197.google.com with SMTP id v10so19137707qtk.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 13:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=t4YVDPR21FGqCPWXR9SrEVqjm1WqP0KZpWMtMfgg6Wc=;
 b=nNfbjhO9px62uAX95C/iFV+Tis9EcIfgejHBj/Iu9dmBcrtmnsk17siWEcbzueul1m
 py2mwWrQh2Xtao1PoooLVwQ20SyR5Pxgr8EVSPyrPYb5U0d1kWocdvgxiv+tpXcPLrbP
 RwgqMmUspSXlUwa8ZwrfU2QCJ4pgpc3To+g7NzgzveAA+qPA7ETRfoTFiwou1Ik2JxrO
 ltrS5qh+pblUuQ9qA241Vvcv8LCzup6ziX+53RD/6nS/bNA3Dq93+dXk+8Oz1bTtKyT6
 Xv1ODEQy5N3a9WZHwhU5HqwucndX/528f99G0phmWagzzaUDPajWDLESmHSo50Tn2reB
 pxLA==
X-Gm-Message-State: ANhLgQ35p0yU0Sik+gwL/WtSyfJwrlhx/DUgxvjsXtDBRbT2ajbd5krJ
 pe3isYp+UlpXByD81MBgHJvpyFxyWHXgpCxao6MohxZTaNx5Fz32lLDpZix7swUUP8FWkGdutgM
 1Vou/0YcKdMys4TtOg6yEQ1oRSH1U
X-Received: by 2002:ac8:6951:: with SMTP id n17mr7263754qtr.250.1585688381217; 
 Tue, 31 Mar 2020 13:59:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu+gmBKFlSnhi7yAuTz/EYz85EmT34h/ZKxIYX9ZPTIrRD9PvqYK87A2DJCzzsGs7qM5Zx/UQ==
X-Received: by 2002:ac8:6951:: with SMTP id n17mr7263682qtr.250.1585688379972; 
 Tue, 31 Mar 2020 13:59:39 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id f201sm61653qke.119.2020.03.31.13.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 13:59:39 -0700 (PDT)
Message-ID: <c427110aa4e0eb4ffdc11bb8e3b9eebfc6b50544.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: make build_clear_payload_id_table return void
From: Lyude Paul <lyude@redhat.com>
To: Maya Rashish <coypu@sdf.org>, dri-devel@lists.freedesktop.org
Date: Tue, 31 Mar 2020 16:59:38 -0400
In-Reply-To: <20200321222959.GA1053@SDF.ORG>
References: <20200321222959.GA1053@SDF.ORG>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I'll go ahead and push it to drm-misc-next, thanks!

On Sat, 2020-03-21 at 22:29 +0000, Maya Rashish wrote:
> Nothing uses the always-0 return value.
> 
> Signed-off-by: Maya Rashish <coypu@sdf.org>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 4b255e25e4a1..398da29ba1bd 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1060,13 +1060,12 @@ static void build_link_address(struct
> drm_dp_sideband_msg_tx *msg)
>  	drm_dp_encode_sideband_req(&req, msg);
>  }
>  
> -static int build_clear_payload_id_table(struct drm_dp_sideband_msg_tx *msg)
> +static void build_clear_payload_id_table(struct drm_dp_sideband_msg_tx
> *msg)
>  {
>  	struct drm_dp_sideband_msg_req_body req;
>  
>  	req.req_type = DP_CLEAR_PAYLOAD_ID_TABLE;
>  	drm_dp_encode_sideband_req(&req, msg);
> -	return 0;
>  }
>  
>  static int build_enum_path_resources(struct drm_dp_sideband_msg_tx *msg,
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
