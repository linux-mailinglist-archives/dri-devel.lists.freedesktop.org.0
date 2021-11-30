Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE7462D66
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 08:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBD96F564;
	Tue, 30 Nov 2021 07:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 07:17:13 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48A6F54E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:17:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3C2CBCE1812;
 Tue, 30 Nov 2021 07:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59016C53FC1;
 Tue, 30 Nov 2021 07:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638256106;
 bh=1h2Zuf/FZO+mRNlQJshC6wa2kUBqZ+jCdNBHoqA85ds=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/4fE1ECbqXJ8nI4PtksBZnLTjKtlAodmV+hnD83Uwc4AYfPkLLXWBjD05sD1grOH
 fBRexLAKfoGE6jesfWcEMQiuL7mDf+v57PD+w96F5mGjsfjMMI8qMl//AfP2pEDC1j
 DDkgBLP9tyM7ZCm6m+M30I2wV4PCVUcT55WjaUh0=
Date: Tue, 30 Nov 2021 08:08:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: davidcomponentone@gmail.com
Subject: Re: [PATCH] fbdev: replace snprintf in show functions with sysfs_emit
Message-ID: <YaXN5apTUfylG2Mp@kroah.com>
References: <0cb7ca73d9cd7162988a22a24cd18bbcd3d8bb27.1638156341.git.yang.guang5@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cb7ca73d9cd7162988a22a24cd18bbcd3d8bb27.1638156341.git.yang.guang5@zte.com.cn>
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
Cc: linux-fbdev@vger.kernel.org, ducheng2@gmail.com,
 penguin-kernel@i-love.sakura.ne.jp, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yang.guang5@zte.com.cn, cssk@net-c.es, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 08:05:08AM +0800, davidcomponentone@gmail.com wrote:
> From: Yang Guang <yang.guang5@zte.com.cn>
> 
> coccinelle report:
> ./drivers/video/fbdev/core/fbcon.c:2680:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/video/fbdev/core/fbcon.c:2655:8-16:
> WARNING: use scnprintf or sprintf
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>

As said before, your email does not match these lines, nor was this
reported by this bot, but by the existing tools in the kernel tree.

thanks,

greg k-h
