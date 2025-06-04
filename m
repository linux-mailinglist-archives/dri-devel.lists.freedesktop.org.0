Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE61ACDF56
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 15:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA9410E704;
	Wed,  4 Jun 2025 13:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="OanJit2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA8410E6EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=wyZv9KmZ8ZdATx+EOquAs3+NIy2myEHEKYHxNZgEXhI=; b=OanJit2JpnZYvfrkIw51bNItJV
 7cw8Mb8Z94Qn8g9NtLL0E5nZlu8D9ZxOeDRnyumv+qINF7C/XA0lqjhAxGFgr4dv1elr2agTHGH8y
 YJlxCVjW+Nj9VlFy4FUax5Wxkt+P2HK013M04fDSQB6LvJlIy/TgVb11sU0uZwMztGdQ=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:38330
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uMoJM-0002D8-4F; Wed, 04 Jun 2025 09:37:44 -0400
Date: Wed, 4 Jun 2025 09:37:43 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Message-Id: <20250604093743.b416894b67fcc49b3c4ef9b3@hugovil.com>
In-Reply-To: <OS3PR01MB83195CC101339CA1ECDCD6C78A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
 <20250522143911.138077-3-hugo@hugovil.com>
 <OS3PR01MB831999C4A5A32FE11CC04A078A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <OS3PR01MB83195CC101339CA1ECDCD6C78A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * 0.1 URIBL_CSS_A Contains URL's A record listed in the
 Spamhaus CSS *      blocklist *      [URIs: hugovil.com]
 *  0.1 URIBL_CSS Contains an URL's NS IP listed in the Spamhaus CSS
 *      blocklist *      [URIs: hugovil.com]
 * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -3.2 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 URIBL_CSS,URIBL_CSS_A autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return
 packet size
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

On Wed, 4 Jun 2025 12:08:49 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

Hi Chris,

> Hi Hugo,
> 
> Sorry, one more thing....
> 
> > +	/*
> > +	 * The default value of 1 will result in long read commands payload
> > +	 * not being saved to memory. Set to the DMA buffer size.
> > +	 */
> 
> The comment is a bit wordy.
> 
> You just need to say:
> 
> /* Set read buffer size */

Like I said, this is related to something that is not obvious, so that
is why I put a lenghty description.

> Or...no comment at all. It's pretty obvious what the code is doing because you are writing
> RZG2L_DCS_BUF_SIZE to a register.

Agreed, I will remove the part that says "Set to the DMA buffer size".

Hugo.


> -----Original Message-----
> From: Chris Brandt 
> Sent: Wednesday, June 4, 2025 7:54 AM
> To: Hugo Villeneuve <hugo@hugovil.com>; Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Subject: RE: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet size
> 
> Hi Hugo,
> 
> I'm fine with the code, but maybe it should go in a different location.
> 
> Since it's a register setup, it should probably go in rzg2l_mipi_dsi_startup() with the others.
> 
> Additionally, since it is required to make rzg2l_mipi_dsi_host_transfer() operate properly, my suggestion is to add this to your previous patch instead of making it separate.
> Otherwise, it's like you are submitting one patch with a known bug, then immediately fixing it with a second patch.
> 
> This also would prevent the merge conflict with my patch that also modifies rzg2l_mipi_dsi_atomic_enable().
> 
> Chris
> 
> 
> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: Thursday, May 22, 2025 10:39 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll.ch
> Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org; hugo@hugovil.com; Hugo Villeneuve <hvilleneuve@dimonoff.com>; Chris Brandt <Chris.Brandt@renesas.com>
> Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet size
> 
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> The default value of 1 will result in long read commands payload not being saved to memory.
> 
> Fix by setting this value to the DMA buffer size.
> 
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index a048d473db00b..745aae63af9d8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  	const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
> +	u32 value;
>  	int ret;
>  
>  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder); @@ -561,6 +562,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
>  
> +	/*
> +	 * The default value of 1 will result in long read commands payload
> +	 * not being saved to memory. Set to the DMA buffer size.
> +	 */
> +	value = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
> +	value &= ~DSISETR_MRPSZ;
> +	value |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
> +	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
> +
>  	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
>  		goto err_stop;
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> index 0e432b04188d0..26d8a37ee6351 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -81,6 +81,10 @@
>  #define RSTSR_SWRSTLP			(1 << 1)
>  #define RSTSR_SWRSTHS			(1 << 0)
>  
> +/* DSI Set Register */
> +#define DSISETR				0x120
> +#define DSISETR_MRPSZ			GENMASK(15, 0)
> +
>  /* Rx Result Save Slot 0 Register */
>  #define RXRSS0R				0x240
>  #define RXRSS0R_RXPKTDFAIL		BIT(28)
> --
> 2.39.5
> 
> 


-- 
Hugo Villeneuve
