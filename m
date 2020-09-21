Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E8273196
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 20:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92A89322;
	Mon, 21 Sep 2020 18:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDA189E39
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 18:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600711890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzvH6M5RSxqUJheqam9teVH+K2DUCz1tE6f6TiNbWPw=;
 b=BCKlTpHPCFRlhJHnopItAQKJSuzSa+VWG6QkK4Z7RzNs0EbqJOlgQGj9L4nmqnkDuL4efQ
 84TbWhIY2ol7JVFplJ+9qIbQJtsDAv2QuTtPN4g23ZXGdvmeot4o9Kc4hYBT6hcnOgnRcm
 nY+TAt38RLt65RZ00TOlxkM909OzByA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-V9Za0qjdPJ-LaLx90avUng-1; Mon, 21 Sep 2020 14:11:27 -0400
X-MC-Unique: V9Za0qjdPJ-LaLx90avUng-1
Received: by mail-qk1-f197.google.com with SMTP id 196so11563414qkn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=hzvH6M5RSxqUJheqam9teVH+K2DUCz1tE6f6TiNbWPw=;
 b=hKFoSm8WeuQCDuET+mDNjC/aqIr8eT4MmCl+zlRsaho4aHaCJV8eOFWA0LUzuz2pgc
 7zjlYxnGkvjkYaLNfFJwi7MbEyNyg3rxfIxA+gt+P/bgOoP4k9AJQZNeeZ7da2C67xhU
 w6TzJMX3duABbtUobP97s1o4gSv3ym8GOz9MjXPE/H+pwTV+A1BSdHFza+rXOLa6obLQ
 e9pViKL2pi/oUAlC8r/BoB0pt0U+noCverRP+v0X1bC9Qu1cLtamb1SHK3w5JuYPINGH
 QQ0Tvp/pDZcaNAJMM6HG1LYjk28EV3G/8URp7A7HoimPLSa9sNHv4bkR9y0oU49PNkWi
 bfkw==
X-Gm-Message-State: AOAM532uOyAA/X6Zi+SqAu+LvSuk1/wLjwiFk/oWrfzF6+a0GH3/N1mk
 Pcm9kqwL2knKPNzlkKxhWYoPxSgXzRpsJA+8ucvx3kMDTv8eO0lyWVAIiZYeusj4YPkBkBz+VRu
 ROeBg/PTITf0zdg+E8PYZKk+nFQF5
X-Received: by 2002:a05:620a:2082:: with SMTP id
 e2mr946138qka.421.1600711887008; 
 Mon, 21 Sep 2020 11:11:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/oz4y6Z65wyb8f5zL7wKknzmLX9r92w2Ax5gyx/tNEa9pPfRMQdZpq/i5rbwajLKLCWY+7A==
X-Received: by 2002:a05:620a:2082:: with SMTP id
 e2mr946109qka.421.1600711886653; 
 Mon, 21 Sep 2020 11:11:26 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t26sm9703493qkt.29.2020.09.21.11.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:11:25 -0700 (PDT)
Message-ID: <5f99b65c8a092df343c68249f2bce62e4cd0abff.camel@redhat.com>
Subject: Re: [PATCH v3] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
From: Lyude Paul <lyude@redhat.com>
To: Koba Ko <koba.ko@canonical.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 21 Sep 2020 14:11:24 -0400
In-Reply-To: <20200911034431.29059-1-koba.ko@canonical.com>
References: <20200911034431.29059-1-koba.ko@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Cc: anthony.wong@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, sorry I lost track of this until just now. Comments down below:

On Fri, 2020-09-11 at 11:44 +0800, Koba Ko wrote:
> As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1, read the DP_DP13_DPCD_REV to
> get the faster capability.
> If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0, read DP_DPCD_REV.
> 
> Signed-off-by: Koba Ko <koba.ko@canonical.com>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> Changelog:
> 1. Adjust the commit message.
> 2. use drm_dbg_kms instead and print the return code.
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 7753c718ddf9..63f8809b9aa4 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -3671,8 +3671,6 @@ EXPORT_SYMBOL(drm_dp_read_mst_cap);
>  int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr,
> bool mst_state)
>  {
>  	int ret = 0;
> -	u8 dpcd_ext = 0;
> -	unsigned int dpcd_offset = 0;
>  	struct drm_dp_mst_branch *mstb = NULL;
>  
>  	mutex_lock(&mgr->payload_lock);
> @@ -3686,17 +3684,11 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> drm_dp_mst_topology_mgr *mgr, bool ms
>  		struct drm_dp_payload reset_pay;
>  
>  		WARN_ON(mgr->mst_primary);
> -		drm_dp_dpcd_read(mgr->aux,
> -				 DP_TRAINING_AUX_RD_INTERVAL,
> -				 &dpcd_ext, sizeof(dpcd_ext));
> -
> -		dpcd_offset =
> -			((dpcd_ext & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT)
> ?  DP_DP13_DPCD_REV : DP_DPCD_REV);


Uh, are you sure you formatted this patch correctly? None of these hunks are present upstream, this looks like it's a diff for the previous version of this patch that you sent out
>  
>  		/* get dpcd info */
> -		ret = drm_dp_dpcd_read(mgr->aux, dpcd_offset, mgr->dpcd,
> DP_RECEIVER_CAP_SIZE);
> -		if (ret != DP_RECEIVER_CAP_SIZE) {
> -			DRM_DEBUG_KMS("failed to read DPCD\n");
> +		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> +		if (ret < 0) {
> +			drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n",
> ret);
>  			goto out_unlock;
>  		}
>  
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
