Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A6175BA1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 14:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF696E3FC;
	Mon,  2 Mar 2020 13:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5806E3FC;
 Mon,  2 Mar 2020 13:30:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D48369D0;
 Mon,  2 Mar 2020 14:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583155808;
 bh=Hee84/PJ0AtWXMwrmwqUhd2qA2lSdrxd4YMOHjSNEKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bd+UjYU0bnGYaqqN4TAT9H5ecLYTV1+o587vEcOGaBstZBzDAFnaUOjCT5mtct5mJ
 B1B/UWSaW0G1YbPiCP/xuOkaYpffo9n9he4OpEePdRzu+XSVay/UKv1AOOf9S1JUiH
 Zf/z6SLvVPsm2e/EvGSJCL0ILxVHo7lnyluDFZU4=
Date: Mon, 2 Mar 2020 15:29:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH 9/9] drm/todo: Update drm_fb_helper tasks
Message-ID: <20200302132942.GP11960@pendragon.ideasonboard.com>
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-10-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302125649.61443-10-pankaj.laxminarayan.bharadiya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pankaj,

Thank you for the patch.

On Mon, Mar 02, 2020 at 06:26:49PM +0530, Pankaj Bharadiya wrote:
> Remove completed drm_fb_helper tasks from todo list.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  Documentation/gpu/todo.rst | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index ccf5e8e34222..98d8782e1440 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -362,17 +362,10 @@ Level: Starter
>  drm_fb_helper tasks
>  -------------------
>  
> -- drm_fb_helper_restore_fbdev_mode_unlocked() should call restore_fbdev_mode()
> -  not the _force variant so it can bail out if there is a master. But first
> -  these igt tests need to be fixed: kms_fbcon_fbt@psr and
> -  kms_fbcon_fbt@psr-suspend.
> -
> -- The max connector argument for drm_fb_helper_init() isn't used anymore and
> -  can be removed.
> -
> -- The helper doesn't keep an array of connectors anymore so these can be
> -  removed: drm_fb_helper_single_add_all_connectors(),
> -  drm_fb_helper_add_one_connector() and drm_fb_helper_remove_one_connector().
> +drm_fb_helper_restore_fbdev_mode_unlocked() should call restore_fbdev_mode()
> +not the _force variant so it can bail out if there is a master. But first
> +these igt tests need to be fixed: kms_fbcon_fbt@psr and
> +kms_fbcon_fbt@psr-suspend.

No need to reflow, you can keep the first list entry as-is and just
remove the next two. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  Level: Intermediate
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
