Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEEE1F57E3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 17:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D26B6E7D1;
	Wed, 10 Jun 2020 15:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7D76E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 15:32:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q11so2786090wrp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=L/g86dBUZKjl5KTVUeFxtA/4wg+xhUm8BJGegAmb5Js=;
 b=juAtCCLziMVmylfyjAk8fr0gNLiH3XWI7z40EkMsjyFvbdVai3ORIxsV2BFJijThoJ
 1g7J023Qy8yQiVLtgS9ojBkn15n0fmjlb4w84EY98IztkprceRsEhhi3/gABkwjyLLAa
 XkrYRg0eOwmbNcES1JGPnazCavOWfb/35HXsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=L/g86dBUZKjl5KTVUeFxtA/4wg+xhUm8BJGegAmb5Js=;
 b=Qp+XZZ1iYZItDmdaUhaIyh1pEkG8oLNiZ52+uOl70vPpqHryfBdWPXyG42+n8rZ//f
 +HVL8y+A9l9C1uXeWWhimqaKWc6SWtUYn6g9b2UcAivBmVoWaZRWDHV6yHxt6XZDjHk8
 Rg+1Tj4+x+aac2wF/nQvDwq1I9EDLSlbcJCwvMdQDu44ujtLkmXQCmu62+lYWGjumB2E
 RutD4vxibGZNTi0QpUB0YrTJhjtphf1JeubjCaNmS7HUCkvBIwuYazGBD67Un7BpyJdP
 d3Lachc9YiSeB2vvctHEgkZlO+9EIwpWWWiMm+K3m5tRJWZeuyK0Jr3neN1UmNEJCqeA
 etFQ==
X-Gm-Message-State: AOAM5311I3aVn992h1G7k9BEd1azIBdjfMhybWeV2rVWsMWILWIh9UyR
 F9wXnqVeZMqb9Ej6AsTIpB/4Ng==
X-Google-Smtp-Source: ABdhPJyDyoyk9tr3zTqwPfbRN2CNQ0mYPBBQU8gPh438yGWw6/DWZOjH0T/7JDpZdKCb0c9Mz+oYLw==
X-Received: by 2002:adf:8b0c:: with SMTP id n12mr4705954wra.340.1591803133698; 
 Wed, 10 Jun 2020 08:32:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a1sm101094wmd.28.2020.06.10.08.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 08:32:12 -0700 (PDT)
Date: Wed, 10 Jun 2020 17:32:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 08/17] drivers: gpu: drm: Fix trivial spelling
Message-ID: <20200610153210.GA20149@phenom.ffwll.local>
Mail-Followup-To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jiri Kosina <trivial@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
 <20200609124610.3445662-9-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609124610.3445662-9-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jiri Kosina <trivial@kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 01:46:01PM +0100, Kieran Bingham wrote:
> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Queued for 5.9, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>  include/drm/drm_dp_helper.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 19c99dddcb99..8f1b329df16d 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1365,7 +1365,7 @@ EXPORT_SYMBOL(drm_dp_get_edid_quirks);
>  /**
>   * drm_dp_read_desc - read sink/branch descriptor from DPCD
>   * @aux: DisplayPort AUX channel
> - * @desc: Device decriptor to fill from DPCD
> + * @desc: Device descriptor to fill from DPCD
>   * @is_branch: true for branch devices, false for sink devices
>   *
>   * Read DPCD 0x400 (sink) or 0x500 (branch) into @desc. Also debug log the
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 2035ac44afde..1165ec105638 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1701,7 +1701,7 @@ enum drm_dp_quirk {
>  
>  /**
>   * drm_dp_has_quirk() - does the DP device have a specific quirk
> - * @desc: Device decriptor filled by drm_dp_read_desc()
> + * @desc: Device descriptor filled by drm_dp_read_desc()
>   * @edid_quirks: Optional quirk bitmask filled by drm_dp_get_edid_quirks()
>   * @quirk: Quirk to query for
>   *
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
