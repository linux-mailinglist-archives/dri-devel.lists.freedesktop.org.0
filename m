Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C75598BE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 13:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453E110EE75;
	Fri, 24 Jun 2022 11:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509D910EE6F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 11:45:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AC89B82843;
 Fri, 24 Jun 2022 11:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627FBC34114;
 Fri, 24 Jun 2022 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656071105;
 bh=/2OHaS3MR1kb2k5L74fvco5RgmKK7foP/ilWbPMO+Es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lGpUqG7MHtWZJ87v8qMZ8ChuH6aRq0Gij61Z4bVzYhrhQQ75WsPx7c69tzhoaYEa/
 aE7zP6Dl4KJISHZSD46fhRnKFzXrLYqEaopQSxpqsXrgsHRUcnpFJ70meLA4RJo6rq
 9ak1wnwEgWOwgHNYSlzSXlnmIkBDzsReYMuNiYRs=
Date: Fri, 24 Jun 2022 13:42:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] usb: gadget: Fix unsigned comparison with less than zero
Message-ID: <YrWjCnNJohij691b@kroah.com>
References: <20220623084347.38207-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623084347.38207-1-jiapeng.chong@linux.alibaba.com>
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
Cc: balbi@kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 neal_liu@aspeedtech.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, joel@jms.id.au,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 04:43:47PM +0800, Jiapeng Chong wrote:
> This was found by coccicheck:
> 
> ./drivers/usb/gadget/udc/aspeed_udc.c:496:8-13: WARNING: Unsigned expression compared with zero: chunk >= 0.

What does this mean?  Where is the error?

Please explain the reason for changes, not just the output of a random
tool that you ran on the code.

> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

What commit does this fix?

thanks,

greg k-h
