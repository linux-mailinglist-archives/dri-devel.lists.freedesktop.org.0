Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8834465D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5186E499;
	Mon, 22 Mar 2021 13:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980776E499
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:59:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v11so16950228wro.7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aKdbo+Uu7/ENUhR68YhWcl8X+eXVBT0c9mOmmwkHCnM=;
 b=Gj1KfSTiuddoeJH/lBxsJ9EQ+hE8vdALwwP0jUHXIqZijfU4GRCWVEKf5dBdMI35bm
 nivCJhhOxw/eaDu8UI+2szAEnV7uUla9f8wOW74JT7ZqK3cuLcRPwfvklX+AKZp++XAp
 wPnWch7Uk2Ve+Gfh9gfzGt7MSCaex2xttVyss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aKdbo+Uu7/ENUhR68YhWcl8X+eXVBT0c9mOmmwkHCnM=;
 b=cIvsTSCsVisX2K3+PfC7Nd49bj35X9tzL9b8kqowVaxTimL5VRJDiWrrrWS+mG3Q7C
 h9e6lf77Tb3U8pPpBU+S3J8KdgbYCNQpx7EjX9kZs/faT7qQDcqJhbjiUi55tvE2JHdf
 azR/axOv3ixx4ST3GJYbF0vghwfypk5Hu6ckGyncuM4hnDVMFlGLIhHnNSqVSUu5+Fdo
 Uhvpf5prfZzc1RhqhNP2f07vWZys4S/cNH2Eqnm1u1yDLMneXs2PFjRO3Yweb5gH15li
 siQdmrIWZFoFE1nQujem18cpL28Ng0unB1HANUELgieqcEqFwWjKiEVus/IhRpQxaTIg
 5TAQ==
X-Gm-Message-State: AOAM532jJgM1F01+GaY6FGVYFHA1JWZ1WS72LLv++BNKLA2UhvY5OjTU
 bJuvMvW4gnH+n8Qp3+YpGIjXtQ==
X-Google-Smtp-Source: ABdhPJxBJbd4aMVAfgIyjvZ1Cg0G2JhoHy5EF4aIr3EEDV5lFFXSjfEDIl29cpNrk8EoT35qvP8akw==
X-Received: by 2002:adf:e441:: with SMTP id t1mr18441558wrm.21.1616421566393; 
 Mon, 22 Mar 2021 06:59:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v13sm22720694wrt.45.2021.03.22.06.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:59:25 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:59:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/2] vgaarb: avoid -Wempty-body warnings
Message-ID: <YFiivD6B5SZLZl7Z@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-fbdev@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Yue Zou <zouyue3@huawei.com>,
 linux-kernel@vger.kernel.org
References: <20210322105307.1291840-1-arnd@kernel.org>
 <20210322105307.1291840-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322105307.1291840-2-arnd@kernel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Yue Zou <zouyue3@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 11:53:00AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with W=1 shows a few warnings for an empty macro:
> 
> drivers/gpu/drm/qxl/qxl_drv.c: In function 'qxl_pci_probe':
> drivers/gpu/drm/qxl/qxl_drv.c:131:50: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   131 |                 vga_put(pdev, VGA_RSRC_LEGACY_IO);
>       |                                                  ^
> drivers/gpu/drm/qxl/qxl_drv.c: In function 'qxl_pci_remove':
> drivers/gpu/drm/qxl/qxl_drv.c:159:50: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
>   159 |                 vga_put(pdev, VGA_RSRC_LEGACY_IO);
> 
> Change this to an inline function to make it more robust and avoid
> the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Both applied to drm-misc-next for 5.13, thanks for your patches.
-Daniel

> ---
>  include/linux/vgaarb.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index fc6dfeba04a5..dc6ddce92066 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -112,7 +112,9 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
>  #if defined(CONFIG_VGA_ARB)
>  extern void vga_put(struct pci_dev *pdev, unsigned int rsrc);
>  #else
> -#define vga_put(pdev, rsrc)
> +static inline void vga_put(struct pci_dev *pdev, unsigned int rsrc)
> +{
> +}
>  #endif
>  
>  
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
