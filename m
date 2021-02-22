Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA4321CCE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A46F6E575;
	Mon, 22 Feb 2021 16:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF606E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:25:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id v21so1011947wml.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VfspxvK2qmutul/HQI6CP6zvXTYbfiqNuFTl1ngzl9A=;
 b=Sa8IDK+hjxW/KTwxOZ5cq7ouchiX/NM/KOQCL18K15EPiODDMsHZ5XqNTpLH/qkUUW
 KsBasPKkGtF0X/YrvGKLM5qVd4Vaz1rXyh/DiLg9X1/ThY4/yoombEH4PrR4ER87vNGv
 aZ2YA+LXeyVFw8c4Vb+mdPGr0wpAL3bZhh+JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=VfspxvK2qmutul/HQI6CP6zvXTYbfiqNuFTl1ngzl9A=;
 b=S3UjMTOQdK8XmYcCsJWnatqd+dVeVtFQVlcOCeg01yXHHVP12dGwPfiDbCf6htN5zZ
 dN9OjBOlcB6mrlNjVLuNCPHuH8QlXV0k4gkdOnUAtE2PpxCiRA+cokhddgkAtgqTttSf
 vBXkTgXAXXcqwh4HTqg3j1Z/UaK2tzOatjtx5756WRDy/UrbILpqmw4SpaBS7lkgS04E
 tRoE9lVx7Ss6lilp/hubyFR1mvciT7R7pWEbRFZEasqz92x9giV2jQfjVAa34UJL3Ucm
 4SnGxuSn2BUC3V8ooMdW3rMoATILc5rvS7kOTOQv6Ltevuige5B8rFM5976AjFNcie4x
 wGiA==
X-Gm-Message-State: AOAM532pkG9tiEvTCLMXnUqcLxyYyFrKkMOb7oeQsCZ4FBISScKwT33T
 0IGc9/cXr2xDTNnSGQh/KVYShQ==
X-Google-Smtp-Source: ABdhPJyuox2nDrjMuRIMD73wg/ViwXcOZnkt/HhU49o9yGozLgztr5S8eyNLgIrHTwiFvZpcE+bwNQ==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr20217128wma.80.1614011119077; 
 Mon, 22 Feb 2021 08:25:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u6sm31326161wmg.41.2021.02.22.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:25:17 -0800 (PST)
Date: Mon, 22 Feb 2021 17:25:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
Message-ID: <YDPa6zThEuW9Mynu@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20210222032853.21483-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222032853.21483-1-rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 21, 2021 at 07:28:53PM -0800, Randy Dunlap wrote:
> Fix build errors when these functions are not defined.
> 
> ../drivers/video/fbdev/aty/atyfb_base.c: In function 'aty_power_mgmt':
> ../drivers/video/fbdev/aty/atyfb_base.c:2002:7: error: implicit declaration of function 'aty_ld_lcd'; did you mean 'aty_ld_8'? [-Werror=implicit-function-declaration]
>  2002 |  pm = aty_ld_lcd(POWER_MANAGEMENT, par);
> ../drivers/video/fbdev/aty/atyfb_base.c:2004:2: error: implicit declaration of function 'aty_st_lcd'; did you mean 'aty_st_8'? [-Werror=implicit-function-declaration]
>  2004 |  aty_st_lcd(POWER_MANAGEMENT, pm, par);
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>

stuffed into drm-misc-next-fixes for 5.12, thanks for your patch.
-Daniel

> ---
>  drivers/video/fbdev/aty/atyfb_base.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> --- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb_base.c
> +++ linux-next-20210219/drivers/video/fbdev/aty/atyfb_base.c
> @@ -175,6 +175,15 @@ u32 aty_ld_lcd(int index, const struct a
>  		return aty_ld_le32(LCD_DATA, par);
>  	}
>  }
> +#else /* defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_BACKLIGHT) \
> +	 defined(CONFIG_FB_ATY_GENERIC_LCD) */
> +void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
> +{ }
> +
> +u32 aty_ld_lcd(int index, const struct atyfb_par *par)
> +{
> +	return 0;
> +}
>  #endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
>  
>  #ifdef CONFIG_FB_ATY_GENERIC_LCD

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
