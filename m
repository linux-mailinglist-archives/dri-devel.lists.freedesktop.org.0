Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B411C2E63
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 19:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BBE6E282;
	Sun,  3 May 2020 17:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996026E282
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 17:40:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D54FB20026;
 Sun,  3 May 2020 19:40:41 +0200 (CEST)
Date: Sun, 3 May 2020 19:40:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] video/fbdev/matroxfb: Remove dead code
Message-ID: <20200503174040.GA27362@ravnborg.org>
References: <1588370291-7746-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588370291-7746-1-git-send-email-jrdr.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=XgyGsw9y4zMyC8-ZD7IA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Souptick

On Sat, May 02, 2020 at 03:28:11AM +0530, Souptick Joarder wrote:
> These are dead code since 3.15. If there is no plan to use it further
> it can be removed forever.
Could you explain why you conclude this is dead code sine 3.15 -
and maybe point to the commit that made it dead.
I failed to look it up.
And I would assume I did not have to look it up, but that you have
provided enough background to evaluate the patch.

Sometimes dead code are kept becasue it documents something etc.
So it is not always a simple removal.

	Sam

> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
> index 765e805..9c2a2c0 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_DAC1064.c
> @@ -603,9 +603,6 @@ static void MGA1064_ramdac_init(struct matrox_fb_info *minfo)
>  /* BIOS environ */
>  static int x7AF4 = 0x10;	/* flags, maybe 0x10 = SDRAM, 0x00 = SGRAM??? */
>  				/* G100 wants 0x10, G200 SGRAM does not care... */
> -#if 0
> -static int def50 = 0;	/* reg50, & 0x0F, & 0x3000 (only 0x0000, 0x1000, 0x2000 (0x3000 disallowed and treated as 0) */
> -#endif
>  
>  static void MGAG100_progPixClock(const struct matrox_fb_info *minfo, int flags,
>  				 int m, int n, int p)
> @@ -843,9 +840,6 @@ static int MGAG100_preinit(struct matrox_fb_info *minfo)
>  	struct matrox_hw_state *hw = &minfo->hw;
>  
>          u_int32_t reg50;
> -#if 0
> -	u_int32_t q;
> -#endif
>  
>  	DBG(__func__)
>  
> @@ -927,11 +921,6 @@ static int MGAG100_preinit(struct matrox_fb_info *minfo)
>  		mga_writeb(minfo->video.vbase, 0x0000, 0xAA);
>  		mga_writeb(minfo->video.vbase, 0x0800, 0x55);
>  		mga_writeb(minfo->video.vbase, 0x4000, 0x55);
> -#if 0
> -		if (mga_readb(minfo->video.vbase, 0x0000) != 0xAA) {
> -			hw->MXoptionReg &= ~0x1000;
> -		}
> -#endif
>  		hw->MXoptionReg |= 0x00078020;
>  	} else if (minfo->devflags.accelerator == FB_ACCEL_MATROX_MGAG200) {
>  		pci_read_config_dword(minfo->pcidev, PCI_OPTION2_REG, &reg50);
> -- 
> 1.9.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
