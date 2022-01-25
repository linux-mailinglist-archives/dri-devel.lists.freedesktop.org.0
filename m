Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3145C49BBEC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 20:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF3A10E44D;
	Tue, 25 Jan 2022 19:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1B510E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 19:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643138291;
 bh=KNDwMDvbSswR1ppYtAJ+MudqgQDJFKKsXvzixCXe6kY=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=QpN9cn02YLd4jPhmTFHn2qc3Ij07Hzc/LnSMrkPk2PnrGyjkbkP2U2nGOT7Hy990t
 jdy+xnonCmS4B3EpPwqJq1J5qwUnu/hE9k8T54B1F6xFnA8bPhTqh/za39e1KGG5zJ
 RQ3hPeAyy8rGI+O1Ke8RRHF510+5y+5wTCX43+Rg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.229]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmKh-1mxEtf3tEX-00KBL1; Tue, 25
 Jan 2022 20:18:10 +0100
Message-ID: <06f83d81-5df2-916a-4ae1-5a6e12b96832@gmx.de>
Date: Tue, 25 Jan 2022 20:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] [RFC] fbcon: Add option to enable legacy hardware
 acceleration
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <YfBLiUMokw6tLq0O@p100>
In-Reply-To: <YfBLiUMokw6tLq0O@p100>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5Tf2IrLdzZAVVNwlxu7tU97IrAAJ9LYU2byC6mGT6519usW2BwE
 VjiCOih7jvyPLKFmShQpuW8paL2WonYVIlvz64AWGpKDme0sKbFfmFaB5TGPg5k59doioWF
 S1PKtaXjauNpSI9WTVtFECmP9Pbnr6OoAFtMtXilJ+eMY1YuMNQfywx0mjBk84ygor9ZcPP
 bwL9petDl9NhEMnNRDoJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:buDMeOxnfCo=:GXxaqO1RPiH7rHpVZSC8DQ
 1cGGEoJgB75WGMWdPilte36/4q7RptHC0SggIcqu+Ug0Wg+tUt4Euu6S62PNzfuG3tXSkl9rw
 TLlJZ96RI1f5D3Wzl8fshMJGNvmBfvR8GVRBb/ZKZ3GkPZssPPiaxxaQIJSWQ3RdwAjvBK3PZ
 Ob5it2OAiKRLxzMaWWaJgPhW9dLcGJWq0N4ttDyZ64E+o4yWDEeY0HXCMqpwi5g5aF0I/GzGY
 +b4lMODpEyET3xW3RtmB+oFiSmtoCDNS1jcnAhet8L4N//IHsGEd/W23aSTlIY+SPw9PkIofx
 ADAWEnAwXqstxWSX3hBgnjmS+GuWmQzrhGKGWMl0EKcsL4w5KFTKIctzLRAlVydu51ZZ6vsgA
 R9wWLzY8c94k0dOLPqVmn28P3pmgEBgjXtfXD2HOMqElt0VsbfQojgn8oAHj3NLyt9ohPZjm3
 GBV+Hhop85C31VVtMAne7U6iVw6sDJR7kizBGVALaOutTiAkhndrdfrL0awZ7EFZpkex89aJA
 QTmXMW5QMMUYSWAx7FfVooXZMP9e5iX4gyLuq/MYfhdleXrT4KB8gSo8jHWHSnb5DZsvqxXHB
 XF8BnKd4gF00B3nby/7Rn73vSHmCKMIRBcqVakBrYYTkTFp7MyrC0sEYXz0P6AsiC/s6mWqXC
 G689Y7TgQ/97gBu0pISSadCgvG0a4RpdFOdH5KBoY2arGtogXqLlxbe0gYni4re40+Kbd0Nyv
 lpRmxPGmyfhIct5cq2LmX9YHI9WwirZytY05k7LBB/SXBLapdNuf6tSZQl7YqpzPaxv/GShjn
 JtOiCj0n+UK0hnPa9t1TeoM9clyv7bz5Sue8mswSzbqjsVnKJ8k1BIwmFw7jclOaTIqavz9FZ
 GBkUw7n0knpC/R+HXuB1sAgFldJEqON3hvYY0X7U6jnp4J6Bu8D7HQ36gy1ZjZvo/B07hupFN
 HpNJdrXcnpX0JkMWVBnC+CH7fGh5KtqBKRqgg0PAs1G+84lcUH9jUbCx2YqNDtHsIL8/BgDJJ
 g+h5z1hc8+I86Jdnaizkg0VQ0zKaP81xjSCErtlv08EivCxipv+ISVrwzkFeYlHai2xG4yc5B
 g6PlZjUUOt7WAA=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/25/22 20:12, Helge Deller wrote:
> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> enable bitblt and fillrect hardware acceleration in the framebuffer
> console. If disabled, such acceleration will not be used, even if it is
> supported by the graphics hardware driver.
>
> If you plan to use DRM as your main graphics output system, you should
> disable this option since it will prevent compiling in code which isn't
> used later on when DRM takes over.
>
> For all other configurations, e.g. if none of your graphic cards support
> DRM (yet), DRM isn't available for your architecture, or you can't be
> sure that the graphic card in the target system will support DRM, you
> most likely want to enable this option.
>
>
> This patch is the first RFC.

I forgot to mention that by using the static fb_scrollmode() function
I expect the compiler to optimize-out all code which seems problematic
from DRM's POV...

Helge

> Independed of this patch I did some timing experiments with a qemu
> virtual machine running a PA-RISC Debian Linux installation with a
> screen resolution of 2048x1024 with 8bpp. In that case qemu emulated the
> graphics hardware bitblt and fillrect acceleration by using the native
> (x86) CPU.
>
> It was a simple testcase which was to run "time dmesg", where the syslog
> had 284 lines. The results showed a huge speedup:
> a) time dmesg (without acceleration):
>    -> 19.0 seconds
> b) time dmesg (with acceleration):
>    ->  2.6 seconds
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconf=
ig
> index 840d9813b0bc..da84d1c21c21 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
>  	help
>  	  Low-level framebuffer-based console driver.
>
> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +	bool "Framebuffer Console hardware acceleration support"
> +	depends on FRAMEBUFFER_CONSOLE
> +	default y if !DRM
> +	default y if !(X86 || ARM)
> +	help
> +	  If you use a system on which DRM is fully supported you usually want=
 to say N,
> +	  otherwise you probably want to enable this option.
> +	  If enabled the framebuffer console will utilize the hardware acceler=
ation
> +	  of your graphics card by using hardware bitblt and fillrect features=
.
> +
>  config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>         bool "Map the console to the primary display device"
>         depends on FRAMEBUFFER_CONSOLE
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index b813985f1403..f7b7d35953e8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1136,11 +1136,13 @@ static void fbcon_init(struct vc_data *vc, int i=
nit)
>
>  	ops->graphics =3D 0;
>
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>  	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
>  	    !(cap & FBINFO_HWACCEL_DISABLED))
>  		p->scrollmode =3D SCROLL_MOVE;
>  	else /* default to something safe */
>  		p->scrollmode =3D SCROLL_REDRAW;
> +#endif
>
>  	/*
>  	 *  ++guenther: console.c:vc_allocate() relies on initializing
> @@ -1705,7 +1707,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsig=
ned int t, unsigned int b,
>  			count =3D vc->vc_rows;
>  		if (logo_shown >=3D 0)
>  			goto redraw_up;
> -		switch (p->scrollmode) {
> +		switch (fb_scrollmode(p)) {
>  		case SCROLL_MOVE:
>  			fbcon_redraw_blit(vc, info, p, t, b - t - count,
>  				     count);
> @@ -1795,7 +1797,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsig=
ned int t, unsigned int b,
>  			count =3D vc->vc_rows;
>  		if (logo_shown >=3D 0)
>  			goto redraw_down;
> -		switch (p->scrollmode) {
> +		switch (fb_scrollmode(p)) {
>  		case SCROLL_MOVE:
>  			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
>  				     -count);
> @@ -1946,12 +1948,12 @@ static void fbcon_bmove_rec(struct vc_data *vc, =
struct fbcon_display *p, int sy,
>  		   height, width);
>  }
>
> -static void updatescrollmode(struct fbcon_display *p,
> +static void updatescrollmode_accel(struct fbcon_display *p,
>  					struct fb_info *info,
>  					struct vc_data *vc)
>  {
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>  	struct fbcon_ops *ops =3D info->fbcon_par;
> -	int fh =3D vc->vc_font.height;
>  	int cap =3D info->flags;
>  	u16 t =3D 0;
>  	int ypan =3D FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> @@ -1972,12 +1974,6 @@ static void updatescrollmode(struct fbcon_display=
 *p,
>  	int fast_imageblit =3D (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
>  		!(cap & FBINFO_HWACCEL_DISABLED);
>
> -	p->vrows =3D vyres/fh;
> -	if (yres > (fh * (vc->vc_rows + 1)))
> -		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
> -	if ((yres % fh) && (vyres % fh < yres % fh))
> -		p->vrows--;
> -
>  	if (good_wrap || good_pan) {
>  		if (reading_fast || fast_copyarea)
>  			p->scrollmode =3D good_wrap ?
> @@ -1991,6 +1987,27 @@ static void updatescrollmode(struct fbcon_display=
 *p,
>  		else
>  			p->scrollmode =3D SCROLL_REDRAW;
>  	}
> +#endif
> +}
> +
> +static void updatescrollmode(struct fbcon_display *p,
> +					struct fb_info *info,
> +					struct vc_data *vc)
> +{
> +	struct fbcon_ops *ops =3D info->fbcon_par;
> +	int fh =3D vc->vc_font.height;
> +	int yres =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> +	int vyres =3D FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> +				   info->var.xres_virtual);
> +
> +	p->vrows =3D vyres/fh;
> +	if (yres > (fh * (vc->vc_rows + 1)))
> +		p->vrows -=3D (yres - (fh * vc->vc_rows)) / fh;
> +	if ((yres % fh) && (vyres % fh < yres % fh))
> +		p->vrows--;
> +
> +	/* update scrollmode in case hardware acceleration is used */
> +	updatescrollmode_accel(p, info, vc);
>  }
>
>  #define PITCH(w) (((w) + 7) >> 3)
> @@ -2148,7 +2165,7 @@ static int fbcon_switch(struct vc_data *vc)
>
>  	updatescrollmode(p, info, vc);
>
> -	switch (p->scrollmode) {
> +	switch (fb_scrollmode(p)) {
>  	case SCROLL_WRAP_MOVE:
>  		scrollback_phys_max =3D p->vrows - vc->vc_rows;
>  		break;
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core=
/fbcon.h
> index 9315b360c898..c5c043f38162 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -29,7 +29,9 @@ struct fbcon_display {
>      /* Filled in by the low-level console driver */
>      const u_char *fontdata;
>      int userfont;                   /* !=3D 0 if fontdata kmalloc()ed *=
/
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>      u_short scrollmode;             /* Scroll Method */
> +#endif
>      u_short inverse;                /* !=3D 0 text black on white as de=
fault */
>      short yscroll;                  /* Hardware scrolling */
>      int vrows;                      /* number of virtual rows */
> @@ -208,6 +210,17 @@ static inline int attr_col_ec(int shift, struct vc_=
data *vc,
>  #define SCROLL_REDRAW	   0x004
>  #define SCROLL_PAN_REDRAW  0x005
>
> +static inline u_short fb_scrollmode(struct fbcon_display *fb)
> +{
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +	return fb->scrollmode;
> +#else
> +	/* hardcoded to SCROLL_REDRAW if acceleration was disabled. */
> +	return SCROLL_REDRAW;
> +#endif
> +}
> +
> +
>  #ifdef CONFIG_FB_TILEBLITTING
>  extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info)=
;
>  #endif
>

