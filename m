Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63807264BBC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 19:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ACA6E965;
	Thu, 10 Sep 2020 17:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164F56E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 17:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599760085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehkzB4LttygthmWCADkLgwoMYDzvXG4NiI7HnkwKLek=;
 b=UTdhcYLvxBi1Bau5hz+Iqcq8FJ1trQs3Ri4rHYhT7OJAy2vtlTY0OV8114J7XMI8BOE84T
 iBkK/x0ugwEGSeSRP9u11aAlt+EBULrNEo0ap1l/LxC+LQ6MGZkGpBMMA3b5ETUPLnzTPp
 89KEijfzCTb2wl4kXMtVK4sniABb+rs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-48QIGqknMjqZebB-rMzffw-1; Thu, 10 Sep 2020 13:48:03 -0400
X-MC-Unique: 48QIGqknMjqZebB-rMzffw-1
Received: by mail-qt1-f199.google.com with SMTP id c5so4676046qtd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ehkzB4LttygthmWCADkLgwoMYDzvXG4NiI7HnkwKLek=;
 b=q6z9sPRqMu6YT8OEECsncw8ZSI2ct7dB1mHGV5L4go8RoyHMc2Phq8EMvJS69UVECN
 +O8acZ+lDMu11a3U8WR+mwJ3t8I04CpUEy93uqYTFHfPFsAnP4cg5sPdOujOCJQKIFAO
 tkIjUKZnEmQKqI7lwbvbOliDU3VOrII2N8LMem28KctHvWRlPaC7DWwwaO/jdfE1Cvn6
 hlR+9j2SUrQBC5hLpf7SEn+MIDCJL+aDCoIvKOUfQRnE2wFQcCPNiSrrOkl7YO53i3F3
 N4JSaSKP+raPhMHGpCBDlj0Yp4DumnnFfdLX/GDg+8nlzcsmVrmIYLcKOVSjS2vpd7yX
 DUVg==
X-Gm-Message-State: AOAM532NAjg1wY6h7k/uLO0P7ywoS924qJQpTlTobA4rsTRO+acJiCH7
 D+Sa8+AlG+96k7yMJQEhMmqjmUH9MosXlaUX6eSyS28DHcUQR0to7igHjMEVDyvN5uX5ipNWtz+
 VJOSxrKu33sZ/fDUbPwP4+oqOUb0c
X-Received: by 2002:ac8:4757:: with SMTP id k23mr8914735qtp.105.1599760082023; 
 Thu, 10 Sep 2020 10:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzrl4LkG26r8eXUfai68ZH7uwANmEYme9QgnBK2OI1JAg0CpzmWdq4JyMISo9AxCnwM+2uzQ==
X-Received: by 2002:ac8:4757:: with SMTP id k23mr8914716qtp.105.1599760081800; 
 Thu, 10 Sep 2020 10:48:01 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id o13sm6910440qkm.16.2020.09.10.10.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:48:01 -0700 (PDT)
Message-ID: <d1571cdd6a68e8f17ff2e386abd35fd5819d2de8.camel@redhat.com>
Subject: Re: [PATCH] V2: Currently, DRM get the capability of the mst hub
 only from DP_DPCD_REV and get the slower speed even the mst hub can run in
 the faster speed.
From: Lyude Paul <lyude@redhat.com>
To: Koba Ko <koba.ko@canonical.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2020 13:48:00 -0400
In-Reply-To: <20200910063640.21519-1-koba.ko@canonical.com>
References: <20200910063640.21519-1-koba.ko@canonical.com>
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
Cc: anthony.wong@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit message should be shorter and follow the format other commits for
drm usually do, in this case something like:

drm/dp_mst: Retrieve extended DPCD caps for topology manager

On Thu, 2020-09-10 at 14:36 +0800, Koba Ko wrote:
> As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
> get the faster capability.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
> 
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> ---
> ChangeLog:
> 1. use drm_dp_read_dpcd_caps instead.
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 7753c718ddf9..293f71d0ae90 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3694,8 +3694,8 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> drm_dp_mst_topology_mgr *mgr, bool ms
>  			((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT)
> ?  DP_DP13_DPCD_REV : DP_DPCD_REV);
>  
>  		/* get dpcd info */
> -		ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd,
> DP_RECEIVER_CAP_SIZE);
> -		if (ret != DP_RECEIVER_CAP_SIZE) {
> +		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> +		if (ret < 0) {
>  			DRM_DEBUG_KMS("failed to read DPCD\n");

Let's use drm_dbg_kms() here, and let's also print the return code when this
fails.

With those things fixed:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>  			goto out_unlock;
>  		}
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
