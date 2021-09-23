Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80041667A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 22:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96206E0EC;
	Thu, 23 Sep 2021 20:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCEE6E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 20:17:57 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4f8300f4-1cab-11ec-9416-0050568cd888;
 Thu, 23 Sep 2021 20:17:44 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 90215194B38;
 Thu, 23 Sep 2021 22:17:46 +0200 (CEST)
Date: Thu, 23 Sep 2021 22:17:51 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Cc: paul@crapouillou.net, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] DRM/Panel : abt-y030xx067a yellow tint fix
Message-ID: <YUzg7wv8NQGf3Qq0@ravnborg.org>
References: <20210914092716.2370039-1-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914092716.2370039-1-cbranchereau@gmail.com>
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

Hi Christophe, Paul,
On Tue, Sep 14, 2021 at 11:27:16AM +0200, Christophe Branchereau wrote:
> The previous parameters caused an unbalanced yellow tint.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>

with the subject fixed the patch is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Paul - I assume you will apply this as you wrote on irc.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-abt-y030xx067a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> index 2d8794d495d0..3d8a9ab47cae 100644
> --- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> +++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
> @@ -146,8 +146,8 @@ static const struct reg_sequence y030xx067a_init_sequence[] = {
>  	{ 0x09, REG09_SUB_BRIGHT_R(0x20) },
>  	{ 0x0a, REG0A_SUB_BRIGHT_B(0x20) },
>  	{ 0x0b, REG0B_HD_FREERUN | REG0B_VD_FREERUN },
> -	{ 0x0c, REG0C_CONTRAST_R(0x10) },
> -	{ 0x0d, REG0D_CONTRAST_G(0x10) },
> +	{ 0x0c, REG0C_CONTRAST_R(0x00) },
> +	{ 0x0d, REG0D_CONTRAST_G(0x00) },
>  	{ 0x0e, REG0E_CONTRAST_B(0x10) },
>  	{ 0x0f, 0 },
>  	{ 0x10, REG10_BRIGHT(0x7f) },
> -- 
> 2.33.0
