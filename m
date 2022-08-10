Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651F58F080
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA23514A8E8;
	Wed, 10 Aug 2022 16:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC0714A351
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:35:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s23so895699wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=1cla1xyDwjQB+CX1SELtGOrg/piBhlSUweWwsAhsGgY=;
 b=de7mT+7rFA3TWZ5tUKV3uwK6CY/X3AilLNUIMKhTDjKE5zW6HB8OY5u9F0aJmvUfcG
 QHK8fJMvh8+6Yh9px7jB+f9j4gxcdGAzKyshOMx30f3+dDxWgAwh765aEfDLvWVGOR4W
 IR2xl1ILzP587Kz5rTBT53i7qVHxHEt2BCfbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=1cla1xyDwjQB+CX1SELtGOrg/piBhlSUweWwsAhsGgY=;
 b=eTfWiknk2BEVqaNRggzQ9sn4cId3G/pEkhRvyCv7Njx6o9qDT3ebe9eW0UIKAuquDx
 5oPviui5D3ZABXtfOL3SYw0WKZU6sWm3mrkQZXpVvf50xghZ0XZ300rPqX/Fjg03Bo8R
 Ro9Jd9CXo51F7TY2bkDtORw+n8fD9T+lVfw9kXGVfXlPXu+iTkmhPXcXlnoxmSGHbdzp
 EZD9OOtY1xEaUF5qErwVIWpL3QyzmWNncpmT8Sosy8TkhsBqv1/ZA0KhE6CHQAFi7ep0
 /+Z0Lj8Yfdd2PjfKpaGFNk53Q/m4TO5qO6RbdYxBWcLZbvwPxyWOR1eNernPrmOGyw68
 6Wvw==
X-Gm-Message-State: ACgBeo2ut8deVkeinA6h7EcP37CGoqxntxo02I/47yt8L8e6TUtS7nfc
 ExOmBAFDH7Of5CYLDbCl9jLmoEVGvHTuC+9H
X-Google-Smtp-Source: AA6agR4yURnTJpN0pehETheF1LLjd/DkLS661ClVjS2D6aXLlzIC5Vw9++k9Hw2u/NHHb9+XqmdjtA==
X-Received: by 2002:a05:600c:501e:b0:3a3:4a04:fdb5 with SMTP id
 n30-20020a05600c501e00b003a34a04fdb5mr3145156wmr.168.1660149304105; 
 Wed, 10 Aug 2022 09:35:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o36-20020a05600c512400b003a5317f07b4sm3229088wms.37.2022.08.10.09.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:35:03 -0700 (PDT)
Date: Wed, 10 Aug 2022 18:35:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH] drm:pl111: Add of_node_put() when breaking out of
 for_each_available_child_of_node()
Message-ID: <YvPeNbHCV29oHNtw@phenom.ffwll.local>
References: <20220711131550.361350-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711131550.361350-1-windhl@126.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 09:15:50PM +0800, Liang He wrote:
> The reference 'child' in the iteration of for_each_available_child_of_node()
> is only escaped out into a local variable which is only used to check
> its value. So we still need to the of_node_put() when breaking of the
> for_each_available_child_of_node() which will automatically increase
> and decrease the refcount.
> 
> Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")
> Signed-off-by: Liang He <windhl@126.com>
> ---
> 
> As 'Check-after-Put' has been widely accepted in kernel source, we just
> use it. If the maintainer thinks it is harmful, I'd like also to use
> 'Check-and-Put' coding style but with a bit more work.
> 
>  drivers/gpu/drm/pl111/pl111_versatile.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index bdd883f4f0da..963a5d5e6987 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -402,6 +402,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
>  		if (of_device_is_compatible(child, "arm,pl111")) {
>  			has_coretile_clcd = true;
>  			ct_clcd = child;
> +			of_node_put(child);

The same issue seems to exist right below in the next break? Can you pls
respin with that included?

Thanks, Daniel

>  			break;
>  		}
>  		if (of_device_is_compatible(child, "arm,hdlcd")) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
