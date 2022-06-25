Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0012755A799
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 08:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AA3112E8F;
	Sat, 25 Jun 2022 06:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6275B112E97
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Bx/qs0NbtThx6IT3iLp2kkGrJRu7KCQ5k9Hn0oNQZ/Y=;
 b=YXeA4/j/3XZ6S4r9jC5aAj7pbyJuP8CSCkgxovdEDc9TDbFOBqWTCpUzmxCizP1RRHWjpz3GvYFC0
 hFdD/S09JeBHQ9tL0wTUit/3Y4Z2sGHK1sr+Hl8XdP7SXWs83Ta+6Cx11/iFfIi42bfnmGXU+2CbC1
 /UPsf+E84+YjpznwhT4qeP0Ralx8P6xqn8MxNtVQNMQ8xHx9HD38mge/8Bvzcc5cYpULs8ETlCEe8r
 11K6RYqOOe33z0Onsx+KxP4m+codiP04GROJqk8HVNEAYjxFH+j3qoBpYWvMrBjWnL3Ak1DvqonbsN
 Ko3maXSkF0vWleqorPmFCTj61RQGqBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Bx/qs0NbtThx6IT3iLp2kkGrJRu7KCQ5k9Hn0oNQZ/Y=;
 b=sm9/YFgqpRRLFStvT4UcvJJFdASyug4bGMos2doS24I6gpAlhLsUlH4WHlTa4vi+46oplDeC1Dn78
 p9yiNEjBw==
X-HalOne-Cookie: 99c87bbbc0a59b656e79a037534ce5e53b4b6972
X-HalOne-ID: 52838c54-f454-11ec-be7c-d0431ea8bb03
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 52838c54-f454-11ec-be7c-d0431ea8bb03;
 Sat, 25 Jun 2022 06:59:14 +0000 (UTC)
Date: Sat, 25 Jun 2022 08:59:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH 08/28] drm/via: Add via_cursor.c
Message-ID: <YrayQFtUUdxGg1Lf@ravnborg.org>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
 <20220624202633.3978-9-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624202633.3978-9-kevinbrace@gmx.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

a few nitpicks in the following.

	Sam

On Fri, Jun 24, 2022 at 03:26:13PM -0500, Kevin Brace wrote:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> 
> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
> ---
>  drivers/gpu/drm/via/via_cursor.c | 419 +++++++++++++++++++++++++++++++
>  1 file changed, 419 insertions(+)
>  create mode 100644 drivers/gpu/drm/via/via_cursor.c

> 
> +	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
The use of the DRM_* for logging is deprecated these days.
The recommended variants are names drm_dbg_* and friends.
They require a drm_device, and in lack of this use dev_dbg or fallback
to pr_*

This applies for all the driver, not only this file.

> +
> +const struct drm_plane_funcs via_cursor_drm_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	.reset = drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +};
> +
> +const uint32_t via_cursor_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +const unsigned int via_cursor_formats_size =
> +				ARRAY_SIZE(via_cursor_formats);

The three variables above does not reference anything in this file
and can be moved to the file with the single user.

	Sam
