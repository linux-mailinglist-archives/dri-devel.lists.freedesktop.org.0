Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B23C2075
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9F06E9DF;
	Fri,  9 Jul 2021 08:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BD66E9DF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 08:07:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q17so10953909wrv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rwDUqJDLNIVBQpGIKksCGIR0p460wa02dXr2uK97Uqk=;
 b=BARaNw++soLYV+k5DXbBNW7bXHlJBeJURfkGl/IC/RpnDmdwoayLOj0SiIYeiy/e3y
 6MbPvVDOxlQp21XaZQ65WqduZwu1avfXXvyO+FSEw7HYifygfTeHylVLXC9Z5+yRuHq9
 wU1GOG48OgyejhEIfn4r/IIOf7DbsXui8D3fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rwDUqJDLNIVBQpGIKksCGIR0p460wa02dXr2uK97Uqk=;
 b=Ow9F5dlsWooDEgguESyB2Y6FqAsZ7/1MdnlzY7O7j+KS/sYCGpccTS1GIK8T5D6ap/
 /FrqyUQgos674NeRs1Cv/P08nq+NlpgVgsTSm9GYiF08HK7WFmST2pC1p1JDrv+q6zSw
 kadnx8EYq0fNuRDCOgJdkJKKILyKFVyIjypaplRm7NHuTDlM/p0USORJRSwuC8f4ECwC
 D0Xg6QqlIjXD6UHnMq/OdW/fCE2nDr1ToZC4zL8ZQgWArjd6AbujHLbW2aa7uXvbd72D
 clhtLowsMN4GIOlba5OoZds/uRQBink7Z+QU0vdNM7KR/Z4Q56PZ+BWGpRKYdaeloZPL
 HE4Q==
X-Gm-Message-State: AOAM532FVU/wjhf8Hxrwz0ufcAPS13UBUWGO/t5SBnacNbCyzsxrwb8i
 qTYgNgsyst827tPAyBn78ke1lA==
X-Google-Smtp-Source: ABdhPJzl3oNBQtHbVIKWoBzYJt7iZ9nBuhE//4CcOHYu9qovTilEv9yHlUHnR8rt4o89nyDHC11nxg==
X-Received: by 2002:a05:6000:180f:: with SMTP id
 m15mr39878099wrh.388.1625818023327; 
 Fri, 09 Jul 2021 01:07:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h21sm4054327wmq.38.2021.07.09.01.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 01:07:02 -0700 (PDT)
Date: Fri, 9 Jul 2021 10:07:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Harshvardhan Jha <harshvardhan.jha@oracle.com>
Subject: Re: [PATCH] drm/gma500: Fix end of loop tests for list_for_each_entry
Message-ID: <YOgDpQKxRfNxqhLm@phenom.ffwll.local>
Mail-Followup-To: Harshvardhan Jha <harshvardhan.jha@oracle.com>,
 patrik.r.jakobsson@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dan.carpenter@oracle.com
References: <20210709073959.11443-1-harshvardhan.jha@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709073959.11443-1-harshvardhan.jha@oracle.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 01:09:59PM +0530, Harshvardhan Jha wrote:
> The list_for_each_entry() iterator, "connector" in this code, can never be
> NULL.  If we exit the loop without finding the correct  connector then
> "connector" points invalid memory that is an offset from the list head.
> This will eventually lead to memory corruption and presumably a kernel
> crash.
> 
> Fixes: 9bd81acdb648 ("gma500: Convert Oaktrail to work with new output handling")
> Signed-off-by: Harshvardhan Jha <harshvardhan.jha@oracle.com>
>  ---

The space here before the --- tripped the tooling, but I caught it :-)

Thanks for the patch, applied to drm-misc-next for 5.15.
-Daniel

> From static analysis.  Not tested.
> ---
>  drivers/gpu/drm/gma500/oaktrail_lvds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> index 432bdcc57ac9..a1332878857b 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> @@ -117,7 +117,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
>  			continue;
>  	}
>  
> -	if (!connector) {
> +	if (list_entry_is_head(connector, &mode_config->connector_list, head)) {
>  		DRM_ERROR("Couldn't find connector when setting mode");
>  		gma_power_end(dev);
>  		return;
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
