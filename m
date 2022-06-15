Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C754C688
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 12:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C505510E0CF;
	Wed, 15 Jun 2022 10:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D373710E0CF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:53:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83A83615B0;
 Wed, 15 Jun 2022 10:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCEC34115;
 Wed, 15 Jun 2022 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655290418;
 bh=xorApPrJYjqRVSP/59nC6A1gHUam/lVIdxd8tViYqNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLzcAJdjue7U4UAgQgf9+RKr6LPQLQ1VcUI/upqTv1jd4xn6ffwn+7ka1a4EDGE8U
 zqx74/OmAxwHanaqgwTA7wUZlgugxFfwkQhE/i3XRtI35ar4o26wDmuNDE1Dgh11mi
 /epAMQstrnhJN4qD2PnkwxCSW90WgW64Lkp7vHmk=
Date: Wed, 15 Jun 2022 12:53:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: heliang <windhl@126.com>
Subject: Re: [PATCH] drivers: tty: serial: Add missing of_node_put() in
 serial-tegra.c
Message-ID: <Yqm6LvDGqaRMaUHa@kroah.com>
References: <20220615104833.3963552-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615104833.3963552-1-windhl@126.com>
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
Cc: linux-serial@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linaro-mm-sig@lists.linaro.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 linux-tegra@vger.kernel.org, jirislaby@kernel.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> In tegra_uart_init(), of_find_matching_node() will return a node
> pointer with refcount incremented. We should use of_node_put()
> when it is not used anymore.
> 
> Signed-off-by: heliang <windhl@126.com>

We need a real name please, one you sign documents with.

thanks,

greg k-h
