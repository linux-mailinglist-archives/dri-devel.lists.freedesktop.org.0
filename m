Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734619D3FF7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 17:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F31810E0ED;
	Wed, 20 Nov 2024 16:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="a3LcGEyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1637 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2024 16:24:31 UTC
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEF010E0ED
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=AV7uFaaC4aI28aoKwdlmsUCmZVGlU7oO6K2cV0FF+zU=; b=a3LcGEyYQBiJVlcOXuBAooSEUI
 myv9cdUzqu7udEm5blR9p+8uz7cITWdaiRhLBdxizryl+VzHcjJWa1ipaUwIkYWwlNxE5jSKsj0jf
 +T6UfMRTnFHlRv+LKrEQsEG+/AnIHyRMBwYIfYCW1Y61e9noMYMArpeftU02wtu3RylY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:46480
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1tDn4h-00080k-4M; Wed, 20 Nov 2024 10:57:03 -0500
Date: Wed, 20 Nov 2024 10:57:02 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Message-Id: <20241120105702.3c6ccf6901d2251d067f2f6c@hugovil.com>
In-Reply-To: <20241120150328.4131525-1-chris.brandt@renesas.com>
References: <20241120150328.4131525-1-chris.brandt@renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -2.3 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-3.3 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH] drm: renesas: rz-du: Increase supported resolutions
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

Hi,

On Wed, 20 Nov 2024 10:03:28 -0500
Chris Brandt <chris.brandt@renesas.com> wrote:

> The supported resolutions were misrepresented in earlier versions of
> hardware manuals.
> 
> Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Tested on a custom RZ/G2LC board with two different display panels
of 600x1600 and 440x1920 resolutions in portrait mode.

Tested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index b99217b4e05d..90c6269ccd29 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -311,11 +311,11 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
>  	dev->mode_config.helper_private = &rzg2l_du_mode_config_helper;
>  
>  	/*
> -	 * The RZ DU uses the VSP1 for memory access, and is limited
> -	 * to frame sizes of 1920x1080.
> +	 * The RZ DU was designed to support a frame size of 1920x1200 (landscape)
> +	 * or 1200x1920 (portrait).
>  	 */
>  	dev->mode_config.max_width = 1920;
> -	dev->mode_config.max_height = 1080;
> +	dev->mode_config.max_height = 1920;
>  
>  	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
>  
> -- 
> 2.34.1
> 


-- 
Hugo Villeneuve
