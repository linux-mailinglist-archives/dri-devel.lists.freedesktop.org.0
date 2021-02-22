Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD89321E65
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 18:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEA689F08;
	Mon, 22 Feb 2021 17:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEE589FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 17:44:24 +0000 (UTC)
IronPort-SDR: ET3qXwXRFihbB8hXT8cN67liCGp/kESMEyvWyIdBR3pe0aGEqFivc9XNQafySw3em2DOpng9ao
 7LSUbV0ZzK5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="183812599"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="183812599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 09:44:23 -0800
IronPort-SDR: ERgDbyS7rqIZAZc0h//AyX3Ku7nLtBisSAASciYbwNNcDLF0KMtxkdQMFXT34Ugo3gMZyDDjF2
 yRRtgG3l83Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="441454668"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 22 Feb 2021 09:44:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Feb 2021 19:44:03 +0200
Date: Mon, 22 Feb 2021 19:44:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
Message-ID: <YDPtYx1uU5Y4HNZ7@intel.com>
References: <20210222032853.21483-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222032853.21483-1-rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 21, 2021 at 07:28:53PM -0800, Randy Dunlap wrote:
> Fix build errors when these functions are not defined.
> =

> ../drivers/video/fbdev/aty/atyfb_base.c: In function 'aty_power_mgmt':
> ../drivers/video/fbdev/aty/atyfb_base.c:2002:7: error: implicit declarati=
on of function 'aty_ld_lcd'; did you mean 'aty_ld_8'? [-Werror=3Dimplicit-f=
unction-declaration]
>  2002 |  pm =3D aty_ld_lcd(POWER_MANAGEMENT, par);
> ../drivers/video/fbdev/aty/atyfb_base.c:2004:2: error: implicit declarati=
on of function 'aty_st_lcd'; did you mean 'aty_st_8'? [-Werror=3Dimplicit-f=
unction-declaration]
>  2004 |  aty_st_lcd(POWER_MANAGEMENT, pm, par);
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/video/fbdev/aty/atyfb_base.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> =

> --- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb_base.c
> +++ linux-next-20210219/drivers/video/fbdev/aty/atyfb_base.c
> @@ -175,6 +175,15 @@ u32 aty_ld_lcd(int index, const struct a
>  		return aty_ld_le32(LCD_DATA, par);
>  	}
>  }
> +#else /* defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_BACKLIG=
HT) \
> +	 defined(CONFIG_FB_ATY_GENERIC_LCD) */

A better fix would seem to be to include these functions if
CONFIG_PPC_PMAC is enabled. Otherwise the PM code will surely
not work correctly. Though I'm not sure if that PPC PM
code makes any sense w/o LCD/backlight support anyway.

> +void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
> +{ }
> +
> +u32 aty_ld_lcd(int index, const struct atyfb_par *par)
> +{
> +	return 0;
> +}
>  #endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENER=
IC_LCD) */
>  =

>  #ifdef CONFIG_FB_ATY_GENERIC_LCD
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
