Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62932525FAA
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 12:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1860B10FBAD;
	Fri, 13 May 2022 10:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4533C10FBAC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 10:27:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE871B82D79;
 Fri, 13 May 2022 10:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DFBC34100;
 Fri, 13 May 2022 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1652437621;
 bh=pTA4HXvpS8DuEF4nFjoqNWh0DGB6tDjhLzkQfFBwJMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9O4imyBJIqCEIV66j0/sr7IDdE3NmIgmOiSNxBHVusss9fc0WI91dN5mE9gwwd+a
 i98oyMTXx4H6wi9X1dl6N42uUc/cRAZu1s4rImNUDykrYRwuIHEQsik3VTb/oPtiSM
 pa70tzuwhT0NePaqI+keZqPxfteFyyfad5QZPZtI=
Date: Fri, 13 May 2022 12:26:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH V3] dma-buf: ensure unique directory name for dmabuf stats
Message-ID: <Yn4ycnpSV2dKU0vv@kroah.com>
References: <1652434689-6203-1-git-send-email-quic_charante@quicinc.com>
 <Yn4u0AG8iC33S3jO@kroah.com>
 <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a45f1e1-39d5-76b3-8fd3-c1f8b288afac@quicinc.com>
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, hridya@google.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 13, 2022 at 03:48:23PM +0530, Charan Teja Kalla wrote:
> 
> On 5/13/2022 3:41 PM, Greg KH wrote:
> >> Reported-by: kernel test robot <lkp@intel.com>
> > The trest robot did not say that the dmabuf stat name was being
> > duplicated, did it?
> >
> 
> It reported a printk warning on V2[1]. Should we remove this on V3?

Yes, that's different.

> @Christian: Could you please drop this tag while merging?
> 
> [1] https://lore.kernel.org/all/202205110511.E0d8TXXC-lkp@intel.com/

Never ask a maintainer to hand-edit a patch, it increases their workload
:(

thanks,

greg k-h
