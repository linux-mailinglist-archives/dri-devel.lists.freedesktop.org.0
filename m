Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CTtLMeMh2nMZgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:04:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07630106EAE
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C8910E1B4;
	Sat,  7 Feb 2026 19:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="SPsPLCN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E3110E1B4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 19:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1770491063; x=1771095863; i=deller@gmx.de;
 bh=MEW17f7k6el5lYgHWDTQ3Cz+DNeEvnwLtJK8Aj+58Uw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=SPsPLCN8BCneHeay+19wNSK1biTJRmhixJG8VoPas+lxu42N3PIm4H9FP2FWLF8t
 ULISTJGadshpxrS+T2OEJXHV37Zrgr9TBSPoF87CvutpCfmf4IeOhcmeoDlqdqz5V
 lmIP/7pFtYhMY+bT2Inus9jM83BkIhBQW7JpCO9zLICAYaY//kLTubyjHL2IrM8K2
 uASJye1O4bl5tKxh+BT/chLZEuehSy3kiHtTT4+OheZv7d0r5ixRjkYcKOp3kJkSW
 kFKtgyc/RcUsRLmM1b7+F0jp0INFl3WSlgHdeFGjcxJs1zyfXxPkaCtPWGKjo059N
 ntHZlhcu7n4mvU8lyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.215]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1vLWWb2UXq-00mvRK; Sat, 07
 Feb 2026 20:04:23 +0100
Message-ID: <7334e2a2-d71f-404c-b2b0-170a7117c0c5@gmx.de>
Date: Sat, 7 Feb 2026 20:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] fbdev: au1100fb: Don't store device specific data
 in global variables
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
 <0e1ecdde447dc32816f1f066812ec8e84b4aad0a.1770483674.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <0e1ecdde447dc32816f1f066812ec8e84b4aad0a.1770483674.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fpc4pozD5TX8ilpPK10U8fw4FyCizbg2Aozo2/tK9ebmD1aBoL+
 nolXYnGI1Jxh5Gvda9Bjv1zlbsWn7as5xLRuWJhD3n7r4495mbse7cjiet1kNB4QeY0C/sa
 bJLpoD6iWcaW1wyfRF/Z0Ux1ETG0YZUa+ViW4jBL3VO7GFig07/lOr16JGFO6XJTkfkVYdZ
 zl7xI2fzNbLMEA+0CdIkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7WWbs6dhR4w=;3lQoLwRSjcYEhSnwEILPXmza7b5
 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
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 07630106EAE
X-Rspamd-Action: no action

Hi Uwe,

On 2/7/26 18:12, Uwe Kleine-K=C3=B6nig wrote:
> Using global data to store device specific data is a bad pattern that
> breaks if there is more than one device. So expand driver data and drop
> the global variables.
>=20
> While there is probably no machine that has two or more au1100fb
> devices, this makes the driver a better template for new drivers and
> saves some memory if there is no such bound device.
>=20
> bloat-o-meter reports (for ARCH=3Darm allmodconfig + CONFIG_FB_AU1100=3D=
y
> and ignoring the rename of the init function):
>=20
> 	add/remove: 1/4 grow/shrink: 2/2 up/down: 1360/-4800 (-3440)
> 	Function                                     old     new   delta
> 	au1100fb_drv_probe                          2648    3328    +680
> 	$a                                         12808   13484    +676
> 	au1100fb_drv_resume                          404     400      -4
> 	au1100fb_fix                                  68       -     -68
> 	au1100fb_var                                 160       -    -160
> 	fbregs                                      2048       -   -2048
> 	$d                                          9525    7009   -2516
> 	Total: Before=3D38664, After=3D35224, chg -8.90%
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> I think this doesn't need a Fixes line, but if you want, it would be:
>=20
> 	Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> 	Fixes: f77f50ca1a23 ("[PATCH] au1100fb: add power management support")
> ---
>   drivers/video/fbdev/au1100fb.c | 63 ++++++++++++++++------------------
>   drivers/video/fbdev/au1100fb.h |  5 +++
>   2 files changed, 34 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100=
fb.c
> index feaa1061c436..75344ee080f3 100644
> --- a/drivers/video/fbdev/au1100fb.c
> +++ b/drivers/video/fbdev/au1100fb.c
> @@ -84,21 +84,6 @@ struct fb_bitfield rgb_bitfields[][4] =3D
>   	{ { 8, 4, 0 },  { 4, 4, 0 }, { 0, 4, 0 }, { 0, 0, 0 } },
>   };
>  =20
> -static struct fb_fix_screeninfo au1100fb_fix =3D {
> -	.id		=3D "AU1100 FB",
> -	.xpanstep 	=3D 1,
> -	.ypanstep 	=3D 1,
> -	.type		=3D FB_TYPE_PACKED_PIXELS,
> -	.accel		=3D FB_ACCEL_NONE,
> -};
> -
> -static struct fb_var_screeninfo au1100fb_var =3D {
> -	.activate	=3D FB_ACTIVATE_NOW,
> -	.height		=3D -1,
> -	.width		=3D -1,
> -	.vmode		=3D FB_VMODE_NONINTERLACED,
> -};
> -
>   /* fb_blank
>    * Blank the screen. Depending on the mode, the screen will be
>    * activated with the backlight color, or desactivated
> @@ -432,19 +417,26 @@ static int au1100fb_drv_probe(struct platform_devi=
ce *dev)
>   		return -EFAULT;
>   	}
>  =20
> -	au1100fb_fix.mmio_start =3D regs_res->start;
> -	au1100fb_fix.mmio_len =3D resource_size(regs_res);
> +	fbdev->info.fix =3D (struct fb_fix_screeninfo) {
> +		.mmio_start =3D regs_res->start,
> +		.mmio_len =3D resource_size(regs_res),
> +		.id =3D "AU1100 FB",
> +		.xpanstep =3D 1,
> +		.ypanstep =3D 1,
> +		.type =3D FB_TYPE_PACKED_PIXELS,
> +		.accel =3D FB_ACCEL_NONE,
> +	};
>  =20
>   	if (!devm_request_mem_region(&dev->dev,
> -				     au1100fb_fix.mmio_start,
> -				     au1100fb_fix.mmio_len,
> +				     fbdev->info.fix.mmio_start,
> +				     fbdev->info.fix.mmio_len,
>   				     DRIVER_NAME)) {
>   		print_err("fail to lock memory region at 0x%08lx",
> -				au1100fb_fix.mmio_start);
> +			  fbdev->info.fix.mmio_start);
>   		return -EBUSY;
>   	}
>  =20
> -	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(au1100fb_fix.mmio_sta=
rt);
> +	fbdev->regs =3D (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_=
start);
>  =20
>   	print_dbg("Register memory map at %p", fbdev->regs);
>   	print_dbg("phys=3D0x%08x, size=3D%d", fbdev->regs_phys, fbdev->regs_l=
en);
> @@ -469,22 +461,27 @@ static int au1100fb_drv_probe(struct platform_devi=
ce *dev)
>   		return -ENOMEM;
>   	}
>  =20
> -	au1100fb_fix.smem_start =3D fbdev->fb_phys;
> -	au1100fb_fix.smem_len =3D fbdev->fb_len;
> +	fbdev->info.fix.smem_start =3D fbdev->fb_phys;
> +	fbdev->info.fix.smem_len =3D fbdev->fb_len;
>  =20
>   	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
>   	print_dbg("phys=3D0x%08x, size=3D%dK", fbdev->fb_phys, fbdev->fb_len =
/ 1024);
>  =20
>   	/* load the panel info into the var struct */
> -	au1100fb_var.bits_per_pixel =3D fbdev->panel->bpp;
> -	au1100fb_var.xres =3D fbdev->panel->xres;
> -	au1100fb_var.xres_virtual =3D au1100fb_var.xres;
> -	au1100fb_var.yres =3D fbdev->panel->yres;
> -	au1100fb_var.yres_virtual =3D au1100fb_var.yres;
> +	fbdev->info.var =3D (struct fb_var_screeninfo) {
> +		.activate =3D FB_ACTIVATE_NOW,
> +		.height =3D -1,
> +		.width =3D -1,
> +		.vmode =3D FB_VMODE_NONINTERLACED,
> +		.bits_per_pixel =3D fbdev->panel->bpp,
> +		.xres =3D fbdev->panel->xres,
> +		.xres_virtual =3D fbdev->panel->xres,
> +		.yres =3D fbdev->panel->yres,
> +		.yres_virtual =3D fbdev->panel->yres,
> +	};
>  =20
>   	fbdev->info.screen_base =3D fbdev->fb_mem;
>   	fbdev->info.fbops =3D &au1100fb_ops;
> -	fbdev->info.fix =3D au1100fb_fix;
>  =20
>   	fbdev->info.pseudo_palette =3D
>   		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
> @@ -497,8 +494,6 @@ static int au1100fb_drv_probe(struct platform_device=
 *dev)
>   		return -EFAULT;
>   	}
>  =20
> -	fbdev->info.var =3D au1100fb_var;
> -
>   	/* Set h/w registers */
>   	au1100fb_setmode(fbdev);
>  =20
> @@ -547,7 +542,7 @@ void au1100fb_drv_remove(struct platform_device *dev=
)
>   #ifdef CONFIG_PM
>   static struct au1100fb_regs fbregs;

^ you missed to delete "fbregs" now.
Your previous series deleted it.


> -int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t stat=
e)
> +static int au1100fb_drv_suspend(struct platform_device *dev, pm_message=
_t state)
>   {
>   	struct au1100fb_device *fbdev =3D platform_get_drvdata(dev);
>  =20
> @@ -559,7 +554,7 @@ int au1100fb_drv_suspend(struct platform_device *dev=
, pm_message_t state)
>  =20
>   	clk_disable(fbdev->lcdclk);
>  =20
> -	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
> +	memcpy(&fbdev->pm_regs, fbdev->regs, sizeof(struct au1100fb_regs));

Although memcpy() was used before, isn't this:
	fbdev->pm_regs =3D *fbdev->regs;
sufficient and better?


>   	return 0;
>   }
> @@ -572,7 +567,7 @@ int au1100fb_drv_resume(struct platform_device *dev)
>   	if (!fbdev)
>   		return 0;
>  =20
> -	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
> +	memcpy(fbdev->regs, &fbdev->pm_regs, sizeof(struct au1100fb_regs));

same here.


>   	ret =3D clk_enable(fbdev->lcdclk);
>   	if (ret)
> diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100=
fb.h
> index 79f4048726f1..dc53d063fcc3 100644
> --- a/drivers/video/fbdev/au1100fb.h
> +++ b/drivers/video/fbdev/au1100fb.h
> @@ -105,6 +105,11 @@ struct au1100fb_device {
>   	size_t       		regs_len;
>   	unsigned int 		regs_phys;
>  =20
> +#ifdef CONFIG_PM
> +	/* stores the register values during suspend */
> +	struct au1100fb_regs 	pm_regs;
> +#endif
> +
>   	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
>   	size_t	      		fb_len;
>   	dma_addr_t    		fb_phys;

