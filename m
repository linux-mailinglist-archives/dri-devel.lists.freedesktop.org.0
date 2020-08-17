Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F10246968
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 17:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6276E0F2;
	Mon, 17 Aug 2020 15:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F156E123
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 15:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597677695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cbeb0PuYX/kgT1cVNgWIip3Mn2nin0XvTMat1DoR7XA=;
 b=QAD0bGb+xsUrzMFDNrdJR64savR7AziYPAVMMJhwHW1xOqYElxwzIVk2q5htDhMiq+0mlL
 sk87HkK7lf3f+PSExVJdOscQcwhcoO2IBjJHvcpzzC2tx7pcGMc7n1Mgl2g7GZNFw99meB
 QQbwBVzVnigM4TVwe2VyfPSBrP/lSB4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-tq9ufaT2MDK5Bt38Ym2K-g-1; Mon, 17 Aug 2020 11:21:34 -0400
X-MC-Unique: tq9ufaT2MDK5Bt38Ym2K-g-1
Received: by mail-qt1-f197.google.com with SMTP id d24so12227287qtg.23
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Cbeb0PuYX/kgT1cVNgWIip3Mn2nin0XvTMat1DoR7XA=;
 b=bQplIf9jGqeZGJi/1wzWCttgSzDia5bDpswT6hkL8ddVCdJugAfVL9r4BEI4/OUnXO
 hIL3bkvOdSlKrIREyI9fxsA5y/LL0D1zoVlV9WATkJi1FnFnSO1HAV9XgtxVAl0UMJbX
 RiNQe+S2BPbrdtXU3a1UrpJWWu7Pod1nomAs4FkT4sqCej9sHzReMGviWowMYjDQnYzO
 dAqOxzrWBkx0/Lovza0CRE2DJE4Pg/OHZSjojnP5y0cW9EfRytm0Ov81s8Kq6tUYdg7a
 VLFAw7LcrYw6mRzLuXhJpc2+iKTm+iimagkRQxI8fLImQT3riCXmCCRaL8UPgqVXTxuC
 n5/Q==
X-Gm-Message-State: AOAM530Nz8g3NRYdIEfisR/lCm65fO/InPn/x9+smO+DtvlaYvT6zxwX
 LStUgvSe+RsHTM9XNa8o1AWDW144yo3KvDLfRuYQv9B+uKjzD0OozBkLF3I6STjpatZ9XDEGbG9
 DgWkrhKToHUnLsxbDJBk1qBePNTb/
X-Received: by 2002:ac8:4d51:: with SMTP id x17mr13555231qtv.73.1597677693415; 
 Mon, 17 Aug 2020 08:21:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1MKv4bXK88vqodhezur1r/o2c/gfdRpVruisZy+AE42hO8GED1MCnwbKax2pqifcc17HPhg==
X-Received: by 2002:ac8:4d51:: with SMTP id x17mr13555210qtv.73.1597677693190; 
 Mon, 17 Aug 2020 08:21:33 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k24sm20347974qtb.26.2020.08.17.08.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 08:21:32 -0700 (PDT)
Message-ID: <ab808ea5782ea14c7d521d2869c211b925bbcb5a.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Don't return error code when crtc is null
From: Lyude Paul <lyude@redhat.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, mikita.lipski@amd.com, 
 nicholas.kazlauskas@amd.com, alexander.deucher@amd.com
Date: Mon, 17 Aug 2020 11:21:30 -0400
In-Reply-To: <20200814170140.24917-1-Bhawanpreet.Lakha@amd.com>
References: <20200814170140.24917-1-Bhawanpreet.Lakha@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.003
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will go ahead and push this to drm-misc-fixes, thanks!

On Fri, 2020-08-14 at 13:01 -0400, Bhawanpreet Lakha wrote:
> [Why]
> In certain cases the crtc can be NULL and returning -EINVAL causes
> atomic check to fail when it shouln't. This leads to valid
> configurations failing because atomic check fails.
> 
> [How]
> Don't early return if crtc is null
> 
> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 70c4b7afed12..bc90a1485699 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct
> drm_atomic_state *state, struct drm
>  
>  		crtc = conn_state->crtc;
>  
> -		if (WARN_ON(!crtc))
> -			return -EINVAL;
> +		if (!crtc)
> +			continue;
>  
>  		if (!drm_dp_mst_dsc_aux_for_port(pos->port))
>  			continue;
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
