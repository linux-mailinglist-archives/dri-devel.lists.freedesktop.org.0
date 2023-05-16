Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64083704DB1
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 14:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2A10E08D;
	Tue, 16 May 2023 12:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B21610E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684239900; x=1715775900;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1kZ67IohKTNXw9v48L99Ve76ncobxnQ7nLLOn/LyTKQ=;
 b=CQ0pf7sBBpMDxwTGswcK97QHjQQciWM7qaaMC5DeW6Tch3hQ3oJs73ob
 /P0rWuHURXqtPxyHNYQNbBl+0hhYWLBmzvPEb5Qx86Vtptv5u5Gv44CNC
 zyxntsILDhHpIXGB9fKMeXR2IDVdbjyNG3J46Rj0UgJyLRXo0gY6yIJVg
 OtOmSks9YZek6eAo24svKxBcrPRzr7aUFmdGvf89e3aqpyX6Rh1zUy0sx
 ysBz64rN6jw1fUzA7EOG610weakAjzUPNb1L0F3s+8SCPOwaeUFmu3jl5
 kqHCcy4kzAVk8Stnp0uhp/lPWCC1cPZEU8gRfE+ewbUZZr29/eEetccO5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="414868730"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="414868730"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 05:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="771018670"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="771018670"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga004.fm.intel.com with SMTP; 16 May 2023 05:24:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 16 May 2023 15:24:52 +0300
Date: Tue, 16 May 2023 15:24:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH v4 37/41] fbdev: atyfb: Remove unused clock determination
Message-ID: <ZGN2FKSBkMREujgR@intel.com>
References: <20230516110038.2413224-1-schnelle@linux.ibm.com>
 <20230516110038.2413224-38-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230516110038.2413224-38-schnelle@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 01:00:33PM +0200, Niklas Schnelle wrote:
> Just below the removed lines par->clk_wr_offset is hard coded to 3 so
> there is no use in determining a different clock just to then ignore it
> anyway. This also removes the only I/O port use remaining in the driver
> allowing it to be built without CONFIG_HAS_IOPORT.
> 
> Link: https://lore.kernel.org/all/ZBx5aLo5h546BzBt@intel.com/
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
> Note: The HAS_IOPORT Kconfig option was added in v6.4-rc1 so
>       per-subsystem patches may be applied independently
> 
>  drivers/video/fbdev/aty/atyfb_base.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
> index b02e4e645035..cba2b113b28b 100644
> --- a/drivers/video/fbdev/aty/atyfb_base.c
> +++ b/drivers/video/fbdev/aty/atyfb_base.c
> @@ -3498,11 +3498,6 @@ static int atyfb_setup_generic(struct pci_dev *pdev, struct fb_info *info,
>  	if (ret)
>  		goto atyfb_setup_generic_fail;
>  #endif
> -	if (!(aty_ld_le32(CRTC_GEN_CNTL, par) & CRTC_EXT_DISP_EN))
> -		par->clk_wr_offset = (inb(R_GENMO) & 0x0CU) >> 2;
> -	else
> -		par->clk_wr_offset = aty_ld_8(CLOCK_CNTL, par) & 0x03U;
> -
>  	/* according to ATI, we should use clock 3 for acelerated mode */
>  	par->clk_wr_offset = 3;
>  
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
