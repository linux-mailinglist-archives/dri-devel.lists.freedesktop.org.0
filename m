Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF93F85EC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 12:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB236E5D4;
	Thu, 26 Aug 2021 10:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B53E6E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 10:56:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B376960FC1;
 Thu, 26 Aug 2021 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1629975391;
 bh=QwwuKLC/H2ON9lhWkQA52Z5MbQH0ekQVSIV4EvIGbYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvofJWeFySmDgyaRk5PeNjdIQT5EZf0jFmafFvmRwawYxxpWvhT4xjf5BRmKbPbbP
 UHHMiQAvaSuxeg+aQ7+ded/l4K27hAXt423DF1/7FRYKhWOGewizpDJD9p+SA9wpVc
 AzI8+6r4SFMDguXrgpIdxrLel1y8EqiU81qbJcyE=
Date: Thu, 26 Aug 2021 12:56:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] MAINTAINERS: Add dri-devel for component.[hc]
Message-ID: <YSdzWthRL+C9/LMN@kroah.com>
References: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
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

On Thu, Aug 26, 2021 at 11:13:43AM +0200, Daniel Vetter wrote:
> dri-devel is the main user, and somehow there's been the assumption
> that component stuff is unmaintained.
> 
> References: https://lore.kernel.org/dri-devel/CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com/
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac58d0032abd..7cdc19815ec4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5707,6 +5707,11 @@ F:	Documentation/admin-guide/blockdev/
>  F:	drivers/block/drbd/
>  F:	lib/lru_cache.c
>  
> +DRIVER COMPONENT FRAMEWORK
> +L:	dri-devel@lists.freedesktop.org
> +F:	drivers/base/component.c
> +F:	include/linux/component.h

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
