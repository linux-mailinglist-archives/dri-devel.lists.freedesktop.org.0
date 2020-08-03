Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762623AD70
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 21:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C53A6E2ED;
	Mon,  3 Aug 2020 19:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A4C6E2F2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 19:41:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6FBF780502;
 Mon,  3 Aug 2020 21:41:07 +0200 (CEST)
Date: Mon, 3 Aug 2020 21:41:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] fbdev: Use fallthrough pseudo-keyword
Message-ID: <20200803194024.GA525506@ravnborg.org>
References: <20200707210539.GA12530@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707210539.GA12530@embeddedor>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8
 a=ZkvXaxzpEBCGFCigZb4A:9 a=THN5lsWJXTe09ccl:21 a=JiB3bZhdlf3hca_M:21
 a=CjuIK1q_8ugA:10 a=1F1461vogZIA:10 a=5kKzt1m56AEA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Timur Tabi <timur@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 04:05:39PM -0500, Gustavo A. R. Silva wrote:
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks.

Fixed indent in arcfb.c while applying.
Applied to drm-misc-next and it will appear in 5.10

	Sam

> ---
>  drivers/video/fbdev/acornfb.c                 |  2 +-
>  drivers/video/fbdev/arcfb.c                   |  2 +-
>  drivers/video/fbdev/atmel_lcdfb.c             |  4 ++--
>  drivers/video/fbdev/aty/radeon_pm.c           |  6 +++---
>  drivers/video/fbdev/cirrusfb.c                |  4 ++--
>  drivers/video/fbdev/controlfb.c               |  2 +-
>  drivers/video/fbdev/core/fbmem.c              |  2 +-
>  drivers/video/fbdev/fsl-diu-fb.c              |  4 ++--
>  drivers/video/fbdev/gxt4500.c                 |  2 +-
>  drivers/video/fbdev/i740fb.c                  |  2 +-
>  drivers/video/fbdev/offb.c                    |  4 ++--
>  drivers/video/fbdev/omap/lcdc.c               |  4 ++--
>  drivers/video/fbdev/omap/omapfb_main.c        | 20 +++++++++----------
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c  |  4 ++--
>  .../video/fbdev/omap2/omapfb/omapfb-ioctl.c   |  2 +-
>  .../video/fbdev/omap2/omapfb/omapfb-main.c    |  2 +-
>  drivers/video/fbdev/pm2fb.c                   |  4 ++--
>  drivers/video/fbdev/pxafb.c                   |  2 +-
>  drivers/video/fbdev/s3c-fb.c                  |  6 +++---
>  drivers/video/fbdev/sa1100fb.c                |  2 +-
>  drivers/video/fbdev/savage/savagefb_driver.c  |  3 +--
>  drivers/video/fbdev/sh_mobile_lcdcfb.c        |  4 ++--
>  drivers/video/fbdev/sm501fb.c                 |  2 +-
>  drivers/video/fbdev/tdfxfb.c                  |  2 +-
>  drivers/video/fbdev/xen-fbfront.c             |  2 +-
>  25 files changed, 46 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
> index 09a9ad901dad..bcc92aecf666 100644
> --- a/drivers/video/fbdev/acornfb.c
> +++ b/drivers/video/fbdev/acornfb.c
> @@ -857,7 +857,7 @@ static void acornfb_parse_dram(char *opt)
>  		case 'M':
>  		case 'm':
>  			size *= 1024;
> -			/* Fall through */
> +			fallthrough;
>  		case 'K':
>  		case 'k':
>  			size *= 1024;
> diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> index 6f7838979f0a..ae3d8e8b8d33 100644
> --- a/drivers/video/fbdev/arcfb.c
> +++ b/drivers/video/fbdev/arcfb.c
> @@ -419,7 +419,7 @@ static int arcfb_ioctl(struct fb_info *info,
>  			schedule();
>  			finish_wait(&arcfb_waitq, &wait);
>  		}
> -		/* fall through */
> +			fallthrough;
>  
>  		case FBIO_GETCONTROL2:
>  		{
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 1e252192569a..8c1d47e52b1a 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -508,7 +508,7 @@ static int atmel_lcdfb_check_var(struct fb_var_screeninfo *var,
>  	case 32:
>  		var->transp.offset = 24;
>  		var->transp.length = 8;
> -		/* fall through */
> +		fallthrough;
>  	case 24:
>  		if (pdata->lcd_wiring_mode == ATMEL_LCDC_WIRING_RGB) {
>  			/* RGB:888 mode */
> @@ -633,7 +633,7 @@ static int atmel_lcdfb_set_par(struct fb_info *info)
>  		case 2: value |= ATMEL_LCDC_PIXELSIZE_2; break;
>  		case 4: value |= ATMEL_LCDC_PIXELSIZE_4; break;
>  		case 8: value |= ATMEL_LCDC_PIXELSIZE_8; break;
> -		case 15: /* fall through */
> +		case 15: fallthrough;
>  		case 16: value |= ATMEL_LCDC_PIXELSIZE_16; break;
>  		case 24: value |= ATMEL_LCDC_PIXELSIZE_24; break;
>  		case 32: value |= ATMEL_LCDC_PIXELSIZE_32; break;
> diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/radeon_pm.c
> index 7c4483c7f313..f3d8123d7f36 100644
> --- a/drivers/video/fbdev/aty/radeon_pm.c
> +++ b/drivers/video/fbdev/aty/radeon_pm.c
> @@ -1208,11 +1208,11 @@ static void radeon_pm_enable_dll_m10(struct radeonfb_info *rinfo)
>  	case 1:
>  		if (mc & 0x4)
>  			break;
> -		/* fall through */
> +		fallthrough;
>  	case 2:
>  		dll_sleep_mask |= MDLL_R300_RDCK__MRDCKB_SLEEP;
>  		dll_reset_mask |= MDLL_R300_RDCK__MRDCKB_RESET;
> -		/* fall through */
> +		fallthrough;
>  	case 0:
>  		dll_sleep_mask |= MDLL_R300_RDCK__MRDCKA_SLEEP;
>  		dll_reset_mask |= MDLL_R300_RDCK__MRDCKA_RESET;
> @@ -1221,7 +1221,7 @@ static void radeon_pm_enable_dll_m10(struct radeonfb_info *rinfo)
>  	case 1:
>  		if (!(mc & 0x4))
>  			break;
> -		/* fall through */
> +		fallthrough;
>  	case 2:
>  		dll_sleep_mask |= MDLL_R300_RDCK__MRDCKD_SLEEP;
>  		dll_reset_mask |= MDLL_R300_RDCK__MRDCKD_RESET;
> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
> index 3df64a973194..15a9ee7cd734 100644
> --- a/drivers/video/fbdev/cirrusfb.c
> +++ b/drivers/video/fbdev/cirrusfb.c
> @@ -1476,11 +1476,11 @@ static void init_vgachip(struct fb_info *info)
>  		mdelay(100);
>  		/* mode */
>  		vga_wgfx(cinfo->regbase, CL_GR31, 0x00);
> -		/* fall through */
> +		fallthrough;
>  	case BT_GD5480:
>  		/* from Klaus' NetBSD driver: */
>  		vga_wgfx(cinfo->regbase, CL_GR2F, 0x00);
> -		/* fall through */
> +		fallthrough;
>  	case BT_ALPINE:
>  		/* put blitter into 542x compat */
>  		vga_wgfx(cinfo->regbase, CL_GR33, 0x00);
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
> index 9c4f1be856ec..a88dcb63eeb4 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -713,7 +713,7 @@ static int controlfb_blank(int blank_mode, struct fb_info *info)
>  			break;
>  		case FB_BLANK_POWERDOWN:
>  			ctrl &= ~0x33;
> -			/* fall through */
> +			fallthrough;
>  		case FB_BLANK_NORMAL:
>  			ctrl |= 0x400;
>  			break;
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 30e73ec4ad5c..66f07c391e55 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1310,7 +1310,7 @@ static long fb_compat_ioctl(struct file *file, unsigned int cmd,
>  	case FBIOGET_CON2FBMAP:
>  	case FBIOPUT_CON2FBMAP:
>  		arg = (unsigned long) compat_ptr(arg);
> -		/* fall through */
> +		fallthrough;
>  	case FBIOBLANK:
>  		ret = do_fb_ioctl(info, cmd, arg);
>  		break;
> diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
> index 67ebfe5c9f1d..a547c21c7e92 100644
> --- a/drivers/video/fbdev/fsl-diu-fb.c
> +++ b/drivers/video/fbdev/fsl-diu-fb.c
> @@ -1287,7 +1287,7 @@ static int fsl_diu_ioctl(struct fb_info *info, unsigned int cmd,
>  		dev_warn(info->dev,
>  			 "MFB_SET_PIXFMT value of 0x%08x is deprecated.\n",
>  			 MFB_SET_PIXFMT_OLD);
> -		/* fall through */
> +		fallthrough;
>  	case MFB_SET_PIXFMT:
>  		if (copy_from_user(&pix_fmt, buf, sizeof(pix_fmt)))
>  			return -EFAULT;
> @@ -1297,7 +1297,7 @@ static int fsl_diu_ioctl(struct fb_info *info, unsigned int cmd,
>  		dev_warn(info->dev,
>  			 "MFB_GET_PIXFMT value of 0x%08x is deprecated.\n",
>  			 MFB_GET_PIXFMT_OLD);
> -		/* fall through */
> +		fallthrough;
>  	case MFB_GET_PIXFMT:
>  		pix_fmt = ad->pix_fmt;
>  		if (copy_to_user(buf, &pix_fmt, sizeof(pix_fmt)))
> diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
> index 13ded3a10708..e5475ae1e158 100644
> --- a/drivers/video/fbdev/gxt4500.c
> +++ b/drivers/video/fbdev/gxt4500.c
> @@ -534,7 +534,7 @@ static int gxt4500_setcolreg(unsigned int reg, unsigned int red,
>  			break;
>  		case DFA_PIX_32BIT:
>  			val |= (reg << 24);
> -			/* fall through */
> +			fallthrough;
>  		case DFA_PIX_24BIT:
>  			val |= (reg << 16) | (reg << 8);
>  			break;
> diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
> index c65ec7386e87..e6f35f8feefc 100644
> --- a/drivers/video/fbdev/i740fb.c
> +++ b/drivers/video/fbdev/i740fb.c
> @@ -430,7 +430,7 @@ static int i740fb_decode_var(const struct fb_var_screeninfo *var,
>  		break;
>  	case 9 ... 15:
>  		bpp = 15;
> -		/* fall through */
> +		fallthrough;
>  	case 16:
>  		if ((1000000 / var->pixclock) > DACSPEED16) {
>  			dev_err(info->device, "requested pixclock %i MHz out of range (max. %i MHz at 15/16bpp)\n",
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index 5cd0f5f6a4ae..4501e848a36f 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -141,7 +141,7 @@ static int offb_setcolreg(u_int regno, u_int red, u_int green, u_int blue,
>  		/* Clear PALETTE_ACCESS_CNTL in DAC_CNTL */
>  		out_le32(par->cmap_adr + 0x58,
>  			 in_le32(par->cmap_adr + 0x58) & ~0x20);
> -		/* fall through */
> +		fallthrough;
>  	case cmap_r128:
>  		/* Set palette index & data */
>  		out_8(par->cmap_adr + 0xb0, regno);
> @@ -211,7 +211,7 @@ static int offb_blank(int blank, struct fb_info *info)
>  				/* Clear PALETTE_ACCESS_CNTL in DAC_CNTL */
>  				out_le32(par->cmap_adr + 0x58,
>  					 in_le32(par->cmap_adr + 0x58) & ~0x20);
> -				/* fall through */
> +				fallthrough;
>  			case cmap_r128:
>  				/* Set palette index & data */
>  				out_8(par->cmap_adr + 0xb0, i);
> diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
> index fa73acfc1371..7317c9aad677 100644
> --- a/drivers/video/fbdev/omap/lcdc.c
> +++ b/drivers/video/fbdev/omap/lcdc.c
> @@ -328,13 +328,13 @@ static int omap_lcdc_setup_plane(int plane, int channel_out,
>  			lcdc.bpp = 12;
>  			break;
>  		}
> -		/* fallthrough */
> +		fallthrough;
>  	case OMAPFB_COLOR_YUV422:
>  		if (lcdc.ext_mode) {
>  			lcdc.bpp = 16;
>  			break;
>  		}
> -		/* fallthrough */
> +		fallthrough;
>  	default:
>  		/* FIXME: other BPPs.
>  		 * bpp1: code  0,     size 256
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 0cbcc74fa943..3d090d2d9ed9 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -253,7 +253,7 @@ static int _setcolreg(struct fb_info *info, u_int regno, u_int red, u_int green,
>  		if (fbdev->ctrl->setcolreg)
>  			r = fbdev->ctrl->setcolreg(regno, red, green, blue,
>  							transp, update_hw_pal);
> -		/* Fallthrough */
> +		fallthrough;
>  	case OMAPFB_COLOR_RGB565:
>  	case OMAPFB_COLOR_RGB444:
>  		if (r != 0)
> @@ -443,7 +443,7 @@ static int set_color_mode(struct omapfb_plane_struct *plane,
>  		return 0;
>  	case 12:
>  		var->bits_per_pixel = 16;
> -		/* fall through */
> +		fallthrough;
>  	case 16:
>  		if (plane->fbdev->panel->bpp == 12)
>  			plane->color_mode = OMAPFB_COLOR_RGB444;
> @@ -1531,27 +1531,27 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
>  	case OMAPFB_ACTIVE:
>  		for (i = 0; i < fbdev->mem_desc.region_cnt; i++)
>  			unregister_framebuffer(fbdev->fb_info[i]);
> -		/* fall through */
> +		fallthrough;
>  	case 7:
>  		omapfb_unregister_sysfs(fbdev);
> -		/* fall through */
> +		fallthrough;
>  	case 6:
>  		if (fbdev->panel->disable)
>  			fbdev->panel->disable(fbdev->panel);
> -		/* fall through */
> +		fallthrough;
>  	case 5:
>  		omapfb_set_update_mode(fbdev, OMAPFB_UPDATE_DISABLED);
> -		/* fall through */
> +		fallthrough;
>  	case 4:
>  		planes_cleanup(fbdev);
> -		/* fall through */
> +		fallthrough;
>  	case 3:
>  		ctrl_cleanup(fbdev);
> -		/* fall through */
> +		fallthrough;
>  	case 2:
>  		if (fbdev->panel->cleanup)
>  			fbdev->panel->cleanup(fbdev->panel);
> -		/* fall through */
> +		fallthrough;
>  	case 1:
>  		dev_set_drvdata(fbdev->dev, NULL);
>  		kfree(fbdev);
> @@ -1854,7 +1854,7 @@ static int __init omapfb_setup(char *options)
>  			case 'm':
>  			case 'M':
>  				vram *= 1024;
> -				/* Fall through */
> +				fallthrough;
>  			case 'k':
>  			case 'K':
>  				vram *= 1024;
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> index 3bb951eb29c7..285d33ce1e11 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -1858,7 +1858,7 @@ static void calc_vrfb_rotation_offset(u8 rotation, bool mirror,
>  		if (color_mode == OMAP_DSS_COLOR_YUV2 ||
>  			color_mode == OMAP_DSS_COLOR_UYVY)
>  			width = width >> 1;
> -		/* fall through */
> +		fallthrough;
>  	case OMAP_DSS_ROT_90:
>  	case OMAP_DSS_ROT_270:
>  		*offset1 = 0;
> @@ -1881,7 +1881,7 @@ static void calc_vrfb_rotation_offset(u8 rotation, bool mirror,
>  		if (color_mode == OMAP_DSS_COLOR_YUV2 ||
>  			color_mode == OMAP_DSS_COLOR_UYVY)
>  			width = width >> 1;
> -		/* fall through */
> +		fallthrough;
>  	case OMAP_DSS_ROT_90 + 4:
>  	case OMAP_DSS_ROT_270 + 4:
>  		*offset1 = 0;
> diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
> index f40be68d5aac..ea8c88aa4477 100644
> --- a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
> +++ b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
> @@ -760,7 +760,7 @@ int omapfb_ioctl(struct fb_info *fbi, unsigned int cmd, unsigned long arg)
>  			r = -ENODEV;
>  			break;
>  		}
> -		/* FALLTHROUGH */
> +		fallthrough;
>  
>  	case OMAPFB_WAITFORVSYNC:
>  		DBG("ioctl WAITFORVSYNC\n");
> diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
> index 836e7b1639ce..a3decc7fadde 100644
> --- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
> +++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
> @@ -882,7 +882,7 @@ int omapfb_setup_overlay(struct fb_info *fbi, struct omap_overlay *ovl,
>  				/ (var->bits_per_pixel >> 2);
>  			break;
>  		}
> -		/* fall through */
> +		fallthrough;
>  	default:
>  		screen_width = fix->line_length / (var->bits_per_pixel >> 3);
>  		break;
> diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
> index c7c98d8e2359..0642555289e0 100644
> --- a/drivers/video/fbdev/pm2fb.c
> +++ b/drivers/video/fbdev/pm2fb.c
> @@ -233,10 +233,10 @@ static u32 to3264(u32 timing, int bpp, int is64)
>  	switch (bpp) {
>  	case 24:
>  		timing *= 3;
> -		/* fall through */
> +		fallthrough;
>  	case 8:
>  		timing >>= 1;
> -		/* fall through */
> +		fallthrough;
>  	case 16:
>  		timing >>= 1;
>  	case 32:
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index a53d24fb7183..f1551e00eb12 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -1614,7 +1614,7 @@ static void set_ctrlr_state(struct pxafb_info *fbi, u_int state)
>  		 */
>  		if (old_state != C_DISABLE_PM)
>  			break;
> -		/* fall through */
> +		fallthrough;
>  
>  	case C_ENABLE:
>  		/*
> diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
> index 9dc925054930..ba316bd56efd 100644
> --- a/drivers/video/fbdev/s3c-fb.c
> +++ b/drivers/video/fbdev/s3c-fb.c
> @@ -284,7 +284,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
>  		/* 666 with one bit alpha/transparency */
>  		var->transp.offset	= 18;
>  		var->transp.length	= 1;
> -		/* fall through */
> +		fallthrough;
>  	case 18:
>  		var->bits_per_pixel	= 32;
>  
> @@ -312,7 +312,7 @@ static int s3c_fb_check_var(struct fb_var_screeninfo *var,
>  	case 25:
>  		var->transp.length	= var->bits_per_pixel - 24;
>  		var->transp.offset	= 24;
> -		/* fall through */
> +		fallthrough;
>  	case 24:
>  		/* our 24bpp is unpacked, so 32bpp */
>  		var->bits_per_pixel	= 32;
> @@ -809,7 +809,7 @@ static int s3c_fb_blank(int blank_mode, struct fb_info *info)
>  	case FB_BLANK_POWERDOWN:
>  		wincon &= ~WINCONx_ENWIN;
>  		sfb->enabled &= ~(1 << index);
> -		/* fall through - to FB_BLANK_NORMAL */
> +		fallthrough;	/* to FB_BLANK_NORMAL */
>  
>  	case FB_BLANK_NORMAL:
>  		/* disable the DMA and display 0x0 (black) */
> diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
> index 3e6e13f7a831..a3f0a66b3471 100644
> --- a/drivers/video/fbdev/sa1100fb.c
> +++ b/drivers/video/fbdev/sa1100fb.c
> @@ -935,7 +935,7 @@ static void set_ctrlr_state(struct sa1100fb_info *fbi, u_int state)
>  		 */
>  		if (old_state != C_DISABLE_PM)
>  			break;
> -		/* fall through */
> +		fallthrough;
>  
>  	case C_ENABLE:
>  		/*
> diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
> index 3c8ae87f0ea7..2a0b156019b9 100644
> --- a/drivers/video/fbdev/savage/savagefb_driver.c
> +++ b/drivers/video/fbdev/savage/savagefb_driver.c
> @@ -1859,8 +1859,7 @@ static int savage_init_hw(struct savagefb_par *par)
>  		vga_out8(0x3d4, 0x68, par);	/* memory control 1 */
>  		if ((vga_in8(0x3d5, par) & 0xC0) == (0x01 << 6))
>  			RamSavage4[1] = 8;
> -
> -		/*FALLTHROUGH*/
> +		fallthrough;
>  
>  	case S3_SAVAGE2000:
>  		videoRam = RamSavage4[(config1 & 0xE0) >> 5] * 1024;
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index 8a27d12e6ea8..c1043420dbd3 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1594,7 +1594,7 @@ sh_mobile_lcdc_overlay_fb_init(struct sh_mobile_lcdc_overlay *ovl)
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV21:
>  		info->fix.ypanstep = 2;
> -		/* Fall through */
> +		fallthrough;
>  	case V4L2_PIX_FMT_NV16:
>  	case V4L2_PIX_FMT_NV61:
>  		info->fix.xpanstep = 2;
> @@ -2085,7 +2085,7 @@ sh_mobile_lcdc_channel_fb_init(struct sh_mobile_lcdc_chan *ch,
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV21:
>  		info->fix.ypanstep = 2;
> -		/* Fall through */
> +		fallthrough;
>  	case V4L2_PIX_FMT_NV16:
>  	case V4L2_PIX_FMT_NV61:
>  		info->fix.xpanstep = 2;
> diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
> index 3dd1b1d76e98..6a52eba64559 100644
> --- a/drivers/video/fbdev/sm501fb.c
> +++ b/drivers/video/fbdev/sm501fb.c
> @@ -1005,7 +1005,7 @@ static int sm501fb_blank_crt(int blank_mode, struct fb_info *info)
>  	case FB_BLANK_POWERDOWN:
>  		ctrl &= ~SM501_DC_CRT_CONTROL_ENABLE;
>  		sm501_misc_control(fbi->dev->parent, SM501_MISC_DAC_POWER, 0);
> -		/* fall through */
> +		fallthrough;
>  
>  	case FB_BLANK_NORMAL:
>  		ctrl |= SM501_DC_CRT_CONTROL_BLANK;
> diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
> index f73e26c18c09..f056d80f6359 100644
> --- a/drivers/video/fbdev/tdfxfb.c
> +++ b/drivers/video/fbdev/tdfxfb.c
> @@ -523,7 +523,7 @@ static int tdfxfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>  	case 32:
>  		var->transp.offset = 24;
>  		var->transp.length = 8;
> -		/* fall through */
> +		fallthrough;
>  	case 24:
>  		var->red.offset = 16;
>  		var->green.offset = 8;
> diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
> index 00307b8693bf..5ec51445bee8 100644
> --- a/drivers/video/fbdev/xen-fbfront.c
> +++ b/drivers/video/fbdev/xen-fbfront.c
> @@ -677,7 +677,7 @@ static void xenfb_backend_changed(struct xenbus_device *dev,
>  	case XenbusStateClosed:
>  		if (dev->state == XenbusStateClosed)
>  			break;
> -		/* fall through - Missed the backend's CLOSING state. */
> +		fallthrough;	/* Missed the backend's CLOSING state */
>  	case XenbusStateClosing:
>  		xenbus_frontend_closed(dev);
>  		break;
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
