Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F532BFA0F2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 07:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEBD10E6A4;
	Wed, 22 Oct 2025 05:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="0whBcrZ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2529 seconds by postgrey-1.36 at gabe;
 Wed, 22 Oct 2025 05:31:38 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360A10E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=NqxLNd5MR69Qe5OPTM37Hs5rer8QqOfe+5MBPsglPtQ=; t=1761111098;
 x=1761543098; b=0whBcrZ28yr/lLEnvU9mwdmuOiD7X32kJtKCCmKaqeesg4wBq+kQWc0+EJ4gQ
 lv9qVa1Mu4qSkVgVu2B/F5qG4RJAl4+B0D7O5hmKhg5x560K8vuZCZaPkfctFXUHv/LVXB/I2o5zC
 dVteljq90NkB0ZqvO3+z9j3lompC6BiIaZKcc4b0lujIts3/yZNlKRAur4uFtu+EY046CXYSP5lX4
 GdpuRBmgmoDYu5e7HVT/Hcw7FMkZechVJECKWXX2AsLJBD26ZMpsDPDORSsJgx+uQ5mWBlCOLPTeH
 xa3hw/W+XQAWsz1A2PULvMvn0MvFfTqZLqAxsF8zAqsenWMcqw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
 id 1vBQmo-00Bs0X-2r; Wed, 22 Oct 2025 06:49:22 +0200
Message-ID: <499eb508-5f24-4ef4-a2a3-f3d76d89db66@leemhuis.info>
Date: Wed, 22 Oct 2025 06:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.17 040/159] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Bowler <nbowler@draconx.ca>, Douglas Anderson <dianders@chromium.org>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20251021195043.182511864@linuxfoundation.org>
 <20251021195044.163217433@linuxfoundation.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20251021195044.163217433@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1761111098;
 2c62d67f; 
X-HE-SMSGID: 1vBQmo-00Bs0X-2r
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

On 10/21/25 21:50, Greg Kroah-Hartman wrote:
> 6.17-stable review patch.  If anyone has any objections, please let me know.
> 
> ------------------
> 
> From: Thomas Zimmermann <tzimmermann@suse.de>
> 
> commit 6f719373b943a955fee6fc2012aed207b65e2854 upstream.
> 
> Blank the display by disabling sync pulses with VGACR17<7>. Unblank
> by reenabling them. This VGA setting should be supported by all Aspeed
> hardware.

TWIMC, a regression report about 6.18-rc2 that was bisected to this
commit just came in:

https://lore.kernel.org/all/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/

To quote:

"""
I have encountered a serious (for me) regression with 6.18-rc2 on my
2-socket Ivy Bridge Xeon E5-2697 v2 server. After
booting, my console screen goes blank and stays blank. 6.18-rc1 was
still fine.

[...]

When I revert this from 6.18-rc2, the issue goes away and my console
screen works again.
"""

Ciao, Thorsten
> Ast currently blanks via sync-off bits in VGACRB6. Not all BMCs handle
> VGACRB6 correctly. After disabling sync during a reboot, some BMCs do
> not reenable it after the soft reset. The display output remains dark.
> When the display is off during boot, some BMCs set the sync-off bits in
> VGACRB6, so the display remains dark. Observed with  Blackbird AST2500
> BMCs. Clearing the sync-off bits unconditionally fixes these issues.
> 
> Also do not modify VGASR1's SD bit for blanking, as it only disables GPU
> access to video memory.
> 
> v2:
> - init vgacrb6 correctly (Jocelyn)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: ce3d99c83495 ("drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers")
> Tested-by: Nick Bowler <nbowler@draconx.ca>
> Reported-by: Nick Bowler <nbowler@draconx.ca>
> Closes: https://lore.kernel.org/dri-devel/wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi/
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.7+
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> Link: https://lore.kernel.org/r/20251014084743.18242-1-tzimmermann@suse.de
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/ast/ast_mode.c |   18 ++++++++++--------
>  drivers/gpu/drm/ast/ast_reg.h  |    1 +
>  2 files changed, 11 insertions(+), 8 deletions(-)
> 
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -836,22 +836,24 @@ ast_crtc_helper_atomic_flush(struct drm_
>  static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  {
>  	struct ast_device *ast = to_ast_device(crtc->dev);
> +	u8 vgacr17 = 0x00;
> +	u8 vgacrb6 = 0xff;
>  
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
> +	vgacr17 |= AST_IO_VGACR17_SYNC_ENABLE;
> +	vgacrb6 &= ~(AST_IO_VGACRB6_VSYNC_OFF | AST_IO_VGACRB6_HSYNC_OFF);
> +
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
>  }
>  
>  static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  {
>  	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>  	struct ast_device *ast = to_ast_device(crtc->dev);
> -	u8 vgacrb6;
> +	u8 vgacr17 = 0xff;
>  
> -	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
> -
> -	vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
> -		  AST_IO_VGACRB6_HSYNC_OFF;
> -	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
> +	vgacr17 &= ~AST_IO_VGACR17_SYNC_ENABLE;
> +	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
>  
>  	/*
>  	 * HW cursors require the underlying primary plane and CRTC to
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -29,6 +29,7 @@
>  #define AST_IO_VGAGRI			(0x4E)
>  
>  #define AST_IO_VGACRI			(0x54)
> +#define AST_IO_VGACR17_SYNC_ENABLE	BIT(7) /* called "Hardware reset" in docs */
>  #define AST_IO_VGACR80_PASSWORD		(0xa8)
>  #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
>  #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
> 
> 
> 

