Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966A324593
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 22:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A30B6E094;
	Wed, 24 Feb 2021 21:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2056E094
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 21:07:16 +0000 (UTC)
IronPort-SDR: NjyJ28uG75GGr51VcTIwB3lGEITufEFj3O/1lw3OlN3+oMuYJwYCeI6hUGZTPAhVrk1PjgM4H2
 40Yn0/o9IeTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="181886697"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="181886697"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 13:07:15 -0800
IronPort-SDR: phezcjYPkAo2Xn3FYEvPijWpsjggQF7R23wbuHGSnno5a7V5UMLnEiAx0TOfX2MaNG4ajQ54GZ
 bogDRwuN8tiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="367135742"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 24 Feb 2021 13:07:11 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Feb 2021 23:07:10 +0200
Date: Wed, 24 Feb 2021 23:07:10 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
Message-ID: <YDa//vfs9J15V7k5@intel.com>
References: <20210222032853.21483-1-rdunlap@infradead.org>
 <YDPtYx1uU5Y4HNZ7@intel.com>
 <7d416971-ae9b-52a8-bfba-79c2c920ec6c@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d416971-ae9b-52a8-bfba-79c2c920ec6c@infradead.org>
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

On Wed, Feb 24, 2021 at 11:59:45AM -0800, Randy Dunlap wrote:
> On 2/22/21 9:44 AM, Ville Syrj=E4l=E4 wrote:
> > On Sun, Feb 21, 2021 at 07:28:53PM -0800, Randy Dunlap wrote:
> >> Fix build errors when these functions are not defined.
> >>
> >> ../drivers/video/fbdev/aty/atyfb_base.c: In function 'aty_power_mgmt':
> >> ../drivers/video/fbdev/aty/atyfb_base.c:2002:7: error: implicit declar=
ation of function 'aty_ld_lcd'; did you mean 'aty_ld_8'? [-Werror=3Dimplici=
t-function-declaration]
> >>  2002 |  pm =3D aty_ld_lcd(POWER_MANAGEMENT, par);
> >> ../drivers/video/fbdev/aty/atyfb_base.c:2004:2: error: implicit declar=
ation of function 'aty_st_lcd'; did you mean 'aty_st_8'? [-Werror=3Dimplici=
t-function-declaration]
> >>  2004 |  aty_st_lcd(POWER_MANAGEMENT, pm, par);
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Cc: linux-fbdev@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> ---
> >>  drivers/video/fbdev/aty/atyfb_base.c |    9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> --- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb_base.c
> >> +++ linux-next-20210219/drivers/video/fbdev/aty/atyfb_base.c
> >> @@ -175,6 +175,15 @@ u32 aty_ld_lcd(int index, const struct a
> >>  		return aty_ld_le32(LCD_DATA, par);
> >>  	}
> >>  }
> >> +#else /* defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_BACK=
LIGHT) \
> >> +	 defined(CONFIG_FB_ATY_GENERIC_LCD) */
> > =

> > A better fix would seem to be to include these functions if
> > CONFIG_PPC_PMAC is enabled. Otherwise the PM code will surely
> > not work correctly. Though I'm not sure if that PPC PM
> > code makes any sense w/o LCD/backlight support anyway.
> =

> Hi Ville,
> =

> I tried this:
> =

> -#if defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_GENERIC_LCD)=
 || \
> -defined(CONFIG_FB_ATY_BACKLIGHT)
> +#if defined(CONFIG_PPC_PMAC)
> =

> in both atyfb_base.c and atyfb.h, but then there is a build error in
> mach64_ct.c when PPC_PMAC is not enabled but FB_ATY_GENERIC_LCD is enable=
d.
> [mach64_ct.c is the only other user of aty_{ld,st}_lcd()]
> =

> or did you mean adding CONFIG_PPC_PMAC to that longish #if list?
> (that's not how I understood your comment.)

Yeah, I meant adding ||PPC_PMAC to the existing set of conditions.
You definitely need to have this stuff for the LCD/backlight
support on !PPC_PMAC as well.

> =

> =

> I'll gladly step away and let you submit patches for this. :)

I don't have any powerbook/etc. hw to test this so couldn't
really add any extra value. Just have vague memories of touching
this stuff long ago so figured I'd provide my "expertise" :)

> =

> >> +void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
> >> +{ }
> >> +
> >> +u32 aty_ld_lcd(int index, const struct atyfb_par *par)
> >> +{
> >> +	return 0;
> >> +}
> >>  #endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GE=
NERIC_LCD) */
> >>  =

> >>  #ifdef CONFIG_FB_ATY_GENERIC_LCD
> >> _______________________________________________
> =

> =

> thanks.
> -- =

> ~Randy

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
