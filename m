Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E432625D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 13:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0DF6E3D3;
	Fri, 26 Feb 2021 12:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F260B89D73
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 12:12:08 +0000 (UTC)
IronPort-SDR: imdEQZs32KQSegwiNKUuL6yEuPQ7UdhQXNQTgLD8JMx2+t9kGHKmJ5VlI/9dgJJ/3eRbupisyj
 6+30Qk27WS5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9906"; a="185912543"
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; d="scan'208";a="185912543"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 04:12:08 -0800
IronPort-SDR: QCKg8pjubAp90lXqeGeoPALpG5qzrqJOgRL0AlLgP82lLZJzn6fJKDI7O11yztOLi9VKo11et/
 UWa6hqZMV76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; d="scan'208";a="404877581"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 26 Feb 2021 04:12:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 Feb 2021 14:12:03 +0200
Date: Fri, 26 Feb 2021 14:12:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] fbdev: atyfb: use LCD management functions for
 PPC_PMAC also
Message-ID: <YDjlkzg7/qnPBIKI@intel.com>
References: <20210226000537.8674-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226000537.8674-1-rdunlap@infradead.org>
X-Patchwork-Hint: comment
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 04:05:37PM -0800, Randy Dunlap wrote:
> Include PPC_PMAC in the configs that use aty_ld_lcd() and
> aty_st_lcd() implementations so that the PM code may work
> correctly for PPC_PMAC.
> =

> Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
> Daniel- We also need this patch:
> https://lore.kernel.org/dri-devel/20210224215528.822-1-rdunlap@infradead.=
org/
> to fix a kernel test robot build error.
> =

>  drivers/video/fbdev/aty/atyfb_base.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> =

> --- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb_base.c
> +++ linux-next-20210219/drivers/video/fbdev/aty/atyfb_base.c
> @@ -132,8 +132,7 @@
>  #define PRINTKI(fmt, args...)	printk(KERN_INFO "atyfb: " fmt, ## args)
>  #define PRINTKE(fmt, args...)	printk(KERN_ERR "atyfb: " fmt, ## args)
>  =

> -#if defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_GENERIC_LCD)=
 || \
> -defined(CONFIG_FB_ATY_BACKLIGHT)
> +#if defined(CONFIG_PPC_PMAC)

Did you send an old version by accident? That's definitely
not what we want since it would break everything except PPC_PMAC.

>  static const u32 lt_lcd_regs[] =3D {
>  	CNFG_PANEL_LG,
>  	LCD_GEN_CNTL_LG,
> @@ -175,8 +174,7 @@ u32 aty_ld_lcd(int index, const struct a
>  		return aty_ld_le32(LCD_DATA, par);
>  	}
>  }
> -#else /* defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_BACKLIG=
HT) \
> -	 defined(CONFIG_FB_ATY_GENERIC_LCD) */
> +#else /* defined(CONFIG_PPC_PMAC) */
>  void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
>  { }
>  =

> @@ -184,7 +182,7 @@ u32 aty_ld_lcd(int index, const struct a
>  {
>  	return 0;
>  }
> -#endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENER=
IC_LCD) */
> +#endif /* defined(CONFIG_PPC_PMAC) */
>  =

>  #ifdef CONFIG_FB_ATY_GENERIC_LCD
>  /*

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
