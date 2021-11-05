Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0B446206
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 11:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5041A6E106;
	Fri,  5 Nov 2021 10:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C076E106
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 10:15:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o29so2807409wms.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 03:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=akaiHjz6SwOCinQKu7wYHJykKjoOoFfBHbnijPyU0Ok=;
 b=bbyD9Z74N8UQc466GhZUx0314i/bxpZDkMZBSU2fESZ/OjZLFayjfO/9njpxD5Ss2U
 qNNUtf2eHZQ98+1gndAE/MzUGWRKyOcBin5hkvCiiBxq6kbMDsnxBAYqI2vgzj19aEfc
 QPXaYaTrqMQBReJcg4zOuuwJ6MFzAyXXVgCP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=akaiHjz6SwOCinQKu7wYHJykKjoOoFfBHbnijPyU0Ok=;
 b=xXoj2tNx9F32DOHGSlR4ZmDKGkYmFjohPaayYHb0+JAoyDY58kNa42MjV00rq1T7Kk
 aA33F68Em4aypr7PLQCVfVbm8LY2A4roQQbNYE1MZnrPA15kBeDLGN+7ChMUYtwgWTWl
 tf/YLYnN5lut+wdbk7I91RhWJsMp4DtEJfRUReCqbvVm2dbdDl6x2MzfVNdyeu+mE9gi
 vm2UPVO2MpFKIXqAk5La2C8fclUKvPZ77Xxe6EthOILBMxM0xoREAo48PDT6iL8B5mzY
 yKSCADAYJqEVN+RnlV4hcXfazuVOJ7KUI/MiIxCXCYfcyVJ4iCBid5Q/TRAqqmxK3eQ4
 KC+g==
X-Gm-Message-State: AOAM5303EWWP+9iMVyUFQnS3YiDtR4plybmKFxKFifDEVBFZM6tiRSMA
 qx3xSWfz/rRjEBJfI3nHI/6d5A==
X-Google-Smtp-Source: ABdhPJzWZ+STVhFoSz5QDe5L//xfNM8RZCNfYYtobwvhw8AXTMjQyzLb3D3WSUyjVEtEdaRStFL/+w==
X-Received: by 2002:a05:600c:40b:: with SMTP id
 q11mr28640624wmb.185.1636107343470; 
 Fri, 05 Nov 2021 03:15:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w15sm7575820wrk.77.2021.11.05.03.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 03:15:43 -0700 (PDT)
Date: Fri, 5 Nov 2021 11:15:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] drm/udl: fix control-message timeout
Message-ID: <YYUETYSj7tMnO7fI@phenom.ffwll.local>
Mail-Followup-To: Johan Hovold <johan@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20211025115353.5089-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025115353.5089-1-johan@kernel.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 25, 2021 at 01:53:53PM +0200, Johan Hovold wrote:
> USB control-message timeouts are specified in milliseconds and should
> specifically not vary with CONFIG_HZ.
> 
> Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
> Cc: stable@vger.kernel.org      # 3.4
> Signed-off-by: Johan Hovold <johan@kernel.org>

Thanks for patch, queued up for the merge window.
-Daniel

> ---
>  drivers/gpu/drm/udl/udl_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index 3750fd216131..930574ad2bca 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -30,7 +30,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
>  		int bval = (i + block * EDID_LENGTH) << 8;
>  		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  				      0x02, (0x80 | (0x02 << 5)), bval,
> -				      0xA1, read_buff, 2, HZ);
> +				      0xA1, read_buff, 2, 1000);
>  		if (ret < 1) {
>  			DRM_ERROR("Read EDID byte %d failed err %x\n", i, ret);
>  			kfree(read_buff);
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
