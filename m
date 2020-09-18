Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F64126FCBE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA876E154;
	Fri, 18 Sep 2020 12:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93C6E154
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:42:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x14so5464772wrl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=SOcYopzpVA91Ur8JOndAUuW5kC5KQpU+aqaU8ciX7/I=;
 b=XJthRxMj7p5FVQ8UB8QHPjpkyrZ1DYRAiW2zVjRAhJUW0e0QzTxX9S0LywyZSJEGAX
 oQ6rcMf41/DYJXO67/Xq8aoMk84qRFYHTNdeA/7L9sScQbt/SEfZaJSlI5KxMxxR+CIT
 M/6Aec09cMTtIOtfSD5s3TkOo40GHFODxElv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=SOcYopzpVA91Ur8JOndAUuW5kC5KQpU+aqaU8ciX7/I=;
 b=AJTYhS5eybRvudFnKcNREyk0uByXP8IPkCrcE/8NYaF1Bzqr2e6SXvQLMcDw05WEBS
 u01Jivdx2ErRzRw2N+s2CJ8GrxcvYIZTsJWbeiZDYq4656RjucBd8VvYfpr2ShASbfk5
 I7EXxiErW/gAIO8DsZ8fl2JF459CpjKIoQAAXGjDMMo/YulHkF5pgoxE/SrgSSpBl3+s
 lnuwx+yvGtsGnD0BwXYmU5Y7r3YIb3CoTSUjOCaI73QEofk6rQmk/yMnLIg5f121osKx
 ShZ18s4FRZamLNeywSUqAnvywJyDWvrrfGt5bmoy5RqBbwWIBm274KsFws6M5QvWoY2z
 p9gg==
X-Gm-Message-State: AOAM530F266RTra89FvrIlhs62oM+ilcezuaweR7cvGRZDrn5c9/GmQ5
 Ft0xHJqf51h6cpahjIhxSX3Q3w==
X-Google-Smtp-Source: ABdhPJzrTC3CW6AB1dTSGBrjqUS3H6j44ck9bWQgvGGmKSFb26qrBxqU+OHgoRbREA252KDgVlNEww==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr41100529wrs.153.1600432926218; 
 Fri, 18 Sep 2020 05:42:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d2sm5156057wro.34.2020.09.18.05.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:42:05 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:42:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v1] fbdev: aty: remove CONFIG_PM container
Message-ID: <20200918124203.GY438822@phenom.ffwll.local>
Mail-Followup-To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Mackerras <paulus@samba.org>,
 Russell King <linux@armlinux.org.uk>,
 Andres Salomon <dilinger@queued.net>,
 Antonino Daplas <adaplas@gmail.com>, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
References: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917115313.725622-1-vaibhavgupta40@gmail.com>
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
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bjorn@helgaas.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andres Salomon <dilinger@queued.net>, Bjorn Helgaas <bhelgaas@google.com>,
 Paul Mackerras <paulus@samba.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-geode@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 05:23:14PM +0530, Vaibhav Gupta wrote:
> The changes made in below mentioned commit removed CONFIG_PM containers
> from drivers/video/fbdev/aty/atyfb_base.c but not from
> drivers/video/fbdev/aty/atyfb.h for respective callbacks.
> 
> This resulted in error for implicit declaration for those callbacks.
> 
> Fixes: 348b2956d5e6 ("fbdev: aty: use generic power management")
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

Applied, thanks.
-Daniel

> ---
>  drivers/video/fbdev/aty/atyfb.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/atyfb.h b/drivers/video/fbdev/aty/atyfb.h
> index a7833bc98225..551372f9b9aa 100644
> --- a/drivers/video/fbdev/aty/atyfb.h
> +++ b/drivers/video/fbdev/aty/atyfb.h
> @@ -287,8 +287,8 @@ static inline void aty_st_8(int regindex, u8 val, const struct atyfb_par *par)
>  #endif
>  }
>  
> -#if defined(CONFIG_PM) || defined(CONFIG_PMAC_BACKLIGHT) || \
> -defined (CONFIG_FB_ATY_GENERIC_LCD) || defined (CONFIG_FB_ATY_BACKLIGHT)
> +#if defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) || \
> +defined (CONFIG_FB_ATY_BACKLIGHT)
>  extern void aty_st_lcd(int index, u32 val, const struct atyfb_par *par);
>  extern u32 aty_ld_lcd(int index, const struct atyfb_par *par);
>  #endif
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
