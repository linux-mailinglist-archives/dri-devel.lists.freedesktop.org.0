Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E9737FBF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 13:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2DC10E43F;
	Wed, 21 Jun 2023 11:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1573610E43F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 11:02:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87141614D8;
 Wed, 21 Jun 2023 11:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989CAC433C8;
 Wed, 21 Jun 2023 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1687345355;
 bh=fcExuEUUOrIpx8333Er1zNrhXOtKLbyD4hmkXuu6KXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFLSDAJ4qGzeIhNPJi2KLGjeRBliqnHPMztu4pRvmXMn5ITi71kEXejs8dkHfZIv9
 IDCyP9BN4vE7q3RV+vhB/6RB/v70H0Bu8a0XFlOLJpK6aJ336+GvMg90l/EG6FHlil
 f+edUamSZ8kSHSYrSnKs3UQKmfdCJ1wzh/Ll5xjQ=
Date: Wed, 21 Jun 2023 13:02:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences
Message-ID: <2023062107-setting-blast-3dc5@gregkh>
References: <20230621073204.28459-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621073204.28459-1-christian.koenig@amd.com>
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
Cc: stable@vger.kernel.org, juan.hao@nxp.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 09:32:04AM +0200, Christian König wrote:
> Some Android CTS is testing for that.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>  drivers/dma-buf/dma-fence-unwrap.c | 11 +++++++++--
>  drivers/dma-buf/dma-fence.c        |  5 +++--
>  drivers/gpu/drm/drm_syncobj.c      |  2 +-
>  include/linux/dma-fence.h          |  2 +-
>  4 files changed, 14 insertions(+), 6 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
